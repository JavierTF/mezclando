from django import forms
from SISGDDO.models import Afectaciones
from apps.base.models import Country, Entity, LogoEntity, Position, ScientificCategory, ProcessClassifier, Employee, InfoEmployee, Process, Procedure


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


class PositionModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Position
        fields = ['name', 'active', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class ScientificCategoryModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = ScientificCategory
        fields = ['name', 'prefix', 'active', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'prefix': forms.TextInput(attrs={"class": "form-control", "placeholder": "Sigla"}),
        }

class ProcessClassifierModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = ProcessClassifier
        fields = ['name', 'active', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }



class EmployeeModelForm(forms.ModelForm):
    position = forms.ModelChoiceField(label="Cargo", queryset=Position.objects.all(), widget=forms.Select(attrs={"class": "form-control select2", "prompt": ""}), required=True)
    
    required_css_class = 'required'

    class Meta:
        model = Employee
        fields = ['scientific_category', 'first_name', 'last_name', 'identification', 'position', 'image', 'active', ]
        widgets = {
            'scientific_category': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'first_name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'last_name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos"}),
            'identification': forms.TextInput(attrs={"class": "form-control", "placeholder": "Identificación"}),
            'image': forms.FileInput(attrs={"accept": "image/*,"}),
            # 'position': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
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
            'image_reserve': forms.FileInput(attrs={"accept": "image/*,"}),
            'spreadsheet_reserve': forms.FileInput(attrs={"accept": "application/pdf,application/msword"}),
            'init_date_executive': forms.TextInput(attrs={"class": "form-control", "placeholder": "fecha de inicio como cuadro"}),
            'finish_date_executive': forms.TextInput(attrs={"class": "form-control", "placeholder": "fecha de terminación como cuadro"}),
            'image_executive': forms.FileInput(attrs={"accept": "image/*,"}),
            'spreadsheet_executive': forms.FileInput(attrs={"accept": "application/pdf,application/msword"}),
        }


class ProcessModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Process
        fields = ['classifier', 'name', 'abbreviation', 'responsible', 'edition', 'revision', 'file', 'active', ]
        widgets = {
            'classifier': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
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
        fields = ['process','abbreviation' ,'name' , 'edition', 'revision', 'file', 'active', ]
        widgets = {
            'process': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'abbreviation': forms.TextInput(attrs={"class": "form-control", "placeholder": "Código"}),
            'edition': forms.TextInput(attrs={"class": "form-control", "placeholder": "Edición"}),
            'revision': forms.TextInput(attrs={"class": "form-control", "placeholder": "Revisión"}),
        }


