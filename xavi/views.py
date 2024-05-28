import os
import json
import sys
from django.contrib.auth.decorators import login_required, user_passes_test, permission_required
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.admin.models import LogEntry
from django.shortcuts import render, get_object_or_404, get_list_or_404
from apps.base.utils import get_page_body, get_logos, logs
from requests import request
from SISGDDO import models as sisgddo_models
import uuid
import re
# from xavi.models import Afectaciones
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
from django.core import serializers
from ProyectoBaseApp import models as modelsadmin

from django.contrib import messages
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from notifications.signals import notify
from django.shortcuts import redirect
from django.contrib.auth.mixins import LoginRequiredMixin
from apps.base.models import Employee, Position, Entity
from django.views.decorators.csrf import csrf_exempt
from SISGDDO import form as sisgddo_form
# from xavi.models import proyecto, trabajador_proyecto
from xavi import models
from xavi import form
from xavi.models import area, representante, descripcion, cliente, idioma, estado_indicador_objetivos, estado_entradas_proyecto, acuerdo, linea_tematica,area,formato,estado_acuerdo,estado_proyecto
from xavi.models import tipo_proyecto, fuente_financiamiento, formato, estado_entradas_proyecto, objetivo, indicador_objetivos, accion_indicador_objetivo
from xavi.models import sosi, clasificacion, premio, evaluacion, evaluacion_trimestral, periodo, prioridad, tipo_extension, estado_proyecto_dgca, proyecto, trabajador_proyecto
from xavi.models import registro_aprobacion, registro_terminacion, subclasificacion, entrada_proyecto, etapa_proyecto, trabajador_registro, financiamiento_proyecto, tipo_moneda
from xavi.models import autor_sosi, plan_ingreso_aprobacion, registro_reinicio, registro_interrupcion, registro_extension, trabajador_etapa, control_etapa
from SISGDDO.models import Afectaciones, PlanTrabajo, ActividadPlan
from SISGDDO.form import AfectationModelForm, ModifyAfectationModelForm,IncidenciaModelForm, ModifiyIncidenciaModelForm, AuditoriaInternaModelForm, ModAuditoriaInternaModelForm, AuditoriaExternaModelForm, ModAuditoriaExternaModelForm, CompModAfectationModelForm, CompModIncidenciaModelForm, ActividadesModelForm, PlanModelForm,incidencia,auditoria_externa,auditoria_interna
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
from django.db.models import Sum, Count, Q, F, Prefetch, Case, When, CharField, Value
from django.db.models import OuterRef, Subquery, ExpressionWrapper, fields
from django.db.models.functions import Concat, ExtractMonth, ExtractYear, Now
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
from django.db.utils import OperationalError
from django.views.decorators.debug import sensitive_post_parameters
from ProyectoBaseApp.models import UserApp
from Tesis_Citmatel.settings import DATABASES, BASE_DIR
from django.contrib.auth import authenticate, login
import random
from django.contrib.auth.hashers import make_password
from xavi.utils import *
from itertools import islice

from django.contrib.auth.models import User, Group, Permission
from django.contrib.contenttypes.models import ContentType
#vistas #Javier #listar
@login_required
@user_has_any_permission('SISGDDO.view_afectaciones', 'xavi.view_proyecto', 'xavi.view_accion_indicador_objetivo', 'SISGDDO.view_add_incidencia')
@handle_exceptions
def listar_area(request):
    contexto = {
        'lista': models.area.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/area/areas.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_cliente')
@handle_exceptions
def listar_cliente(request):
    contexto = {
        'lista': models.cliente.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/cliente/clientes.html', contexto)

@login_required
@user_has_any_permission('xavi.view_sosi', 'xavi.view_autor')
@handle_exceptions
def listar_autor(request):
    contexto = {
        'lista': models.autor_sosi.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/autor/autor.html', contexto)

@login_required
@user_has_any_permission('xavi.view_sosi', 'xavi.view_idioma')
@handle_exceptions
def listar_idioma(request):
    contexto = {
        'lista': models.idioma.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/idioma/idiomas.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_representante')
@handle_exceptions
def listar_representante(request):
    contexto = {
        'lista': models.representante.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/representante/representantes.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_etapa_proyecto')
@handle_exceptions
def listar_etapa_proyecto(request):
    contexto = {
        'lista': models.etapa_proyecto.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/etapa/etapa.html', contexto)

@login_required
@user_has_any_permission('xavi.view_objetivo', 'xavi.view_evaluacion')
@handle_exceptions
def listar_evaluacion(request):
    contexto = {
        'lista': models.evaluacion.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/evaluacion/evaluaciones.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_prioridad')
@handle_exceptions
def listar_prioridad(request):
    contexto = {
        'lista': models.prioridad.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/prioridad/prioridades.html', contexto)

@login_required
@user_has_any_permission('xavi.view_objetivo', 'xavi.view_periodo')
@handle_exceptions
def listar_periodo(request):
    contexto = {
        'lista': models.periodo.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/periodo/periodos.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_tipo_extension')
@handle_exceptions
def listar_tipo_extension(request):
    contexto = {
        'lista': models.tipo_extension.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/tipo_extension/tipo_extension.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_tipo_moneda')
@handle_exceptions
def listar_tipo_moneda(request):
    contexto = {
        'lista': models.tipo_moneda.objects.filter(activo = True).order_by('nombre')
    }
    # print(contexto['lista'])
    return render(request, 'nomencladores/tipo_moneda/tipo_moneda.html', contexto)

#Vistas del P00
class nomprioridad(LoginRequiredMixin, View):
    model = prioridad
    template_name = 'nomencladores/prioridad/prioridad_form.html'
    success_url = reverse_lazy("listar_prioridades")
    contexto = {
        'form': form.prioridad_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_prioridad'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_prioridades')

    def post(self, request, *args, **kwargs):
        forms = form.prioridad_form(request.POST)

        if forms.is_valid():
            new_prioridad = forms.save()
            id_prioridad = new_prioridad.pk
            
            register_logs(request, prioridad, id_prioridad, new_prioridad.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de prioridad: {new_prioridad.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Prioridad creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomperiodo(LoginRequiredMixin, View):
    model = periodo
    template_name = 'nomencladores/periodo/periodo_form.html'
    success_url = reverse_lazy("listar_periodos")
    contexto = {
        'form': form.periodo_form
    }

    @method_decorator(user_has_any_permission('xavi.add_objetivo', 'xavi.add_periodo'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_periodos')

    def post(self, request, *args, **kwargs):
        forms = form.periodo_form(request.POST)

        if forms.is_valid():
            new_periodo = forms.save()
            id_periodo = new_periodo.pk
            
            register_logs(request, periodo, id_periodo, new_periodo.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de periodo: {new_periodo.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Periodo creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomtipo_extension(LoginRequiredMixin, View):
    model = tipo_extension
    template_name = 'nomencladores/tipo_extension/tipo_extension_form.html'
    success_url = reverse_lazy("listar_tipo_extension")
    contexto = {
        'form': form.tipo_extension_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_tipo_extension'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_tipo_extension')

    def post(self, request, *args, **kwargs):
        forms = form.tipo_extension_form(request.POST)

        if forms.is_valid():
            new_tipo_extension = forms.save()
            id_tipo_extension = new_tipo_extension.pk
            
            register_logs(request, tipo_extension, id_tipo_extension, new_tipo_extension.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de tipo de extensión: {new_tipo_extension.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Tipo de extensión creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomtipo_moneda(LoginRequiredMixin, View):
    model = tipo_moneda
    template_name = 'nomencladores/tipo_moneda/tipo_moneda_form.html'
    success_url = reverse_lazy("listar_tipo_moneda")
    contexto = {
        'form': form.tipo_moneda_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_tipo_moneda'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_tipo_moneda')

    def post(self, request, *args, **kwargs):
        forms = form.tipo_moneda_form(request.POST)

        if forms.is_valid():
            new_tipo_moneda = forms.save()
            id_tipo_moneda = new_tipo_moneda.pk
            
            register_logs(request, tipo_moneda, id_tipo_moneda, new_tipo_moneda.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de tipo de extensión: {new_tipo_moneda.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Tipo de moneda creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomarea(LoginRequiredMixin, View):
    model = area
    template_name = 'nomencladores/area/area_form.html'
    success_url = reverse_lazy("listar_areas")
    contexto = {
        'form': form.area_form
    }

    @method_decorator(user_has_any_permission('SISGDDO.add_afectaciones', 'xavi.add_accion_indicador_objetivo', 'xavi.add_proyecto','SISGDDO.add_incidencia', 'xavi.add_area'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_areas')

    def post(self, request, *args, **kwargs):
        forms = form.area_form(request.POST)

        if forms.is_valid():
            new_area = forms.save()
            id_area = new_area.pk
            
            register_logs(request, area, id_area, new_area.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_area.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Área creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomcliente(LoginRequiredMixin, View):
    model = cliente
    template_name = 'nomencladores/cliente/cliente_form.html'
    success_url = reverse_lazy("listar_clientes")
    contexto = {
        'form': form.cliente_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_cliente'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_clientes')

    def post(self, request, *args, **kwargs):
        forms = form.cliente_form(request.POST)

        if forms.is_valid():
            new_cliente = forms.save()
            id_cliente = new_cliente.pk
            
            register_logs(request, cliente, id_cliente, new_cliente.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_cliente.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Cliente creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomautor(LoginRequiredMixin, View):
    model = autor_sosi
    template_name = 'nomencladores/autor/autor_form.html'
    success_url = reverse_lazy("listar_autor")
    contexto = {
        'form': form.autor_form
    }

    @method_decorator(user_has_any_permission('xavi.add_sosi'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_autor')

    def post(self, request, *args, **kwargs):
        forms = form.autor_form(request.POST)

        if forms.is_valid():
            new_autor_sosi = forms.save()
            id_cliente = new_autor_sosi.pk
            
            register_logs(request, autor_sosi, id_cliente, new_autor_sosi.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_cliente.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Autor de SOSI creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomidioma(LoginRequiredMixin, View):
    model = idioma
    template_name = 'nomencladores/idioma/idioma_form.html'
    success_url = reverse_lazy("listar_idiomas")
    contexto = {
        'form': form.idioma_form
    }

    @method_decorator(user_has_any_permission('xavi.add_sosi', 'xavi.add_idioma'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_idiomas')

    def post(self, request, *args, **kwargs):
        forms = form.idioma_form(request.POST)

        if forms.is_valid():
            new_idioma = forms.save()
            id_idioma = new_idioma.pk
            
            register_logs(request, idioma, id_idioma, new_idioma.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_idioma.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Idioma creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomrepresentante(LoginRequiredMixin, View):
    model = representante
    template_name = 'nomencladores/representante/representante_form.html'
    success_url = reverse_lazy("listar_representantes")
    contexto = {
        'form': form.representante_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_cliente', 'xavi.add_representante'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_representantes')

    def post(self, request, *args, **kwargs):
        forms = form.representante_form(request.POST)

        if forms.is_valid():
            new_representante = forms.save()
            id_representante = new_representante.pk
            
            register_logs(request, representante, id_representante, new_representante.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_idioma.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Representante creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nometapa_proyecto(LoginRequiredMixin, View):
    model = etapa_proyecto
    template_name = 'nomencladores/etapa/etapa_form.html'
    success_url = reverse_lazy("listar_etapa_proyecto")
    contexto = {
        'form': form.etapa_proyecto_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_etapa_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_etapa_proyecto')

    def post(self, request, *args, **kwargs):
        forms = form.etapa_proyecto_form(request.POST)

        if forms.is_valid():
            new_area = forms.save()
            id_area = new_area.pk
            
            register_logs(request, etapa_proyecto, id_area, new_area.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_area.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Etapa de proyecto creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomevaluacion(LoginRequiredMixin, View):
    model = evaluacion
    template_name = 'nomencladores/evaluacion/evaluacion_form.html'
    success_url = reverse_lazy("listar_evaluaciones")
    contexto = {
        'form': form.evaluacion_form
    }

    @method_decorator(user_has_any_permission('xavi.add_objetivo', 'xavi.add_evaluacion'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_evaluaciones')

    def post(self, request, *args, **kwargs):
        forms = form.evaluacion_form(request.POST)

        if forms.is_valid():
            new_evaluacion = forms.save()
            id_evaluacion = new_evaluacion.pk
            
            register_logs(request, evaluacion, id_evaluacion, new_evaluacion.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de evaluación: {new_evaluacion.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Evaluación creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

class nomestado_acuerdo(LoginRequiredMixin, View):
    model = estado_acuerdo
    template_name = 'nomencladores/estado_acuerdo/estado_acuerdo_form.html'
    success_url = reverse_lazy("listar_estado_acuerdo")
    contexto = {
        'form': form.estado_acuerdo_form
    }

    @method_decorator(user_has_any_permission('xavi.add_acuerdo', 'xavi.add_estado_acuerdo'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_estado_acuerdo')

    def post(self, request, *args, **kwargs):
        forms = form.estado_acuerdo_form(request.POST)

        if forms.is_valid():
            new_estado_acuerdo = forms.save()
            id_estado_acuerdo = new_estado_acuerdo.pk
            register_logs(request, estado_acuerdo, id_estado_acuerdo, new_estado_acuerdo.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo estado de Acuerdo CD: { estado_acuerdo }', level='info')
            
            response = {
                'result': 'success',
                'title': 'Estado de Acuerdo del Consejo de Dirección creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

class nomestado_proyecto(LoginRequiredMixin,CreateView):
    model = estado_proyecto
    template_name = 'nomencladores/estado_proyecto/estado_proyecto_form.html'
    success_url = reverse_lazy("listar_estado_proyecto")
    contexto = {
            'form' : form.estado_proyecto_form
        }
    
    @method_decorator(login_required)
    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_etapa_proyecto', 'xavi.add_estado_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_estado_proyecto')

    def post(self, request, *args, **kwargs):
        forms = form.estado_proyecto_form(request.POST)

        if forms.is_valid():
            new_estado = forms.save()
            id_estado = new_estado.pk
            
            register_logs(request, new_estado, id_estado, new_estado.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de estado de proyecto: {new_estado.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Estado de proyecto creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

class nomtipo_proyecto(LoginRequiredMixin,CreateView):
    model = tipo_proyecto
    template_name = 'nomencladores/tipo_proyecto/tipo_proyecto_form.html'
    success_url = reverse_lazy("listar_tipo_proyecto")
    contexto = {
            'form' : form.tipo_proyecto_form
        }

    @method_decorator(login_required)
    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_tipo_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_tipo_proyecto')

    def post(self, request, *args, **kwargs):
        forms = form.tipo_proyecto_form(request.POST)

        if forms.is_valid():
            new_estado = forms.save()
            id_estado = new_estado.pk
            
            register_logs(request, new_estado, id_estado, new_estado.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de tipo de proyecto: {new_estado.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Tipo de proyecto creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomclasificacion(LoginRequiredMixin,CreateView):
    model = clasificacion
    template_name = 'nomencladores/clasificacion/clasificacion_form.html'
    success_url = reverse_lazy("listar_clasificacion")
    contexto = {
            'form' : form.clasificacion_form
        }

    @method_decorator(login_required)
    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_clasificacion'))
    @method_decorator(csrf_protect)
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_clasificacion')

    def post(self, request, *args, **kwargs):
        forms = form.clasificacion_form(request.POST)

        if forms.is_valid():
            new_estado = forms.save()
            id_estado = new_estado.pk
            
            register_logs(request, new_estado, id_estado, new_estado.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de estado de proyecto: {new_estado.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Clasificación de proyecto creada con éxito'
            }
            return JsonResponse(response)
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)
        
class nomsubclasificacion(LoginRequiredMixin,CreateView):
    model = subclasificacion
    template_name = 'nomencladores/subclasificacion/subclasificacion_form.html'
    success_url = reverse_lazy("listar_subclasificacion")
    contexto = {
            'form' : form.subclasificacion_form
        }

    @method_decorator(login_required)
    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_clasificacion', 'xavi.add_subclasificacion'))
    @method_decorator(csrf_protect)
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_subclasificacion')

    def post(self, request, *args, **kwargs):
        forms = form.subclasificacion_form(request.POST)

        if forms.is_valid():
            new_estado = forms.save()
            id_estado = new_estado.pk
            
            register_logs(request, new_estado, id_estado, new_estado.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de estado de proyecto: {new_estado.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Sublasificación de proyecto creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

class nomfuente_financiamiento(LoginRequiredMixin, View):
    model = fuente_financiamiento
    template_name = 'nomencladores/fuente_financiamiento/fuente_financiamiento_form.html'
    success_url = reverse_lazy("listar_fuente_financiamiento")
    contexto = {
        'form': form.fuente_financiamiento_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_fuente_financiamiento'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_fuente_financiamiento')

    def post(self, request, *args, **kwargs):
        forms = form.fuente_financiamiento_form(request.POST)

        if forms.is_valid():
            new_area = forms.save()
            id_area = new_area.pk
            
            register_logs(request, fuente_financiamiento, id_area, new_area.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_area.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Fuente de financiamiento creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

class nomformato(LoginRequiredMixin, View):
    model = formato
    template_name = 'nomencladores/formato/formato_form.html'
    success_url = reverse_lazy("listar_formato")
    contexto = {
        'form': form.formato_form
    }

    @method_decorator(user_has_any_permission('SISGDDO.add_afectaciones', 'xavi.add_proyecto', 'xavi.add_entrada_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_formato')

    def post(self, request, *args, **kwargs):
        forms = form.formato_form(request.POST)

        if forms.is_valid():
            new_area = forms.save()
            id_area = new_area.pk
            
            register_logs(request, formato, id_area, new_area.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_area.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Formato creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

class nomestado_proyecto_dgca(LoginRequiredMixin,CreateView):
    model = estado_proyecto_dgca
    template_name = 'nomencladores/estado_entrada/estado_entrada_form.html'
    success_url = reverse_lazy("listar_estado_entrada")
    contexto = {
            'form' : form.estado_entradas_proyecto_form
        }

    @method_decorator(login_required)
    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_entrada_proyecto', 'xavi.add_estado_proyecto_dgca'))
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_estado_entrada')

    def post(self, request, *args, **kwargs):
        forms = form.estado_entradas_proyecto_form(request.POST)

        if forms.is_valid():
            new_estado = forms.save()
            id_estado = new_estado.pk
            
            register_logs(request, new_estado, id_estado, new_estado.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de estado de proyecto en DGCA: {new_estado.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Estado de proyecto en DGCA creado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

# class nomestado_indicador(LoginRequiredMixin,CreateView):
#     model = estado_indicador_objetivos
#     template_name = 'nomencladores/estado_indicador/estado_indicador_form.html'
#     success_url = reverse_lazy("listar_estado_indicador")
#     contexto = {
#             'form' : form.estado_indicador_objetivos_form
#         }

#     @method_decorator(login_required)
#     @method_decorator(permission_required('xavi.add_estado_indicador_objetivos'))
#     @method_decorator(handle_exceptions)
#     def dispatch(self, request, *args, **kwargs):
#         return super().dispatch(request, *args, **kwargs)
    
#     def get(self, request):
#         return render(request, self.template_name, self.contexto)

#     def get_success_url(self):
#         return reverse_lazy('listar_estado_indicador')

#     def post(self, request, *args, **kwargs):
#         forms = form.estado_indicador_objetivos_form(request.POST)
#         if forms.is_valid():
#             forms.save()
#             id_estado_indicador = estado_indicador_objetivos.objects.last()
#             register_logs(request, estado_indicador_objetivos, id_estado_indicador.pk, id_estado_indicador.__str__(), 1)
#             #messages.success(request, "Estado de indicador creado con éxito")
#             return HttpResponseRedirect(self.success_url)
#         else:
#             if forms.errors:
#                 """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
#                 dicc = forms.errors.values()
#                 msg = str(dicc).split('\'')
#                 #messages.error(request, msg[1])
#             return render(self.request, self.template_name, self.contexto)
        
@login_required
@permission_required('xavi.add_proyecto')
@handle_exceptions
def nomproyecto(request):        
    tcod = clasificacion.objects.filter(activo = True).order_by('nombre')
    # tprioridad = prioridad.objects.filter(activo = True)
    tcliente = cliente.objects.filter(activo = True).order_by('nombre')
    # tproy = tipo_proyecto.objects.filter(activo = True)
    tareas = area.objects.filter(activo = True).order_by('nombre')
    tformatos = formato.objects.filter(activo = True).order_by('nombre')
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tcom = Employee.objects.filter(active = True).order_by('first_name')
    tlin = linea_tematica.objects.filter(activo = True).order_by('nombre')
    # try:
    test = estado_proyecto.objects.filter(activo = True).order_by('nombre')
    # except:
    #     estado = estado_proyecto.objects.get(activo = True)
    tfue = fuente_financiamiento.objects.filter(activo = True).order_by('nombre')
    
    template_name = 'P01/proyecto/proyecto_form.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'no' : get_ultimo(proyecto),
        # 'tproy' : tproy,
        'tcod' : tcod,
        'tareas' : tareas,
        'tformatos' : tformatos,
        'tcliente' : tcliente,
        'ttrab' : ttrab,
        'tcom' : tcom,
        'tlin' : tlin,
        'test' : test,
        'tfue' : tfue,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.proyecto_form(request.POST, request.FILES)
        registro_form = form.registro_aprobacion_form(request.POST, request.FILES)
        
        res = validar_objeto(models.proyecto, ['no'], forms)
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)
        
        ultimo_numero_proyecto = models.proyecto.objects.order_by('no').last()
        if int(ultimo_numero_proyecto.no) < int(forms['no'].value()) - 1:
            res['result'] = 'error'
            res['title'] = 'Error: está a punto de saltarse un número'
            res['text'] = f'El último número actual es {ultimo_numero_proyecto.no}'
            num_actual = int(forms['no'].value())
            res['error_message'] = f'El próximo número debería ser {int(ultimo_numero_proyecto.no) + 1}, pero es {num_actual}'
            res['field'] = 'no'
            return JsonResponse(res)
          
        res = validar_objeto(models.proyecto, ['codigo'], forms)
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)    
                
        # res = validar_objeto(models.proyecto, ['codigo'], forms)
        # if res['result'] == 'errorField' or res['result'] == 'error':
            # res['text'] = ''
            # res['error_message'] = ''
        #     return JsonResponse(res)
        
        res = validar_objeto(models.proyecto, ['nombre_proyecto'], forms)        
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)       
                
        try:
            estado_solicitado = estado_proyecto.objects.filter(nombre__iexact='En desarrollo')
            if len(estado_solicitado) >= 1:
                if estado_solicitado.first().activo == False:
                    estado_solicitado.first().activo = True
            else:
                solicitado = estado_proyecto(
                    nombre = 'En desarrollo',
                    etapa = etapa_proyecto.objects.get(activo = True, nombre__iexact='Definición'),
                )
                solicitado.save()
        except:
            print(f'Error creando el Estado de proyecto "En desarrollo"')
            response = {
                'result': 'errorField',
                'title': 'Error de requisitos previos',
                'text': 'Deben existir activos: Etapa de proyecto "Definición" y Estado de proyecto "En desarrollo"',
                'error_message': ''
            }
            return JsonResponse(response)  
        
        
            
        # print('\n\n\n---->>>> cliente_prioridad', registro_form['cliente'].value())
        # cli = cliente.objects.get(pk = registro_form['cliente'].value())
        # print('\n\n\n---->>>> cli', cli)
        
        # pass
    
        if forms.is_valid() and registro_form.is_valid():  
            try:
                with transaction.atomic():
                    objeto = proyecto(
                        no = forms['no'].value(),
                        codigo = forms['codigo'].value(),
                        nombre_proyecto = forms['nombre_proyecto'].value(),
                        subclasificacion = subclasificacion.objects.get(pk = forms['subclasificacion'].value()),
                        estado = estado_proyecto.objects.get(activo = True, nombre__iexact='En desarrollo'), 
                    )
                    
                    objeto.save()
                    
                    objeto.formato.set(forms['formato'].value())

                    register_logs(request, proyecto, objeto.pk, objeto.__str__(), 1)
                    
                    registro = registro_aprobacion(
                        cliente = cliente.objects.get(pk = registro_form['cliente'].value()),                
                        contrato = registro_form['contrato'].value() if registro_form['contrato'].value() else None,                
                        centro_costo = area.objects.get(pk = registro_form['centro_costo'].value()),                                        
                        linea_tematica = linea_tematica.objects.get(pk = registro_form['linea_tematica'].value()) if registro_form['linea_tematica'].value() else None,
                        fecha_inicio = registro_form['fecha_inicio'].value(),
                        fecha_terminacion = registro_form['fecha_terminacion'].value() if registro_form['fecha_terminacion'].value() else None,
                        ingreso_mlc = float(registro_form['ingreso_mlc'].value().replace(',', '.'))  if registro_form['ingreso_mlc'].value() else None,
                        ingreso_cup = float(registro_form['ingreso_cup'].value().replace(',', '.')) if registro_form['ingreso_cup'].value() else None,
                    )
                    
                    registro.save()
                    
                    fecha_terminacion_str = registro_form['fecha_terminacion'].value()
                    fecha_terminacion_obj = datetime.strptime(fecha_terminacion_str, '%Y-%m-%d').date()
                    
                    try:
                        if fecha_terminacion_obj < datetime.now().date():
                            est = estado_proyecto.objects.get(activo = True, nombre__iexact='atrasado')
                            objeto.estado = est
                            objeto.save()
                    except:
                        response = {
                            'result': 'errorField',
                            'title': 'Error de requisitos previos',
                            'text': 'Debe existir activo: Estado de proyecto "Atrasado"',
                            'error_message': ''
                        }
                        return JsonResponse(response)
                    
                    objeto.registro_aprobacion = registro
                    objeto.save()
                    
                    persona_jefa = Employee.objects.get(pk = registro_form['employee'].value())
                    
                    try:
                        jefa = Position.objects.get(active = True, name__iexact = 'Jefe de proyecto')
                    except:
                        response = {
                            'result': 'errorField',
                            'title': 'Error de requisitos previos',
                            'text': 'Debe existir activo: Cargo "Jefe de proyecto"',
                            'error_message': ''
                        }
                        return JsonResponse(response)      
                    
                    jefe = trabajador_registro(
                        employee = persona_jefa,
                        registro = registro,
                        rol = Position.objects.get(active = True, name__iexact = 'Jefe de proyecto'),                        
                    )
                    jefe.rol = jefa
                    jefe.save()
                    
                    persona_comercial = Employee.objects.get(pk = registro_form['comercial'].value())
                    
                    try:
                        com = Position.objects.get(active = True, name__iexact = 'Comercial')
                    except:
                        response = {
                            'result': 'errorField',
                            'title': 'Error de requisitos previos',
                            'text': 'Debe existir activo: Cargo "Comercial"',
                            'error_message': ''
                        }
                        return JsonResponse(response)  
                    
                    comercial = trabajador_registro(
                        employee = persona_comercial,
                        registro = registro,
                        rol = Position.objects.get(active = True, name__iexact = 'Comercial'),                        
                    )
                    comercial.rol = com
                    comercial.save()
                    
                    try:
                        mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
                    except:
                        response = {
                            'result': 'errorField',
                            'title': 'Error de requisitos previos',
                            'text': 'Debe existir activo: Tipo de moneda -> Siglas "MLC"',
                            'error_message': ''
                        }
                        return JsonResponse(response) 
                    
                    if registro_form['financista_mlc'].value() and registro_form['financiamiento_mlc'].value():
                        financiamiento_mlc = financiamiento_proyecto(
                            fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_mlc'].value()),
                            registro = registro,
                            tipo_moneda = mlc,
                            valor = float(registro_form['financiamiento_mlc'].value().replace(',', '.')),
                        )
                        financiamiento_mlc.tipo_moneda = mlc
                        financiamiento_mlc.save()
                    
                    try:
                        cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
                    except:
                        response = {
                            'result': 'errorField',
                            'title': 'Error de requisitos previos',
                            'text': 'Debe existir activo: Tipo de moneda -> Siglas "CUP"',
                            'error_message': ''
                        }
                        return JsonResponse(response) 
                    
                    if registro_form['financista_cup'].value() and registro_form['financiamiento_cup'].value():
                        financiamiento_cup = financiamiento_proyecto(
                            fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_cup'].value()),
                            registro = registro,
                            tipo_moneda = cup,
                            valor = float(registro_form['financiamiento_cup'].value().replace(',', '.')),
                        )
                        financiamiento_cup.tipo_moneda = cup
                        financiamiento_cup.save()
                        
                    if registro_form['financista_mlc'].value() and registro_form['ingreso_mlc'].value():
                        ingreso_mlc = plan_ingreso_aprobacion(
                            fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_mlc'].value()),
                            registro = registro,
                            tipo_moneda = mlc,
                            valor = float(registro_form['ingreso_mlc'].value().replace(',', '.')),
                        )
                        ingreso_mlc.save()
                    
                    if registro_form['financista_cup'].value() and registro_form['ingreso_cup'].value():
                        ingreso_cup = plan_ingreso_aprobacion(
                            fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_cup'].value()),
                            registro = registro,
                            tipo_moneda = cup,
                            valor = float(registro_form['ingreso_cup'].value().replace(',', '.')),
                        )
                        ingreso_cup.save()
                    
                    register_logs(request, registro_aprobacion, registro.pk, registro.__str__(), 1)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Proyecto y Registro de aprobación creados con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': ''
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', forms.errors, '\n')
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.add_proyecto')
@handle_exceptions
def nomterminacion(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tfue = fuente_financiamiento.objects.filter(activo = True).order_by('nombre')
    tcli = cliente.objects.filter(activo = True).order_by('nombre')
    myformats = objeto.formato.all().order_by('nombre')
    
    try:
        sosi = models.sosi.objects.get(proyecto = objeto, activo = True)
    except Exception as e:
        sosi = None
    
    template_name = 'P01/proyecto/terminacion_form.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats' : myformats,
        
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'tfue' : tfue,
        'tcli' : tcli,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_terminacion_form(request.POST)
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro = registro_terminacion(
                        proyecto = objeto,
                        recomendaciones = registro_form['observaciones'].value(), 
                        revisado_por = Employee.objects.get(pk = registro_form['revisado_por'].value()),
                        fecha_revision = registro_form['fecha_revision'].value(),
                        verificado_por = Employee.objects.get(pk = registro_form['verificado_por'].value()),
                        fecha_verificacion = registro_form['fecha_verificacion'].value(),
                        ingreso_mlc = float(registro_form['ingreso_mlc'].value().replace(',', '.')) if registro_form['ingreso_mlc'].value() else None,
                        ingreso_cup = float(registro_form['ingreso_cup'].value().replace(',', '.')) if registro_form['ingreso_cup'].value() else None,
                        aprobado_por = cliente.objects.get(pk = registro_form['aprobado_por'].value()),
                        no_ficha_tecnica = registro_form['no_ficha_tecnica'].value(), 
                        recibido_por_ficha_tecnica = Employee.objects.get(pk = registro_form['recibido_por_ficha_tecnica'].value()),
                        fecha_ficha_tecnica = registro_form['fecha_ficha_tecnica'].value(),
                        no_sosi = sosi,
                        recibida_por_sosi = Employee.objects.get(pk = registro_form['recibida_por_sosi'].value()),
                        fecha_sosi = registro_form['fecha_sosi'].value()
                    )
                    
                    registro.save()
                    
                    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
                    financiamiento_mlc = financiamiento_proyecto(
                        fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_mlc'].value()),
                        registro_terminacion = registro,
                        tipo_moneda = mlc,
                        valor = float(registro_form['financiamiento_mlc'].value().replace(',', '.')),
                    )
                    financiamiento_mlc.tipo_moneda = mlc
                    financiamiento_mlc.save()
                    
                    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
                    financiamiento_cup = financiamiento_proyecto(
                        fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_cup'].value()),
                        registro_terminacion = registro,
                        tipo_moneda = cup,
                        valor = float(registro_form['financiamiento_cup'].value().replace(',', '.')),
                    )
                    financiamiento_cup.tipo_moneda = cup
                    financiamiento_cup.save()
                    
                    ingreso_mlc = plan_ingreso_aprobacion(
                        fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_mlc'].value()),
                        registro_terminacion = registro,
                        tipo_moneda = mlc,
                        valor = float(registro_form['ingreso_mlc'].value().replace(',', '.')),
                    )
                    ingreso_mlc.save()
                    
                    ingreso_cup = plan_ingreso_aprobacion(
                        fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_cup'].value()),
                        registro_terminacion = registro,
                        tipo_moneda = cup,
                        valor = float(registro_form['ingreso_cup'].value().replace(',', '.')),
                    )
                    ingreso_cup.save()
                    
                    terminado = estado_proyecto.objects.get(activo = True, nombre__iexact = 'terminado')
                    objeto.estado = terminado
                    objeto.save()
                    
                    register_logs(request, registro_terminacion, registro.pk, registro.__str__(), 1)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de terminación creado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.add_proyecto')
@handle_exceptions
def nomextension(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tarea = models.area.objects.filter(activo = True).order_by('nombre')
    jefe = trabajador_registro.objects.get(
        # employee = persona_jefa,
        registro = objeto.registro_aprobacion,
        rol = Position.objects.get(active = True, name__iexact = 'Jefe de proyecto'),     
        activo = True                   
    )
    textension = models.tipo_extension.objects.filter(activo = True).order_by('nombre')
    # tfue = fuente_financiamiento.objects.filter(activo = True)
    myformats = objeto.formato.all().order_by('nombre')
    
    # try:
    #     sosi = models.sosi.objects.get(proyecto = objeto)
    # except Exception as e:
    #     sosi = None
    
    template_name = 'P01/proyecto/extension_form.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats': myformats,
        'jefe' : jefe,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'tarea' : tarea,
        'textension' : textension,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_extension_form(request.POST)
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro = registro_extension(
                        proyecto = objeto,
                        observaciones = registro_form['observaciones'].value(), 
                        jefe_proyecto = Employee.objects.get(pk = registro_form['jefe_proyecto'].value()),
                        fecha_inicio = registro_form['fecha_inicio'].value(),
                        fecha_fin = registro_form['fecha_fin'].value(),
                        fecha_aprobacion = registro_form['fecha_aprobacion'].value(),
                        tipo_extension = models.tipo_extension.objects.get(pk = registro_form['tipo_extension'].value()),
                        centro_costo = models.area.objects.get(pk = registro_form['centro_costo'].value())
                    )
                    
                    registro.save()
                    
                    register_logs(request, registro_extension, registro.pk, registro.__str__(), 1)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de extensión creado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.add_proyecto')
@handle_exceptions
def nominterrupcion(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    myformats = objeto.formato.all().order_by('nombre')
    
    template_name = 'P01/proyecto/interrupcion_form.html'
    success_url = reverse_lazy("listar_proyecto")
    
    contexto = {
        'form': objeto,
        'myformats' : myformats,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_interrupcion_form(request.POST)
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic(): 
                    registro = registro_interrupcion(
                        aprobado_por = Employee.objects.get(pk = registro_form['aprobado_por'].value()),
                        propuesto_por = Employee.objects.get(pk = registro_form['propuesto_por'].value()),
                        motivo = registro_form['motivo'].value(),
                        fecha = registro_form['fecha'].value(),
                        proyecto = objeto
                    )
                    
                    registro.save()
                    
                    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
                    financiamiento_plan_mlc = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = mlc,
                        valor = float(registro_form['valor_plan_mlc'].value().replace(',', '.')),
                    )
                    financiamiento_plan_mlc.save()
                    
                    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
                    financiamiento_plan_cup = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = cup,
                        valor = float(registro_form['valor_plan_cup'].value().replace(',', '.')),
                    )
                    financiamiento_plan_cup.save()
                    
                    financiamiento_real_mlc = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = mlc,
                        valor_real = float(registro_form['valor_real_mlc'].value().replace(',', '.')),
                    )
                    financiamiento_real_mlc.save()
                    
                    financiamiento_plan_cup = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = cup,
                        valor_real = float(registro_form['valor_real_cup'].value().replace(',', '.')),
                    )
                    financiamiento_plan_cup.save()
                    
                    ingreso_plan_mlc = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = mlc,
                        ingreso = float(registro_form['ingreso_plan_mlc'].value().replace(',', '.')),
                    )
                    ingreso_plan_mlc.save()
                    
                    ingreso_plan_cup = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = cup,
                        ingreso = float(registro_form['ingreso_plan_cup'].value().replace(',', '.')),
                    )
                    ingreso_plan_cup.save()
                    
                    ingreso_real_mlc = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = mlc,
                        ingreso_real = float(registro_form['ingreso_real_mlc'].value().replace(',', '.')),
                    )
                    ingreso_real_mlc.save()
                    
                    ingreso_real_cup = financiamiento_proyecto(
                        registro_interrupcion = registro,
                        tipo_moneda = cup,
                        ingreso_real = float(registro_form['ingreso_real_cup'].value().replace(',', '.')),
                    )
                    ingreso_real_cup.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 1)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de interrupción creado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.change_proyecto')
@handle_exceptions
def interrupcion_update(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    # myformats = objeto.formato.all()
    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
    registro = objeto.proyecto_registro_interrupcion
    valor_plan_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, valor__isnull=False)
    valor_plan_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, valor__isnull=False)
    valor_real_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, valor_real__isnull=False)
    valor_real_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, valor_real__isnull=False)
    ingreso_plan_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, ingreso__isnull=False)
    ingreso_plan_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, ingreso__isnull=False)
    ingreso_real_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, ingreso_real__isnull=False)
    ingreso_real_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, ingreso_real__isnull=False)
    
    template_name = 'P01/proyecto/interrupcion_update_form.html'
    success_url = reverse_lazy("listar_proyecto")
    
    contexto = {
        'form': objeto,
        'valor_plan_mlc': valor_plan_mlc,
        'valor_plan_cup': valor_plan_cup,
        'valor_real_mlc': valor_real_mlc,
        'valor_real_cup': valor_real_cup,
        'ingreso_plan_mlc': ingreso_plan_mlc,
        'ingreso_plan_cup': ingreso_plan_cup,
        'ingreso_real_mlc': ingreso_real_mlc,
        'ingreso_real_cup': ingreso_real_cup,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_interrupcion_form(request.POST)
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():
                    registro = models.registro_interrupcion.objects.get(proyecto = objeto)
                    
                    # registro.aprobado_por = Employee.objects.get(pk = registro_form['aprobado_por'].value())
                    registro.aprobado_por = registro_form['aprobado_por'].value()
                    registro.propuesto_por = Employee.objects.get(pk = registro_form['propuesto_por'].value())
                    registro.motivo = registro_form['motivo'].value()
                    registro.fecha = registro_form['fecha'].value()
                    registro.proyecto = objeto
                    
                    registro.save()
                    
                    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
                    financiamiento_plan_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, valor__isnull=False)
                    financiamiento_plan_mlc.valor = float(registro_form['valor_plan_mlc'].value().replace(',', '.'))
                    financiamiento_plan_mlc.save()
                    
                    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
                    financiamiento_plan_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, valor__isnull=False)
                    financiamiento_plan_cup.valor = float(registro_form['valor_plan_cup'].value().replace(',', '.'))
                    financiamiento_plan_cup.save()
                    
                    financiamiento_real_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, valor_real__isnull=False)
                    financiamiento_real_mlc.valor_real = float(registro_form['valor_real_mlc'].value().replace(',', '.'))
                    financiamiento_real_mlc.save()
                    
                    financiamiento_plan_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, valor_real__isnull=False)
                    financiamiento_plan_cup.valor_real = float(registro_form['valor_real_cup'].value().replace(',', '.'))
                    financiamiento_plan_cup.save()
                    
                    ingreso_plan_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, ingreso__isnull=False)
                    ingreso_plan_mlc.ingreso = float(registro_form['ingreso_plan_mlc'].value().replace(',', '.'))
                    ingreso_plan_mlc.save()
                    
                    ingreso_plan_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, ingreso__isnull=False)
                    ingreso_plan_cup.ingreso = float(registro_form['ingreso_plan_cup'].value().replace(',', '.'))
                    ingreso_plan_cup.save()
                    
                    ingreso_real_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, ingreso_real__isnull=False)
                    ingreso_real_mlc.ingreso_real = float(registro_form['ingreso_real_mlc'].value().replace(',', '.'))
                    ingreso_real_mlc.save()
                    
                    ingreso_real_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, ingreso_real__isnull=False)
                    ingreso_real_cup.ingreso_real = float(registro_form['ingreso_real_cup'].value().replace(',', '.'))
                    ingreso_real_cup.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de interrupción modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.view_proyecto')
@handle_exceptions
def detalle_interrupcion(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True)
    # myformats = objeto.formato.all()
    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
    registro = objeto.proyecto_registro_interrupcion
    valor_plan_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, valor__isnull=False)
    valor_plan_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, valor__isnull=False)
    valor_real_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, valor_real__isnull=False)
    valor_real_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, valor_real__isnull=False)
    ingreso_plan_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, ingreso__isnull=False)
    ingreso_plan_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, ingreso__isnull=False)
    ingreso_real_mlc = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = mlc, ingreso_real__isnull=False)
    ingreso_real_cup = models.financiamiento_proyecto.objects.get(registro_interrupcion = registro, tipo_moneda = cup, ingreso_real__isnull=False)
    
    template_name = 'P01/proyecto/interrupcion_detail.html'
    success_url = reverse_lazy("listar_proyecto")
    
    contexto = {
        'form': objeto,
        'valor_plan_mlc': valor_plan_mlc,
        'valor_plan_cup': valor_plan_cup,
        'valor_real_mlc': valor_real_mlc,
        'valor_real_cup': valor_real_cup,
        'ingreso_plan_mlc': ingreso_plan_mlc,
        'ingreso_plan_cup': ingreso_plan_cup,
        'ingreso_real_mlc': ingreso_real_mlc,
        'ingreso_real_cup': ingreso_real_cup,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)
            
@login_required
@permission_required('xavi.add_proyecto')
@handle_exceptions
def nomreinicio(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    # dame todos los proyectos que tienen un registro de interrupcion activo
    # tproy = models.proyecto.objects.filter(activo = True)
    myformats = objeto.formato.all().order_by('nombre')
    
    template_name = 'P01/proyecto/reinicio_form.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats': myformats,
        # 'tproy' : tproy,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_reinicio_form(request.POST)
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro = registro_reinicio(
                        # registro_aprobacion = objeto.registro_aprobacion,
                        fecha_inicio = registro_form['fecha_inicio'].value(),
                        fecha_fin = registro_form['fecha_fin'].value()
                    )
                    
                    registro.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 1)
                    
                    aprob = models.registro_aprobacion.objects.get(proyecto = objeto, activo = True)
                    aprob.registro_reinicio = registro
                    aprob.save()
                    
                    register_logs(request, aprob, aprob.pk, aprob.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de reinicio creado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.add_proyecto')
@handle_exceptions
def nomcontrol_etapa(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    trepresentante = representante.objects.filter(activo = True, cliente = objeto.registro_aprobacion.cliente).order_by('nombre')
    estado_software = models.estado_software.objects.filter(activo = True).order_by('nombre')
          
    # dame todos los proyectos que tienen un registro de interrupcion activo
    # tproy = models.proyecto.objects.filter(activo = True)
    myformats = objeto.formato.all().order_by('nombre')
    
    template_name = 'P01/proyecto/control_etapa_form.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats': myformats,
        'no' : get_ultimo(proyecto),
        'previouscode' : get_codigo(),
        'ttrab': ttrab,
        'tcli': trepresentante,
        'estado_software': estado_software,
        # 'tproy' : tproy,
        # 'sosi' : sosi,
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.control_etapa_form(request.POST)
        
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic(): 
                    
                    registro = control_etapa(
                        proyecto = objeto
                    )
                    
                    registro.save()
                    
                    if registro_form['realizado_por_requisitos'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['realizado_por_requisitos'].value()),
                            estado_software = models.estado_software.objects.get(pk = 1),
                            registro = registro,
                            fecha = registro_form['fecha_realizado_requisitos'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Realizado")
                        )
                        
                        tr.save()
                        
                    if registro_form['revisado_por_requisitos'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['revisado_por_requisitos'].value()),
                            estado_software = models.estado_software.objects.get(pk = 1),
                            registro = registro,
                            fecha = registro_form['fecha_revisado_requisitos'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Revisado")
                        )
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_requisitos'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['aprobado_por_requisitos'].value()),
                            estado_software = models.estado_software.objects.get(pk = 1),
                            registro = registro,
                            fecha = registro_form['fecha_aprobado_requisitos'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Aprobado")
                        )
                        
                        tr.save()
                        
                    if registro_form['realizado_por_diseno'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['realizado_por_diseno'].value()),
                            estado_software = models.estado_software.objects.get(pk = 2),
                            registro = registro,
                            fecha = registro_form['fecha_realizado_diseno'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Realizado")
                        )
                        
                        tr.save()
                        
                    if registro_form['revisado_por_diseno'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['revisado_por_diseno'].value()),
                            estado_software = models.estado_software.objects.get(pk = 2),
                            registro = registro,
                            fecha = registro_form['fecha_revisado_diseno'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Revisado")
                        )
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_diseno'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['aprobado_por_diseno'].value()),
                            estado_software = models.estado_software.objects.get(pk = 2),
                            registro = registro,
                            fecha = registro_form['fecha_aprobado_diseno'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Aprobado")
                        )
                        
                        tr.save()
                        
                    if registro_form['realizado_por_implementacion'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['realizado_por_implementacion'].value()),
                            estado_software = models.estado_software.objects.get(pk = 3),
                            registro = registro,
                            fecha = registro_form['fecha_realizado_implementacion'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Realizado")
                        )
                        
                        tr.save()
                        
                    if registro_form['revisado_por_implementacion'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['revisado_por_implementacion'].value()),
                            estado_software = models.estado_software.objects.get(pk = 3),
                            registro = registro,
                            fecha = registro_form['fecha_revisado_implementacion'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Revisado")
                        )
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_implementacion'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['aprobado_por_implementacion'].value()),
                            estado_software = models.estado_software.objects.get(pk = 3),
                            registro = registro,
                            fecha = registro_form['fecha_aprobado_implementacion'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Aprobado")
                        )
                        
                        tr.save()
                        
                    if registro_form['realizado_por_pruebas'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['realizado_por_pruebas'].value()),
                            estado_software = models.estado_software.objects.get(pk = 4),
                            registro = registro,
                            fecha = registro_form['fecha_realizado_pruebas'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Realizado")
                        )
                        
                        tr.save()
                        
                    if registro_form['revisado_por_pruebas'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['revisado_por_pruebas'].value()),
                            estado_software = models.estado_software.objects.get(pk = 4),
                            registro = registro,
                            fecha = registro_form['fecha_revisado_pruebas'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Revisado")
                        )
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_pruebas'].value():
                        tr = trabajador_etapa(
                            employee = Employee.objects.get(pk = registro_form['aprobado_por_pruebas'].value()),
                            estado_software = models.estado_software.objects.get(pk = 4),
                            registro = registro,
                            fecha = registro_form['fecha_aprobado_pruebas'].value(),
                            accion_control_etapa = models.accion_control_etapa.objects.get(nombre__iexact = "Aprobado")
                        )
                        
                        tr.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 1)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Control de etapas creado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.change_proyecto')
@handle_exceptions
def control_etapa_update(request, id):
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    estado_software = models.estado_software.objects.filter(activo = True).order_by('nombre')
    
    requisitos = models.estado_software.objects.get(activo = True, nombre__iexact = 'I. Determinación de los requisitos del cliente')
    diseno = models.estado_software.objects.get(activo = True, nombre__iexact = 'II. Análisis y Diseño')
    implementacion = models.estado_software.objects.get(activo = True, nombre__iexact = 'III. Implementación')
    pruebas = models.estado_software.objects.get(activo = True, nombre__iexact = 'IV. Pruebas')
    
    accion_realizado = models.accion_control_etapa.objects.get(activo = True, nombre__iexact = 'Realizado')
    accion_revisado = models.accion_control_etapa.objects.get(activo = True, nombre__iexact = 'Revisado')
    accion_aprobado = models.accion_control_etapa.objects.get(activo = True, nombre__iexact = 'Aprobado')
    
    trab_etap = models.trabajador_etapa.objects.filter(registro = objeto.proyecto_control_etapa)
    etapa_requisitos = trab_etap.filter(estado_software = requisitos)
    realizado_por_requisitos = get_or_none(etapa_requisitos, accion_control_etapa = accion_realizado)
    revisado_por_requisitos = get_or_none(etapa_requisitos, accion_control_etapa = accion_revisado)
    aprobado_por_requisitos = get_or_none(etapa_requisitos, accion_control_etapa = accion_aprobado)
    etapa_diseno = trab_etap.filter(estado_software = diseno)
    realizado_por_diseno = get_or_none(etapa_diseno, accion_control_etapa = accion_realizado)
    revisado_por_diseno = get_or_none(etapa_diseno, accion_control_etapa = accion_revisado)
    aprobado_por_diseno = get_or_none(etapa_diseno, accion_control_etapa = accion_aprobado)
    etapa_implementacion = trab_etap.filter(estado_software = implementacion)
    realizado_por_implementacion = get_or_none(etapa_implementacion, accion_control_etapa = accion_realizado)
    revisado_por_implementacion = get_or_none(etapa_implementacion, accion_control_etapa = accion_revisado)
    aprobado_por_implementacion = get_or_none(etapa_implementacion, accion_control_etapa = accion_aprobado)
    etapa_pruebas = trab_etap.filter(estado_software = pruebas)
    realizado_por_pruebas = get_or_none(etapa_pruebas, accion_control_etapa = accion_realizado)
    revisado_por_pruebas = get_or_none(etapa_pruebas, accion_control_etapa = accion_revisado)
    aprobado_por_pruebas = get_or_none(etapa_pruebas, accion_control_etapa = accion_aprobado)
    
    # dame todos los proyectos que tienen un registro de interrupcion activo
    # tproy = models.proyecto.objects.filter(activo = True)
    myformats = objeto.formato.all().order_by('nombre')
    
    template_name = 'P01/proyecto/control_etapa_update_form.html'
    success_url = reverse_lazy("listar_proyecto")
    
    contexto = {
        'form': objeto,
        'myformats': myformats,
        'no' : get_ultimo(proyecto),
        'previouscode' : get_codigo(),
        'ttrab': ttrab,
        # 'estado_software': estado_software,
        # 'tproy' : tproy,
        # 'sosi' : sosi,
        'realizado_por_requisitos' : realizado_por_requisitos,
        'revisado_por_requisitos' : revisado_por_requisitos,
        'aprobado_por_requisitos' : aprobado_por_requisitos,
        'realizado_por_diseno' : realizado_por_diseno,
        'revisado_por_diseno' : revisado_por_diseno,
        'aprobado_por_diseno' : aprobado_por_diseno,
        'realizado_por_implementacion' : realizado_por_implementacion,
        'revisado_por_implementacion' : revisado_por_implementacion,
        'aprobado_por_implementacion' : aprobado_por_implementacion,
        'realizado_por_pruebas' : realizado_por_pruebas,
        'revisado_por_pruebas' : revisado_por_pruebas,
        'aprobado_por_pruebas' : aprobado_por_pruebas,
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.control_etapa_form(request.POST)
        
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():
                    registro = objeto.proyecto_control_etapa
                    
                    if registro_form['realizado_por_requisitos'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = requisitos,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_requisitos'].value())
                        tr.fecha = registro_form['fecha_realizado_requisitos'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_requisitos'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = requisitos,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_requisitos'].value())
                        tr.fecha = registro_form['fecha_revisado_requisitos'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_requisitos'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = requisitos,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_requisitos'].value())
                        tr.fecha = registro_form['fecha_aprobado_requisitos'].value()
                        
                        tr.save()
                        
                    if registro_form['realizado_por_diseno'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = diseno,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_diseno'].value())
                        tr.fecha = registro_form['fecha_realizado_diseno'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_diseno'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = diseno,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_diseno'].value())
                        tr.fecha = registro_form['fecha_revisado_diseno'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_diseno'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = diseno,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_diseno'].value())
                        tr.fecha = registro_form['fecha_aprobado_diseno'].value()
                        
                        tr.save()
                        
                    if registro_form['realizado_por_implementacion'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = implementacion,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_implementacion'].value())
                        tr.fecha = registro_form['fecha_realizado_implementacion'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_implementacion'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = implementacion,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_implementacion'].value())
                        tr.fecha = registro_form['fecha_revisado_implementacion'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_implementacion'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = implementacion,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_implementacion'].value())
                        tr.fecha = registro_form['fecha_aprobado_implementacion'].value()
                        
                        tr.save()
                        
                    if registro_form['realizado_por_pruebas'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = pruebas,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_pruebas'].value())
                        tr.fecha = registro_form['fecha_realizado_pruebas'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_pruebas'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = pruebas,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_pruebas'].value())
                        tr.fecha = registro_form['fecha_revisado_pruebas'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_pruebas'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = pruebas,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_pruebas'].value())
                        tr.fecha = registro_form['fecha_aprobado_pruebas'].value()
                        
                        tr.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Control de etapas modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.view_proyecto')
@handle_exceptions
def detalle_control_etapa(request, id):
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    estado_software = models.estado_software.objects.filter(activo = True).order_by('nombre')
    
    requisitos = models.estado_software.objects.get(activo = True, nombre__iexact = 'I. Determinación de los requisitos del cliente')
    diseno = models.estado_software.objects.get(activo = True, nombre__iexact = 'II. Análisis y Diseño')
    implementacion = models.estado_software.objects.get(activo = True, nombre__iexact = 'III. Implementación')
    pruebas = models.estado_software.objects.get(activo = True, nombre__iexact = 'IV. Pruebas')
    
    accion_realizado = models.accion_control_etapa.objects.get(activo = True, nombre__iexact = 'Realizado')
    accion_revisado = models.accion_control_etapa.objects.get(activo = True, nombre__iexact = 'Revisado')
    accion_aprobado = models.accion_control_etapa.objects.get(activo = True, nombre__iexact = 'Aprobado')
    
    trab_etap = models.trabajador_etapa.objects.filter(registro = objeto.proyecto_control_etapa)
    etapa_requisitos = trab_etap.filter(estado_software = requisitos)
    realizado_por_requisitos = get_or_none(etapa_requisitos, accion_control_etapa = accion_realizado)
    revisado_por_requisitos = get_or_none(etapa_requisitos, accion_control_etapa = accion_revisado)
    aprobado_por_requisitos = get_or_none(etapa_requisitos, accion_control_etapa = accion_aprobado)
    etapa_diseno = trab_etap.filter(estado_software = diseno)
    realizado_por_diseno = get_or_none(etapa_diseno, accion_control_etapa = accion_realizado)
    revisado_por_diseno = get_or_none(etapa_diseno, accion_control_etapa = accion_revisado)
    aprobado_por_diseno = get_or_none(etapa_diseno, accion_control_etapa = accion_aprobado)
    etapa_implementacion = trab_etap.filter(estado_software = implementacion)
    realizado_por_implementacion = get_or_none(etapa_implementacion, accion_control_etapa = accion_realizado)
    revisado_por_implementacion = get_or_none(etapa_implementacion, accion_control_etapa = accion_revisado)
    aprobado_por_implementacion = get_or_none(etapa_implementacion, accion_control_etapa = accion_aprobado)
    etapa_pruebas = trab_etap.filter(estado_software = pruebas)
    realizado_por_pruebas = get_or_none(etapa_pruebas, accion_control_etapa = accion_realizado)
    revisado_por_pruebas = get_or_none(etapa_pruebas, accion_control_etapa = accion_revisado)
    aprobado_por_pruebas = get_or_none(etapa_pruebas, accion_control_etapa = accion_aprobado)
    
    # dame todos los proyectos que tienen un registro de interrupcion activo
    # tproy = models.proyecto.objects.filter(activo = True)
    myformats = objeto.formato.all().order_by('nombre')
    
    template_name = 'P01/proyecto/control_etapa_detail.html'
    success_url = reverse_lazy("listar_proyecto")
    
    contexto = {
        'form': objeto,
        'myformats': myformats,
        'no' : get_ultimo(proyecto),
        'previouscode' : get_codigo(),
        'ttrab': ttrab,
        # 'estado_software': estado_software,
        # 'tproy' : tproy,
        # 'sosi' : sosi,
        'realizado_por_requisitos' : realizado_por_requisitos,
        'revisado_por_requisitos' : revisado_por_requisitos,
        'aprobado_por_requisitos' : aprobado_por_requisitos,
        'realizado_por_diseno' : realizado_por_diseno,
        'revisado_por_diseno' : revisado_por_diseno,
        'aprobado_por_diseno' : aprobado_por_diseno,
        'realizado_por_implementacion' : realizado_por_implementacion,
        'revisado_por_implementacion' : revisado_por_implementacion,
        'aprobado_por_implementacion' : aprobado_por_implementacion,
        'realizado_por_pruebas' : realizado_por_pruebas,
        'revisado_por_pruebas' : revisado_por_pruebas,
        'aprobado_por_pruebas' : aprobado_por_pruebas,
        'requisitos' : requisitos,
        'diseno' : diseno,
        'implementacion' : implementacion,
        'pruebas' : pruebas,
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.control_etapa_form(request.POST)
        
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():
                    registro = objeto.proyecto_control_etapa
                    
                    if registro_form['realizado_por_requisitos'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = requisitos,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_requisitos'].value())
                        tr.fecha = registro_form['fecha_realizado_requisitos'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_requisitos'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = requisitos,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_requisitos'].value())
                        tr.fecha = registro_form['fecha_revisado_requisitos'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_requisitos'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = requisitos,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_requisitos'].value())
                        tr.fecha = registro_form['fecha_aprobado_requisitos'].value()
                        
                        tr.save()
                        
                    if registro_form['realizado_por_diseno'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = diseno,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_diseno'].value())
                        tr.fecha = registro_form['fecha_realizado_diseno'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_diseno'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = diseno,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_diseno'].value())
                        tr.fecha = registro_form['fecha_revisado_diseno'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_diseno'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = diseno,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_diseno'].value())
                        tr.fecha = registro_form['fecha_aprobado_diseno'].value()
                        
                        tr.save()
                        
                    if registro_form['realizado_por_implementacion'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = implementacion,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_implementacion'].value())
                        tr.fecha = registro_form['fecha_realizado_implementacion'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_implementacion'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = implementacion,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_implementacion'].value())
                        tr.fecha = registro_form['fecha_revisado_implementacion'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_implementacion'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = implementacion,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_implementacion'].value())
                        tr.fecha = registro_form['fecha_aprobado_implementacion'].value()
                        
                        tr.save()
                        
                    if registro_form['realizado_por_pruebas'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = pruebas,
                            registro = registro,
                            accion_control_etapa = accion_realizado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['realizado_por_pruebas'].value())
                        tr.fecha = registro_form['fecha_realizado_pruebas'].value()
                        
                        tr.save()
                        
                    if registro_form['revisado_por_pruebas'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = pruebas,
                            registro = registro,
                            accion_control_etapa = accion_revisado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['revisado_por_pruebas'].value())
                        tr.fecha = registro_form['fecha_revisado_pruebas'].value()
                        
                        tr.save()
                        
                    if registro_form['aprobado_por_pruebas'].value():
                        tr = models.trabajador_etapa.objects.get(
                            estado_software = pruebas,
                            registro = registro,
                            accion_control_etapa = accion_aprobado
                        )
                        tr.employee = Employee.objects.get(pk = registro_form['aprobado_por_pruebas'].value())
                        tr.fecha = registro_form['fecha_aprobado_pruebas'].value()
                        
                        tr.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Control de etapas modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.change_proyecto')
@handle_exceptions
def reinicio_update(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    tproy = models.proyecto.objects.filter(activo = True).order_by('nombre_proyecto')
    myformats = objeto.formato.all().order_by('nombre') 
    
    template_name = 'P01/proyecto/reinicio_update_form.html'
    success_url = reverse_lazy("listar_proyecto")
    
    contexto = {
        'form': objeto,
        'myformats': myformats,
        'tproy' : tproy,
        'no' : get_ultimo(proyecto),
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_reinicio_form(request.POST)
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro = objeto.registro_aprobacion.registro_reinicio
                    registro.fecha_inicio = registro_form['fecha_inicio'].value()
                    registro.fecha_fin = registro_form['fecha_fin'].value()                    
                    registro.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 2)
                    
                    registro.registro_aprobacion.registro_reinicio = registro
                    registro.registro_aprobacion.save()
                    
                    register_logs(request, registro.registro_aprobacion, registro.registro_aprobacion.pk, registro.registro_aprobacion.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de reinicio modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.view_proyecto')
@handle_exceptions
def detalle_reinicio(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    tproy = models.proyecto.objects.filter(activo = True).order_by('nombre_proyecto')
    myformats = objeto.formato.all().order_by('nombre')  
    
    template_name = 'P01/proyecto/reinicio_detail.html'
    success_url = reverse_lazy("listar_proyecto")
    
    contexto = {
        'form': objeto,
        'myformats': myformats,
        'tproy' : tproy,
        'no' : get_ultimo(proyecto),
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_reinicio_form(request.POST)
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro = objeto.registro_aprobacion.registro_reinicio
                    registro.fecha_inicio = registro_form['fecha_inicio'].value()
                    registro.fecha_fin = registro_form['fecha_fin'].value()                    
                    registro.save()
                    
                    register_logs(request, registro, registro.pk, registro.__str__(), 2)
                    
                    registro.registro_aprobacion.registro_reinicio = registro
                    registro.registro_aprobacion.save()
                    
                    register_logs(request, registro.registro_aprobacion, registro.registro_aprobacion.pk, registro.registro_aprobacion.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de reinicio modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.change_proyecto')
@handle_exceptions
def terminacion_update(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tfue = fuente_financiamiento.objects.filter(activo = True).order_by('nombre')
    tcli = cliente.objects.filter(activo = True).order_by('nombre')
    myformats = objeto.formato.all().order_by('nombre')
    
    mis_fuentes = objeto.proyecto_registro_terminacion.financiamiento.all().order_by('nombre')
    
    fuente_mlc = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'MLC', fuente_financiamiento__in = mis_fuentes, registro_terminacion = objeto.proyecto_registro_terminacion)
    fuente_cup = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'CUP', fuente_financiamiento__in = mis_fuentes, registro_terminacion = objeto.proyecto_registro_terminacion)
    
    try:
        sosi = models.sosi.objects.get(proyecto = objeto)
    except Exception as e:
        sosi = None
    
    template_name = 'P01/proyecto/terminacion_update_form.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats' : myformats,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'tfue' : tfue,
        'tcli' : tcli,
        'mis_fuentes' : mis_fuentes,
        'fuente_mlc' : fuente_mlc,
        'fuente_cup' : fuente_cup,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_terminacion_form(request.POST)
        
        registro = objeto.proyecto_registro_terminacion
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro.recomendaciones = registro_form['observaciones'].value()
                    registro.revisado_por = Employee.objects.get(pk = registro_form['revisado_por'].value())
                    registro.fecha_revision = registro_form['fecha_revision'].value()
                    registro.verificado_por = Employee.objects.get(pk = registro_form['verificado_por'].value())
                    registro.fecha_verificacion = registro_form['fecha_verificacion'].value()
                    registro.ingreso_mlc = float(registro_form['ingreso_mlc'].value().replace(',', '.')) if registro_form['ingreso_mlc'].value() else None
                    registro.ingreso_cup = float(registro_form['ingreso_cup'].value().replace(',', '.')) if registro_form['ingreso_cup'].value() else None
                    registro.aprobado_por = cliente.objects.get(pk = registro_form['aprobado_por'].value())
                    registro.no_ficha_tecnica = registro_form['no_ficha_tecnica'].value()
                    registro.recibido_por_ficha_tecnica = Employee.objects.get(pk = registro_form['recibido_por_ficha_tecnica'].value())
                    registro.fecha_ficha_tecnica = registro_form['fecha_ficha_tecnica'].value()
                    registro.no_sosi = sosi
                    registro.recibida_por_sosi = Employee.objects.get(pk = registro_form['recibida_por_sosi'].value())
                    registro.fecha_sosi = registro_form['fecha_sosi'].value()
                    
                    registro.save()
                    
                    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
                    financiamiento_mlc = models.financiamiento_proyecto.objects.get(registro_terminacion = registro, tipo_moneda = mlc)
                    financiamiento_mlc.valor = float(registro_form['financiamiento_mlc'].value().replace(',', '.'))
                    financiamiento_mlc.save()   
                    
                    
                    # print('\n', '--------> akjsbdjhb JBSAHB', financiamiento_mlc.id,'\n')  
                    # return       
                    
                    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
                    financiamiento_cup = models.financiamiento_proyecto.objects.get(registro_terminacion = registro, tipo_moneda = cup)
                    financiamiento_cup.valor = float(registro_form['financiamiento_cup'].value().replace(',', '.'))
                    financiamiento_cup.save()
                    
                    ingreso_mlc = models.plan_ingreso_aprobacion.objects.get(registro_terminacion = registro, tipo_moneda = mlc)
                    ingreso_mlc.valor = float(registro_form['ingreso_mlc'].value().replace(',', '.'))
                    ingreso_mlc.save()
                    
                    ingreso_cup = models.plan_ingreso_aprobacion.objects.get(registro_terminacion = registro, tipo_moneda = cup)
                    ingreso_cup.valor = float(registro_form['ingreso_cup'].value().replace(',', '.'))
                    ingreso_cup.save()
                    
                    terminado = estado_proyecto.objects.get(activo = True, nombre__iexact = 'terminado')
                    objeto.estado = terminado
                    objeto.save()
                    
                    register_logs(request, registro_terminacion, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de terminación modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.change_proyecto')
@handle_exceptions
def extension_update(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tarea = models.area.objects.filter(activo = True).order_by('nombre')
    jefe = trabajador_registro.objects.get(
        # employee = persona_jefa,
        registro = objeto.registro_aprobacion,
        rol = Position.objects.get(active = True, name__iexact = 'Jefe de proyecto'),     
        activo = True                   
    )
    textension = models.tipo_extension.objects.filter(activo = True).order_by('nombre')
    myformats = objeto.formato.all().order_by('nombre')
    
    template_name = 'P01/proyecto/extension_update_form.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats': myformats,
        'jefe' : jefe,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'tarea' : tarea,
        'textension' : textension,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_extension_form(request.POST)
        
        registro = objeto.proyecto_registro_extension
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro.observaciones = registro_form['observaciones'].value()
                    registro.jefe_proyecto = Employee.objects.get(pk = registro_form['jefe_proyecto'].value())
                    registro.fecha_inicio = registro_form['fecha_inicio'].value()
                    registro.fecha_fin = registro_form['fecha_fin'].value()
                    registro.fecha_aprobacion = registro_form['fecha_aprobacion'].value()
                    registro.tipo_extension = models.tipo_extension.objects.get(pk = registro_form['tipo_extension'].value())
                    registro.centro_costo = models.area.objects.get(pk = registro_form['centro_costo'].value())
                    
                    registro.save()
                    
                    register_logs(request, registro_extension, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de extensión modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.view_proyecto')
@handle_exceptions
def detalle_terminacion(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tfue = fuente_financiamiento.objects.filter(activo = True).order_by('nombre')
    tcli = cliente.objects.filter(activo = True).order_by('nombre')
    myformats = objeto.formato.all().order_by('nombre')
    
    mis_fuentes = objeto.proyecto_registro_terminacion.financiamiento.all().order_by('nombre')
    fuente_mlc = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'MLC', fuente_financiamiento__in = mis_fuentes, registro_terminacion = objeto.proyecto_registro_terminacion)
    fuente_cup = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'CUP', fuente_financiamiento__in = mis_fuentes, registro_terminacion = objeto.proyecto_registro_terminacion)
    
    try:
        sosi = models.sosi.objects.get(proyecto = objeto)
    except Exception as e:
        sosi = None
    
    template_name = 'P01/proyecto/terminacion_detail.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats' : myformats,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'tfue' : tfue,
        'tcli' : tcli,
        'mis_fuentes' : mis_fuentes,
        'fuente_mlc' : fuente_mlc,
        'fuente_cup' : fuente_cup,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_terminacion_form(request.POST)
        
        registro = objeto.proyecto_registro_terminacion
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro.recomendaciones = registro_form['observaciones'].value()
                    registro.revisado_por = Employee.objects.get(pk = registro_form['revisado_por'].value())
                    registro.fecha_revision = registro_form['fecha_revision'].value()
                    registro.verificado_por = Employee.objects.get(pk = registro_form['verificado_por'].value())
                    registro.fecha_verificacion = registro_form['fecha_verificacion'].value()
                    registro.ingreso_mlc = registro_form['ingreso_mlc'].value() if registro_form['ingreso_mlc'].value() else None
                    registro.ingreso_cup = registro_form['ingreso_cup'].value() if registro_form['ingreso_cup'].value() else None
                    # registro.aprobado_por = Employee.objects.get(pk = registro_form['aprobado_por'].value())
                    registro.aprobado_por = 1
                    registro.no_ficha_tecnica = registro_form['no_ficha_tecnica'].value()
                    registro.recibido_por_ficha_tecnica = Employee.objects.get(pk = registro_form['recibido_por_ficha_tecnica'].value())
                    registro.fecha_ficha_tecnica = registro_form['fecha_ficha_tecnica'].value()
                    registro.no_sosi = sosi
                    registro.recibida_por_sosi = Employee.objects.get(pk = registro_form['recibida_por_sosi'].value())
                    registro.fecha_sosi = registro_form['fecha_sosi'].value()
                    
                    registro.save()
                    
                    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
                    financiamiento_mlc = models.financiamiento_proyecto.objects.get(registro_terminacion = registro, tipo_moneda = mlc)
                    financiamiento_mlc.valor = registro_form['financiamiento_mlc'].value()
                    financiamiento_mlc.save()   
                    
                    
                    # print('\n', '--------> akjsbdjhb JBSAHB', financiamiento_mlc.id,'\n')  
                    # return       
                    
                    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
                    financiamiento_cup = models.financiamiento_proyecto.objects.get(registro_terminacion = registro, tipo_moneda = cup)
                    financiamiento_cup.valor = registro_form['financiamiento_cup'].value()
                    financiamiento_cup.save()
                    
                    ingreso_mlc = models.plan_ingreso_aprobacion.objects.get(registro_terminacion = registro, tipo_moneda = mlc)
                    ingreso_mlc.valor = registro_form['ingreso_mlc'].value()
                    ingreso_mlc.save()
                    
                    ingreso_cup = models.plan_ingreso_aprobacion.objects.get(registro_terminacion = registro, tipo_moneda = cup)
                    ingreso_cup.valor = registro_form['ingreso_cup'].value()
                    ingreso_cup.save()
                    
                    register_logs(request, registro_terminacion, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de terminación modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
            
@login_required
@permission_required('xavi.view_proyecto')
@handle_exceptions
def detalle_extension(request, id): 
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
          
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tfue = fuente_financiamiento.objects.filter(activo = True).order_by('nombre')
    myformats = objeto.formato.all().order_by('nombre')
    
    try:
        mis_fuentes = objeto.proyecto_registro_terminacion.financiamiento.all().order_by('nombre')
        fuente_mlc = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'MLC', fuente_financiamiento__in = mis_fuentes, registro_terminacion = objeto.proyecto_registro_terminacion)
        fuente_cup = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'CUP', fuente_financiamiento__in = mis_fuentes, registro_terminacion = objeto.proyecto_registro_terminacion)
    except:
        mis_fuentes = fuente_mlc = fuente_cup = None  
    
    try:
        sosi = models.sosi.objects.get(proyecto = objeto)
    except Exception as e:
        sosi = None
    
    template_name = 'P01/proyecto/extension_detail.html'
    success_url = reverse_lazy("listar_proyecto")
        
    contexto = {
        'form': objeto,
        'myformats' : myformats,
        'no' : get_ultimo(proyecto),
        'sosi' : sosi,
        'ttrab' : ttrab,
        'tfue' : tfue,
        'mis_fuentes' : mis_fuentes,
        'fuente_mlc' : fuente_mlc,
        'fuente_cup' : fuente_cup,
        'previouscode' : get_codigo(),
    }

    if request.method == "GET":        
        return render(request, template_name, contexto)

    if request.method == "POST":
        registro_form = form.registro_terminacion_form(request.POST)
        
        registro = objeto.proyecto_registro_terminacion
                
        if registro_form.is_valid():            
            try:
                with transaction.atomic():       
                    registro.recomendaciones = registro_form['observaciones'].value()
                    registro.revisado_por = Employee.objects.get(pk = registro_form['revisado_por'].value())
                    registro.fecha_revision = registro_form['fecha_revision'].value()
                    registro.verificado_por = Employee.objects.get(pk = registro_form['verificado_por'].value())
                    registro.fecha_verificacion = registro_form['fecha_verificacion'].value()
                    registro.ingreso_mlc = registro_form['ingreso_mlc'].value() if registro_form['ingreso_mlc'].value() else None
                    registro.ingreso_cup = registro_form['ingreso_cup'].value() if registro_form['ingreso_cup'].value() else None
                    # registro.aprobado_por = Employee.objects.get(pk = registro_form['aprobado_por'].value())
                    registro.aprobado_por = 1
                    registro.no_ficha_tecnica = registro_form['no_ficha_tecnica'].value()
                    registro.recibido_por_ficha_tecnica = Employee.objects.get(pk = registro_form['recibido_por_ficha_tecnica'].value())
                    registro.fecha_ficha_tecnica = registro_form['fecha_ficha_tecnica'].value()
                    registro.no_sosi = sosi
                    registro.recibida_por_sosi = Employee.objects.get(pk = registro_form['recibida_por_sosi'].value())
                    registro.fecha_sosi = registro_form['fecha_sosi'].value()
                    
                    registro.save()
                    
                    mlc = tipo_moneda.objects.get(siglas__iexact = 'MLC')
                    financiamiento_mlc = models.financiamiento_proyecto.objects.get(registro_terminacion = registro, tipo_moneda = mlc)
                    financiamiento_mlc.valor = registro_form['financiamiento_mlc'].value()
                    financiamiento_mlc.save()   
                    
                    
                    # print('\n', '--------> akjsbdjhb JBSAHB', financiamiento_mlc.id,'\n')  
                    # return       
                    
                    cup = tipo_moneda.objects.get(siglas__iexact = 'CUP')
                    financiamiento_cup = models.financiamiento_proyecto.objects.get(registro_terminacion = registro, tipo_moneda = cup)
                    financiamiento_cup.valor = registro_form['financiamiento_cup'].value()
                    financiamiento_cup.save()
                    
                    ingreso_mlc = models.plan_ingreso_aprobacion.objects.get(registro_terminacion = registro, tipo_moneda = mlc)
                    ingreso_mlc.valor = registro_form['ingreso_mlc'].value()
                    ingreso_mlc.save()
                    
                    ingreso_cup = models.plan_ingreso_aprobacion.objects.get(registro_terminacion = registro, tipo_moneda = cup)
                    ingreso_cup.valor = registro_form['ingreso_cup'].value()
                    ingreso_cup.save()
                    
                    register_logs(request, registro_terminacion, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de terminación modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)

@login_required
@user_has_any_permission('xavi.add_proyecto', 'xavi.add_entrada_proyecto')
@handle_exceptions
def nomentrada_proyecto(request, id):
    proy = proyecto.objects.get(pk = id)

    lista = entrada_proyecto.objects.filter(activo = True, proyecto = proy).order_by('-id')

    # tformatos = formato.objects.filter(activo = True)
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    test = estado_proyecto_dgca.objects.filter(activo = True).order_by('nombre')
    
    myformats = proy.formato.all().order_by('nombre')
    # formatos_serializados = list(proy.formato.values_list('id', flat=True))
    
    try:
        estado = estado_proyecto_dgca.objects.get(activo = True, nombre__iexact = 'En revisión')
        ultima_entrada = lista.first()
    except:
        estado = None

    template_name = 'P01/entrada_proyecto/entrada_proyecto_form.html'
    contexto = {
        'lista' : lista,
        'proy' : proy,
        # 'tformatos' : tformatos,
        'myformats' : myformats,
        # 'formatos_serializados' : formatos_serializados,
        'ttrab' : ttrab,
        'estado' : estado,
        'ultima_entrada' : ultima_entrada,
        'no' : get_ultimo_dependencia_proyecto(entrada_proyecto, proy)
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.entrada_proyecto_form(request.POST, request.FILES)
        
        if forms['estado'].value() == 'ninguno':
            response = {}
            response['result'] = 'errorField'
            response['title'] = 'No existe Estado de proyecto en DGCA con nombre "En revisión"'
            return JsonResponse(response)
        
        if forms.is_valid():            
            try:
                with transaction.atomic():
                    objeto = entrada_proyecto(
                        no = forms['no'].value(),
                        proyecto = proy,
                        fecha_entrada = datetime.strptime(forms['fecha_entrada'].value(), '%Y-%m-%d').date(),
                        entregado_por = Employee.objects.get(pk = forms['entregado_por'].value()),
                        # dictamen = forms.cleaned_data['dictamen'] if forms.cleaned_data['dictamen'] else None,
                        estado = estado_proyecto_dgca.objects.get(pk = forms['estado'].value()),
                    )

                    objeto.save()
                    
                    objeto.formato.set(forms['formato'].value())
            
                    register_logs(request, entrada_proyecto, objeto.pk, objeto.__str__(), 1)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Entrada de proyecto en DGCA creada con éxito'
                    response['text'] = 'Se refrescará la página para actualizar la lista'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'error_message': str(e)
                }
                return JsonResponse(response)                
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', forms.errors, '\n')
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)

def fichero_sosi(id):
    sosi = models.sosi.objects.get(id = id)

    media_root = '/'.join(['proyectos', f'/{sosi.proyecto.codigo}/', 'SOSI/']) 
    path = os.path.join(settings.MEDIA_ROOT + 'proyectos/' + f'{sosi.proyecto.codigo}/SOSI/')
    isExist = os.path.exists(path)

    if not isExist:
        os.makedirs(path)

    initial_path = sosi.archivo.path
    name = sosi.archivo.name
    cname = name.split('/')
    new_path = settings.MEDIA_ROOT + media_root + cname[-1]
    shutil.copy(initial_path, new_path)
    sosi.save()
    
@login_required
@permission_required('xavi.add_sosi')
@handle_exceptions
def nomsosi(request, id):
    existe_sosi = False
    
    proy = None
    
    try:
        proy = proyecto.objects.get(pk = id)
        try:
            s = proy.sosi
            if s.activo == True:
                existe_sosi = True
        except ObjectDoesNotExist:
            existe_sosi = False            
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except Exception as e:
        print(f'Error {e}')  

    # ttrab = Employee.objects.filter(active = True).exclude(first_name = request.user.first_name, last_name = request.user.last_name).order_by('first_name')
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    
    tidiomas = models.idioma.objects.filter(activo = True).order_by('nombre')
    
    tautores = models.autor_sosi.objects.filter(activo = True).order_by('nombre')

    success_url = reverse_lazy('listar_sosi')
    
    now = timezone.now()

    if existe_sosi == False: 
        template_name = 'P01/sosi/sosi_form.html'
        contexto = {
            'proyecto' : proy,
            'ttrab' : ttrab,
            'tidiomas' : tidiomas,
            'tautores' : tautores,
            'existe' : existe_sosi,
            'now' : now
        }
    else:
        archivo = proy.sosi.archivo

        # Expresión regular para URL
        regex_url = r'^(https?|ftp):\/\/[^\s/$.?#]+\.[^\s]*$'

        # Expresión regular para recurso compartido
        regex_recurso = r'^\\\\[\w\s-]+(\\[\w\s-]+)*$'

        # Verificar si es una URL
        if archivo and re.match(regex_url, archivo):
            tipo_archivo = 'url'
        # Verificar si es un recurso compartido
        elif archivo and re.match(regex_recurso, archivo):
            tipo_archivo = 'recurso'
        else:
            tipo_archivo = None

        print('\n\n----> tipo_archivo', tipo_archivo, '\n\n\n')
        
        template_name = 'P01/sosi/sosi_detail.html'
        contexto = {
            'objeto' : proy.sosi,
            'ttrab' : ttrab,
            'proyecto' : proy,
            'now' : now,
            'tipo_archivo' : tipo_archivo,
        }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        
        forms = form.sosi_form(request.POST, request.FILES)
        
        # try:
        #    e =  Employee.objects.get(first_name__iexact = request.user.first_name, last_name__iexact = request.user.last_name)
        # except:
        #     response = {}
        #     response['result'] = 'errorField'
        #     response['title'] = 'El usuario actual debe ser un trabajador'
        #     response['text'] = 'El usuario actual debe tener nombre y apellidos iguales que el trabajador que usa ahora el sistema'
        #     return JsonResponse(response)   
        
        res = validar_objeto(models.sosi, ['numero_salva'], forms)
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)           
        
        if forms.is_valid():                       
            with transaction.atomic():                
                try:     
                    try:
                        existe_sosi = models.sosi.objects.get(proyecto = id)
                    except:
                        existe_sosi = False
                        
                    #response = {}
                    #response['result'] = 'errorField'
                    #response['title'] = f'{forms['ubicacion_salva'].value()}'
                    #response['text'] = '!!!!!!'
                    #return JsonResponse(response)
                        
                    if not existe_sosi:                        
                        ent = sosi(
                            numero_salva = forms['numero_salva'].value(),
                            especialista = Employee.objects.get(pk = forms['especialista'].value()),
                            recibe = Employee.objects.get(pk = forms['recibe'].value()),
                            # recibe = Employee.objects.get(pk = 1),                     
                            # recibe = Employee.objects.get(first_name__iexact = request.user.first_name, last_name__iexact = request.user.last_name),                        
                            ubicacion_salva = forms['ubicacion_salva'].value() if forms['ubicacion_salva'].value() else None,
                            observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None,
                            archivo = forms['archivo'].value() if forms['archivo'].value() else None,
                            proyecto = proy,
                        )                        
                        ent.save()                                                   
                                                
                        register_logs(request, ent, ent.pk, ent.__str__(), 1)
                    else:                        
                        proy = proyecto.objects.get(pk = id)
                        ent = proy.sosi
                        ent.numero_salva = forms['numero_salva'].value()
                        ent.especialista = Employee.objects.get(pk = forms['especialista'].value())
                        ent.recibe = Employee.objects.get(pk = forms['recibe'].value())                    
                        ent.ubicacion_salva = forms['ubicacion_salva'].value() if forms['ubicacion_salva'].value() else None
                        ent.observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None
                        ent.archivo = forms['archivo'].value() if forms['archivo'].value() else None
                        ent.proyecto = proy
                        ent.activo = True
                        ent.save()
                        
                        register_logs(request, ent, ent.pk, ent.__str__(), 2)
                                           
                    
                    if forms['idioma'].value():          
                        for idioma in forms['idioma'].value():
                            ent.idioma.add(idioma)
                            ent.save()  
                    
                    if forms['autor'].value():                      
                        for autor in forms['autor'].value():
                            ent.autor.add(autor)
                            ent.save()      
                            
                        if len(forms['autor'].value()) >= 5:
                            ent.colectivo = True
                            ent.save()
                              
                    # fichero_sosi(ent.id)
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'SOSI guardado con éxito'
                    return JsonResponse(response)                 
                except IntegrityError as e:
                    print(f"Error de integridad en la base de datos: {e}")
                except Exception as e:
                    print(f"Error inesperado: {e}")
            
            return HttpResponseRedirect(success_url)
    
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', forms.errors, '\n')
            return render(request, template_name, contexto)  # Muestra el formulario con errores si existen

@csrf_exempt
@handle_exceptions
@permission_required('xavi.view_sosi')
def abrir_recurso(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))
        id_sosi = data.get('idsosi')
        response = {}

        try:
            sosi = models.sosi.objects.get(pk = id_sosi)
            comando = f'explorer.exe {sosi.archivo}'
            subprocess.run(comando, shell=True)
            response['result'] = 'success'
            response['title'] = ' Se ha abierto el recurso en la red'
            response['text'] = ''
        except:
            response['result'] = 'errorField'
            response['title'] = 'Error: no se pudo abrir el recurso compartido en la red'
            response['text'] = ''
        
        return JsonResponse(response) 

@handle_exceptions
def prueba(request):
    try:
        # Obtener todos los permisos que empiezan con 'view_' o 'add_'
        proys = models.proyecto.objects.all()
        #for pro in proys:
        #    pro.delete()
        return JsonResponse({'ok': str(len(proys))})
    except User.DoesNotExist:
        # Manejar el caso en que el usuario no existe
        return JsonResponse({'error': 'Usuario no encontrado'}, status=404)
    except Exception as e:
        # Manejar cualquier otra excepción que pueda ocurrir
        return JsonResponse({'error': str(e)}, status=500)
    
    # try:
    #     cup = tipo_moneda.objects.get(activo = True, siglas__iexact = 'cup')
    #     print('\n', 'cup cup cup', cup, '\n')
    #     costo = financiamiento_proyecto.objects.filter(
    #         activo = True, 
    #         # registro = reg,
    #         # tipo_moneda = cup
    #     )
    #     print('\n', 'COSTO', costo, '\n')
    # except:
    #     print(f'Error hallando el financiamiento del proyecto en CUP')
        
    return JsonResponse({'e' : 'jhsjssh'})   
    # aprob = registro_aprobacion(
    #     prioridad = get_object_or_404(prioridad, pk=1),
    #     contrato = 'CTR1',
    #     centro_costo = 'Ese mismo',
    #     linea_tematica = get_object_or_404(linea_tematica, pk=1),
    #     fecha_terminacion = None,
    #     aprobacion_consejo = 'asdasdas',        
    # )    
    
    # aprob.save()
    
    # tr = Employee.objects.get(pk=1)
    # ff = get_object_or_404(fuente_financiamiento, pk=1)
    
    # aprob.employee.set([tr]) 
    # aprob.financiamiento.set([ff])
    # aprob.save()
    
    #proy = get_object_or_404(proyecto, pk=1)
    #proy.registro_aprobacion = get_object_or_404(registro_aprobacion, pk=1)
    #proy.save()
    
    # proy = proyecto(
    #     no = 1,
    #     codigo = 'DES2322',
    #     nombre_proyecto = 'primer proyecto',
    #     registro_aprobacion = None,
    #     estado = get_object_or_404(estado_proyecto, pk=1),
    # )
    
    #proy.save()    
    
    # print('asdasdasdasdasd')
    # question = get_list_or_404(acuerdo, fecha__gte='2023-02-22')
    # return HttpResponse(question)
    
    # return render(request, 'prueba.html')
    
    # doki = User.objects.get(username='doki')
    # doki.password = make_password('admin')
    # doki.save()
    # xavi = User.objects.get(username='xavi')
    # xavi.password = make_password('admin')
    # xavi.save()
    # admin = User.objects.get(username='admin')
    # admin.password = make_password('admin')
    # admin.save()
    
    # return JsonResponse({'ok': 'ok'})
    
    
    # template_name = 'prueba.html'
    # return render(request, template_name)
    # login(request, user)
    # print('\n', 'METHOD', request.method, '\n')
    # print('\n', 'USER', request.user, '\n')
    
    # usuario_actual = UserApp.objects.get(user_ptr_id=request.user)
    # usuario_actual.notificado = False
    # usuario_actual.save()
    
    # objetivos = objetivo.objects.all()
    # objetivos.update(
    #     activo=True
    # )
    # indicadores = indicador_objetivos.objects.all()
    # indicadores.update(
    #     activo=True
    # )
    # tareas = accion_indicador_objetivo.objects.all()
    # tareas.update(
    #     activo=True
    # )
    # evaluaciones = evaluacion_trimestral.objects.all()
    # evaluaciones.update(
    #     activo=True
    # )
    # acuerdos = acuerdo.objects.all()
    # acuerdos.update(
    #     activo=True
    # )
    # premios = models.premio.objects.all()
    # premios.update(
    #     activo=True
    # )
    # areas = models.area.objects.all()
    # areas.update(
    #     activo=True
    # )
    # lineas = models.linea_tematica.objects.all()
    # lineas.update(
    #     activo=True
    # )
    # acds = models.estado_acuerdo.objects.all()
    # acds.update(
    #     activo=True
    # )
    
    # messages.error(request, "Se han reiniciado los datos")
    
    
    # notify.send(request.user, recipient=request.user, verb=_('Modelos restaurados satisfactoriamente'), level='success')
    # notify.send(user, recipient=user, verb=_('Bienvenido a Proyecto!!'), level='success')
    
    # print('\n', '---descripcion:', desc, '\n')
    
    # desc = accion.descripcion.all()
        
    # for d in desc:
    #     print('\n', '---descripcion:', accion, '\n')
    #     print('Tipo de modelo:', type(accion).__name__, '\n')
    
    return JsonResponse({'ok': 'ok'})

@login_required
@user_has_any_permission('xavi.add_objetivo', 'xavi.add_indicador_objetivos')
@handle_exceptions
def nomindicador_objetivo(request, id = 0):
    try:
        # test = estado_indicador_objetivos.objects.filter(activo=True)
        tobj = objetivo.objects.filter(activo=True).order_by('nombre')
        tacc = accion_indicador_objetivo.objects.filter(activo=True, indicador = None).order_by('nombre')
    except OperationalError as e:
        print(f"Error de base de datos: {e}")
        raise
    except Exception as e:
        print(f"Se produjo una excepción: {e}")
        raise

    template_name = 'P01/indicador_objetivo/indicador_objetivo_form.html'
    success_url = reverse_lazy("listar_indicador_objetivo")
    contexto = {
        # 'test' : test,
        'tobj' : tobj,
        'tacc' : tacc,
    }
    
    if id != 0:
        try:
            objeto = objetivo.objects.get(pk = id)
            contexto['obj'] = objeto
        except ObjectDoesNotExist:
            raise ObjectDoesNotExist
        except:
            raise

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.indicador_objetivo_form(request.POST)         
        
        # eo = indicador_objetivos.objects.filter(nombre = forms['nombre'].value())
        # if len(eo):
            #messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['title'] = 'El NO. del proyecto ya existe'
            # return JsonResponse(response)
            
        try:
            with transaction.atomic():
                objeto = indicador_objetivos.objects.create(
                    no = form.get_ultimo(indicador_objetivos),
                    nombre = forms['nombre'].value(),
                    # estado = estado_indicador_objetivos.objects.get(pk = forms['estado'].value()),
                    # objetivo = objetivo.objects.get(pk = forms['objetivo'].value()) if forms['objetivo'].value() else None,
                    # activo = forms['activo'].value()    
                )
                
                objeto.save()                
                
                """hago una lista y para cada formato guardo el elemento,
                    la intencion es luego pasarle la lista a proyecto"""
                acc = accion_indicador_objetivo.objects.filter(indicador=objeto)
                acc.update(
                    indicador = None
                )
                acciones = forms['accion'].value()                
                for f in acciones:
                    try:
                        felem = accion_indicador_objetivo.objects.get(pk = f)                        
                        felem.indicador = objeto
                        if felem.no == None:
                            felem.no = 1
                        else:
                            felem.no = get_ultimo_dependencia(accion_indicador_objetivo, objeto)
                        felem.save()
                        felem.codigo = f'{objeto.no}.{felem.no}'
                        # felem.codigo = f'{objeto.no}.{form.get_ultimo_dependencia(accion_indicador_objetivo, objeto)}'
                        # no_tarea = felem.no if felem.no != None else 1
                        felem.save()
                    except Exception as e:
                        print(f"Error durante la carga de Tareas: {e}")
                        raise

                register_logs(request, objeto, objeto.pk, str(objeto), 1)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Nuevo Objetivo de trabajo { objeto }'), level='info')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Objetivo de trabajo creado con éxito'
                return JsonResponse(response)
        except indicador_objetivos.DoesNotExist as e:
            messages.error(request, "Error: El objetivo no existe.")
            raise ObjectDoesNotExist
        except Exception as e:
            if forms.errors:
                print(f"Error durante la creación: {e}")
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                response = show_errors(forms)
                return JsonResponse(response)
            # messages.error(request, "Error durante la eliminación del Proyecto y ")
            return render(request, template_name, contexto)        

@login_required
@user_has_any_permission('xavi.add_objetivo', 'xavi.add_indicador_objetivos', 'xavi.add_accion_indicador_objetivo')
@handle_exceptions
def nomaccion_indicador_objetivo(request, id = 0):
    tarea = area.objects.filter(activo=True).order_by('nombre')
    tind = indicador_objetivos.objects.filter(activo=True).order_by('nombre')

    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_form.html'
    success_url = reverse_lazy("listar_accion_indicador_objetivo")
    contexto = {
        'tarea' : tarea,
        'tind' : tind,
    }
    
    if request.method == "GET":
        if id != 0:
            try:
                objeto = indicador_objetivos.objects.get(pk = id)
                contexto['ind'] = objeto                
            except ObjectDoesNotExist:
                raise ObjectDoesNotExist
            except Exception as e:
                print(f"Se produjo una excepción no esperada: {e}")          
                raise
        else:
            contexto['ind'] = None
        
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.accion_indicador_objetivo_form(request.POST)
        
        try:
            with transaction.atomic():
                objeto = accion_indicador_objetivo.objects.create(
                    no=form.get_ultimo(accion_indicador_objetivo),
                    nombre = forms['nombre'].value(),
                )
                objeto.save()
                
                if forms['indicador'].value():
                    indicador = indicador_objetivos.objects.get(pk = forms['indicador'].value())
                    objeto.indicador = indicador
                    objeto.codigo = f'{indicador.no}.{objeto.no}'
                    
                objeto.save()
                register_logs(request, objeto, objeto.pk, str(objeto), 1)
                
                desc = descripcion.objects.create(
                    accion = objeto,
                    area = area.objects.get(pk = forms['area'].value()),
                    area_principal = True
                )
                
                desc.save()
                
                register_logs(request, desc, desc.pk, str(desc), 1)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Nueva Tarea de Objetivo de trabajo: { objeto }'), level='info')

                response = {}
                response['result'] = 'success'
                response['title'] = 'Tarea de Objetivo de trabajo creada con éxito'
                return JsonResponse(response)
                
        except Exception as e:
            print(f"Error durante la creación: {e}")
            if forms.errors:
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                response = show_errors(forms)
                return JsonResponse(response)
            return render(request, template_name, contexto)
        
@login_required
@permission_required('xavi.add_objetivo')
@handle_exceptions
def nomobjetivo(request):
    try:
        tind = indicador_objetivos.objects.filter(activo=True).order_by('nombre')
    except OperationalError as e:
        print(f"Error de base de datos: {e}")
        raise
    except Exception as e:
        print(f"Se produjo una excepción: {e}")
        raise

    template_name = 'P01/objetivo/objetivo_form.html'
    success_url = reverse_lazy("listar_objetivo")
    contexto = {
        'tind': tind,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.objetivo_form(request.POST)

        # validar que no sea igual en el mismo anno 
        res = validar_objeto(models.objetivo, ['nombre_objetivo'], forms)
        if res['result'] == 'errorField' or res['result'] == 'error':
            res['text'] = ''
            res['error_message'] = ''
            return JsonResponse(res)
        
        try:
            with transaction.atomic():
                try:
                    fecha_definicion = datetime.strptime(forms['fecha_definicion'].value(), '%Y-%m-%d')
                except ValueError:
                    raise ValueError("El formato de la fecha no es válido")
                
                objeto = objetivo.objects.create(
                    no=get_ultimo(objetivo),
                    nombre=forms['nombre'].value(),
                    fecha_definicion=fecha_definicion,
                )
                objeto.save()
                
                # Asignar el objetivo a los indicadores seleccionados
                indicadores = forms['indicador'].value()
                for f in indicadores:
                    try:
                        felem = indicador_objetivos.objects.get(pk=f)
                        felem.objetivo = objeto
                        felem.save()
                    except indicador_objetivos.DoesNotExist:
                        messages.error(request, "Error: El indicador no existe.")
                        raise ObjectDoesNotExist
                    except Exception as e:
                        print(f"Error durante la carga de Indicadores: {e}")
                        raise

                register_logs(request, objeto, objeto.pk, str(objeto), 1)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Nuevo Objetivo estratégico: { objeto }'), level='info')
                # messages.success(request, "Objetivo creado con éxito")
                # return HttpResponseRedirect(success_url)
                response = {}
                response['result'] = 'success'
                response['title'] = 'Objetivo estratégico creado con éxito'
                return JsonResponse(response)
        except IntegrityError as e:
            messages.error(request, "Error de integridad en la base de datos.")
            raise
        except Exception as e:
            print(f"Error durante la creación: {e}")
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)

    return render(request, template_name, contexto)


@login_required
@permission_required('xavi.add_premio')
@handle_exceptions
def nompremio(request):
    tent = Entity.objects.filter(active = True).order_by('name')

    template_name = 'P01/premio/premio_form.html'
    success_url = reverse_lazy("listar_premio")
    contexto = {
        'tent' : tent,
        'now' : datetime.now(),    
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.premio_form(request.POST, request.FILES)
        
        # validar que el premio no se repita con la combinacion nombre y anno
        #res = validar_objeto(models.premio, ['nombre'], forms)
        #if res['result'] == 'errorField' or res['result'] == 'error':
        #    return JsonResponse(res)
        
        if validar_fecha(forms['fecha'].value(), 'menor_igual', None) == False:
            res['result'] = 'error'
            res['title'] = f'El valor del campo fecha no cumple la condición'
            res['field'] = 'fecha'
            return JsonResponse(res)
        
        if forms.is_valid():
            try:
                with transaction.atomic():
                    objeto = premio.objects.create(
                        nombre = forms['nombre'].value(),
                        descripcion = forms['descripcion'].value() if forms['descripcion'].value() else None,
                        entidad = Entity.objects.get(pk = forms['entidad'].value()),
                        fecha = forms['fecha'].value(),
                        archivo = forms.cleaned_data['archivo'] if forms.cleaned_data['archivo'] else None,
                    )
                    objeto.save()

                    register_logs(request, objeto, objeto.pk, str(objeto), 1)
                    #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Nuevo Premio: { objeto }'), level='info')
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Premio y Reconocimiento creado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f'Hubo un error {e}')
                if forms.errors:
                    response = show_errors(forms)
                    return JsonResponse(response)
        if forms.errors:
            response = show_errors(forms)
            return JsonResponse(response)

@login_required
@permission_required('xavi.add_acuerdo')
@handle_exceptions
def nomacuerdo(request):
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    test = estado_acuerdo.objects.filter(activo = True).exclude(nombre__iexact='cumplido').order_by('nombre')

    template_name = 'P01/acuerdo/acuerdo_form.html'
    success_url = reverse_lazy("listar_acuerdo")
    contexto = {
        'ttrab' : ttrab,
        'test' : test,
        'numero' : get_ultimo(acuerdo, 'numero'),
        'now' : datetime.now(),
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.acuerdo_form(request.POST)
        
        res = validar_objeto(models.premio, ['nombre'], forms)
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)
        
        if validar_fecha(forms['fecha'].value(), 'menor_igual', None) == False:
            res['result'] = 'error'
            res['title'] = f'El valor del campo fecha no cumple la condición'
            res['field'] = 'fecha'
            return JsonResponse(res)
        
        try:
            with transaction.atomic():
                
                objeto = acuerdo.objects.create(
                    numero = forms['numero'].value(),
                    nombre = forms['nombre'].value(),
                    fecha = forms['fecha'].value(),
                    fecha_limite = forms['fecha_limite'].value() if forms['fecha_limite'].value() else None,
                    # fecha_cumplimiento = forms['fecha_cumplimiento'].value() if forms['fecha_cumplimiento'].value() else None,
                    observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None,
                    estado = estado_acuerdo.objects.get(pk = forms['estado'].value()),
                )
                
                register_logs(request, objeto, objeto.pk, str(objeto), 1)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Nuevo Acuerdo del CD: { objeto }'), level='info')
                
                objeto.employee.set(forms['employee'].value())

                response = {}
                response['result'] = 'success'
                response['title'] = 'Acuerdo del Consejo de Dirección creado con éxito'
                return JsonResponse(response)
        except IntegrityError as e:
            messages.error(request, "Error de integridad en la base de datos.")
            raise
        except Exception as e:
            print(f"Error durante la creación: {e}")
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)

    return render(request, template_name, contexto)

@login_required
@permission_required('xavi.change_premio')
@handle_exceptions
def premio_update(request, id):
    try:
        objeto = models.premio.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise

    tent = Entity.objects.filter(active = True).order_by('name')

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

        res = validar_objeto(models.premio, ['nombre'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)
        
        if validar_fecha(forms['fecha'].value(), comparacion='menor_igual', fecha_comparar=None) == False:
            res['result'] = 'error'
            res['title'] = f'El valor del campo fecha no cumple la condición'
            res['field'] = 'fecha'
            return JsonResponse(res)
        
        if forms.is_valid():
            try:
                with transaction.atomic():        
                    objeto.nombre = forms['nombre'].value()
                    objeto.entidad = Entity.objects.get(pk=forms['entidad'].value())
                    objeto.fecha = forms['fecha'].value()
                    if forms.cleaned_data['archivo']:
                        objeto.archivo = forms.cleaned_data['archivo']
                    if forms['descripcion'].value():
                        objeto.descripcion = forms['descripcion'].value()
                    objeto.save()
                    

                    register_logs(request, objeto, objeto.pk, str(objeto), 2)
                    #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Premio: { objeto }'), level='info')
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Premio y Reconocimiento modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f'Ha ocurrido un error {e}')
                return HttpResponseRedirect(success_url)
        if forms.errors:
            response = show_errors(forms)
            return JsonResponse(response)

@login_required
@permission_required('xavi.change_objetivo')
@handle_exceptions
def objetivo_update(request, id):
    try:
        objeto = objetivo.objects.get(pk = id) 
    except OperationalError as e:
        print(f"Error de base de datos: {e}")
        raise
    except Exception as e:
        print(f"Se produjo una excepción: {e}")
        raise

    tind = indicador_objetivos.objects.filter(activo = True).order_by('nombre')
    myind = indicador_objetivos.objects.filter(activo = True, objetivo = objeto).order_by('nombre')
    
    teva = evaluacion.objects.filter(activo = True).order_by('-valor')
    myeva = evaluacion_trimestral.objects.filter(activo = True, objetivo = objeto, periodo__activo = True).order_by('periodo__orden')
    
    tped = periodo.objects.filter(activo = True).order_by('orden')

    disponibles = len(tped) - len(myeva)

    template_name = 'P01/objetivo/objetivo_update_form.html'
    success_url = reverse_lazy("listar_objetivo")
    contexto = {
        'objeto' : objeto,
        'tind' : tind,
        'myind' : myind,
        'teva' : teva,
        'myeva' : myeva,
        'tped' : tped,
        'disponibles' : disponibles,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.objetivo_form(request.POST)
        
        res = validar_objeto(models.objetivo, ['nombre_objetivo'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            res['text'] = ''
            res['error_message'] = ''
            return JsonResponse(res)
        
        response = {}
                
        try:
            with transaction.atomic():
                try:
                    fecha_definicion = datetime.strptime(forms['fecha_definicion'].value(), '%Y-%m-%d')
                except ValueError:
                    raise ValueError("El formato de la fecha no es válido")
                
                objeto.nombre = forms['nombre'].value()
                objeto.fecha_definicion = fecha_definicion
                objeto.save()
                
                inds = models.indicador_objetivos.objects.filter(objetivo = objeto)
                inds.update(
                    objetivo = None
                )
                indicadores = forms['indicador'].value()
                for f in indicadores:
                    try:
                        felem = models.indicador_objetivos.objects.get(pk=int(f))
                        felem.objetivo = objeto
                        felem.save()
                    except ObjectDoesNotExist:
                        print('\n', 'ERROR: INDICADOR NO EXISTE', '\n')
                        messages.error(request, "Error: El Objetivo de trabajo no existe.")
                        response['result'] = 'error'
                        response['title'] = 'Error: El Objetivo de trabajo no existe.'
                        return JsonResponse(response)
                    except Exception as e:
                        print(f"Error durante la carga de Indicadores: {e}")
                        raise
                    

                register_logs(request, objeto, objeto.pk, str(objeto), 2)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Objetivo estratégico: { objeto }'), level='info')
                response['result'] = 'success'
                response['title'] = 'Objetivo estratégico actualizado con éxito'
                return JsonResponse(response)
        except IntegrityError as e:
            print(f'Error de integridad {e}')
            response['result'] = 'error'
            response['title'] = 'Error de integridad en la base de datos.'
            return JsonResponse(response)
            # raise
        except Exception as e:
            print(f"Error durante la creación: {e}")
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)
            response['result'] = 'error'
            response['title'] = f"Error durante la creación: {e}"
            return JsonResponse(response)

@login_required
@user_has_any_permission('xavi.change_objetivo', 'xavi.change_indicador_objetivos')
@handle_exceptions
def indicador_objetivo_update(request, id):
    try:
        objeto = indicador_objetivos.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise

    tobj = objetivo.objects.filter(activo = True).order_by('nombre')
    tacc = accion_indicador_objetivo.objects.filter(activo = True, indicador = None).order_by('nombre')
    myacc = accion_indicador_objetivo.objects.filter(indicador = objeto).order_by('nombre')

    template_name = 'P01/indicador_objetivo/indicador_objetivo_update_form.html'
    success_url = reverse_lazy("listar_indicador_objetivo")
    contexto = {
        'objeto' : objeto,
        'tobj' : tobj,
        # 'test' : test,        
        'tacc' : tacc,
        'myacc' : myacc,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.indicador_objetivo_form(request.POST)

        # eo = indicador_objetivos.objects.filter(nombre = forms['nombre'].value())
        # if len(eo) and eo[0].id != objeto.id:
            #messages.error(request, "Ya existe este nombre")
            # response['result'] = 'error'
            # response['title'] = 'El NO. del proyecto ya existe'
            # return JsonResponse(response)
            
        try:
            with transaction.atomic():
                
                objeto.nombre = forms['nombre'].value()
                # estado = estado_indicador_objetivos.objects.get(pk = forms['estado'].value())
                # objeto.objetivo = objetivo.objects.get(pk = forms['objetivo'].value()) if forms['objetivo'].value() else None
                
                objeto.save()
                
                """hago una lista y para cada formato guardo el elemento,
                    la intencion es luego pasarle la lista a proyecto"""
                acc = accion_indicador_objetivo.objects.filter(indicador=objeto)
                acc.update(
                    indicador = None
                )
                acciones = forms['accion'].value()                
                for f in acciones:
                    try:
                        felem = accion_indicador_objetivo.objects.get(pk = f)                        
                        felem.indicador = objeto
                        if felem.no == None:
                            felem.no = 1
                        else:
                            felem.no = get_ultimo_dependencia(accion_indicador_objetivo, objeto)
                        felem.save()
                        felem.codigo = f'{objeto.no}.{felem.no}'
                        # felem.codigo = f'{objeto.no}.{form.get_ultimo_dependencia(accion_indicador_objetivo, objeto)}'
                        # no_tarea = felem.no if felem.no != None else 1
                        felem.save()
                        print('\n', 'FELEM.NO', felem.no, felem.codigo, '\n')      
                    except Exception as e:
                        print(f"Error durante la carga de Tareas: {e}")
                        raise

                register_logs(request, objeto, objeto.pk, str(objeto), 2)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Objetivo de trabajo: { objeto }'), level='info')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Objetivo de trabajo actualizado con éxito'
                return JsonResponse(response)
        except indicador_objetivos.DoesNotExist as e:
            messages.error(request, "Error: El objetivo no existe.")
            raise ObjectDoesNotExist
        except Exception as e:
            if forms.errors:
                print(f"Error durante la creación: {e}")
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                response = show_errors(forms)
                return JsonResponse(response)
            # messages.error(request, "Error durante la eliminación del Proyecto y ")
            return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.change_objetivo', 'xavi.change_indicador_objetivos', 'xavi.change_accion_indicador_objetivo')
@handle_exceptions
def accion_indicador_objetivo_update(request, id):
    try:
        objeto = accion_indicador_objetivo.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    tarea = area.objects.filter(activo = True).order_by('nombre')
    
    try:
        mydesc = models.descripcion.objects.get(
            activo = True,
            accion = objeto,
            area_principal = True
        )
        tdesc = models.descripcion.objects.filter(
            activo = True,
            accion = objeto
        ).order_by('-fecha_creacion')
    except:
        mydesc = None
        tdesc = None
    
    try:
        last_desc = models.descripcion.objects.latest('fecha_creacion')
    except:
        last_desc = None

    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_update_form.html'
    success_url = reverse_lazy("listar_accion_indicador_objetivo")
    contexto = {
        'objeto' : objeto,
        'tarea' : tarea,
        'mydesc' : mydesc,
        'tdesc' : tdesc,
        'last_desc' : last_desc,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.accion_indicador_objetivo_form(request.POST)

        try:
            with transaction.atomic():
                objeto.nombre = forms['nombre'].value()
                objeto.save()
                
                register_logs(request, objeto, objeto.pk, str(objeto), 2)
                
                response = {}
                
                try:
                    descripciones = objeto.descripcion.all()

                    for d in descripciones:
                        d.area_principal = False
                        d.save()           
                    
                    ar = area.objects.get(activo = True, pk = forms['area'].value())
                                        
                    if forms['descripcion'].value():
                        try:
                            desc = models.descripcion.objects.get(activo = True, area = ar, accion = objeto)
                            desc.descripcion = forms['descripcion'].value()
                            desc.area_principal = True
                            desc.save()
                            register_logs(request, desc, desc.pk, str(desc), 1)
                            response['title'] = 'Tarea modificada con éxito'
                        except:
                            desc = models.descripcion.objects.create(
                                accion = objeto,
                                area = ar,
                                area_principal = True,
                                descripcion = forms['descripcion'].value(),
                            )
                            desc.save()
                            register_logs(request, desc, desc.pk, str(desc), 1)
                            response['title'] = 'Tarea y descripción modificadas con éxito'
                    else:
                        response['title'] = 'Tarea modificada con éxito'
                except Exception as e:
                    print(f'Error al obtener area o descripcion: {e}')
                    raise
                
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Tarea de Objetivo de trabajo: { objeto }'), level='info')
                response['result'] = 'success'
                return JsonResponse(response)
        except Exception as e:
            if forms.errors:
                print(f"Error durante la creación: {e}")
                """ Obtiene el mensaje del ValidationError y lo muestra como alerta """
                response = show_errors(forms)
                return JsonResponse(response)
            # messages.error(request, "Error durante la eliminación del Proyecto y ")
            return render(request, template_name, contexto)

@login_required
@permission_required('xavi.change_acuerdo')
@handle_exceptions
def acuerdo_update(request, id):
    try:
        objeto = acuerdo.objects.get(pk = id) 
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise

    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    test = estado_acuerdo.objects.filter(activo = True).order_by('nombre')
    
    myworkers = objeto.employee.filter(active = True).order_by('first_name')
    
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

        res = validar_objeto(models.acuerdo, ['numero'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            res['text'] = ''
            res['error_message'] = ''
            return JsonResponse(res)

        try:
            with transaction.atomic():        
                objeto.nombre = forms['nombre'].value()
                objeto.fecha = forms['fecha'].value()
                objeto.fecha_limite = forms['fecha_limite'].value() if forms['fecha_limite'].value() else None
                objeto.observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None
                
                estado = estado_acuerdo.objects.get(pk=forms['estado'].value())
                print('\n', 'ESTADO ESTADO', estado.nombre.lower(), '\n')
                print('\n', 'fecha_cumplimiento', forms['fecha_cumplimiento'].value(), '\n')
                objeto.estado = estado
                
                if estado.nombre.lower() == 'cumplido':
                    objeto.fecha_cumplimiento = forms['fecha_cumplimiento'].value() if forms['fecha_cumplimiento'].value() else datetime.now()
                else:
                    objeto.fecha_cumplimiento = None     

                objeto.employee.clear()
                responsables = forms['employee'].value()
                for f in responsables:
                    try:
                        felem = Employee.objects.get(pk = f)
                        objeto.employee.add(felem)
                    except Exception as e:
                        print(f'Error al salvar {e}')
                        raise
                    
                objeto.save()

                register_logs(request, objeto, objeto.pk, str(objeto), 2)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Acuerdo del CD: { objeto }'), level='info')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Acuerdo del Consejo de Dirección modificado con éxito'
                return JsonResponse(response)
        except Exception as e:
            print(f'Ha ocurrido un error {e}')
            response = {}
            response['result'] = 'error'
            response['title'] = 'Ha ocurrido un error'
            return JsonResponse(response)

class prioridad_update(LoginRequiredMixin, UpdateView):
    model = prioridad
    form_class = form.prioridad_form
    success_url = reverse_lazy("listar_prioridades")
    template_name = 'nomencladores/prioridad/prioridad_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_prioridad'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_prioridades')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, prioridad, self.object.pk, self.object.__str__(), 2)
        #notify.send(self.request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Prioridad: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Prioridad actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class periodo_update(LoginRequiredMixin, UpdateView):
    model = periodo
    form_class = form.periodo_form
    success_url = reverse_lazy("listar_periodos")
    template_name = 'nomencladores/periodo/periodo_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_objetivo', 'xavi.change_periodo'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_periodos')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, periodo, self.object.pk, self.object.__str__(), 2)
        #notify.send(self.request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de periodo: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Periodo actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class tipo_extension_update(LoginRequiredMixin, UpdateView):
    model = tipo_extension
    form_class = form.tipo_extension_form
    success_url = reverse_lazy("listar_tipo_extension")
    template_name = 'nomencladores/tipo_extension/tipo_extension_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_tipo_extension'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_tipo_extension')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, tipo_extension, self.object.pk, self.object.__str__(), 2)
        #notify.send(self.request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de tipo de extensión: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Tipo de extensión actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class tipo_moneda_update(LoginRequiredMixin, UpdateView):
    model = tipo_moneda
    form_class = form.tipo_moneda_form
    success_url = reverse_lazy("listar_tipo_moneda")
    template_name = 'nomencladores/tipo_moneda/tipo_moneda_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_tipo_moneda'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_tipo_moneda')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, tipo_moneda, self.object.pk, self.object.__str__(), 2)
        #notify.send(self.request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de tipo de extensión: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Tipo de moneda actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class area_update(LoginRequiredMixin, UpdateView):
    model = area
    form_class = form.area_form
    success_url = reverse_lazy("listar_areas")
    template_name = 'nomencladores/area/area_update_form.html'

    @method_decorator(user_has_any_permission('SISGDDO.change_afectaciones', 'xavi.change_proyecto', 'xavi.change_accion_indicador_objetivo', 'SISGDDO.change_incidencia'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_areas')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, area, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Área actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class cliente_update(LoginRequiredMixin, UpdateView):
    model = cliente
    form_class = form.cliente_form
    success_url = reverse_lazy("listar_clientes")
    template_name = 'nomencladores/cliente/cliente_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_cliente', 'xavi.change_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_clientes')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, cliente, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Cliente actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class autor_update(LoginRequiredMixin, UpdateView):
    model = autor_sosi
    form_class = form.autor_form
    success_url = reverse_lazy("listar_autor")
    template_name = 'nomencladores/autor/autor_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_autor_sosi', 'xavi.change_sosi'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_autor')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, autor_sosi, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Autor de SOSI actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class idioma_update(LoginRequiredMixin, UpdateView):
    model = idioma
    form_class = form.idioma_form
    success_url = reverse_lazy("listar_idiomas")
    template_name = 'nomencladores/idioma/idioma_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_sosi', 'xavi.change_idioma'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_idiomas')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, idioma, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Idioma actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class representante_update(LoginRequiredMixin, UpdateView):
    model = representante
    form_class = form.representante_form
    success_url = reverse_lazy("listar_representantes")
    template_name = 'nomencladores/representante/representante_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_cliente', 'xavi.change_representante'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_representantes')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, representante, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Representante actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class etapa_proyecto_update(LoginRequiredMixin, UpdateView):
    model = etapa_proyecto
    form_class = form.etapa_proyecto_form
    success_url = reverse_lazy("listar_etapa_proyecto")
    template_name = 'nomencladores/etapa/etapa_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_etapa_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_etapa_proyecto')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, etapa_proyecto, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Etapa de proyecto actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class evaluacion_update(LoginRequiredMixin, UpdateView):
    model = evaluacion
    form_class = form.evaluacion_form
    success_url = reverse_lazy("listar_evaluaciones")
    template_name = 'nomencladores/evaluacion/evaluacion_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_objetivo', 'xavi.change_evaluacion'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_evaluaciones')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, evaluacion, self.object.pk, self.object.__str__(), 2)
        #notify.send(self.request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Evaluación: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Evaluación actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_prioridad')
@handle_exceptions
def eliminar_prioridad(request, id):
    try:
        objeto = models.prioridad.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/prioridad/prioridad_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Prioridad: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Prioridad eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_objetivo', 'xavi.delete_periodo')
@handle_exceptions
def eliminar_periodo(request, id):
    try:
        objeto = models.periodo.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/periodo/periodo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de periodo: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Periodo eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_tipo_extension')
@handle_exceptions
def eliminar_tipo_extension(request, id):
    try:
        objeto = models.tipo_extension.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/tipo_extension/tipo_extension_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de tipo de extensión: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Tipo de extensión eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)
@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_tipo_moneda')
@handle_exceptions
def eliminar_tipo_moneda(request, id):
    try:
        objeto = models.tipo_moneda.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/tipo_moneda/tipo_moneda_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de tipo de extensión: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Tipo de moneda eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_area', 'SISGDDO.delete_afectaciones', 'xavi.delete_accion_indicador_objetivo', 'SISGDDO.delete_incidencia')
@handle_exceptions
def eliminar_area(request, id):
    try:
        objeto = models.area.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/area/area_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Área: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Área eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_cliente')
@handle_exceptions
def eliminar_cliente(request, id):
    try:
        objeto = models.cliente.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/cliente/cliente_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Área: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Cliente eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_sosi', 'xavi.delete_autor_sosi')
@handle_exceptions
def eliminar_autor(request, id):
    try:
        objeto = models.autor_sosi.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/autor/autor_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Área: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Autor de SOSI eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_sosi', 'xavi.delete_idioma')
@handle_exceptions
def eliminar_idioma(request, id):
    try:
        objeto = models.idioma.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/idioma/idioma_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Área: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Idioma eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_sosi', 'xavi.delete_cliente', 'xavi.delete_representante')
@handle_exceptions
def eliminar_representante(request, id):
    try:
        objeto = models.representante.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/representante/representante_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Área: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Representante eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_etapa_proyecto')
@handle_exceptions
def eliminar_etapa_proyecto(request, id):
    try:
        objeto = models.etapa_proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/etapa/etapa_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Área: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Etapa de proyecto eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_objetivo', 'xavi.delete_evaluacion')
@handle_exceptions
def eliminar_evaluacion(request, id):
    try:
        objeto = models.evaluacion.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/evaluacion/evaluacion_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Evaluación: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Evaluación eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_trabajador_proyecto')
@handle_exceptions
def eliminar_rol_trabajador_proyecto(request, id):
    try:
        objeto = models.rol_trabajador_proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/rol_trabajador_proyecto/rol_trabajador_proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto = objeto.proyecto
                objeto.employee.clear()
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                return redirect('listar_rol_trabajador_proyecto')
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@permission_required('xavi.delete_proyecto')
@handle_exceptions
def eliminar_proyecto(request, id):    
    try:
        objeto = models.proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'P01/proyecto/proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():  
            objeto.activo = False
            objeto.save()  
            print('\n----> Proyecto', objeto, '\n')  
                  
            objeto.registro_aprobacion.activo = False
            objeto.registro_aprobacion.save()
            register_logs(request, objeto.registro_aprobacion, objeto.registro_aprobacion.id, str(objeto.registro_aprobacion), 3)
            print('\n----> Aprob', objeto.registro_aprobacion, '\n')  
                
            try:
                terminacion = models.registro_terminacion.objects.get(proyecto = objeto) 
                terminacion.activo = False
                terminacion.save() 
                register_logs(request, terminacion, terminacion.id, str(terminacion), 3)                
            except:
                terminacion = None
            print('\n----> Termin', terminacion, '\n')      
            
            try:  
                objeto.registro_aprobacion.registro_reinicio.activo = False
                objeto.registro_aprobacion.registro_reinicio.save()
                register_logs(request, objeto.registro_aprobacion.registro_reinicio, objeto.registro_aprobacion.registro_reinicio.id, str(objeto.registro_aprobacion.registro_reinicio), 3)
                print('\n----> Reinicio', objeto.registro_aprobacion.registro_reinicio, '\n')  
            except:
                pass
            
            try:
                interrupcion = models.registro_interrupcion.objects.get(proyecto = objeto) 
                interrupcion.activo = False
                interrupcion.save() 
                register_logs(request, interrupcion, interrupcion.id, str(interrupcion), 3)            
            except:
                interrupcion = None      
            print('\n----> Interrupcion', interrupcion, '\n')    
            
            try:
                extension = models.registro_extension.objects.get(proyecto = objeto) 
                extension.activo = False
                extension.save() 
                register_logs(request, extension, extension.id, str(extension), 3)                
            except:
                extension = None        
            print('\n----> Extension', extension, '\n')            
               
            try:
                etapas = models.control_etapa.objects.get(proyecto = objeto)  
                etapas.activo = False
                etapas.save()
                register_logs(request, etapas, etapas.id, str(etapas), 3)
            except:
                etapas = None     
            print('\n----> Etapas', etapas, '\n')        
                        
            register_logs(request, objeto, objeto.id, str(objeto), 3)
            return redirect('listar_proyecto')
    return render(request, template_name, contexto)

@login_required
@permission_required('xavi.delete_premio')
@handle_exceptions
def eliminar_premio(request, id):
    try:
        objeto = models.premio.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise

    template_name = 'P01/premio/premio_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
            except:
                raise
            
        register_logs(request, objeto, objeto.pk, str(objeto), 3)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Premio: { objeto }', level='warning')
        
        response = {}
        response['result'] = 'success'
        response['title'] = 'Premio y Reconocimiento eliminado satisfactoriamente'
        return JsonResponse(response)
        
    return render(request, template_name, contexto)

@login_required
@permission_required('xavi.delete_acuerdo')
@handle_exceptions
def eliminar_acuerdo(request, id):
    try:
        objeto = models.acuerdo.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise

    template_name = 'P01/acuerdo/acuerdo_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Acuerdo del CD: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Acuerdo del Consejo de Dirección eliminado satisfactoriamente'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
        
    return render(request, template_name, contexto)

@login_required
@permission_required('xavi.delete_objetivo')
@handle_exceptions
def eliminar_objetivo(request, id):
    try:
        objeto = models.objetivo.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'P01/objetivo/objetivo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                indicadores = indicador_objetivos.objects.filter(activo=True, objetivo=objeto)
                for indicador in indicadores:
                    tareas = accion_indicador_objetivo.objects.filter(activo=True, indicador=indicador)
                    for tarea in tareas:
                        register_logs(request, tarea, tarea.id, str(tarea), 3)
                    tareas.update(
                        activo=False
                    )
                    register_logs(request, indicador, indicador.id, str(indicador), 3)
                indicadores.update(
                    activo=False
                )
                trimestral = evaluacion_trimestral.objects.filter(activo=True, objetivo=objeto)
                trimestral.update(
                    activo=False
                )
                objeto.save()
                
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Objetivo estratégico: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Objetivo estratégico y sus dependencias eliminados satisfactoriamente'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_objetivo', 'xavi.delete_indicador_objetivos')
@handle_exceptions
def eliminar_indicador_objetivo(request, id):
    try:
        objeto = models.indicador_objetivos.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'P01/indicador_objetivo/indicador_objetivo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                tareas = accion_indicador_objetivo.objects.filter(activo=True, indicador=objeto)
                for tarea in tareas:
                    register_logs(request, tarea, tarea.id, str(tarea), 3)
                tareas.update(
                    activo=False
                )
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Objetivo de trabajo: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Objetivo de trabajo y sus tareas eliminados satisfactoriamente'
                return JsonResponse(response)
                
                # return redirect('listar_indicador_objetivo')
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                response = {}
                response['result'] = 'error'
                response['title'] = 'Error al eliminar Objetivo de trabajo'
                return JsonResponse(response)
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_objetivo', 'xavi.delete_indicador_objetivos', 'xavi.delete_accion_indicador_objetivo')
@handle_exceptions
def eliminar_accion_indicador_objetivo(request, id):
    try:
        objeto = models.accion_indicador_objetivo.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                desc = objeto.descripcion.all()
                for d in desc:
                        d.activo = False
                        d.save() 
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Tarea de Objetivo de trabajo: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Tarea y descripciones eliminadas satisfactoriamente'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                raise
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@permission_required('xavi.delete_sosi')
@handle_exceptions
def eliminar_sosi(request, id):
    try:
        objeto = models.sosi.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise

    template_name = 'P01/sosi/sosi_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'SOSI eliminado satisfactoriamente'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
        
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_entrada_proyecto')
@handle_exceptions
def eliminar_entrada_proyecto(request, id):
    try:
        objeto = models.entrada_proyecto.objects.get(pk = id)     
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'P01/entrada_proyecto/entrada_proyecto_confirm_delete.html'

    contexto = {
        'object' : objeto
    }

    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Entrada de proyecto en DGCA eliminada satisfactoriamente'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
        
    return render(request, template_name, contexto)
@login_required
@permission_required('xavi.view_proyecto')
@handle_exceptions
def detalle_proyecto(request, id):
    try:
        objeto = models.proyecto.objects.get(pk = id)
        if objeto.registro_aprobacion == None:
            print(f'Error: No existe el registro de aprobacion')
            raise ObjectDoesNotExist
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except Exception as e:
        print(f'Error al encontrar el proyecto, {e}')

    try:
        rol_jefe = Position.objects.get(name__iexact = 'Jefe de proyecto')
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except Exception as e:
        print(f'Error al encontrar el jefe de proyecto, {e}')
    
    try:
        jefe = trabajador_registro.objects.get(
            proyecto = objeto,
            rol = rol_jefe
        )
    except:
        jefe = None
        # raise
        
    try:
        cup = tipo_moneda.objects.get(activo = True, siglas__iexact = 'cup')
        costo_cup = financiamiento_proyecto.objects.get(
            activo = True, 
            registro = objeto.registro_aprobacion,
            tipo_moneda = cup
        )
    except:
        costo_cup = 0
        print(f'Error hallando el financiamiento del proyecto en CUP')
        
    try:
        mlc = tipo_moneda.objects.get(activo = True, siglas__iexact = 'mlc')
        costo_mlc = financiamiento_proyecto.objects.get(
            activo = True, 
            registro = objeto.registro_aprobacion,
            tipo_moneda = mlc
        )
    except:
        costo_mlc = 0
        print(f'Error hallando el financiamiento del proyecto en MLC')
        
    try:
        mlc = tipo_moneda.objects.get(activo = True, siglas__iexact = 'mlc')
        ingreso_mlc = plan_ingreso_aprobacion.objects.get(
            activo = True, 
            registro = objeto.registro_aprobacion,
            tipo_moneda = mlc
        )
    except:
        ingreso_mlc = 0
        print(f'Error hallando el plan de ingreso del proyecto en MLC')
        
    try:
        mlc = tipo_moneda.objects.get(activo = True, siglas__iexact = 'mlc')
        ingreso_cup = plan_ingreso_aprobacion.objects.get(
            activo = True, 
            registro = objeto.registro_aprobacion,
            tipo_moneda = cup
        )
    except:
        ingreso_cup = 0
        print(f'Error hallando el plan de ingreso del proyecto en CUP')
        
    if costo_cup == 0:
        costo_no_calidad = 0
        costo_real = 0
    else:
        costo_no_calidad = calcular_costo_no_calidad(objeto.registro_aprobacion.fecha_inicio, objeto.registro_aprobacion.fecha_terminacion, costo_cup.valor)
        costo_real = calcular_costo_real(objeto.registro_aprobacion.fecha_inicio, objeto.registro_aprobacion.fecha_terminacion, costo_cup.valor)
    
    if costo_mlc == 0: 
        costo_no_calidad_mlc = 0
        costo_real_mlc = 0
    else:
        costo_no_calidad_mlc = calcular_costo_no_calidad(objeto.registro_aprobacion.fecha_inicio, objeto.registro_aprobacion.fecha_terminacion, costo_mlc.valor)
        costo_real_mlc = calcular_costo_real(objeto.registro_aprobacion.fecha_inicio, objeto.registro_aprobacion.fecha_terminacion, costo_mlc.valor)
        
    dias_atraso = calcular_dias_atraso(objeto.registro_aprobacion.fecha_terminacion)
    
    template_name = 'P01/proyecto/proyecto_detail.html'
    contexto = {
        'object' : objeto,
        'costo_no_calidad': costo_no_calidad,
        'costo_no_calidad_mlc': costo_no_calidad_mlc,
        'costo_real': costo_real,
        'costo_real_mlc': costo_real_mlc,
        'dias_atraso': dias_atraso,
        'jefe': jefe,
        'fuente_mlc': costo_mlc,
        'fuente_cup': costo_cup,
        'ingreso_mlc': ingreso_mlc,
        'ingreso_cup': ingreso_cup,
    }
    
    return render(request, template_name, contexto)

@login_required
@permission_required('xavi.view_proyecto')
@handle_exceptions
def detalle_aprobacion(request, id):
    # print('\n', '-----HE LLEGADO AL DETALLE DE APROBACION', '\n')
    try:
        objeto = models.proyecto.objects.get(pk = id)
        if objeto.registro_aprobacion == None:
            print(f'Error: No existe el registro de aprobacion')
            raise ObjectDoesNotExist
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except Exception as e:
        print(f'Error al encontrar el proyecto, {e}')
        
    myworker = objeto.registro_aprobacion.employee.get(position__name__iexact = 'Jefe de proyecto')
    
    print(f'\nJefe de proyecto: {myworker}\n')
    mycomercial = objeto.registro_aprobacion.employee.get(position__name__iexact = 'Comercial')
    
    mis_fuentes = objeto.registro_aprobacion.financiamiento.all().order_by('nombre')
    print('\n\n\n ----> mis_fuentes', mis_fuentes, '\n\n\n')
    
    try:
        fuente_mlc = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'MLC', fuente_financiamiento__in = mis_fuentes, registro = objeto.registro_aprobacion)
    except:
        fuente_mlc = None
    
    try:
        fuente_cup = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'CUP', fuente_financiamiento__in = mis_fuentes, registro = objeto.registro_aprobacion)
    except:
        fuente_cup = None
        
    myformats = objeto.formato.all().order_by('nombre')
    
    template_name = 'P01/proyecto/aprobacion_detail.html'
    contexto = {
        'form' : objeto,
        'myformats' : myformats,
        'myworker' : myworker,
        'mycomercial' : mycomercial,
        'fuente_mlc' : fuente_mlc,
        'fuente_cup' : fuente_cup,
    }
    
    return render(request, template_name, contexto)

@login_required()
@permission_required('xavi.view_premio')
@handle_exceptions
def detalle_premio(request, id):
    try:
        objeto = models.premio.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'P01/premio/premio_detail.html'
    contexto = {
        'objeto' : objeto,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)
    return render(request, template_name, contexto)

@login_required()
@user_has_any_permission('xavi.view_objetivo', 'xavi.view_indicador_objetivos')
@handle_exceptions
def detalle_indicador_objetivo(request, id):
    try:
        # objeto = models.formato.objects.get(pk = id)
        objeto = models.indicador_objetivos.objects.get(pk = id)
        myacc = accion_indicador_objetivo.objects.filter(activo = True, indicador = objeto).order_by('no')
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    # tobj = objetivo.objects.filter(activo = True)
    # test = estado_indicador_objetivos.objects.filter(activo = True)
    # tacc = accion_indicador_objetivo.objects.filter(activo = True, indicador=objeto)


    template_name = 'P01/indicador_objetivo/indicador_objetivo_detail.html'
    contexto = {
        'objeto' : objeto,
        # 'tobj' : tobj,
        # 'test' : test,
        # 'tacc' : tacc,
        'myacc' : myacc,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)

    return render(request, template_name, contexto)

@login_required()
@user_has_any_permission('xavi.view_acuerdo')
@handle_exceptions
def detalle_acuerdo(request, id):
    objeto = models.acuerdo.objects.get(pk = id)

    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    test = estado_acuerdo.objects.filter(activo = True).order_by('nombre')
    myworkers = objeto.employee.filter(active = True).order_by('nombre')

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
@permission_required('xavi.view_objetivo')
@handle_exceptions
def detalle_objetivo(request, id):
    try:
        objeto = models.objetivo.objects.get(pk = id)
        myind = indicador_objetivos.objects.filter(activo = True, objetivo = objeto).order_by('no')
        tareas = accion_indicador_objetivo.objects.filter(indicador__in=myind).order_by('nombre')
        myeva = evaluacion_trimestral.objects.filter(activo = True, objetivo = objeto, periodo__activo = True).order_by('periodo__orden')
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'P01/objetivo/objetivo_detail.html'
    contexto = {
        'objeto' : objeto,        
        'myind' : myind,
        'myeva' : myeva,
        'tareas' : tareas,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)

    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.view_objetivo', 'xavi.view_indicador_objetivos', 'xavi.view_accion_indicador_objetivo')
@handle_exceptions
def detalle_accion_indicador_objetivo(request, id):
    try:
        objeto = models.accion_indicador_objetivo.objects.get(pk = id)
        desc = descripcion.objects.filter(accion = objeto, activo = True).order_by('-fecha_creacion')
        
        if len(desc) == 0:
            raise ObjectDoesNotExist
    except objeto.ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise

    template_name = 'P01/accion_indicador_objetivo/accion_indicador_objetivo_detail.html'
    contexto = {
        'objeto' : objeto,
        'desc' : desc,
    }

    register_logs(request, objeto, objeto.pk, str(objeto), 0)

    return render(request, template_name, contexto)
@login_required
@user_has_any_permission('SISGDDO.delete_afectaciones', 'xavi.delete_proyecto', 'xavi.delete_entrada_proyecto', 'xavi.delete_formato')
@handle_exceptions
def eliminar_formato(request, id):
    try:
        objeto = models.formato.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/formato/formato_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Formato eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_acuerdo', 'xavi.delete_estado_acuerdo')
@handle_exceptions
def eliminar_estado_acuerdo(request, id):
    try:
        objeto = models.estado_acuerdo.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/estado_acuerdo/estado_acuerdo_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Estado de Acuerdo del CD: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Estadod de Acuerdo del Consejo de Dirección eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_estado_proyecto')
@handle_exceptions
def eliminar_estado_proyecto(request, id):
    try:
        objeto = models.estado_proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/estado_proyecto/estado_proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Estado de proyecto: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Estado de proyecto eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_entrada_proyecto', 'xavi.delete_estado_proyecto_dgca')
@handle_exceptions
def eliminar_estado_proyecto_dgca(request, id):
    try:
        objeto = models.estado_proyecto_dgca.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/estado_entrada/estado_entrada_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Estado de proyecto en DGCA: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Estado de proyecto en DGCA eliminado con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_objetivo', 'xavi.delete_indicador_objetivos', 'xavi.delete_accion_indicador_objetivo', 'xavi.delete_estado_indicador_objetivos')
@handle_exceptions
def eliminar_estado_indicador(request, id):
    try:
        objeto = models.estado_indicador_objetivos.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/estado_indicador/estado_indicador_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                return redirect('listar_estado_indicador')
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_tipo_proyecto')
@handle_exceptions
def eliminar_tipo_proyecto(request, id):
    try:
        objeto = models.tipo_proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/tipo_proyecto/tipo_proyecto_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                return redirect('listar_tipo_proyecto')
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_clasificacion')
@handle_exceptions
def eliminar_clasificacion(request, id):
    try:
        objeto = models.clasificacion.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/clasificacion/clasificacion_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Clasificación de proyecto eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_clasificacion', 'xavi.delete_subclasificacion')
@handle_exceptions
def eliminar_subclasificacion(request, id):
    try:
        objeto = models.subclasificacion.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/subclasificacion/subclasificacion_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Subclasificación eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_fuente_financiamiento')
@handle_exceptions
def eliminar_fuente_financiamiento(request, id):
    try:
        objeto = models.fuente_financiamiento.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/fuente_financiamiento/fuente_financiamiento_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Fuente de financiamiento: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Fuente de financiamiento eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

@login_required
@user_has_any_permission('xavi.delete_proyecto', 'xavi.delete_linea_tematica')
@handle_exceptions
def eliminar_linea_tematica(request, id):
    try:
        objeto = models.linea_tematica.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    template_name = 'nomencladores/linea_tematica/linea_tematica_confirm_delete.html'
    contexto = {
        'object' : objeto
    }
    
    if request.method == "POST":
        with transaction.atomic():
            try:
                objeto.activo = False
                objeto.save()
                # messages.success(request, " y Proyecto eliminados con éxito")
                
                register_logs(request, objeto, objeto.id, str(objeto), 3)
                #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Eliminación de Línea temática: { objeto }', level='warning')
                
                response = {}
                response['result'] = 'success'
                response['title'] = 'Línea temática eliminada con éxito'
                return JsonResponse(response)
            except Exception as e:
                print(f"Error durante la eliminación: {e}")
                # messages.error(request, "Error durante la eliminación del Proyecto y ")
    return render(request, template_name, contexto)

class nomlinea_tematica(LoginRequiredMixin, View):
    model = linea_tematica
    template_name = 'nomencladores/linea_tematica/linea_tematica_form.html'
    success_url = reverse_lazy("listar_linea_tematica")
    contexto = {
        'form': form.linea_tematica_form
    }

    @method_decorator(user_has_any_permission('xavi.add_proyecto', 'xavi.add_linea_tematica'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get(self, request):
        return render(request, self.template_name, self.contexto)

    def get_success_url(self):
        return reverse_lazy('listar_linea_tematica')

    def post(self, request, *args, **kwargs):
        print('\n', 'asasd', '\n')
        forms = form.linea_tematica_form(request.POST)

        if forms.is_valid():
            new_linea_tematica = forms.save()
            id_linea_tematica = new_linea_tematica.pk
            register_logs(request, linea_tematica, id_linea_tematica, new_linea_tematica.__str__(), 1)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nueva Línea temática: { new_linea_tematica.__str__() }', level='info')
            
            response = {
                'result': 'success',
                'title': 'Línea temática creada con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_linea_tematica')
@handle_exceptions
def listar_linea_tematica(request):
    lineas= models.linea_tematica.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': lineas
    }
    return render(request, 'nomencladores/linea_tematica/linea_tematica.html', contexto)

@login_required
@user_has_any_permission('xavi.view_acuerdo', 'xavi.view_estado_acuerdo')
@handle_exceptions
def listar_estado_acuerdo(request):
    estados = models.estado_acuerdo.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': estados
    }
    return render(request, 'nomencladores/estado_acuerdo/estado_acuerdo.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_estado_proyecto')
@handle_exceptions
def listar_estado_proyecto(request):
    estados = models.estado_proyecto.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': estados
    }
    return render(request, 'nomencladores/estado_proyecto/estado_proyecto.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_tipo_proyecto')
@handle_exceptions
def listar_tipo_proyecto(request):
    tipos = models.tipo_proyecto.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': tipos
    }
    return render(request, 'nomencladores/tipo_proyecto/tipo_proyecto.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_clasificacion')
@handle_exceptions
def listar_clasificacion(request):
    tipos = models.clasificacion.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': tipos
    }
    return render(request, 'nomencladores/clasificacion/clasificacion.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_clasificacion', 'xavi.view_subclasificacion')
@handle_exceptions
def listar_subclasificacion(request):
    tipos = models.subclasificacion.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': tipos
    }
    return render(request, 'nomencladores/subclasificacion/subclasificacion.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_fuente_financiamiento')
@handle_exceptions
def listar_fuente_financiamiento(request):
    datos = models.fuente_financiamiento.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/fuente_financiamiento/fuente_financiamiento.html', contexto)

class estado_acuerdo_update(LoginRequiredMixin, UpdateView):
    model = estado_acuerdo
    form_class = form.estado_acuerdo_form
    success_url = reverse_lazy("listar_estado_acuerdo")
    template_name = 'nomencladores/estado_acuerdo/estado_acuerdo_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_acuerdo', 'xavi.change_estado_acuerdo'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_estado_acuerdo')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, estado_acuerdo, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Actualización Estado de Acuerdo del CD: { self.object.__str__() }', level='info')        

        response_data = {
            'result': 'success',
            'title': 'Estado de Acuerdo del Consejo de Dirección actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)

class estado_proyecto_update(LoginRequiredMixin, UpdateView):
    model = estado_proyecto
    form_class = form.estado_proyecto_form
    success_url = reverse_lazy("listar_estado_proyecto")
    template_name = 'nomencladores/estado_proyecto/estado_proyecto_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_estado_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_estado_proyecto')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, estado_proyecto, self.object.pk, self.object.__str__(), 2)
        #notify.send(self.request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Estado de proyecto: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Estado de proyecto actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)

class tipo_proyecto_update(LoginRequiredMixin,UpdateView):
    model = tipo_proyecto
    form_class = form.tipo_proyecto_form
    template_name = 'nomencladores/tipo_proyecto/tipo_proyecto_update_form.html'
    success_url = reverse_lazy('listar_tipo_proyecto')

    @method_decorator(login_required)
    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_tipo_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_tipo_proyecto')

    def post(self, request, *args, **kwargs):
        register_logs(self.request, tipo_proyecto, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Actualización Tipo de proyecto: { self.object.__str__() }', level='info')

        response_data = {
            'result': 'success',
            'title': 'Tipo de proyecto actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class clasificacion_update(LoginRequiredMixin, UpdateView):
    model = clasificacion
    form_class = form.clasificacion_form
    success_url = reverse_lazy("listar_clasificacion")
    template_name = 'nomencladores/clasificacion/clasificacion_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_clasificacion'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_clasificacion')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, clasificacion, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Clasificación de proyectos actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class subclasificacion_update(LoginRequiredMixin, UpdateView):
    model = subclasificacion
    form_class = form.subclasificacion_form
    success_url = reverse_lazy("listar_subclasificacion")
    template_name = 'nomencladores/subclasificacion/subclasificacion_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_clasificacion', 'xavi.change_subclasificacion'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_subclasificacion')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, subclasificacion, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Subclasificación de proyectos actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)
    
class fuente_financiamiento_update(LoginRequiredMixin, UpdateView):
    model = fuente_financiamiento
    form_class = form.fuente_financiamiento_form
    success_url = reverse_lazy("listar_fuente_financiamiento")
    template_name = 'nomencladores/fuente_financiamiento/fuente_financiamiento_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_fuente_financiamiento'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_fuente_financiamiento')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, fuente_financiamiento, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Fuente de financiamiento actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)

class formato_update(LoginRequiredMixin, UpdateView):
    model = formato
    form_class = form.formato_form
    success_url = reverse_lazy("listar_formato")
    template_name = 'nomencladores/formato/formato_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_formato', 'SISGDDO.change_afectaciones', 'perms.xavi.change_entrada_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_formato')
        
    def post(self, request, *args, **kwargs):
        forms = form.formato_form(request.POST)

        if forms.is_valid():
            new_area = forms.save()
            id_area = new_area.pk
            
            register_logs(request, formato, id_area, new_area.__str__(), 2)
            #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Nuevo registro de área: {new_area.__str__()}', level='warning')
            
            response = {
                'result': 'success',
                'title': 'Formato actualizado con éxito'
            }
            return JsonResponse(response)  # Código HTTP 201 Created
        else:
            if forms.errors:
                response = show_errors(forms)
                return JsonResponse(response)  # Código HTTP 400 Bad Request

            return render(self.request, self.template_name, self.contexto)

    # def form_valid(self, form):
    #     response = super().form_valid(form)
    #     register_logs(self.request, formato, self.object.pk, self.object.__str__(), 2)
    #     #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Área: { self.object.__str__() }'), level='info')
    # 
    #     response_data = {
    #         'result': 'success',
    #         'title': 'Formato actualizado con éxito'
    #     }
    #     return JsonResponse(response_data, status=200)

class estado_proyecto_dgca_update(LoginRequiredMixin,UpdateView):
    model = estado_proyecto_dgca
    form_class = form.estado_entradas_proyecto_form
    template_name = 'nomencladores/estado_entrada/estado_entrada_update_form.html'
    success_url = reverse_lazy('listar_estado_entrada')

    @method_decorator(login_required)
    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_entrada_proyecto', 'xavi.change_estado_entradas_proyecto'))
    @method_decorator(csrf_protect)
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_estado_entrada')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, estado_proyecto_dgca, self.object.pk, self.object.__str__(), 2)
        #notify.send(self.request.user, recipient=User.objects.filter(is_staff=True), verb=_(f'Actualización de Estado de proyecto en DGCA: { self.object.__str__() }'), level='info')

        response_data = {
            'result': 'success',
            'title': 'Estado de proyecto en DGCA actualizado con éxito'
        }
        return JsonResponse(response_data, status=200)
class linea_tematica_update(LoginRequiredMixin, UpdateView):
    model = linea_tematica
    form_class = form.linea_tematica_form
    success_url = reverse_lazy("listar_linea_tematica")
    template_name = 'nomencladores/linea_tematica/linea_tematica_update_form.html'

    @method_decorator(user_has_any_permission('xavi.change_proyecto', 'xavi.change_linea_tematica'))
    @method_decorator(csrf_protect)
    @method_decorator(sensitive_post_parameters())
    @method_decorator(handle_exceptions)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def get_success_url(self):
        return reverse_lazy('listar_linea_tematica')

    def form_valid(self, form):
        response = super().form_valid(form)
        register_logs(self.request, linea_tematica, self.object.pk, self.object.__str__(), 2)
        #notify.send(request.user, recipient=User.objects.filter(is_staff=True), verb=f'Actualización Línea temática: { self.object.__str__() }', level='info')

        response_data = {
            'result': 'success',
            'title': 'Línea temática actualizada con éxito'
        }
        return JsonResponse(response_data, status=200)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.add_proyecto', 'xavi.change_proyecto')
@handle_exceptions
def proyecto_update(request, id):
    try:
        objeto = proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist

    tcod = clasificacion.objects.filter(activo = True).order_by('nombre')
    tsubclasificacion = subclasificacion.objects.filter(activo = True, clasificacion = objeto.subclasificacion.clasificacion.id).order_by('nombre')
    # tproy = tipo_proyecto.objects.filter(activo = True)
    # tareas = area.objects.filter(activo = True)
    # tformatos = formato.objects.filter(activo = True)
    # ttrab = Employee.objects.filter(active = True)
    # tlin = linea_tematica.objects.filter(activo = True)
    test = estado_proyecto.objects.filter(activo = True).order_by('nombre')
    # tfue = fuente_financiamiento.objects.filter(activo = True)
    # myformats = objeto.formato.all()

    template_name = 'P01/proyecto/proyecto_update_form.html'
    contexto = {
        'form' : objeto,
        'tsubclasificacion' : tsubclasificacion,
        'tcod' : tcod,
        # 'tareas' : tareas,
        # 'tformatos' : tformatos,
        # 'ttrab' : ttrab,
        # 'tlin' : tlin,
        'test' : test,
        # 'tfue' : tfue,
        # 'myformats' : myformats,
        'previouscode' : objeto.codigo,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.proyecto_form(request.POST, request.FILES)
        
        response = {}

        res = validar_objeto(models.proyecto, ['no'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)
          
        # res = validar_objeto(models.proyecto, ['codigo'], forms)
        # if res['result'] == 'errorField' or res['result'] == 'error':
        #     return JsonResponse(res)
        
        res = validar_objeto(models.proyecto, ['nombre_proyecto'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            res['text'] = ''
            res['error_message'] = ''
            return JsonResponse(res)
            
        res = validar_objeto(models.proyecto, ['codigo'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            res['text'] = ''
            res['error_message'] = ''
            return JsonResponse(res)
        
        # if forms.is_valid():
        with transaction.atomic():
            try:            
                # no = forms['no'].value(),
                # codigo = forms['codigo'].value(),
                # nombre_proyecto = forms['nombre_proyecto'].value(),
                # subclasificacion = subclasificacion.objects.get(pk = forms['subclasificacion'].value()),
                # estado = estado_proyecto.objects.get(nombre__iexact='aprobado'),
                objeto.subclasificacion = subclasificacion.objects.get(pk=forms['subclasificacion'].value())
                objeto.estado = estado_proyecto.objects.get(pk=forms['estado'].value())
                objeto.no = forms['no'].value()
                objeto.codigo = forms['codigo'].value()
                objeto.nombre_proyecto = forms['nombre_proyecto'].value()
                
                # try:
                #     if objeto.registro_aprobacion.fecha_terminacion < datetime.now().date():
                #         est = estado_proyecto.objects.get(activo = True, nombre__iexact='atrasado')
                #         objeto.estado = est
                #         objeto.save()
                # except:
                #     response = {
                #         'result': 'errorField',
                #         'title': 'Error de requisitos previos',
                #         'text': 'Debe existir activo: Estado de proyecto "Atrasado"',
                #         'error_message': ''
                #     }
                #     return JsonResponse(response)  
                        
                objeto.save()
                # objeto.codigo = forms['codigo'].value()
                # objeto.fecha_entrada = forms['fecha_entrada'].value()
                # objeto.tipo = tipo_proyecto.objects.get(pk=forms['tipo'].value())
                # objeto.area = area.objects.get(pk=forms['area'].value())
                # objeto.fuente_financiamiento = fuente_financiamiento.objects.get(pk=forms['fuente_financiamiento'].value())
                # objeto.aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None
                # objeto.fecha_aprobacion = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None
                # objeto.fecha_inicio = forms['fecha_inicio'].value()
                # objeto.fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None
                # objeto.causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None
                # objeto.fecha_terminacion = forms['fecha_terminacion'].value() if forms['fecha_terminacion'].value() else None
                # objeto.fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None
                # objeto.fecha_cierre = forms['fecha_cierre'].value() if forms['fecha_cierre'].value() else None
                # objeto.costo = forms['costo'].value()
                # objeto.observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None
                # objeto.linea_tematica = linea_tematica.objects.get(pk=forms['linea_tematica'].value()) if forms['linea_tematica'].value() else None
                # objeto.activo = forms['activo'].value()      
            except Exception as e:
                print(f'Error al actualizar proyecto: {e}')
                response['result'] = 'error'
                response['title'] = f'No se pudo actualizar el proyecto, error en los datos: {e}'
                return JsonResponse(response) 
        
        # if forms['informe_apertura'].value():
        #     objeto.informe_apertura = forms['informe_apertura'].value()
        # if forms['informe_cierre'].value():
        #     objeto.informe_cierre = forms['informe_cierre'].value()
        
        """hago una lista y para cada formato guardo el elemento,
            la intencion es luego pasarle la lista a proyecto"""
        # objeto.formato.clear()
        # formatos = forms['formato'].value()
        # for f in formatos:
        #     try:
        #         felem = formato.objects.get(pk = f)
        #         objeto.formato.add(felem)
        #     except:
        #         print(f"Error inesperado: {e}")

        # objeto.employee.clear()

        # trabajador_proyecto.objects.create(
        #     employee = Employee.objects.get(pk = forms['employee'].value()),
        #     proyecto = objeto,
        #     rol = Position.objects.get(name__iexact = 'Jefe de proyecto')
        # )

        objeto.save()
        
        register_logs(request, proyecto, objeto.id, str(objeto), 2)

        response['result'] = 'success'
        response['title'] = 'Registro modificado con éxito.'
        return JsonResponse(response)
        # else:
        #     print('\n', 'ERRORES EN EL FORMULARIO', forms.errors, '\n')
        #     if forms.errors:
        #         response = show_errors(forms)
        #         return JsonResponse(response)
        
@login_required
@permission_required('xavi.change_proyecto')
@handle_exceptions
def aprobacion_update(request, id):
    try:
        objeto = proyecto.objects.get(pk = id)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist

    tcod = clasificacion.objects.filter(activo = True).order_by('nombre')
    tproy = tipo_proyecto.objects.filter(activo = True).order_by('nombre')
    tareas = area.objects.filter(activo = True).order_by('nombre')
    tformatos = formato.objects.filter(activo = True).order_by('nombre')
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    tcomerciales = Employee.objects.filter(active = True).order_by('first_name')
    tlin = models.linea_tematica.objects.filter(activo = True).order_by('nombre')
    test = estado_proyecto.objects.filter(activo = True).order_by('nombre')
    tfue = fuente_financiamiento.objects.filter(activo = True).order_by('nombre')
    # tprioridad = models.prioridad.objects.filter(activo = True)
    tcliente = models.cliente.objects.filter(activo = True).order_by('nombre')
    myformats = objeto.formato.all().order_by('nombre')
    myworker = objeto.registro_aprobacion.employee.get(position__name__iexact = 'Jefe de proyecto')
    mycomercial = objeto.registro_aprobacion.employee.get(position__name__iexact = 'Comercial')
    
    mis_fuentes = objeto.registro_aprobacion.financiamiento.all().order_by('nombre')
    
    try:
        fuente_mlc = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'MLC', fuente_financiamiento__in = mis_fuentes, registro = objeto.registro_aprobacion)
    except:
        fuente_mlc = None
    
    try:
        fuente_cup = financiamiento_proyecto.objects.get(activo = True, tipo_moneda__siglas__iexact = 'CUP', fuente_financiamiento__in = mis_fuentes, registro = objeto.registro_aprobacion)
    except:
        fuente_cup = None
    
    template_name = 'P01/proyecto/aprobacion_update_form.html'
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
        'tcliente' : tcliente,
        'tcomerciales' : tcomerciales,
        'myformats' : myformats,
        'myworker' : myworker,
        'mycomercial' : mycomercial,
        'fuente_mlc' : fuente_mlc,
        'fuente_cup' : fuente_cup,
        'previouscode' : get_codigo(),
    }
    
    # tcod = clasificacion.objects.filter(activo = True)
    # tsubclasificacion = subclasificacion.objects.filter(activo = True, clasificacion = objeto.subclasificacion.clasificacion.id)
    # tproy = tipo_proyecto.objects.filter(activo = True)
    # tareas = area.objects.filter(activo = True)
    # tformatos = formato.objects.filter(activo = True)
    # ttrab = Employee.objects.filter(active = True)
    # tlin = linea_tematica.objects.filter(activo = True)
    # test = estado_proyecto.objects.filter(activo = True)
    # tfue = fuente_financiamiento.objects.filter(activo = True)
    # myformats = objeto.formato.all()

    # template_name = 'P01/proyecto/proyecto_update_form.html'
    # contexto = {
    #     'form' : objeto,
    #     'tsubclasificacion' : tsubclasificacion,
    #     'tcod' : tcod,
    #     # 'tareas' : tareas,
    #     # 'tformatos' : tformatos,
    #     # 'ttrab' : ttrab,
    #     # 'tlin' : tlin,
    #     'test' : test,
    #     # 'tfue' : tfue,
    #     # 'myformats' : myformats,
    #     'previouscode' : objeto.codigo,
    # }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        # forms = form.proyecto_form(request.POST)
        registro_form = form.registro_aprobacion_form(request.POST)
        
        response = {}      
        
        if registro_form.is_valid():            
            try:
                with transaction.atomic():                    
                    registro = objeto.registro_aprobacion    
                    
                    registro.cliente = cliente.objects.get(pk = registro_form['cliente'].value())              
                    registro.contrato = registro_form['contrato'].value()                
                    registro.centro_costo = area.objects.get(pk = registro_form['centro_costo'].value())                                        
                    registro.linea_tematica = linea_tematica.objects.get(pk = registro_form['linea_tematica'].value()) if registro_form['linea_tematica'].value() else None
                    registro.fecha_inicio = registro_form['fecha_inicio'].value()
                    registro.fecha_terminacion = registro_form['fecha_terminacion'].value() if registro_form['fecha_terminacion'].value() else None
                    registro.ingreso_mlc = float(registro_form['ingreso_mlc'].value().replace(',', '.')) if registro_form['ingreso_mlc'].value() else None
                    registro.ingreso_cup = float(registro_form['ingreso_cup'].value().replace(',', '.')) if registro_form['ingreso_cup'].value() else None
                    registro.fecha_aprobacion = registro_form['fecha_aprobacion'].value() if registro_form['fecha_aprobacion'].value() else None

                    fecha_terminacion_str = registro_form['fecha_terminacion'].value()
                    fecha_terminacion_obj = datetime.strptime(fecha_terminacion_str, '%Y-%m-%d').date()
                    
                    terminado = False
                    try:
                        if objeto.proyecto_registro_terminacion:
                            terminado = True
                    except:
                        pass
                    
                    # try:
                    #     if fecha_terminacion_obj < datetime.now().date() and terminado == False:
                    #         est = estado_proyecto.objects.get(activo = True, nombre__iexact='atrasado')
                    #         objeto.estado = est
                    #         objeto.save()
                    # except:
                    #     response = {
                    #         'result': 'errorField',
                    #         'title': 'Error de requisitos previos',
                    #         'text': 'Debe existir activo: Estado de proyecto "Atrasado"',
                    #         'error_message': ''
                    #     }
                    #     return JsonResponse(response)  
                    
                    # fuente_financiamiento = fuente_financiamiento.objects.get(pk = forms['fuente_financiamiento'].value()),
                    # no = forms['no'].value(),
                    # codigo = forms['codigo'].value(),
                    # nombre_proyecto = forms['nombre_proyecto'].value(),
                    # subclasificacion = subclasificacion.objects.get(pk = forms['subclasificacion'].value()),
                    # estado = estado_proyecto.objects.get(activo = True, nombre__iexact='En desarrollo'),
                    # fecha_entrada = forms['fecha_entrada'].value(),
                    # tipo = tipo_proyecto.objects.get(pk = forms['tipo'].value()),
                    # aprobacion_consejo = forms['fecha_aprobacion'].value() if forms['fecha_aprobacion'].value() else None,
                    # fecha_interrupcion = forms['fecha_interrupcion'].value() if forms['fecha_interrupcion'].value() else None,
                    # causa_interrupcion = forms['causa_interrupcion'].value() if forms['causa_interrupcion'].value() else None,
                    # fecha_extension = forms['fecha_extension'].value() if forms['fecha_extension'].value() else None,
                    # fecha_cierre = forms['fecha_cierre'].value(),
                    # observacion = forms['observacion'].value().strip() if forms['observacion'].value().strip() else None,
                    # informe_apertura = forms['informe_apertura'].value() if forms['informe_apertura'].value() else None,
                    # informe_cierre = forms['informe_cierre'].value() if forms['informe_cierre'].value() else None,
                    # activo = forms['activo'].value()  
                    
                    registro.save()
                    
                    trab_reg = trabajador_registro.objects.get(registro = registro, rol__name__iexact = 'Jefe de proyecto')
                    trab_reg.employee = Employee.objects.get(pk = registro_form['employee'].value())
                    trab_reg.save()
                    
                    com = trabajador_registro.objects.get(registro = registro, rol__name__iexact = 'Comercial')
                    com.employee = Employee.objects.get(pk = registro_form['comercial'].value())
                    com.save()
                    
                    if registro_form['financista_mlc'].value():
                        mlc = financiamiento_proyecto.objects.get(registro = registro, tipo_moneda__siglas__iexact = 'MLC')
                        mlc.fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_mlc'].value())
                        mlc.valor = float(registro_form['financiamiento_mlc'].value().replace(',', '.'))
                        mlc.save()

                        plan_ingreso_mlc = plan_ingreso_aprobacion.objects.get(registro = registro, tipo_moneda__siglas__iexact = 'MLC')
                        plan_ingreso_mlc.valor = float(registro_form['ingreso_mlc'].value().replace(',', '.'))
                        plan_ingreso_mlc.save()
                    
                    if registro_form['financista_cup'].value():
                        cup = financiamiento_proyecto.objects.get(registro = registro, tipo_moneda__siglas__iexact = 'CUP')
                        cup.fuente_financiamiento = fuente_financiamiento.objects.get(pk = registro_form['financista_cup'].value())
                        cup.valor = float(registro_form['financiamiento_cup'].value().replace(',', '.'))
                        cup.save()

                        plan_ingreso_cup = plan_ingreso_aprobacion.objects.get(registro = registro, tipo_moneda__siglas__iexact = 'CUP')
                        plan_ingreso_cup.valor = float(registro_form['ingreso_cup'].value().replace(',', '.'))
                        plan_ingreso_cup.save()
                    
                    register_logs(request, registro_aprobacion, registro.pk, registro.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Registro de aprobación modificado con éxito'
                    return JsonResponse(response)
            except Exception as e:
                print(f"Error inesperado: {e}")
                response = {
                    'result': 'errorField',
                    'title': 'Error inesperado',
                    'text': 'Vuelva a intentarlo',
                    'error_message': str(e)
                }
                return JsonResponse(response)  
            
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', registro_form.errors, '\n')
            if registro_form.errors:
                response = show_errors(registro_form)
                return JsonResponse(response)
        

@login_required
@user_has_any_permission('xavi.change_proyecto', 'xavi.change_entrada_proyecto')
@handle_exceptions
def entrada_proyecto_update(request, id):
    # el id es una entrada
    objeto = entrada_proyecto.objects.get(pk = id)   
    
    myformats = objeto.formato.all().order_by('nombre')

    proy = objeto.proyecto
    
    lista = entrada_proyecto.objects.filter(activo = True, proyecto = proy).order_by('no')

    # tformatos = formato.objects.filter(activo = True)
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    test = estado_proyecto_dgca.objects.filter(activo = True).exclude(nombre__iexact = 'En revisión').order_by('nombre')

    isService = False
    if proy.subclasificacion.clasificacion.nombre[:3] == 'Servicio':
        isService = True

    template_name = 'P01/entrada_proyecto/entrada_proyecto_update_form.html'
    success_url = reverse('adicionar_entrada_proyecto', kwargs={'id': objeto.proyecto.id})
    
    contexto = {
        'form' : objeto,
        # 'tformatos' : tformatos,
        'ttrab' : ttrab,
        'test' : test,
        'lista' : lista,
        'myformats' : myformats,
        'isService': isService,
        'proy': proy,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.entrada_proyecto_form(request.POST, request.FILES)
        
        # p = proyecto.objects.get(pk = proy.id)
        # e = Employee.objects.get(pk = forms['entregado_por'].value())
                
        # print('\n', 'EMPLEADO', type(e), e, '\n')

        if forms.is_valid():
            with transaction.atomic():
                try:
                    objeto.fecha_entrada = forms['fecha_entrada'].value()
                    objeto.fecha_salida = forms['fecha_salida'].value()
                    objeto.entregado_por = Employee.objects.get(pk = forms['entregado_por'].value())
                    objeto.formato.set(forms['formato'].value())                  
                    objeto.estado = estado_proyecto_dgca.objects.get(pk = forms['estado'].value())
                    if forms.cleaned_data['dictamen']:
                        objeto.dictamen = forms.cleaned_data['dictamen'] if forms.cleaned_data['dictamen'] else None
                    
                    objeto.save()
                    
                    register_logs(request, objeto, objeto.pk, objeto.__str__(), 2)
                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'Entrada de proyecto en DGCA actualizada con éxito'
                    response['text'] = 'Se refrescará la página para actualizar la lista'
                    return JsonResponse(response)
                except Exception as e:
                    print(f"Error inesperado: {e}")
                    response = {}
                    response['result'] = 'errorField'
                    response['title'] = 'Hubo un error'
                    return JsonResponse(response)
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', forms.errors, '\n')
            return render(request, template_name, contexto)

@login_required
@permission_required('xavi.change_sosi')
@handle_exceptions
def sosi_update(request, id):
    # el id es un sosi
    try:
        objeto = sosi.objects.get(pk = id)          
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except Exception as e:
        print(f'Error {e}')

    # ttrab = Employee.objects.filter(active = True).exclude(first_name = request.user.first_name, last_name = request.user.last_name).order_by('first_name')
    ttrab = Employee.objects.filter(active = True).order_by('first_name')
    
    tidiomas = models.idioma.objects.filter(activo = True).order_by('nombre')
    myidiomas = objeto.idioma.all().order_by('nombre')
    
    tautores = models.autor_sosi.objects.filter(activo = True).order_by('nombre')
    myautores = objeto.autor.all().order_by('nombre')

    success_url = reverse_lazy('listar_sosi')
    
    now = timezone.now()

    template_name = 'P01/sosi/sosi_update_form.html'
    success_url = reverse('listar_sosi')

    contexto = {
        'objeto' : objeto,
        'ttrab' : ttrab,
        'tidiomas' : tidiomas,
        'myidiomas' : myidiomas,
        'tautores' : tautores,
        'myautores' : myautores,
        'now' : now
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

    if request.method == "POST":
        forms = form.sosi_form(request.POST, request.FILES)
        
        res = validar_objeto(models.proyecto, ['proyecto'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            res['text'] = ''
            res['error_message'] = ''
            return JsonResponse(res)          
        
        # try:
        #    e =  Employee.objects.get(first_name__iexact = request.user.first_name, last_name__iexact = request.user.last_name)
        # except:
        #     response = {}
        #     response['result'] = 'errorField'
        #     response['title'] = 'El usuario actual debe ser un trabajador'
        #     response['text'] = 'El usuario actual debe tener nombre y apellidos iguales que el trabajador que usa ahora el sistema'
        #     return JsonResponse(response)
        
        res = validar_objeto(models.sosi, ['numero_salva'], forms, objeto)
        if res['result'] == 'errorField' or res['result'] == 'error':
            return JsonResponse(res)
        
        if forms.is_valid():
            with transaction.atomic():
                try:   
                    objeto.numero_salva = forms['numero_salva'].value()
                    # objeto.fecha = datetime.strptime(forms['fecha'].value(), '%d/%m/%Y').date()
                    # objeto.anno = forms['anno'].value() if forms['anno'].value() else None
                    objeto.especialista = Employee.objects.get(pk=forms['especialista'].value())
                    objeto.recibe = Employee.objects.get(pk=forms['recibe'].value())
                    # objeto.autor = area.objects.get(pk=forms['autor'].value())
                    objeto.ubicacion_salva = forms['ubicacion_salva'].value() if forms['ubicacion_salva'].value() else None
                    objeto.observaciones = forms['observaciones'].value() if forms['observaciones'].value() else None

                    objeto.idioma.set(forms['idioma'].value())  
                                          
                    objeto.autor.set(forms['autor'].value())     
                        
                    if len(forms['autor'].value()) >= 5:
                        objeto.colectivo = True
                        objeto.save()   
                                         
                    objeto.save()                    
                    response = {}
                    response['result'] = 'success'
                    response['title'] = 'SOSI guardado con éxito'
                    return JsonResponse(response)                 
                except IntegrityError as e:
                    print(f"Error de integridad en la base de datos: {e}")
                except Exception as e:
                    print(f"Error inesperado: {e}")  
            return HttpResponseRedirect(success_url)  
        else:
            print('\n', 'ERRORES EN EL FORMULARIO', forms.errors, '\n')
            return render(request, template_name, contexto)  # Muestra el formulario con errores si existen

@login_required
@permission_required('xavi.view_sosi')
@handle_exceptions
def detalle_sosi(request, id):
    # el id es un sosi
    objeto = models.sosi.objects.get(pk = id)

    

    template_name = 'P01/sosi/sosi_detail.html'
    success_url = reverse('listar_sosi')

    contexto = {
        'objeto' : objeto,
        # 'ttrab' : ttrab,
    }

    if request.method == "GET":
        return render(request, template_name, contexto)

@login_required
@user_has_any_permission('SISGDDO.change_afectaciones', 'xavi.change_proyecto', 'xavi.change_entrada_proyecto', 'xavi.change_formato')
@handle_exceptions
def listar_formato(request):
    datos = models.formato.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/formato/formato.html', contexto)

@login_required
@user_has_any_permission('xavi.change_entrada_proyecto', 'xavi.change_estado_entradas_proyecto')
@handle_exceptions
def listar_estado_proyecto_dgca(request):
    datos = models.estado_proyecto_dgca.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/estado_entrada/estado_entrada.html', contexto)

@login_required
@user_has_any_permission('xavi.change_objetivo', 'xavi.change_indicador_objetivos', 'xavi.change_estado_indicador_objetivos')
@handle_exceptions
def listar_estado_indicador(request):
    datos = models.estado_indicador_objetivos.objects.filter(activo = True).order_by('nombre')
    contexto = {
        'lista': datos
    }
    return render(request, 'nomencladores/estado_indicador/estado_indicador.html', contexto)

# @login_required
# @permission_required('xavi.change_Position')
# @handle_exceptions
# def listar_rol_trabajador_proyecto(request):
#     datos = models.rol_trabajador_proyecto.objects.filter(activo = True).order_by('-id')
#     contexto = {
#         'lista': datos
#     }
#     return render(request, 'nomencladores/rol_trabajador_proyecto/rol_trabajador_proyecto.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_sosi', 'xavi.view_entrada_proyecto')
@handle_exceptions
def listar_proyecto(request):
    if request.method == 'GET':
        tareas = models.area.objects.filter(activo = True).order_by('nombre')
        tdgca = models.estado_proyecto_dgca.objects.filter(activo = True).order_by('nombre')
        datos = models.proyecto.objects.annotate(num_entradas_activas=Count('entradas', filter=Q(entradas__activo=True))).filter(activo=True).order_by('-id')
        tidiomas = models.idioma.objects.filter(activo = True).order_by('nombre')
        tlineas = models.linea_tematica.objects.filter(activo = True).order_by('nombre')
        contexto = {
            'lista': datos,
            'tareas': tareas,
            'tdgca': tdgca,
            'tipo_fecha': 'proyecto',
            'tidiomas': tidiomas,
            'tlineas': tlineas,
        }

        return render(request, 'P01/proyecto/proyecto.html', contexto)
    
    if request.method == 'POST':
        if request.POST['tipo_filtrado'] == 'fecha_inicio': 
            proyectos_filtrados = models.proyecto.objects.filter(
                activo=True
            ).filter(
                Q(registro_aprobacion__activo=True, 
                registro_aprobacion__fecha_inicio__gte=request.POST['fecha_inicio'], 
                registro_aprobacion__fecha_inicio__lte=request.POST['fecha_fin'])
            ).distinct()
        elif request.POST['tipo_filtrado'] == 'fecha_terminacion':
            proyectos_filtrados = models.proyecto.objects.filter(
                activo=True
            ).filter(
                Q(registro_aprobacion__activo=True, 
                registro_aprobacion__fecha_terminacion__gte=request.POST['fecha_inicio'], 
                registro_aprobacion__fecha_terminacion__lte=request.POST['fecha_fin'])
            ).distinct()
        else:
            proyectos_filtrados = models.proyecto.objects.none()

        # Impresión para depuración
        print(f'Filtrado inicial: {proyectos_filtrados.count()} proyectos')

        arr = request.POST['arr']
        id_list = [int(id_str) for id_str in arr.split(',')]

        # Anotación, prefetch_related y filtrado final
        queryset = proyectos_filtrados.annotate(
            num_entradas_activas=Count('entradas', filter=Q(entradas__activo=True))
        ).filter(
            id__in = id_list
        ).prefetch_related('formato').distinct().order_by('-id')

        # Impresión para depuración
        print(f'Filtrado final: {queryset.count()} proyectos')
        print('QUERYSET', queryset)

        # Convertir el queryset a una lista de diccionarios, asegurando eliminación de duplicados y añadiendo los formatos
        proyectos_list = queryset.values(
            'id', 'nombre_proyecto', 'codigo', 'registro_aprobacion__centro_costo__nombre', 
            'registro_aprobacion__employee', 'estado__nombre', 'sosi', 'num_entradas_activas'
        ).distinct()

        # Convertir a una lista y agregar formatos manualmente
        unique_proyectos = {}
        for proyecto in proyectos_list:
            unique_proyectos[proyecto['id']] = proyecto
            # Agregar formatos al proyecto
            proyecto_obj = queryset.get(id=proyecto['id'])
            unique_proyectos[proyecto['id']]['formatos'] = list(proyecto_obj.formato.values('id', 'nombre'))

        # Convertir el diccionario de vuelta a una lista
        lista_queryset = list(unique_proyectos.values())

        # Impresión para depuración
        print('LISTAR QUERYSET', lista_queryset)
        
        response = {
            'result': 'success',
            'lista': lista_queryset,
        }
        
        return JsonResponse(response)

@login_required
@permission_required('xavi.add_proyecto')
@handle_exceptions
def cargar_subclasificacion(request):
    if request.method == 'POST':
        subclasificaciones = subclasificacion.objects.filter(activo = True, clasificacion = request.POST['id_clasificacion']).order_by('nombre')
        subclasificaciones_list = list(subclasificaciones.values('id', 'siglas', 'nombre'))
        
        return JsonResponse({
            'result': 'success',
            'tsubclasificacion': subclasificaciones_list,
        })

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_entrada_proyecto')
@handle_exceptions
def listar_entrada_proyecto(request):
    datos = models.entradas_proyecto.objects.filter(activo = True).order_by('-id')
    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/entrada_proyecto/entrada_proyecto.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_sosi')
@handle_exceptions
def listar_sosi(request):
    datos = models.sosi.objects.filter(activo = True).order_by('-id')

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/sosi/sosi.html', contexto)

@login_required
@user_has_any_permission('xavi.view_objetivo', 'xavi.view_indicador_objetivos')
@handle_exceptions
def listar_indicador_objetivo(request):
    try:
        datos = models.indicador_objetivos.objects.annotate(num_acciones_activas=Count('accion', filter=Q(accion__activo=True))).filter(activo=True).order_by('nombre')
        contexto = {
            'lista': datos,
        }
        return render(request, 'P01/indicador_objetivo/indicador_objetivo.html', contexto)
    except models.indicador_objetivos.DoesNotExist:
        print('No se encontraron indicadores de objetivo activos.')
        raise ObjectDoesNotExist
    except Exception as e:
        print(f'Error inesperado: {str(e)}')
        raise

@login_required
@user_has_any_permission('xavi.view_objetivo', 'xavi.view_indicador_objetivos', 'xavi.view_accion_indicador_objetivo')
@handle_exceptions
def listar_accion_indicador_objetivo(request):
    datos = models.accion_indicador_objetivo.objects.filter(activo = True).order_by('nombre')

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/accion_indicador_objetivo/accion_indicador_objetivo.html', contexto)

@login_required
@permission_required('xavi.view_objetivo')
@handle_exceptions
def listar_objetivo(request):
    # datos = models.objetivo.objects.filter(activo = True).order_by('-id')
    datos = models.objetivo.objects.annotate(num_indicadores_activos=Count('objetivos', filter=Q(objetivos__activo=True))).filter(activo=True).order_by('nombre')
    
    # datos = models.indicador_objetivos.objects.annotate(num_acciones_activas=Count('accion', filter=Q(accion__activo=True))).filter(activo=True).order_by('-id')
    # for d in datos:
    #     hoy = datetime.strptime(datetime.now().strftime('%Y-%m-%d'), "%Y-%m-%d")
    #     anno_obj = datetime.strptime(d.fecha_definicion.strftime('%Y-%m-%d'), "%Y-%m-%d")
    #     if hoy.year > anno_obj.year:
    #         print('Incumplido')

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/objetivo/objetivo.html', contexto)

@login_required
@permission_required('xavi.view_premio')
@handle_exceptions
def listar_premio(request, arr=None, orden=None):
    if orden == 'x':
        orden = None

    if request.method == 'POST':
        arr = request.POST['arr']
        id_list = [int(id_str) for id_str in arr.split(',')]

        if request.POST['fecha_inicio'] and request.POST['fecha_fin']:
            fecha_inicio = datetime.strptime(request.POST['fecha_inicio'], '%Y-%m-%d')
            fecha_fin = datetime.strptime(request.POST['fecha_fin'], '%Y-%m-%d')
            queryset = premio.objects.filter(id__in=id_list, fecha__gte=fecha_inicio, fecha__lte=fecha_fin)

        # if orden:
        #     if orden.lower() == 'asc':
        #         queryset = queryset.order_by('fecha')
        #     elif orden.lower() == 'desc':
        #         queryset = queryset.order_by('-fecha')

        lista_queryset = list(queryset.values('id', 'nombre', 'entidad__name', 'fecha'))
        
        response = {
            'result': 'success',
            'lista': lista_queryset,
            # 'orden': orden
        }
        
        return JsonResponse(response)
    
    if request.method == 'GET':
        datos = models.premio.objects.filter(activo=True).order_by('nombre')

        if orden:
            if orden.lower() == 'asc':
                datos = datos.order_by('fecha')
            elif orden.lower() == 'desc':
                datos = datos.order_by('-fecha')

        contexto = {
            'lista': datos,
        }

        if orden:
            contexto['orden'] = orden

        return render(request, 'P01/premio/premio.html', contexto)

@login_required
@user_has_any_permission('xavi.view_proyecto', 'xavi.view_premio', 'xavi.view_acuerdo', 'xavi.view_objetivo', 'xavi.view_sosi', 'xavi.view_entrada_proyecto')
@csrf_protect
def exportar(request):
    if request.method == "POST":
        now = timezone.now()
        owner = request.user if request.user.is_authenticated else None
        contexto = {}
        datos_traidos = {}
        
        try:
            body_unicode = request.body.decode('utf-8')
            data = json.loads(body_unicode)
            objs = [int(ob) for ob in data.get('arr', [])]

            # if data['tabla'] == 'proyecto':
            #     models = proyecto.objects.filter(pk__in=objs).order_by('id')
            #     template_name = 'reportes/tabla.html'
            if data['tabla'] == 'premio':
                models = premio.objects.filter(pk__in=objs).order_by('id')                
                template_name = 'reportes/reporte_premio.html'
            elif data['tabla'] == 'acuerdo':
                models = acuerdo.objects.filter(pk__in=objs).order_by('id')
                template_name = 'reportes/reporte_acuerdo.html'
            elif data['tabla'] == 'objetivo':
                models = objetivo.objects.filter(pk__in=objs).order_by('id')
                template_name = 'reportes/reporte_objetivo.html'
            elif data['tabla'] == 'estadistico_proyecto':
                sosis = proyecto.objects.filter(pk__in=objs)
                
                if data.get('periodo'):
                    inicio = None
                    fin = None
                    anno = datetime.strptime(data.get('anno'), '%Y').strftime('%Y')
                    if data.get('periodo') == 'periodo_anno':
                        inicio = datetime.strptime(anno + '-01-01', '%Y-%m-%d')
                        fin = datetime.strptime(anno + '-12-31', '%Y-%m-%d')
                    if data.get('periodo') == 'periodo_trimestre_i':
                        inicio = datetime.strptime(anno + '-01-01', '%Y-%m-%d')
                        fin = datetime.strptime(anno + '-03-31', '%Y-%m-%d')
                    if data.get('periodo') == 'periodo_trimestre_ii':
                        inicio = datetime.strptime(anno + '-04-01', '%Y-%m-%d')
                        fin = datetime.strptime(anno + '-06-30', '%Y-%m-%d')
                    if data.get('periodo') == 'periodo_trimestre_iii':
                        inicio = datetime.strptime(anno + '-07-01', '%Y-%m-%d')
                        fin = datetime.strptime(anno + '-09-30', '%Y-%m-%d')
                    if data.get('periodo') == 'periodo_trimestre_iv':
                        inicio = datetime.strptime(anno + '-10-01', '%Y-%m-%d')
                        fin = datetime.strptime(anno + '-12-31', '%Y-%m-%d')
                    if data.get('periodo') == 'periodo_semestre_i':
                        inicio = datetime.strptime(anno + '-01-01', '%Y-%m-%d')
                        fin = datetime.strptime(anno + '-06-30', '%Y-%m-%d')
                    if data.get('periodo') == 'periodo_semestre_ii':
                        inicio = datetime.strptime(anno + '-07-01', '%Y-%m-%d')
                        fin = datetime.strptime(anno + '-12-31', '%Y-%m-%d')
                        
                    if data.get('periodo') != '---':
                        sosis = sosis.filter(
                            registro_aprobacion__fecha_inicio__gte=inicio,
                            registro_aprobacion__fecha_inicio__lte=fin
                        )
                    
                if data.get('atrasado') == True:
                    sosis = sosis.filter(estado__nombre__iexact = 'Atrasado')
                else:
                    sosis = sosis.exclude(estado__nombre__iexact = 'Atrasado')
                    
                if data.get('fecha_inicio') and data.get('fecha_fin'):
                    sosis = sosis.filter(registro_aprobacion__fecha_inicio__gte = data.get('fecha_inicio'), registro_aprobacion__fecha_inicio__lte = data.get('fecha_fin'))
                    
                if sosis.exists():
                    jefe_proyecto_subquery = trabajador_registro.objects.filter(
                        registro=OuterRef('pk'),
                        rol__name__iexact="Jefe de proyecto"
                    ).annotate(
                        nombre_completo=Concat('employee__first_name', Value(' '), 'employee__last_name')
                    ).values('nombre_completo')[:1]

                    comercial_subquery = trabajador_registro.objects.filter(
                        registro=OuterRef('pk'),
                        rol__name__iexact="Comercial"
                    ).annotate(
                        nombre_completo=Concat('employee__first_name', Value(' '), 'employee__last_name')
                    ).values('nombre_completo')[:1]

                    sosis = proyecto.objects.annotate(
                        jefe_proyecto=Subquery(jefe_proyecto_subquery, output_field=CharField()),
                        comercial=Subquery(comercial_subquery, output_field=CharField())
                    )
                    
                    models = sosis.order_by('id')
                    
                    if len(models) == 0:
                        return HttpResponse("Nada que exportar", status=410)
                    
                    template_name = 'reportes/reporte_estadistico_proyecto.html'
                else:
                    return HttpResponse("Nada que exportar", status=410)
            elif data['tabla'] == 'reporte_sosi':
                sosi_list = []
                proyectos = proyecto.objects.filter(pk__in=objs)
                
                if data.get('linea_tematica'):
                    linea = linea_tematica.objects.get(pk=data.get('linea_tematica'))
                    proyectos = proyectos.filter(registro_aprobacion__linea_tematica = linea)
                    
                print('\n------->proyectos', proyectos, '\n')
                
                for p in proyectos:
                    # pr = proyecto.objects.get(pk=p)
                    try:
                        if p.sosi:
                            sosi_list.append(p.sosi.pk)
                    except:
                        print('\n------->NO HAY NADA', p, '\n')
                        pass     
                    
                print('\n------->sosi_list', sosi_list, '\n')
                
                sosis = sosi.objects.filter(pk__in=sosi_list, activo = True)           
                    
                
                if data.get('anno'):
                    print('\n\n\nENtre 1')
                    inicio_anno = datetime(int(data.get('anno')), 1, 1)
                    fin_anno = datetime(int(data.get('anno')), 12, 31)
                    sosis = sosis.filter(fecha__range = [inicio_anno, fin_anno])
                    
                if data.get('fecha_entrada') and data.get('fecha_cierre'):
                    print('\n\n\nENtre 2')
                    sosis = sosis.filter(fecha__gte = data.get('fecha_entrada'), fecha__lte = data.get('fecha_cierre'))
                    
                if data.get('idiomas'):
                    print('\n\n\nENtre 3')
                    sosis = sosis.filter(idioma__pk__in=data.get('idiomas'))               
                
                print('\n------->sosis', sosis, '\n')
                    
                models = sosis.order_by('id')
                
                if len(models) == 0:
                    return HttpResponse("Nada que exportar", status=410)
                else:
                    print('\n------->models', models, '\n')
                    template_name = 'reportes/reporte_sosi.html'
                    
            elif data['tabla'] == 'dgca_proyecto':
                sosis = proyecto.objects.filter(pk__in=objs)
                entradas = entrada_proyecto.objects.filter(proyecto__in=sosis)
                if data.get('tipo_fecha'):
                    # print('\n----->>> TIPO DE FECHA', data.get('tipo_fecha'),'\n')
                    if data.get('fecha_inicio') or data.get('fecha_fin'):
                        if data.get('tipo_fecha') == 'fecha_entrada_dgca': 
                            if data.get('fecha_inicio'):
                                fecha_inicio = datetime.strptime(data.get('fecha_inicio'), '%Y-%m-%d').strftime('%Y-%m-%d')
                                entradas = entradas.filter(fecha_entrada__gte = fecha_inicio)
                                # print('\n----->>>entradas', entradas,'\n')
                            if data.get('fecha_fin'):
                                fecha_fin = datetime.strptime(data.get('fecha_fin'), '%Y-%m-%d').strftime('%Y-%m-%d')
                                entradas = entradas.filter(fecha_entrada__lte = fecha_fin)
                                # print('\n----->>>entradas', entradas,'\n')
                        if data.get('tipo_fecha') == 'fecha_salida_dgca': 
                            if data.get('fecha_inicio'):
                                fecha_inicio = datetime.strptime(data.get('fecha_inicio'), '%Y-%m-%d').strftime('%Y-%m-%d')
                                entradas = entradas.filter(fecha_salida__gte = fecha_inicio)
                                # print('\n----->>>entradas', entradas,'\n')
                            if data.get('fecha_fin'):
                                fecha_fin = datetime.strptime(data.get('fecha_fin'), '%Y-%m-%d').strftime('%Y-%m-%d')
                                entradas = entradas.filter(fecha_salida__lte = fecha_fin)
                                # print('\n----->>>entradas', entradas,'\n')
                    else:
                        anno = datetime.strptime(data.get('anno'), '%Y').strftime('%Y')
                        if data.get('tipo_fecha') == 'fecha_entrada_dgca': 
                            entradas = entradas.filter(fecha_entrada__year = anno)
                                # print('\n----->>>entradas', entradas,'\n')
                        if data.get('tipo_fecha') == 'fecha_salida_dgca':
                            entradas = entradas.filter(fecha_salida__year = anno)
                            # print('\n----->>>entradas', entradas,'\n')
                if data.get('estado'):
                    estado = estado_proyecto_dgca.objects.get(pk=data.get('estado'))
                    # print('\n----->>>estado estado estado', estado,'\n')
                    entradas = entradas.filter(estado = estado)

                print('\n----->>>   entradas\n', entradas,'\n')
                models = entradas.order_by('id')
                
                if len(models) == 0:
                    return HttpResponse("Nada que exportar", status=410)
                
                template_name = 'reportes/reporte_dgca_proyecto.html'
                
            elif data['tabla'] == 'gestion_proyecto':
                models = None
                sosis = proyecto.objects.filter(pk__in=objs)
                entradas = entrada_proyecto.objects.filter(proyecto__in=sosis)
                
                # Obtenemos todas las áreas incluyendo un conteo de las entradas de proyecto relacionadas
                areas_con_entradas = area.objects.annotate(
                    num_entradas=Count('registro_aprobacion__proyecto__entradas')
                ).order_by('nombre')
                
                print('\n----->>>   areas_con_entradas\n', areas_con_entradas[0].num_entradas, '\n')
                
                estados_con_entradas = estado_proyecto_dgca.objects.annotate(
                    num_entradas=Count('entrada_proyecto')
                ).order_by('nombre')
                
                entradas_hasta_fecha = entrada_proyecto.objects.filter(fecha_entrada__lte=now)
                
                entradas_por_mes_mayor = entradas_hasta_fecha.annotate(
                    mes=ExtractMonth('fecha_entrada')
                ).values('mes').annotate(
                    num_entradas=Count('id')
                ).order_by('-num_entradas')[:2]
                
                meses_seleccionados = [mes['mes'] for mes in entradas_por_mes_mayor]
                
                entradas_por_mes_menor = entradas_hasta_fecha.exclude(
                    fecha_entrada__month__in=meses_seleccionados
                ).annotate(
                    mes=ExtractMonth('fecha_entrada')
                ).values('mes').annotate(
                    num_entradas=Count('id')
                ).order_by('num_entradas')[:2]
                
                anios_con_proyectos_atrasados = proyecto.objects.filter(
                    activo = True,
                    proyecto_registro_terminacion__isnull=True,
                    registro_aprobacion__fecha_terminacion__lt=now 
                ).annotate(
                    anio=ExtractYear('registro_aprobacion__fecha_terminacion')
                ).values('anio').annotate(
                    num_proyectos_atrasados=Count('id')
                ).order_by('-num_proyectos_atrasados')

                tres_anios_con_mas_atrasos = list(islice(anios_con_proyectos_atrasados, 3))

                for anio in tres_anios_con_mas_atrasos:
                    print(f"\nAño: {anio['anio']}, Proyectos atrasados: {anio['num_proyectos_atrasados']}")
                    
                proyectos_con_mayor_atraso = proyecto.objects.annotate(
                    # Calcula la diferencia en días entre la fecha actual y la fecha de terminación del registro de aprobación
                    atraso_dias=ExpressionWrapper(
                        Now() - F('registro_aprobacion__fecha_terminacion'),
                        fields.DurationField()  # Movido como un argumento posicional
                    )
                ).filter(
                    # Filtra aquellos proyectos que no tienen un registro de terminación asociado
                    proyecto_registro_terminacion__isnull=True,
                    # Asegúrate de incluir solo proyectos que ya deberían haber terminado
                    registro_aprobacion__fecha_terminacion__lt=Now(),
                    # Excluye los proyectos que tienen registro de interrupción asociado pero no tienen registro de reinicio
                    # ~Q(registro_interrupcion__isnull=False, registro_aprobacion__registro_reinicio__isnull=True)
                ).exclude(
                    # Excluye los proyectos que tienen registro de interrupción asociado pero no tienen registro de reinicio
                    proyecto_registro_interrupcion__isnull=False,
                    registro_aprobacion__registro_reinicio__isnull=True
                ).order_by(
                    # Ordena los proyectos por el mayor atraso primero
                    '-atraso_dias'
                )[:10]  # Limita los resultados a los primeros 10

                # Obtener la matriz que cruza Área con Estado de Proyecto y cuenta la cantidad de proyectos en cada combinación
                matriz_area_estado = proyecto.objects.values('registro_aprobacion__centro_costo__nombre', 'estado__nombre').annotate(num_proyectos=Count('id'))
                
                # Obtener los estados de proyectos en DGCA
                estados_proyecto_dgca = estado_proyecto_dgca.objects.filter(activo=True)

                # Crear una matriz para almacenar los resultados
                matriz = []

                # Iterar sobre los meses y los estados de proyecto
                for mes_idx, nombre_mes in enumerate(meses_del_anno, start=1):
                    fila = {'Mes': nombre_mes}
                    
                    # Obtener la fecha límite para este mes
                    fecha_limite_mes = datetime.now().replace(month=mes_idx, day=1)
                    
                    # Filtrar las entradas de proyecto DGCA para este mes
                    entradas_mes = entrada_proyecto.objects.filter(
                        fecha_entrada__month=mes_idx,
                        fecha_entrada__year=datetime.now().year,  # Filtrar por el año actual
                        proyecto__activo=True
                    )
                    
                    # Obtener el estado más reciente para cada proyecto
                    estados_proyectos = {}
                    for ent in entradas_mes:
                        # print('\n----->>>   entrada_proyecto\n', ent.proyecto, '\n')
                        #
                        #
                        #
                        #
                        #
                        #
                        
                        proyecto_id = ent.proyecto.id
                        estado_actual = ent.estado.nombre
                        if proyecto_id not in estados_proyectos or ent.fecha_entrada > estados_proyectos[proyecto_id]['fecha']:
                            estados_proyectos[proyecto_id] = {'estado': estado_actual, 'fecha': ent.fecha_entrada}

                                
                    # Contar la cantidad de proyectos en cada estado para este mes
                    for estado in estados_proyecto_dgca:
                        cantidad_proyectos = sum(1 for proyecto_id, estado_proyecto in estados_proyectos.items() if estado_proyecto['estado'] == estado.nombre)
                        fila[estado.nombre] = cantidad_proyectos
                    
                    # Sumar la cantidad total de proyectos para este mes
                    valores_sin_mes = {clave: valor for clave, valor in fila.items() if clave != 'Mes'}
                    fila['Total'] = sum(valores_sin_mes.values())

                    # Agregar la fila a la matriz
                    matriz.append(fila)

                # Agregar la fila de totales
                total_proyectos_por_estado = {
                    estado.nombre: sum(1 for proyecto_id, estado_proyecto in estados_proyectos.items() if estado_proyecto['estado'] == estado.nombre)
                    for estado in estados_proyecto_dgca
                }
                total_proyectos_por_estado['Mes'] = 'Total'
                matriz.append(total_proyectos_por_estado)

                # La matriz ahora contiene la información deseada
                for fila in matriz:
                    print(fila)
                    
                template_name = 'reportes/reporte_estadistico_proyecto.html'
                    
                # print('\n----->>>   estados_con_entradas\n', estados_con_entradas[1].num_entradas, '\n')
                # print('\n----->>>   estados_con_entradas_mayor\n', entradas_por_mes_mayor, '\n')
                # print('\n----->>>   estados_con_entradas_menor\n', entradas_por_mes_menor, '\n')
                # print('\n----->>>   proyectos_con_mayor_atraso\n', proyectos_con_mayor_atraso[0].atraso_dias, '\n')
                
                # Imprimir la matriz
                # for item in matriz_area_estado:
                #     print(f"Área: {item['registro_aprobacion__centro_costo__nombre']}, Estado: {item['estado__nombre']}, Cantidad de Proyectos: {item['num_proyectos']}")
                
                
                # Imprimimos el resultado
                # for ar in areas_con_entradas:
                #     print(f"{ar.nombre}: {ar.num_entradas} entradas")
                
            else:
                return HttpResponse("Tabla no válida", status=400)
        except json.JSONDecodeError:
            return HttpResponse("Error al decodificar el JSON", status=400)

        logos = get_logos()
        logo1 = logos.get('logo1')
        logo2 = logos.get('logo2')
        
        try:
            if not hasattr(logo1, 'url') or not hasattr(logo2, 'url'):
                print('\n', 'Error accediendo a los logos', '\n')
                return HttpResponse('Error accediendo a los logos', status=404)

            url_logo1 = logo1.url
            url_logo2 = logo2.url
        except Exception as e:
            print(f'\nEsta es la excepción: {e}\n')
            return HttpResponse('Error accediendo a los logos, excepción', status=404)
        
        if logo1 and logo1.url and logo2 and logo2.url:
            titulo_archivo = data.get('titulo') + f'_{now}'
            
            contexto_general = {
                'titulo': data.get('titulo'),
                'titulo_archivo': titulo_archivo,
                'models': models,
                'owner': owner,
                'date': now,
            }
            
            contexto = {**contexto_general}

            try:
                html_string = render_to_string(template_name, contexto)
                uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')

                # Renderiza el HTML y establece el tamaño del documento PDF
                main_doc = HTML(string=html_string, base_url=request.build_absolute_uri()).render(
                    stylesheets=[
                        CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                        CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                        CSS(string=".pdf-page { height: 100vh; }"),  # Establece el alto de la página al 100% de la altura de la ventana gráfica (viewport height)
                        CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                         ],
                )

                # Guarda el documento PDF
                main_doc.write_pdf(
                    target=os.path.join(uri_tmp, 'Lista de Trabajadores.pdf'),
                    zoom=0.75,  # Puedes ajustar el zoom según sea necesario
                )

                # Retorna el PDF generado como una respuesta HTTP
                fs = FileSystemStorage(uri_tmp)
                with fs.open('Lista de Trabajadores.pdf') as pdf:
                    response = HttpResponse(pdf, content_type='application/pdf')
                    response['Content-Disposition'] = 'attachment; filename="Lista de Trabajadores.pdf"'
                    return response
            except Exception as e:
                print(e)

    return HttpResponse("Método no permitido", status=405)

@login_required
@permission_required('xavi.view_acuerdo')
@handle_exceptions
def listar_acuerdo(request):
    datos = models.acuerdo.objects.filter(activo = True).order_by('nombre')

    contexto = {
        'lista': datos,
    }

    return render(request, 'P01/acuerdo/acuerdo.html', contexto)

@login_required
@permission_required('xavi.add_objetivo')
@handle_exceptions
def evaluar_objetivo(request):
    response = {}
    
    try:
        o = request.POST['objetivo'] if request.POST['objetivo'] else None
        objeto = models.objetivo.objects.get(pk = o)
    except ObjectDoesNotExist:
        raise ObjectDoesNotExist
    except:
        raise
    
    periodo = None
    try:
        p = request.POST['periodo'] if request.POST['periodo'] else None
        periodo = models.periodo.objects.get(pk = p)
    except ObjectDoesNotExist:
        response['result'] = 'error'
        response['title'] = 'Por favor, seleccione periodo'
        response['field'] = 'periodo'
        return JsonResponse(response)
    except:
        raise
    
    evaluacion = None
    try:
        e = request.POST['evaluacion'] if request.POST['evaluacion'] else None
        evaluacion = models.evaluacion.objects.get(pk = e)
    except ObjectDoesNotExist:
        response['result'] = 'error'
        response['title'] = 'Por favor, seleccione evaluación'
        response['field'] = 'evaluacion'
        print('response', response)
        return JsonResponse(response)
    except:
        raise
    
    try:
        with transaction.atomic():
            try:
                trimestral = evaluacion_trimestral.objects.get(
                    activo = True, 
                    periodo = periodo,
                    objetivo = objeto,
                )
                trimestral.evaluacion = evaluacion
                trimestral.save()
                register_logs(request, trimestral, trimestral.pk, str(trimestral), 2)    
                response['title'] = 'Evaluación modificada con éxito'
            except:
                trimestral = evaluacion_trimestral.objects.create(
                    periodo = periodo,
                    objetivo = objeto,
                    evaluacion = evaluacion
                )     
                trimestral.save()
                register_logs(request, trimestral, trimestral.pk, str(trimestral), 1)        
                response['title'] = 'Evaluación registrada con éxito'

            response['result'] = 'success'
            # response['title'] = 'Objetivo estratégico actualizado con éxito'
            return JsonResponse(response)
    except IntegrityError as e:
        messages.error(request, "Error de integridad en la base de datos.")
        response['result'] = 'error'
        response['title'] = 'Ha ocurrido un error'
        return JsonResponse(response)
    except Exception as e:
        print(f"Error durante la creación: {e}")
        response['result'] = 'error'
        response['title'] = 'Ha ocurrido un error'
        return JsonResponse(response)