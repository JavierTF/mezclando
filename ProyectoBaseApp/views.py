import random
import subprocess
import uuid
from datetime import date

from django.contrib import messages
from django.contrib.admin.models import LogEntry
from django.contrib.auth import authenticate, login, update_session_auth_hash
from django.contrib.auth.decorators import permission_required, user_passes_test
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.forms import PasswordResetForm, PasswordChangeForm, AdminPasswordChangeForm
from django.contrib.auth.models import User, Group, Permission
from django.contrib.auth.tokens import default_token_generator
from django.contrib.auth.views import logout_then_login, PasswordContextMixin
from django.contrib.sites.shortcuts import get_current_site
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.utils.encoding import force_bytes, force_str
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.views.decorators.csrf import csrf_protect
from django.views.generic import FormView
from notifications import models as models_notify
from notifications.signals import notify
from django.shortcuts import redirect
from ProyectoBaseApp import models, forms

from ProyectoBaseApp.utils import register_logs, list_address_db, save_address_dbs
from django.utils.translation import gettext_lazy as _
from ProyectoBaseApp.token import account_activation_token
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from SISGDDO.views_sisgddo import handle_exceptions, is_superuser

@handle_exceptions
def just_login(request):
    response = HttpResponseRedirect('/accounts/login/')
    response.delete_cookie('user')
    response.delete_cookie('user_photo')
    return response

@handle_exceptions
def validar(request):
    print('RRR', request.user.username)
    print('RRR', request.user.password)
    # user = request.POST['username']
    # passw = request.POST['password']

    # access = authenticate(username=user, password=passw)
    response = {}
    response['object'] = request.user
    return JsonResponse(response)

@handle_exceptions
def loguear(request):
    # dir_ip = request.META['REMOTE_ADDR']
    # dir_ip = request.META['HTTP_X_FORWARDED_FOR']
    mensage = ''
    if 'next' in request.GET:
        redireccion_url= request.GET['next']
    else:
        redireccion_url= '/'

    if request.method == 'POST':
        user = request.POST['username']
        passw = request.POST['password']

        access = authenticate(username=user, password=passw)
        if access is not None:
            if access.is_active:
                login(request, access)
                try:
                    userApp = models.UserApp.objects.get(pk=request.user.pk)
                except ObjectDoesNotExist:
                    userApp = None
                register_logs(request, User, "", "", 4)
                messages.success(request, "Usted se ha autenticado con éxito")
                if 'redireccion_url' in request.POST:
                    redireccion_url= request.POST['redireccion_url']
                else:
                    redireccion_url= '/'
                response = HttpResponseRedirect(redireccion_url)
                response.set_cookie("user", request.user.username)

                if userApp:
                    if hasattr(userApp, "image"):
                        print('\n', userApp.image, '\n')
                        response.set_cookie("user_photo", userApp.image)
                else:
                    response.set_cookie("user_photo", "static/users/userDefault1.png")
                return response
            else:
                messages.error(request, "Usuario inactivo")
        else:
            if passw == "" or user == "":
                messages.error(request, "El usuario o la contraseña están vacíos")
            else:
                messages.error(request, "Nombre de usuario y/o contraseña inválidos")

    if request.COOKIES.get("user"):
        username = request.COOKIES.get("user")
        userPhoto = request.COOKIES.get("user_photo")
        return render(request, "Authentication/lockpages.html", {"username": username, "user_photo": userPhoto, "redireccion_url": redireccion_url})
        
    return render(request, 'Authentication/login.html',{"redireccion_url": redireccion_url})


# def register_by_url(request, token):
#     try:
#         uuid.UUID(token)
#     except:
#         response = HttpResponseRedirect('/register/')
#         response.delete_cookie("refer_user")
#         return response
#     else:
#         user = models.UserApp.objects.filter(uui=token)
#         if user.count() > 0:
#             response = HttpResponseRedirect('/register/')
#             response.set_cookie("refer_user", token)
#             return response
#     response = HttpResponseRedirect('/register/')
#     response.delete_cookie("refer_user")
#     return response


# def register_front(request):
#     if request.method == 'POST':
#         form = SignUpForm(request.POST)
#         if form.is_valid():
#             user = form.save(commit=False)
#             user.is_active = False
#             user.groups.set(Group.objects.filter(name="Usuario"))
            # user.save()
            # if request.COOKIES.get("refer_user"):
            #     user.referUser = request.COOKIES.get("refer_user")
            #     user.save()
            # notify.send(user, recipient=user, verb=_('Bienvenido a Proyecto!!'), level='success')
            # notify.send(user, recipient=User.objects.filter(groups__name="Administrador"),
            #             verb='Nuevo registro de usuario', level='warning')
            # current_site = get_current_site(request)
            # subject = _('Activa tu cuenta')
            # message = render_to_string('registration/email_message_activated.html', {
            #     'user': user,
            #     'domain': current_site.domain,
            #     'uid': urlsafe_base64_encode(force_bytes(user.pk)),
            #     'token': account_activation_token.make_token(user),
            # })
            # user.email_user(subject, message, from_email="Proyecto <lolo@gmail.com>")
            # return redirect('account_activation_sent')
        # else:
        #     messages.error(request, "Error en el formulario")
    # else:
    #     form = SignUpForm()
    # return render(request, 'registration/register.html', {'form': form})

@login_required()
@handle_exceptions
def count_activated(request):
    return render(request, 'registration/good_message_activated.html')


@user_passes_test(is_superuser)
@handle_exceptions
def activate(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user)
        messages.success(request, _("Usuario activado correctamente"))
        return redirect('inicio')
    else:
        return render(request, 'registration/error_message_activated.html')

@handle_exceptions
def logout(request):
    register_logs(request, User, "", "", 5)
    return logout_then_login(request, 'ce_login')

@login_required()
@handle_exceptions
def notificacion_read(request, action):
    if request.GET:
        id = request.GET['id']
        notification = models_notify.Notification.objects.get(pk=id)
        notification.unread = False
        notification.save()
        if action == 1:
            notifications = models_notify.Notification.objects.filter(recipient_id=request.user.id).filter(
                unread=True).exclude(description="comments").all()
            return render(request, 'Ajax/notifications.html', {"notifications": notifications})
        if action == 2:
            notifications = models_notify.Notification.objects.filter(recipient_id=request.user.id).filter(
                unread=True).filter(description="comments")
            return render(request, 'Ajax/notifications.html', {"notifications": notifications, "one": "1"})

@login_required()
@handle_exceptions
def notification_offer_all_mark_read(request):
    noti = models_notify.Notification.objects.exclude(description=None).filter(recipient_id=request.user.id)
    if noti.count() > 0:
        for n in noti:
            n.unread = False
            n.save()
    return render(request, 'Ajax/notifications.html')

@login_required()
@handle_exceptions
def notification_all_mark_read(request):
    noti = models_notify.Notification.objects.filter(description=None, recipient_id=request.user.id)
    if noti.count() > 0:
        for n in noti:
            n.unread = False
            n.save()
    return render(request, 'Ajax/notifications.html')

class PasswordResetView(PasswordContextMixin, FormView):
    email_template_name = 'registration/password_reset_email.html'
    extra_email_context = None
    form_class = PasswordResetForm
    from_email = "Proyecto <hola@gmail.com>"
    html_email_template_name = None
    subject_template_name = 'registration/password_reset_subject.txt'
    success_url = reverse_lazy('password_reset_done')
    template_name = 'registration/password_reset_form.html'
    title = _('Resetear Contraseña')
    token_generator = default_token_generator

    @method_decorator(csrf_protect)
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)

    def form_valid(self, form):
        opts = {
            'use_https': self.request.is_secure(),
            'token_generator': self.token_generator,
            'from_email': self.from_email,
            'email_template_name': self.email_template_name,
            'subject_template_name': self.subject_template_name,
            'request': self.request,
            'html_email_template_name': self.html_email_template_name,
            'extra_email_context': self.extra_email_context,
        }
        form.save(**opts)
        return super().form_valid(form)

@login_required()
@permission_required('auth.view_group')
@handle_exceptions
def group_list(request):
    groups = Group.objects.all()
    return render(request, 'Security/groups.html', {'group_list': groups})

def error404(request, exception = None):
    return render(request, "Security/error.html", { 'error_code': 404, })

def error500(request):
    return render(request, "Security/error.html", { 'error_code': 500, })

def error403(request, exception = None):
    return render(request, "Security/error.html", { 'error_code': 403, })

@login_required()
@permission_required('auth.view_group')
@handle_exceptions
def detalle_grupo(request, id):
    objeto = Group.objects.get(id = id)

    template_name = 'P01/premio/premio_detail.html'
    contexto = {
        'objeto' : objeto,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)
    return render(request, template_name, contexto)

@permission_required('auth.view_group')
def detalle_grupo(request, id):
    objeto = Group.objects.get(id = id)

    template_name = 'P01/premio/premio_detail.html'
    contexto = {
        'objeto' : objeto,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)
    return render(request, template_name, contexto)


# CRUD Rol
@login_required()
@permission_required('auth.add_group')
@handle_exceptions
def group_create(request):
    if request.POST:
        form = forms.GroupForm(request.POST)
        if form.is_valid():
            form.save()
            gr = Group.objects.all()
            if len(gr) > 0:                 
                id_group = Group.objects.last()
                register_logs(request, Group, id_group.pk, str(id_group), 1)
                messages.success(request, "Rol creado con éxito")
                return HttpResponseRedirect('/administration/grupo/list')
        else:
            messages.error(request, "Error en el formulario")
    else:
        form = forms.GroupForm()
    args = {}
    args['form'] = form
    return render(request, 'auth/group_form.html', args)

@login_required()
@permission_required('auth.view_user')
@handle_exceptions
def user_list(request):
    # users_list = User.objects.filter(is_superuser=False).exclude(pk=request.user.pk).order_by("-date_joined")
    users_list = User.objects.exclude(pk=request.user.pk).order_by("-date_joined")
    users = []
    for user in users_list:
        users.append([user, None])
    return render(request, 'Security/users.html', {'usersList': users})

@login_required()
@permission_required('auth.add_user')
@handle_exceptions
def user_create(request):
    print('USER_CREATE')
    if request.POST:
        form = forms.UserForm(request.POST, request.FILES)
        cant_user = models.UserApp.objects.filter(first_name__iexact=request.POST.get('first_name').strip(),last_name__iexact=request.POST.get('last_name').strip()).count()
        if cant_user > 0:
            messages.error(request, 'El usuario ya existe')
            return render(request, 'auth/user_form.html', {'form': form})
        if form.is_valid():
            username = form['username'].value()
            grupos = form['groups'].value()
            form.save()        
            # UserApp es clase hija de usuario por eso accede a los atributos de usuario    
            usuario = models.UserApp.objects.get(username = username)
            user_filter = models.UserApp.objects.filter(username = username)
            user_filter.update(
                image = form['image'].value() if form['image'].value() else None
            )
            # user_filter.save()
            # adicionando grupo al usuario           
            for g in grupos:
                try:
                    elem = Group.objects.get(pk = g)                    
                    usuario.groups.add(elem)
                    permisos = Permission.objects.filter(group = elem)
                    for p in permisos:
                        fp = Permission.objects.get(codename = p.codename)
                        usuario.user_permissions.add(fp)
                        # usuario.save()
                except:
                    pass
            usuario.save()    
            register_logs(request, User, usuario.pk, str(usuario), 1)
            notify.send(request.user, recipient=usuario, verb='Bienvenido a SISGEPO!!!', level='success')
            messages.success(request, "Usuario creado con éxito")
            return HttpResponseRedirect('/administration/user/list')
        else:
            messages.error(request, "Error en el formulario")
    else:
        form = forms.UserForm()
    args = {}
    args['form'] = form
    return render(request, 'auth/user_form.html', args)

@login_required()
@permission_required('auth.add_user')
def user_activate(request, id):
    valor = request.POST.get('activo')
    user = models.UserApp.objects.get(id = id)
    user.is_active = True if valor == "on" else False
    user.save()        

    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, user, user.id, str(user), valor_log(user))

    return redirect('user_list')

@login_required()
@permission_required('auth.change_user')
@handle_exceptions
def user_activate(request, id):
    valor = request.POST.get('activo')
    user = models.UserApp.objects.get(id = id)
    user.is_active = True if valor == "on" else False
    user.save()        

    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, user, user.id, str(user), valor_log(user))

    return redirect('user_list')

@login_required()
@permission_required('auth.change_user')
@handle_exceptions
def password_update_admin(request, pk):
    user = User.objects.get(pk=pk)
    if request.method == 'POST':
        form = AdminPasswordChangeForm(user=user, data=request.POST)
        if form.is_valid():
            form.save()
            register_logs(request, User, user.pk, user.__str__(), 2)
            notify.send(request.user, recipient=user, verb='Se ha cambiado su contraseña', level='warning')
            update_session_auth_hash(request, form.user)
            messages.success(request, "Contraseña actualizada correctamente")
            return redirect('user_list')
        else:
            messages.error(request, "Error cambiando contraseña, rectifique los datos")
            form = AdminPasswordChangeForm(user=user, data=request.POST)
            return render(request, 'Security/Auth/password_update_admin.html', {'form': form})
    else:
        form = AdminPasswordChangeForm(user=user, data=request.POST)
        return render(request, 'Security/Auth/password_update_admin.html', {'form': form, 'usuario': user})

@login_required()
@permission_required('auth.change_user')
@handle_exceptions
def password_update(request, pk):
    user = User.objects.get(pk=pk)
    if request.method == 'POST':
        form = PasswordChangeForm(user=user, data=request.POST)
        if form.is_valid():
            form.save()
            register_logs(request, User, user.pk, user.__str__(), 2)
            notify.send(request.user, recipient=user, verb='Se ha cambiado su contraseña', level='warning')
            update_session_auth_hash(request, form.user)
            messages.success(request, "Contraseña actualizada correctamente")
            return HttpResponseRedirect('/user/update/' + str(user.pk))
        else:
            messages.error(request, "Error cambiando contraseña, rectifique los datos")
            form = PasswordChangeForm(user=user, data=request.POST)
            return render(request, 'Security/Auth/password_update.html', {'form': form,'usuario': user})
    else:
        form = PasswordChangeForm(user=user, data=request.POST)
        return render(request, 'Security/Auth/password_update.html', {'form': form, 'usuario': user})


@permission_required('auth.view_user')
@handle_exceptions
def history_list_300(request):
    history = LogEntry.objects.order_by('-action_time').all()[:300]
    return render(request, 'Security/Logs/history.html', {'history': history})


@permission_required('auth.view_user')
@handle_exceptions
def history_list(request):
    history = LogEntry.objects.order_by('-action_time').all()
    return render(request, 'Security/Logs/history.html', {'history': history})

#SOLO SE HACE UNA SALVA DIARIA
@login_required
@staff_member_required
@handle_exceptions
@permission_required('auth.add_user')
def db_save(request):
    print('**** LLEGUEEE')
    list = list_address_db()
    if request.POST:
        address = "static/db/" + str(date.today().strftime("%Y%m%d")) + "_SISGEPO.sql"
        try:
            subprocess.Popen("pg_dump -c -h localhost -p 5432 -U postgres --no-password proyectobasedb >" + address,
                             shell=True)
        except:
            messages.error(request, "Error al salvar los datos")
            return render(request, 'Security/salvarestaura.html', {'list_db': list})
        else:
            save_address_dbs(address)
            list = list_address_db()
            messages.success(request, "Éxito al salvar los datos")
            return render(request, 'Security/salvarestaura.html', {'list_db': list})
    return render(request, 'Security/salvarestaura.html', {'list_db': list})

@login_required
@staff_member_required
@handle_exceptions
def db_restore(request, name):
    list = list_address_db()
    print('NAME', name)
    address = "static/db/" + name
    try:
        subprocess.Popen("psql -h localhost -p 5432 -U postgres --no-password proyectobasedb <" + address, shell=True)
    except:
        messages.error(request, "Error al restaurar la base de datos")
        return render(request, 'Security/salvarestaura.html', {'list_db': list})
    else:
        messages.success(request, "Éxito restaurando la base de datos")
        return render(request, 'Security/salvarestaura.html',
                      {'list_db': list})