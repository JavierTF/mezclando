import datetime

from django import forms
from tempus_dominus.widgets import DatePicker
from apps.licenses.models import License


class LicenseModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = License
        fields = ['name', 'entity', 'process', 'grant_date', 'expiration_date', 'responsible', 'associated_process', 'status', 'observation', 'file']
        exclude = ['number', 'created_date', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre Documento"}),
            'entity': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'process': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'status': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'grant_date': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de ortorgamiento"}),
            'expiration_date': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de vecimiento"}),
            'responsible': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'associated_process': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'observation': forms.Textarea(attrs={"class": "form-control", "style": "height: 100px;", "placeholder": "Observación ..."}),
        }
