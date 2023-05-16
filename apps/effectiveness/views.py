from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import permission_required
from django.core.files.storage import FileSystemStorage
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.http import JsonResponse, HttpResponse
from django.conf import settings
from django.db.models import Q
from weasyprint import HTML, CSS
import os
import datetime
import json

from apps.base.models import Process
from apps.base.utils import get_logos, logs
from apps.effectiveness.models import Indicator, IndicatorMeasurer, Effectiveness, EffectivenessSemester, \
    SemesterMeasurer
from apps.effectiveness.forms import IndicatorModelForm, IndicatorMeasurerModelForm, EffectivenessModelForm, UpdateEffectivenessModelForm, FilterForm
from apps.effectiveness.utils import get_year_effectiveness, get_total_evaluation


@permission_required('effectiveness.view_indicator', login_url=reverse_lazy('inicio'), raise_exception=True)
def list_indicator(request):
    """
    En esta vista se listan los indicadores,
    :param request:
    :return: Vista listar para los Indicadores
    """
    models = Indicator.objects.all()
    template_models_list = 'effectiveness/indicators/list.html'

    if request.GET.get('search'):
        indicators = Indicator.objects.filter(name__icontains=request.GET.get('search')).exclude(id__in=request.GET.getlist('excludes[]')) if request.GET.get('search') != '__all__' else Indicator.objects.all().exclude(id__in=request.GET.getlist('excludes[]'))
        return JsonResponse({"results": [{"id": indicator.id, "text": indicator.name} for indicator in indicators]})

    return render(
        request,
        'effectiveness/indicators/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('effectiveness.add_indicator', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_indicator(request):
    form = IndicatorModelForm()
    form_measurer = IndicatorMeasurerModelForm(prefix='measurer')

    if request.method == 'POST':
        form = IndicatorModelForm(request.POST)
        form_measurer = IndicatorMeasurerModelForm(request.POST)

        if form.is_valid():
            indicator = form.save()
            logs(request, Indicator, indicator, 1)
            if form_measurer.is_valid():
                for jsonm in request.POST.getlist('measurers[]'):
                    measurer = json.loads(jsonm)
                    IndicatorMeasurer.objects.create(indicator_id=indicator.id, name=measurer['name'], qualification=measurer['qualification'])
            form.save()
            return JsonResponse({'results': {'url': reverse_lazy('effectiveness:indicators')}})

    return render(request, 'effectiveness/indicators/create.html', {'form': form, 'form_measurer': form_measurer})


@permission_required('effectiveness.change_indicator', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_indicator(request, indicator_id):
    instance = get_object_or_404(Indicator, pk=indicator_id)
    form = IndicatorModelForm(instance=instance)
    form_measurer = IndicatorMeasurerModelForm(prefix='measurer')

    if request.method == 'POST':
        form = IndicatorModelForm(instance=instance, data=request.POST)
        form_measurer = IndicatorMeasurerModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Indicator, instance, 2)
            if form_measurer.is_valid():
                instance.objectives.all().delete()

                for jsonm in request.POST.getlist('measurers[]'):
                    measurer = json.loads(jsonm)
                    IndicatorMeasurer.objects.create(indicator_id=instance.id, name=measurer['name'], qualification=measurer['qualification'])
            return JsonResponse({'results': {'url': reverse_lazy('effectiveness:indicators')}})

    return render(request, 'effectiveness/indicators/update.html', {'instance': instance, 'form': form, 'form_measurer': form_measurer})


@permission_required('effectiveness.delete_indicator', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_indicator(request, indicator_id):
    model = get_object_or_404(Indicator, pk=indicator_id)
    logs(request, Indicator, model, 3)
    model.delete()
    return redirect(reverse_lazy('effectiveness:indicators'))


# Effectiveness
@permission_required('effectiveness.view_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def list_effectiveness(request):
    """
    En esta vista se listan los procesos de eficacias,
    :param request:
    :return: Vista listar para los Procesos de eficacia
    """
    models = Effectiveness.objects.all()
    template_models_list = 'effectiveness/effectiveness/list.html'

    return render(
        request,
        'effectiveness/effectiveness/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('effectiveness.view_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def details_effectiveness(request, effectiveness_id):
    model = get_object_or_404(Effectiveness, pk=effectiveness_id)
    return render(request, 'effectiveness/effectiveness/details.html', {'model': model})


@permission_required('effectiveness.add_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_effectiveness(request):
    form = EffectivenessModelForm(initial={"year": datetime.date.today().year})  # initial={"is_foreign": True}

    if request.method == 'POST':
        process = request.POST.get('process')
        year = request.POST.get('year')
        semester = request.POST.get('semester')
        measurers = request.POST.getlist('measurers[]')

        effectiveness = Effectiveness.objects.get_or_create(process_id=process, year=year, defaults={})[0]
        logs(request, Effectiveness, effectiveness, 1)

        effectiveness_semester = EffectivenessSemester.objects.create(effectiveness_id=effectiveness.id, semester=semester)
        for measurer in measurers:
            SemesterMeasurer.objects.create(semester_id=effectiveness_semester.id, measurer_id=measurer)
        return JsonResponse({'results': {'url': reverse_lazy('effectiveness:list_effectiveness')}})

    return render(request, 'effectiveness/effectiveness/create.html', {'form': form})


@permission_required('effectiveness.add_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_semester(request, effectiveness_id, semester):
    effectiveness = get_object_or_404(Effectiveness, pk=effectiveness_id)
    semester_id = semester

    form = UpdateEffectivenessModelForm(initial={
        "process": effectiveness.process,
        "year": effectiveness.year,
        "semester": semester_id,
    })

    if request.method == 'POST':
        measurers = request.POST.getlist('measurers[]')

        effectiveness_semester = EffectivenessSemester.objects.create(effectiveness_id=effectiveness.id, semester=semester)
        logs(request, EffectivenessSemester, effectiveness_semester, 1)

        for measurer in measurers:
            SemesterMeasurer.objects.create(semester_id=effectiveness_semester.id, measurer_id=measurer)
        return JsonResponse({'results': {'url': reverse_lazy('effectiveness:details_effectiveness', kwargs={'effectiveness_id': effectiveness.id})}})

    return render(request, 'effectiveness/effectiveness/create_semester.html', {'instance': effectiveness, 'semester': semester, 'form': form})


@permission_required('effectiveness.change_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def clone_semester(request, effectiveness_id, semester):
    instance = get_object_or_404(Effectiveness, pk=effectiveness_id)
    original_semester = instance.semesters.get(semester=semester)
    indicators = original_semester.indicators.all()

    effectiveness_semester = EffectivenessSemester.objects.create(effectiveness_id=instance.id, semester=2)
    for indicator in indicators:
        SemesterMeasurer.objects.create(semester_id=effectiveness_semester.id, measurer_id=indicator.measurer.id)

    # form = UpdateEffectivenessModelForm(initial={
    #     "process": instance.process,
    #     "year": instance.year,
    #     "semester": effectiveness_semester.semester,
    # })

    # return redirect(reverse_lazy('effectiveness:update_effectiveness', kwargs={'effectiveness_id': effectiveness_id, 'semester': effectiveness_semester.semester}))
    return redirect(reverse_lazy('effectiveness:details_effectiveness', kwargs={'effectiveness_id': effectiveness_id}))


@permission_required('effectiveness.delete_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_semester(request, effectiveness_id, semester_id):
    effectiveness_semester = get_object_or_404(EffectivenessSemester, pk=semester_id)
    logs(request, EffectivenessSemester, effectiveness_semester, 1)
    effectiveness_semester.delete()
    return redirect(reverse_lazy('effectiveness:details_effectiveness', kwargs={'effectiveness_id': effectiveness_id}))


@permission_required('effectiveness.change_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_effectiveness(request, effectiveness_id, semester):
    instance = get_object_or_404(Effectiveness, pk=effectiveness_id)
    effectiveness_semester = instance.semesters.get(semester=semester)

    form = UpdateEffectivenessModelForm(initial={
        "process": instance.process,
        "year": instance.year,
        "semester": effectiveness_semester.semester,
    })

    if request.method == 'POST':
        logs(request, Effectiveness, instance, 2)

        measurers = request.POST.getlist('measurers[]')
        effectiveness_semester.indicators.all().delete()

        for measurer in measurers:
            SemesterMeasurer.objects.create(semester_id=effectiveness_semester.id, measurer_id=measurer)
        return JsonResponse({'results': {'url': reverse_lazy('effectiveness:details_effectiveness', kwargs={'effectiveness_id': instance.id})}})

    return render(request, 'effectiveness/effectiveness/update.html', {'instance': instance, 'semester': effectiveness_semester, 'form': form})


@permission_required('effectiveness.delete_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_effectiveness(request, effectiveness_id):
    effectiveness = get_object_or_404(Effectiveness, pk=effectiveness_id)
    logs(request, Effectiveness, effectiveness, 3)
    effectiveness.delete()
    return redirect(reverse_lazy('effectiveness:list_effectiveness'))


@permission_required('effectiveness.view_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def export_effectiveness(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        models = Effectiveness.objects.all()
        html_string = render_to_string('effectiveness/effectiveness/export_list.html', {'models': models})
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        html.write_pdf(
            target=os.path.join(uri_tmp, 'Eficacia.pdf'),
            zoom=0.75,
            stylesheets=[CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'), CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                         CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                         ],
            presentational_hints=True
        )
        fs = FileSystemStorage(uri_tmp)
        with fs.open('Eficacia.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Eficacia.pdf"'
            return response

    return redirect(reverse_lazy('effectiveness:list_effectiveness'))


@permission_required('effectiveness.view_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def export_details_effectiveness(request, effectiveness_id):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        model = get_object_or_404(Effectiveness, pk=effectiveness_id)
        html_string = render_to_string('effectiveness/effectiveness/export_details.html', {'model': model})
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        html.write_pdf(
            target=os.path.join(uri_tmp, 'Eficacia.pdf'),
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
        with fs.open('Eficacia.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Eficacia.pdf"'
            return response

    return redirect(reverse_lazy('effectiveness:list_effectiveness'))


@permission_required('effectiveness.view_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def tableall_effectiveness(request):
    """
        En esta vista se listan los procesos de eficacias,
        :param request:
        :return: Vista listar para los Procesos de eficacia
        """
    models = Effectiveness.objects.all()
    processes = Process.objects.all().exclude(abbreviation='M').exclude(abbreviation='P')
    template_models_list = 'effectiveness/effectiveness/list_all.html'

    return render(
        request,
        'effectiveness/effectiveness/base_all.html',
        {
            'template_models_list': template_models_list,
            'processes': processes,
            'years': get_year_effectiveness()
        }
    )


@permission_required('effectiveness.view_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def exportall_effectiveness(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        processes = Process.objects.all().exclude(abbreviation='M').exclude(abbreviation='P')
        html_string = render_to_string('effectiveness/effectiveness/export_listall.html', {'processes': processes, 'years': get_year_effectiveness()})
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        html.write_pdf(
            target=os.path.join(uri_tmp, 'Eficacia del Sistema.pdf'),
            zoom=0.75,
            stylesheets=[CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'), CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                         CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                         ],
            presentational_hints=True
        )
        fs = FileSystemStorage(uri_tmp)
        with fs.open('Eficacia del Sistema.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Eficacia del Sistema.pdf"'
            return response

    return redirect(reverse_lazy('effectiveness:list_effectiveness'))


@permission_required('effectiveness.view_effectiveness', login_url=reverse_lazy('inicio'), raise_exception=True)
def reports_effectiveness(request):
    """
    En esta vista muestra reportes grśficos de la eficacia de los procesos,
    :param request:
    :return: Vista para graficar la eficacia de los Procesos
    """
    form = FilterForm(initial={'process': 1})

    return render(
        request,
        'effectiveness/effectiveness/charts.html',
        {
            'form': form,
        }
    )


# Helper functions
def get_measurers(request):
    if request.GET.get('indicator_id'):
        measurers = IndicatorMeasurer.objects.filter(indicator_id=request.GET['indicator_id'])
        return JsonResponse({"results": [{"id": measurer.id, "text": measurer.name, "qualification": measurer.qualification} for measurer in measurers]})

    return JsonResponse({'error': 'Method not Allowed'}, status=405)


def verify_semester(request):
    if request.GET.get('process_id') and request.GET.get('year') and request.GET.get('semester'):
        verify = EffectivenessSemester.objects.filter(
            effectiveness__process_id=request.GET.get('process_id'),
            effectiveness__year=request.GET.get('year'),
            semester=request.GET.get('semester')
        ).exists()
        return JsonResponse({'verify': verify})

    return JsonResponse({'error': 'Method not Allowed'}, status=405)


def get_indicators(request):

    if request.GET.get('effectiveness_id') and request.GET.get('effectiveness_id'):
        instance = get_object_or_404(Effectiveness, pk=request.GET.get('effectiveness_id'))
        effectiveness_semester = instance.semesters.get(semester=request.GET.get('semester'))

        indicators = list()
        for indicator in effectiveness_semester.indicators.all():
            indicators.append({"indicator": indicator.measurer.indicator.id, "measurer": indicator.measurer.id})

        return JsonResponse({'indicators': indicators})

    return JsonResponse({'error': 'Method not Allowed'}, status=405)


def get_chartprocess_data(request):

    if request.method == 'GET':
        data = []
        query = Q(pk__gt=0)
        process = None
        start_year = None
        end_year = None

        if request.GET.get('range'):
            range_date = request.GET.get('range')
            start = range_date.split(' | ')[0]
            end = range_date.split(' | ')[1]
            start_year = int(start.split('-')[0])
            end_year = int(end.split('-')[0])

        if request.GET.get('process'):
            process = Process.objects.get(pk=request.GET.get('process'))

        if start_year and end_year:
            query = query & Q(year__gte=start_year, year__lte=end_year)
        if process:
            query = query & Q(process_id=process.id)
        effectiveness = Effectiveness.objects.filter(query).order_by('year').distinct()
        data = [{
            "year": str(effect.year),
            "expenses": f"{effect.total_evaluation_by_semester(1):.2f}",
            "income": f"{effect.total_evaluation_by_semester(2):.2f}"
        } for effect in effectiveness]
        return JsonResponse(data, safe=False)

    return JsonResponse({'error': 'Method not Allowed'}, status=405)


def get_chartprocess_teacher_data(request):

    if request.method == 'GET':
        query = Q(pk__gt=0)
        process = None
        start_year = None
        end_year = None

        if request.GET.get('range'):
            range_date = request.GET.get('range')
            start = range_date.split(' | ')[0]
            end = range_date.split(' | ')[1]
            start_year = int(start.split('-')[0])
            end_year = int(end.split('-')[0])

        if request.GET.get('process'):
            process = Process.objects.get(pk=request.GET.get('process'))

        if start_year and end_year:
            query = query & Q(year__gte=start_year, year__lte=end_year)
        if process:
            query = query & Q(process_id=process.id)
        effectiveness = Effectiveness.objects.filter(query).order_by('year').distinct()

        data = get_total_evaluation(effectiveness)

        return JsonResponse(data, safe=False)

    return JsonResponse({'error': 'Method not Allowed'}, status=405)
