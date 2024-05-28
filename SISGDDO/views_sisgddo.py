import os
import json
import sys
from django.contrib.auth.decorators import login_required, user_passes_test, permission_required
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.admin.models import LogEntry
from django.shortcuts import render
from apps.base.utils import get_page_body, get_logos, logs
from requests import request
from SISGDDO import models
import uuid
# from SISGDDO.models import Afectaciones
from django.views.generic import ListView
import uuid
from django.template.loader import get_template
from weasyprint import HTML,CSS
from datetime import date, timedelta, datetime
from base64 import b64encode
from dateutil import parser
from django.contrib.auth.models import User
from django.template import RequestContext
from django.core.files.storage import FileSystemStorage
from ProyectoBaseApp import models as modelsadmin

from django.contrib import messages
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from notifications.signals import notify
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin
from apps.base.models import Employee, Position, Entity
from SISGDDO import models, form, LDAP_configuracion, MigrarRodas, APIcorreo
from xavi import models as xavi_models
# from SISGDDO.models import proyecto, trabajador_proyecto
from xavi.models import area
from SISGDDO.models import incidencia,auditoria_externa,auditoria_interna
from SISGDDO.models import Afectaciones, PlanTrabajo, ActividadPlan, Contacto
from SISGDDO.form import AfectationModelForm, ModifyAfectationModelForm,IncidenciaModelForm, ModifiyIncidenciaModelForm, AuditoriaInternaModelForm, ModAuditoriaInternaModelForm, AuditoriaExternaModelForm, ModAuditoriaExternaModelForm, CompModAfectationModelForm, CompModIncidenciaModelForm, ActividadesModelForm, PlanModelForm, PasoAfectacionModelForm, Contacto_form
# from SISGDDO.models import modalidad
from django.views.generic.edit import CreateView,UpdateView,BaseUpdateView
from django.views.generic.detail import DetailView
from django.views.generic.edit import DeleteView
from django.forms import ValidationError
from django.urls import reverse,reverse_lazy
from Tesis_Citmatel import settings
from ProyectoBaseApp.utils import register_logs, list_address_db, save_address_dbs
from django.views.generic import TemplateView,View
from django.conf import settings
from django.http import HttpResponse
from django.template import Context
from django.template.loader import get_template
from django.utils.translation import gettext_lazy as _
from io import BytesIO, StringIO
from xavi.mis_validaciones import my_validates
from pathlib import Path
from django.core.files import File
#import magic
import copy
from django.core.exceptions import ObjectDoesNotExist, PermissionDenied
from django.template.loader import render_to_string
import tempfile
from django.db.models import Sum
#from weasyprint.text.fonts import FontConfiguration
from django.template.loader import get_template
from django.views.decorators.csrf import csrf_protect
from django.http import HttpResponseServerError
from functools import wraps
from django.utils.decorators import method_decorator
import traceback
import textwrap
from django.forms.models import model_to_dict
from django.http import Http404
from django.db import IntegrityError, transaction
import shutil
from django.utils import timezone
from django.db.models import Q
from django.db.utils import OperationalError
from django.views.decorators.debug import sensitive_post_parameters
from ProyectoBaseApp.models import UserApp
from Tesis_Citmatel.settings import DATABASES
from django.contrib.auth import authenticate, login
import random
from django.contrib.auth.hashers import make_password
from xavi.utils import handle_exceptions, user_has_any_permission, is_superuser, calcular_porciento, alternar_frase
import psycopg2
from django.db.models import Max, F, Count
from collections import defaultdict

def prueba_LDAP(request):

        LDAP_configuracion.sinc_usuarios_LDAP()
        return redirect('inicio')

def prueba_MigrarRodas(request):

        MigrarRodas.MigrarRodas(request)
        return redirect('inicio')

def prueba_Correo(request):

        APIcorreo.pruebacorreo(request)
        return redirect('inicio')


def notificar(request):
    notify.send(request.user, recipient=User.objects.filter(is_superuser=True), verb=f'Ha sido notificado', level='success')
    
    response = {}
    response['result'] = 'success'
    response['title'] = 'Notificación enviada'
    return response
 
class DashboardGraficobarra(LoginRequiredMixin,TemplateView):
    template_name = 'inicio.html'
    
    def get_grafico_admin(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_trazas = LogEntry.objects.filter(action_time__month=m,action_time__year=year).count()
            data.append(cantidad_trazas)
        return data

    def get_grafico_dirorganizacional(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_acuerdos = 0
            data.append(cantidad_acuerdos)
        return data

    def get_grafico_espcalidaut(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_proyectos_terminados = 0
            data.append(cantidad_proyectos_terminados)
        return data

    def get_grafico_espcap(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_cursos = 0
            data.append(cantidad_cursos)
        return data

    def get_grafico_espinform(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_proyectos_iniciados= xavi_models.proyecto.objects.filter(fecha_inicio__month=m,fecha_inicio__year=year).count()
            data.append(cantidad_proyectos_iniciados)
        return data

    def get_grafico_rechumactivos(self):
        data = 0
        year = datetime.now().year
        for m in range(1,2):
            cantidad_trabajadores_activos= Employee.objects.filter(active=True).count()
            data = cantidad_trabajadores_activos
        return data

    def get_grafico_rechuminactivos(self):
        data = 0
        year = datetime.now().year
        for m in range(1,2):
            cantidad_trabajadores_inactivos= Employee.objects.filter(active=False).count()
            data = cantidad_trabajadores_inactivos
        return data
    
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['notificado'] = False        
        context['panel'] = 'Panel de Administracion'
        usuario = self.request.user
        user_app = UserApp.objects.get(user_ptr=usuario)
        context['userPhoto'] = user_app.image
            
        grupos = usuario.groups.all()
        
        for g in grupos:
            if g.id == 1:
                context['datos_grafico_barra'] = self.get_grafico_admin()
                context['title'] = 'Reporte de trazas'
            if g.id == 3:
                context['datos_grafico_barra'] = self.get_grafico_dirorganizacional()
                context['title'] = 'Reporte de acuerdos tomados'
            if g.id == 8 or g.id == 7 or g.id == 5:
                context['datos_grafico_barra'] = self.get_grafico_espcalidaut()
                context['title'] = 'Reporte de proyectos terminados'
            if g.id == 2:
                context['datos_grafico_barra'] = self.get_grafico_espcap()
                context['title'] = 'Reporte de cursos'
            if g.id == 6:
                context['datos_grafico_barra'] = self.get_grafico_espinform()
                context['title'] = 'Reporte de proyectos iniciados'
            if g.id == 4:
                context['datos_grafico_pastelpart1'] = self.get_grafico_rechumactivos()
                context['datos_grafico_pastelpart2'] = self.get_grafico_rechuminactivos()
        return context
    
class CambiarLogotipo(LoginRequiredMixin,CreateView):
    model = models.CambiarLogotipo
    form_class = form.cambiarlogoForm
    #form_class = ''
    template_name = 'logo/cambiar_logo.html'
    success_url = reverse_lazy('inicio')

    @method_decorator(login_required)
    @method_decorator(staff_member_required)
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('inicio')

    def post(self, request, *args, **kwargs):
        forms = form.cambiarlogoForm(request.POST,request.FILES)
        if forms.is_valid():
            forms.save()
            id_logo = models.CambiarLogotipo.objects.last()
            register_logs(request, CambiarLogotipo, id_logo.pk, id_logo.__str__(), 1)
            notify.send(request.user, recipient=User.objects.filter(is_superuser=True), verb=f'Cambio de logotipo', level='info')
            #messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            #messages.error(request, "Existen errores en el formulario")
            return render(request, self.template_name, self.contexto)

@login_required
@handle_exceptions
def acerca_de(request):
    return render(request, 'acerca_de.html')

def cargar_frase(request):  
    response = {}
    
    user_app = UserApp.objects.get(user_ptr=request.user)
    fecha_ultima_frase = user_app.fecha_frase
    frase = user_app.frase if user_app.frase else alternar_frase()
    
    if fecha_ultima_frase:
        fecha_actual = datetime.now()
        umbral_tiempo = timedelta(hours=3, minutes=1)
        if fecha_actual > (user_app.fecha_frase + umbral_tiempo):
            response['escribir'] = True
            frase = alternar_frase()
            user_app.frase = frase
            user_app.save()
        else:
            response['escribir'] = False
    else:
        response['escribir'] = True
        frase = alternar_frase()
        user_app.fecha_frase = datetime.now()
        user_app.frase = frase
        user_app.save()
        
    response['frase'] = frase
    
    return JsonResponse(response)

@login_required
@user_has_any_permission('xavi.view_objetivo', 'xavi.view_premio', 'xavi.view_acuerdo')
@handle_exceptions
def cargar_datos(request):
    datos = {}
    
    data = []
    objetivos = xavi_models.objetivo.objects.filter(activo=True, fecha_definicion__year=datetime.now().year).order_by('id')
    for obj in objetivos:
        evaluacion_trimestral = xavi_models.evaluacion_trimestral.objects.filter(objetivo=obj).order_by('-periodo__orden').first()
        if evaluacion_trimestral:
            data.append({'name': evaluacion_trimestral.objetivo.nombre, 'y': float(evaluacion_trimestral.evaluacion.valor)})
        else:
            data.append({'name': obj.nombre, 'y': 0})
    datos['objetivos_columna'] = data
    
    # data = []
    # objetivos = models.objetivo.objects.filter(activo=True, fecha_definicion__year=datetime.now().year).order_by('id')
    # for obj in objetivos:
    #     evaluacion_trimestral = models.evaluacion_trimestral.objects.filter(objetivo=obj).order_by('-periodo__orden').first()
    #     if evaluacion_trimestral:
    #         data.append({'name': evaluacion_trimestral.objetivo.nombre, 'y': float(evaluacion_trimestral.evaluacion.valor)})
    #     else:
    #         data.append({'name': obj.nombre, 'y': 0})
    # datos['objetivos_columna'] = data
    
    # cantidad de objetivos que tienen como su ultimo periodo de evaluacion TAL
    # luego hallar porcentaje
            
    data = []
    # Q1
    acuerdos = xavi_models.acuerdo.objects.filter(activo=True, fecha__year=datetime.now().year)
    # Q Estados acuerdos
    estados = acuerdos.filter(estado__activo=True)
    no_cumplidos = estados.filter(fecha_cumplimiento__isnull=True)
    # Q Pendiente
    pendientes = no_cumplidos.filter(estado__nombre__iexact='pendiente')
    data.append({'name': 'Pendientes', 'y': calcular_porciento(len(pendientes), len(acuerdos))})
    # Q En proceso
    en_proceso = no_cumplidos.filter(estado__nombre__iexact='en proceso')
    data.append({'name': 'En proceso', 'y': calcular_porciento(len(en_proceso), len(acuerdos))})
    # Q Pendiente
    cumplidos = estados.filter(fecha_cumplimiento__isnull=False)
    data.append({'name': 'Cumplidos', 'y': calcular_porciento(len(cumplidos), len(acuerdos))})
    
    datos['porciento_acuerdos'] = data
    
    data = []
    
    premios = xavi_models.premio.objects.filter(activo=True)
    # comparacion mensual
    #premios = xavi_models.premio.objects.filter(activo=True, fecha__month=datetime.now().month)
    # comparacion mensual
    anno_actual = premios.filter(fecha__year=datetime.now().year)
    anno_pasado = premios.filter(fecha__year=datetime.now().year - 1)
    
    datos['comparativa_premios'] = [{'anno_actual': [len(anno_actual)], 'anno_pasado': [len(anno_pasado)]}]
    
    data = []

    ultimas_entradas = (xavi_models.entrada_proyecto.objects.filter(proyecto__activo=True, activo=True).annotate(ultima_fecha=Max('fecha_entrada')).filter(fecha_entrada=F('ultima_fecha')).select_related('proyecto'))

    contador_por_estado = defaultdict(int)

    for entrada in ultimas_entradas:
        estado = entrada.estado
        contador_por_estado[estado] += 1

    total_entradas = len(ultimas_entradas)

    contador_por_estado_formato = []
    for estado, cantidad in contador_por_estado.items():
        porcentaje = (cantidad / total_entradas) * 100
        contador_por_estado_formato.append({'name': str(estado.nombre), 'y': porcentaje})

    for item in contador_por_estado_formato:
        print(f"Estado: {item['name']}, Porcentaje de Entradas: {item['y']:.2f}%")

    datos['estados_dgca'] = contador_por_estado_formato

    return JsonResponse(datos, safe=False)

#Vistas de Hermes
#Vistas de afectaciones
@login_required()
def listar_afectacion(request):
    datos = models.Afectaciones.objects.filter(activo = True)
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/afectaciones/afectaciones.html', contexto)

def create_afectation(request):
    form = AfectationModelForm()

    if request.method == 'POST':
        form = AfectationModelForm(request.POST)

        if form.is_valid():
            
            afectacion=Afectaciones()
            afectacion.afectacion=form.cleaned_data['afectacion']
            afectacion.fecha_recepcion=form.cleaned_data['fecha_recepcion']
            afectacion.propuesto=form.cleaned_data['propuesto']
            afectacion.responsable=form.cleaned_data['responsable']
            afectacion.observacionesactual=str(datetime.now().date())+str('  ') +form.cleaned_data['observacionesactual']
            afectacion.formato=form.cleaned_data['formato']
            afectacion.estado='En proceso'
            afectacion.save()
            
            logs(request, Afectaciones, afectacion, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_afectacion)}})

    return render(request, 'P01/afectaciones/createAfectation.html', {'form': form})


def paso_afectacion(request, id):
    form = PasoAfectacionModelForm()
    inc= incidencia.objects.get(id=id)

    if request.method == 'POST':
        form = PasoAfectacionModelForm(request.POST)

        if form.is_valid():
            
            afectacion=Afectaciones()
            afectacion.afectacion=inc.titulo
            afectacion.fecha_recepcion=datetime.now().date()
            afectacion.propuesto=form.cleaned_data['responsable']
            afectacion.responsable=inc.ejecutante
            afectacion.observacionesactual=str(datetime.now().date())+str('  ') +form.cleaned_data['observacionesactual']
            afectacion.formato=form.cleaned_data['formato']
            afectacion.estado='Iniciada'
            afectacion.save()
            inc.activo=False
            inc.save()
            
            logs(request, Afectaciones, afectacion, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_incidencias)}})

    return render(request, 'P00/Incidencias/PasoAafectacion.html', {'form': form, 'instance': inc})

def act_desactafectacion(request, numero):
    valor = request.POST.get('activo')
    col = models.Afectaciones.objects.get(numero = numero)
    col.activo = True if valor == "on" else False
    
    col.save()

def detalle_afectacion(request, numero):
    objeto = models.Afectaciones.objects.get(numero = numero)
    equip = objeto.observacionesactual.split()
        

    template_name = 'P01/afectaciones/DetalleAfectaciones.html'
    contexto = {
        'object' : objeto,  
        'equip' : equip 
    }
    return render(request, template_name, contexto)

def eliminar_afectacion(request, numero):
    objeto = models.Afectaciones.objects.get(numero = numero)
    template_name = 'P01/afectaciones/EliminarAfectacion.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.activo=False
        objeto.save()
        #messages.success(request, "Afectación eliminada con éxito")
        return redirect('listar_afectacion')
    return render(request, template_name, contexto)

def cambiar_afectacion(request, numero):
    instance = models.Afectaciones.objects.get(numero = numero)
    form = ModifyAfectationModelForm(instance=instance)
    
    if request.method == 'POST':
        form = ModifyAfectationModelForm(instance=instance, data=request.POST)
       
        if form.is_valid():
            instance = form.save()
            instance.observacionesactual=instance.observacionesactual + str('  ') +str(datetime.now().date()) + str('  ')  + form.cleaned_data['observacion'] 
            instance.save()
            if instance.estado == 'Cerrado':
                instance.fecha_cierre=datetime.now().date()
                instance.save()
            logs(request, Afectaciones, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_afectacion)}})

    return render(request, 'P01/afectaciones/CambiarAfectacion.html', {'instance': instance, 'form': form})

def modificar_afectacion(request, numero):
    instance = models.Afectaciones.objects.get(numero = numero)
    form = CompModAfectationModelForm(instance=instance)
    if request.method == 'POST':
        form = CompModAfectationModelForm(instance=instance, data=request.POST)
        if form.is_valid():
            instance = form.save()
            logs(request, Afectaciones, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_afectacion)}})

    return render(request, 'P01/afectaciones/ModificarAfectacion.html', {'instance': instance, 'form': form})

def exportar_afectaciones(request):
    if request.method == 'POST':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        filtered_data = request.POST.get('filtered_data')
        if filtered_data:
            filtered_data = json.loads(filtered_data)
            models = Afectaciones.objects.filter(pk__in=filtered_data)
        
            html_string = render_to_string(
                'P01/afectaciones/exportarAfectacion.html',
            {'models': models, 'owner': request.user, 'date': datetime.now()}
            )
            html = HTML(string=html_string, base_url=request.build_absolute_uri())
            uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
            main_doc = html.render(
                stylesheets=[
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                            CSS(string=".pdf-page { height: 100vh; }"),  # Establece el alto de la página al 100% de la altura de la ventana gráfica (viewport height)
                            CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                            ],
            )   

            main_doc.write_pdf(
                target=os.path.join(uri_tmp, 'Listado de Afectaciones'+str(' ')+ str(datetime.now().date())+'.pdf'),
                zoom=0.75,
            )

            fs = FileSystemStorage(uri_tmp)
            with fs.open('Listado de Afectaciones'+str(' ')+ str(datetime.now().date())+'.pdf') as pdf:
                response = HttpResponse(pdf, content_type='application/pdf')
                response['Content-Disposition'] = 'attachment; filename="Listado_de_Afectaciones_{}.pdf"'.format(datetime.now().date())
                return response

    return redirect(reverse_lazy('listar_afectacion'))

#Vistas de Incidencias

@login_required()
def listar_incidencias(request):
    listincidencias = models.incidencia.objects.filter(activo = True)

    contexto = {
        'incidencias': listincidencias
    }
    return render(request, 'P00/Incidencias/incidencias.html', contexto)

def crear_incidencias(request):
    form = IncidenciaModelForm()

    if request.method == 'POST':
        form = IncidenciaModelForm(request.POST)

        if form.is_valid():
            
            inc=incidencia()
            inc.titulo=form.cleaned_data['titulo']
            inc.fecha_recepcion=form.cleaned_data['fecha_recepcion']
            inc.hora=form.cleaned_data['hora']
            inc.descripcion=form.cleaned_data['descripcion']
            inc.trabajador=form.cleaned_data['trabajador']
            inc.proceso=form.cleaned_data['proceso']
            inc.ejecutante=form.cleaned_data['ejecutante']
            inc.estado='Iniciada'
            inc.save()
            
            logs(request, incidencia, inc, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_incidencias)}})

    return render(request, 'P00/Incidencias/crearIncidencias.html', {'form': form})

def detalle_incidencias(request, id):
    objeto = models.incidencia.objects.get(pk = id)

    template_name = 'P00/Incidencias/DetalleIncidencias.html'
    contexto = {
        'object' : objeto,   
    }
    return render(request, template_name, contexto)

def act_desactincidencias(request, id):
    valor = request.POST.get('activo')
    col = models.incidencia.objects.get(pk = id)
    col.activo = True if valor == "on" else False
    
    col.save()

def eliminar_incidencias(request, id):
    objeto = models.incidencia.objects.get(pk = id)
    template_name = 'P00/Incidencias/EliminarIncidencia.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.activo=False
        objeto.save()
        #messages.success(request, "Incidencia eliminada con éxito")
        return redirect('listar_incidencias')
    return render(request, template_name, contexto)

def cambiar_incidencias(request, id):
    instance = models.incidencia.objects.get(pk = id)
    form = ModifiyIncidenciaModelForm(instance=instance)

    if request.method == 'POST':
        form = ModifiyIncidenciaModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            if instance.estado == 'Cerrado':
                instance.fecha_cierre=datetime.now().date()
                instance.save()
            logs(request, incidencia, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_incidencias)}})

    return render(request, 'P00/Incidencias/CambiarIncidencias.html', {'instance': instance, 'form': form})

def modificar_incidencias(request, id):
    instance = models.incidencia.objects.get(pk = id)
    form = CompModIncidenciaModelForm(instance=instance)

    if request.method == 'POST':
        form = CompModIncidenciaModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, incidencia, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_incidencias)}})

    return render(request, 'P00/Incidencias/modificar_incidencia.html', {'instance': instance, 'form': form})

def exportar_incidencias(request):
    if request.method == 'POST':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        filtered_data = request.POST.get('filtered_data')
        if filtered_data:
            filtered_data = json.loads(filtered_data)
            models = incidencia.objects.filter(pk__in=filtered_data)
        
            html_string = render_to_string(
                'P00/incidencias/exportarIncidencia.html',
            {'models': models, 'owner': request.user, 'date': datetime.now()}
            )
            html = HTML(string=html_string, base_url=request.build_absolute_uri())
            uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
            main_doc = html.render(
                stylesheets=[
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                            CSS(string=".pdf-page { height: 100vh; }"),  # Establece el alto de la página al 100% de la altura de la ventana gráfica (viewport height)
                            CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                            ],
            )   

            main_doc.write_pdf(
                target=os.path.join(uri_tmp, 'Listado de Incidencias'+str(' ')+ str(datetime.now().date())+'.pdf'),
                zoom=0.75,
            )

            fs = FileSystemStorage(uri_tmp)
            with fs.open('Listado de Incidencias'+str(' ')+ str(datetime.now().date())+'.pdf') as pdf:
                response = HttpResponse(pdf, content_type='application/pdf')
                response['Content-Disposition'] = 'attachment; filename="Listado_de_Incidencias_{}.pdf"'.format(datetime.now().date())
                return response

    return redirect(reverse_lazy('listar_incidencias'))

@login_required()
def listar_plan(request):
    datos = models.ActividadPlan.objects.filter(activo = True)
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/Planes/Planes.html', contexto)

def check_name_uniqueness(request):
    if request.method == 'POST' and request.headers.get('HTTP_X_REQUESTED_WITH') == 'XMLHttpRequest':
        name = request.POST.get('name', None)
        if name:
            # Realiza la verificación de unicidad del nombre en tu modelo
            is_unique = not Entity.objects.filter(name=name).exists()
            return JsonResponse({'is_unique': is_unique})
    return JsonResponse({'error': 'Invalid request'}, status=400)

def listar_plan1(request):
    datos = models.ActividadPlan.objects.filter(activo = True)
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/Planes/Planes1.html', contexto)

def listar_plan2(request):
    datos = models.ActividadPlan.objects.filter(activo = True)
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/Planes/Planes2.html', contexto)

def crearplan(request):
    form = ActividadesModelForm()

    if request.method == 'POST':
        form = ActividadesModelForm(request.POST, request.FILES)
        print('Hola')
        if form.is_valid():
            print('Hola')
            inc=ActividadPlan()
            inc.descripcion=form.cleaned_data['descripcion']
            inc.dia=form.cleaned_data['dia']
            inc.hora=form.cleaned_data['hora']
           
            if(form.cleaned_data['lugar']!='Otros'):
                inc.lugar=form.cleaned_data['lugar']
            else:
                inc.lugar=form.cleaned_data['otro']
            inc.preside=form.cleaned_data['preside']
            inc.plan="Grupo"
            inc.save()
            inc.participantes.set(form.cleaned_data['participantes'])
            inc.save()
            logs(request, ActividadPlan, inc, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_plan)}})

    return render(request, 'P01/Planes/crearPlan.html', {'form': form})

def crearplanEmp(request):
    form = ActividadesModelForm()

    if request.method == 'POST':
        form = ActividadesModelForm(request.POST, request.FILES)
        print('HolaEmpresa')
        if form.is_valid():
            print('Hola')
            inc=ActividadPlan()
            inc.descripcion=form.cleaned_data['descripcion']
            inc.dia=form.cleaned_data['dia']
            inc.hora=form.cleaned_data['hora']
           
            if(form.cleaned_data['lugar']!='Otros'):
                inc.lugar=form.cleaned_data['lugar']
            else:
                inc.lugar=form.cleaned_data['otro']
            inc.save()
            inc.preside.set(form.cleaned_data['preside'])
            inc.plan="Empresa"
            inc.save()
            inc.participantes.set(form.cleaned_data['participantes'])
            inc.contcheck=form.cleaned_data['contcheck']
            inc.save()
            if(form.cleaned_data['contcheck']):
                inc.contacto.set(form.cleaned_data['contacto'])
                emp=form.cleaned_data['contacto']
                for a in emp:
                
                    temp=models.Contacto.objects.get(nombre=a.nombre)
                
                    aa=temp.relacionados.all()
                    inc.participantes.add(*aa)
                    inc.save()
            logs(request, ActividadPlan, inc, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_plan1)}})

    return render(request, 'P01/Planes/crearPlan.html', {'form': form})

def crearplanAct(request):
    form = ActividadesModelForm()

    if request.method == 'POST':
        form = ActividadesModelForm(request.POST, request.FILES)
        print('HolaAct')
        if form.is_valid():
            print('Hola')
            inc=ActividadPlan()
            inc.descripcion=form.cleaned_data['descripcion']
            inc.dia=form.cleaned_data['dia']
            inc.hora=form.cleaned_data['hora']
           
            if(form.cleaned_data['lugar']!='Otros'):
                inc.lugar=form.cleaned_data['lugar']
            else:
                inc.lugar=form.cleaned_data['otro']
            inc.save()
            inc.preside.set(form.cleaned_data['preside'])
            inc.plan="Cuadro"
            inc.save()
            inc.participantes.set(form.cleaned_data['participantes'])
            inc.contcheck=form.cleaned_data['contcheck']
            inc.save()
            if(form.cleaned_data['contcheck']):
                inc.contacto.set(form.cleaned_data['contacto'])
                emp=form.cleaned_data['contacto']
                for a in emp:
                
                    temp=models.Contacto.objects.get(nombre=a.nombre)
                
                    aa=temp.relacionados.all()
                    inc.participantes.add(*aa)
                    inc.save()
            logs(request, ActividadPlan, inc, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_plan2)}})

    return render(request, 'P01/Planes/crearPlan1.html', {'form': form})

def crearplangrupo(request):
    form = PlanModelForm()

    if request.method == 'POST':
        form = PlanModelForm(request.POST)

        if form.is_valid():
            
            inc=PlanTrabajo()
            inc.descripcion=form.cleaned_data['descripcion']
            inc.día=form.cleaned_data['día']
            inc.hora=form.cleaned_data['hora']
            inc.lugar=form.cleaned_data['lugar']
            inc.preside=form.cleaned_data['preside']
            inc.participantes=form.cleaned_data['participantes']
            inc.save()
            
            logs(request, PlanTrabajo, inc, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_plan)}})

    return render(request, 'P01/Planes/crearPlan.html', {'form': form})


def detalle_plan(request, id):
    objeto = models.ActividadPlan.objects.get(pk = id)
    pres=objeto.preside.all()
    part=objeto.participantes.all()

    template_name = 'P01/Planes/DetallePlan.html'
    contexto = {
        'object' : objeto,  
        'part' : part, 
        'pre' : pres,
    }
    return render(request, template_name, contexto)

def act_desactplan(request, id):
    valor = request.POST.get('activo')
    col = models.ActividadPlan.objects.get(pk = id)
    col.activo = True if valor == "on" else False
    
    col.save()

def eliminar_plan(request, id):
    objeto = models.ActividadPlan.objects.get(pk = id)
    template_name = 'P01/Planes/EliminarPlan.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.activo=False
        objeto.save()
        #messages.success(request, "Actividad eliminada con éxito")
        return redirect('listar_plan1')
    return render(request, template_name, contexto)

def eliminar_plan1(request, id):
    objeto = models.ActividadPlan.objects.get(pk = id)
    template_name = 'P01/Planes/EliminarPlan1.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.activo=False
        objeto.save()
        #messages.success(request, "Actividad eliminada con éxito")
        return redirect('listar_plan2')
    return render(request, template_name, contexto)

def cambiar_plan(request, id):
    instance = models.ActividadPlan.objects.get(pk = id)
    instance.otro=instance.lugar
    instance.lugar='Otros'
    form = ActividadesModelForm(instance=instance)

    if request.method == 'POST':
        form = ActividadesModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            if(form.cleaned_data['lugar']!='Otros'):
                instance.lugar=form.cleaned_data['lugar']
                instance.save()
            else:
                instance.lugar=form.cleaned_data['otro']
                instance.save()
            instance.participantes.set(form.cleaned_data['participantes'])
            if(form.cleaned_data['contcheck']):
                emp=form.cleaned_data['contacto']
                for a in emp:
                
                    temp=models.Contacto.objects.get(nombre=a.nombre)
                
                    aa=temp.relacionados.all()
                    instance.participantes.add(*aa)
                    instance.save()
            logs(request, ActividadPlan, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_plan1)}})

    return render(request, 'P01/Planes/CambiarPlan.html', {'instance': instance, 'form': form})

def cambiar_plan1(request, id):
    instance = models.ActividadPlan.objects.get(pk = id)
    instance.otro=instance.lugar
    instance.lugar='Otros'
    form = ActividadesModelForm(instance=instance)

    if request.method == 'POST':
        form = ActividadesModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            if(form.cleaned_data['lugar']!='Otros'):
                instance.lugar=form.cleaned_data['lugar']
                instance.save()
            else:
                instance.lugar=form.cleaned_data['otro']
                instance.save()
            instance.participantes.set(form.cleaned_data['participantes'])
            if(form.cleaned_data['contcheck']):
                emp=form.cleaned_data['contacto']
                for a in emp:
                
                    temp=models.Contacto.objects.get(nombre=a.nombre)
                
                    aa=temp.relacionados.all()
                    instance.participantes.add(*aa)
                    instance.save()
            logs(request, ActividadPlan, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_plan2)}})

    return render(request, 'P01/Planes/CambiarPlan1.html', {'instance': instance, 'form': form})

def exportar_plan(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        models = ActividadPlan.objects.filter(activo = True)
        html_string = render_to_string(
            'P01/Planes/exportarPlan.html',
           {'models': models, 'owner': request.user, 'date': datetime.now()}
        )
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        main_doc = html.render(
            stylesheets=[CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                         CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                         CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                         ],
        )

        main_doc.write_pdf(
            target=os.path.join(uri_tmp, 'Planes.pdf'),
            zoom=0.75,
        )

        fs = FileSystemStorage(uri_tmp)
        with fs.open('Planes.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Planes.pdf"'
            return response

    return redirect(reverse_lazy('listar_plan'))

def exportar_plan1(request):
    if request.method == 'POST':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        filtered_data = request.POST.get('filtered_data')
        if filtered_data:
            filtered_data = json.loads(filtered_data)
            models = ActividadPlan.objects.filter(pk__in=filtered_data)
        
            html_string = render_to_string(
                'P01/Planes/exportarPlan1.html',
            {'models': models, 'owner': request.user, 'date': datetime.now()}
            )
            html = HTML(string=html_string, base_url=request.build_absolute_uri())
            uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
            main_doc = html.render(
                stylesheets=[
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                            CSS(string=".pdf-page { height: 100vh; }"),  # Establece el alto de la página al 100% de la altura de la ventana gráfica (viewport height)
                            CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                            ],
            )   

            main_doc.write_pdf(
                target=os.path.join(uri_tmp, 'Listado de actividades de empresa'+str(' ')+ str(datetime.now().date())+'.pdf'),
                zoom=0.75,
            )

            fs = FileSystemStorage(uri_tmp)
            with fs.open('Listado de actividades de empresa'+str(' ')+ str(datetime.now().date())+'.pdf') as pdf:
                response = HttpResponse(pdf, content_type='application/pdf')
                response['Content-Disposition'] = 'attachment; filename="Listado_de_Actividades_de_empresa_{}.pdf"'.format(datetime.now().date())
                return response

    return redirect(reverse_lazy('listar_plan1'))

def exportar_plan2(request):
    if request.method == 'POST':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        filtered_data = request.POST.get('filtered_data')
        if filtered_data:
            filtered_data = json.loads(filtered_data)
            models = ActividadPlan.objects.filter(pk__in=filtered_data)
        
            html_string = render_to_string(
                'P01/Planes/exportarPlan2.html',
            {'models': models, 'owner': request.user, 'date': datetime.now()}
            )
            html = HTML(string=html_string, base_url=request.build_absolute_uri())
            uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
            main_doc = html.render(
                stylesheets=[
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                            CSS(string=".pdf-page { height: 100vh; }"),  # Establece el alto de la página al 100% de la altura de la ventana gráfica (viewport height)
                            CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                            ],
            )   

            main_doc.write_pdf(
                target=os.path.join(uri_tmp, 'Listado de actividades de cuadros'+str(' ')+ str(datetime.now().date())+'.pdf'),
                zoom=0.75,
            )

            fs = FileSystemStorage(uri_tmp)
            with fs.open('Listado de actividades de cuadros'+str(' ')+ str(datetime.now().date())+'.pdf') as pdf:
                response = HttpResponse(pdf, content_type='application/pdf')
                response['Content-Disposition'] = 'attachment; filename="Listado_de_Actividades_de_cuadros_{}.pdf"'.format(datetime.now().date())
                return response

    return redirect(reverse_lazy('listar_plan2'))
@login_required
@permission_required('SISGDDO.view_auditoria_interna')
@handle_exceptions
def listar_auditoriainterna(request):
    datos = models.auditoria_interna.objects.filter(activo = True)
    contexto = {
       'lista': datos,
    }
    return render(request, 'P00/Auditorias Internas/auditoria_interna.html', contexto)

@login_required
@permission_required('SISGDDO.add_auditoria_interna')
@handle_exceptions
def agregar_auditoriaInt(request):
    form = AuditoriaInternaModelForm()
    uno = False 

    if request.method == 'POST':
        if  request.FILES.getlist('informe'):
            form = AuditoriaInternaModelForm(request.POST,request.FILES)
            uno=True    
        else: 
            form = AuditoriaInternaModelForm(request.POST)
        if form.is_valid():
            inc=auditoria_interna()
            inc.fechainicio=form.cleaned_data['fechainicio']
            inc.fechafin=form.cleaned_data['fechafin']
            inc.titulo=form.cleaned_data['titulo']
            inc.proceso=form.cleaned_data['proceso']
            resp = inc.proceso.responsible
            inc.responsable = resp
            inc.objetivos=form.cleaned_data['objetivos']
            inc.alcance=form.cleaned_data['alcance']
            inc.criterios=form.cleaned_data['criterios']
            inc.observaciones=form.cleaned_data['observaciones']
            if uno:
                file = form.files['informe']
                inc.informe=file
            inc.save()
            inc.equipo.set(form.cleaned_data['equipo'])
            inc.save()
            
            logs(request, auditoria_interna, inc, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_auditoriainterna)}})

    return render(request, 'P00/Auditorias Internas/crearAuditoriaInt.html', {'form': form})

def act_desactaudInter(request, id):
    valor = request.POST.get('activo')
    col = models.auditoria_interna.objects.get(id = id)
    col.activo = True if valor == "on" else False
    
    col.save()

@login_required
@permission_required('SISGDDO.view_auditoria_interna')
@handle_exceptions
def detalle_audiInt(request, id):
    objeto = models.auditoria_interna.objects.get(id = id)
    equipo = objeto.equipo.all()

    template_name = 'P00/Auditorias Internas/DetalleAuditoriaInterna.html'
    contexto = {
        'object' : objeto,   
        'equip'  : equipo,
     }
    return render(request, template_name, contexto)

@login_required
@permission_required('SISGDDO.change_auditoria_interna')
@handle_exceptions
def cambiar_auditoriasinternas(request, id):
    instance = models.auditoria_interna.objects.get(id = id)
    form = ModAuditoriaInternaModelForm(instance=instance)

    if request.method == 'POST':
        form = ModAuditoriaInternaModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, auditoria_interna, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_auditoriainterna)}})

    return render(request, 'P00/Auditorias Internas/CambiarAuditInt.html', {'instance': instance, 'form': form})

@login_required
@permission_required('SISGDDO.delete_auditoria_interna')

def eliminar_auditoriasinternas(request, id):
    objeto = models.auditoria_interna.objects.get(id = id)
    template_name = 'P00/Auditorias Internas/EliminarAuditoriasInternas.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.activo=False
        objeto.save()
        messages.success(request, "Auditoría eliminada con éxito")
        return redirect('listar_auditoriainterna')
    return render(request, template_name, contexto)

@login_required
@permission_required('SISGDDO.view_auditoria_interna')

def exportar_auditoriasinternas(request):
    if request.method == 'POST':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        filtered_data = request.POST.get('filtered_data')
        if filtered_data:
            filtered_data = json.loads(filtered_data)
            models = auditoria_interna.objects.filter(pk__in=filtered_data)
        
            html_string = render_to_string(
                'P00/Auditorias Internas/exportarAuditoriaInterna.html',
            {'models': models, 'owner': request.user, 'date': datetime.now()}
            )
            html = HTML(string=html_string, base_url=request.build_absolute_uri())
            uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
            main_doc = html.render(
                stylesheets=[
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                            CSS(string=".pdf-page { height: 100vh; }"),  # Establece el alto de la página al 100% de la altura de la ventana gráfica (viewport height)
                            CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                            ],
            )   

            main_doc.write_pdf(
                target=os.path.join(uri_tmp, 'Listado de Auditorias Internas'+str(' ')+ str(datetime.now().date())+'.pdf'),
                zoom=0.75,
            )

            fs = FileSystemStorage(uri_tmp)
            with fs.open('Listado de Auditorias Internas'+str(' ')+ str(datetime.now().date())+'.pdf') as pdf:
                response = HttpResponse(pdf, content_type='application/pdf')
                response['Content-Disposition'] = 'attachment; filename="Listado_de_Auditorias_Internas_{}.pdf"'.format(datetime.now().date())
                return response

    return redirect(reverse_lazy('listar_auditoriainterna'))
@login_required
@permission_required('SISGDDO.view_auditoria_externa')
@handle_exceptions
def listar_auditoriaexterna(request):
    datos = models.auditoria_externa.objects.filter(activo = True)
    contexto = {
       'lista': datos,
    }
    return render(request, 'P00/Auditorias Externas/auditoria_externa.html', contexto)
@login_required
@permission_required('SISGDDO.add_auditoria_externa')
@handle_exceptions
def agregar_auditoriaExt(request):
    form = AuditoriaExternaModelForm()
    uno = False
    dos = False
    tres = False
    cuatro = False
    if request.method == 'POST':
        if  request.FILES.getlist('informe'):
            if  request.FILES.getlist('plan_medidas'):
                form = AuditoriaExternaModelForm(request.POST,request.FILES)
                uno=True
                
            else: 
                form = AuditoriaExternaModelForm(request.POST,request.FILES)
                dos=True
        else:
            if  request.FILES.getlist('plan_medidas'):
                form = AuditoriaExternaModelForm(request.POST,request.FILES)
                tres=True
            else:
                form = AuditoriaExternaModelForm(request.POST)
                cuatro=True
            
        if form.is_valid():
            
            inc=auditoria_externa()
            inc.registro=form.cleaned_data['registro']
            inc.fechainicio=form.cleaned_data['fechainicio']
            inc.fechafin=form.cleaned_data['fechafin']
            inc.titulo=form.cleaned_data['titulo']
            
            if not cuatro:
                if  uno or dos:
                    file = form.files['informe']   
                    inc.informe=file
                if  uno or tres:
                    file2 = form.files['plan_medidas']
                    inc.plan_medidas=file2
                
            inc.entidad=form.cleaned_data['entidad']
            inc.resultados=form.cleaned_data['resultados']
            inc.observaciones=form.cleaned_data['observaciones']
            inc.save()
            inc.proceso.set(form.cleaned_data['proceso'])
            inc.save()
            logs(request, auditoria_externa, inc, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_auditoriaexterna)}})

    return render(request, 'P00/Auditorias Externas/crearAuditoriaExt.html', {'form': form})

def act_desactaudExter(request, id):
    valor = request.POST.get('activo')
    col = models.auditoria_externa.objects.get(id = id)
    col.activo = True if valor == "on" else False
    
    col.save()
@login_required
@permission_required('SISGDDO.view_auditoria_externa')
@handle_exceptions
def detalle_audiExt(request, id):
    objeto = models.auditoria_externa.objects.get(id = id)

    template_name = 'P00/Auditorias Externas/DetalleAuditoriaExterna.html'
    contexto = {
        'object' : objeto,   
    }
    return render(request, template_name, contexto)
@login_required
@permission_required('SISGDDO.change_auditoria_externa')
@handle_exceptions
def cambiar_auditoriasexternas(request, id):
    instance = models.auditoria_externa.objects.get(id = id)
    form = ModAuditoriaExternaModelForm(instance=instance)

    if request.method == 'POST':
        form = ModAuditoriaExternaModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, auditoria_externa, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_auditoriaexterna)}})

    return render(request, 'P00/Auditorias Externas/CambiarAuditExt.html', {'instance': instance, 'form': form})

@login_required
@permission_required('SISGDDO.delete_auditoria_externa')
@handle_exceptions
def eliminar_auditoriasexternas(request, id):
    objeto = models.auditoria_externa.objects.get(id = id)
    template_name = 'P00/Auditorias Externas/EliminarAuditoriasExternas.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.activo=False
        objeto.save()
        messages.success(request, "Auditoría eliminada con éxito")
        return redirect('listar_auditoriaexterna')
    return render(request, template_name, contexto)
@login_required
@permission_required('SISGDDO.view_auditoria_externa')

def exportar_auditoriasexternas(request):
    if request.method == 'POST':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        filtered_data = request.POST.get('filtered_data')
        if filtered_data:
            filtered_data = json.loads(filtered_data)
            models = auditoria_externa.objects.filter(pk__in=filtered_data)
        
            html_string = render_to_string(
                'P00/Auditorias Externas/exportarAuditoriaExterna.html',
            {'models': models, 'owner': request.user, 'date': datetime.now()}
            )
            html = HTML(string=html_string, base_url=request.build_absolute_uri())
            uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
            main_doc = html.render(
                stylesheets=[
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                            CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                            CSS(string=".pdf-page { height: 100vh; }"),  # Establece el alto de la página al 100% de la altura de la ventana gráfica (viewport height)
                            CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                                 logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                            ],
            )   

            main_doc.write_pdf(
                target=os.path.join(uri_tmp, 'Listado de Auditorias Externas'+str(' ')+ str(datetime.now().date())+'.pdf'),
                zoom=0.75,
            )

            fs = FileSystemStorage(uri_tmp)
            with fs.open('Listado de Auditorias Externas'+str(' ')+ str(datetime.now().date())+'.pdf') as pdf:
                response = HttpResponse(pdf, content_type='application/pdf')
                response['Content-Disposition'] = 'attachment; filename="Listado_de_Auditorias_Externas_{}.pdf"'.format(datetime.now().date())
                return response

    return redirect(reverse_lazy('listar_auditoriaexterna'))

@login_required
@handle_exceptions
def listar_contactos(request):
    contexto = {
        'lista': models.Contacto.objects.filter(activo = True)
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/contacto/contacto.html', contexto)

def agregar_contacto(request):
    form = Contacto_form()

    if request.method == 'POST':
        form = Contacto_form(request.POST)

        if form.is_valid():
            
            cont=Contacto()
            cont.nombre=form.cleaned_data['nombre']
            cont.save()
            cont.relacionados.set(form.cleaned_data['relacionados'])
            cont.save()
            
            logs(request, Contacto, cont, 1)
            return JsonResponse({'results': {'url': reverse_lazy(listar_contactos)}})

    return render(request, 'nomencladores/contacto/contacto_form.html', {'form': form})

@login_required
@handle_exceptions
def modificar_contacto(request, id):
    instance = models.Contacto.objects.get(id = id)
    form = Contacto_form(instance=instance)

    if request.method == 'POST':
        form = Contacto_form(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, auditoria_externa, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy(listar_contactos)}})

    return render(request, 'nomencladores/contacto/contacto_update_form.html', {'instance': instance, 'form': form})

@login_required
@handle_exceptions
def eliminar_contacto(request, id):
    objeto = models.Contacto.objects.get(id = id)
    template_name = 'nomencladores/contacto/contacto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.activo=False
        objeto.save()
        messages.success(request, "Contacto eliminado con éxito")
        return redirect('listar_contactos')
    return render(request, template_name, contexto)


