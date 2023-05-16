from django import forms
from SISGDDO.models import Afectaciones
from apps.base.models import Country, Entity, LogoEntity, Client, Position, Employee, InfoEmployee, Process, Procedure


class CountryModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Country
        fields = ['name', 'acronym', 'active', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'acronym': forms.TextInput(attrs={"class": "form-control", "placeholder": "Siglas"}),
        }


class EntityModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Entity
        fields = ['name', 'active', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class LogoEntityModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = LogoEntity
        fields = ['logo1', 'logo2', ]


class ClientModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Client
        fields = ['name', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class PositionModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Position
        fields = ['name', 'active', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class EmployeeModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Employee
        fields = ['prefix', 'first_name', 'last_name', 'identification', 'position', 'active', ]
        widgets = {
            'prefix': forms.TextInput(attrs={"class": "form-control", "placeholder": "Categoría científica"}),
            'first_name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'last_name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos"}),
            'identification': forms.TextInput(attrs={"class": "form-control", "placeholder": "Identificación"}),
            'position': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
        }


class InfoEmployeeModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = InfoEmployee
        fields = [
            'is_reserve', 'init_date_reserve', 'finish_date_reserve', 'image_reserve', 'spreadsheet_reserve',
            'is_executive', 'init_date_executive', 'finish_date_executive', 'image_executive', 'spreadsheet_executive',
        ]
        widgets = {
            'init_date_reserve': forms.TextInput(attrs={"class": "form-control", "placeholder": "fecha de inicio como reserva de cuadro"}),
            'finish_date_reserve': forms.TextInput(attrs={"class": "form-control", "placeholder": "fecha de terminación como reserva de cuadro"}),
            'init_date_executive': forms.TextInput(attrs={"class": "form-control", "placeholder": "fecha de inicio como cuadro"}),
            'finish_date_executive': forms.TextInput(attrs={"class": "form-control", "placeholder": "fecha de terminación como cuadro"}),
        }


class ProcessModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Process
        fields = ['name', 'abbreviation', 'responsible', 'edition', 'revision', 'active', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'abbreviation': forms.TextInput(attrs={"class": "form-control", "placeholder": "Código"}),
            'responsible': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'edition': forms.TextInput(attrs={"class": "form-control", "placeholder": "Edición"}),
            'revision': forms.TextInput(attrs={"class": "form-control", "placeholder": "Revisión"}),
        }


class ProcedureModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Procedure
        fields = ['process', 'name', 'abbreviation', 'edition', 'revision', 'file', 'active', ]
        widgets = {
            'process': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'abbreviation': forms.TextInput(attrs={"class": "form-control", "placeholder": "Código"}),
            'edition': forms.TextInput(attrs={"class": "form-control", "placeholder": "Edición"}),
            'revision': forms.TextInput(attrs={"class": "form-control", "placeholder": "Revisión"}),
        }

class AfectationModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Afectaciones
        fields = ['numero', 'fecha_recepcion', 'propuesto', 'responsable', 'mesplaneado', 'fechacierre','observacionesactual','observacionesfutura','estado' ]
        widgets = {
            'numero': forms.NumberInput(attrs={"class": "form-control", "placeholder": "Numero"}),
            'fecha_recepcion': forms.DateInput(attrs={"class": "form-control", "placeholder": "Fecha de Recepción"}),
            'propuesto': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'responsable': forms.Select(attrs={"class": "form-control select3", "prompt": ""}),
            'mesplaneado': forms.DateInput(attrs={"class": "form-control", "placeholder": "Mes Planificado"}),
            'fechacierre': forms.DateInput(attrs={"class": "form-control", "placeholder": "Fecha Cierre"}),
            'observacionesactual': forms.TextInput(attrs={"class": "form-control", "placeholder": "Observacion Actual"}),
            'observacionesfutura': forms.TextInput(attrs={"class": "form-control", "placeholder": "Observacion Futura"}),
            'estado': forms.Select(attrs={"class": "form-control select4", "prompt":"Estado"}),
        }