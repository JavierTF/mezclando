from django import forms
from apps.complaints.models import WayOfReception, Complaint, ComplaintAction


class ReceptionModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = WayOfReception
        fields = ['name', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class ComplaintModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Complaint
        fields = ['reception_date', 'deadline', 'client', 'process', 'way_of_reception', 'reason', 'status']
        exclude = ['number', 'created_date', ]
        widgets = {
            'reception_date': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de recepción"}),
            'deadline': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de cierre"}),
            # 'client': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'client': forms.TextInput(attrs={"class": "form-control", "placeholder": "Cliente"}),
            'process': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'way_of_reception': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'reason': forms.TextInput(attrs={"class": "form-control", "placeholder": "Motivo"}),
            'status': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
        }


class ComplaintActionModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = ComplaintAction
        fields = ['date', 'action']
        widgets = {
            'date': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha"}),
            'action': forms.TextInput(attrs={"class": "form-control", "placeholder": "Acción"}),
        }

    def __init__(self, *args, **kwargs):
        super(ComplaintActionModelForm, self).__init__(*args, **kwargs)
        self.fields['date'].required = False
        self.fields['action'].required = False


class FilterForm(forms.Form):
    range_date = forms.DateField(label='Fecha de inicio', widget=forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de inicio"}))
