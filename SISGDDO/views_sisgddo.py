import os
import json
import sys
from django.contrib.auth.decorators import login_required
from django.contrib.admin.models import LogEntry
from django.shortcuts import render
from requests import request
from SISGDDO import models
from django.views.generic import ListView
import uuid
from django.template.loader import get_template
##from weasyprint import HTML,CSS
from datetime import date,timedelta,datetime
from base64 import b64encode
from dateutil import parser
from django.contrib.auth.models import Group,User
from django.template.loader import get_template
##from weasyprint import HTML
from ProyectoBaseApp import models as modelsadmin
from django.contrib import messages
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from notifications.signals import notify
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin
from SISGDDO import models, form
from SISGDDO.models import cliente, consecutivo, estado_indicador_objetivos, licencia, plan_medidas,estado_entradas_proyecto, entrada_proyecto, acuerdo,linea_tematica,incidencia,propiedad_industrial,proyecto,auditoria_externa,auditoria_interna,eficacia,area,proceso,curso,formato,estado_acuerdo,estado_proyecto,indicador,trabajador, trabajador_consecutivo, trabajador_proyecto
from SISGDDO.models import tipo_proyecto, fuente_financiamiento, formato, estado_entradas_proyecto, entidad, rol_trabajador_proyecto, objetivo, indicador_objetivos, accion_indicador_objetivo, estado_indicador_objetivos
from SISGDDO.models import tipo_codigo, premio
from SISGDDO.models import sosi
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
from xhtml2pdf import pisa
from SISGDDO.mis_validaciones import my_validates
from pathlib import Path
from django.core.files import File
import copy
from django.core.exceptions import ObjectDoesNotExist

def ControllerNotificaciones(licencias, proyectos, acuerdos, ahora):
    for p in proyectos:
        fechaterminacion = p.fecha_terminacion
        diferenciaproyectos = fechaterminacion - ahora
        days = int(diferenciaproyectos.days)
        if days < 15:
            p.estado = models.estado_proyecto.objects.get(id='2')
            for u in User.objects.filter(groups__name='Especialista del Grupo de Información'):
                notify.send(u, recipient=u, verb=_('El proyecto' + p.nombre_proyecto + 'está atrasado'),level='success')

    for a in acuerdos:
        fechacumplir = a.fecha_cumplir
        diferenciaacuerdos = fechacumplir - ahora
        days = int(diferenciaacuerdos.days)
        if days < 15:
            for u in User.objects.filter(groups__name='Director Dirección Organizacional'):
                notify.send(u, recipient=u, verb=_('El acuerdo' + str(a.id) + 'está proximo a vencer'), level='success')

    for l in licencias:
        fechavencimiento = l.fecha_venc
        diferencialicencia = fechavencimiento - ahora
        days = int(diferencialicencia.days)
        if days < 15:
            for u in User.objects.filter(groups__name='Jefe de Calidad y Auditoría'):
                notify.send(u, recipient=u, verb=_('La licencia' + l.nombre_lic + 'está proximo a vencer'),
                            level='success')

    if ahora.weekday() == 3 or ahora.weekday() == 4:
        for u in User.objects.filter(groups__name='Especialista de Calidad y Auditoría'):
            notify.send(u, recipient=u, verb=_('Usted debe realizar el informe de estado de los proyectos'),
                        level='success')

    if ahora.day == 20:
        for u in User.objects.filter(groups__name='Especialista del Grupo de Información'):
            notify.send(u, recipient=u, verb=_('Usted debe realizar el informe de proyectos atrasados'),
                        level='success')

def calculadias(request):
    ControllerNotificaciones(request)
    return render(request, "inicio.html")

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
            cantidad_acuerdos = models.acuerdos.objects.filter(fecha_tomada__month=m,fecha_tomada__year=year).count()
            data.append(cantidad_acuerdos)
        return data

    def get_grafico_espcalidaut(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_proyectos_terminados = models.proyecto.objects.filter(fecha_terminacion__month=m,fecha_terminacion__year=year).count()
            data.append(cantidad_proyectos_terminados)
        return data

    def get_grafico_espcap(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_cursos = models.curso.objects.filter(fecha__month=m,fecha__year=year).count()
            data.append(cantidad_cursos)
        return data

    def get_grafico_espinform(self):
        data = []
        year = datetime.now().year
        for m in range(1,13):
            cantidad_proyectos_iniciados= models.proyecto.objects.filter(fecha_inicio__month=m,fecha_inicio__year=year).count()
            data.append(cantidad_proyectos_iniciados)
        return data

    def get_grafico_rechumactivos(self):
        data = 0
        year = datetime.now().year
        for m in range(1,2):
            cantidad_trabajadores_activos= models.trabajador.objects.filter(activo=True).count()
            data = cantidad_trabajadores_activos
        return data

    def get_grafico_rechuminactivos(self):
        data = 0
        year = datetime.now().year
        for m in range(1,2):
            cantidad_trabajadores_inactivos= models.trabajador.objects.filter(activo=False).count()
            data = cantidad_trabajadores_inactivos
        return data


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['panel'] = 'Panel de Administracion'
        usuario = self.request.user
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


class DashboardGraficopastel(LoginRequiredMixin,TemplateView):
    template_name = 'reportes/pastel.html'

    def get_grafico_pastel(self):
        data = 0
        year = datetime.now().year
        for m in range(1,2):
            cantidad_procesos_eficaz= models.eficacia.objects.filter(eficaz=True).count()
            data = cantidad_procesos_eficaz
        return data

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['panel'] = 'Panel de Administracion'
        context['datos_grafico_pastel'] = self.get_grafico_pastel()
        return context

class DashboardGraficoLine(LoginRequiredMixin,TemplateView):
    template_name = 'reportes/line.html'

    def get_grafico_linea(self):
        data = 0
        year = datetime.now().year
        for m in range(1,2):
            cantidad_evaltotal_eficacia= models.eficacia.objects.filter(eval_tot=5).count()
            data = cantidad_evaltotal_eficacia
        return data

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['panel'] = 'Panel de Administracion'
        context['datos_grafico_linea'] = self.get_grafico_linea()
        return context

class CambiarLogotipo(LoginRequiredMixin,CreateView):
    model = models.CambiarLogotipo
    # form_class = form.cambiarlogoForm
    form_class = ''
    template_name = 'logo/cambiar_logo.html'
    success_url = reverse_lazy('inicio')

    def get_success_url(self):
        return reverse_lazy('inicio')

    def post(self, request, *args, **kwargs):
        forms = form.cambiarlogoForm(request.POST,request.FILES)
        if forms.is_valid():
            forms.save()
            id_logo = models.CambiarLogotipo.objects.last()
            register_logs(request, CambiarLogotipo, id_logo.pk, str(id_logo), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request, self.template_name, self.contexto)


#Vista del P14
@login_required()
def listar_incidencias(request):
    listincidencias = models.incidencias.objects.all()

    contexto = {
        'incidencias': listincidencias
    }
    return render(request, 'P14/incidencias.html', contexto)

@login_required()
def listar_reservasdecuadro(request):
    listreservas = models.trabajador.objects.filter(es_reserva=True)
    contexto = {
        'reservas': listreservas
    }
    return render(request, 'P14/reserva_cuadro.html', contexto)

@login_required()
def det_reservasdecuadro(request,pk):
    reserva = models.trabajador.objects.filter(pk=pk).get()
    contexto = {
        'reserva': reserva
    }
    return render(request, 'P14/reserva_cuadro_detail.html', contexto)

@login_required()
def det_cuadro(request,pk):
    cuadro = models.trabajador.objects.filter(pk=pk).get()
    contexto = {
        'cuadro': cuadro
    }
    return render(request, 'P14/cuadro_detail.html', contexto)

@login_required()
def listar_cuadro(request):
    listcuadros = models.trabajador.objects.filter(es_cuadro=True)
    contexto = {
        'cuadros': listcuadros
    }
    return render(request, 'P14/cuadro.html', contexto)

# @login_required()
# def listar_formaciontrabajador(request):
#     listform = models.trabajador.objects.all()
#     contexto = {
#         'form': listform
#     }
#     return render(request, 'P14/formacion_personal.html', contexto)


@login_required()
def listar_no_conformidad(request):
    listform = models.No_Conformidad.objects.all()
    contexto = {
        'no_conformidades': listform
    }
    return render(request, 'P14/no_conformidad.html', contexto)

class AcuerdosConsejoDetailView(LoginRequiredMixin,DetailView):
    model = acuerdo
    template_name = 'P14/acuerdo_detail.html'

    def get_success_url(self):
        return reverse_lazy('listar_acuerdos')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles del Acuerdo'
        context['list_url'] = reverse_lazy('listar_acuerdos')
        return context

# class ValoracionEncuestaDetailView(LoginRequiredMixin,DetailView):
#     model = Valoracion_encuesta
#     template_name = 'P00/Valoracion_encuesta_detail.html'

#     def get_success_url(self):
#         return reverse_lazy('listar_valencuesta')

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['title'] = 'Detalles de la valoración'
#         context['list_url'] = reverse_lazy('listar_valencuesta')
#         return context

# class formacion_personalUpdate(LoginRequiredMixin,UpdateView):
#     model = formacion_personal
#     form_class = form.formacionpersonalForm
#     template_name = 'P14/formacion_personal_update_form.html'

#     def get_success_url(self):
#         return reverse_lazy('listar_formacionpersonal')

#     def post(self, request, *args, **kwargs):
#         register_logs(request, formacion_personal, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Formación modificada con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)

class TrabajadorDetailView(LoginRequiredMixin,DetailView):
    model = trabajador
    template_name = 'entradadatos/trabajador_detail.html'

    def get_success_url(self):
        return reverse_lazy('listar_trabajadores')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles del Trabajador'
        context['list_url'] = reverse_lazy('listar_trabajadores')
        return context

class PlanMedidasDetailView(LoginRequiredMixin,DetailView):
    model = plan_medidas
    template_name = 'P00/plan_medidas_detail.html'

    def get_success_url(self):
        return reverse_lazy('listar_planmedidas')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles del Plan'
        context['list_url'] = reverse_lazy('listar_planmedidas')
        return context


@login_required()
def incidencias_create(request):
    if request.POST:
        forms = form.incidenciasForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_incidencia= incidencias.objects.last()
            register_logs(request, incidencias, id_incidencia.pk, id_incidencia.__str__(), 1)
            messages.success(request, "Incidencia creado con éxito")
            return HttpResponseRedirect('/listar/incidencias')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.incidenciasForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P14/incidencias_form.html', args)

#vistas #Javier #listar
@login_required()
def listar_area(request):
    contexto = {
        'lista': models.area.objects.all()
    }    

    return render(request, 'nomencladores/area/areas.html', contexto)

#Vistas del P00

def listar_visualizarincidencias(request):
    ##listincidencias = models.incidencias.objects.all()

    contexto = {
        ##'incidencias': listincidencias
    }
    return render(request, 'P00/incidencias.html', contexto)

@login_required()
def listar_licenciasxtrabajador(request):
    listlicencia= models.tipo_de_licencias.objects.all()
    contexto = {
        'listlicencia': listlicencia
    }
    return render(request, 'P00/tipo_de_licencias.html', contexto)

@login_required()
def Licencias_create(request):
    if request.POST:
        forms = form.licenciaForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_lic = tipo_de_licencias.objects.last()
            register_logs(request, tipo_de_licencias, id_lic.pk, id_lic.__str__(), 1)
            messages.success(request, "Entrada creada con éxito")
            return HttpResponseRedirect('/listar/licencias')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.licenciaForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P00/tipo_de_licencias_form.html', args)

class LicenciaUpdate(LoginRequiredMixin,UpdateView):
    model = licencia
    form_class = form.licenciaForm
    template_name = 'P00/tipo_de_licencias_update_form.html'
    success_url = reverse_lazy('listar_licencias')

    def get_success_url(self):
        return reverse_lazy('listar_licencias')

    def post(self, request, *args, **kwargs):
        register_logs(request, licencia, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Licencia modificada con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class LicenciasDetailView(LoginRequiredMixin,DetailView):
    model = licencia
    template_name = 'P00/tipo_de_licencias_detail.html'

    def get_success_url(self):
        return reverse_lazy('listar_licencias')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles de la Licencia'
        context['list_url'] = reverse_lazy('listar_licencias')
        return context


@login_required()
def listar_atencioncliente(request):
    listatecli= models.atencion_cliente_externo.objects.all()
    contexto = {
        'listatecli': listatecli
    }
    return render(request, 'P00/atencion_clientes_externos.html', contexto)

# @login_required()
# def atencioncliente_create(request):
#     if request.POST:
#         forms = form.atencion_cliente_externoForm(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_atencioncliente = atencion_cliente_externo.objects.last()
#             register_logs(request, atencion_cliente_externo, id_atencioncliente.pk, id_atencioncliente.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponseRedirect('/listar/atencioncliente')
#         else:
#             messages.error(request, "Error en el formulario")
#     else:
#         forms = form.atencion_cliente_externoForm()
#     args = {}

#     args['forms'] = forms
#     return render(request, 'P00/atencion_clientes_externos_form.html', args)


# class atencionclienteUpdate(LoginRequiredMixin,UpdateView):
#     model = atencion_cliente_externo
#     form_class = form.atencion_cliente_externoForm
#     template_name = 'P00/atencion_clientes_externos_update_form.html'
#     success_url = reverse_lazy('listar_ateclientext')

#     def get_success_url(self):
#         return reverse_lazy('listar_ateclientext')

#     def post(self, request, *args, **kwargs):
#         register_logs(request, atencion_cliente_externo, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Registro modificado con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)


# class AtencionClienteExternoDetailView(LoginRequiredMixin,DetailView):
#     model = atencion_cliente_externo
#     template_name = 'P00/atencion_clientes_externos_detail.html'


#     def get_success_url(self):
#         return reverse_lazy('listar_ateclientext')


#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['title'] = 'Detalles del Queja'
#         context['list_url'] = reverse_lazy('listar_ateclientext')
#         return context


class AuditoriaExternaDetailView(LoginRequiredMixin,DetailView):
    model = auditoria_interna
    template_name = 'P00/auditoria_internas_detail.html'


    def get_success_url(self):
        return reverse_lazy('listar_auditoriaext')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles del Auditoría'
        context['list_url'] = reverse_lazy('listar_auditoriaext')
        return context


class AuditoriaInternaDetailView(LoginRequiredMixin,DetailView):
    model = auditoria_interna
    template_name = 'P00/auditoria_internas_detail.html'


    def get_success_url(self):
        return reverse_lazy('listar_auditoriaint')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles del Auditoría'
        context['list_url'] = reverse_lazy('listar_auditoriaint')
        return context

@login_required()
def listar_auditoria_interno(request):
    listaudint= models.auditoria_interna.objects.all()
    contexto = {
        'listaudint': listaudint
    }
    return render(request, 'P00/auditoria_interna.html', contexto)

@login_required()
def auditoria_interna_create(request):
    if request.POST:
        forms = form.auditoria_internaForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_auditoria_interna = auditoria_interna.objects.last()
            register_logs(request, auditoria_interna, id_auditoria_interna.pk, id_auditoria_interna.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect('/listar/auditoriainterna')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.auditoria_internaForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P00/auditoria_interna_form.html', args)

@login_required()
def eficaciaajax(request):
    id = request.GET.get('proceso')
    LIndic = models.proceso.objects.get(id=id).indicador_eficacia_set.all().order_by('nombre_ind')
    result = ""
    for indic in LIndic:
        result += "<table border='1'><tr><th>"+indic.nombre_ind+"</th>" \
                  "<th>Calificación</th></tr>"
        for aspect in indic.aspecto_medir_indicadoreficacia_set.all():
            result += "<tr><td>" + aspect.nombre_asp + "</td>"
            result += "<td> <input type='number' name='" + str(aspect.id) + "' style='width: 40px;' max='5' min='1'></td></tr>"
        result += "</table><br>"
    return HttpResponse(result, content_type='application/json')


class EficaciaDetailView(LoginRequiredMixin,DetailView):
    model = eficacia
    template_name = 'P00/eficacia_procesos_detail.html'

    def get_success_url(self):
        return reverse_lazy('listar_eficacia')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles de la eficacia'
        context['list_url'] = reverse_lazy('listar_eficacia')
        return context

# It creates a new area.
class nomarea(LoginRequiredMixin,CreateView):
    model = area
    template_name = 'nomencladores/area/area_form.html'
    success_url = reverse_lazy("listar_areas")
    contexto = {
            'form' : form.area_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_areas')

    def post(self, request, *args, **kwargs):
        forms = form.area_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_area = area.objects.last()
            register_logs(request, area, id_area.pk, str(id_area), 1)
            messages.success(request, "Área creada con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

# It creates a new area.
class nomestado_acuerdo(LoginRequiredMixin,CreateView):
    model = estado_acuerdo
    template_name = 'nomencladores/estado_acuerdo/estado_acuerdo_form.html'
    success_url = reverse_lazy("listar_estado_acuerdo")
    contexto = {
            'form' : form.estado_acuerdo_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_estado_acuerdo')

    def post(self, request, *args, **kwargs):
        forms = form.estado_acuerdo_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_estado_acuerdo = estado_acuerdo.objects.last()
            register_logs(request, estado_acuerdo, id_estado_acuerdo.pk, str(id_estado_acuerdo), 1)
            messages.success(request, "Estado de acuerdo creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomestado_proyecto(LoginRequiredMixin,CreateView):
    model = estado_proyecto
    template_name = 'nomencladores/estado_proyecto/estado_proyecto_form.html'
    success_url = reverse_lazy("listar_estado_proyecto")
    contexto = {
            'form' : form.estado_proyecto_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_estado_proyecto')

    def post(self, request, *args, **kwargs):
        forms = form.estado_proyecto_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_estado_proyecto = estado_proyecto.objects.last()
            register_logs(request, estado_proyecto, id_estado_proyecto.pk, str(id_estado_proyecto), 1)
            messages.success(request, "Estado de proyecto creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(self.request, self.template_name, self.contexto)

class nomtipo_proyecto(LoginRequiredMixin,CreateView):
    model = tipo_proyecto
    template_name = 'nomencladores/tipo_proyecto/tipo_proyecto_form.html'
    success_url = reverse_lazy("listar_tipo_proyecto")
    contexto = {
            'form' : form.tipo_proyecto_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_tipo_proyecto')

    def post(self, request, *args, **kwargs):
        forms = form.tipo_proyecto_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_tipo_proyecto = tipo_proyecto.objects.last()
            register_logs(request, tipo_proyecto, id_tipo_proyecto.pk, str(id_tipo_proyecto), 1)
            messages.success(request, "Fuente de financiamiento creada con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomtipo_codigo(LoginRequiredMixin,CreateView):
    model = tipo_codigo
    template_name = 'nomencladores/tipo_codigo/tipo_codigo_form.html'
    success_url = reverse_lazy("listar_tipo_codigo")
    contexto = {
            'form' : form.tipo_codigo_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_tipo_codigo')

    def post(self, request, *args, **kwargs):
        forms = form.tipo_codigo_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_tipo_codigo = tipo_codigo.objects.last()
            register_logs(request, tipo_codigo, id_tipo_codigo.pk, str(id_tipo_codigo), 1)
            messages.success(request, "Fuente de financiamiento creada con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomfuente_financiamiento(LoginRequiredMixin,CreateView):
    model = fuente_financiamiento
    template_name = 'nomencladores/fuente_financiamiento/fuente_financiamiento_form.html'
    success_url = reverse_lazy("listar_fuente_financiamiento")
    contexto = {
            'form' : form.fuente_financiamiento_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_fuente_financiamiento')

    def post(self, request, *args, **kwargs):
        forms = form.fuente_financiamiento_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_fuente_financiamiento = fuente_financiamiento.objects.last()
            register_logs(request, fuente_financiamiento, id_fuente_financiamiento.pk, str(id_fuente_financiamiento), 1)
            messages.success(request, "Estado de proyecto creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(self.request, self.template_name, self.contexto)

class nomformato(LoginRequiredMixin,CreateView):
    model = formato
    template_name = 'nomencladores/formato/formato_form.html'
    success_url = reverse_lazy("listar_formato")
    contexto = {
            'form' : form.formato_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_formato')

    def post(self, request, *args, **kwargs):
        forms = form.formato_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_formato = formato.objects.last()
            register_logs(request, formato, id_formato.pk, str(id_formato), 1)
            messages.success(request, "Formato creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomentidad(LoginRequiredMixin,CreateView):
    model = entidad
    template_name = 'nomencladores/entidad/entidad_form.html'
    success_url = reverse_lazy("listar_entidad")
    contexto = {
            'form' : form.entidad_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_entidad')

    def post(self, request, *args, **kwargs):
        forms = form.entidad_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_entidad = entidad.objects.last()
            register_logs(request, entidad, id_entidad.pk, str(id_entidad), 1)
            messages.success(request, "Entidad creada con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomestado_entrada(LoginRequiredMixin,CreateView):
    model = estado_entradas_proyecto
    template_name = 'nomencladores/estado_entrada/estado_entrada_form.html'
    success_url = reverse_lazy("listar_estado_entrada")
    contexto = {
            'form' : form.estado_entradas_proyecto_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_estado_entrada')

    def post(self, request, *args, **kwargs):
        forms = form.estado_entradas_proyecto_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_estado_entrada = estado_entradas_proyecto.objects.last()
            register_logs(request, estado_entradas_proyecto, id_estado_entrada.pk, str(id_estado_entrada), 1)
            messages.success(request, "Estado de entrada creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomestado_indicador(LoginRequiredMixin,CreateView):
    model = estado_indicador_objetivos
    template_name = 'nomencladores/estado_indicador/estado_indicador_form.html'
    success_url = reverse_lazy("listar_estado_indicador")
    contexto = {
            'form' : form.estado_indicador_objetivos_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_estado_indicador')

    def post(self, request, *args, **kwargs):
        forms = form.estado_indicador_objetivos_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_estado_indicador = estado_indicador_objetivos.objects.last()
            register_logs(request, estado_indicador_objetivos, id_estado_indicador.pk, str(id_estado_indicador), 1)
            messages.success(request, "Estado de indicador creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomrol_trabajador_proyecto(LoginRequiredMixin,CreateView):
    model = rol_trabajador_proyecto
    template_name = 'nomencladores/rol_trabajador_proyecto/rol_trabajador_proyecto_form.html'
    success_url = reverse_lazy("listar_rol_trabajador_proyecto")
    contexto = {
            'form' : form.rol_trabajador_proyecto_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_rol_trabajador_proyecto')

    def post(self, request, *args, **kwargs):
        forms = form.rol_trabajador_proyecto_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_rol_trabajador_proyecto = rol_trabajador_proyecto.objects.last()
            register_logs(request, rol_trabajador_proyecto, id_rol_trabajador_proyecto.pk, str(id_rol_trabajador_proyecto), 1)
            messages.success(request, "Rol en el proyecto creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)


def nomconsecutivo(request):
    tcod = tipo_codigo.objects.filter(activo = True)
    tproy = tipo_proyecto.objects.filter(activo = True)
    tareas = area.objects.filter(activo = True)
    tformatos = formato.objects.filter(activo = True)
    ttrab = trabajador.objects.filter(activo = True)
    tlin = linea_tematica.objects.filter(activo = True)
    test = estado_proyecto.objects.filter(activo = True)
    tfue = fuente_financiamiento.objects.filter(activo = True)

    template_name = 'P01/consecutivo/consecutivo_form.html'
    # success_url = reverse_lazy("listar_consecutivo")
    contexto = {
        'no' : form.consecutivo_form.Meta.get_no_consecutivo(),
        'tproy' : tproy,
        'tcod' : tcod,
        'tareas' : tareas,
        'tformatos' : tformatos,
        'ttrab' : ttrab,
        'tlin' : tlin,
        'test' : test,
        'tfue' : tfue,
        'previouscode' : form.consecutivo_form.Meta.get_codigo(),
        'vistaProy' : False
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.consecutivo_form(request.POST, request.FILES)
        response = {}

        eo = consecutivo.objects.filter(no = form.consecutivo_form.Meta.get_no_consecutivo())
        if len(eo):
            response['result'] = 'error'
            response['message'] = 'El NO. del consecutivo ya existe'
            return JsonResponse(response)

        ec = consecutivo.objects.filter(codigo = forms['codigo'].value())
        if len(ec):
            response['result'] = 'error'
            response['message'] = 'El Código del consecutivo ya existe'
            return JsonResponse(response)

        en = consecutivo.objects.filter(nombre_proyecto = forms['nombre_proyecto'].value())
        if len(en):
            response['result'] = 'error'
            response['message'] = 'El Nombre del consecutivo ya existe'
            return JsonResponse(response)
        
        objeto = consecutivo.objects.create(
                no = form.consecutivo_form.Meta.get_no_consecutivo(),
                tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
                codigo = forms['codigo'].value(),
                fecha_entrada = forms['fecha_entrada'].value(),
                nombre_proyecto = forms['nombre_proyecto'].value(),
                tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                area = area.objects.get(pk = forms['area'].value()),                
                fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_inicio = forms['fecha_inicio'].value(),
                fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
                fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                fecha_cierre = forms['fecha_cierre'].value() if forms['fecha_cierre'].value() else None,
                costo = forms['costo'].value(),
                observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
                estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                activo = forms['activo'].value()    
            )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                objeto.formato.add(felem)
            except:
                pass

        trabajador_consecutivo.objects.create(
            trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
            consecutivo = objeto,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        )

        objeto.save()  

        proy = proyecto.objects.create(
                no = form.consecutivo_form.Meta.get_no_consecutivo(),
                tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
                codigo = forms['codigo'].value(),
                fecha_entrada = forms['fecha_entrada'].value(),
                nombre_proyecto = forms['nombre_proyecto'].value(),
                tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                area = area.objects.get(pk = forms['area'].value()),                
                fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_inicio = forms['fecha_inicio'].value(),
                fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
                fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                fecha_cierre = forms['fecha_cierre'].value() if forms['fecha_cierre'].value() else None,
                costo = forms['costo'].value(),
                observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
                estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                activo = forms['activo'].value(),
                consecutivo = objeto   
            )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                proy.formato.add(felem)
            except:
                pass

        trabajador_proyecto.objects.create(
            trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
            proyecto = proy,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        )

        proy.save()

        # def register_logs(request, model, object_id, object_unicode, action):
        # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
        register_logs(request, consecutivo, consecutivo.id, str(consecutivo), 1)
        register_logs(request, proy, proy.id, str(proy), 1)

        response['result'] = 'success'
        response['message'] = 'Consecutivo y Proyecto creados con éxito.'
        return JsonResponse(response)

@login_required
def nomentrada_proyecto(request, id):
    proy = proyecto.objects.get(consecutivo = id)

    lista = entrada_proyecto.objects.filter(proyecto = proy)

    tformatos = formato.objects.filter(activo = True)
    ttrab = trabajador.objects.filter(activo = True)
    test = estado_entradas_proyecto.objects.filter(activo = True)

    template_name = 'P01/entrada_proyecto/entrada_proyecto_form.html'
    contexto = {
        'lista' : lista,
        'proy' : proy,
        'tformatos' : tformatos,
        'ttrab' : ttrab,
        'test' : test,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.entrada_proyecto_form(request.POST, request.FILES)

        formatos = forms['formato'].value()
        for f in formatos:
            try:
                ff = formato.objects.get(id = f)
                try:
                    y = proy.formato.get(id = f)
                except:
                    response = {}
                    response['result'] = 'error'
                    response['message'] = 'Uno de los formatos no fue aprobado inicialmente.'
                    return JsonResponse(response)
            except:
                return HttpResponse(status = 500)

        entrada = entrada_proyecto.objects.create(
            proyecto = proy,
            fecha_entrada = datetime.now().strftime('%Y-%m-%d'),
            fecha_salida = forms['fecha_salida'].value(),
            entregado_por = trabajador.objects.get(pk = forms['entregado_por'].value()),
            dictamen = forms['dictamen'].value() if forms['dictamen'].value() else None,
            estado = estado_entradas_proyecto.objects.get(pk = forms['estado'].value()),
            activo = forms['activo'].value(),   
        )

        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""     
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                entrada.formato.add(felem)
            except:
                pass

        entrada.save()  
        register_logs(request, entrada, entrada.pk, str(entrada), 1)
        response = {}
        response['result'] = 'success'
        response['message'] = 'Entrada de proyecto creada con éxito'
        return JsonResponse(response)

@login_required
def nomsosi(request, id):
    consec = consecutivo.objects.get(id = id)

    ttrab = trabajador.objects.filter(activo = True)

    success_url = reverse_lazy('listar_sosi')

    template_name = 'P01/sosi/sosi_form.html'
    contexto = {
        'consec' : consec,
        'ttrab' : ttrab,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.sosi_form(request.POST, request.FILES)

        ent = sosi.objects.create(
            numero_salva = forms['numero_salva'].value(),
            fecha = datetime.now().strftime('%Y-%m-%d'),
            anno = forms['anno'].value() if forms['anno'].value() else None,
            especialista = trabajador.objects.get(pk = forms['especialista'].value()),
            autor = forms['autor'].value() if forms['autor'].value() else None,
            ubicacion_salva = forms['ubicacion_salva'].value() if forms['ubicacion_salva'].value() else None,
            observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None,
            archivo = forms['archivo'].value(),
            eliminado = forms['eliminado'].value(),  
            consecutivo = consec,
        )

        register_logs(request, ent, ent.pk, str(ent), 1)
        return HttpResponseRedirect(success_url)

@login_required
def nomindicador_objetivo(request, id = 0):
    test = estado_indicador_objetivos.objects.filter(activo = True)
    tobj = objetivo.objects.filter(activo = True)
    tacc = accion_indicador_objetivo.objects.filter(activo = True)

    if id != 0:
        try:
            obj = objetivo.objects.get(id = id)
            contexto_obj = {
                'obj' : obj,
            }
        except:
            return HttpResponse(status = 500)

    template_name = 'P01/indicador_objetivo/indicador_objetivo_form.html'
    success_url = reverse_lazy("listar_indicador_objetivo")
    contexto = {
        'test' : test,
        'tobj' : tobj,
        'tacc' : tacc,
    }

    try:
        contexto.update(contexto_obj)
    except:
        pass

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.indicador_objetivo_form(request.POST)

        eo = indicador_objetivos.objects.filter(nombre = forms['nombre'].value())
        if len(eo):
            messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['message'] = 'El NO. del consecutivo ya existe'
            # return JsonResponse(response)

        obj = indicador_objetivos.objects.create(
            nombre = forms['nombre'].value(),
            estado = estado_indicador_objetivos.objects.get(pk = forms['estado'].value()),
            objetivo = objetivo.objects.get(pk = forms['objetivo'].value()) if forms['objetivo'].value() else None,
            activo = forms['activo'].value()    
        )

        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        acciones = forms['accion'].value()
        for f in acciones:
            try:
                felem = accion_indicador_objetivo.objects.get(pk = f)
                felem.update(
                    indicador = obj,
                )
            except:
                pass

        register_logs(request, obj, obj.pk, str(obj), 1)
        messages.success(request, "Indicador de objetivo creado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def nomaccion_indicador_objetivo(request, id = 0):
    tarea = area.objects.filter(activo = True)
    tind = indicador_objetivos.objects.filter(activo = True)

    if id != 0:
        try:
            ind = indicador_objetivos.objects.get(id = id)
            contexto_obj = {
                'ind' : ind,
            }
        except:
            return HttpResponse(status = 500)

    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_form.html'
    success_url = reverse_lazy("listar_accion_indicador_objetivo")
    contexto = {
        'tarea' : tarea,
        'tind' : tind,
    }

    try:
        contexto.update(contexto_obj)
    except:
        pass

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.accion_indicador_objetivo_form(request.POST)

        ac = accion_indicador_objetivo.objects.create(
            nombre = forms['nombre'].value(),
            indicador = indicador_objetivos.objects.get(pk = forms['indicador'].value()),
            area = area.objects.get(pk = forms['area'].value()),
            activo = forms['activo'].value()    
        )

        register_logs(request, ac, ac.pk, str(ac), 1)
        messages.success(request, "Acción de indicador de objetivo creada con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def nomproyecto(request):
    tcod = tipo_codigo.objects.filter(activo = True)
    tproy = tipo_proyecto.objects.filter(activo = True)
    tareas = area.objects.filter(activo = True)
    tformatos = formato.objects.filter(activo = True)
    ttrab = trabajador.objects.filter(activo = True)
    tlin = linea_tematica.objects.filter(activo = True)
    test = estado_proyecto.objects.filter(activo = True)
    tfue = fuente_financiamiento.objects.filter(activo = True)

    # el template es consecutivo # template proyecto_form no existe
    template_name = 'P01/proyecto/proyecto_form.html'
    success_url = reverse_lazy("listar_proyecto")
    contexto = {
        'no' : form.consecutivo_form.Meta.get_no_consecutivo(),
        'tproy' : tproy,
        'tcod' : tcod,
        'tareas' : tareas,
        'tformatos' : tformatos,
        'ttrab' : ttrab,
        'tlin' : tlin,
        'test' : test,
        'tfue' : tfue,
        'previouscode' : form.consecutivo_form.Meta.get_codigo(),
        'vistaProy' : True
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.consecutivo_form(request.POST, request.FILES)
        response = {}

        eo = consecutivo.objects.filter(no = form.consecutivo_form.Meta.get_no_consecutivo())
        if len(eo):
            response['result'] = 'error'
            response['message'] = 'El NO. del consecutivo ya existe'
            return JsonResponse(response)

        ec = consecutivo.objects.filter(codigo = forms['codigo'].value())
        if len(ec):
            response['result'] = 'error'
            response['message'] = 'El Código del consecutivo ya existe'
            return JsonResponse(response)

        en = consecutivo.objects.filter(nombre_proyecto = forms['nombre_proyecto'].value())
        if len(en):
            response['result'] = 'error'
            response['message'] = 'El Nombre del consecutivo ya existe'
            return JsonResponse(response)

        objeto = consecutivo.objects.create(
                no = form.consecutivo_form.Meta.get_no_consecutivo(),
                tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
                codigo = forms['codigo'].value(),
                fecha_entrada = forms['fecha_entrada'].value(),
                nombre_proyecto = forms['nombre_proyecto'].value(),
                tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                area = area.objects.get(pk = forms['area'].value()),                
                fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_inicio = forms['fecha_inicio'].value(),
                fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
                fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                fecha_cierre = forms['fecha_cierre'].value(),
                costo = forms['costo'].value(),
                observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
                estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                activo = forms['activo'].value()    
            )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                objeto.formato.add(felem)
            except:
                pass

        trabajador_consecutivo.objects.create(
            trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
            consecutivo = objeto,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        )

        objeto.save()  

        proy = proyecto.objects.create(
                no = form.consecutivo_form.Meta.get_no_consecutivo(),
                tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
                codigo = forms['codigo'].value(),
                fecha_entrada = forms['fecha_entrada'].value(),
                nombre_proyecto = forms['nombre_proyecto'].value(),
                tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                area = area.objects.get(pk = forms['area'].value()),                
                fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_inicio = forms['fecha_inicio'].value(),
                fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
                fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                fecha_cierre = forms['fecha_cierre'].value(),
                costo = forms['costo'].value(),
                observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
                estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                activo = forms['activo'].value(),
                consecutivo = objeto   
            )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                proy.formato.add(felem)
            except:
                pass

        trabajador_proyecto.objects.create(
            trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
            proyecto = proy,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        )        

        trabajador_proyecto.objects.create(
            trabajador = trabajador.objects.get(pk = forms['especialista_calidad'].value()),
            proyecto = proy,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Especialista de calidad')
        )

        trabajador_proyecto.objects.create(
            trabajador = trabajador.objects.get(pk = forms['disennador'].value()),
            proyecto = proy,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Diseñador')
        )

        proy.save()

        register_logs(request, consecutivo, consecutivo.pk, str(consecutivo), 1)
        register_logs(request, proy, proy.pk, str(proy), 1)

        response['result'] = 'success'
        response['message'] = 'Consecutivo y Proyecto creados con éxito.'
        return JsonResponse(response)

@login_required
def nomobjetivo(request):
    tind = indicador_objetivos.objects.filter(activo = True)

    template_name = 'P01/objetivo/objetivo_form.html'
    success_url = reverse_lazy("listar_objetivo")
    contexto = {
        'tind' : tind,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.objetivo_form(request.POST)

        eo = objetivo.objects.filter(nombre = forms['nombre'].value())
        if len(eo):
            messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['message'] = 'El NO. del consecutivo ya existe'
            # return JsonResponse(response)

        obj = objetivo.objects.create(
            nombre = forms['nombre'].value(),
            fecha_definicion = forms['fecha_definicion'].value(),                
            activo = forms['activo'].value()    
        )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        indicadores = forms['indicador'].value()
        for f in indicadores:
            try:
                felem = indicador_objetivos.objects.get(pk = f)
                felem.update(
                    objetivo = obj,
                )
            except:
                pass

        register_logs(request, obj, obj.pk, str(obj), 1)

        messages.success(request, "Objetivo creado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def nompremio(request):
    tent = entidad.objects.filter(activo = True)

    template_name = 'P01/premio/premio_form.html'
    success_url = reverse_lazy("listar_premio")
    contexto = {
        'tent' : tent,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.premio_form(request.POST, request.FILES)
        response = {}

        eo = premio.objects.filter(nombre = forms['nombre'].value())
        if len(eo):
            messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['message'] = 'El NO. del consecutivo ya existe'
            # return JsonResponse(response)

        premio.objects.create(
            nombre = forms['nombre'].value(),
            entidad = entidad.objects.get(pk = forms['entidad'].value()),
            fecha = forms['fecha'].value(),
            archivo = forms['archivo'].value() if forms['archivo'].value() else None,
            activo = forms['activo'].value()    
        )

        register_logs(request, premio, premio.pk, str(premio), 1)
        messages.success(request, "Premio creado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def nomacuerdo(request):
    ttrab = trabajador.objects.filter(activo = True)
    test = estado_acuerdo.objects.filter(activo = True)

    template_name = 'P01/acuerdo/acuerdo_form.html'
    success_url = reverse_lazy("listar_acuerdo")
    contexto = {
        'ttrab' : ttrab,
        'test' : test,
        'numero' : form.acuerdo_form.Meta.get_no_acuerdo(),
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.acuerdo_form(request.POST)

        ac = acuerdo.objects.create(
            numero = form.acuerdo_form.Meta.get_no_acuerdo(),
            nombre = forms['nombre'].value(),
            fecha = forms['fecha'].value(),
            fecha_limite = forms['fecha_limite'].value() if forms['fecha_limite'].value() else None,
            fecha_cumplimiento = forms['fecha_cumplimiento'].value() if forms['fecha_cumplimiento'].value() else None,
            observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None,
            estado = estado_acuerdo.objects.get(pk = forms['estado'].value()),
            activo = forms['activo'].value()    
        )

        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        responsables = forms['trabajador'].value()
        for f in responsables:
            try:
                felem = trabajador.objects.get(pk = f)
                ac.trabajador.add(felem)
            except:
                pass

        ac.save()

        register_logs(request, ac, ac.pk, str(ac), 1)
        messages.success(request, "Acuerdo creado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def premio_update(request, id):
    objeto = premio.objects.get(id = id) 

    tent = entidad.objects.filter(activo = True)

    template_name = 'P01/premio/premio_update_form.html'
    success_url = reverse_lazy("listar_premio")
    contexto = {
        'objeto' : objeto,
        'tent' : tent,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.premio_form(request.POST, request.FILES)

        eo = premio.objects.filter(nombre = forms['nombre'].value())
        if len(eo) and eo[0].id != objeto.id:
            messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['message'] = 'El NO. del consecutivo ya existe'
            # return JsonResponse(response)

        pr = premio.objects.filter(id = id) 

        pr.update(
            nombre = forms['nombre'].value(),
            entidad = entidad.objects.get(pk = forms['entidad'].value()),
            fecha = forms['fecha'].value(),
            archivo = forms['archivo'].value() if forms['archivo'].value() else None,
            activo = forms['activo'].value()    
        )

        register_logs(request, pr, pr.pk, str(pr), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def objetivo_update(request, id):
    objeto = objetivo.objects.get(id = id) 

    tind = indicador_objetivos.objects.filter(activo = True)
    myind = indicador_objetivos.objects.filter(activo = True, objetivo = objeto)

    template_name = 'P01/objetivo/objetivo_update_form.html'
    success_url = reverse_lazy("listar_objetivo")
    contexto = {
        'objeto' : objeto,
        'tind' : tind,
        'myind' : myind,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.objetivo_form(request.POST)

        eo = objetivo.objects.filter(nombre = forms['nombre'].value())
        if len(eo) and eo[0].id != objeto.id:
            messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['message'] = 'El NO. del consecutivo ya existe'
            # return JsonResponse(response)

        pr = objetivo.objects.filter(id = id) 

        pr.update(
            nombre = forms['nombre'].value(),
            fecha_definicion = forms['fecha_definicion'].value(),
            activo = forms['activo'].value()    
        )

        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        indicadores = forms['indicador'].value()
        for f in indicadores:
            try:
                felem = indicador_objetivos.objects.get(pk = f)
                felem.update(
                    objetivo = pr,
                )
            except:
                pass

        register_logs(request, pr, pr.pk, str(pr), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def indicador_objetivo_update(request, id):
    objeto = indicador_objetivos.objects.get(id = id) 
    tobj = objetivo.objects.filter(activo = True)
    test = estado_indicador_objetivos.objects.filter(activo = True)
    tacc = accion_indicador_objetivo.objects.filter(activo = True)

    myacc = accion_indicador_objetivo.objects.filter(indicador = objeto)    

    template_name = 'P01/indicador_objetivo/indicador_objetivo_update_form.html'
    success_url = reverse_lazy("listar_indicador_objetivo")
    contexto = {
        'objeto' : objeto,
        'tobj' : tobj,
        'test' : test,        
        'tacc' : tacc,
        'myacc' : myacc,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.indicador_objetivo_form(request.POST)

        eo = indicador_objetivos.objects.filter(nombre = forms['nombre'].value())
        if len(eo) and eo[0].id != objeto.id:
            messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['message'] = 'El NO. del consecutivo ya existe'
            # return JsonResponse(response)

        pr = indicador_objetivos.objects.filter(id = id) 

        pr.update(
            nombre = forms['nombre'].value(),
            estado = estado_indicador_objetivos.objects.get(pk = forms['estado'].value()),
            objetivo = objetivo.objects.get(pk = forms['objetivo'].value()) if forms['objetivo'].value() else None,
            activo = forms['activo'].value()   
        )

        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        acciones = forms['accion'].value()
        for f in acciones:
            try:
                felem = accion_indicador_objetivo.objects.get(pk = f)
                felem.update(
                    indicador = objeto
                )
            except:
                pass

        register_logs(request, pr, pr.pk, str(pr), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def accion_indicador_objetivo_update(request, id):
    objeto = accion_indicador_objetivo.objects.get(id = id) 
    
    tarea = area.objects.filter(activo = True)
    tind = indicador_objetivos.objects.filter(activo = True)    

    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_update_form.html'
    success_url = reverse_lazy("listar_accion_indicador_objetivo")
    contexto = {
        'objeto' : objeto,
        'tarea' : tarea,
        'tind' : tind,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.indicador_objetivo_form(request.POST)

        # nombre = forms['nombre'].value()
        # eo = my_validates.existe_objeto('nombre', nombre, indicador_objetivo)
        # if eo:
        #     return HttpResponse('Ya existe este nombre', status = 400)

        pr = accion_indicador_objetivo.objects.filter(id = id) 

        pr.update(
            nombre = forms['nombre'].value(),
            objetivo = indicador_objetivos.objects.get(pk = forms['indicador'].value()),
            area = area.objects.get(pk = forms['area'].value()),
            activo = forms['activo'].value()   
        )

        register_logs(request, pr, pr.pk, str(pr), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def acuerdo_update(request, id):
    objeto = acuerdo.objects.get(id = id) 

    ttrab = trabajador.objects.filter(activo = True)
    test = estado_acuerdo.objects.filter(activo = True)
    myworkers = objeto.trabajador.all()

    template_name = 'P01/acuerdo/acuerdo_update_form.html'
    success_url = reverse_lazy("listar_acuerdo")
    contexto = {
        'objeto' : objeto,
        'ttrab' : ttrab,
        'test' : test,
        'myworkers' : myworkers,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.acuerdo_form(request.POST, request.FILES)

        # eo = my_validates.existe_objeto('nombre', forms['nombre'].value(), acuerdo)
        # if eo:
        #     return HttpResponse('Ya existe este nombre', status = 400)

        ac = acuerdo.objects.filter(id = id) 

        ac.update(
            nombre = forms['nombre'].value(),
            fecha = forms['fecha'].value(),
            fecha_limite = forms['fecha_limite'].value() if forms['fecha_limite'].value() else None,
            fecha_cumplimiento = forms['fecha_cumplimiento'].value() if forms['fecha_cumplimiento'].value() else None,
            observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None,
            estado = estado_acuerdo.objects.get(pk = forms['estado'].value()),
            activo = forms['activo'].value() 
        )

        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        objeto.trabajador.clear()
        responsables = forms['trabajador'].value()
        for f in responsables:
            try:
                felem = trabajador.objects.get(pk = f)
                objeto.trabajador.add(felem)
            except:
                pass

        objeto.save()

        register_logs(request, objeto, objeto.pk, str(objeto), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

class nomfuente_financiamiento(LoginRequiredMixin,CreateView):
    model = fuente_financiamiento
    template_name = 'nomencladores/fuente_financiamiento/fuente_financiamiento_form.html'
    success_url = reverse_lazy("listar_fuente_financiamiento")
    contexto = {
            'form' : form.fuente_financiamiento_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_fuente_financiamiento')

    def post(self, request, *args, **kwargs):
        forms = form.fuente_financiamiento_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_fuente_financiamiento = fuente_financiamiento.objects.last()
            register_logs(request, fuente_financiamiento, id_fuente_financiamiento.pk, str(id_fuente_financiamiento), 1)
            messages.success(request, "Fuente de financiamiento creada con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class area_update(LoginRequiredMixin, UpdateView):
    model = area
    form_class = form.area_form
    template_name = 'nomencladores/area/area_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_areas')

    def post(self, request, *args, **kwargs):
        register_logs(request, area, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required()
def eliminar_area(request, id):
    objeto = models.area.objects.get(id = id)
    template_name = 'nomencladores/area/area_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Área eliminada con éxito")
        # def register_logs(request, model, object_id, object_unicode, action):
        # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
        register_logs(request, area, area.id, str(area), 3)
        return redirect('listar_areas')

    return render(request, template_name, contexto)

@login_required()
def eliminar_rol_trabajador_consecutivo(request, id):
    objeto = models.rol_trabajador_consecutivo.objects.get(id = id)
    template_name = 'nomencladores/rol_trabajador_consecutivo/rol_trabajador_consecutivo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Rol trabajador-consecutivo eliminado con éxito")
        return redirect('listar_rol_trabajador_consecutivo')
    return render(request, template_name, contexto)

@login_required()
def eliminar_rol_trabajador_proyecto(request, id):
    objeto = models.rol_trabajador_proyecto.objects.get(id = id)
    template_name = 'nomencladores/rol_trabajador_proyecto/rol_trabajador_proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Rol trabajador-proyecto eliminado con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_rol_trabajador_proyecto')
    return render(request, template_name, contexto)

@login_required()
def eliminar_consecutivo(request, id):
    objeto = models.consecutivo.objects.get(id = id)
    template_name = 'P01/consecutivo/consecutivo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Consecutivo y Proyecto eliminados con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_consecutivo')
    return render(request, template_name, contexto)

@login_required()
def eliminar_entrada_proyecto(request, id):
    objeto = models.entrada_proyecto.objects.get(id = id)
    consec = objeto.proyecto.consecutivo
    template_name = 'P01/entrada_proyecto/entrada_proyecto_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Entrada de proyecto eliminada con éxito")
        url = reverse('adicionar_entrada_proyecto', kwargs={'id': consec.id})
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return HttpResponseRedirect(url)
        
    return render(request, template_name, contexto)

@login_required()
def eliminar_premio(request, id):
    objeto = models.premio.objects.get(id = id)

    template_name = 'P01/premio/premio_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Premio eliminado con éxito")
        register_logs(request, objeto, objeto.pk, str(objeto), 3)
        return redirect('listar_premio')
        
    return render(request, template_name, contexto)

@login_required()
def eliminar_acuerdo(request, id):
    objeto = models.acuerdo.objects.get(id = id)

    template_name = 'P01/acuerdo/acuerdo_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Premio eliminado con éxito")
        register_logs(request, objeto, objeto.pk, str(objeto), 3)
        return redirect('listar_acuerdo')
        
    return render(request, template_name, contexto)

@login_required()
def eliminar_objetivo(request, id):
    objeto = models.objetivo.objects.get(id = id)

    template_name = 'P01/objetivo/objetivo_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Objetivo eliminado con éxito")
        register_logs(request, objeto, objeto.pk, str(objeto), 3)
        return redirect('listar_objetivo')
        
    return render(request, template_name, contexto)

@login_required()
def eliminar_indicador_objetivo(request, id):
    objeto = models.indicador_objetivos.objects.get(id = id)

    template_name = 'P01/indicador_objetivo/indicador_objetivo_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Indicador de Objetivo eliminado con éxito")
        register_logs(request, objeto, objeto.pk, str(objeto), 3)
        return redirect('listar_indicador_objetivo')
        
    return render(request, template_name, contexto)

@login_required()
def eliminar_accion_indicador_objetivo(request, id):
    objeto = models.accion_indicador_objetivo.objects.get(id = id)

    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Acción de Indicador de Objetivo eliminado con éxito")
        register_logs(request, objeto, objeto.pk, str(objeto), 3)
        return redirect('listar_accion_indicador_objetivo')
        
    return render(request, template_name, contexto)

@login_required()
def eliminar_sosi(request, id):
    objeto = models.sosi.objects.get(id = id)

    template_name = 'P01/sosi/sosi_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        objeto.delete()
        messages.success(request, "SOSI eliminado con éxito")
        register_logs(request, objeto, objeto.pk, str(objeto), 3)
        return redirect('listar_sosi')
        
    return render(request, template_name, contexto)

@login_required()
def eliminar_proyecto(request, id):
    objeto = models.proyecto.objects.get(consecutivo = id)

    template_name = 'P01/proyecto/proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto,
    }

    if request.method == "POST":
        objeto.consecutivo.delete()
        messages.success(request, "Consecutivo y Proyecto eliminados con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        register_logs(request, objeto.consecutivo, objeto.consecutivo.id, str(objeto.consecutivo), 3)
        return redirect('listar_proyecto')
    return render(request, template_name, contexto)

@login_required()
def detalle_consecutivo(request, id):
    objeto = models.consecutivo.objects.get(id = id)

    def dias_atraso(self) -> int:
        dias_atraso = 0
        hoy = datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d")
        hoy = hoy.date()
        try:
            if self.fecha_cierre > hoy:
                try:
                    dias_atraso = self.fecha_cierre - hoy
                except:
                    pass
                return int(dias_atraso.days)
        except:
            pass
        return 0    

    def costo_diario(self):
        # hay que levar duracion a dias
        try:
            duracion = self.fecha_cierre - self.fecha_inicio
            duracion = duracion.days
        except:
            duracion = 0

        try:
            costo_diario = self.costo / duracion
        except:
            costo_diario = 0

        costo_diario = round(costo_diario, 2)
        return costo_diario
    
    def costo_no_calidad(self):
        costo = costo_diario(self) * dias_atraso(self)
        return round(costo, 2)

    def costo_real(self):
        costo =  self.costo + costo_no_calidad(self)
        return round(costo, 2)

    rol_jefe = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')

    jefe = trabajador.objects.get(
        consecutivo = objeto,
        trabajador_consecutivo__rol = rol_jefe
    )

    template_name = 'P01/consecutivo/consecutivo_detail.html'
    contexto = {
        'object' : objeto,
        'costo_no_calidad': costo_no_calidad(objeto),
        'costo_real': costo_real(objeto),
        'dias_atraso': dias_atraso(objeto),
        'jefe': jefe
    }

    # el 0 en la funcion register_logs equivale a listar, que en realidad es retrieve, recuperar, por eso para mostrar los detalles se ha decidido utilizar 0, pues es también recuperar
    register_logs(request, objeto, objeto.id, str(objeto), 0)
    return render(request, template_name, contexto)

@login_required()
def detalle_premio(request, id):
    objeto = models.premio.objects.get(id = id)

    template_name = 'P01/premio/premio_detail.html'
    contexto = {
        'objeto' : objeto,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)
    return render(request, template_name, contexto)

@login_required()
def detalle_indicador_objetivo(request, id):
    objeto = models.indicador_objetivos.objects.get(id = id)
    tobj = objetivo.objects.filter(activo = True)
    test = estado_indicador_objetivos.objects.filter(activo = True)
    tacc = accion_indicador_objetivo.objects.filter(activo = True)

    myacc = accion_indicador_objetivo.objects.filter(indicador = objeto)

    template_name = 'P01/indicador_objetivo/indicador_objetivo_detail.html'
    contexto = {
        'objeto' : objeto,
        'tobj' : tobj,
        'test' : test,
        'tacc' : tacc,
        'myacc' : myacc,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)

    return render(request, template_name, contexto)

@login_required()
def detalle_accion_indicador_objetivo(request, id):
    objeto = models.accion_indicador_objetivo.objects.get(id = id)

    tarea = area.objects.filter(activo = True)
    tind = indicador_objetivos.objects.filter(activo = True)

    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_detail.html'
    contexto = {
        'objeto' : objeto,
        'tarea' : tarea,
        'tind' : tind,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)

    return render(request, template_name, contexto)

@login_required()
def detalle_acuerdo(request, id):
    objeto = models.acuerdo.objects.get(id = id)

    ttrab = trabajador.objects.filter(activo = True)
    test = estado_acuerdo.objects.filter(activo = True)
    myworkers = objeto.trabajador.all()

    template_name = 'P01/acuerdo/acuerdo_detail.html'
    contexto = {
        'objeto' : objeto,
        'ttrab' : ttrab,
        'test' : test,
        'myworkers' : myworkers,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)

    return render(request, template_name, contexto)

@login_required()
def detalle_objetivo(request, id):
    objeto = models.objetivo.objects.get(id = id)

    tind = indicador_objetivos.objects.filter(activo = True)
    myind = indicador_objetivos.objects.filter(activo = True, objetivo = objeto)

    template_name = 'P01/objetivo/objetivo_detail.html'
    contexto = {
        'objeto' : objeto,        
        'tind' : tind,
        'myind' : myind,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)

    return render(request, template_name, contexto)

@login_required()
def detalle_proyecto(request, id):
    objeto = models.proyecto.objects.get(consecutivo = id)

    lista = entrada_proyecto.objects.filter(activo = True, proyecto = objeto)

    def dias_atraso(self) -> int:
        dias_atraso = 0
        hoy = datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d")
        hoy = hoy.date()
        if self.fecha_cierre:
            if self.fecha_cierre > hoy:
                try:
                    dias_atraso = self.fecha_cierre - hoy
                except:
                    pass
                return int(dias_atraso.days)
        return 0    

    def costo_diario(self):
        costo_diario = 0
        if self.fecha_cierre and self.fecha_inicio:
            duracion = self.fecha_cierre - self.fecha_inicio
            duracion = duracion.days
            try:
                costo_diario = self.costo / duracion
            except:
                costo_diario = 0
            costo_diario = round(costo_diario, 2)
        return costo_diario
    
    def costo_no_calidad(self):
        costo = costo_diario(self) * dias_atraso(self)
        return round(costo, 2)

    def costo_real(self):
        costo =  self.costo + costo_no_calidad(self)
        return round(costo, 2)

    rol_jefe = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')

    try:
        jefe = trabajador.objects.get(
            proyecto = objeto,
            trabajador_proyecto__rol = rol_jefe
        )
    except:
        jefe = ''
        pass

    rol_calidad = rol_trabajador_proyecto.objects.get(nombre = 'Especialista de calidad')
    
    try:
        calidad = trabajador.objects.get(
            proyecto = objeto,
            trabajador_proyecto__rol = rol_calidad
        )
    except:
        calidad = ''
        pass

    rol_disennador = rol_trabajador_proyecto.objects.get(nombre = 'Diseñador')

    try:
        disennador = trabajador.objects.get(
            proyecto = objeto,
            trabajador_proyecto__rol = rol_disennador
        )
    except:
        disennador = ''
        pass

    template_name = 'P01/proyecto/proyecto_detail.html'
    contexto = {
        'object' : objeto,
        'costo_no_calidad': costo_no_calidad(objeto),
        'costo_real': costo_real(objeto),
        'dias_atraso': dias_atraso(objeto),
        'jefe': jefe,
        'calidad': calidad,
        'disennador': disennador,
        'lista': lista,        
    }

    register_logs(request, objeto, objeto.id, str(objeto), 3)

    return render(request, template_name, contexto)

@login_required()
def eliminar_formato(request, id):
    objeto = models.formato.objects.get(id = id)
    template_name = 'nomencladores/formato/formato_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Formato eliminado con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_formato')
    return render(request, template_name, contexto)

@login_required()
def eliminar_estado_acuerdo(request, id):
    objeto = models.estado_acuerdo.objects.get(id = id)
    template_name = 'nomencladores/estado_acuerdo/estado_acuerdo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Estado de acuerdo eliminado con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_estado_acuerdo')
    return render(request, template_name, contexto)

@login_required()
def eliminar_estado_proyecto(request, id):
    objeto = models.estado_proyecto.objects.get(id = id)
    template_name = 'nomencladores/estado_proyecto/estado_proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Estado de proyecto eliminado con éxito")
        # def register_logs(request, model, object_id, object_unicode, action):
        # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_estado_proyecto')
    return render(request, template_name, contexto)

@login_required()
def eliminar_estado_entrada(request, id):
    objeto = models.estado_entradas_proyecto.objects.get(id = id)
    template_name = 'nomencladores/estado_entrada/estado_entrada_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Estado de entrada eliminado con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)        
        return redirect('listar_estado_entrada')

@login_required()
def eliminar_estado_indicador(request, id):
    objeto = models.estado_indicador_objetivos.objects.get(id = id)
    template_name = 'nomencladores/estado_indicador/estado_indicador_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Estado de indicador eliminado con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_estado_indicador')
    return render(request, template_name, contexto)

@login_required()
def eliminar_tipo_proyecto(request, id):
    objeto = models.tipo_proyecto.objects.get(id = id)
    template_name = 'nomencladores/tipo_proyecto/tipo_proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Tipo de proyecto eliminado con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_tipo_proyecto')
    return render(request, template_name, contexto)

@login_required()
def eliminar_tipo_codigo(request, id):
    objeto = models.tipo_codigo.objects.get(id = id)
    template_name = 'nomencladores/tipo_codigo/tipo_codigo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Tipo de codigo eliminado con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_tipo_codigo')
    return render(request, template_name, contexto)

@login_required()
def eliminar_fuente_financiamiento(request, id):
    objeto = models.fuente_financiamiento.objects.get(id = id)
    template_name = 'nomencladores/fuente_financiamiento/fuente_financiamiento_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Fuente de financiamiento eliminada con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_fuente_financiamiento')
    return render(request, template_name, contexto)

@login_required()
def eliminar_entidad(request, id):
    objeto = models.entidad.objects.get(id = id)
    template_name = 'nomencladores/entidad/entidad_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Entidad eliminada con éxito")
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_entidad')
    return render(request, template_name, contexto)

@login_required()
def eliminar_linea_tematica(request, id):
    objeto = models.linea_tematica.objects.get(id = id)
    template_name = 'nomencladores/linea_tematica/linea_tematica_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    if request.method == "POST":
        objeto.delete()
        messages.success(request, "Línea temática eliminada con éxito")
        # def register_logs(request, model, object_id, object_unicode, action):
        # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
        register_logs(request, objeto, objeto.id, str(objeto), 3)
        return redirect('listar_linea_tematica')
    return render(request, template_name, contexto)
    
@login_required()
def act_desactarea(request, id):
    valor = request.POST.get('activo')
    area = models.area.objects.get(id = id)
    area.activo = True if valor == "on" else False
    area.save()        

    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, area, area.id, str(area), valor_log(area))

    return redirect('listar_areas')

class nomlinea_tematica(LoginRequiredMixin,CreateView):
    model = linea_tematica
    form_class = form.linea_tematica_form
    template_name = 'nomencladores/linea_tematica/linea_tematica_form.html'
    success_url = reverse_lazy("listar_linea_tematica")
    contexto = {
            'form' : form.linea_tematica_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_linea_tematica')

    def post(self, request, *args, **kwargs):
        forms = form.linea_tematica_form(request.POST)
        # obtener el value valor dentro del forms
        fy = my_validates.future_year(forms['anno'].value())
        if fy == False:
            messages.error(request, "El año no puede ser posterior al actual")
            return render(request, self.template_name, self.contexto)
        ney = my_validates.non_exist_year(forms['anno'].value(), 4)
        if ney == False:
            messages.error(request, "No existe año con menos de 4 caracteres")
            return render(request, self.template_name, self.contexto)

        if forms.is_valid():
            forms.save()
            id_linea_tematica = linea_tematica.objects.last()
            register_logs(request, linea_tematica, id_linea_tematica.pk, str(id_linea_tematica), 1)
            messages.success(request, "Línea temática creada con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(request, self.template_name, self.contexto)

@login_required()
def listar_linea_tematica(request):
    lineas= models.linea_tematica.objects.filter()
    contexto = {
        'lista': lineas
    }
    return render(request, 'nomencladores/linea_tematica/linea_tematica.html', contexto)

@login_required()
def listar_estado_acuerdo(request):
    estados = models.estado_acuerdo.objects.filter()
    contexto = {
        'lista': estados
    }
    return render(request, 'nomencladores/estado_acuerdo/estado_acuerdo.html', contexto)

@login_required()
def listar_estado_proyecto(request):
    estados = models.estado_proyecto.objects.filter()
    contexto = {
        'lista': estados
    }
    return render(request, 'nomencladores/estado_proyecto/estado_proyecto.html', contexto)

@login_required()
def listar_tipo_proyecto(request):
    tipos = models.tipo_proyecto.objects.filter()
    contexto = {
        'lista': tipos
    }
    return render(request, 'nomencladores/tipo_proyecto/tipo_proyecto.html', contexto)

@login_required()
def listar_tipo_codigo(request):
    tipos = models.tipo_codigo.objects.filter()
    contexto = {
        'lista': tipos
    }
    return render(request, 'nomencladores/tipo_codigo/tipo_codigo.html', contexto)

@login_required()
def listar_fuente_financiamiento(request):
    datos = models.fuente_financiamiento.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/fuente_financiamiento/fuente_financiamiento.html', contexto)

class estado_acuerdo_update(LoginRequiredMixin,UpdateView):
    model = estado_acuerdo
    form_class = form.estado_acuerdo_form
    template_name = 'nomencladores/estado_acuerdo/estado_acuerdo_update_form.html'
    success_url = reverse_lazy('listar_estado_acuerdo')

    def get_success_url(self):
        return reverse_lazy('listar_estado_acuerdo')

    def post(self, request, *args, **kwargs):
        register_logs(request, estado_acuerdo, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class estado_proyecto_update(LoginRequiredMixin,UpdateView):
    model = estado_proyecto
    form_class = form.estado_proyecto_form
    template_name = 'nomencladores/estado_proyecto/estado_proyecto_update_form.html'
    success_url = reverse_lazy('listar_estado_proyecto')

    def get_success_url(self):
        return reverse_lazy('listar_estado_proyecto')

    def post(self, request, *args, **kwargs):
        register_logs(request, estado_proyecto, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class tipo_proyecto_update(LoginRequiredMixin,UpdateView):
    model = tipo_proyecto
    form_class = form.tipo_proyecto_form
    template_name = 'nomencladores/tipo_proyecto/tipo_proyecto_update_form.html'
    success_url = reverse_lazy('listar_tipo_proyecto')

    def get_success_url(self):
        return reverse_lazy('listar_tipo_proyecto')

    def post(self, request, *args, **kwargs):
        register_logs(request, tipo_proyecto, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class tipo_codigo_update(LoginRequiredMixin,UpdateView):
    model = tipo_codigo
    form_class = form.tipo_codigo_form
    template_name = 'nomencladores/tipo_codigo/tipo_codigo_update_form.html'
    success_url = reverse_lazy('listar_tipo_codigo')

    def get_success_url(self):
        return reverse_lazy('listar_tipo_codigo')

    def post(self, request, *args, **kwargs):
        register_logs(request, tipo_codigo, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class fuente_financiamiento_update(LoginRequiredMixin,UpdateView):
    model = fuente_financiamiento
    form_class = form.fuente_financiamiento_form
    template_name = 'nomencladores/fuente_financiamiento/fuente_financiamiento_update_form.html'
    success_url = reverse_lazy('listar_fuente_financiamiento')

    def get_success_url(self):
        return reverse_lazy('listar_fuente_financiamiento')

    def post(self, request, *args, **kwargs):
        register_logs(request, fuente_financiamiento, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class formato_update(LoginRequiredMixin,UpdateView):
    model = formato
    form_class = form.formato_form
    template_name = 'nomencladores/formato/formato_update_form.html'
    success_url = reverse_lazy('listar_formato')

    def get_success_url(self):
        return reverse_lazy('listar_formato')

    def post(self, request, *args, **kwargs):
        register_logs(request, formato, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class entidad_update(LoginRequiredMixin,UpdateView):
    model = entidad
    form_class = form.entidad_form
    template_name = 'nomencladores/entidad/entidad_update_form.html'
    success_url = reverse_lazy('listar_entidad')

    def get_success_url(self):
        return reverse_lazy('listar_entidad')

    def post(self, request, *args, **kwargs):
        register_logs(request, entidad, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class estado_entrada_update(LoginRequiredMixin,UpdateView):
    model = estado_entradas_proyecto
    form_class = form.estado_entradas_proyecto_form
    template_name = 'nomencladores/estado_entrada/estado_entrada_update_form.html'
    success_url = reverse_lazy('listar_estado_entrada')

    def get_success_url(self):
        return reverse_lazy('listar_estado_entrada')

    def post(self, request, *args, **kwargs):
        register_logs(request, estado_entradas_proyecto, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class estado_indicador_update(LoginRequiredMixin,UpdateView):
    model = estado_indicador_objetivos
    form_class = form.estado_indicador_objetivos_form
    template_name = 'nomencladores/estado_entrada/estado_entrada_update_form.html'
    success_url = reverse_lazy('listar_estado_entrada')

    def get_success_url(self):
        return reverse_lazy('listar_estado_entrada')

    def post(self, request, *args, **kwargs):
        register_logs(request, estado_indicador_objetivos, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class rol_trabajador_proyecto_update(LoginRequiredMixin,UpdateView):
    model = rol_trabajador_proyecto
    form_class = form.rol_trabajador_proyecto_form
    template_name = 'nomencladores/rol_trabajador_proyecto/rol_trabajador_proyecto_update_form.html'
    success_url = reverse_lazy('listar_rol_trabajador_proyecto')

    def get_success_url(self):
        return reverse_lazy('listar_rol_trabajador_proyecto')

    def post(self, request, *args, **kwargs):
        register_logs(request, rol_trabajador_proyecto, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class linea_tematica_update(LoginRequiredMixin,UpdateView):
    model = linea_tematica
    form_class = form.linea_tematica_form
    template_name = 'nomencladores/linea_tematica/linea_tematica_update_form.html'
    success_url = reverse_lazy('listar_linea_tematica')

    def get_success_url(self):
        return reverse_lazy('listar_linea_tematica')

    def post(self, request, *args, **kwargs):
        register_logs(request, linea_tematica, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required
def consecutivo_update(request, id):

    objeto = consecutivo.objects.get(id = id)

    tcod = tipo_codigo.objects.filter(activo = True)
    tproy = tipo_proyecto.objects.filter(activo = True)
    tareas = area.objects.filter(activo = True)
    tformatos = formato.objects.filter(activo = True)
    ttrab = trabajador.objects.filter(activo = True)
    tlin = linea_tematica.objects.filter(activo = True)
    test = estado_proyecto.objects.filter(activo = True)
    tfue = fuente_financiamiento.objects.filter(activo = True)
    myformats = objeto.formato.all()

    template_name = 'P01/consecutivo/consecutivo_update_form.html'
    contexto = {
        'form' : objeto,
        'tproy' : tproy,
        'tcod' : tcod,
        'tareas' : tareas,
        'tformatos' : tformatos,
        'ttrab' : ttrab,
        'tlin' : tlin,
        'test' : test,
        'tfue' : tfue,
        'myformats' : myformats,
        'previouscode' : form.consecutivo_form.Meta.get_codigo,

    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.consecutivo_form(request.POST, request.FILES)
        response = {}

        ec = consecutivo.objects.filter(codigo = forms['codigo'].value())
        if len(ec) and ec[0].id != objeto.id:
            response['result'] = 'error'
            response['message'] = 'El Código del consecutivo ya existe'
            return JsonResponse(response)

        en = consecutivo.objects.filter(nombre_proyecto = forms['nombre_proyecto'].value())
        if len(en) and en[0].id != objeto.id:
            response['result'] = 'error'
            response['message'] = 'El Nombre del consecutivo ya existe'
            return JsonResponse(response)

        print('INFORMEEEE', forms['informe_apertura'].value())
        print('TIPO DE CODIGO', forms['tipo_codigo'].value())
        print('nombre_proyecto', forms['nombre_proyecto'].value())

        consec = consecutivo.objects.filter(id = id)

        try:
            consec.update(
                    tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
                    codigo = forms['codigo'].value(),
                    fecha_entrada = forms['fecha_entrada'].value(),
                    nombre_proyecto = forms['nombre_proyecto'].value(),
                    tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                    area = area.objects.get(pk = forms['area'].value()),                
                    fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                    aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                    fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                    fecha_inicio = forms['fecha_inicio'].value(),
                    fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                    causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                    fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
                    fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                    fecha_cierre = forms['fecha_cierre'].value() if forms['fecha_cierre'].value() else None,
                    costo = forms['costo'].value(),
                    observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                    informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                    informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                    linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
                    estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                    activo = forms['activo'].value()    
                )
        except:
            response['result'] = 'error'
            response['message'] = 'No se pudo actualizar, error en los datos'
            return JsonResponse(response)
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        objeto.formato.clear()
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                objeto.formato.add(felem)
            except:
                pass

        objeto.trabajador.clear()

        trabajador_consecutivo.objects.create(
            trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
            consecutivo = objeto,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        )

        objeto.save()  

        # objeto2 = models.proyecto.objects.get(consecutivo = id)
        # proy = models.proyecto.objects.filter(consecutivo = id)

        # proy.update(
        #         no = form.consecutivo_form.Meta.get_no_consecutivo(),
        #         tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
        #         codigo = forms['codigo'].value(),
        #         fecha_entrada = forms['fecha_entrada'].value(),
        #         nombre_proyecto = forms['nombre_proyecto'].value(),
        #         tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
        #         area = area.objects.get(pk = forms['area'].value()),                
        #         fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
        #         aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
        #         fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
        #         fecha_inicio = forms['fecha_inicio'].value(),
        #         fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
        #         causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
        #         fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
        #         fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
        #         fecha_cierre = forms['fecha_cierre'].value(),
        #         costo = forms['costo'].value(),
        #         observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
        #         informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
        #         informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
        #         linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
        #         estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
        #         activo = forms['activo'].value(),
        #         consecutivo = objeto   
        #     )
        
        # """hago una lista y para cada formato guardo el elemento,
        #     la intencion es luego pasarle la lista a consecutivo"""
        # objeto2.formato.clear()
        # formatos = forms['formato'].value()
        # for f in formatos:
        #     try:
        #         felem = formato.objects.get(pk = f)
        #         objeto2.formato.add(felem)
        #     except:
        #         pass

        # objeto2.trabajador.clear()

        # trabajador_proyecto.objects.create(
        #     trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
        #     consecutivo = objeto2,
        #     rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        # )

        # objeto2.save() 

        # def register_logs(request, model, object_id, object_unicode, action):
        # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
        register_logs(request, objeto, objeto.id, str(objeto), 2)

        response['result'] = 'success'
        response['message'] = 'Registro modificado con éxito.'
        return JsonResponse(response)

@login_required
def entrada_proyecto_update(request, id):
    # el id es una entrada
    objeto = entrada_proyecto.objects.get(id = id)
    myformats = objeto.formato.all()
    
    lista = entrada_proyecto.objects.filter(proyecto = objeto.proyecto)

    tformatos = formato.objects.filter(activo = True)
    ttrab = trabajador.objects.filter(activo = True)
    test = estado_entradas_proyecto.objects.filter(activo = True)

    template_name = 'P01/entrada_proyecto/entrada_proyecto_update_form.html'
    success_url = reverse('adicionar_entrada_proyecto', kwargs={'id': objeto.proyecto.consecutivo.id})

    contexto = {
        'form' : objeto,
        'tformatos' : tformatos,
        'ttrab' : ttrab,
        'test' : test,
        'lista' : lista,
        'myformats' : myformats,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.entrada_proyecto_form(request.POST, request.FILES)

        myformats = objeto.formato.all()
        print(objeto.proyecto)
        pass

        entrada = entrada_proyecto.objects.filter(id = id)

        entrada.update(
                fecha_entrada = forms['fecha_entrada'].value(),
                fecha_salida = forms['fecha_salida'].value(),
                entregado_por = trabajador.objects.get(pk = forms['entregado_por'].value()),
                dictamen = forms['dictamen'].value() if forms['dictamen'].value() else None,
                estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                activo = forms['activo2'].value()    
            )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        objeto.formato.clear()
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                objeto.formato.add(felem)
            except:
                pass

        objeto.save()  
        register_logs(request, entrada, entrada.pk, str(entrada), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def sosi_update(request, id):
    # el id es un sosi
    objeto = sosi.objects.get(id = id)
    
    ttrab = trabajador.objects.filter(activo = True)

    template_name = 'P01/sosi/sosi_update_form.html'
    success_url = reverse('listar_sosi')

    contexto = {
        'objeto' : objeto,
        'ttrab' : ttrab,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.sosi_form(request.POST, request.FILES)

        entrada = sosi.objects.filter(id = id)

        entrada.update(
            numero_salva = forms['numero_salva'].value(),
            fecha = datetime.now().strftime('%Y-%m-%d'),
            anno = forms['anno'].value() if forms['anno'].value() else None,
            especialista = trabajador.objects.get(pk = forms['especialista'].value()),
            autor = forms['autor'].value() if forms['autor'].value() else None,
            ubicacion_salva = forms['ubicacion_salva'].value() if forms['ubicacion_salva'].value() else None,
            observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None,
            archivo = forms['archivo'].value(),
            eliminado = forms['eliminado'].value(), 
        )

        # objeto.save()  
        register_logs(request, entrada, entrada.pk, str(entrada), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def detalle_sosi(request, id):
    # el id es un sosi
    objeto = sosi.objects.get(id = id)
    
    ttrab = trabajador.objects.filter(activo = True)

    template_name = 'P01/sosi/sosi_detail.html'
    success_url = reverse('listar_sosi')

    contexto = {
        'objeto' : objeto,
        'ttrab' : ttrab,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.sosi_form(request.POST, request.FILES)

        entrada = sosi.objects.filter(id = id)

        entrada.update(
            numero_salva = forms['numero_salva'].value(),
            fecha = datetime.now().strftime('%Y-%m-%d'),
            anno = forms['anno'].value() if forms['anno'].value() else None,
            especialista = trabajador.objects.get(pk = forms['especialista'].value()),
            autor = forms['autor'].value() if forms['autor'].value() else None,
            ubicacion_salva = forms['ubicacion_salva'].value() if forms['ubicacion_salva'].value() else None,
            observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None,
            archivo = forms['archivo'].value(),
            eliminado = forms['eliminado'].value(), 
        )

        # objeto.save()  
        register_logs(request, entrada, entrada.pk, str(entrada), 2)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required
def proyecto_update(request, id):
    # objeto es un consecutivo
    objeto = consecutivo.objects.get(id = id)
    proy = proyecto.objects.get(consecutivo = objeto)

    tcod = tipo_codigo.objects.filter(activo = True)
    tproy = tipo_proyecto.objects.filter(activo = True)
    tareas = area.objects.filter(activo = True)
    tformatos = formato.objects.filter(activo = True)
    ttrab = trabajador.objects.filter(activo = True)
    tlin = linea_tematica.objects.filter(activo = True)
    test = estado_proyecto.objects.filter(activo = True)
    tfue = fuente_financiamiento.objects.filter(activo = True)
    myformats = objeto.formato.all()

    try:
        rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')

        jefe = trabajador_proyecto.objects.get(
            proyecto = proy.id,
            rol = rol.id
        )
    except:
        jefe = ''
        pass

    try:
        rol = rol_trabajador_proyecto.objects.get(nombre = 'Especialista de calidad')

        calidad = trabajador_proyecto.objects.get(
            proyecto = proy.id,
            rol = rol.id
        )
    except:
        calidad = ''
        pass

    try:
        rol = rol_trabajador_proyecto.objects.get(nombre = 'Diseñador')

        disennador = trabajador_proyecto.objects.get(
            proyecto = proy.id,
            rol = rol.id
        )
    except:
        disennador = ''
        pass

    template_name = 'P01/proyecto/proyecto_update_form.html'
    success_url = reverse_lazy("listar_proyecto")
    contexto = {
        'form' : objeto,
        'tproy' : tproy,
        'tcod' : tcod,
        'tareas' : tareas,
        'tformatos' : tformatos,
        'ttrab' : ttrab,
        'tlin' : tlin,
        'test' : test,
        'tfue' : tfue,
        'myformats' : myformats,
        'jefe' : jefe.trabajador.id,
        'calidad' : calidad.trabajador.id,
        'disennador' : disennador.trabajador.id,
        'previouscode' : form.consecutivo_form.Meta.get_codigo,

    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.consecutivo_form(request.POST, request.FILES)
        response = {}

        ec = consecutivo.objects.filter(codigo = forms['codigo'].value())
        if len(ec) and ec[0].id != objeto.id:
            response['result'] = 'error'
            response['message'] = 'El Código del consecutivo ya existe'
            return JsonResponse(response)

        en = consecutivo.objects.filter(nombre_proyecto = forms['nombre_proyecto'].value())
        if len(en) and en[0].id != objeto.id:
            response['result'] = 'error'
            response['message'] = 'El Nombre del consecutivo ya existe'
            return JsonResponse(response)

        consec = consecutivo.objects.filter(id = id)

        consec.update(
                tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
                codigo = forms['codigo'].value(),
                fecha_entrada = forms['fecha_entrada'].value(),
                nombre_proyecto = forms['nombre_proyecto'].value(),
                tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                area = area.objects.get(pk = forms['area'].value()),                
                fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_inicio = forms['fecha_inicio'].value(),
                fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
                fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                fecha_cierre = forms['fecha_cierre'].value(),
                costo = forms['costo'].value(),
                observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
                estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                activo = forms['activo'].value()    
            )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        objeto.formato.clear()
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                objeto.formato.add(felem)
            except:
                pass

        objeto.trabajador.clear()

        trabajador_consecutivo.objects.create(
            trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
            consecutivo = objeto,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        )

        objeto2 = models.proyecto.objects.get(consecutivo = id)
        proy = models.proyecto.objects.filter(consecutivo = id)

        proy.update(
                no = form.consecutivo_form.Meta.get_no_consecutivo(),
                tipo_codigo = tipo_codigo.objects.get(pk = forms['tipo_codigo'].value()),
                codigo = forms['codigo'].value(),
                fecha_entrada = forms['fecha_entrada'].value(),
                nombre_proyecto = forms['nombre_proyecto'].value(),
                tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                area = area.objects.get(pk = forms['area'].value()),                
                fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                fecha_inicio = forms['fecha_inicio'].value(),
                fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None,
                fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                fecha_cierre = forms['fecha_cierre'].value(),
                costo = forms['costo'].value(),
                observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                linea_tematica = linea_tematica.objects.get(pk = forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None,
                estado = estado_proyecto.objects.get(pk = forms['estado'].value()),
                activo = forms['activo'].value(),
                consecutivo = objeto   
            )
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a consecutivo"""
        objeto2.formato.clear()
        formatos = forms['formato'].value()
        for f in formatos:
            try:
                felem = formato.objects.get(pk = f)
                objeto2.formato.add(felem)
            except:
                pass

        objeto2.trabajador.clear()

        trabajador_proyecto.objects.create(
            trabajador = trabajador.objects.get(pk = forms['jefe_proyecto'].value()),
            proyecto = objeto2,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Jefe de proyecto')
        )

        trabajador_proyecto.objects.create(
            trabajador = trabajador.objects.get(pk = forms['especialista_calidad'].value()),
            proyecto = objeto2,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Especialista de calidad')
        )

        trabajador_proyecto.objects.create(
            trabajador = trabajador.objects.get(pk = forms['disennador'].value()),
            proyecto = objeto2,
            rol = rol_trabajador_proyecto.objects.get(nombre = 'Diseñador')
        )

        objeto.save()  
        objeto2.save() 
        register_logs(request, consec, consec.pk, str(consec), 1)
        register_logs(request, proy, proy.pk, str(proy), 1)
        messages.success(request, "Registro modificado con éxito")
        return HttpResponseRedirect(success_url)

@login_required()
def act_desactlinea_tematica(request, id):
    valor = request.POST.get('activo')
    col = models.linea_tematica.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_linea_tematica')

@login_required()
def act_desactestado_acuerdo(request, id):
    valor = request.POST.get('activo')
    col = models.estado_acuerdo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_estado_acuerdo')

@login_required()
def act_desactentrada_proyecto(request, id):
    valor = request.POST.get('activo')
    col = models.entrada_proyecto.objects.get(id = id)
    proy = col.proyecto
    consec = proy.consecutivo

    col.activo = True if valor == "on" else False
    col.save()
    url = reverse('act_desactentrada_proyecto', kwargs={'id': id})
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return HttpResponseRedirect(url)

@login_required()
def act_desactconsecutivo(request, id):
    valor = request.POST.get('activo')
    col = models.consecutivo.objects.get(id = id)

    proy = proyecto.objects.get(consecutivo = col)
    col.activo = True if valor == "on" else False
    proy.activo = True if valor == "on" else False
    col.save()
    proy.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    register_logs(request, proy, proy.id, str(proy), valor_log(proy))
    return redirect('listar_consecutivo')

@login_required()
def act_desactproyecto(request, id):
    valor = request.POST.get('activo')
    proy = models.proyecto.objects.get(consecutivo = id)
    col = proy.consecutivo
    proy.activo = True if valor == "on" else False
    col.activo = True if valor == "on" else False
    proy.save()
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    register_logs(request, proy, proy.id, str(proy), valor_log(proy))
    return redirect('listar_proyecto')

@login_required()
def act_desactpremio(request, id):
    valor = request.POST.get('activo')
    col = models.premio.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_premio')

@login_required()
def act_desactacuerdo(request, id):
    valor = request.POST.get('activo')
    col = models.acuerdo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_acuerdo')

@login_required()
def act_desactindicador_objetivo(request, id):
    valor = request.POST.get('activo')
    col = models.indicador_objetivos.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_indicador_objetivo')

@login_required()
def act_desactaccion_indicador_objetivo(request, id):
    valor = request.POST.get('activo')
    col = models.accion_indicador_objetivo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_accion_indicador_objetivo')

@login_required()
def act_desactsosi(request, id):
    valor = request.POST.get('activo')
    col = models.sosi.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_sosi')

@login_required()
def act_desactobjetivo(request, id):
    valor = request.POST.get('activo')
    col = models.objetivo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_objetivo')

@login_required()
def act_desactestado_proyecto(request, id):
    valor = request.POST.get('activo')
    col = models.estado_proyecto.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_estado_proyecto')

@login_required()
def act_desacttipo_proyecto(request, id):
    valor = request.POST.get('activo')
    col = models.tipo_proyecto.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_tipo_proyecto')

@login_required()
def act_desacttipo_codigo(request, id):
    valor = request.POST.get('activo')
    col = models.tipo_codigo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_tipo_codigo')

@login_required()
def act_desactfuente_financiamiento(request, id):
    valor = request.POST.get('activo')
    col = models.fuente_financiamiento.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_fuente_financiamiento')

@login_required()
def act_desactformato(request, id):
    valor = request.POST.get('activo')
    col = models.formato.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_formato')

@login_required()
def act_desactentidad(request, id):
    valor = request.POST.get('activo')
    col = models.entidad.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_entidad')

@login_required()
def act_desactestado_entrada(request, id):
    valor = request.POST.get('activo')
    col = models.estado_indicador_objetivos.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_estado_entrada')

@login_required()
def act_desactestado_indicador(request, id):
    valor = request.POST.get('activo')
    col = models.estado_indicador_objetivos.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_estado_indicador')

@login_required()
def act_desactrol_consecutivo(request, id):
    valor = request.POST.get('activo')
    col = models.rol_trabajador_consecutivo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_rol_trabajador_consecutivo')

@login_required()
def act_desactrol_proyecto(request, id):
    valor = request.POST.get('activo')
    col = models.rol_trabajador_proyecto.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    # def register_logs(request, model, object_id, object_unicode, action):
    # action flag es 0 listar,1 agregar,2 modificar,3 eliminar,4 entrar, 5 salir, 6 activar, 7 desactivar, 8 reactivar, 9 Error User Password, 10 user login apk, 11 Base de datos
    def valor_log(self):
        if self.activo:
            action = 6
        else:
            action = 7
        return action
    register_logs(request, col, col.id, str(col), valor_log(col))
    return redirect('listar_rol_trabajador_proyecto')

@login_required()
def listar_formato(request):
    datos = models.formato.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/formato/formato.html', contexto)

@login_required()
def listar_entidad(request):
    datos = models.entidad.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/entidad/entidad.html', contexto)

@login_required()
def listar_estado_entrada(request):
    datos = models.estado_entradas_proyecto.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/estado_entrada/estado_entrada.html', contexto)

@login_required()
def listar_estado_indicador(request):
    datos = models.estado_indicador_objetivos.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/estado_indicador/estado_indicador.html', contexto)

@login_required()
def listar_rol_trabajador_consecutivo(request):
    datos = models.rol_trabajador_consecutivo.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/rol_trabajador_consecutivo/rol_trabajador_consecutivo.html', contexto)

@login_required()
def listar_rol_trabajador_proyecto(request):
    datos = models.rol_trabajador_proyecto.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/rol_trabajador_proyecto/rol_trabajador_proyecto.html', contexto)

def listar_consecutivo(request):
    datos = models.consecutivo.objects.all()
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/consecutivo/consecutivo.html', contexto)

def listar_afectacion(request):
    datos = models.Afectaciones.objects.all()
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/afectaciones/afectaciones.html', contexto)

def listar_plan(request):
    datos = models.PlanesdeTrabajo.objects.all()
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/Planes/Planes.html', contexto)
    
def listar_plan1(request):
    datos = models.PlanesdeTrabajo.objects.all()
    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/Planes/Planes1.html', contexto)

def listar_plan2(request):
    datos = models.PlanesdeTrabajo.objects.all()
    contexto = {
        'lista': datos,
    }
    return render(request, 'P01/Planes/Planes2.html', contexto)

def listar_auditoriainterna(request):
    datos = models.AuditoriasInternas.objects.all()
    contexto = {
       'lista': datos,
    }
    return render(request, 'P00/Auditorias/AuditoriasInternas.html', contexto)

def listar_auditoriaexterna(request):
    datos = models.AuditoriasExternas.objects.all()
    contexto = {
       ## 'lista': datos,
    }
    return render(request, 'P00/Auditorias/AuditoriasExternas.html', contexto)


@login_required()
def exportar_consecutivo(request, id = 0):
    if id != 0:
        objeto = consecutivo.object.get(id = id)
    else:
        objeto = None

    datos = models.consecutivo.objects.all()

    contexto = {
        'lista': datos,
        'objeto': objeto,
    }

    return render(request, 'P01/consecutivo/exportar_consecutivo.html', contexto)

@login_required()
def listar_entrada_proyecto(request):
    datos = models.entradas_proyecto.objects.all()
    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/entrada_proyecto/entrada_proyecto.html', contexto)

@login_required()
def listar_sosi(request):
    datos = models.sosi.objects.all()

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/sosi/sosi.html', contexto)

@login_required()
def listar_indicador_objetivo(request):
    datos = models.indicador_objetivos.objects.all()

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/indicador_objetivo/indicador_objetivo.html', contexto)

@login_required()
def listar_accion_indicador_objetivo(request):
    datos = accion_indicador_objetivo.objects.all()

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/accion_indicador_objetivo/accion_indicador_objetivo.html', contexto)

@login_required()
def listar_proyecto(request):
    datos = models.proyecto.objects.all()
    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/proyecto/proyecto.html', contexto)

@login_required()
def listar_objetivo(request):
    datos = models.objetivo.objects.all()

    for d in datos:
        hoy = datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d")
        anno_obj = datetime.strptime(d.fecha_definicion.strftime('%Y-%m-%d'), "%Y-%m-%d")
        # se deberá poner que el objetivo esté disponible, es mejor ponerle un estado creo
        if hoy.year > anno_obj.year:
            print('Incumplido')

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/objetivo/objetivo.html', contexto)

@login_required()
def listar_premio(request):
    datos = models.premio.objects.all()
    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/premio/premio.html', contexto)

@login_required()
def prueba(request):
    datos = models.consecutivo.objects.all()

    print('VALOR', datos[0].informe_apertura.size)

    contexto = {
        'lista': datos[0],
    }

    # proy = consecutivo.objects.get(codigo = 'SER2201')
    # register_logs(request, proy, proy.id, str(proy), 1)
    # response = {}
    # response['message'] = str(proy)
    return render(request, 'prueba.html', contexto)

@login_required()
def listar_acuerdo(request):
    datos = models.acuerdo.objects.all()
    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/acuerdo/acuerdo.html', contexto)

# @login_required()
# def exportarPDF(request):
#     # if request.POST.get('action') and request.POST['action'] == 'export_PDF':
#     html = request.POST['template']
#     #context = {'title': 'Valoraciones de la Encuesta'}
#     #html = template.render(context)
#     css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
#     pdf = HTML(string=html).write_pdf(target="media/valoracion_encuesta/valoracion_encuesta%s.pdf" % (date.today()),
#         stylesheets=[CSS(css_url)])
#     data = ''
#     return HttpResponse(data,content_type='text/html')

# @login_required()
# def visualizarformEncuesta(request):
#     forms = form.valencuestaForm()
#     if request.POST:
#         forms = form.valencuestaForm(request.POST)
#         if forms.is_valid():
#             encuesta = forms.save(commit=False)
#             # if request.user.id == 3:
#             trabajador =models.trabajador.objects.filter(id=11).first()
#             encuesta.elaborado_por = trabajador
#             encuesta.documento = 'valoracion_encuesta/valoracion_encuesta%s.pdf' % (date.today())
#             encuesta.save()
#             for i in forms.cleaned_data['organismos'].all():
#                 encuesta.organismos.add(i)
#                 encuesta.save()
#             id_valenc = Valoracion_encuesta.objects.last()
#             register_logs(request, Valoracion_encuesta, id_valenc.pk, id_valenc.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponseRedirect('/listar/valoracion_encuesta')
#         else:
#             messages.error(request, "Error en el formulario")

#     args = {}
#     args['forms'] = forms
#     return render(request, 'entradadatos/valoracion_encuetsta_form.html',args)

#Importar CSV
@login_required()
def ImportarCSV(request):
    CSVfile = open(os.path.join(settings.BASE_DIR,'media/importarCSV/sosi.csv'),mode='r',encoding='utf-8')
    pos = 0
    for fila in CSVfile:
        if pos >= 2:
            linea = fila.split('|')
            fecha=linea[5].split('-')
            fecha=date(int(fecha[2]),int(fecha[0]),int(fecha[1]))
            sosibd = models.sosi.objects.filter(numero_salva=linea[1])

            if sosibd.count() == 0:
                ubicacion_salva = linea[13] + '-' + linea[14] + '-' + linea[15]
                persona_entrega=linea[6]
                persona_recibe=linea[7]

                area = models.area.objects.get(nombre_Area__icontains=linea[4])

                sosi = models.sosi(numero_salva=linea[1], descripcion=linea[16], fecha_salv=fecha,
                                   ubicacion_salv=ubicacion_salva,documentacion=True, materia_prima=True,
                                   persona_entrega=persona_entrega, persona_recibe=persona_recibe,
                                   anno=linea[11], autor=linea[12],area_id=area.id, cod_proyecto=linea[2],
                                   nombre_proy_prod=linea[3])

                sosi.save()
                idioma_id = 0
                idiomas = []
                for i in linea[10].split('/'):
                    lang = models.idioma.objects.get(nombre_Idioma=i.strip())
                    idiomas.append(lang)
                    for l in idiomas:
                        sosi.idioma.add(l)
                        sosi.save()
                formato_id=0
                formato = []
                for i in linea[8].split('/'):
                    format = models.formato.objects.get(nombre_Formato=i.strip())
                    formato.append(format)
                    for l in formato:
                        sosi.formato.add(l)
                        sosi.save()
                linea_tematica_id = 0
                linea_tematica = []
                for i in linea[9].split('/'):
                    print(i)
                    colecc = models.linea_tematica.objects.get(nombre_Coleccion=i.strip())
                    linea_tematicaes.append(colecc)
                    for l in linea_tematicaes:
                        sosi.linea_tematica.add(l)
                        sosi.save()
            else:
                continue
            sosi.save()
        pos+=1
    return redirect('listar_sosi')

@login_required()
def ReporteCertificacionesJefeProyectos(request):
    datos = []
    mes_usuario=request.GET.get('mes')
    anno_usuario=request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.proyecto.objects.all():
            fecha_inicio= i.fecha_inicio
            fecha_terminacion=i.fecha_terminacion
            #extraer mes y anno de ambas fechas
            mes_fi= fecha_inicio.month
            mes_ft= fecha_terminacion.month
            anno_fi= fecha_inicio.year
            anno_ft= fecha_terminacion.year
            if int(mes_usuario) >= mes_fi and int(mes_usuario)<=mes_ft and int(anno_usuario) >= anno_fi and int(anno_usuario) <= anno_ft:
                datos.append(i)
    return render(request, 'reportes/reportecertificacionesjefeproyecto.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})

@login_required()
def ReporteReclamaciones(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.atencion_cliente_externo.objects.all():
            if int(mes_usuario) >= i.fecha_recibido.month and int(mes_usuario)<=i.fecha_cierre.month and int(anno_usuario) >= i.fecha_recibido.year and int(anno_usuario) <= i.fecha_cierre.year:
                datos.append(i)
    return render(request, 'reportes/reportereclamaciones.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})

@login_required()
def ReporteReserva(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.trabajador.objects.filter(es_reserva=True):
            if int(mes_usuario) == i.fecha_inicio_reserva.month and int(anno_usuario) == i.fecha_inicio_reserva.year:
                datos.append(i)
    return render(request, 'reportes/reportereservacuadros.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})

@login_required()
def ReporteCuadros(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.trabajador.objects.filter(es_cuadro=True):
            if int(mes_usuario) == i.fecha_inicio_cuadro.month and int(anno_usuario) == i.fecha_inicio_cuadro.year:
                datos.append(i)
    return render(request, 'reportes/reportecuadros.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})

@login_required()
def ReporteIncidencias(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.incidencias.objects.all():
            if int(mes_usuario) >= i.fecha_recibido.month and int(mes_usuario)<=i.fecha_cierre.month and int(anno_usuario) >= i.fecha_recibido.year and int(anno_usuario) <= i.fecha_cierre.year:
                datos.append(i)
    return render(request, 'reportes/reporteincidencias.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})

@login_required()
def ReporteCapacitaciones(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.curso.objects.all():
            if int(mes_usuario) == i.fecha.month and int(anno_usuario) == i.fecha.year:
                datos.append(i)
    return render(request, 'reportes/reportecapacitacion.html',{'datos': datos,'ano': anno_usuario,'mes': mes_usuario})

@login_required()
def ReporteProyectoAtrasado(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.proyecto.objects.filter(estado__nombre_Estado='atrasado'):
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
    return render(request, 'reportes/reporteproyectoatrasado.html',{'datos': datos,'ano': anno_usuario,'mes': mes_usuario})

@login_required()
def ReporteProyectoAprobado(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.proyecto.objects.filter(estado__nombre_Estado='aprobado'):
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
    return render(request, 'reportes/reporteproyectoaprobado.html',{'datos': datos,'ano': anno_usuario,'mes': mes_usuario})

# @login_required()
# def ReporteProyectoConform(request):
#     datos = []
#     mes_usuario = request.GET.get('mes')
#     anno_usuario = request.GET.get('ano')
#     if mes_usuario and anno_usuario:
#         for i in models.Historico_Entradas_proyectos.objects.filter(entradas_proyectos__estado_entradas_proyecto_id=1).distinct('entradas_proyectos__proyecto'):
#             if int(mes_usuario) == i.fecha.month and int(anno_usuario) == i.fecha.year:
#                 datos.append(i)
#     return render(request, 'reportes/reporteproyectoconform.html',{'datos': datos,'ano': anno_usuario,'mes': mes_usuario})

# @login_required()
# def ReporteProyectoNOconform(request):
#     datos = []
#     mes_usuario = request.GET.get('mes')
#     anno_usuario = request.GET.get('ano')
#     if mes_usuario and anno_usuario:
#         for i in models.Historico_Entradas_proyectos.objects.filter(entradas_proyectos__estado_entradas_proyecto_id=2).distinct('entradas_proyectos__proyecto'):
#             if int(mes_usuario) == i.fecha.month and int(anno_usuario) == i.fecha.year:
#                 datos.append(i)
#     return render(request, 'reportes/reporteproyectonoconf.html',{'datos': datos,'ano': anno_usuario,'mes': mes_usuario})

@login_required()
def ReporteProyectoTerminado(request):
    datos = []
    mes_usuario = request.GET.get('mes')
    anno_usuario = request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.proyecto.objects.filter(estado__nombre_Estado='terminado'):
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
    return render(request, 'reportes/reporteproyectoterminado.html',{'datos': datos,'ano': anno_usuario,'mes': mes_usuario})

@login_required()
def ReporteProyectosEstadosTodos(request):
    datos = []
    mes_usuario=request.GET.get('mes')
    anno_usuario=request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.proyecto.objects.all():
            fecha_inicio= i.fecha_inicio
            fecha_terminacion=i.fecha_terminacion
            #extraer mes y anno de ambas fechas
            mes_fi= fecha_inicio.month
            mes_ft= fecha_terminacion.month
            anno_fi= fecha_inicio.year
            anno_ft= fecha_terminacion.year
            if int(mes_usuario) >= mes_fi and int(mes_usuario)<=mes_ft and int(anno_usuario) >= anno_fi and int(anno_usuario) <= anno_ft:
                datos.append(i)
    return render(request, 'reportes/reporteproyectoestadotodos.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})

@login_required()
def ReporteProyectosFormatos(request):
    datos = []
    mes_usuario=request.GET.get('mes')
    anno_usuario=request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.proyecto.objects.all():
            fecha_inicio= i.fecha_inicio
            fecha_terminacion=i.fecha_terminacion
            #extraer mes y anno de ambas fechas
            mes_fi= fecha_inicio.month
            mes_ft= fecha_terminacion.month
            anno_fi= fecha_inicio.year
            anno_ft= fecha_terminacion.year
            if int(mes_usuario) >= mes_fi and int(mes_usuario)<=mes_ft and int(anno_usuario) >= anno_fi and int(anno_usuario) <= anno_ft:
                datos.append(i)
    return render(request, 'reportes/reporteproyectoformatos.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})

@login_required()
def ReporteEficacia(request):
    datos = []
    mes_usuario=request.GET.get('mes')
    anno_usuario=request.GET.get('ano')
    if mes_usuario and anno_usuario:
        for i in models.eficacia.objects.filter():
            fecha= i.fecha
            #extraer mes y anno de ambas fechas
            mes_f= fecha.month
            anno_f= fecha.year
            if int(mes_usuario) == mes_f and int(anno_usuario) == anno_f:
                datos.append(i)
    return render(request, 'reportes/reporteeficacia.html',{'datos': datos,'ano': anno_usuario ,'mes':mes_usuario})


# Exportar PDF
class ExportarCertificaciones_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reportejefeproyectopdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.proyecto.objects.all():
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
        context = {'title': 'Certificaciones de jefe de proyectos','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarProyectAprobados_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reporteproyaprobadopdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.proyecto.objects.filter(estado__nombre_Estado='aprobado'):
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
        context = {'title': 'Proyectos aprobados','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarProyectFormatos_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reporteproyectoformatospdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.proyecto.objects.filter():
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
        context = {'title': 'Proyectos por formatos','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarProyectEstadosTodos_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reporteproyectoestadotodospdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.proyecto.objects.filter():
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
        context = {'title': 'Proyectos por estados','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarEficacia_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reporteeficaciapdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.eficacia.objects.filter():
            if int(mes_usuario) == i.fecha.month and int(anno_usuario) == i.fecha.year:
                datos.append(i)
        context = {'title': 'Eficacia de los procesos','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarProyectAtrasados_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reporteproyatrasadopdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.proyecto.objects.filter(estado__nombre_Estado='atrasado'):
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
        context = {'title': 'Proyectos atrasados','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

# class ExportarProyectConforme_PDF(LoginRequiredMixin,View):

#     def get(self, request, *args, **kwargs):
#         # try:
#         template = get_template('reportes/reporteproyconformpdf.html')
#         datos = []
#         mes_usuario = request.GET.get('mes')
#         anno_usuario = request.GET.get('ano')
#         for i in models.Historico_Entradas_proyectos.objects.filter(entradas_proyectos__estado_entradas_proyecto_id=1).distinct('entradas_proyectos__proyecto'):
#             if int(mes_usuario) == i.fecha.month and int(anno_usuario) == i.fecha.year:
#                 datos.append(i)
#         context = {'title': 'Proyectos con entradas conforme','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
#         html = template.render(context)
#         css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
#         pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
#         return HttpResponse(pdf,content_type='application/pdf')

# class ExportarProyectNoConforme_PDF(LoginRequiredMixin,View):

#     def get(self, request, *args, **kwargs):
#         # try:
#         template = get_template('reportes/reporteproynoconformpdf.html')
#         datos = []
#         mes_usuario = request.GET.get('mes')
#         anno_usuario = request.GET.get('ano')
#         for i in models.Historico_Entradas_proyectos.objects.filter(entradas_proyectos__estado_entradas_proyecto_id=2).distinct('entradas_proyectos__proyecto'):
#             if int(mes_usuario) == i.fecha.month and int(anno_usuario) == i.fecha.year:
#                 datos.append(i)
#         context = {'title': 'Proyectos con entradas no conforme','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
#         html = template.render(context)
#         css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
#         pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
#         return HttpResponse(pdf,content_type='application/pdf')

class ExportarProyectTerminado_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reporteproyterminadopdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.proyecto.objects.filter(estado__nombre_Estado='terminado'):
            if int(mes_usuario) >= i.fecha_inicio.month and int(mes_usuario) <= i.fecha_terminacion.month and int(anno_usuario) >= i.fecha_inicio.year and int(anno_usuario) <= i.fecha_terminacion.year:
                datos.append(i)
        context = {'title': 'Proyectos terminados','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarIncidencias_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reporteincidenciaspdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.incidencias.objects.all():
            if int(mes_usuario) >= i.fecha_recibido.month and int(mes_usuario) <= i.fecha_cierre.month and int(anno_usuario) >= i.fecha_recibido.year and int(anno_usuario) <= i.fecha_cierre.year:
                datos.append(i)
        context = {'title': 'Listado de Incidencias','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

        # except:
        #     pass
        # return HttpResponseRedirect(reverse_lazy('listar_incidencias'))

class ExportarReservas_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reportereservacuadropdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.trabajador.objects.filter(es_reserva=True):
            if int(mes_usuario) == i.fecha_inicio_reserva.month and int(anno_usuario) == i.fecha_inicio_reserva.year:
                datos.append(i)
        context = {'title': 'Listado de Reservas','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarCuadros_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reportecuadrospdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.trabajador.objects.filter(es_cuadro=True):
            if int(mes_usuario) == i.fecha_inicio_cuadro.month and int(anno_usuario) == i.fecha_inicio_cuadro.year:
                datos.append(i)
        context = {'title': 'Listado de Cuadros','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf,content_type='application/pdf')

class ExportarReclamaciones_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reportereclamacionespdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.atencion_cliente_externo.objects.all():
            if int(mes_usuario) >= i.fecha_recibido.month and int(mes_usuario) <= i.fecha_cierre.month and int(anno_usuario) >= i.fecha_recibido.year and int(anno_usuario) <= i.fecha_cierre.year:
                datos.append(i)
        context = {'title': 'Listado de Reclamaciones','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf, content_type='application/pdf')

        # except:
        #     pass
        # return HttpResponseRedirect(reverse_lazy('listar_incidencias'))

class ExportarCapacitacion_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reportecapacitacionpdf.html')
        mes = request.GET.get('mes')
        ano = request.GET.get('ano')
        datos = models.curso.objects.filter(fecha__month=int(mes),fecha__year=int(ano))
        context = {'title': 'Listado de Capacitación del Personal','mes': mes,'ano':ano,'datos':datos}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf, content_type='application/pdf')
        # except:
        #     pass
        # return HttpResponseRedirect(reverse_lazy('listar_incidencias'))

class ExportarLicencias_PDF(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        # try:
        template = get_template('reportes/reportelicenciaspdf.html')
        datos = []
        mes_usuario = request.GET.get('mes')
        anno_usuario = request.GET.get('ano')
        for i in models.tipo_de_licencias.objects.all():
            if int(mes_usuario) >= i.fecha_otorg.month and int(mes_usuario) <= i.fecha_venc.month and int(anno_usuario) >= i.fecha_otorg.year and int(anno_usuario) <= i.fecha_venc.year:
                datos.append(i)
        context = {'title': 'Reporte de Licencias','datos': datos,'mes': mes_usuario,'ano':anno_usuario}
        html = template.render(context)
        css_url = os.path.join(settings.BASE_DIR, 'static/assets/plugins/bootstrap-4-4.1.1/css/bootstrap.min.css')
        pdf = HTML(string=html, base_url=request.build_absolute_uri()).write_pdf(stylesheets=[CSS(css_url)])
        return HttpResponse(pdf, content_type='application/pdf')
        # except:
        #     pass
        # return HttpResponseRedirect(reverse_lazy('listar_incidencias'))
