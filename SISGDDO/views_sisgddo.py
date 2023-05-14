import os
import json
import sys
from django.contrib.auth.decorators import login_required
from django.contrib.admin.models import LogEntry
from django.shortcuts import render
from SISGDDO import models
from django.views.generic import ListView
import uuid
from django.template.loader import get_template
from weasyprint import HTML,CSS
from datetime import date,timedelta,datetime
from base64 import b64encode
from dateutil import parser
from django.contrib.auth.models import Group,User
from django.template.loader import get_template
from weasyprint import HTML
from ProyectoBaseApp import models as modelsadmin
from django.contrib import messages
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from notifications.signals import notify
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin
from SISGDDO import models, form
from SISGDDO.models import cliente, consecutivo, estado_indicador_objetivos, licencia, plan_medidas,estado_entradas_proyecto,entradas_proyecto,acuerdo,linea_tematica,incidencia,propiedad_industrial,sosi,proyecto,auditoria_externa,auditoria_interna,eficacia,area,proceso,curso,formato,metodosprueba,estado_acuerdo,estado_proyecto,indicador,trabajador
from SISGDDO.models import tipo_proyecto, fuente_financiamiento, formato, estado_entradas_proyecto, entidad, rol_trabajador_consecutivo, rol_trabajador_proyecto
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
            register_logs(request, CambiarLogotipo, id_logo.pk, id_logo.__str__(), 1)
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

@login_required()
def listar_acuerdos(request):
    listacuerdos = models.acuerdo.objects.all()
    contexto = {
        'acuerdos': listacuerdos
    }
    return render(request, 'P14/acuerdo_consejo.html', contexto)

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

@login_required()
def acuerdo_create(request):
    if request.POST:
        forms = form.acuerdoForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_acuerdo = acuerdo.objects.last()
            register_logs(request, acuerdo, id_acuerdo.pk, id_acuerdo.__str__(), 1)
            messages.success(request, "Acuerdo creado con éxito")
            return HttpResponseRedirect('/listar/acuerdos')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.acuerdoForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P14/acuerdo_form.html', args)

# class acuerdoUpdate(LoginRequiredMixin,UpdateView):
#     model = acuerdo
#     form_class = form.acuerdoForm
#     template_name = 'P14/acuerdo_update_form.html'

#     def get_success_url(self):
#         return reverse_lazy('listar_acuerdos')

#     def post(self, request, *args, **kwargs):
#         register_logs(request, acuerdo, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Acuerdo modificado con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)

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

class incidenciaUpdate(LoginRequiredMixin,UpdateView):
    model = incidencia
    form_class = form.incidenciaForm
    template_name = 'P14/incidencias_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_incidencias')

    def post(self, request, *args, **kwargs):
        register_logs(request, incidencia, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Incidencia modificada con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class IncidenciasDetailView(LoginRequiredMixin,DetailView):
    model = incidencia
    template_name = 'P14/incidencias_detail.html'


    def get_success_url(self):
        return reverse_lazy('listar_incidencias')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles de la Incidencia'
        context['list_url'] = reverse_lazy('listar_incidencias')
        return context

#Vista del P01
@login_required()
def listar_sosi(request):
    listsosi = models.sosi.objects.all()
    contexto = {
        'listsosi': listsosi
    }
    return render(request, 'P01/sosi.html', contexto)

@login_required()
def listar_cenda(request):
    listcenda = models.CENDA.objects.all()
    contexto = {
        'listcenda': listcenda
    }
    return render(request, 'P01/CENDA.html', contexto)

@login_required()
def listar_proyectos(request):
    listproyectos= models.proyecto.objects.all()
    contexto = {
        'listproyectos': listproyectos
    }
    return render(request, 'P01/Proyectos.html', contexto)

class ProyectoDetailView(LoginRequiredMixin,DetailView):
    model = proyecto
    template_name = 'P01/Proyectos_detail.html'

    def get_success_url(self):
        return reverse_lazy('listar_proyectos')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles del Proyecto'
        context['list_url'] = reverse_lazy('listar_proyectos')
        return context

class sosiDetailView(LoginRequiredMixin,DetailView):
    model = sosi
    template_name = 'P01/sosi_detail.html'


    def get_success_url(self):
        return reverse_lazy('listar_sosi')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles del sosi'
        context['list_url'] = reverse_lazy('listar_sosi')
        return context

@login_required()
def cenda_create(request):
    if request.POST:
        forms = form.cendaForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_cenda = CENDA.objects.last()
            register_logs(request, CENDA, id_cenda.pk, id_cenda.__str__(), 1)
            messages.success(request, "Registro en el CENDA creado con éxito")
            return HttpResponseRedirect('/listar/cenda')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.cendaForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P01/CENDA_form.html', args)

class cendaUpdate(LoginRequiredMixin,UpdateView):
    model = propiedad_industrial
    form_class = form.cendaForm
    template_name = 'P01/CENDA_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_cenda')

    def post(self, request, *args, **kwargs):
        register_logs(request, propiedad_industrial, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro en el CENDA modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required()
def sosi_create(request):
    if request.POST:
        forms = form.sosiForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_sosi = sosi.objects.last()
            register_logs(request, sosi, id_sosi.pk, id_sosi.__str__(), 1)
            messages.success(request, "Registro en el sosi creado con éxito")
            return HttpResponseRedirect('/listar/sosi')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.sosiForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P01/sosi_form.html', args)

class sosiUpdate(LoginRequiredMixin,UpdateView):
    model = sosi
    form_class = form.sosiForm
    template_name = 'P01/sosi_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_sosi')

    def post(self, request, *args, **kwargs):
        register_logs(request, sosi, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro en el sosi modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required()
def proyecto_create(request):
    if request.POST:
        forms = form.proyectoForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_proyecto = proyecto.objects.last()
            register_logs(request, proyecto, id_proyecto.pk, id_proyecto.__str__(), 1)
            messages.success(request, "Proyecto creado con éxito")
            return HttpResponseRedirect('/listar/proyectos')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.proyectoForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P01/Proyectos_form.html', args)

class proyectoUpdate(LoginRequiredMixin,UpdateView):
    model = proyecto
    form_class = form.proyectoForm
    template_name = 'P01/Proyectos_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_proyectos')

    def post(self, request, *args, **kwargs):
        register_logs(request, proyecto, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Proyecto modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)


@login_required()
def EntradasProyectos_create(request):
    if request.POST:
        forms = form.entradaproyectoForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_entproy = Entradas_proyecto.objects.last()
            register_logs(request, Entradas_proyecto, id_entproy.pk, id_entproy.__str__(), 1)
            messages.success(request, "Entrada creada con éxito")
            return HttpResponseRedirect('/listar/entradasproyectos')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.entradaproyectoForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P03/Entradas_Proyectos_form.html', args)

class EntradasProyectosUpdate(LoginRequiredMixin,UpdateView):
    model = entradas_proyecto
    form_class = form.entradaproyectoForm
    template_name = 'P03/Entradas_Proyectos_update_form.html'
    success_url = reverse_lazy('listar_entradasproyectos')

    def get_success_url(self):
        return reverse_lazy('listar_entradasproyectos')

    def post(self, request, *args, **kwargs):
        register_logs(request, entradas_proyecto, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Entrada modificada con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class EntradasProyectosDetailView(LoginRequiredMixin,DetailView):
    model = entradas_proyecto
    template_name = 'P03/Entradas_Proyectos_detail.html'


    def get_success_url(self):
        return reverse_lazy('listar_entradasproyectos')


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Detalles de la Entrada'
        context['list_url'] = reverse_lazy('listar_entradasproyectos')
        return context


# class HistoricoEntradasProyectosDetailView(LoginRequiredMixin,DetailView):
#     model = Historico_Entradas_proyectos
#     template_name = 'P03/Historico_Entradas_Proyectos_detail.html'


#     def get_success_url(self):
#         return reverse_lazy('listar_histentproy')


#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['title'] = 'Detalles del histórico de la entrada del proyecto'
#         context['list_url'] = reverse_lazy('listar_histentproy')
#         return context

#vistas #Javier #listar
@login_required()
def listar_area(request):
    contexto = {
        'lista': models.area.objects.all()
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/area/areas.html', contexto)

#Vistas del P00
@login_required()
def listar_visualizarincidencias(request):
    listincidencias = models.incidencias.objects.all()

    contexto = {
        'incidencias': listincidencias
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


class auditoria_internaUpdate(LoginRequiredMixin,UpdateView):
    model = auditoria_interna
    form_class = form.auditoria_internaForm
    template_name = 'P00/auditoria_interna_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_auditoriaint')

    def post(self, request, *args, **kwargs):
        register_logs(request, auditoria_interna, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required()
def listar_planmedidas(request):
    listplan= models.plan_medidas.objects.all()
    contexto = {
        'listplan': listplan
    }
    return render(request, 'P00/plan_medidas.html', contexto)

@login_required()
def plan_medida_create(request):
    if request.POST:
        forms = form.planmedidasForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_plan_med = plan_medidas.objects.last()
            register_logs(request, plan_medidas, id_plan_med.pk, id_plan_med.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect('/listar/planmedidas')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.planmedidasForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P00/plan_medidas_form.html', args)

class planmedidasUpdate(LoginRequiredMixin,UpdateView):
    model = models.plan_medidas
    form_class = form.planmedidasForm
    template_name = 'P00/plan_medidas_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_planmedidas')

    def post(self, request, *args, **kwargs):
        register_logs(request, plan_medidas, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)


@login_required()
def listar_auditoria_externa(request):
    listaudext= models.auditoria_externa.objects.all()
    contexto = {
        'listaudext': listaudext
    }
    return render(request, 'P00/auditoria_externa.html', contexto)

@login_required()
def auditoria_externa_create(request):
    if request.POST:
        forms = form.auditoria_externaForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_auditoria_externa = auditoria_externa.objects.last()
            register_logs(request, auditoria_externa, id_auditoria_externa.pk, id_auditoria_externa.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect('/listar/auditoriaexterna')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.auditoria_externaForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P00/auditoria_externa_form.html', args)

class auditoria_externaUpdate(LoginRequiredMixin,UpdateView):
    model = auditoria_externa
    form_class = form.auditoria_externaForm
    template_name = 'P00/auditoria_externa_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_auditoriaext')

    def post(self, request, *args, **kwargs):
        register_logs(request, auditoria_externa, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required()
def listar_eficacia_procesos(request):
    listefic= models.eficacia.objects.all()
    contexto = {
        'listefic': listefic
    }
    return render(request, 'P00/eficacia_procesos.html', contexto)

@login_required()
def eficacia_procesos_create(request):
    args = {}
    Proceso = request.GET.get('proceso')

    if request.POST:
        forms = form.eficacia_procesosForm(request.POST)
        if forms.is_valid():
            eficacia = forms.save(commit=False)
            Proceso = models.proceso.objects.get(id=request.POST.get('proceso'))

            for indic in Proceso.indicador_eficacia_set.all():
                for aspect in indic.aspecto_medir_indicadoreficacia_set.all():
                    aspect.calificacion_asp = int(request.POST.get(str(aspect.id)))
                    aspect.save()
                indic.calif_ind = indic.Calif_ind()
                indic.save()
            eficacia.eval_tot = eficacia.EvalTotal()
            eficacia.eficaz = eficacia.Eficaz()
            eficacia.save()
            register_logs(request, eficacia, eficacia.pk, eficacia.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect('/listar/eficacia')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.eficacia_procesosForm()
    args['proceso'] = Proceso
    args['forms'] = forms

    return render(request, 'P00/eficacia_procesos_form.html', args)

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
            register_logs(request, area, id_area.pk, id_area.__str__(), 1)
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
            register_logs(request, estado_acuerdo, id_estado_acuerdo.pk, id_estado_acuerdo.__str__(), 1)
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
            register_logs(request, estado_proyecto, id_estado_proyecto.pk, id_estado_proyecto.__str__(), 1)
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
            register_logs(request, tipo_proyecto, id_tipo_proyecto.pk, id_tipo_proyecto.__str__(), 1)
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
            register_logs(request, fuente_financiamiento, id_fuente_financiamiento.pk, id_fuente_financiamiento.__str__(), 1)
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
            register_logs(request, formato, id_formato.pk, id_formato.__str__(), 1)
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
            register_logs(request, entidad, id_entidad.pk, id_entidad.__str__(), 1)
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
            register_logs(request, estado_entradas_proyecto, id_estado_entrada.pk, id_estado_entrada.__str__(), 1)
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
            register_logs(request, estado_indicador_objetivos, id_estado_indicador.pk, id_estado_indicador.__str__(), 1)
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
            register_logs(request, rol_trabajador_proyecto, id_rol_trabajador_proyecto.pk, id_rol_trabajador_proyecto.__str__(), 1)
            messages.success(request, "Rol en el proyecto creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomconsecutivo(LoginRequiredMixin,CreateView):
    model = consecutivo
    template_name = 'nomencladores/consecutivo/consecutivo_form.html'
    success_url = reverse_lazy("listar_consecutivo")
    contexto = {
            'form' : form.consecutivo_form,
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_consecutivo')

    def post(self, request, *args, **kwargs):
        forms = form.consecutivo_form(request.POST)
        # print(forms)
        # pass




        # gt = my_validates.comparar_valor_gt(forms['formato'].value(), 6)
        # if gt == False:
        #     messages.error(request, "Los formatos no pueden ser más de seis")
        #     return render(request, self.template_name, self.contexto)

        # obtener el value valor dentro del forms
        # fe = my_validates.future_year(forms['fecha_entrada'].value())
        # fi = my_validates.future_year(forms['fecha_inicio'].value())
        # ft = my_validates.future_year(forms['fecha_terminacion'].value())
        # fex = my_validates.future_year(forms['fecha_extension'].value())
        # ff = my_validates.future_year(forms['fecha_cierre'].value())
        # if fe == False or fi == False or ft == False:
        #     messages.error(request, "La fecha no puede ser posterior a la actual")
        #     return render(request, self.template_name, self.contexto)
        # if ft > fe or fex > fe:
        #     messages.error(request, "La fecha no puede ser mayor que la fecha de entrega")
        #     return render(request, self.template_name, self.contexto)
        # if ff < fi:
        #     messages.error(request, "La fecha de fin no puede ser menor que la fecha de inicio")
        #     return render(request, self.template_name, self.contexto)

        if forms.is_valid():
            forms.save()
            id_consecutivo = consecutivo.objects.last()
            register_logs(request, consecutivo, id_consecutivo.pk, id_consecutivo.__str__(), 1)
            messages.success(request, "Consecutivo creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                dicc = forms.errors.values()
                msg = str(dicc).split('\'')
                messages.error(request, msg[1])
            return render(self.request, self.template_name, self.contexto)

class nomrol_trabajador_consecutivo(LoginRequiredMixin,CreateView):
    model = rol_trabajador_consecutivo
    template_name = 'nomencladores/rol_trabajador_consecutivo/rol_trabajador_consecutivo_form.html'
    success_url = reverse_lazy("listar_rol_trabajador_consecutivo")
    contexto = {
            'form' : form.rol_trabajador_consecutivo_form
        }

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_rol_trabajador_consecutivo')

    def post(self, request, *args, **kwargs):
        forms = form.rol_trabajador_consecutivo_form(request.POST)
        if forms.is_valid():
            forms.save()
            id_rol_trabajador_consecutivo = rol_trabajador_consecutivo.objects.last()
            register_logs(request, rol_trabajador_consecutivo, id_rol_trabajador_consecutivo.pk, id_rol_trabajador_consecutivo.__str__(), 1)
            messages.success(request, "Rol en el consecutivo creado con éxito")
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
            register_logs(request, fuente_financiamiento, id_fuente_financiamiento.pk, id_fuente_financiamiento.__str__(), 1)
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
        return redirect('listar_rol_trabajador_proyecto')
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
        return redirect('listar_tipo_proyecto')
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
        return redirect('listar_linea_tematica')
    return render(request, template_name, contexto)
    
@login_required()
def act_desactarea(request, id):
    valor = request.POST.get('activate')
    area = models.area.objects.get(id = id)
    area.activo = True if valor == "on" else False
    area.save()
    return redirect('listar_areas')

class nomproceso(LoginRequiredMixin,CreateView):
    model = proceso
    form_class = form.procesoForm
    template_name = 'nomencladores/procesos_form.html'
    success_url = reverse_lazy("listar_procesos")

    def get_success_url(self):
        return reverse_lazy('listar_procesos')

    def post(self, request, *args, **kwargs):
        forms = form.procesoForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_proceso = proceso.objects.last()
            register_logs(request, proceso, id_proceso.uuid, id_proceso.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request,self.template_name)

@login_required()
def proceso_create(request):
    if request.POST:
        forms = form.procesoForm(request.POST)
        if not forms.is_valid():
            forms.save()
            id_proceso = proceso.objects.last()
            register_logs(request, proceso, id_proceso.pk, id_proceso.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect('/agregar/proceso/')
        else:
            messages.error(request, "Error en el formulario")
    else:
        return render(request, 'nomencladores/procesos.html')

@login_required()
def listar_procesos(request):
    listproc= models.proceso.objects.filter()
    contexto = {
        'listproc': listproc
    }
    return render(request, 'nomencladores/procesos.html', contexto)

class procesoUpdate(LoginRequiredMixin,UpdateView):
    model = proceso
    form_class = form.procesoForm
    template_name = 'nomencladores/procesos_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_procesos')

    def post(self, request, *args, **kwargs):
        register_logs(request, proceso, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

# class nomorganismo(LoginRequiredMixin,CreateView):
#     model = organismo
#     form_class = form.organismoForm
#     template_name = 'nomencladores/organismos_form.html'
#     success_url = reverse_lazy("listar_organismos")

#     def get_success_url(self):
#         return reverse_lazy('listar_organismos')

#     def post(self, request, *args, **kwargs):
#         forms = form.organismoForm(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_organismo = organismo.objects.last()
#             register_logs(request, organismo, id_organismo.pk, id_organismo.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponseRedirect(self.success_url)
#         else:
#             messages.error(request, "Existen errores en el formulario")
#             return render(request,self.template_name)

# @login_required()
# def listar_organismos(request):
#     listorg= models.organismo.objects.filter()
#     contexto = {
#         'listorg': listorg
#     }
#     return render(request, 'nomencladores/organismos.html', contexto)

# class organismoUpdate(LoginRequiredMixin,UpdateView):
#     model = organismo
#     form_class = form.organismoForm
#     template_name = 'nomencladores/organismoss_update_form.html'

#     def get_success_url(self):
#         return reverse_lazy('listar_organismos')

#     def post(self, request, *args, **kwargs):
#         register_logs(request, organismo, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Registro modificado con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)

class nomcurso(LoginRequiredMixin,CreateView):
    model = curso
    form_class = form.cursoForm
    template_name = 'nomencladores/cursos_form.html'
    success_url = reverse_lazy("listar_curso")

    def get_success_url(self):
        return reverse_lazy('listar_curso')

    def post(self, request, *args, **kwargs):
        forms = form.cursoForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_curso = curso.objects.last()
            register_logs(request, curso, id_curso.pk, id_curso.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request,self.template_name)

@login_required()
def listar_cursos(request):
    listcurs= models.curso.objects.all()
    contexto = {
        'listcurs': listcurs
    }
    return render(request, 'nomencladores/cursos.html', contexto)

class cursoUpdate(LoginRequiredMixin,UpdateView):
    model = curso
    form_class = form.cursoForm
    template_name = 'nomencladores/cursos_update_form.html'
    success_url = reverse_lazy('listar_curso')

    def get_success_url(self):
        return reverse_lazy('listar_curso')

    def post(self, request, *args, **kwargs):
        register_logs(request, curso, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

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
            register_logs(request, linea_tematica, id_linea_tematica.pk, id_linea_tematica.__str__(), 1)
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

class rol_trabajador_consecutivo_update(LoginRequiredMixin,UpdateView):
    model = rol_trabajador_consecutivo
    form_class = form.rol_trabajador_consecutivo_form
    template_name = 'nomencladores/rol_trabajador_consecutivo/rol_trabajador_consecutivo_update_form.html'
    success_url = reverse_lazy('listar_rol_trabajador_consecutivo')

    def get_success_url(self):
        return reverse_lazy('listar_rol_trabajador_consecutivo')

    def post(self, request, *args, **kwargs):
        register_logs(request, rol_trabajador_consecutivo, self.get_object().pk, self.get_object().__str__(), 2)
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

class consecutivo_update(LoginRequiredMixin,UpdateView):
    model = consecutivo
    form_class = form.consecutivo_form
    template_name = 'nomencladores/consecutivo/consecutivo_update_form.html'
    success_url = reverse_lazy('listar_consecutivo')

    def get_success_url(self):
        return reverse_lazy('listar_consecutivo')

    def post(self, request, *args, **kwargs):
        register_logs(request, consecutivo, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required()
def act_desactlinea_tematica(request, id):
    valor = request.POST.get('activate')
    col = models.linea_tematica.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_linea_tematica')

@login_required()
def act_desactestado_acuerdo(request, id):
    valor = request.POST.get('activate')
    col = models.estado_acuerdo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_estado_acuerdo')

@login_required()
def act_desactestado_proyecto(request, id):
    valor = request.POST.get('activate')
    col = models.estado_proyecto.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_estado_proyecto')

@login_required()
def act_desacttipo_proyecto(request, id):
    valor = request.POST.get('activate')
    col = models.tipo_proyecto.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_tipo_proyecto')

@login_required()
def act_desactfuente_financiamiento(request, id):
    valor = request.POST.get('activate')
    col = models.fuente_financiamiento.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_fuente_financiamiento')

@login_required()
def act_desactformato(request, id):
    valor = request.POST.get('activate')
    col = models.formato.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_formato')

@login_required()
def act_desactentidad(request, id):
    valor = request.POST.get('activate')
    col = models.entidad.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_entidad')

@login_required()
def act_desactestado_entrada(request, id):
    valor = request.POST.get('activate')
    col = models.estado_indicador_objetivos.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_estado_entrada')

@login_required()
def act_desactestado_indicador(request, id):
    valor = request.POST.get('activate')
    col = models.estado_indicador_objetivos.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_estado_indicador')

@login_required()
def act_desactrol_consecutivo(request, id):
    valor = request.POST.get('activate')
    col = models.rol_trabajador_consecutivo.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_rol_trabajador_consecutivo')

@login_required()
def act_desactrol_proyecto(request, id):
    valor = request.POST.get('activate')
    col = models.rol_trabajador_proyecto.objects.get(id = id)
    col.activo = True if valor == "on" else False
    col.save()
    return redirect('listar_rol_trabajador_proyecto')

@login_required()
def act_desactProc(request,id):
    valor_campo = request.POST.get('activate')
    proc = models.proceso.objects.get(id=id)
    proc.activo = True if valor_campo == "on" else False
    proc.save()
    return redirect('listar_procesos')


@login_required()
def act_desactClienteExterno(request,id):
    valor_campo = request.POST.get('activate')
    client = models.cliente_externo.objects.get(id=id)
    client.activo = True if valor_campo == "on" else False
    client.save()
    return redirect('listar_clienteext')

@login_required()
def act_desactconformidadEficacia(request,id):
    valor_campo = request.POST.get('activate')
    eficacia = models.eficacia.objects.get(id=id)
    eficacia.conformidad = True if valor_campo == "on" else False
    eficacia.save()
    return redirect('listar_eficacia')

@login_required()
def act_desactTrabajador(request,id):
    valor_campo = request.POST.get('activate')
    trabajador = models.trabajador.objects.get(id=id)
    trabajador.activo = True if valor_campo == "on" else False
    trabajador.save()
    return redirect('listar_trabajadores')

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
    datos = models.consecutivo.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/rol_trabajador_proyecto/rol_trabajador_proyecto.html', contexto)

@login_required()
def listar_consecutivo(request):
    datos = models.consecutivo.objects.filter()
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/consecutivo/consecutivo.html', contexto)

class nommetodosprueba(LoginRequiredMixin,CreateView):
    model = metodosprueba
    form_class = form.metpruebaForm
    template_name = 'nomencladores/metodosprueba_form.html'
    success_url = reverse_lazy("listar_metodospruebas")

    def get_success_url(self):
        return reverse_lazy('listar_metodospruebas')

    def post(self, request, *args, **kwargs):
        forms = form.metpruebaForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_metprueba = metodosprueba.objects.last()
            register_logs(request, metodosprueba, id_metprueba.pk, id_metprueba.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request,self.template_name)

@login_required()
def listar_metodosprueb(request):
    listmetprueb= models.metodosprueba.objects.all()
    contexto = {
        'listmetprueb': listmetprueb
    }
    return render(request, 'nomencladores/metodosprueba.html', contexto)

class metodosUpdate(LoginRequiredMixin,UpdateView):
    model = metodosprueba
    form_class = form.metpruebaForm
    template_name = 'nomencladores/metodosprueba_update_form.html'
    success_url = reverse_lazy('listar_metodospruebas')

    def get_success_url(self):
        return reverse_lazy('listar_metodospruebas')

    def post(self, request, *args, **kwargs):
        register_logs(request, metodosprueba, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

# class nomestado_no_conformidad(LoginRequiredMixin,CreateView):
#     model = estado_no_conformidad
#     form_class = form.estadonoconformidadForm
#     template_name = 'nomencladores/estadonoconformidad_form.html'
#     success_url = reverse_lazy("listar_estadonoconformidad")

#     def get_success_url(self):
#         return reverse_lazy('listar_estadonoconformidad')

#     def post(self, request, *args, **kwargs):
#         forms = form.estadonoconformidadForm(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_estconf = estado_no_conformidad.objects.last()
#             register_logs(request, estado_no_conformidad, id_estconf.pk, id_estconf.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponseRedirect(self.success_url)
#         else:
#             messages.error(request, "Existen errores en el formulario")
#             return render(request,self.template_name)

# @login_required()
# def estadonoconformidad_create(request):

#     if request.POST:
#         forms = form.estadonoconformidadForm(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_estado = estado_no_conformidad.objects.last()
#             register_logs(request, estado_no_conformidad, id_estado.pk, id_estado.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponse('/agregar/atencioncliente/')
#         else:
#             messages.error(request, "Error en el formulario")


# @login_required()
# def listar_estadonoconformidad(request):
#     listestnoconf= models.estado_no_conformidad.objects.all()
#     contexto = {
#         'listestnoconf': listestnoconf
#     }
#     return render(request, 'nomencladores/estadonoconformidad.html', contexto)

# class estadonoconformUpdate(LoginRequiredMixin,UpdateView):
#     model = estado_no_conformidad
#     form_class = form.estadonoconformidadForm
#     template_name = 'nomencladores/estadonoconformidad_update_form.html'

#     def get_success_url(self):
#         return reverse_lazy('listar_estadonoconformidad')

#     def post(self, request, *args, **kwargs):
#         register_logs(request, estado_no_conformidad, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Registro creado con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)

#//--Entrada de Datos
# class nomaspmedirefic(LoginRequiredMixin,CreateView):
#     model = aspecto_Medir_IndicadorEficacia
#     form_class = form.aspectosindicadoreficaciaForm
#     template_name = 'entradadatos/aspectos_medir_eficacia_form.html'
#     success_url = reverse_lazy('listar_aspeficacia')

#     def get_success_url(self):
#         return reverse_lazy('listar_aspeficacia')

#     def post(self, request, *args, **kwargs):
#         forms = form.aspectosindicadoreficaciaForm(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_asp = aspecto_Medir_IndicadorEficacia.objects.last()
#             register_logs(request, aspecto_Medir_IndicadorEficacia, id_asp.pk, id_asp.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponseRedirect(self.success_url)
#         else:
#             messages.error(request, "Existen errores en el formulario")
#             return render(request,self.template_name)

# @login_required()
# def listar_aspmedirefic(request):
#     listaspmedirefic = models.aspecto_Medir_IndicadorEficacia.objects.all()
#     contexto = {
#         'listaspmedirefic': listaspmedirefic
#     }
#     return render(request, 'entradadatos/aspectos_medir_eficacia.html', contexto)

# class aspmedireficUpdate(LoginRequiredMixin,UpdateView):
#     model = aspecto_Medir_IndicadorEficacia
#     form_class = form.aspectosindicadoreficaciaForm
#     template_name = 'entradadatos/aspectos_medir_eficacia_update_form.html'
#     success_url = reverse_lazy("listar_aspeficacia")

#     def get_success_url(self):
#         return reverse_lazy('listar_aspeficacia')

#     def post(self, request, *args, **kwargs):
#         register_logs(request, aspecto_Medir_IndicadorEficacia, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Registro modificado con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)


class nomindefic(LoginRequiredMixin,CreateView):
    model = indicador
    form_class = form.indicadoreficaciaForm
    template_name = 'entradadatos/indicador_eficacia_form.html'
    success_url = reverse_lazy('listar_indeficacia')

    def get_success_url(self):
        return reverse_lazy('listar_indeficacia')

    def post(self, request, *args, **kwargs):
        forms = form.indicadoreficaciaForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_indefic = indicador.objects.last()
            register_logs(request, indicador, id_indefic.pk, id_indefic.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request,self.template_name)

@login_required()
def listar_indefic(request):
    listindefic= models.indicador_eficacia.objects.all()
    contexto = {
        'listindefic': listindefic
    }

    return render(request, 'entradadatos/indicador_eficacia.html', contexto)

class indeficUpdate(LoginRequiredMixin,UpdateView):
    model = indicador
    form_class = form.indicadoreficaciaForm
    template_name = 'entradadatos/indicador_eficacia_update_form.html'
    success_url =  reverse_lazy('listar_indeficacia')

    def get_success_url(self):
        return reverse_lazy('listar_indeficacia')

    def post(self, request, *args, **kwargs):
        register_logs(request, indicador, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

class nomcliemteexterno(LoginRequiredMixin,CreateView):
    model = cliente
    form_class = form.clienteForm
    template_name = 'entradadatos/clientes_externos_form.html'
    success_url = reverse_lazy('listar_clienteext')

    def get_success_url(self):
        return reverse_lazy('listar_clienteext')

    def post(self, request, *args, **kwargs):
        forms = form.clienteForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_clienteext = cliente.objects.last()
            register_logs(request, cliente, id_clienteext.pk, id_clienteext.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request,self.template_name)

@login_required()
def clienteext_create(request):
    if request.POST:
        forms = form.clienteextForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_clientext = cliente.objects.last()
            register_logs(request, cliente, id_clientext.pk, id_clientext.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect('/agregar/atencioncliente/')
        else:
            messages.error(request, "Error en el formulario")
    else:
        forms = form.clienteForm()
    args = {}
    args['forms'] = forms
    return render(request, 'P00/atencion_clientes_externos_form.html', args)

@login_required()
def listar_clienteexternos(request):
    listclientext= models.cliente.objects.filter(activo=True)
    contexto = {
        'listclientext': listclientext
    }
    return render(request, 'entradadatos/clientes_externos.html', contexto)

class clienteexternoUpdate(LoginRequiredMixin,UpdateView):
    model = cliente
    form_class = form.clienteForm
    template_name = 'entradadatos/clientes_externos_update_form.html'

    def get_success_url(self):
        return reverse_lazy('listar_clienteext')

    def post(self, request, *args, **kwargs):
        register_logs(request, cliente, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)


class nomtrabajador(LoginRequiredMixin,CreateView):
    model = trabajador
    form_class = form.trabajadorForm
    template_name = 'entradadatos/trabajadores_form.html'
    success_url = reverse_lazy("listar_trabajadores")

    def get_success_url(self):
        return reverse_lazy('listar_trabajadores')

    def post(self, request, *args, **kwargs):
        forms = form.trabajadorForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_trabajo = trabajador.objects.last()
            register_logs(request, trabajador, id_trabajo.pk, id_trabajo.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request,self.template_name)


@login_required()
def listar_trabajadoresentrar(request):
    listtrab=models.trabajador.objects.all()
    contexto = {
        'listtrab': listtrab
    }
    return render(request, 'entradadatos/trabajadores.html', contexto)


class trabajadorUpdate(LoginRequiredMixin,UpdateView):
    model = trabajador
    form_class = form.trabajadorForm
    template_name = 'entradadatos/trabajadores_update_form.html'
    success_url = reverse_lazy('listar_trabajadores')

    def get_success_url(self):
        return reverse_lazy('listar_trabajadores')

    def post(self, request, *args, **kwargs):
        register_logs(request, trabajador, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

# @login_required()
# def listar_historico_entradas_proyectos(request):
#     listhistentproy= models.Historico_Entradas_proyectos.objects.all()
#     contexto = {
#         'listhistentproy': listhistentproy
#     }
#     return render(request, 'P03/Historico_ Entradas_Proyectos.html', contexto)

# class nomhistorico_entradas_proyectos(LoginRequiredMixin,CreateView):
#     model = Historico_Entradas_proyectos
#     form_class = form.historicoentradasproyectoForm
#     template_name = 'P03/Historico_  Entradas_Proyectos_form.html'
#     success_url = reverse_lazy('listar_histentproy')

#     def get_success_url(self):
#         return reverse_lazy('listar_histentproy')

#     def post(self, request, *args, **kwargs):
#         forms = form.historicoentradasproyectoForm(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_histentproy = Historico_Entradas_proyectos.objects.last()
#             register_logs(request, Historico_Entradas_proyectos, id_histentproy.pk, id_histentproy.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponseRedirect(self.success_url)
#         else:
#             messages.error(request, "Existen errores en el formulario")
#             return render(request, self.template_name)

# class historico_entradas_proyectosUpdate(LoginRequiredMixin,UpdateView):
#     model = Historico_Entradas_proyectos
#     form_class = form.historicoentradasproyectoForm
#     template_name = 'P03/Historico_  Entradas_Proyectos_update_form.html'
#     success_url = reverse_lazy('listar_histentproy')

#     def get_success_url(self):
#         return reverse_lazy('listar_histentproy')

#     def post(self, request, *args, **kwargs):
#         register_logs(request, Historico_Entradas_proyectos, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Registro modificado con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)

# @login_required()
# def listar_formacion(request):
#     listarformacion= models.formacion_personal.objects.all()
#     contexto = {
#         'listarformacion': listarformacion
#     }
#     return render(request, 'entradadatos/formacion_personal.html', contexto)

# class nomformacion(LoginRequiredMixin,CreateView):
#     model = formacion_personal
#     form_class = form.formacionpersonalForm
#     template_name = 'entradadatos/formacion_personal_form.html'
#     success_url = reverse_lazy('listar_formacionpersonal')

#     def get_success_url(self):
#         return reverse_lazy('listar_formacion')

#     def post(self, request, *args, **kwargs):
#         forms = form.formacionpersonalForm(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_formaper = formacion_personal.objects.last()
#             register_logs(request, formacion_personal, id_formaper.pk, id_formaper.__str__(), 1)
#             messages.success(request, "Registro creado con éxito")
#             return HttpResponseRedirect(self.success_url)
#         else:
#             messages.error(request, "Existen errores en el formulario")
#             return render(request, self.template_name)

# class formacionpersonalUpdate(LoginRequiredMixin,UpdateView):
#     model = formacion_personal
#     form_class = form.formacionpersonalForm
#     template_name = 'entradadatos/formacion_personal_update_form.html'
#     success_url = reverse_lazy('listar_formacion')
#
#     def get_success_url(self):
#         return reverse_lazy('listar_formacion')
#
#     def post(self, request, *args, **kwargs):
#         register_logs(request, formacion_personal, self.get_object().pk, self.get_object().__str__(), 2)
#         self.object = self.get_object()
#         messages.success(request, "Registro modificado con éxito")
#         return super(BaseUpdateView, self).post(request, *args, **kwargs)

@login_required()
def listar_clasificacionincidencias(request):
    listarclasificaciones= models.clasificacionincidencias.objects.all()
    contexto = {
        'listarclasificaciones': listarclasificaciones
    }
    return render(request, 'nomencladores/clasificacion_incidencias.html', contexto)

class nomclasificacionincidencias(LoginRequiredMixin,CreateView):
    model = models.incidencia
    form_class = form.incidenciaForm
    template_name = 'nomencladores/clasificacion_incidencias_form.html'
    success_url = reverse_lazy('listar_clasificacioninc')

    def get_success_url(self):
        return reverse_lazy('listar_clasificacioninc')

    def post(self, request, *args, **kwargs):
        forms = form.incidenciaForm(request.POST)
        if forms.is_valid():
            forms.save()
            id_clasinc = models.clasificacionincidencias.objects.last()
            register_logs(request, models.clasificacionincidencias, id_clasinc.pk, id_clasinc.__str__(), 1)
            messages.success(request, "Registro creado con éxito")
            return HttpResponseRedirect(self.success_url)
        else:
            messages.error(request, "Existen errores en el formulario")
            return render(request, self.template_name, self.contexto)

class clasificacionincidenciasUpdate(LoginRequiredMixin,UpdateView):
    model = models.incidencia
    form_class = form.incidenciaForm
    template_name = 'nomencladores/clasificacion_incidencias_update_form.html'
    success_url = reverse_lazy('listar_clasificacioninc')

    def get_success_url(self):
        return reverse_lazy('listar_clasificacioninc')

    def post(self, request, *args, **kwargs):
        register_logs(request, models.clasificacionincidencias, self.get_object().pk, self.get_object().__str__(), 2)
        self.object = self.get_object()
        messages.success(request, "Registro modificado con éxito")
        return super(BaseUpdateView, self).post(request, *args, **kwargs)

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
