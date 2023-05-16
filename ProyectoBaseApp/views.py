import random
import subprocess
import uuid
from datetime import date

from django.contrib import messages
from django.contrib.admin.models import LogEntry
from django.contrib.auth import authenticate, login, update_session_auth_hash
from django.contrib.auth.decorators import permission_required
from django.contrib.auth.forms import PasswordResetForm, PasswordChangeForm, AdminPasswordChangeForm
from django.contrib.auth.models import User, Group
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




def just_login(request):
    response = HttpResponseRedirect('/accounts/login/')
    response.delete_cookie('user')
    response.delete_cookie('user_photo')
    return response


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
                register_logs(request, User, "", "", 4)
                messages.success(request, "Usted se ha autenticado con éxito")
                if 'redireccion_url' in request.POST:
                    redireccion_url = request.POST['redireccion_url']
                else:
                    redireccion_url = '/'
                response = HttpResponseRedirect(redireccion_url)
                response.set_cookie("user", request.user.username)

                userApp = models.UserApp.objects.filter(pk=request.user.pk)
                if userApp:
                    userApp.first()
                    if userApp.image:
                        response.set_cookie("user_photo", userApp.image)
                else:
                    response.set_cookie("user_photo", "static/users/userDefault4.png")
                return response
            else:
                messages.error(request, "Usuario inactivo")
        else:
            if passw == "" or user == "":
                messages.error(request, "El usuario o la contraseña estan vacíos")
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
def count_activated(request):
    return render(request, 'registration/good_message_activated.html')

@login_required()
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

def logout(request):
    register_logs(request, User, "", "", 5)
    return logout_then_login(request, 'ce_login')

@login_required()
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
def notification_offer_all_mark_read(request):
    noti = models_notify.Notification.objects.exclude(description=None).filter(recipient_id=request.user.id)
    if noti.count() > 0:
        for n in noti:
            n.unread = False
            n.save()
    return render(request, 'Ajax/notifications.html')

@login_required()
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


@permission_required('auth.add_group')
def group_list(request):
    groups = Group.objects.all()
    return render(request, 'Security/groups.html', {'group_list': groups})


def error404(request,exception):
    return render(request, "Security/404.html")


# CRUD Rol
@permission_required('auth.add_group')
def group_create(request):
    if request.POST:
        form = forms.GroupForm(request.POST)
        if form.is_valid():
            form.save()
            id_group = Group.objects.last()
            register_logs(request, Group, id_group.pk, id_group.__str__(), 1)
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
def user_list(request):
    users_list = User.objects.filter(is_superuser=False).exclude(pk=request.user.pk).order_by("-date_joined")
    users = []
    for user in users_list:
        users.append([user, None])
    return render(request, 'Security/users.html', {'usersList': users})

@login_required()
@permission_required('auth.add_user')
def user_create(request):
    if request.POST:
        form = forms.UserForm(request.POST)
        cant_user = models.UserApp.objects.filter(first_name__iexact=request.POST.get('first_name').strip(),last_name__iexact=request.POST.get('last_name').strip()).count()
        if cant_user > 0:
            messages.error(request, 'El usuario ya existe')
            return render(request, 'auth/user_form.html', {'form': form})
        if form.is_valid():
            form.save()
            id_user = User.objects.last()
            register_logs(request, User, id_user.pk, id_user.__str__(), 1)
            notify.send(request.user, recipient=id_user, verb='Bienvenido a SISGDDO!!', level='success')
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
@permission_required('auth.change_user')
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
def history_list_300(request):
    history = LogEntry.objects.order_by('-action_time').all()[:300]
    return render(request, 'Security/Logs/history.html', {'history': history})


@permission_required('auth.view_user')
def history_list(request):
    history = LogEntry.objects.order_by('-action_time').all()
    return render(request, 'Security/Logs/history.html', {'history': history})

@permission_required('auth.add_user')
def db_save(request):
    list = list_address_db()
    if request.POST:
        address = "static/db/" + str(date.today().strftime("%Y%m%d")) + "_SISGDDO.sql"
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

@permission_required('auth.add_user')
def db_restore(request, name):
    list = list_address_db()
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