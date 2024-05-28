from SISGDDO.models import Afectaciones
# from SISGDDO.models import trabajador
from SISGDDO import models
from django.forms import widgets
from django import forms
from django.forms import ModelForm
from tempus_dominus.widgets import DatePicker
from datetime import datetime
from django.http import HttpResponse
from apps.base.models import Employee, Position, Process, Procedure, Entity

#form #nomenclador #Javier
from xavi.models import area, fuente_financiamiento, tipo_proyecto, objetivo, indicador_objetivos
from xavi.models import linea_tematica, estado_proyecto, formato, premio
from xavi.models import acuerdo, estado_acuerdo, prioridad, tipo_extension, etapa_proyecto
from xavi.models import sosi, clasificacion, evaluacion, accion_indicador_objetivo, periodo, estado_proyecto_dgca, subclasificacion
from SISGDDO.models import incidencia, auditoria_externa, auditoria_interna, ActividadPlan, Contacto

from django.core.exceptions import ValidationError
    
class Contacto_form(ModelForm):

    nombre=forms.CharField(label="Afec"),
    relacionados = forms.ModelMultipleChoiceField(queryset = Employee.objects.all().exclude(active=False), required = True, label = 'Participantes', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = Contacto
        fields = "nombre","relacionados"
        widgets = {
        'nombre':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        }
class DateInput(forms.DateInput):
    input_type = 'date'

#moduloJavier
class area_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )

    class Meta:
        model = area
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

class tipo_extension_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = tipo_extension
        exclude = ["activo"]
        # fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

class evaluacion_form(ModelForm):
    valor = forms.IntegerField(
        required=False,
#        initial=len(periodo.objects.filter(activo=True))+1,
        widget=forms.NumberInput(attrs={
            'min': 1,
            'max': 100,
            'step': 1,
            'class': 'form-control',
            'placeholder': 'Introduzca el valor',
        })
    )
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )
    

    class Meta:
        model = evaluacion
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
            "valor": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':5}),
        }
        
class prioridad_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )

    class Meta:
        model = prioridad
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }
        
class periodo_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )
    orden = forms.IntegerField(
        required=False,
#        initial=len(periodo.objects.filter(activo=True))+1,
        widget=forms.NumberInput(attrs={
            'min': 1,
            'max': 100,
            'step': 1,
            'class': 'form-control',
            'placeholder': 'Introduzca el orden',
        })
    )

    class Meta:
        model = periodo
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }
        
#moduloHermes
#moduloAfectaciones
class PasoAfectacionModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(PasoAfectacionModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
    required_css_class = 'required'
    
    responsable= forms.ModelChoiceField(label="Responsable de Afectación",queryset=area.objects.all().exclude(activo=False).order_by('nombre')) ,
    formato= forms.ModelChoiceField(label="Promotor de Afectación",queryset=formato.objects.all().exclude(activo=False)) ,
    observacionesactual= forms.CharField(label="ObserA",max_length=250),
    
    class Meta:
        model = Afectaciones
        fields = "observacionesactual" ,"responsable", "formato"
        widgets = {
        'formato': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'responsable': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'observacionesactual': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'})
        }

class AfectationModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AfectationModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha_recepcion'].widget.format = ('%d-%m-%Y')
    required_css_class = 'required'
    
    numero= forms.IntegerField(required=True,label="Numero"),
    afectacion=forms.CharField(label="Afec"),
    fecha_recepcion= forms.DateField(label="Fecha R",initial=datetime.now),
    formato= forms.ModelChoiceField(label="Promotor de Afectación",queryset=formato.objects.all().exclude(activo=False)) ,
    propuesto= forms.ModelChoiceField(label="Promotor de Afectación",queryset=area.objects.all().exclude(activo=False).order_by('nombre')) ,
    responsable= forms.ModelChoiceField(label="Responsable de Afectación",queryset=area.objects.all().exclude(activo=False).order_by('nombre')) ,
    observacionesactual= forms.CharField(label="ObserA",max_length=250),
    estado= forms.ChoiceField(label="Estado"),
    
    class Meta:
        model = Afectaciones
        fields = "afectacion","fecha_recepcion","observacionesactual","propuesto","responsable","formato"
        widgets = {
        'afectacion':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'formato': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'propuesto': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'responsable': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'fecha_recepcion': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'mesplaneado': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
        'observacionesactual': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'observacionesfutura': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'})
        }

class ModifyAfectationModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ModifyAfectationModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
    required_css_class = 'required'
    
    numero= forms.IntegerField(required=True,label="Numero"),
    afectacion=forms.CharField(label="Afec"),
    fecha_recepcion= forms.DateField(label="Fecha R",initial=datetime.now),
    propuesto= forms.ModelChoiceField(label="Promotor de Afectación",queryset=area.objects.all().exclude(activo=False).order_by('nombre')) ,
    responsable= forms.ModelChoiceField(label="Responsable de Afectación",queryset=area.objects.all().exclude(activo=False).order_by('nombre')) ,
    mesplaneado= forms.DateField(label="Mes Planeado",initial=datetime.now),
    observacionesactual= forms.CharField(label="ObserA",max_length=250),
    observacion= forms.CharField(label="ObserB",max_length=250),
    estado= forms.ChoiceField(label="Estado"),
    
    class Meta:
        model = Afectaciones
        fields = "estado","observacionesactual","observacion"
        widgets = {
       'afectacion':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'fecha_recepcion': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'estado': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'},choices= Afectaciones.estado_choices_modificar),
        'observacionesactual': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'observacion': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
      
        }
    
class CompModAfectationModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(CompModAfectationModelForm, self).__init__(*args, **kwargs)
        self.fields['fecha_recepcion'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_cierre'].widget.format = ('%Y-%m-%d')
        # Setting the format of the date field to the format that the datepicker uses.
    required_css_class = 'required'
    
    
    numero= forms.IntegerField(required=True,label="Numero"),
    afectacion=forms.CharField(label="Afec"),
    fecha_recepcion = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    fecha_cierre = forms.DateField(label="Fecha C", widget=forms.DateInput(format='%Y-%m-%d')),
    formato= forms.ModelChoiceField(label="Promotor de Afectación",queryset=formato.objects.all().exclude(activo=False)) ,
    propuesto= forms.ModelChoiceField(label="Promotor de Afectación",queryset=area.objects.all().exclude(activo=False).order_by('nombre')) ,
    responsable= forms.ModelChoiceField(label="Responsable de Afectación",queryset=area.objects.all().exclude(activo=False).order_by('nombre')) ,
    observacionesactual= forms.CharField(label="ObserA",max_length=250),
    estado= forms.ChoiceField(label="Estado"),
    
    class Meta:
        model = Afectaciones
        fields = "afectacion","fecha_recepcion","propuesto","responsable", "estado","observacionesactual","formato","fecha_cierre"
        widgets = {
       'afectacion':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
       'formato': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'propuesto': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'responsable': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
       'fecha_recepcion': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
        'fecha_cierre': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
        'estado': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'},choices= Afectaciones.estado_choices_modificar),
        'observacionesactual': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        }


#moduloIncidencia
class IncidenciaModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(IncidenciaModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha_recepcion'].widget.format = ('%Y-%m-%d')
        

    required_css_class = 'required'

    titulo = forms.CharField(label="Titulo"),
    fecha_recepcion = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    fecha_cierre = forms.DateField(label="Fecha C", widget=forms.DateInput(format='%Y-%m-%d')),
    proceso = forms.ModelChoiceField(label="Promotor de Incidencia", queryset=Process.objects.all().exclude(active=False).order_by('abbreviation')),
    trabajador = forms.ModelChoiceField(label="Promotor de Incidencia", queryset=area.objects.all().exclude(activo=False).order_by('nombre')),
    ejecutante = forms.ModelChoiceField(label="Ejecutor", queryset=area.objects.all().exclude(activo=False)),
    hora = forms.TimeField(label="Fecha C", initial=datetime.now),
    descripcion = forms.CharField(label="descrip", max_length=500),
    respuesta = forms.CharField(label="Seguimiento", max_length=500),
    estado = forms.ChoiceField(label="Estado", choices=incidencia.estado_choices_modificar),
    
    class Meta:
        model = incidencia
        fields = "titulo","fecha_recepcion","hora","trabajador","ejecutante","proceso","descripcion"
        widgets = {
            'titulo': widgets.Textarea(attrs={'rows': 1 , 'class': 'form-control'}),
            'fecha_recepcion': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            'hora': widgets.TimeInput(attrs={'type': 'time', 'class': 'form-control', 'append': 'fa fa-clock', 'icon_toggle': True}),
            'trabajador': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
            'estado': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}, choices=incidencia.estado_choices_modificar),
            'proceso': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
            'ejecutante': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
            'fecha_cierre': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            'descripcion': widgets.Textarea(attrs={'rows': 5, 'class': 'form-control'}),
            'respuesta': widgets.Textarea(attrs={'rows': 3, 'class': 'form-control'})
        }


class ModifiyIncidenciaModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ModifiyIncidenciaModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
    required_css_class = 'required'
    
    titulo=forms.CharField(label="Titulo"),
    fecha_recepcion= forms.DateField(label="Fecha R",initial=datetime.now),
    fecha_cierre= forms.DateField(label="Fecha C",initial=datetime.now),
    trabajador= forms.ModelChoiceField(label="Promotor de Incidencia",queryset=Employee.objects.all().exclude(active=False).order_by('first_name')) ,

    procesos= forms.ModelChoiceField(label="Responsable de Afectación",queryset=Process.objects.all().exclude(active=False).order_by('abbreviation')) ,
    descripcion= forms.CharField(label="descrip",max_length=250),
    respuesta= forms.CharField(label="respuesta",max_length=250),
    estado= forms.ChoiceField(label="Estado"),
    
    class Meta:
        model = incidencia
        fields = "estado","respuesta"
        widgets = {
        'titulo':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'fecha_recepcion': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'fecha_cierre': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
        'estado': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}, choices=incidencia.estado_choices_modificar),
        'descripcion': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'respuesta': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'})
        }

class CompModIncidenciaModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(CompModIncidenciaModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha_recepcion'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_cierre'].widget.format = ('%Y-%m-%d')

    required_css_class = 'required'

    titulo = forms.CharField(label="Titulo"),
    fecha_recepcion = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    fecha_cierre = forms.DateField(label="Fecha C", widget=forms.DateInput(format='%Y-%m-%d')),
    proceso = forms.ModelChoiceField(label="Promotor de Incidencia", queryset=Process.objects.all().exclude(active=False).order_by('abbreviation')),
    trabajador = forms.ModelChoiceField(label="Promotor de Incidencia", queryset=area.objects.all().exclude(activo=False).order_by('nombre')),
    ejecutante = forms.ModelChoiceField(label="Ejecutor", queryset=area.objects.all().exclude(activo=False)),
    hora = forms.TimeField(label="Fecha C", initial=datetime.now),
    descripcion = forms.CharField(label="descrip", max_length=250),
    respuesta = forms.CharField(label="respuesta", max_length=250),
    estado = forms.ChoiceField(label="Estado", choices=incidencia.estado_choices_modificar),

    class Meta:
        model = incidencia
        fields = ["titulo", "fecha_recepcion", "hora", "descripcion", "trabajador", "ejecutante",
                  "proceso", "estado", "respuesta", "fecha_cierre"]
        widgets = {
            'titulo': widgets.Textarea(attrs={'rows': 1, 'class': 'form-control'}),
            'fecha_recepcion': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            'fecha_cierre': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            'hora': widgets.TimeInput(attrs={'type': 'time', 'class': 'form-control', 'append': 'fa fa-clock', 'icon_toggle': True}),
            'trabajador': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
            'estado': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}, choices=incidencia.estado_choices_modificar),
            'proceso': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
            'ejecutante': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
            'fecha_cierre': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            'descripcion': widgets.Textarea(attrs={'rows': 3, 'class': 'form-control'}),
            'respuesta': widgets.Textarea(attrs={'rows': 3, 'class': 'form-control'})
        }

#modulo Planes

class ActividadesModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ActividadesModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['dia'].widget.format = ('%Y-%m-%d')
    required_css_class = 'required'
    
    descripcion=forms.CharField(label="Afec"),
    dia = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    hora= forms.TimeField(label="Fecha C",initial=datetime.now),
    preside = forms.ModelMultipleChoiceField(queryset = Employee.objects.all().exclude(active=False).order_by('first_name'), required = True, label = 'Preside', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    participantes = forms.ModelMultipleChoiceField(queryset = Employee.objects.all().exclude(active=False).order_by('first_name'), required = True, label = 'Participantes', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    contacto = forms.ModelMultipleChoiceField(queryset = Contacto.objects.all().exclude(activo=False), required = False, label = 'Contactos', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    lugar= forms.ChoiceField(label="Estado"),
    contcheck=forms.BooleanField(label="Usar Contactos",required=False),
    otro= forms.CharField(label="Afec"),
    
    class Meta:
        model = ActividadPlan
        fields = "descripcion","dia","preside","hora","participantes","lugar","otro","contcheck","contacto"
        widgets = {
        'descripcion':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'dia': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'hora': widgets.TimeInput(attrs={'type': 'time', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
        'lugar': widgets.Select(attrs={'type':'select', 'class': 'form-control'},choices= ActividadPlan.estado_choices_crear),
        'contcheck': widgets.CheckboxInput(attrs={'class': 'form-control'}),
        'otro': widgets.Textarea(attrs={'rows':2, 'class': 'form-control'}),
        }

class PlanModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(PlanModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['dia'].widget.format = ('%Y-%m-%d')
    required_css_class = 'required'
    
    descripcion=forms.CharField(label="Afec"),
    dia= forms.DateField(label="Fecha R",initial=datetime.now),
    hora= forms.TimeField(label="Fecha C",initial=datetime.now),
    preside = forms.ModelMultipleChoiceField(queryset = Employee.objects.all().exclude(active=False).order_by('first_name'), required = True, label = 'Preside', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    participantes = forms.ModelMultipleChoiceField(queryset = Employee.objects.all().exclude(active=False).order_by('first_name'), required = True, label = 'Participantes', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    lugar= forms.ChoiceField(label="Estado"),
    otro= forms.CharField(label="Afec"),
    
    class Meta:
        model = ActividadPlan
        fields = "descripcion","dia","preside","hora","participantes","lugar"
        widgets = {
        'descripcion':widgets.Textarea(attrs={'rows':1}),
        'dia': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'hora': widgets.TimeInput(attrs={'type': 'time', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
        'lugar': widgets.Select(attrs={'type':'select'},choices= ActividadPlan.estado_choices_crear),
        'otro': widgets.Textarea(attrs={'rows':3}),
        }

#modulo Auditoria Inerna
class AuditoriaInternaModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AuditoriaInternaModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fechainicio'].widget.format = ('%Y-%m-%d')
        self.fields['fechafin'].widget.format = ('%Y-%m-%d')
    required_css_class = 'required'
    
    titulo=forms.CharField(label="Titulo"),
    fechainicio = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    fechafin = forms.DateField(label="Fecha C", widget=forms.DateInput(format='%Y-%m-%d')),
    proceso= forms.ModelChoiceField(label="Responsable de Afectación",queryset=Process.objects.all().exclude(active=False).order_by('abbreviation')) ,
    equipo = forms.ModelMultipleChoiceField(queryset = Employee.objects.all().exclude(active=False).order_by('first_name'), required = True, label = 'Equipo que audita', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    objetivos= forms.CharField(label="descrip",max_length=250,required=False),
    alcance= forms.CharField(label="respuesta",max_length=250,required=False),
    criterios= forms.CharField(label="descrip",max_length=250,required=False),
    resultados = forms.ChoiceField(label="Estado", choices=incidencia.estado_choices_modificar),
    observaciones= forms.CharField(label="respuesta",max_length=250,required=False),
    informe= forms.FileField(allow_empty_file=True, help_text='Selecionar Informe de Auditoría'),
    
    
    class Meta:
        model = auditoria_interna
        fields = "titulo","proceso","fechainicio","fechafin","equipo","resultados","objetivos","alcance","criterios","observaciones","informe"
        widgets = {
        'titulo':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'proceso': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'resultados': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'},choices= auditoria_interna.resultados_choices_crear),
        'fechainicio': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'fechafin': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        
        'objetivos': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'alcance': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'criterios': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'observaciones': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        
        }

class ModAuditoriaInternaModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ModAuditoriaInternaModelForm, self).__init__(*args, **kwargs)
        self.fields['fechainicio'].widget.format = ('%Y-%m-%d')
        self.fields['fechafin'].widget.format = ('%Y-%m-%d')
        # Setting the format of the date field to the format that the datepicker uses.
    
    required_css_class = 'required'
    
    titulo=forms.CharField(label="Titulo"),

    titulo=forms.CharField(label="Titulo"),
    fechainicio = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    fechafin = forms.DateField(label="Fecha C", widget=forms.DateInput(format='%Y-%m-%d')),
    proceso= forms.ModelChoiceField(label="Responsable de Afectación",queryset=Process.objects.all().exclude(active=False).order_by('abbreviation')) ,
    equipo = forms.ModelMultipleChoiceField(queryset = Employee.objects.all().exclude(active=False).order_by('first_name'), required = True, label = 'Equipo que audita', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    objetivos= forms.CharField(label="descrip",max_length=250,required=False),
    alcance= forms.CharField(label="respuesta",max_length=250,required=False),
    criterios= forms.CharField(label="descrip",max_length=250,required=False),
    resultados= forms.ChoiceField(label="Estado"),
    observaciones= forms.CharField(label="respuesta",max_length=250,required=False),
    informe= forms.FileField(allow_empty_file=True, help_text='Selecionar Informe de Auditoría'),
    
    
    class Meta:
        model = auditoria_interna
        fields = "titulo","proceso","fechainicio","fechafin","equipo","resultados","objetivos","alcance","criterios","observaciones","informe"
        widgets = {
         'titulo':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'fechainicio': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'fechafin': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'proceso': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'resultados': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'},choices= auditoria_interna.resultados_choices_crear),
        'objetivos': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'alcance': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'criterios': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        'observaciones': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        
        }

class AuditoriaExternaModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AuditoriaExternaModelForm, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fechainicio'].widget.format = ('%Y-%m-%d')
        self.fields['fechafin'].widget.format = ('%Y-%m-%d')
    required_css_class = 'required'
    
    titulo=forms.CharField(label="Titulo"),
    fechainicio = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    fechafin = forms.DateField(label="Fecha C", widget=forms.DateInput(format='%Y-%m-%d')),
    registro = forms.IntegerField(
        initial=auditoria_externa.number,
        widget=forms.NumberInput(attrs={
            'step': 1,
            'class': 'form-control',
        })
    )
    entidad= forms.ModelChoiceField(label="Entidad que se audita",queryset=Entity.objects.all().exclude(active=False).order_by('name')) ,
    proceso = forms.ModelMultipleChoiceField(queryset = Process.objects.all().exclude(active=False).order_by('abbreviation'), required = True, label = 'Proceso que se audita', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    resultados= forms.ChoiceField(label="Estado"),
    observaciones= forms.CharField(label="respuesta",max_length=250),
    informe= forms.FileField(allow_empty_file=True, help_text='Selecionar Informe de Auditoría', required=False),
    plan_medidas= forms.FileField(allow_empty_file=True, help_text='Selecionar Plan de Medidas de Auditoría', required=False),
    
    
    class Meta:
        model = auditoria_externa
        fields =  "registro","titulo","entidad","resultados","fechainicio","fechafin","proceso","observaciones","informe","plan_medidas"
        widgets = {
        'entidad': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'resultados': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'},choices= auditoria_externa.resultados_choices_crear),
        'titulo':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'fechainicio': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'fechafin': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'observaciones': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        
        }

class ModAuditoriaExternaModelForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(ModAuditoriaExternaModelForm, self).__init__(*args, **kwargs)
        self.fields['fechainicio'].widget.format = ('%Y-%m-%d')
        self.fields['fechafin'].widget.format = ('%Y-%m-%d')
        # Setting the format of the date field to the format that the datepicker uses.
    
    required_css_class = 'required'
    
    titulo=forms.CharField(label="Titulo"),
    fechainicio = forms.DateField(label="Fecha R", widget=forms.DateInput(format='%Y-%m-%d')),
    fechafin = forms.DateField(label="Fecha C", widget=forms.DateInput(format='%Y-%m-%d')),
    entidad= forms.ModelChoiceField(label="Entidad que se audita",queryset=Entity.objects.all().exclude(active=False).order_by('name')) ,
    resultados= forms.ChoiceField(label="Estado"),
    observaciones= forms.CharField(label="respuesta",max_length=250),
    informe= forms.FileField(allow_empty_file=True, help_text='Selecionar Informe de Auditoría'),
    plan_medidas= forms.FileField(allow_empty_file=True, help_text='Selecionar Plan de Medidas de Auditoría'),
    proceso = forms.ModelMultipleChoiceField(queryset = Process.objects.all().exclude(active=False).order_by('abbreviation'), required = True, label = 'Proceso que se audita ', widget = widgets.SelectMultiple(attrs = {'class': 'form-control texto select2','autocomplete': 'on'}))
    
    class Meta:
        model = auditoria_externa
        fields = "titulo","entidad","resultados","fechainicio","fechafin","proceso","observaciones","informe","plan_medidas"
        widgets = {
        'entidad': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}),
        'resultados': widgets.Select(attrs={'class': 'form-control texto select2', 'autocomplete': 'on'},choices= auditoria_externa.resultados_choices_crear),
        'titulo':widgets.Textarea(attrs={'rows':1, 'class': 'form-control'}),
        'fechainicio': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        'fechafin': widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}), 
        
        'observaciones': widgets.Textarea(attrs={'rows':3, 'class': 'form-control'}),
        
        }

#moduloJavier
class linea_tematica_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    # anno = forms.CharField(label = 'Año', widget = widgets.DateInput(
    #     attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el año'}))

    class Meta:
        model = linea_tematica
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
            # "anno": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class estado_acuerdo_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 125, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = estado_acuerdo
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class estado_proyecto_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = estado_proyecto
        fields = "__all__"
        exclude=['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class tipo_proyecto_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = tipo_proyecto
        fields = "__all__"
        exclude=['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class clasificacion_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = clasificacion
        exclude = ["activo"]
        # fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }
        
#moduloJavier
class fuente_financiamiento_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = fuente_financiamiento
        fields = "__all__"
        exclude=['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class formato_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = formato
        fields = "__all__"
        exclude=['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class rol_proyecto_proyecto_form(ModelForm):
    nombre = forms.ModelChoiceField(queryset = None, label = 'Nombre del rol*', empty_label = 'Escriba el nombre', widget = widgets.Select(
        attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}))

    class Meta:
        model = Position
        fields = "__all__"
        exclude=['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
# class estado_entradas_proyecto_form(ModelForm):
#     nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
#         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

#     class Meta:
#         model = estado_entradas_proyecto
#         fields = "__all__"
#         exclude=['activo']
#         widgets = {
#             "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
#             "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
#         }

# #moduloJavier
# class entidad_form(ModelForm):
#     nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
#         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

#     class Meta:
#         model = entidad
#         fields = "__all__"
#         exclude=['activo']
#         widgets = {
#             "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
#             "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
#         }

# #moduloJavier
# class estado_indicador_objetivos_form(ModelForm):
#     nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
#         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

#     class Meta:
#         model = estado_indicador_objetivos
#         fields = "__all__"
#         exclude=['activo']
#         widgets = {
#             "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
#             "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
#         }

#moduloJavier
# class rol_trabajador_proyecto_form(ModelForm):
#     nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
#         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

#     class Meta:
#         model = rol_trabajador_proyecto
#         fields = "__all__"
#         widgets = {
#             "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
#             "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
#         }

#moduloJavier
class Position_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = Position
        fields = "__all__"
        exclude=['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }
   
#parece que lo que est'a luego del init no tiene que pasarse en Meta
#moduloJavier
# class proyecto_form(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(proyecto_form, self).__init__(*args, **kwargs)
#         # Setting the format of the date field to the format that the datepicker uses.
#         self.fields['fecha_entrada'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_aprobacion'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_inicio'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_interrupcion'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_terminacion'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_extension'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_cierre'].widget.format = ('%Y-%m-%d')
    
#     fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     nombre_proyecto = forms.CharField(label = 'Nombre*', max_length = 250, required = True, 
#                 widget = widgets.Textarea(
#             attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
#     formato = forms.ModelMultipleChoiceField(queryset = formato.objects.filter(activo = True), required = False, label = 'Formato', 
#                 widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     clasificacion = forms.ModelChoiceField(queryset = clasificacion.objects.filter(activo = True), required = True, label = 'Tipo de código*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     tipo = forms.ModelChoiceField(queryset = tipo_proyecto.objects.filter(activo = True), required = True, label = 'Tipo de proyecto*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     area = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = 'Área*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     employee = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Jefe de proyecto'), required = True, label = 'Jefe de proyecto*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     # especialista_calidad = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Especialista de calidad'), required = False, label = 'Especialista de Calidad*',
#     #             empty_label='Escriba y seleccione...',
#     #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     # disennador = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Diseñador'), required = False, label = 'Diseñador*',
#     #             empty_label='Escriba y seleccione...',
#     #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     fuente_financiamiento = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Fuente de financiamiento*', 
#             empty_label='Escriba y seleccione...',
#             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     aprobacion_consejo = forms.CharField(label = 'Aprobación del Consejo Editorial', max_length = 25, required = False,
#                 widget = widgets.TextInput(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el acuerdo'}))
#     fecha_aprobacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de aprobación", required = False,
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_interrupcion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de interrupción",
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
#     causa_interrupcion = forms.CharField(label = 'Causa(s) de la interrupción', max_length = 250, required = False, 
#                 widget = widgets.Textarea(
#             attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las causas de la interrupción'}))
#     fecha_terminacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de terminación", required = False,
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_extension = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de extensión",  required = False,
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_cierre = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de cierre*",
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     costo = forms.FloatField(required = True, label = 'Costo (CUP)*',
#                 widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca el costo'}))
#     observacion = forms.CharField(required = False, label = 'Observación', max_length = 250, widget = widgets.Textarea(
#             attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
#     informe_apertura = forms.FileField(label = 'Informe apertura', required = False)
#     informe_cierre = forms.FileField(label = 'Informe cierre', required = False, widget = forms.ClearableFileInput(attrs = {'multiple': False}))
#     linea_tematica = forms.ModelChoiceField(queryset = linea_tematica.objects.filter(activo = True), label = 'Línea temática', empty_label='Escriba y seleccione...', required = False, widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     estado = forms.ModelChoiceField(queryset = estado_proyecto.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
#             widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))

#     #documento que me dijo dayana que tenia que ser subido con la aprobacion de paginas web y diseño
    
    
#     class Meta:
#         # importante! obtener el ultimo "no", no el ultimo "id"

#         model = proyecto
#         def get_no_proyecto():
#             try:
#                 ultimo = proyecto.objects.last()

#                 if ultimo is None:
#                     no_proyecto = 1
#                 else:
#                     try:
#                         no_proyecto = int(ultimo.no) + 1
#                     except ValueError:
#                         raise ValidationError("Error: El campo 'no' del último proyecto o proyecto debe ser un número.")
                
#                 return no_proyecto
#             except Exception as e:
#                 print(f"Error obteniendo el último proyecto: {e}")
#                 raise

#         def get_codigo() -> str:
#             try:
#                 ultimo = proyecto.objects.last()
#                 # cod = 00
#                 try:
#                     codigo_viejo = ultimo.__getattribute__('codigo')
#                     try:
#                         int(ultimo.codigo[-1])
#                     except:
#                         raise Exception("Error: El código del último proyecto o proyecto debe terminar en un número.")
#                     abrev, cod = codigo_viejo[:3], codigo_viejo[3:]
#                 except:
#                     pass
#                 anno_actual = datetime.now().strftime("%Y")
#                 # anno_actual = 2023
#                 existe = proyecto.objects.filter(activo = True, fecha_entrada__year__gte = anno_actual)
#                 if (len(existe) == 0 or ultimo is None):
#                     abrev = 'DES'
#                     dig_anno = str(anno_actual)[-2:]
#                     cod = dig_anno + '01'
#                 else:
#                     cod = str(int(cod) + 1)
#                 return (abrev + cod)
#             except:
#                 pass

#         fields = "__all__"
#         widgets = {
#                 "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
#                 "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
#                     'value' : get_no_proyecto()}),
#                 "codigo": widgets.TextInput(attrs={'class': ' form-control', 'value' : get_codigo(),
#                     'placeholder': f'Ej. Código correspondiente {get_codigo()}'}),
#         }
        
#parece que lo que est'a luego del init no tiene que pasarse en Meta
#moduloJavier
# class proyecto_form(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(proyecto_form, self).__init__(*args, **kwargs)
#         # Setting the format of the date field to the format that the datepicker uses.
#         self.fields['fecha_entrada'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_aprobacion'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_inicio'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_interrupcion'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_terminacion'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_extension'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_cierre'].widget.format = ('%Y-%m-%d')
    
#     fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     nombre_proyecto = forms.CharField(label = 'Nombre*', max_length = 250, required = True, 
#                 widget = widgets.Textarea(
#             attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
#     formato = forms.ModelMultipleChoiceField(queryset = formato.objects.filter(activo = True), required = False, label = 'Formato', 
#                 widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     clasificacion = forms.ModelChoiceField(queryset = clasificacion.objects.filter(activo = True), required = True, label = 'Tipo de código*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     tipo = forms.ModelChoiceField(queryset = tipo_proyecto.objects.filter(activo = True), required = True, label = 'Tipo de proyecto*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     area = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = 'Área*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     employee = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Jefe de proyecto'), required = True, label = 'Jefe de proyecto*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     especialista_calidad = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Especialista de calidad'), required = False, label = 'Especialista de Calidad*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     disennador = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Diseñador'), required = False, label = 'Diseñador*',
#                 empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     fuente_financiamiento = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Fuente de financiamiento*', 
#             empty_label='Escriba y seleccione...',
#             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     aprobacion_consejo = forms.CharField(label = 'Aprobación del Consejo Editorial', max_length = 25, required = False,
#                 widget = widgets.TextInput(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el acuerdo'}))
#     fecha_aprobacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de aprobación", required = False,
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_interrupcion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de interrupción",
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
#     causa_interrupcion = forms.CharField(label = 'Causa(s) de la interrupción', max_length = 250, required = False, 
#                 widget = widgets.Textarea(
#             attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las causas de la interrupción'}))
#     fecha_terminacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de terminación", required = False,
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_extension = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de extensión",  required = False,
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_cierre = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de cierre*",
#                 widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     costo = forms.FloatField(required = True, label = 'Costo (CUP)*',
#                 widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca el costo'}))
#     observacion = forms.CharField(required = False, label = 'Observación', max_length = 250, widget = widgets.Textarea(
#             attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
#     informe_apertura = forms.FileField(label = 'Informe apertura', required = False)
#     informe_cierre = forms.FileField(label = 'Informe cierre', required = False, widget = forms.ClearableFileInput(attrs = {'multiple': False}))
#     linea_tematica = forms.ModelChoiceField(queryset = linea_tematica.objects.filter(activo = True), label = 'Línea temática', empty_label='Escriba y seleccione...', required = False, widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     estado = forms.ModelChoiceField(queryset = estado_proyecto.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...',
#                 widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
#             widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))

#     #documento que me dijo dayana que tenia que ser subido con la aprobacion de paginas web y diseño
    
    
#     class Meta:
#         # importante! obtener el ultimo "no", no el ultimo "id"

#         # def get_no_proyecto():
#         #     try:
#         #         print('\n', 'ENTREEEEE', '\n')
#         #         ultimo = models.proyecto.objects.last()

#         #         if ultimo is None:
#         #             no_proyecto = 1
#         #         else:
#         #             try:
#         #                 no_proyecto = int(ultimo.no) + 1
#         #             except ValueError:
#         #                 raise ValidationError("Error: El campo 'no' del último proyecto o proyecto debe ser un número.")
                
#         #         return no_proyecto
#         #     except Exception as e:
#         #         print(f"Error: {e}")
#         #         return None

#         # def get_codigo() -> str:
#         #     try:
#         #         ultimo = proyecto.objects.last()
#         #         # cod = 00
#         #         try:
#         #             codigo_viejo = ultimo.__getattribute__('codigo')
#         #             try:
#         #                 int(ultimo.codigo[-1])
#         #             except:
#         #                 raise Exception("Error: El código del último proyecto o proyecto debe terminar en un número.")
#         #             abrev, cod = codigo_viejo[:3], codigo_viejo[3:]
#         #         except:
#         #             pass
#         #         anno_actual = datetime.now().strftime("%Y")
#         #         # anno_actual = 2023
#         #         existe = proyecto.objects.filter(activo = True, fecha_entrada__year__gte = anno_actual)
#         #         if (len(existe) == 0 or ultimo is None):
#         #             abrev = 'DES'
#         #             dig_anno = str(anno_actual)[-2:]
#         #             cod = dig_anno + '01'
#         #         else:
#         #             cod = str(int(cod) + 1)
#         #         return (abrev + cod)
#         #     except:
#         #         pass

#         model = proyecto
#         fields = "__all__"
#         widgets = {
#                 "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
#                 # "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
#                 #     'value' : get_no_proyecto()}),
#                 # "codigo": widgets.TextInput(attrs={'class': ' form-control', 'value' : get_codigo(),
#                 #     'placeholder': f'Ej. Código correspondiente {get_codigo()}'}),
#         }

#parece que lo que est'a luego del init no tiene que pasarse en Meta
#moduloJavier
class premio_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(premio_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha'].widget.format = ('%Y-%m-%d')

    fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    descripcion = forms.CharField(required = False, label = 'Descripción', max_length = 500, widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la descripción'}))
    entidad = forms.ModelChoiceField(queryset = Entity.objects.filter(active = True), required = True, label = 'Entidad*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    archivo = forms.FileField(label = 'Archivo*')    
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))    
    
    class Meta:
        model = premio
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
# class acuerdo_form(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(acuerdo_form, self).__init__(*args, **kwargs)
#         # Setting the format of the date field to the format that the datepicker uses.
#         self.fields['fecha'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_limite'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_cumplimiento'].widget.format = ('%Y-%m-%d')

#     # numero = forms.CharField(max_length=6, label="Número de acuerdo*", required=False)
#     nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
#                 attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
#     fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_limite = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha límite', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_cumplimiento = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha de cumplimiento', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     employee = forms.ModelMultipleChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Responsable(s)*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     observaciones = forms.CharField(required = False, label = 'Observaciones', max_length = 250, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
#     estado = forms.ModelChoiceField(queryset = estado_acuerdo.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
#             widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'})) 
    
#     class Meta:
#         def get_no_acuerdo():
#             try:
#                 ultimo = acuerdo.objects.last()
#                 if ultimo is None:
#                     no_proyecto = 1
#                 else:
#                     try:
#                         int(ultimo.numero)
#                     except:
#                         return Exception("Error: No se ha podido obtener el último acuerdo.")
#                     no_proyecto = int(ultimo.__getattribute__('numero')) + 1
#                 return no_proyecto
#             except:
#                 return HttpResponse("Error en el servidor", status = 500)

#         model = acuerdo
#         fields = "__all__"
#         widgets = {
#                 "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
#                 "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
#                     'value' : get_no_acuerdo()}),
#         }
#         labels = {
#             'employee': 'trabajador',
#         }

# #moduloJavier
# class objetivo_form(ModelForm):    
#     def __init__(self, *args, **kwargs):
#         super(objetivo_form, self).__init__(*args, **kwargs)
#         # Setting the format of the date field to the format that the datepicker uses.
#         self.fields['fecha_definicion'].widget.format = ('%Y-%m-%d')

#     nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
#                 attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
#     fecha_definicion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de definición*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
#     indicador = forms.ModelMultipleChoiceField(queryset = indicador_objetivos.objects.filter(activo = True), required = True, label = 'Indicadores*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'})) 
#     activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
#             widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
#     # evaluacion = forms.ModelChoiceField(queryset = evaluacion.objects.filter(activo = True), required = True, label = 'Evaluación*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    
#     class Meta:
#         model = objetivo
        
#         def get_no_objetivo():
#             try:
#                 ultimo = objetivo.objects.last()

#                 if ultimo is None:
#                     no_objetivo = 1
#                 else:
#                     try:
#                         no_objetivo = int(ultimo.no) + 1
#                     except ValueError:
#                         raise ValidationError("Error: El campo 'no' del último objetivo o proyecto debe ser un número.")
                
#                 return no_objetivo
#             except Exception as e:
#                 print(f"Error obteniendo el último objetivo: {e}")
#                 raise
            
#         fields = "__all__"
#         widgets = {
#                 "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
#                 "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
#                     'value' : get_no_objetivo()}),
#         }

#moduloJavier
# class entrada_proyecto_form(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(entrada_proyecto_form, self).__init__(*args, **kwargs)
#         # Setting the format of the date field to the format that the datepicker uses.
#         self.fields['fecha_entrada'].widget.format = ('%Y-%m-%d')
#         self.fields['fecha_salida'].widget.format = ('%Y-%m-%d')

#     fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     fecha_salida = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de salida*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
#     entregado_por = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Entregado por*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     formato = forms.ModelMultipleChoiceField(queryset = formato.objects.filter(activo = True), required = True, label = 'Formato*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     proyecto = forms.ModelChoiceField(queryset = proyecto.objects.filter(activo = True), required = True, label = 'Proyecto*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     dictamen = forms.FileField(label = 'Dictamen técnico', required = False)
#     estado = forms.ModelChoiceField(queryset = estado_proyecto.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
#             widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
#     class Meta:
#         model = entrada_proyecto
#         fields = "__all__"
#         widgets = {
#                 "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
#         }

#moduloJavier
class sosi_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(sosi_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha'].widget.format = ('%Y-%m-%d')

    proyecto = forms.CharField(widget=forms.HiddenInput())
    numero_salva = forms.CharField(label = 'Número de salva*', max_length = 10, required = True, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el número de salva'}))
    
    # fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha = forms.DateField(initial=datetime.now().strftime("%Y-%m-%d"), required=True, label='Fecha de entrada*', input_formats=["%d/%m/%Y"], widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}))
    anno = forms.CharField(label = 'Año', max_length = 4, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el año'}))
    especialista = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Entregado por*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    autor = forms.CharField(label = 'Autor', max_length = 50, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el autor'}))
    ubicacion_salva = forms.CharField(label = 'Ubicación de la salva', max_length = 10, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la ubicación de la salva'}))
    observaciones = forms.CharField(label = 'Observaciones*', max_length = 150, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las observaciones'}))
    archivo = forms.FileField(label = 'Archivo', required = True)
        
    class Meta:
        model = sosi
        fields = "__all__"
        exclude=['activo']
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
#
# CAMBIAR EL NOMBRE A OBJETIVO DE TRABAJO
#
# class indicador_objetivo_form(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(indicador_objetivo_form, self).__init__(*args, **kwargs)
#         # Setting the format of the date field to the format that the datepicker uses.

#     nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
#                 attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
#     # evaluacion = forms.FloatField(required = True, label = 'Evaluación*', widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la evaluación'}))
#     objetivo = forms.ModelChoiceField(queryset = objetivo.objects.filter(activo = True), required = True, label = 'Objetivo*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     # estado = forms.ModelChoiceField(queryset = estado_indicador_objetivos.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     accion = forms.ModelMultipleChoiceField(queryset = accion_indicador_objetivo.objects.filter(activo = True), required = True, label = 'Acción*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
#             widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
#     class Meta:
#         model = indicador_objetivos
#         fields = "__all__"
#         exclude = ['activo']
#         widgets = {
#                 "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
#                 "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
#                     'value' : get_ultimo(indicador_objetivos)}),
#         }

#moduloJavier
class accion_indicador_objetivo_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(accion_indicador_objetivo_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
    
    nombre = forms.CharField(
        label = 'Nombre*', 
        max_length = 150, 
        required = True, 
        widget = widgets.Textarea(
                    attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}
                ),
    )
    descripcion = forms.CharField(
        label = 'Descripción*', 
        max_length = 500, 
        required = False, 
        widget = widgets.Textarea(
                    attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la descripción'}
                ),
    )
    # codigo = forms.CharField(label = 'Código*', max_length = 25, required = True, widget = widgets.Textarea(
    #             attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el código'}))
    # evaluacion = forms.FloatField(required = True, label = 'Evaluación*', widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la evaluación'}))
    # indicador = forms.ModelChoiceField(queryset = indicador_objetivos.objects.filter(activo = True), required = True, label = 'Indicador de objetivo*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    area = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = 'Área responsable*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
    #         widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
    class Meta:
        model = accion_indicador_objetivo
        fields = "__all__"
        
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
class indicador_objetivo_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(indicador_objetivo_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.

    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
                attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    # evaluacion = forms.FloatField(required = True, label = 'Evaluación*', widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la evaluación'}))
    objetivo = forms.ModelChoiceField(queryset = objetivo.objects.filter(activo = True), required = False, label = 'Objetivo', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # estado = forms.ModelChoiceField(queryset = estado_indicador_objetivos.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    accion = forms.ModelMultipleChoiceField(queryset = accion_indicador_objetivo.objects.filter(activo = True), required = False, label = 'Acción*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
    class Meta:
        model = indicador_objetivos
        verbose_name = 'Objetivo de trabajo'
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
# class accion_indicador_objetivo_form(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(accion_indicador_objetivo_form, self).__init__(*args, **kwargs)
#         # Setting the format of the date field to the format that the datepicker uses.

#     nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
#                 attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
#     # evaluacion = forms.FloatField(required = True, label = 'Evaluación*', widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la evaluación'}))
#     indicador = forms.ModelChoiceField(queryset = indicador_objetivos.objects.filter(activo = True), required = True, label = 'Indicador de objetivo*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     area = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = 'Área*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
#     activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
#             widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
#     class Meta:
#         model = accion_indicador_objetivo
#         fields = "__all__"
#         widgets = {
#                 "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
#         }


class cambiarlogoForm(ModelForm):
    class Meta:
        model = models.CambiarLogotipo
        fields = '__all__'
        exclude=['activo']
        widgets = {
            "fecha_cambio": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
            "logo": widgets.ClearableFileInput(attrs={'class': 'form-control','accept':'image/*'}),
        }