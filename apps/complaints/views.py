from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, permission_required
from django.core.files.storage import FileSystemStorage
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.http import JsonResponse, HttpResponse
from django.conf import settings
from django.db.models import Q
from weasyprint import HTML, CSS
import json
import datetime
import os

from apps.base.utils import get_logos, logs
from apps.complaints.models import COMPLAINT_STATUS, WayOfReception, Complaint, ComplaintAction
from apps.complaints.forms import ReceptionModelForm, ComplaintModelForm, ComplaintActionModelForm, FilterForm


@permission_required('complaints.view_wayofreception', login_url=reverse_lazy('inicio'), raise_exception=True)
def ReceptionView(request):
    """
    En esta vista se listan los paises,
    :param request:
    :return: Vista listar para los Paises
    """
    models = WayOfReception.objects.all()
    template_models_list = 'complaints/reception/list.html'

    return render(
        request,
        'complaints/reception/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('complaints.add_wayofreception', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_reception(request):
    form = ReceptionModelForm()

    if request.method == 'POST':
        form = ReceptionModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, WayOfReception, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('complaints:receptions')}})

    return render(request, 'complaints/reception/create.html', {'form': form})


@permission_required('complaints.change_wayofreception', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_reception(request, reception_id):
    instance = get_object_or_404(WayOfReception, pk=reception_id)
    form = ReceptionModelForm(instance=instance)

    if request.method == 'POST':
        form = ReceptionModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, WayOfReception, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('complaints:receptions')}})

    return render(request, 'complaints/reception/update.html', {'instance': instance, 'form': form})


@permission_required('complaints.delete_wayofreception', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_reception(request, reception_id):
    model = get_object_or_404(WayOfReception, pk=reception_id)
    logs(request, WayOfReception, model, 3)
    model.delete()
    return redirect(reverse_lazy('complaints:receptions'))


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def list_complaints(request):
    """
    En esta vista se listan los paises,
    :param request:
    :return: Vista listar para los Paises
    """
    models = Complaint.objects.all()
    template_models_list = 'complaints/complaints/list.html'

    return render(
        request,
        'complaints/complaints/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def detail_complaint(request, complaint_id):
    instance = get_object_or_404(Complaint, pk=complaint_id)
    return render(request, 'complaints/complaints/detail.html', {'instance': instance})


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_complaint(request):
    form = ComplaintModelForm()
    form_action = ComplaintActionModelForm()

    if request.method == 'POST':
        form = ComplaintModelForm(request.POST)
        form_action = ComplaintActionModelForm(request.POST)

        if form.is_valid():
            complaint = form.save()
            logs(request, Complaint, complaint, 1)
            if form_action.is_valid():
                for jsona in request.POST.getlist('actions[]'):
                    action = json.loads(jsona)
                    ComplaintAction.objects.create(complaint_id=complaint.id, date=action['date'], action=action['action'])
            else:
                print(form_action.errors)
            return JsonResponse({'results': {'url': reverse_lazy('complaints:list_complaints')}})
        else:
            print(form.errors)

    return render(request, 'complaints/complaints/create.html', {'form': form, 'form_action': form_action})


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_complaint(request, complaint_id):
    instance = get_object_or_404(Complaint, pk=complaint_id)
    form = ComplaintModelForm(instance=instance)
    form_action = ComplaintActionModelForm()

    if request.method == 'POST':
        form = ComplaintModelForm(instance=instance, data=request.POST)
        form_action = ComplaintActionModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Complaint, instance, 2)
            if form_action.is_valid():
                instance.actions.all().delete()

                for jsona in request.POST.getlist('actions[]'):
                    action = json.loads(jsona)
                    ComplaintAction.objects.create(complaint_id=instance.id, date=action['date'], action=action['action'])
            return JsonResponse({'results': {'url': reverse_lazy('complaints:list_complaints')}})

    return render(request, 'complaints/complaints/update.html', {'instance': instance, 'form': form, 'form_action': form_action})


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_complaint(request, complaint_id):
    model = get_object_or_404(Complaint, pk=complaint_id)
    logs(request, Complaint, model, 1)
    model.delete()
    return redirect(reverse_lazy('complaints:list_complaints'))


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def export_complaints(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        models = Complaint.objects.all()

        if request.GET.get('export_status') and int(request.GET.get('export_status')) != 0:
            models = Complaint.objects.filter(status=request.GET.get('export_status')).distinct()

        html_string = render_to_string('complaints/complaints/export_list.html', {'models': models})
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        html.write_pdf(
            target=os.path.join(uri_tmp, 'Quejas.pdf'),
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
        with fs.open('Quejas.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Quejas.pdf"'
            return response

    return redirect(reverse_lazy('complaints:list_complaints'))


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def export_details_complaints(request, complaint_id):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        model = get_object_or_404(Complaint, pk=complaint_id)
        html_string = render_to_string('complaints/complaints/export_details.html', {'model': model})
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        html.write_pdf(
            target=os.path.join(uri_tmp, 'Quejas.pdf'),
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
        with fs.open('Quejas.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Quejas.pdf"'
            return response

    return redirect(reverse_lazy('complaints:list_complaints'))


def get_actions(request):

    if request.GET.get('complaint_id'):
        instance = get_object_or_404(Complaint, pk=request.GET.get('complaint_id'))
        actions = instance.actions.all().order_by('date')

        actions_json = list()
        for action in actions:
            actions_json.append({"date": action.date, "action": action.action})

        return JsonResponse({'actions': actions_json})

    return JsonResponse({'error': 'Method not Allowed'}, status=405)


@permission_required('complaints.view_complaint', login_url=reverse_lazy('inicio'), raise_exception=True)
def reports_complaints(request):
    """
    En esta vista muestra reportes grśficos de la eficacia de los procesos,
    :param request:
    :return: Vista para graficar la eficacia de los Procesos
    """
    form = FilterForm()

    return render(
        request,
        'complaints/complaints/charts.html',
        {
            'form': form,
        }
    )


def get_chartcomplaint_data(request):
    if request.method == 'GET':
        data = []
        query = Q(pk__gt=0)
        start_year = None
        end_year = None

        if request.GET.get('range'):
            range_date = request.GET.get('range')
            start = range_date.split(' | ')[0]
            end = range_date.split(' | ')[1]
            start_year = int(start.split('-')[0])
            end_year = int(end.split('-')[0])

        if start_year and end_year:
            query = query & Q(created_date__gte=start, created_date__lte=end)

        complaints = Complaint.objects.filter(query).order_by('created_date').distinct()

        data = [{
            "category": status,
            "value": len(complaints.filter(status=number).distinct()) * 100 / len(complaints) if len(complaints) != 0 else 0,
            "amount": len(complaints.filter(status=number).distinct()),
            "full": 100,
        } for number, status in COMPLAINT_STATUS]
        data.reverse()
        return JsonResponse(data, safe=False)

    return JsonResponse({'error': 'Method not Allowed'}, status=405)
