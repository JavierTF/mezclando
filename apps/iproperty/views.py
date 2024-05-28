from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, permission_required
from django.core.files.storage import FileSystemStorage
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.http import JsonResponse, HttpResponse
from django.conf import settings
from django.db.models import Q
from weasyprint import HTML, CSS
import os

from apps.base.utils import get_logos, logs
from apps.iproperty.models import ProductClassification, PatentClassification, FigurativeElementClassification, DrawingClassification, TypeLegalDocument, IndustrialProperty, iPROPERTY_STATUS, iPROPERTY_MODALITY
from apps.iproperty.forms import ProductClassificationModelForm, PatentClassificationModelForm, FigurativeElementClassificationModelForm, DrawingClassificationModelForm, TypeLegalDocumentModelForm, IndustrialPropertyModelForm


# Products

def list_products(request):
    models = ProductClassification.objects.all()
    template_models_list = 'property/products/list.html'

    return render(
        request,
        'property/products/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_products(request):
    form = ProductClassificationModelForm()

    if request.method == 'POST':
        form = ProductClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, ProductClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_products')}})

    return render(request, 'property/products/create.html', {'form': form})



def update_products(request, product_id):
    instance = get_object_or_404(ProductClassification, pk=product_id)
    form = ProductClassificationModelForm(instance=instance)

    if request.method == 'POST':
        form = ProductClassificationModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, ProductClassification, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_products')}})

    return render(request, 'property/products/update.html', {'instance': instance, 'form': form})



def activate_products(request, product_id):
    instance = get_object_or_404(ProductClassification, pk=product_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('iproperty:list_products'))



def delete_products(request, product_id):
    model = get_object_or_404(ProductClassification, pk=product_id)
    logs(request, ProductClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_products'))


# Patents

def list_patents(request):
    models = PatentClassification.objects.all()
    template_models_list = 'property/patents/list.html'

    return render(
        request,
        'property/patents/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_patents(request):
    form = PatentClassificationModelForm()

    if request.method == 'POST':
        form = PatentClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, PatentClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_patents')}})

    return render(request, 'property/patents/create.html', {'form': form})



def update_patents(request, patent_id):
    instance = get_object_or_404(PatentClassification, pk=patent_id)
    form = PatentClassificationModelForm(instance=instance)

    if request.method == 'POST':
        form = PatentClassificationModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, PatentClassification, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_patents')}})

    return render(request, 'property/patents/update.html', {'instance': instance, 'form': form})



def activate_patents(request, patent_id):
    instance = get_object_or_404(PatentClassification, pk=patent_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('iproperty:list_patents'))



def delete_patents(request, patent_id):
    model = get_object_or_404(PatentClassification, pk=patent_id)
    logs(request, PatentClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_patents'))


# FigurativeElements

def list_figurative(request):
    models = FigurativeElementClassification.objects.all()
    template_models_list = 'property/figurative/list.html'

    return render(
        request,
        'property/figurative/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_figurative(request):
    form = FigurativeElementClassificationModelForm()

    if request.method == 'POST':
        form = FigurativeElementClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, FigurativeElementClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_figurative')}})

    return render(request, 'property/figurative/create.html', {'form': form})



def update_figurative(request, figurative_id):
    instance = get_object_or_404(FigurativeElementClassification, pk=figurative_id)
    form = FigurativeElementClassificationModelForm(instance=instance)

    if request.method == 'POST':
        form = FigurativeElementClassificationModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, FigurativeElementClassification, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_figurative')}})

    return render(request, 'property/figurative/update.html', {'instance': instance, 'form': form})



def activate_figurative(request, figurative_id):
    instance = get_object_or_404(FigurativeElementClassification, pk=figurative_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('iproperty:list_figurative'))



def delete_figurative(request, figurative_id):
    model = get_object_or_404(FigurativeElementClassification, pk=figurative_id)
    logs(request, FigurativeElementClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_figurative'))


# Drawings

def list_drawings(request):
    models = DrawingClassification.objects.all()
    template_models_list = 'property/drawings/list.html'

    return render(
        request,
        'property/drawings/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_drawings(request):
    form = DrawingClassificationModelForm()

    if request.method == 'POST':
        form = DrawingClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, DrawingClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_drawings')}})

    return render(request, 'property/drawings/create.html', {'form': form})



def update_drawings(request, drawing_id):
    instance = get_object_or_404(DrawingClassification, pk=drawing_id)
    form = DrawingClassificationModelForm(instance=instance)

    if request.method == 'POST':
        form = DrawingClassificationModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, DrawingClassification, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_drawings')}})

    return render(request, 'property/drawings/update.html', {'instance': instance, 'form': form})



def activate_drawings(request, drawing_id):
    instance = get_object_or_404(DrawingClassification, pk=drawing_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('iproperty:list_drawings'))



def delete_drawings(request, drawing_id):
    model = get_object_or_404(DrawingClassification, pk=drawing_id)
    logs(request, DrawingClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_drawings'))



def list_typelegaldocument(request):
    models = TypeLegalDocument.objects.all()
    template_models_list = 'property/type_legal_document/list.html'

    return render(
        request,
        'property/type_legal_document/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_typelegaldocument(request):
    form = TypeLegalDocumentModelForm()

    if request.method == 'POST':
        form = TypeLegalDocumentModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, TypeLegalDocument, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_typelegaldocument')}})

    return render(request, 'property/type_legal_document/create.html', {'form': form})



def update_typelegaldocument(request, typelegaldocument_id):
    instance = get_object_or_404(TypeLegalDocument, pk=typelegaldocument_id)
    form = TypeLegalDocumentModelForm(instance=instance)

    if request.method == 'POST':
        form = TypeLegalDocumentModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, TypeLegalDocument, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_typelegaldocument')}})

    return render(request, 'property/type_legal_document/update.html', {'instance': instance, 'form': form})



def activate_typelegaldocument(request, typelegaldocument_id):
    instance = get_object_or_404(TypeLegalDocument, pk=typelegaldocument_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('iproperty:list_typelegaldocument'))



def delete_typelegaldocument(request, typelegaldocument_id):
    model = get_object_or_404(TypeLegalDocument, pk=typelegaldocument_id)
    logs(request, TypeLegalDocument, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_typelegaldocument'))


# iProperties

def list_properties(request):
    """
    En esta vista se listan los procesos de eficacias,
    :param request:
    :return: Vista listar para los Procesos de eficacia
    """
    models = IndustrialProperty.objects.all()
    template_models_list = 'property/property/list.html'

    return render(
        request,
        'property/property/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def details_property(request, property_id):
    model = get_object_or_404(IndustrialProperty, pk=property_id)
    return render(request, 'property/property/details.html', {'model': model})



def create_property(request):
    form = IndustrialPropertyModelForm(initial={'country': 1})

    if request.method == 'POST':
        form = IndustrialPropertyModelForm(request.POST, request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, IndustrialProperty, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_properties')}})

    return render(request, 'property/property/create.html', {'form': form})



def update_property(request, property_id):
    instance = get_object_or_404(IndustrialProperty, pk=property_id)
    form = IndustrialPropertyModelForm(instance=instance)

    if request.method == 'POST':
        form = IndustrialPropertyModelForm(instance=instance, data=request.POST, files=request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, IndustrialProperty, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_properties')}})

    return render(request, 'property/property/update.html', {'instance': instance, 'form': form})



def delete_property(request, property_id):
    property = get_object_or_404(IndustrialProperty, pk=property_id)
    logs(request, IndustrialProperty, property, 3)
    property.delete()
    return redirect(reverse_lazy('iproperty:list_properties'))



def export_property(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        models = IndustrialProperty.objects.all()
        filters = Q(pk__gt=0)

        if request.GET.get('export_status') and int(request.GET.get('export_status')) != 0:
            filters = filters & Q(status=request.GET.get('export_status'))

        if request.GET.get('search') and request.GET.get('search') != '':
            filters = filters & \
                    (
                        Q(name__icontains=request.GET.get('search'))
                        | Q(modality__in=[iPROPERTY_MODALITY[j - 1][0] for j in [i for i in dict(iPROPERTY_MODALITY)] if iPROPERTY_MODALITY[j - 1][1] == str(request.GET.get('search')).upper()])
                        | Q(country__name__icontains=request.GET.get('search'))
                        | Q(application_date__icontains=request.GET.get('search'))
                        | Q(application_number__icontains=request.GET.get('search'))
                        | Q(status__in=[iPROPERTY_STATUS[j - 1][0] for j in [i for i in dict(iPROPERTY_STATUS)] if iPROPERTY_STATUS[j - 1][1] == str(request.GET.get('search')).upper()])
                    )

        html_string = render_to_string(
            'property/property/export_list.html',
            {'models': models.filter(filters).distinct(), 'owner': request.user}
        )
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        html.write_pdf(
            target=os.path.join(uri_tmp, 'Propiedades industrial.pdf'),
            zoom=0.75,
            stylesheets=[CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                         CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                         CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                         ],
            presentational_hints=True
        )
        fs = FileSystemStorage(uri_tmp)
        with fs.open('Propiedades industrial.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Propiedades industrial.pdf"'
            return response

    return redirect(reverse_lazy('iproperty:list_properties'))
