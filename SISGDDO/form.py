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
from django.http import HttpResponse

#form #nomenclador #Javier
from SISGDDO.models import area, estado_indicador_objetivos, fuente_financiamiento, rol_trabajador_proyecto, tipo_proyecto, objetivo, indicador_objetivos
from SISGDDO.models import consecutivo, tipo_codigo, accion_indicador_objetivo
from SISGDDO.models import sosi
#form #nomenclador #Erik
from SISGDDO.models import estado_incidencia
#form #nomenclador #Abel
from SISGDDO.models import estado_propiedad_industrial

#yaEstaban
from SISGDDO.models import indicador, licencia, proceso, area, linea_tematica, estado_proyecto, formato, estado_entradas_proyecto, entrada_proyecto, entidad, premio
from SISGDDO.models import plan_medidas,acuerdo,incidencia,propiedad_industrial,proyecto,cliente,auditoria_externa,auditoria_interna,area,proceso,curso,estado_proyecto,estado_acuerdo,trabajador
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

    anno = forms.CharField(label = 'Año', max_length = 4, required = False, widget = widgets.DateInput(
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
class tipo_codigo_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = tipo_codigo
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
        model = rol_trabajador_proyecto
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
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha_entrada'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_aprobacion'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_inicio'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_interrupcion'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_terminacion'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_extension'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_cierre'].widget.format = ('%Y-%m-%d')

    fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    nombre_proyecto = forms.CharField(label = 'Nombre*', max_length = 250, required = True, 
                widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    formato = forms.ModelMultipleChoiceField(queryset = formato.objects.filter(activo = True), required = False, label = 'Formato', 
                widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    tipo_codigo = forms.ModelChoiceField(queryset = tipo_codigo.objects.filter(activo = True), required = True, label = 'Tipo de código*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    tipo = forms.ModelChoiceField(queryset = tipo_proyecto.objects.filter(activo = True), required = True, label = 'Tipo de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    area = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = 'Área*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    jefe_proyecto = forms.ModelChoiceField(queryset = trabajador.objects.filter(activo = True, cargo = 'Jefe de proyecto'), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    especialista_calidad = forms.ModelChoiceField(queryset = trabajador.objects.filter(activo = True, cargo = 'Jefe de proyecto'), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    disennador = forms.ModelChoiceField(queryset = trabajador.objects.filter(activo = True, cargo = 'Jefe de proyecto'), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fuente_financiamiento = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Fuente de financiamiento*', 
            empty_label='Escriba y seleccione...',
            widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    aprobacion_consejo = forms.CharField(label = 'Aprobación del Consejo Editorial', max_length = 25, required = False,
                widget = widgets.TextInput(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el acuerdo'}))
    fecha_aprobacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de aprobación", required = False,
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_interrupcion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de interrupción",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    causa_interrupcion = forms.CharField(label = 'Causa(s) de la interrupción', max_length = 250, required = False, 
                widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las causas de la interrupción'}))
    fecha_terminacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de terminación", required = False,
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_extension = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de extensión",  required = False,
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_cierre = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de cierre",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    costo = forms.FloatField(required = True, label = 'Costo (CUP)*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca el costo'}))
    observacion = forms.CharField(required = False, label = 'Observación', max_length = 250, widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
    informe_apertura = forms.FileField(label = 'Informe apertura', required = False)
    informe_cierre = forms.FileField(label = 'Informe cierre', required = False, widget = forms.ClearableFileInput(attrs = {'multiple': False}))
    linea_tematica = forms.ModelChoiceField(queryset = linea_tematica.objects.filter(activo = True), label = 'Línea temática', empty_label='Escriba y seleccione...', required = False, widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    estado = forms.ModelChoiceField(queryset = estado_proyecto.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))

    #documento que me dijo dayana que tenia que ser subido con la aprobacion de paginas web y diseño
    
    
    class Meta:
        # importante! obtener el ultimo "no", no el ultimo "id"

        def get_no_consecutivo():
            try:
                ultimo = consecutivo.objects.last()
                # print('NO. del ULTIMO', ultimo)
                if ultimo is None:
                    no_consecutivo = 1
                else:
                    try:
                        int(ultimo.codigo[-1])
                    except:
                        return Exception("Error: El código del último consecutivo o proyecto debe terminar en un número.")
                    no_consecutivo = int(ultimo.__getattribute__('no')) + 1
                # print('CONSECUTIVO QUE DEVUELVE', no_consecutivo)
                return no_consecutivo
            except:
                return HttpResponse("Error en el servidor", status = 500)

        def get_codigo() -> str:
            try:
                ultimo = consecutivo.objects.last()
                if ultimo is not None:
                    try:
                        codigo_viejo = ultimo.__getattribute__('codigo')
                        try:
                            int(ultimo.codigo[-1])
                        except:
                            return Exception("Error: El código del último consecutivo o proyecto debe terminar en un número.")
                        abrev, cod = codigo_viejo[:3], codigo_viejo[3:]
                    except:
                        return HttpResponse("Error en el servidor", status = 500)
                anno_actual = datetime.now().strftime("%Y")
                # anno_actual = 2023
                existe = consecutivo.objects.filter(activo = True, fecha_entrada__year__gte = anno_actual)
                if (len(existe) == 0 or ultimo is None):
                    abrev = 'DES'
                    dig_anno = str(anno_actual)[-2:]
                    cod = dig_anno + '01'
                else:
                    cod = str(int(cod) + 1)
                return (abrev + cod)
            except:
                return HttpResponse("Error en el servidor.", status = 500)

        model = consecutivo
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
                    'value' : get_no_consecutivo()}),
                "codigo": widgets.TextInput(attrs={'class': ' form-control', 'value' : get_codigo(),
                    'placeholder': f'Ej. Código correspondiente {get_codigo()}'}),
        }

#parece que lo que est'a luego del init no tiene que pasarse en Meta
#moduloJavier
class premio_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(premio_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha'].widget.format = ('%Y-%m-%d')

    fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    entidad = forms.ModelChoiceField(queryset = entidad.objects.filter(activo = True), required = True, label = 'Entidad*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    archivo = forms.FileField(label = 'Archivo*', required = True)    
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))    
    
    class Meta:
        model = premio
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
class acuerdo_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(acuerdo_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_limite'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_cumplimiento'].widget.format = ('%Y-%m-%d')

    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
                attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_limite = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha límite', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_cumplimiento = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha de cumplimiento', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    trabajador = forms.ModelMultipleChoiceField(queryset = trabajador.objects.filter(activo = True), required = True, label = 'Responsable(s)*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    observaciones = forms.CharField(required = False, label = 'Observaciones', max_length = 250, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
    estado = forms.ModelChoiceField(queryset = estado_acuerdo.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'})) 
    
    class Meta:
        def get_no_acuerdo():
            try:
                ultimo = acuerdo.objects.last()
                if ultimo is None:
                    no_consecutivo = 1
                else:
                    try:
                        int(ultimo.numero)
                    except:
                        return Exception("Error: No se ha podido obtener el último acuerdo.")
                    no_consecutivo = int(ultimo.__getattribute__('numero')) + 1
                return no_consecutivo
            except:
                return HttpResponse("Error en el servidor", status = 500)

        model = acuerdo
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
                    'value' : get_no_acuerdo()}),
        }

#moduloJavier
class objetivo_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(objetivo_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha_definicion'].widget.format = ('%Y-%m-%d')

    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
                attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    fecha_definicion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de definición*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    indicador = forms.ModelMultipleChoiceField(queryset = indicador_objetivos.objects.filter(activo = True), required = False, label = 'Indicadores*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'})) 
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'})) 
    
    class Meta:

        model = premio
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
class entrada_proyecto_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(entrada_proyecto_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha_entrada'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_salida'].widget.format = ('%Y-%m-%d')

    fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_salida = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de salida*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    entregado_por = forms.ModelChoiceField(queryset = trabajador.objects.filter(activo = True), required = True, label = 'Entregado por*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    formato = forms.ModelMultipleChoiceField(queryset = formato.objects.filter(activo = True), required = True, label = 'Formato*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    proyecto = forms.ModelChoiceField(queryset = consecutivo.objects.filter(activo = True), required = True, label = 'Proyecto*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    dictamen = forms.FileField(label = 'Dictamen técnico', required = False)
    estado = forms.ModelChoiceField(queryset = estado_proyecto.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
    class Meta:
        model = entrada_proyecto
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
class sosi_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(sosi_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha'].widget.format = ('%Y-%m-%d')

    numero_salva = forms.CharField(label = 'Número de salva*', max_length = 10, required = True, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el número de salva'}))
    fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    anno = forms.CharField(label = 'Año', max_length = 4, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el año'}))
    especialista = forms.ModelChoiceField(queryset = trabajador.objects.filter(activo = True), required = True, label = 'Entregado por*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    autor = forms.CharField(label = 'Autor', max_length = 50, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el autor'}))
    ubicacion_salva = forms.CharField(label = 'Ubicación de la salva', max_length = 10, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la ubicación de la salva'}))
    observaciones = forms.CharField(label = 'Observaciones*', max_length = 150, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las observaciones'}))
    archivo = forms.FileField(label = 'Archivo', required = True)
    eliminado = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
    class Meta:
        model = sosi
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
    objetivo = forms.ModelChoiceField(queryset = objetivo.objects.filter(activo = True), required = True, label = 'Objetivo*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    estado = forms.ModelChoiceField(queryset = estado_indicador_objetivos.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    accion = forms.ModelMultipleChoiceField(queryset = accion_indicador_objetivo.objects.filter(activo = True), required = False, label = 'Acción*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
    class Meta:
        model = indicador_objetivos
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
class accion_indicador_objetivo_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(accion_indicador_objetivo_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.

    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
                attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    # evaluacion = forms.FloatField(required = True, label = 'Evaluación*', widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la evaluación'}))
    indicador = forms.ModelChoiceField(queryset = indicador_objetivos.objects.filter(activo = True), required = True, label = 'Indicador de objetivo*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    area = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = 'Área*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
    class Meta:
        model = accion_indicador_objetivo
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
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
