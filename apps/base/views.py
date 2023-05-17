from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, permission_required
from django.core.files.storage import FileSystemStorage
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.http import JsonResponse, HttpResponse
from django.conf import settings
from django.contrib import messages
from weasyprint import HTML, CSS
from .utils import get_page_body, get_logos, logs
from .forms import AfectationModelForm
import os
import subprocess
import datetime

from apps.base.models import Country, Entity, LogoEntity, Client, Position, Employee, Process, Procedure
from apps.base.forms import CountryModelForm, EntityModelForm, LogoEntityModelForm, ClientModelForm, PositionModelForm, EmployeeModelForm, InfoEmployeeModelForm, ProcessModelForm, ProcedureModelForm


@permission_required('base.view_country', login_url=reverse_lazy('inicio'), raise_exception=True)
def CountryView(request):
    """
    En esta vista se listan los paises,
    :param request:
    :return: Vista listar para los Paises
    """
    models = Country.objects.all()
    template_models_list = 'base/countries/list.html'

    return render(
        request,
        'base/countries/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('base.add_country', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_country(request):
    form = CountryModelForm()

    if request.method == 'POST':
        form = CountryModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Country, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:countries')}})

    return render(request, 'base/countries/create.html', {'form': form})


@permission_required('base.change_country', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_country(request, country_id):
    instance = get_object_or_404(Country, pk=country_id)
    form = CountryModelForm(instance=instance)

    if request.method == 'POST':
        form = CountryModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Country, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:countries')}})

    return render(request, 'base/countries/update.html', {'instance': instance, 'form': form})


@permission_required('base.delete_country', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_country(request, country_id):
    model = get_object_or_404(Country, pk=country_id)
    logs(request, Country, model, 3)
    model.delete()
    return redirect(reverse_lazy('base:countries'))


@permission_required('base.view_entity', login_url=reverse_lazy('inicio'), raise_exception=True)
def EntityView(request):
    """
    En esta vista se listan los paises,
    :param request:
    :return: Vista listar para los Paises
    """
    models = Entity.objects.all()
    template_models_list = 'base/entities/list.html'

    return render(
        request,
        'base/entities/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('base.add_entity', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_entity(request):
    form = EntityModelForm()

    if request.method == 'POST':
        form = EntityModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Entity, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:entities')}})

    return render(request, 'base/entities/create.html', {'form': form})


@permission_required('base.change_entity', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_entity(request, entity_id):
    instance = get_object_or_404(Entity, pk=entity_id)
    form = EntityModelForm(instance=instance)

    if request.method == 'POST':
        form = EntityModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Entity, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:entities')}})

    return render(request, 'base/entities/update.html', {'instance': instance, 'form': form})


@permission_required('base.delete_entity', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_entity(request, entity_id):
    model = get_object_or_404(Entity, pk=entity_id)
    logs(request, Entity, model, 3)
    model.delete()
    return redirect(reverse_lazy('base:entities'))


@permission_required('base.add_logoentity', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_logoentity(request):
    form = LogoEntityModelForm()

    if request.method == 'POST':
        form = LogoEntityModelForm(data=request.POST, files=request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, LogoEntity, instance, 1)
            return redirect(reverse_lazy('inicio'))

    return render(request, 'base/logo_entity/create.html', {'form': form})


@permission_required('base.view_client', login_url=reverse_lazy('inicio'), raise_exception=True)
def ClientView(request):
    """
    En esta vista se listan los paises,
    :param request:
    :return: Vista listar para los Paises
    """
    models = Client.objects.all()
    template_models_list = 'base/clients/list.html'

    return render(
        request,
        'base/clients/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('base.add_client', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_client(request):
    form = ClientModelForm()

    if request.method == 'POST':
        form = ClientModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Client, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:clients')}})

    return render(request, 'base/clients/create.html', {'form': form})


@permission_required('base.change_client', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_client(request, client_id):
    instance = get_object_or_404(Client, pk=client_id)
    form = ClientModelForm(instance=instance)

    if request.method == 'POST':
        form = ClientModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Client, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:clients')}})

    return render(request, 'base/clients/update.html', {'instance': instance, 'form': form})


@permission_required('base.delete_client', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_client(request, client_id):
    model = get_object_or_404(Client, pk=client_id)
    logs(request, Entity, model, 3)
    model.delete()
    return redirect(reverse_lazy('base:clients'))


@permission_required('base.view_position', login_url=reverse_lazy('inicio'), raise_exception=True)
def PositionView(request):
    """
    En esta vista se listan los cargos,
    :param request:
    :return: Vista listar para los Cargos
    """
    models = Position.objects.all()
    template_models_list = 'base/positions/list.html'

    return render(
        request,
        'base/positions/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('base.add_position', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_position(request):
    form = PositionModelForm()

    if request.method == 'POST':
        form = PositionModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Position, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:positions')}})

    return render(request, 'base/positions/create.html', {'form': form})


@permission_required('base.change_position', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_position(request, position_id):
    instance = get_object_or_404(Position, pk=position_id)
    form = PositionModelForm(instance=instance)

    if request.method == 'POST':
        form = PositionModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Position, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:positions')}})

    return render(request, 'base/positions/update.html', {'instance': instance, 'form': form})


@permission_required('base.delete_position', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_position(request, position_id):
    model = get_object_or_404(Position, pk=position_id)
    logs(request, Entity, model, 1)
    model.delete()
    return redirect(reverse_lazy('base:positions'))


@permission_required('base.view_employee', login_url=reverse_lazy('inicio'), raise_exception=True)
def EmployeeView(request):
    """
    En esta vista se listan los trabajadores,
    :param request:
    :return: Vista listar para los Trabajadores
    """
    models = Employee.objects.all()
    template_models_list = 'base/employees/list.html'

    return render(
        request,
        'base/employees/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('base.add_employee', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_employee(request):
    form = EmployeeModelForm()
    form_info = InfoEmployeeModelForm()

    if request.method == 'POST':
        form = EmployeeModelForm(request.POST)
        form_info = InfoEmployeeModelForm(request.POST, request.FILES)

        if form.is_valid():
            employee = form.save()
            logs(request, Employee, employee, 1)
            if form_info.is_valid():
                info = form_info.save(commit=False)
                info.employee_id = employee.id
                info.save()

            return JsonResponse({'results': {'url': reverse_lazy('base:employees')}})

    return render(request, 'base/employees/create.html', {'form': form, 'form_info': form_info})


@permission_required('base.change_employee', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_employee(request, employee_id):
    instance = get_object_or_404(Employee, pk=employee_id)
    form = EmployeeModelForm(instance=instance)
    if hasattr(instance, 'info'):
        form_info = InfoEmployeeModelForm(instance=instance.info)
    else:
        form_info = InfoEmployeeModelForm()

    if request.method == 'POST':
        form = EmployeeModelForm(instance=instance, data=request.POST)
        if hasattr(instance, 'info'):
            form_info = InfoEmployeeModelForm(instance=instance.info, data=request.POST, files=request.FILES)
        else:
            form_info = InfoEmployeeModelForm(request.POST, request.FILES)

        if form.is_valid():
            employee = form.save()
            logs(request, Employee, employee, 2)
            if form_info.is_valid():
                info = form_info.save(commit=False)
                info.employee_id = employee.id
                info.save()
            return JsonResponse({'results': {'url': reverse_lazy('base:employees')}})

    return render(request, 'base/employees/update.html', {'instance': instance, 'form': form, 'form_info': form_info})


@permission_required('base.delete_employee', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_employee(request, employee_id):
    model = get_object_or_404(Employee, pk=employee_id)
    logs(request, Employee, model, 3)
    model.delete()
    return redirect(reverse_lazy('base:employees'))


@permission_required('base.view_process', login_url=reverse_lazy('inicio'), raise_exception=True)
def ProcessView(request):
    """
    En esta vista se listan los procesos,
    :param request:
    :return: Vista listar para los Procesos
    """
    models = Process.objects.all()
    template_models_list = 'base/processes/list.html'

    if request.GET.get('search'):
        processes = Process.objects.filter(name__icontains=request.GET.get('search')).exclude(id__in=request.GET.getlist('excludes[]'))
        return JsonResponse({"results": [{"id": process.id, "text": process.name} for process in processes]})

    return render(
        request,
        'base/processes/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('base.add_process', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_processes(request):
    form = ProcessModelForm()

    if request.method == 'POST':
        form = ProcessModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Process, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:processes')}})

    return render(request, 'base/processes/create.html', {'form': form})


@permission_required('base.change_process', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_processes(request, process_id):
    instance = get_object_or_404(Process, pk=process_id)
    form = ProcessModelForm(instance=instance)

    if request.method == 'POST':
        form = ProcessModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Process, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:processes')}})

    return render(request, 'base/processes/update.html', {'instance': instance, 'form': form})


@permission_required('base.delete_process', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_processes(request, process_id):
    model = get_object_or_404(Process, pk=process_id)
    logs(request, Process, model, 3)
    model.delete()
    return redirect(reverse_lazy('base:processes'))


@permission_required('base.view_procedure', login_url=reverse_lazy('inicio'), raise_exception=True)
def ProcedureView(request):
    """
    En esta vista se listan los procesos,
    :param request:
    :return: Vista listar para los Procesos
    """
    models = Procedure.objects.all().order_by('process__order', 'process__abbreviation', 'process__name', 'abbreviation', 'name')
    template_models_list = 'base/procedures/list.html'

    return render(
        request,
        'base/procedures/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )


@permission_required('base.add_procedure', login_url=reverse_lazy('inicio'), raise_exception=True)
def create_procedures(request):
    form = ProcedureModelForm()

    if request.method == 'POST':
        form = ProcedureModelForm(request.POST, request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, Procedure, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:procedures')}})

    return render(request, 'base/procedures/create.html', {'form': form})


@permission_required('base.change_procedure', login_url=reverse_lazy('inicio'), raise_exception=True)
def update_procedures(request, procedure_id):
    instance = get_object_or_404(Procedure, pk=procedure_id)
    form = ProcedureModelForm(instance=instance)

    if request.method == 'POST':
        form = ProcedureModelForm(instance=instance, data=request.POST, files=request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, Procedure, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:procedures')}})

    return render(request, 'base/procedures/update.html', {'instance': instance, 'form': form})


@permission_required('base.delete_procedure', login_url=reverse_lazy('inicio'), raise_exception=True)
def delete_procedures(request, procedure_id):
    model = get_object_or_404(Procedure, pk=procedure_id)
    logs(request, Procedure, model, 3)
    model.delete()
    return redirect(reverse_lazy('base:procedures'))


@permission_required('base.view_procedure', login_url=reverse_lazy('inicio'), raise_exception=True)
def export_procedures(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        models = Procedure.objects.all()
        html_string = render_to_string(
            'base/procedures/export_list.html',
            {'models': models, 'owner': request.user, 'date': request.GET.get('export_date')}
        )
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        main_doc = html.render(
            stylesheets=[CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                         CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                         CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                         ],
        )

        main_doc.write_pdf(
            target=os.path.join(uri_tmp, 'Lista Maestra.pdf'),
            zoom=0.75,
        )

        fs = FileSystemStorage(uri_tmp)
        with fs.open('Lista Maestra.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Lista Maestra.pdf"'
            return response

    return redirect(reverse_lazy('base:procedures'))


def export_db(request):
    items = [{
        "date": datetime.datetime.strptime(app.name.split('_')[0], '%Y-%m-%d').date(),
        "file": app.name
    } for app in os.scandir("{path}/db/".format(path=settings.MEDIA_ROOT)) if app.is_file()]

    if request.method == 'POST':
        db = settings.DATABASES['default']
        name = db['NAME']
        user = db['USER']
        password = db['PASSWORD']
        host = db['HOST']
        port = db['PORT']
        filename = '{media_root}/db/{name}'.format(media_root=settings.MEDIA_ROOT, name=datetime.date.today())

        command = "pg_dump -O --dbname=postgresql://{user}:{password}@{host}:{port}/{name} > \"{filename}_SISGDDO.sql\"".format(
            user=user,
            password=password,
            host=host,
            port=port,
            name=name,
            filename=filename
        )

        subprocess.Popen(command, shell=True)

        messages.success(request, "Éxito exportando la base de datos")

        return redirect(reverse_lazy('base:export_db'))

    return render(
        request,
        'base/db/base.html',
        {
            'items': items
        }
    )


def import_db(request, file):
    db = settings.DATABASES['default']
    name = db['NAME']
    user = db['USER']
    password = db['PASSWORD']
    host = db['HOST']
    port = db['PORT']
    filename = '{media_root}/db/{file}'.format(media_root=settings.MEDIA_ROOT, file=file)

    command = "psql -h {host} -p {port} -U {user} --no-password  -d {name} -f \"{filename}\"".format(
        user=user,
        password=password,
        host=host,
        port=port,
        name=name,
        filename=filename
    )

    subprocess.Popen(command, shell=True)

    messages.success(request, "Éxito importando la base de datos")

    return redirect(reverse_lazy('base:export_db'))

def create_afectation(request):
    form = AfectationModelForm()

    if request.method == 'POST':
        form = AfectationModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Afectaciones, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:P01')}})

    return render(request, 'base/P01/createAfectation.html', {'form': form})
