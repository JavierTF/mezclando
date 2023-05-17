from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, permission_required
from django.urls import reverse_lazy
from django.http import JsonResponse, HttpResponse

from apps.base.utils import logs
from apps.iproperty.models import ProductClassification, PatentClassification, FigurativeElementClassification, DrawingClassification, IndustrialProperty
from apps.iproperty.forms import ProductClassificationModelForm, PatentClassificationModelForm, FigurativeElementClassificationModelForm, DrawingClassificationModelForm, IndustrialPropertyModelForm


# Products
@permission_required('iproperty.view_productclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.add_productclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_products(request):
    form = ProductClassificationModelForm()

    if request.method == 'POST':
        form = ProductClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, ProductClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_products')}})

    return render(request, 'property/products/create.html', {'form': form})


@permission_required('iproperty.change_productclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.delete_productclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_products(request, product_id):
    model = get_object_or_404(ProductClassification, pk=product_id)
    logs(request, ProductClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_products'))


# Patents
@permission_required('iproperty.view_patentclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.add_patentclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_patents(request):
    form = PatentClassificationModelForm()

    if request.method == 'POST':
        form = PatentClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, PatentClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_patents')}})

    return render(request, 'property/patents/create.html', {'form': form})


@permission_required('iproperty.change_patentclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.delete_patentclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_patents(request, patent_id):
    model = get_object_or_404(PatentClassification, pk=patent_id)
    logs(request, PatentClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_patents'))


# FigurativeElements
@permission_required('iproperty.view_figurativeelementclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.add_figurativeelementclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_figurative(request):
    form = FigurativeElementClassificationModelForm()

    if request.method == 'POST':
        form = FigurativeElementClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, FigurativeElementClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_figurative')}})

    return render(request, 'property/figurative/create.html', {'form': form})


@permission_required('iproperty.change_figurativeelementclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.delete_figurativeelementclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_figurative(request, figurative_id):
    model = get_object_or_404(FigurativeElementClassification, pk=figurative_id)
    logs(request, FigurativeElementClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_figurative'))


# Drawings
@permission_required('iproperty.view_drawingclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.add_drawingclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_drawings(request):
    form = DrawingClassificationModelForm()

    if request.method == 'POST':
        form = DrawingClassificationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, DrawingClassification, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_drawings')}})

    return render(request, 'property/drawings/create.html', {'form': form})


@permission_required('iproperty.change_drawingclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.delete_drawingclassification', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_drawings(request, drawing_id):
    model = get_object_or_404(DrawingClassification, pk=drawing_id)
    logs(request, DrawingClassification, model, 3)
    model.delete()
    return redirect(reverse_lazy('iproperty:list_drawings'))


# iProperties
@permission_required('iproperty.view_industrialproperty', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.view_industrialproperty', login_url=reverse_lazy('inicio'), raise_exception=True)
def details_property(request, property_id):
    model = get_object_or_404(IndustrialProperty, pk=property_id)
    return render(request, 'property/property/details.html', {'model': model})


@permission_required('iproperty.add_industrialproperty', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_property(request):
    form = IndustrialPropertyModelForm(initial={'country': 1})

    if request.method == 'POST':
        form = IndustrialPropertyModelForm(request.POST, request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, IndustrialProperty, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('iproperty:list_properties')}})

    return render(request, 'property/property/create.html', {'form': form})


@permission_required('iproperty.change_industrialproperty', login_url=reverse_lazy('inicio'), raise_exception=True)
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


@permission_required('iproperty.delete_industrialproperty', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_property(request, property_id):
    property = get_object_or_404(IndustrialProperty, pk=property_id)
    logs(request, IndustrialProperty, property, 3)
    property.delete()
    return redirect(reverse_lazy('iproperty:list_properties'))
