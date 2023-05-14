from django import forms
from apps.base.models import Process, Employee
from apps.effectiveness.models import SEMESTER, year_choices, Indicator, IndicatorMeasurer, Effectiveness


SELECTED = (
    (1, "Procesos"),
    (2, "SIG")
)


class IndicatorModelForm(forms.ModelForm):

    required_css_class = 'required'

    class Meta:
        model = Indicator
        exclude = ['active']
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class IndicatorMeasurerModelForm(forms.ModelForm):
    qualification = forms.IntegerField(min_value=0, max_value=5, label='Calificación', required=False, widget=forms.NumberInput(attrs={"class": "form-control", "placeholder": "Calificación"}))

    class Meta:
        model = IndicatorMeasurer
        exclude = ['indicator']
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class EffectivenessModelForm(forms.Form):
    process = forms.ModelChoiceField(label="Proceso", queryset=Process.objects.all(), widget=forms.Select(attrs={"class": "form-control select2", "prompt": ""}))
    year = forms.ChoiceField(label="Año", choices=year_choices(), widget=forms.Select(attrs={"class": "form-control select2", "prompt": ""}))
    semester = forms.ChoiceField(label="Semestre", choices=SEMESTER, widget=forms.Select(attrs={"class": "form-control select2", "prompt": ""}))

    required_css_class = 'required'

    class Meta:
        model = Effectiveness
        fields = ['process', 'year', 'semester', ]


class UpdateEffectivenessModelForm(forms.Form):
    process = forms.ModelChoiceField(label="Proceso", queryset=Process.objects.all(), widget=forms.Select(attrs={"class": "form-control select2", "prompt": "", "disabled": True}))
    year = forms.ChoiceField(label="Año", choices=year_choices(), widget=forms.Select(attrs={"class": "form-control select2", "prompt": "", "disabled": True}))
    semester = forms.ChoiceField(label="Semestre", choices=SEMESTER, widget=forms.Select(attrs={"class": "form-control select2", "prompt": "", "disabled": True}))

    required_css_class = 'required'

    class Meta:
        model = Effectiveness
        fields = ['process', 'year', 'semester', ]


class FilterForm(forms.Form):
    range_date = forms.DateField(label='Fecha de inicio', widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de inicio"}))
    range_date_1 = forms.DateField(label='Fecha de inicio', widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de inicio"}))
    process = forms.ModelChoiceField(label="Proceso", queryset=Process.objects.all(), widget=forms.Select(attrs={"class": "form-control select2", "prompt": ""}))
    process_1 = forms.ModelChoiceField(label="Proceso", queryset=Process.objects.all(), widget=forms.Select(attrs={"class": "form-control select2", "prompt": ""}))
    selected = forms.ChoiceField(label='', choices=SELECTED, widget=forms.RadioSelect(attrs={"classs": "ui-radio"}))
