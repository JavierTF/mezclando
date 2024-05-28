import subprocess
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

from ProyectoBaseApp.utils import register_logs, list_address_db, save_address_dbs, generate_random_text
from django.utils.translation import gettext_lazy as _
from ProyectoBaseApp.token import account_activation_token
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from xavi.utils import handle_exceptions, is_superuser
from getpass import getpass
import os
import json
from django.http import HttpResponse
from datetime import date, timedelta, datetime
from xavi.models import acuerdo, estado_acuerdo, objetivo, evaluacion
import calendar
from django.db.models import Q
from xavi.utils import show_errors, is_superuser
from Tesis_Citmatel import settings
from django.db import connection
import shlex
from subprocess import PIPE,Popen
import uuid

@handle_exceptions
def just_login(request):
    response = HttpResponseRedirect('/accounts/login/')
    response.delete_cookie('user')
    response.delete_cookie('user_photo')
    return response

@handle_exceptions
def validar(request):
    print('\n', 'VALIDAR VALIDAR', request.user.username)
    print('VALIDAR VALIDAR', request.user.password, '\n')
    # user = request.POST['username']
    # passw = request.POST['password']

    # access = authenticate(username=user, password=passw)
    response = {}
    response['object'] = request.user
    return JsonResponse(response)

from datetime import datetime

# @handle_exceptions
def fue_notificado_hoy(request):
    # user_app = models.UserApp.objects.get(user_ptr=request.user.pk)
    user = models.User.objects.get(pk=request.user.pk)
    user_app = models.UserApp.objects.filter(user_ptr=user)
    if len(user_app) == 0:
        u = models.UserApp(
            password=user.password,
            last_login=datetime.now(),
            is_superuser=user.is_superuser,
            username=user.username,
            first_name=user.first_name,
            last_name=user.last_name,
            email=user.email,
            is_staff=user.is_staff,
            is_active=user.is_active,
            date_joined=user.date_joined,
            user_ptr = user,
            referUser=uuid.uuid4(),
        )
        u.save()
        print('\n', 'ACTUALICE ACTUALICE ACTUALICE', '\n')
        
    if user.is_superuser:
        if not user.first_name:
            user.first_name = 'Administrador'
            user.save()
        if not user.last_name:
            user.last_name = 'del Sistema'
            user.save()
        
    user_getted = models.UserApp.objects.get(user_ptr=user)
    last_login = user_getted.last_login.replace(hour=0, minute=0, second=0, microsecond=0)
    fecha_actual = datetime.now()
    fecha_actual_limpia = fecha_actual.replace(hour=0, minute=0, second=0, microsecond=0)
    notificado = False
    if last_login == fecha_actual_limpia and user_getted.notificado == True:
        notificado = True     
            
    return notificado
        

@handle_exceptions
def fechas_notificar_objetivo(request):
    anno = datetime.now().year
    
    fechas_str = [f'{anno}-11-1', f'{anno}-11-15', f'{anno}-12-1', f'{anno}-12-15', f'{anno}-11-29', f'{anno}-11-30']
    fechas = []
    for fecha in fechas_str:
        date = datetime.strptime(fecha, '%Y-%m-%d')
        fechas.append(date)
        
    return fechas
    
@handle_exceptions
def enviar_alertas(request):
    try:
        fecha_actual = datetime.now()
        fecha_actual_sin_hora = fecha_actual.replace(hour=0, minute=0, second=0, microsecond=0)
        
        mes_siguiente = fecha_actual.replace(day=28) + timedelta(days=31)

        ultimo_dia_mes_siguiente = calendar.monthrange(mes_siguiente.year, mes_siguiente.month)[1]

        if fecha_actual.day > ultimo_dia_mes_siguiente:
            fecha_resultado = mes_siguiente.replace(day=ultimo_dia_mes_siguiente)
        else:
            fecha_resultado = mes_siguiente.replace(day=fecha_actual.day)
        
        estado_cumplido = estado_acuerdo.objects.get(nombre__iexact='cumplido')
        
        try:
            id_proyecto = Permission.objects.get(codename='view_proyecto')
            id_acuerdo = Permission.objects.get(codename='view_acuerdo')
            id_objetivo = Permission.objects.get(codename='view_objetivo')
        except:
            pass
        
        try:
            acuerdos_por_vencerse = acuerdo.objects.filter(
                activo=True,
                fecha_limite=fecha_resultado
            ).exclude(estado=estado_cumplido)
            
            for ac in acuerdos_por_vencerse:
                notify.send(request.user, recipient=User.objects.filter(permission=id_acuerdo), verb=f'El Acuerdo "{ac.nombre}" vence en un mes', level='warning')
        except estado_acuerdo.DoesNotExist:
            # Manejar el caso cuando no se encuentra el estado "cumplido"
            print('Error: No se encuentra el estado "cumplido"')
            acuerdos_por_vencerse = []
        except Exception as e:
            # Manejar otras excepciones
            print(f'Error al obtener acuerdos por vencerse: {e}')
            acuerdos_por_vencerse = []    
            
        # notificar los que se vencen hoy y no estan cumplidos
        try:
            acuerdos_por_vencerse_hoy = acuerdo.objects.filter(
                activo=True,
                fecha_limite=datetime.now()
            ).exclude(estado=estado_cumplido)
            for ac in acuerdos_por_vencerse_hoy:
                notify.send(request.user, recipient=User.objects.filter(permission=id_acuerdo), verb=f'El Acuerdo "{ac.nombre}" vence hoy y no está cumplido', level='warning')
        except Exception as e:
            print(f'Mostrando excepcion: {e}')
        
        fechas_objetivo = fechas_notificar_objetivo(request)
        
        if fecha_actual_sin_hora in fechas_objetivo:
            objetivos_por_vencerse = objetivo.objects.filter(
                activo=True
            ).exclude(evaluacion_trimestral__evaluacion__valor=5)
            
            for obj in objetivos_por_vencerse:
                print('NOTIFICAR OBJETIVO', obj)
                notify.send(request.user, recipient=User.objects.filter(permission=id_objetivo), verb=f'El Objetivo "{obj.nombre}" está por vencerse', level='error')
        
        try:
            estado_cumplido = estado_acuerdo.objects.get(nombre__iexact='cumplido')
            acuerdos_por_vencerse = acuerdo.objects.filter(
                activo=True,
                fecha_limite=fecha_resultado
            ).exclude(estado=estado_cumplido)
            
            for obj in acuerdos_por_vencerse:
                print('NOTIFICAR ACUERDO', obj)
                notify.send(request.user, recipient=User.objects.filter(permission=id_acuerdo), verb=f'El Acuerdo "{obj.nombre}" está por vencerse', level='error')
        except estado_cumplido.DoesNotExist:
            # Manejar el caso cuando no se encuentra el estado "cumplido"
            print('Error: No se encuentra el estado "cumplido"')
            acuerdos_por_vencerse = []
        except Exception as e:
            # Manejar otras excepciones
            print(f'Error al obtener acuerdos por vencerse: {e}')
            acuerdos_por_vencerse = []
            
        fecha_ayer = fecha_actual - timedelta(days=1)
        fecha_ayer_sin_hora = fecha_ayer.replace(hour=0, minute=0, second=0, microsecond=0)
        
        try:
            proyectos_por_vencerse = proyecto.objects.filter(
                activo=True,
                registro_aprobacion__fecha_terminacion=fecha_ayer_sin_hora
            )
            
            try:
                atrasado = estado_proyecto.objects.get(activo = True, nombre__iexact='atrasado')
            except:
                pass
            
            for obj in proyectos_por_vencerse:
                print('NOTIFICAR PROYECTO', obj)
                obj.estado = atrasado
                obj.save()
                notify.send(request.user, recipient=User.objects.filter(permission=id_proyecto), verb=f'El proyecto "{obj.nombre_proyecto}" se venció ayer', level='error')
        except estado_acuerdo.DoesNotExist:
            # Manejar el caso cuando no se encuentra el estado "cumplido"
            print('Error: No se encuentra el estado "cumplido"')
            proyectos_por_vencerse = []
        except Exception as e:
            # Manejar otras excepciones
            print(f'Error al obtener acuerdos por vencerse: {e}')
            proyectos_por_vencerse = []
            
        user_getted = models.UserApp.objects.get(user_ptr=request.user)
        user_getted.notificado = True
        user_getted.save()    
            
        return JsonResponse({'success': True})
    except ObjectDoesNotExist as e:
        # Manejar el caso cuando el usuario actual no tiene una instancia correspondiente en UserApp
        print(f'Error: {e}')
        # messages.error(request, 'Error al enviar alertas. El usuario no tiene una instancia correspondiente en UserApp.')
        return JsonResponse({'success': False, 'error': 'No se puede encontrar la instancia de UserApp para el usuario actual.'})
    except Exception as e:
        # Manejar otras excepciones
        print(f'Error: {e}')
        messages.error(request, 'Error al enviar alertas.')
        return JsonResponse({'success': False, 'error': 'Ocurrió un error al enviar alertas.'})
    
# al entrar me manda para el 404, esto es en ProyectoBaseApp.views.loguear() si le dejo el handle_exceptions como funcion decoradora, que en caso de ser superuser no tiene UserApp, lo ideal sería antes de iniciar todo buscar los usuarios que no tengan datos completos, guardar valores y seguir. (Quizás haya otra vía) (Puede enlentecer el login, aunque debería ser solo para el primer usuario)
# @handle_exceptions
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
                        userPhoto = userApp.image
                        # print('\n', 'userPhoto:', userPhoto, '\n')
                        response.set_cookie("user_photo", userApp.image)
                    else:
                        response.set_cookie("user_photo", "static/users/userDefault1.png")
                else:
                    response.set_cookie("user_photo", "static/users/userDefault1.png")
                
                notificado = fue_notificado_hoy(request)
                if not notificado:                
                    enviar_alertas(request)
                
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
@permission_required('auth.add_user')
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

# noooooooo
@login_required()
@permission_required('auth.add_user')
@handle_exceptions
def detalle_grupo(request, id):
    objeto = Group.objects.get(id = id)

    template_name = 'P01/premio/premio_detail.html'
    contexto = {
        'objeto' : objeto,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)
    return render(request, template_name, contexto)

@permission_required('auth.add_user')
def detalle_grupo(request, id):
    objeto = Group.objects.get(id = id)

    template_name = 'P01/premio/premio_detail.html'
    contexto = {
        'objeto' : objeto,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)
    return render(request, template_name, contexto)
# noooo

# CRUD Rol
@login_required()
@permission_required('auth.add_user')
@handle_exceptions
def group_create(request):
    # print('\n', 'METODO', request.method, '\n')
    if request.GET:
        form = forms.GroupForm()
        args = {}
        args['form'] = form
        return render(request, 'auth/group_form.html', args)
    
    if request.POST:
        form = forms.GroupForm(request.POST)
        if form.is_valid():
            form.save()
            gr = Group.objects.all()
            if len(gr) > 0:                 
                id_group = Group.objects.last()
                register_logs(request, Group, id_group.pk, str(id_group), 1)
            response = {}
            response['result'] = 'success'
            response['title'] = 'Rol registrado con éxito'
            return JsonResponse(response)
        else:
            response = {}
            response['result'] = 'error'
            response['title'] = 'Error al registrar'
            return JsonResponse(response)
        
    form = forms.GroupForm()
    args = {}
    args['form'] = form
    return render(request, 'auth/group_form.html', args)

@login_required()
@permission_required('auth.view_user')
@handle_exceptions
def user_list(request):
    # users_list = User.objects.filter(is_superuser=False).exclude(pk=request.user.pk).order_by("-date_joined")
    users_list = User.objects.filter(is_active=True).order_by("-date_joined")
    users = []
    for user in users_list:
        users.append([user, None])
    return render(request, 'Security/users.html', {'usersList': users})

@login_required()
@permission_required('auth.add_user')
@handle_exceptions
def user_create(request):
    try:

        if request.method == 'POST':
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
                notify.send(request.user, recipient=usuario, verb='¡Bienvenido a SISGEPO!', level='success')
                response = {
                    'result': 'success',
                    'title': 'Usuario creado con éxito'
                }
                return JsonResponse(response)
            else:
               if form.errors:
                    for field, errors in form.errors.items():
                        print(f'- Campo: {field}')
                        for error in errors:
                            print(f'  - {error}')
                            response = {
                                'result': 'error',
                                'title': error,
                                'field': field,
                            }
                            return JsonResponse(response)
        else:
            form = forms.UserForm()
        args = {}
        args['form'] = form
        return render(request, 'auth/user_form.html', args)
    except Exception as e:
        print(f'Excepcion al crear usuario: {e}')
        args = {}
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
    print('\n', 'HE LLEGADO', '\n')
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
        print('\n', 'LLEGUEEEEE', request.method, '\n')        
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

@permission_required('auth.view_user')
@handle_exceptions
def db_list(request):
    lista = list_address_db()
    revertida = lista.reverse()
    # print('\nLA LISTA', revertida, '\n')
    return render(request, 'Security/salvarestaura.html', {'list_db': lista, 'usuario': request.user})

# @user_passes_test(is_superuser)
@handle_exceptions
def db_save(request):
    random_text = generate_random_text()
    
    if request.method == 'POST':
        # address = f"media/db/{datetime.now().strftime('%Y%m%d')}_SISGEPO_{random_text}.sql"
        address = f"media/db/{datetime.now().strftime('%Y%m%d%H%M%S')}_SISGEPO.sql"

        
        password = 'soloyo1234'
        
        try:
            env = os.environ.copy()
            env['PGPASSWORD'] = password
            
            result = subprocess.run(
                [
                    'pg_dump',
                    '-d',
                    'SISGDDO',
                    '-c',
                    '-h',
                    '172.16.1.62',
                    '-p',
                    '5432',
                    '-U',
                    'postgres',
                    '-f',
                    address
                ],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=True,
                env=env
            )
            
            if result.returncode == 0:
                print('\n', 'ADDRESS', address, '\n')
                save_address_dbs(address)
                db_name = address.split('/')[-1]
                register_logs(request, request.user, request.user.pk, f'Se salvó la base de datos {db_name}', 11)
                notify.send(request.user, recipient=request.user, verb=f'Se salvó la base de datos {db_name}', level='warning')
                response = {}
                response['result'] = 'success'
                response['title'] = 'Éxito al salvar los datos'
                return JsonResponse(response)
            else:
                error_message = result.stderr.strip()
                print(f"Error al generar el respaldo de la base de datos: {error_message}")
                response = {}
                response['result'] = 'error'
                response['title'] = 'Error al salvar los datos'
                return JsonResponse(response)
                # messages.error(request, "Error al salvar los datos")
        except subprocess.CalledProcessError as e:
            print(f"Error al generar el respaldo de la base de datos: {e.stderr}")
            response = {}
            response['result'] = 'error'
            response['title'] = 'Error al salvar los datos'
            return JsonResponse(response)
            # messages.error(request, "Error al salvar los datos")
        except Exception as e:
            print(f'Hubo un error no manejado: {e}')
            response = {}
            response['result'] = 'error'
            response['title'] = 'Error al salvar los datos'
            return JsonResponse(response)

# def db_restore(request):
#     if request.method == "POST":
#         try:
#             body_unicode = request.body.decode('utf-8')
#             data = json.loads(body_unicode)
#             name = data.get('name')

#             if not name:
#                 raise ValueError("El campo 'name' es requerido en los datos JSON.")

#             address = "media/db/" + name
            
#             try:
#                 subprocess.Popen("psql -h localhost -p 5432 -U postgres --no-password prueba <" + address, shell=True)
#             except Exception as e:
#                 print(f'Otra excepcion: {e}')

#             response = {
#                 'result': 'success',
#                 'message': 'La restauración de la base de datos fue exitosa.'
#             }
#             return JsonResponse(response)
#         except Exception as e:
#             print(f'Tipo de excepción: {type(e).__name__}')
#             print(f'Error: {e}')
#             print('\n', 'METHOD', request.method, '\n')
#             print('\n', 'USER', request.user, '\n')
#             response = {
#                 'result': 'error',
#                 'title': 'Ocurrió un error al restaurar la base de datos',
#                 'message': str(e)
#             }
#             return JsonResponse(response)

#     response = {
#         'result': 'error',
#         'title': 'Método no permitido',
#         'message': 'Esta vista solo acepta solicitudes POST.'
#     }
#     return JsonResponse(response, status=405)

def db_restore(request):
    if request.method == "POST":
        body_unicode = request.body.decode('utf-8')
        data = json.loads(body_unicode)
        name = data['name']
        lista = list_address_db()
        address = "media/db/" + name.strip()
        # address = address[:-1]
        password = 'postgres'

        try:
            address = "media/db/" + name
            address = address[:-1]
            password = 'soloyo1234'  # Reemplaza con la contraseña real de PostgreSQL
            
            env = os.environ.copy()
            env['PGPASSWORD'] = password

            # Ejecuta el comando en un proceso separado
            process = subprocess.Popen(
                [
                    'psql',
                    '-h',
                    'localhost',
                    '-p',
                    '5432',
                    '-U',
                    'postgres',
                    '-d',
                    'SISGDDO',
                    '-f',
                    address
                ],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                env=env
            )

            # Captura la salida estándar y el error estándar del proceso
            stdout, stderr = process.communicate()

            # Verifica el código de retorno del proceso
            if process.returncode == 0:
                print('Comando psql ejecutado exitosamente')
                print('Salida estándar:', stdout)
                response = {
                    'result': 'success',
                    'title': 'Datos restaurados exitosamente',
                    'text': 'Se cerrará su sesión para mejor carga de los datos'
                }
                return JsonResponse(response)
            else:
                print('Error al ejecutar el comando psql')
                print('Error estándar:', stderr)
                response = {
                    'result': 'error',
                    'title': 'Error al ejecutar el comando psql',
                    'message': 'Esta vista solo acepta solicitudes POST.'
                }
                return JsonResponse(response, status=405)

        except Exception as e:
            print(f'Otra excepción: {e}')
            response = {
                'result': 'error',
                'title': 'Método no permitido',
                'message': 'Esta vista solo acepta solicitudes POST.'
            }
            return JsonResponse(response, status=405)
        finally:
            # Limpia la variable de entorno después de la ejecución
            env.pop('PGPASSWORD', None)