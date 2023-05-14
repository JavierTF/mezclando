import datetime
from django import forms
from apps.iproperty.models import ProductClassification, PatentClassification, FigurativeElementClassification, DrawingClassification, IndustrialProperty


class ProductClassificationModelForm(forms.ModelForm):
    number = forms.IntegerField(min_value=0, label='Código', widget=forms.NumberInput(attrs={"class": "form-control", "placeholder": "Código"}))

    required_css_class = 'required'

    class Meta:
        model = ProductClassification
        fields = '__all__'
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class PatentClassificationModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = PatentClassification
        fields = '__all__'
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class FigurativeElementClassificationModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = FigurativeElementClassification
        fields = '__all__'
        widgets = {
            'number': forms.TextInput(attrs={"class": "form-control", "placeholder": "Código"}),
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class DrawingClassificationModelForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = DrawingClassification
        fields = '__all__'
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
        }


class IndustrialPropertyModelForm(forms.ModelForm):
    products = forms.ModelMultipleChoiceField(
        label="Clasificación productos y servicios",
        required=False,
        queryset=ProductClassification.objects.all(),
        widget=forms.SelectMultiple(attrs={"class": "form-control select2", "prompt": ""})
    )
    patents = forms.ModelMultipleChoiceField(
        label="Clasificación internacional de patentes",
        required=False,
        queryset=PatentClassification.objects.all(),
        widget=forms.SelectMultiple(attrs={"class": "form-control select2", "prompt": ""})
    )
    figurative_elements = forms.ModelMultipleChoiceField(
        label="Clasificación internacional de elementos figurativos",
        required=False,
        queryset=FigurativeElementClassification.objects.all(),
        widget=forms.SelectMultiple(attrs={"class": "form-control select2", "prompt": ""})
    )
    drawings = forms.ModelMultipleChoiceField(
        label="Clasificación dibujo y modelos industriales",
        required=False,
        queryset=DrawingClassification.objects.all(),
        widget=forms.SelectMultiple(attrs={"class": "form-control select2", "prompt": ""})
    )

    required_css_class = 'required'

    class Meta:
        model = IndustrialProperty
        fields = ['name', 'modality', 'country', 'products', 'application_date', 'application_number',
                  'patents', 'certificate_number',
                  'figurative_elements', 'type_legal_document', 'drawings',
                  'grant_date', 'expiration_date', 'granted_resolution', 'status', 'observation', 'file']
        exclude = ['number', 'created_date', ]
        widgets = {
            'name': forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre"}),
            'modality': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'country': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'application_date': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de solicitud"}),
            'application_number': forms.TextInput(attrs={"class": "form-control", "placeholder": "Número de solicitud"}),
            'certificate_number': forms.TextInput(attrs={"class": "form-control", "placeholder": "Número de certificado"}),
            'type_legal_document': forms.TextInput(attrs={"class": "form-control", "placeholder": "Tipo de documento legal"}),
            'grant_date': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de otorgamiento"}),
            'expiration_date': forms.TextInput(attrs={"class": "form-control", "placeholder": "Fecha de vencimiento"}),
            'granted_resolution': forms.TextInput(attrs={"class": "form-control", "placeholder": "Concedido por resolución"}),
            'status': forms.Select(attrs={"class": "form-control select2", "prompt": ""}),
            'observation': forms.Textarea(
                attrs={"class": "form-control", "style": "height: 100px;", "placeholder": "Observación ..."}),
        }
