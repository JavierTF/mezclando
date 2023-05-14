from email.policy import default
from msilib import add_stream
from django.views.generic.edit import CreateView, DeleteView, UpdateView, BaseUpdateView
from django.urls import reverse_lazy
from SISGDDO import models
from django.forms import widgets
from django import forms
from django.forms import ModelForm
from ProyectoBaseApp.utils import register_logs
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.contrib.admin.models import LogEntry
from notifications.signals import notify
from django.contrib.auth.models import User
from tempus_dominus.widgets import DatePicker,TimePicker,DateTimePicker
from datetime import datetime

#form #nomenclador #Javier
from SISGDDO.models import area, estado_indicador_objetivos, fuente_financiamiento, rol_trabajador_consecutivo, rol_trabajador_proyecto, tipo_proyecto, trabajador_consecutivo
from SISGDDO.models import consecutivo
#form #nomenclador #Erik
from SISGDDO.models import estado_incidencia
#form #nomenclador #Abel
from SISGDDO.models import estado_propiedad_industrial

#yaEstaban
from SISGDDO.models import indicador, sosi, licencia, proceso, area, linea_tematica, estado_proyecto, formato, estado_entradas_proyecto, entradas_proyecto, entidad, premio
from SISGDDO.models import plan_medidas,acuerdo,incidencia,propiedad_industrial,proyecto,cliente,auditoria_externa,auditoria_interna,area,proceso,curso,estado_proyecto,estado_acuerdo,metodosprueba,trabajador
# tipo_de_licencias, acciones_correptivas, acciones_prevenntivas


class DateInput(forms.DateInput):
    input_type = 'date'

#moduloJavier
class area_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre del área'})
                    )

    class Meta:
        model = area
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class linea_tematica_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    anno = forms.CharField(label = 'Año', widget = widgets.DateInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el año'}))

    class Meta:
        model = linea_tematica
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
            "anno": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class estado_acuerdo_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = estado_acuerdo
        fields = "__all__"
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
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class rol_consecutivo_proyecto_form(ModelForm):
    nombre = forms.ModelChoiceField(queryset = None, label = 'Nombre del rol*', empty_label = 'Escriba el nombre', widget = widgets.Select(
        attrs={'class': 'form-control texto select2', 'autocomplete': 'on'}))

    class Meta:
        model = rol_trabajador_consecutivo
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class estado_entradas_proyecto_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = estado_entradas_proyecto
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class entidad_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = entidad
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class estado_indicador_objetivos_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = estado_indicador_objetivos
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class rol_trabajador_consecutivo_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = rol_trabajador_consecutivo
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class rol_trabajador_proyecto_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = rol_trabajador_proyecto
        fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }
   
#parece que lo que est'a luego del init no tiene que pasarse en Meta
#moduloJavier
class consecutivo_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(consecutivo_form, self).__init__(*args, **kwargs)
        # self.fields['formato'].queryset = formato.objects.filter(activo = True)
        self.fields['no'].disabled = True

    # recordar que no deben ser más de seis, validar esto   
    formatos = ((-1, "Seleccione hasta 6 elementos"),)
    formatos = tuple((f.id, f.nombre,) for f in formato.objects.filter(activo = True))
    tipos = ((-1, "Seleccione..."),)
    tipos = tipos + tuple((t.id, t.nombre,) for t in tipo_proyecto.objects.filter(activo = True))
    areas = ((-1, "Seleccione..."),)
    areas = areas + tuple((a.id, a.nombre,) for a in area.objects.filter(activo = True))
    fuentes = ((-1, "Seleccione..."),)
    fuentes = fuentes + tuple((f.id, f.nombre,) for f in fuente_financiamiento.objects.filter(activo = True))
    lineas = ((-1, "Seleccione..."),)
    lineas = lineas + tuple((l.id, l.nombre,) for l in linea_tematica.objects.filter(activo = True))
    estados = ((-1, "Seleccione..."),)
    estados = estados + tuple((e.id, e.nombre,) for e in estado_proyecto.objects.filter(activo = True))
    jefes = ((-1, "Seleccione..."),)
    jefes = jefes + tuple((j.id, j.nombre + " " + j.primer_apellido + " " + j.segundo_apellido,) for j in trabajador.objects.filter(activo = True, cargo = "Jefe de proyecto"))
    
    fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True,
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    nombre_proyecto = forms.CharField(label = 'Nombre*', max_length = 250, required = True, widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    formato = forms.MultipleChoiceField(choices = formatos,required = True, label = 'Formato*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    tipo = forms.ChoiceField(choices = tipos, required = True, label = 'Tipo*', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    area = forms.ChoiceField(choices = areas, required = True, label = 'Área*', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    roles = forms.ChoiceField(choices = jefes, required = True, label = 'Jefe de proyecto*', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fuente_financiamiento = forms.ChoiceField(choices = fuentes, required = True, label = 'Fuente de financiamiento*', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_terminacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de terminación",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_extension = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de extensión",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_cierre = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de cierre*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    costo = forms.FloatField(required = True, label = 'Costo (CUP)*', widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca el costo'}))
    observacion = forms.CharField(label = 'Observación', max_length = 250, widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
    informe = forms.FileField(label = 'Informe', widget = forms.ClearableFileInput(attrs = {'multiple': False}))
    linea_tematica = forms.ChoiceField(choices = lineas, label = 'Línea temática', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    estado = forms.ChoiceField(choices = estados, required = True, label = 'Estado*', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))

    #documento que me dijo dayana que tenia que ser subido con la aprobacion de paginas web y diseño
    
    class Meta:
        # importante! obtener el ultimo no, no el ultimo id
        def get_no_consecutivo():
            try:
                no_consecutivo = 1 if consecutivo.objects.last() is None else int(consecutivo.objects.last()) + 1
                return no_consecutivo
            except:
                pass

        model = consecutivo
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
                    'value' : get_no_consecutivo()}),
                "codigo": widgets.TextInput(attrs={'class': ' form-control', 'placeholder' : 'Introduzca el código'}),
        }

class licenciaForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(licenciaForm, self).__init__(*args, **kwargs)
        # self.fields['entidad_emite'].queryset = entidad.objects.filter(activo=True)
        self.fields['trabajador_responsable'].queryset = trabajador.objects.filter(activo=True)
        self.fields['proceso'].queryset = proceso.objects.filter(activo=True)

    # entidad_emite = forms.ModelChoiceField(queryset=None, label='Entidad que emite*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    trabajador_responsable = forms.ModelChoiceField(queryset=None, label='Responsable*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    proceso = forms.ModelChoiceField(queryset=None, label='Proceso*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = licencia
        fields = "__all__"
        widgets = {
            "nombre_lic": widgets.TextInput(attrs={'class': ' form-control'}),
            "no_licencia": widgets.TextInput(attrs={'class': ' form-control'}),
            "actividad": widgets.TextInput(attrs={'class': ' form-control'}),
            "fecha_otorg": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False}, attrs={'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            "fecha_venc": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False}, attrs={'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            "observacion": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),
        }

class incidenciaForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(incidenciasForm, self).__init__(*args, **kwargs)
        self.fields['trabajador'].queryset = trabajador.objects.filter(activo=True)
        self.fields['proceso'].queryset = proceso.objects.filter(activo=True)
        self.fields['estado'].queryset = estado_no_conformidad.objects.filter()
        self.fields['clasificacion'].queryset = models.clasificacionincidencias.objects.filter()

    clasificacion = forms.ModelChoiceField(queryset=None,label='Clasificación*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    trabajador = forms.ModelChoiceField(queryset=None,label='Trabajador*', empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    proceso = forms.ModelChoiceField(queryset=None,label='Proceso*' ,empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    estado = forms.ModelChoiceField(queryset=None, label='Estado*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = incidencia
        fields = "__all__"
        widgets = {
                "nombre_conformifdad": widgets.TextInput(attrs={'class': ' form-control '}),
                "fecha_recibido": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
                "estado": widgets.Select(attrs={'class': ' form-control select2','autocomplete': 'on'}),
                "fecha_cierre": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
                "observacion": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),
                "descripcion": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),
                "clasificacion": widgets.Select(attrs={'class': ' form-control select2','autocomplete': 'on'}),
        }

class trabajadorForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(trabajadorForm, self).__init__(*args, **kwargs)
        self.fields['formacion'].queryset = formacion_personal.objects.filter()

    formacion = forms.ModelChoiceField(queryset=None, label='Formación', empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))

    class Meta:
        model = trabajador
        fields = "__all__"
        widgets = {
            "nombre_trabajador": widgets.TextInput(attrs={'class':'form-control'}),
            "primer_apellido": widgets.TextInput(attrs={'class': 'form-control'}),
            "segundo_apellido": widgets.TextInput(attrs={'class': 'form-control'}),
            "ci": widgets.TextInput(attrs={'class': 'form-control'}),
            "cargo": widgets.TextInput(attrs={'class': 'form-control'}),
            "activo": widgets.CheckboxInput(attrs={'class': 'form-control'}),
            "es_cuadro": widgets.CheckboxInput(attrs={'class': ' form-control'}),
            "fecha_inicio_cuadro": DatePicker(options={'minDate': '2021-01-01', 'maxDate': '2030-01-01', 'useCurrent': True, 'collapse': False},attrs={'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            "fecha_terminacion_cuadro": DatePicker(options={'minDate': '2021-01-01', 'maxDate': '2030-01-01', 'useCurrent': True, 'collapse': False},attrs={'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
            "fotocuadro": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'image/*'}),
            "planillacuadro": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'.docx','required':False}),
            "es_reserva": widgets.CheckboxInput(attrs={'class': ' form-control'}),
            "fecha_inicio_reserva": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
            "fecha_terminacion_reserva": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
            "fotoreserva": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'image/*'}),
            "planillareserva": widgets.ClearableFileInput(attrs={'class': ' form-control','accept':'.docx','required':False}),

        }

# class formacionpersonalForm(ModelForm):
#     class Meta:
#         model = formacion_personal
#         fields = "__all__"
#         widgets = {
#             "titulo": widgets.TextInput(attrs={'class':'form-control'}),
#             "capacitacion_adquirida": widgets.SelectMultiple(attrs={'class': 'form-control select2','autocomplete': 'on','multiple':'multiple'}),
#             "capacitacion_necesita": widgets.TextInput(attrs={'class': 'form-control'}),
#         }

class planmedidasForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(planmedidasForm, self).__init__(*args, **kwargs)
        self.fields['proceso'].queryset = proceso.objects.filter(activo=True)

    proceso = forms.ModelChoiceField(queryset=None, label='Proceso*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model =plan_medidas
        fields = "__all__"
        widgets = {
            "actividad": widgets.TextInput(attrs={'class':'form-control'}),
            "titulo_doc": widgets.TextInput(attrs={'class': 'form-control '}),
            "fecha": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
            "acciones": widgets.SelectMultiple(attrs={'class': 'form-control select2','autocomplete': 'on','multiple':'multiple'}),
        }


class cendaForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super(cendaForm, self).__init__(*args, **kwargs)
        self.fields['coleccion'].queryset = linea_tematica.objects.filter(activo=True)

    coleccion = forms.ModelChoiceField(queryset=None, empty_label='Escriba una opción',label='Línea Temática*',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = propiedad_industrial
        fields = '__all__'
        widgets = {
                "cotitular": widgets.TextInput(attrs={'class': ' form-control'}),
                "fecha_incrip": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
        }

class sosiForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(sosiForm, self).__init__(*args, **kwargs)
        self.fields['coleccion'].queryset = linea_tematica.objects.filter(activo=True)
        self.fields['formatos'].queryset = formato.objects.filter(activo=True)
        # self.fields['idioma'].queryset = idioma.objects.filter(activo=True)
        self.fields['area'].queryset = area.objects.filter(activo=True)

    coleccion = forms.ModelMultipleChoiceField(queryset=None,label='Línea Temática(s)*',widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on' ,'multiple':'multiple'}))
    formato = forms.ModelMultipleChoiceField(queryset=None,label='Formato(s)*',widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on','multiple':'multiple'}))
    # idioma = forms.ModelMultipleChoiceField(queryset=None,label='Idioma(s)*',widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on','multiple':'multiple'}))
    area = forms.ModelChoiceField(queryset=None, empty_label='Selecione la opción',label='Área*',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = sosi
        fields = "__all__"
        widgets = {
                "numero_salva": widgets.TextInput(attrs={'class': ' form-control'}),
                "descripcion": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),
                "fecha_salv": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
                "ubicacion_salv": widgets.TextInput(attrs={'class': ' form-control'}),
                "documentacion": widgets.CheckboxInput(attrs={'class': ' form-control'}),
                "materia_prima": widgets.CheckboxInput(attrs={'class': ' form-control'}),
                "anno": widgets.TextInput(attrs={'class': ' form-control '}),
                "autor": widgets.TextInput(attrs={'class': ' form-control '}),
                "cod_proyecto": widgets.TextInput(attrs={'class': ' form-control '}),
                "nombre_proy_prod": widgets.Textarea(attrs={'class': ' form-control ','rows':'2'}),
                "persona_entrega": widgets.TextInput(attrs={'class': ' form-control '}),
                "persona_recibe": widgets.TextInput(attrs={'class': ' form-control '}),
        }

class proyectoForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(proyectoForm, self).__init__(*args, **kwargs)
        self.fields['area'].queryset = area.objects.filter(activo=True)
        self.fields['jefe_proyecto'].queryset = trabajador.objects.filter(activo=True)
        self.fields['estado'].queryset = estado_proyecto.objects.filter()
        self.fields['sosi'].queryset = sosi.objects.filter()
        self.fields['cenda'].queryset = CENDA.objects.filter()

    area = forms.ModelChoiceField(queryset=None,empty_label='Escriba una opción',label='Área*',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    estado = forms.ModelChoiceField(queryset=None, label='Estado*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    sosi = forms.ModelChoiceField(queryset=None, label='sosi*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    cenda = forms.ModelChoiceField(queryset=None, label='CENDA*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    jefe_proyecto = forms.ModelMultipleChoiceField(queryset=None,label='Jefe de Proyecto*',widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on','multiple':'multiple'}))

    class Meta:
        model = proyecto
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                "nombre_proyecto": widgets.TextInput(attrs={'class': ' form-control'}),
                "no_contrato": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),

                "resolusion_jefe_proyecto": widgets.TextInput(attrs={'class': ' form-control'}),

                "cenda": widgets.Select(attrs={'class': ' form-control select2','autocomplete': 'on'}),
                "fecha_inicio": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
                "fecha_entrega": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
                "fecha_terminacion": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
        }

class entradaproyectoForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(entradaproyectoForm, self).__init__(*args, **kwargs)
        self.fields['lenguaje_prog'].queryset = lenguaje_prog.objects.filter(activo=True)
        self.fields['sistema_operativo'].queryset = sistema_operativo.objects.filter(activo=True)
        self.fields['trabajador_calidad_interna'].queryset = trabajador.objects.filter(activo=True)
        self.fields['formatos'].queryset = formato.objects.filter(activo=True)
        self.fields['estado_entradas_proyecto'].queryset = estado_entradas_proyecto.objects.filter()
        self.fields['proyecto'].queryset = proyecto.objects.filter()
        self.fields['jefe_UEB_grupo'].queryset = trabajador.objects.filter(activo=True)

    lenguaje_prog = forms.ModelChoiceField(queryset=None,label='Lenguaje de Programación*' ,empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    sistema_operativo = forms.ModelChoiceField(queryset=None,label='Sistema Operativo*' ,empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    trabajador_calidad_interna = forms.ModelChoiceField(queryset=None,label='Trabajador de calidad interna*' ,empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    estado_entradas_proyecto = forms.ModelChoiceField(queryset=None,label='Estado de la entrada del proyecto*' ,empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    proyecto = forms.ModelChoiceField(queryset=None, label='Proyecto*',empty_label='Escriba una opción',widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))
    formatos = forms.ModelMultipleChoiceField(queryset=None,label='Formatos*' ,widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on' ,'multiple':'multiple'}))
    jefe_UEB_grupo = forms.ModelChoiceField(queryset=None,label='Jefe de UEB o Grupo*',empty_label='Escriba una opción' ,widget=widgets.Select(attrs={'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = entradas_proyecto
        fields = "__all__"
        widgets = {
                "no_entrada": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                "documentacion": widgets.TextInput(attrs={'class': ' form-control'}),
                "direccion_sitio": widgets.URLInput(attrs={'class': ' form-control'}),
                "observaciones": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),

        }

# class atencion_cliente_externoForm(ModelForm):
    # def __init__(self, *args, **kwargs):
    #     super(atencion_cliente_externoForm, self).__init__(*args, **kwargs)
    #     self.fields['trabajador'].queryset = trabajador.objects.filter(activo=True)
    #     self.fields['proceso'].queryset = proceso.objects.filter(activo=True)
    #     self.fields['cliente'].queryset = cliente_externo.objects.filter(activo=True)
    #     self.fields['estado'].queryset = estado_no_conformidad.objects.filter()

    # trabajador = forms.ModelChoiceField(queryset=None,label='Trabajador*' ,empty_label='Escriba una opción', widget=widgets.Select(
    #     attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))
    # proceso = forms.ModelChoiceField(queryset=None, label='Proceso*',empty_label='Escriba una opción', widget=widgets.Select(attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))
    # cliente = forms.ModelChoiceField(queryset=None, label='Cliente*',empty_label='Escriba una opción', widget=widgets.Select(attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))
    # estado = forms.ModelChoiceField(queryset=None, label='Estado*',empty_label='Escriba una opción', widget=widgets.Select(attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))

    # class Meta:
    #     model = atencion_cliente_externo
    #     fields = "__all__"
    #     widgets = {
    #             "nombre_conformifdad": widgets.TextInput(attrs={'class': ' form-control '}),
    #             #"hora_inicio": widgets.TimeInput(attrs={'class': ' form-control '}),
    #             "fecha_recibido": DateTimePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
    #             "fecha_cierre": DateTimePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),
    #             #"hora_cierre": widgets.TimeInput(attrs={'class': ' form-control '}),
    #             "via_recep": widgets.TextInput(attrs={'class': ' form-control'}),
    #             "observacion": widgets.Textarea(attrs={'class': ' form-control ', 'rows': '2'}),
    #     }

class auditoria_internaForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(auditoria_internaForm, self).__init__(*args, **kwargs)
        self.fields['trabajadores'].queryset = trabajador.objects.filter(activo=True)
        self.fields['area'].queryset = area.objects.filter(activo=True)
        self.fields['metodos_prueba'].queryset = metodosprueba.objects.filter()
        self.fields['plan_medidas'].queryset = plan_medidas.objects.filter()

    trabajadores = forms.ModelMultipleChoiceField(queryset=None,label='Trabajadores*' ,widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on' ,'multiple':'multiple'}))
    area = forms.ModelChoiceField(queryset=None, empty_label='Escriba una opción', label='Área*',widget=widgets.Select(
        attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))
    metodos_prueba = forms.ModelMultipleChoiceField(queryset=None,label='Metodos de Prueba*' ,widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on' ,'multiple':'multiple'}))
    plan_medidas = forms.ModelChoiceField(queryset=None,label='Plan de Medidas*' ,empty_label='Escriba una opción', widget=widgets.Select(
        attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))

    class Meta:
        model = auditoria_interna
        fields = "__all__"
        widgets = {
                "titulo_inf": widgets.TextInput(attrs={'class': ' form-control'}),
                "fecha_aud": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
                "periodo_comprueba": widgets.TextInput(attrs={'class': ' form-control '}),
                "asunto": widgets.TextInput(attrs={'class': ' form-control'}),
                "objetivos": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),
                "documentos_referencia": widgets.TextInput(attrs={'class': ' form-control'}),
                "muestra": widgets.TextInput(attrs={'class': ' form-control'}),
                "conclusiones": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),

        }

class auditoria_externaForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(auditoria_externaForm, self).__init__(*args, **kwargs)
        # self.fields['entidad'].queryset = entidad.objects.filter(activo=True)
        self.fields['area'].queryset = area.objects.filter(activo=True)
        self.fields['plan_medidas'].queryset = plan_medidas.objects.filter()


    # entidad = forms.ModelChoiceField(queryset=None, label='Entidad*',empty_label='Escriba una opción', widget=widgets.Select(
    #     attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))
    area = forms.ModelMultipleChoiceField(queryset=None,label=' Área*' ,widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on' ,'multiple':'multiple'}))
    plan_medidas = forms.ModelChoiceField(queryset=None, label='Plan de Medidas*',empty_label='Escriba una opción', widget=widgets.Select(
        attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))

    class Meta:
        model = auditoria_externa
        fields = "__all__"
        widgets = {
            "no_registro": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
            "titulo_inf": widgets.TextInput(attrs={'class': ' form-control'}),
            "fecha_emision": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
            "resultados": widgets.Textarea(attrs={'class': ' form-control','rows':'2'}),
            "plan_medidas": widgets.Select(attrs={'class': ' form-control select2','autocomplete': 'on'}),
        }

# class entidadForm(ModelForm):
#     class Meta:
#         model = entidad
#         fields = '__all__'
#         widgets = {
#             "nombre_Entidad": widgets.TextInput(attrs={'class':'form-control'}),
#             "activo": widgets.CheckboxInput(attrs={'class':'form-control'})
#         }

class cursoForm(ModelForm):
    class Meta:
        model = curso
        fields = '__all__'
        widgets = {
            "nombre_Curso": widgets.TextInput(attrs={'class':'form-control'}),
            "fecha": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
        }

# class organismoForm(ModelForm):
#     class Meta:
#         model = organismo
#         fields = '__all__'
#         widgets = {
#             "nombre_Organismo": widgets.TextInput(attrs={'class':'form-control'}),
#             "activo": widgets.CheckboxInput(attrs={'class':'form-control'})
#         }

class clasificacionesForm(ModelForm):
    class Meta:
        model = models.incidencia
        fields = '__all__'
        widgets = {
            "nombre_clasificacion": widgets.TextInput(attrs={'class':'form-control'}),

        }


class estadoproyectoForm(ModelForm):
    class Meta:
        model = estado_proyecto
        fields = '__all__'
        widgets = {
            "nombre_Estado": widgets.TextInput(attrs={'class':'form-control'}),

        }

class estadoentradasproyectoForm(ModelForm):
    class Meta:
        model = estado_entradas_proyecto
        fields = '__all__'
        widgets = {
            "nombre_Estado": widgets.TextInput(attrs={'class': 'form-control'}),

        }

# class estadonoconformidadForm(ModelForm):
#     class Meta:
#         model = estado_no_conformidad
#         fields = '__all__'
#         widgets = {
#             "nombre_Estado": widgets.TextInput(attrs={'class': 'form-control'}),

#         }

class indicadoreficaciaForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(indicadorForm, self).__init__(*args, **kwargs)
        self.fields['proceso'].queryset = proceso.objects.filter(activo=True)

    proceso = forms.ModelChoiceField(queryset=None, label='Proceso*',empty_label='Escriba una opción', widget=widgets.Select(
        attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))


    class Meta:
        model = indicador
        fields = ['nombre']
        widgets = {
            "nombre_ind": widgets.Textarea(attrs={'class': 'form-control'}),


        }

# class aspectosindicadoreficaciaForm(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(aspectosindicadoreficaciaForm, self).__init__(*args, **kwargs)
#         self.fields['indicadores'].queryset = indicador_eficacia.objects.filter()

#     indicadores = forms.ModelChoiceField(queryset=None,label='Indicador*' ,empty_label='Escriba una opción', widget=widgets.Select(
#         attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))

#     class Meta:
#         model = aspecto_Medir_IndicadorEficacia
#         fields = ['nombre_asp','indicadores']
#         widgets = {
#             "nombre_asp": widgets.Textarea(attrs={'class': 'form-control'}),


#         }

class estadoacuerdoForm(ModelForm):
    class Meta:
        model = estado_acuerdo
        fields = '__all__'
        widgets = {
            "nombre_Estado": widgets.TextInput(attrs={'class': 'form-control'}),

        }
# class acciones_prevenntivasForm(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(acciones_prevenntivasForm, self).__init__(*args, **kwargs)
#         self.fields['responsable'].queryset = trabajador.objects.filter(activo=True)


#     responsable = forms.ModelMultipleChoiceField(queryset=None,label='Responsable(s)*', widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2','autocomplete': 'on' ,'multiple':'multiple'}))

#     class Meta:
#         model = acciones_prevenntivas
#         fields = '__all__'
#         widgets = {

#             "fecha_cumplir": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
#             "tratamiento": widgets.TextInput(attrs={'class': 'form-control'}),
#             "seguimiento": widgets.TextInput(attrs={'class': 'form-control'}),
#             "accion_tomar": widgets.TextInput(attrs={'class': 'form-control'}),
#         }

# class acciones_correptivasForm(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(acciones_correptivasForm, self).__init__(*args, **kwargs)
#         self.fields['responsable'].queryset = trabajador.objects.filter(activo=True)

#     responsable = forms.ModelMultipleChoiceField(queryset=None,label='Responsable(s)*', widget=widgets.SelectMultiple(
#         attrs={'class': ' form-control texto select2', 'autocomplete': 'on', 'multiple': 'multiple'}))

#     class Meta:
#         model = acciones_correptivas
#         fields = '__all__'
#         widgets = {

#             "fecha_cumplir": DatePicker(
#                 options={'minDate': '2021-01-01', 'maxDate': '2030-01-01', 'useCurrent': True, 'collapse': False},
#                 attrs={'class': 'form-control', 'append': 'fa fa-calendar', 'icon_toggle': True}),

#             "seguimiento": widgets.TextInput(attrs={'class': 'form-control'}),
#             "accion_tomar": widgets.TextInput(attrs={'class': 'form-control'}),
#             "tratamiento": widgets.TextInput(attrs={'class': 'form-control'}),
#         }


class metpruebaForm(ModelForm):
    class Meta:
        model = metodosprueba
        fields = '__all__'
        widgets = {
            "metodo": widgets.TextInput(attrs={'class': 'form-control'}),

        }


# class tratamientoForm(ModelForm):
#     class Meta:
#         model = tratamiento
#         fields = '__all__'
#         widgets = {
#             "nombre_Tratamiento": widgets.TextInput(attrs={'class': 'form-control'}),
#
#         }

class areaForm(ModelForm):
    class Meta:
        model = area
        fields = '__all__'
        widgets = {
            "nombre_Area": widgets.TextInput(attrs={'class':'form-control'}),
            "activo": widgets.CheckboxInput(attrs={'class':'form-control'})
        }

class formatosForm(ModelForm):
    class Meta:
        model = formato
        fields = '__all__'
        widgets = {
            "nombre_Formato": widgets.TextInput(attrs={'class':'form-control'}),
            "activo": widgets.CheckboxInput(attrs={'class':'form-control'})
        }

# class idiomaForm(ModelForm):
#     class Meta:
#         model = idioma
#         fields = '__all__'
#         widgets = {
#             "nombre_Idioma": widgets.TextInput(attrs={'class':'form-control'}),
#             "activo": widgets.CheckboxInput(attrs={'class':'form-control'})
#         }

class procesoForm(ModelForm):
    class Meta:
        model = proceso
        fields = '__all__'
        widgets = {
            "nombre_Proceso": widgets.TextInput(attrs={'class': 'form-control'}),
            "abreviatura": widgets.TextInput(attrs={'class': 'form-control'}),
            "activo": widgets.CheckboxInput(attrs={'class': 'form-control'})
        }




class clienteForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super(clienteForm, self).__init__(*args, **kwargs)

    class Meta:
        model = cliente
        fields = '__all__'
        widgets = {
            "nombre_clienteext": widgets.TextInput(attrs={'class': 'form-control'}),
            "apellidos": widgets.TextInput(attrs={'class': 'form-control'}),

            "activo": widgets.CheckboxInput(attrs={'class': 'form-control'})
        }

# class eficacia_procesosForm(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(eficacia_procesosForm, self).__init__(*args, **kwargs)
#         self.fields['trabajador'].queryset = trabajador.objects.filter(activo=True)
#         self.fields['proceso'].queryset = proceso.objects.filter(activo=True)

#     trabajador = forms.ModelChoiceField(queryset=None,label='Jefe de Proceso*' ,empty_label='Escriba una opción', widget=widgets.Select(
#         attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))
#     proceso = forms.ModelChoiceField(queryset=None, label='Proceso*',empty_label='Escriba una opción', widget=widgets.Select(
#         attrs={'class': ' form-control texto select2', 'autocomplete': 'on'}))

#     class Meta:
#         model = eficacia
#         fields = ['trabajador','proceso','fecha']
#         widgets = {
#             "trabajador": widgets.Select(attrs={'class': ' form-control proceso-select select2','autocomplete': 'on'}),
#             "proceso": widgets.Select(attrs={'class': ' form-control proceso-select select2','autocomplete': 'on'}),
#             "fecha": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False,},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),

#         }
# class eficacia_procesosUpdateForm(ModelForm):

#     class Meta:
#         model = eficacia
#         fields = ['conformidad','trabajador','proceso','fecha','eficaz','eval_tot']

#         widgets = {
#             "conformidad": widgets.CheckboxInput(attrs={'class': ' form-control'}),
#             "trabajador": widgets.Select(attrs={'class': ' form-control proceso-select select2','autocomplete': 'on','disabled':'disabled'}),
#             "proceso": widgets.Select(attrs={'class': ' form-control proceso-select select2','autocomplete': 'on','disabled':'disabled'}),
#             "fecha": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True,'disabled':'disabled'}),
#             "eficaz": widgets.CheckboxInput(attrs={'class': 'form-control','disabled':'disabled'}),
#             "eval_tot": widgets.NumberInput(attrs={'class': 'form-control','disabled':'disabled'}),

#         }


# class valencuestaForm(ModelForm):
#     def __init__(self, *args, **kwargs):
#         super(valencuestaForm, self).__init__(*args, **kwargs)
#         self.fields['organismos'].queryset = organismo.objects.filter(activo=True)

#     organismos = forms.ModelMultipleChoiceField(queryset=None,label='Organismos*' ,widget=widgets.SelectMultiple(attrs={'class': ' form-control texto select2', 'autocomplete': 'on', 'multiple': 'multiple'}))
#     class Meta:
#         model = Valoracion_encuesta
#         fields = ['fecha','organismos','ISG_total']
#         widgets = {
#             "fecha": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
#             "ISG_total": widgets.HiddenInput(attrs={'style':'display:none'}),
#             }

# class cambiarlogoForm(ModelForm):
#     class Meta:
#         model = models.CambiarLogotipo
#         fields = '__all__'
#         widgets = {
#             "fecha_cambio": DatePicker(options={'minDate':'2021-01-01','maxDate':'2030-01-01','useCurrent': True, 'collapse': False},attrs={'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}),
#             "logo": widgets.ClearableFileInput(attrs={'class': 'form-control','accept':'image/*'}),
#         }



# class ClienteExternoDelete(DeleteView):
#     model = cliente_externo
#     template_name = 'entradadatos/clientes_externos_confirm_delete.html'
#     success_url = reverse_lazy('listar_clienteext')

#     def delete(self, request, *args, **kwargs):
#         register_logs(request, models.cliente_externo, self.get_object().pk, self.get_object().__str__(), 3)
#         self.object = self.get_object()
#         success_url = self.get_success_url()
#         if LogEntry.objects.filter(user_id=self.get_object().pk).count() == 0:
#             self.object.delete()
#             messages.success(request, "Cliente Externo eliminado con éxito")
#         else:
#             messages.error(request, "Existen trazas en el sistema con este nomenclador por tanto no se puede borrar")
#         return HttpResponseRedirect(success_url)

