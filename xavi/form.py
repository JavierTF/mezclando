from SISGDDO.models import Afectaciones
# from SISGDDO.models import trabajador
from SISGDDO import models as sisgddo_models
from django.forms import widgets
from django import forms
from django.forms import ModelForm
from tempus_dominus.widgets import DatePicker
from datetime import datetime
from django.http import HttpResponse
from apps.base.models import Employee, Position, Process, Procedure, Entity

#form #nomenclador #Javier
from xavi import models
from xavi.models import area, fuente_financiamiento, tipo_proyecto, objetivo, indicador_objetivos, proyecto
from xavi.models import linea_tematica, estado_proyecto, formato, premio, entrada_proyecto, representante
from xavi.models import acuerdo, estado_acuerdo, prioridad, tipo_extension, etapa_proyecto, idioma, tipo_moneda
from xavi.models import sosi, clasificacion, evaluacion, accion_indicador_objetivo, periodo, estado_proyecto_dgca, subclasificacion
from xavi.models import registro_aprobacion, registro_terminacion, registro_reinicio, registro_interrupcion, registro_extension
from xavi.models import control_etapa, cliente, idioma, autor_sosi
# from SISGDDO.models import proyecto, entrada_proyecto
from xavi.utils import get_ultimo, calcular_valor_inicial


from SISGDDO.models import incidencia, auditoria_externa, auditoria_interna, ActividadPlan
#yaEstaban
# tipo_de_licencias, acciones_correptivas, acciones_prevenntivas
from django.core.exceptions import ValidationError
    
class DateInput(forms.DateInput):
    input_type = 'date'

#moduloJavier
class area_form(ModelForm):
    centro_costo = forms.CharField(label = 'Centro de costo*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el centro de costo'})
                    )
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
        
class cliente_form(ModelForm):
    codigo = forms.CharField(label = 'Código', max_length = 20, required = False, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el código'})
                    )
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )

    class Meta:
        model = cliente
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
        }
        
class autor_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )

    class Meta:
        model = autor_sosi
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
        }
        
class idioma_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )

    class Meta:
        model = idioma
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
        }
        
class representante_form(ModelForm):
    cliente = forms.ModelChoiceField(queryset = cliente.objects.filter(activo = True), required = True, label = 'Cliente*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )

    class Meta:
        model = representante
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
        }
        
class etapa_proyecto_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 65, required = True, 
                    widget = widgets.TextInput(
                        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'})
                    )

    class Meta:
        model = etapa_proyecto
        exclude = ['activo']
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }
        
class evaluacion_form(ModelForm):
    valor = forms.IntegerField(
        required=False,
        # initial=calcular_valor_inicial(evaluacion),
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
        # initial=calcular_valor_inicial(periodo),
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
    etapa = forms.ModelChoiceField(queryset = etapa_proyecto.objects.filter(activo = True), required = True, label = 'Etapa de proyecto*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    

    class Meta:
        model = estado_proyecto
        exclude = ["activo"]
        # fields = "__all__"
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
        # fields = "__all__"
        exclude = ["activo"]
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
        
class tipo_moneda_form(ModelForm):
    siglas = forms.CharField(label = 'Siglas*', max_length = 10, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las siglas'}))
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = tipo_moneda
        exclude = ["activo"]
        # fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class clasificacion_form(ModelForm):
    siglas = forms.CharField(label = 'Siglas*', max_length = 10, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las siglas'}))
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = clasificacion
        exclude = ["activo"]
        # fields = "__all__"
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "siglas": widgets.TextInput(attrs = {'class': ' form-control', 'placeholder': 'Introduzca las siglas'}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }
        
#moduloJavier
class subclasificacion_form(ModelForm):
    siglas = forms.CharField(label = 'Siglas*', max_length = 10, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las siglas'}))
    nombre = forms.CharField(label = 'Nombre*', max_length = 120, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    clasificacion = forms.ModelChoiceField(queryset = clasificacion.objects.filter(activo = True), required = True, label = 'Clasificación*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))

    class Meta:
        model = subclasificacion
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
        # fields = "__all__"
        exclude = ["activo"]
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
        # fields = "__all__"
        exclude = ["activo"]
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
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
class estado_entradas_proyecto_form(ModelForm):
    nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
        attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

    class Meta:
        model = estado_proyecto_dgca
        # fields = "__all__"
        exclude = ["activo"]
        widgets = {
            "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
            "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
        }

#moduloJavier
# class estado_indicador_objetivos_form(ModelForm):
#     nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
#         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

#     class Meta:
#         model = estado_indicador_objetivos
#         fields = "__all__"
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
# class Position_form(ModelForm):
#     nombre = forms.CharField(label = 'Nombre*', max_length = 55, required = True, widget = widgets.TextInput(
#         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))

#     class Meta:
#         model = Position
#         fields = "__all__"
#         widgets = {
#             "id": widgets.NumberInput(attrs = {'class': ' form-control','min':1,'max':100000}),
#             "nombre": widgets.TextInput(attrs = {'class': ' form-control'}),
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
#     employee = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
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
        
# parece que lo que est'a luego del init no tiene que pasarse en Meta
# moduloJavier
class proyecto_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(proyecto_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        # self.fields['fecha_entrada'].widget.format = ('%Y-%m-%d')
        # self.fields['fecha_aprobacion'].widget.format = ('%Y-%m-%d')
        # self.fields['fecha_inicio'].widget.format = ('%Y-%m-%d')
        # self.fields['fecha_interrupcion'].widget.format = ('%Y-%m-%d')
        # self.fields['fecha_terminacion'].widget.format = ('%Y-%m-%d')
        # self.fields['fecha_extension'].widget.format = ('%Y-%m-%d')
        # self.fields['fecha_cierre'].widget.format = ('%Y-%m-%d')
    
    # fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    nombre_proyecto = forms.CharField(label = 'Nombre*', max_length = 250, required = True, 
                widget = widgets.Textarea(
            attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    formato = forms.ModelMultipleChoiceField(queryset = formato.objects.filter(activo = True), required = False, label = 'Formato', 
                widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # clasificacion = forms.ModelChoiceField(queryset = clasificacion.objects.filter(activo = True), required = True, label = 'Clasificación*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    subclasificacion = forms.ModelChoiceField(queryset = subclasificacion.objects.filter(activo = True), required = True, label = 'Subclasificación*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # tipo = forms.ModelChoiceField(queryset = tipo_proyecto.objects.filter(activo = True), required = True, label = 'Tipo de proyecto*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # area = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = 'Área*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # employee = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # especialista_calidad = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Especialista de calidad'), required = False, label = 'Especialista de Calidad*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # disennador = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True, position__name__iexact = 'Diseñador'), required = False, label = 'Diseñador*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # fuente_financiamiento = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Fuente de financiamiento*', 
    #         empty_label='Escriba y seleccione...',
    #         widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # aprobacion_consejo = forms.CharField(label = 'Aprobación del Consejo Editorial', max_length = 25, required = False,
    #             widget = widgets.TextInput(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el acuerdo'}))
    # fecha_aprobacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de aprobación", required = False,
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # fecha_interrupcion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de interrupción",
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    # causa_interrupcion = forms.CharField(label = 'Causa(s) de la interrupción', max_length = 250, required = False, 
    #             widget = widgets.Textarea(
    #         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las causas de la interrupción'}))
    # fecha_terminacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de terminación", required = False,
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # fecha_extension = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de extensión",  required = False,
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # fecha_cierre = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de cierre*",
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # costo = forms.FloatField(required = True, label = 'Costo (CUP)*',
    #             widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca el costo'}))
    # observacion = forms.CharField(required = False, label = 'Observación', max_length = 250, widget = widgets.Textarea(
    #         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
    # informe_apertura = forms.FileField(label = 'Informe apertura', required = False)
    # informe_cierre = forms.FileField(label = 'Informe cierre', required = False, widget = forms.ClearableFileInput(attrs = {'multiple': False}))
    # linea_tematica = forms.ModelChoiceField(queryset = linea_tematica.objects.filter(activo = True), label = 'Línea temática', empty_label='Escriba y seleccione...', required = False, widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    estado = forms.ModelChoiceField(queryset = estado_proyecto.objects.filter(activo = True), required = False, label = 'Estado*', empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))    
    
    class Meta:
        model = proyecto
        # fields = "__all__"
        exclude = ["activo", "registro_aprobacion", "creado"]
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000}),
                # "codigo": widgets.TextInput(attrs={'class': ' form-control', 'value' : get_codigo(),
                #     'placeholder': f'Ej. Código correspondiente {get_codigo()}'}),
        }

#moduloJavier
class registro_aprobacion_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(registro_aprobacion_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        # self.fields['fecha'].widget.format = ('%Y-%m-%d')

    cliente = forms.ModelChoiceField(queryset = cliente.objects.filter(activo = True), required = True, label = 'Cliente*', empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    contrato = forms.CharField(label = 'No. contrato', max_length = 10, required = False,
                widget = widgets.TextInput(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca no. contrato'}))
    centro_costo = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = '(Centro de costo) Área*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    employee = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    comercial = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Comercial que atiende*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    linea_tematica = forms.ModelChoiceField(queryset = linea_tematica.objects.filter(activo = True), label = 'Línea temática', empty_label='Escriba y seleccione...', required = False, widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_terminacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de terminación", required = False,
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    financista_mlc = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo=True), required = False, label = 'Financista MLC*', 
            empty_label=None,
            widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    financiamiento_mlc = forms.CharField(required = False, label = 'Financiamiento MLC*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    financista_cup = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo=True), required = False, label = 'Financista CUP*', 
            empty_label=None,
            widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    financiamiento_cup = forms.CharField(required = False, label = 'Financiamiento CUP*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    # fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
    #         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    # descripcion = forms.CharField(required = False, label = 'Descripción', max_length = 500, widget = widgets.Textarea(
    #         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la descripción'}))
    # entidad = forms.ModelChoiceField(queryset = Entity.objects.filter(active = True), required = True, label = 'Entidad*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # archivo = forms.FileField(label = 'Archivo*')    
    # activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
    #         widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))    
    
    class Meta:
        model = registro_aprobacion
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }
        
class registro_terminacion_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(registro_terminacion_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        # self.fields['fecha'].widget.format = ('%Y-%m-%d')

    observaciones = forms.CharField(required = False, label = 'Observaciones', max_length = 250, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
    revisado_por = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_revision = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de revisión*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    verificado_por = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_verificacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de verificación*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    financista_mlc = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Financista MLC*', 
            empty_label='Escriba y seleccione...',
            widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    financiamiento_mlc = forms.CharField(required = True, label = 'Financiamiento MLC*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    financista_cup = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Financista CUP*', 
            empty_label='Escriba y seleccione...',
            widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    financiamiento_cup = forms.CharField(required = True, label = 'Financiamiento CUP*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    aprobado_por = forms.ModelChoiceField(queryset = cliente.objects.filter(activo = True), required = True, label = 'Aprobado por*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    recibido_por_ficha_tecnica = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_ficha_tecnica = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de ficha técnica*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    recibida_por_sosi = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_sosi = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de revisión*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    
    
    
    
    # employee = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # comercial = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Comercial que atiende*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # linea_tematica = forms.ModelChoiceField(queryset = linea_tematica.objects.filter(activo = True), label = 'Línea temática', empty_label='Escriba y seleccione...', required = False, widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # fecha_terminacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), label = "Fecha de terminación", required = False,
    #             widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # financista_mlc = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Financista MLC*', 
    #         empty_label='Escriba y seleccione...',
    #         widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # financiamiento_mlc = forms.FloatField(required = True, label = 'Financiamiento MLC*',
    #             widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    # financista_cup = forms.ModelChoiceField(queryset = fuente_financiamiento.objects.filter(activo = True), required = True, label = 'Financista CUP*', 
    #         empty_label='Escriba y seleccione...',
    #         widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # financiamiento_cup = forms.FloatField(required = True, label = 'Financiamiento CUP*',
    #             widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    # no_sosi = forms.ModelChoiceField(queryset = sosi.objects.filter(activo = True), required = True, label = 'No. SOSI*', 
    #         empty_label='Escriba y seleccione...',
    #         widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
    #         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    # descripcion = forms.CharField(required = False, label = 'Descripción', max_length = 500, widget = widgets.Textarea(
    #         attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la descripción'}))
    # entidad = forms.ModelChoiceField(queryset = Entity.objects.filter(active = True), required = True, label = 'Entidad*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # archivo = forms.FileField(label = 'Archivo*')    
    # activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
    #         widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))    
    
    class Meta:
        model = registro_terminacion
        exclude = ['no_sosi', 'proyecto']
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                "no_ficha_tecnica": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000}),
                # "codigo": widgets.TextInput(attrs={'class': ' form-control', 'value' : get_codigo(),
                #     'placeholder': f'Ej. Código correspondiente {get_codigo()}'}),
        }
        
class registro_extension_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(registro_extension_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        # self.fields['fecha'].widget.format = ('%Y-%m-%d')

    centro_costo = forms.ModelChoiceField(queryset = area.objects.filter(activo = True), required = True, label = '(Centro de costo) Área*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    jefe_proyecto = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    observaciones = forms.CharField(required = False, label = 'Observaciones', max_length = 250, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
    fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_fin = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de fin*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_aprobacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de aprobación*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    
    class Meta:
        model = registro_extension
        exclude = ['activo', 'proyecto']
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }
        
class control_etapa_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(control_etapa_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        # self.fields['fecha'].widget.format = ('%Y-%m-%d')

    realizado_por_requisitos = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_realizado_requisitos = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    revisado_por_requisitos = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_revisado_requisitos = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    aprobado_por_requisitos = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_aprobado_requisitos = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    
    realizado_por_diseno = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_realizado_diseno = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    revisado_por_diseno = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_revisado_diseno = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    aprobado_por_diseno = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_aprobado_diseno = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    
    realizado_por_implementacion = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_realizado_implementacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    revisado_por_implementacion = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_revisado_implementacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    aprobado_por_implementacion = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_aprobado_implementacion = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    
    realizado_por_pruebas = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_realizado_pruebas = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    revisado_por_pruebas = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_revisado_pruebas = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    aprobado_por_pruebas = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = False, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_aprobado_pruebas = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True}))
    
    class Meta:
        model = control_etapa
        exclude = ["employee", "proyecto"]
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }
        
class registro_reinicio_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(registro_reinicio_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        # self.fields['fecha'].widget.format = ('%Y-%m-%d')

    # proyecto = forms.ModelChoiceField(queryset = proyecto.objects.filter(activo = True), required = True, label = 'Proyecto interrumpido*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    fecha_inicio = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de inicio*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_fin = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de fin*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    
    class Meta:
        model = registro_reinicio
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }
        
class registro_interrupcion_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(registro_interrupcion_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        # self.fields['fecha'].widget.format = ('%Y-%m-%d')

    # proyecto = forms.ModelChoiceField(queryset = proyecto.objects.filter(activo = True), required = True, label = 'Proyecto interrumpido*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    propuesto_por = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
                empty_label='Escriba y seleccione...',
                widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    motivo = forms.CharField(required = False, label = 'motivo', max_length = 250, widget = widgets.TextInput(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el motivo'}))
    fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = "Fecha de interrupción*",
                widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    aprobado_por = forms.CharField(required = False, label = 'Aprobado por', max_length = 120, widget = widgets.TextInput(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el aprobador'}))
    # aprobado_por = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Jefe de proyecto*',
    #             empty_label='Escriba y seleccione...',
    #             widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    valor_plan_mlc = forms.CharField(required = True, label = 'Financiamiento Plan MLC*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    valor_plan_cup = forms.CharField(required = True, label = 'Financiamiento Plan CUP*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    valor_real_mlc = forms.CharField(required = True, label = 'Financiamiento Real MLC*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    valor_real_cup = forms.CharField(required = True, label = 'Financiamiento Real CUP*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    ingreso_plan_mlc = forms.CharField(required = True, label = 'Ingreso Plan MLC*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    ingreso_plan_cup = forms.CharField(required = True, label = 'Ingreso Plan CUP*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    ingreso_real_mlc = forms.CharField(required = True, label = 'Ingreso Real MLC*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    ingreso_real_cup = forms.CharField(required = True, label = 'Ingreso Real CUP*',
                widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la cantidad'}))
    
    class Meta:
        model = registro_interrupcion
        exclude = ["proyecto", 'activo', 'financiamiento']
        # fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }
        
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
    archivo = forms.FileField(label = 'Archivo*', required = False)    
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

    # numero = forms.CharField(max_length=6, label="Número de acuerdo*", required=False)
    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
                attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_limite = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha límite', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_cumplimiento = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = False, label = 'Fecha de cumplimiento', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    employee = forms.ModelMultipleChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Responsable(s)*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    observaciones = forms.CharField(required = False, label = 'Observaciones', max_length = 250, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la observación'}))
    estado = forms.ModelChoiceField(queryset = estado_acuerdo.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'})) 
    
    class Meta:
        # def get_no_acuerdo():
        #     try:
        #         ultimo = acuerdo.objects.last()
        #         if ultimo is None:
        #             no_proyecto = 1
        #         else:
        #             try:
        #                 int(ultimo.numero)
        #             except:
        #                 return Exception("Error: No se ha podido obtener el último acuerdo.")
        #             no_proyecto = int(ultimo.__getattribute__('numero')) + 1
        #         return no_proyecto
        #     except:
        #         return HttpResponse("Error en el servidor", status = 500)

        model = acuerdo
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                # "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
                #     'value' : get_ultimo(acuerdo, 'numero')}),
        }
        labels = {
            'employee': 'trabajador',
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
    indicador = forms.ModelMultipleChoiceField(queryset = indicador_objetivos.objects.filter(activo = True), required = True, label = 'Indicadores*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'})) 
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
    # evaluacion = forms.ModelChoiceField(queryset = evaluacion.objects.filter(activo = True), required = True, label = 'Evaluación*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    
    class Meta:
        model = objetivo
            
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                # "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
                #     'value' : get_ultimo(objetivo)}),
        }

#moduloJavier
class entrada_proyecto_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(entrada_proyecto_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.
        self.fields['fecha_entrada'].widget.format = ('%Y-%m-%d')
        self.fields['fecha_salida'].widget.format = ('%Y-%m-%d')

    no = forms.IntegerField(
        required=False,
        initial=calcular_valor_inicial(entrada_proyecto),
        widget=forms.NumberInput(attrs={
            'min': 1,
            'max': 100,
            'step': 1,
            'class': 'form-control',
            'placeholder': 'Introduzca el valor',
        })
    )
    fecha_entrada = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    fecha_salida = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de salida*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    entregado_por = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Entregado por*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    formato = forms.ModelMultipleChoiceField(queryset = formato.objects.filter(activo = True), required = True, label = 'Formato*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    proyecto = forms.ModelChoiceField(queryset = proyecto.objects.filter(activo = True), required = True, label = 'Proyecto*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    dictamen = forms.FileField(label = 'Dictamen técnico', required = False)
    estado = forms.ModelChoiceField(queryset = estado_proyecto_dgca.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
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
        # self.fields['fecha'].widget.format = ('%Y-%m-%d')

    numero_salva = forms.CharField(label = 'Número de salva*', max_length = 10, required = True, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el número de salva'}))
    # proyecto = forms.CharField(widget=forms.HiddenInput())
    
    # fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha de entrada*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    # fecha = forms.DateField(initial=datetime.now().strftime("%d/%m/%Y"), required = True, label = 'Fecha*', widget=forms.widgets.DateInput(attrs={'type': 'date', 'class': 'form-control','append': 'fa fa-calendar', 'icon_toggle': True})) 
    especialista = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Entregado por*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    recibe = forms.ModelChoiceField(queryset = Employee.objects.filter(active = True), required = True, label = 'Entregado por*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    ubicacion_salva = forms.CharField(label = 'Ubicación de la salva', max_length = 10, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la ubicación de la salva'}))
    observaciones = forms.CharField(label = 'Observaciones*', max_length = 150, required = False, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca las observaciones'}))
    archivo = forms.CharField(label = 'Ruta del archivo', required = False, max_length = 150, widget = widgets.Textarea(attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca la dirección del repositorio'}))
    idioma = forms.ModelMultipleChoiceField(queryset = idioma.objects.filter(activo = True), required = False, label = 'Formato*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'})) 
    colectivo = forms.BooleanField(initial = False, label = 'Colectivo de autores*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
    autor_sosi = forms.ModelMultipleChoiceField(queryset = autor_sosi.objects.filter(activo = True), required = False, label = 'Autor', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'})) 
    
    class Meta:
        model = sosi
        fields = ("numero_salva", "especialista", "ubicacion_salva", "observaciones", "archivo", "idioma", "autor", "colectivo")
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
        }

#moduloJavier
#
# CAMBIAR EL NOMBRE A OBJETIVO DE TRABAJO
#
class indicador_objetivo_form(ModelForm):
    def __init__(self, *args, **kwargs):
        super(indicador_objetivo_form, self).__init__(*args, **kwargs)
        # Setting the format of the date field to the format that the datepicker uses.

    nombre = forms.CharField(label = 'Nombre*', max_length = 150, required = True, widget = widgets.Textarea(
                attrs={'class': 'form-control', 'autocomplete': 'on', 'placeholder': 'Introduzca el nombre'}))
    # evaluacion = forms.FloatField(required = True, label = 'Evaluación*', widget = widgets.TextInput(attrs = {'class': 'form-control texto', 'placeholder': 'Introduzca la evaluación'}))
    objetivo = forms.ModelChoiceField(queryset = objetivo.objects.filter(activo = True), required = True, label = 'Objetivo*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    # estado = forms.ModelChoiceField(queryset = estado_indicador_objetivos.objects.filter(activo = True), required = True, label = 'Estado*', empty_label='Escriba y seleccione...', widget = widgets.Select(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    accion = forms.ModelMultipleChoiceField(queryset = accion_indicador_objetivo.objects.filter(activo = True), required = True, label = 'Acción*', widget = widgets.SelectMultiple(attrs = {'class': ' form-control texto select2','autocomplete': 'on'}))
    activo = forms.BooleanField(initial = True, label = 'Activo*', required = False,
            widget = widgets.CheckboxInput(attrs = {'class': ' form-control checkbox'}))
        
    class Meta:
        model = indicador_objetivos
        fields = "__all__"
        widgets = {
                "id": widgets.NumberInput(attrs={'class': ' form-control','min':1,'max':100000}),
                # "no": widgets.NumberInput(attrs={'class': ' form-control', 'min':1, 'max':100000, 
                #     'value' : get_ultimo(indicador_objetivos)}),
        }

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
