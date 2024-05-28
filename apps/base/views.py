from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required, permission_required
from django.core.files.storage import FileSystemStorage
from django.template.loader import render_to_string
from django.urls import reverse_lazy
from django.http import JsonResponse, HttpResponse
from django.conf import settings
from django.db.models import Q
from django.contrib import messages
from weasyprint import HTML, CSS
from .utils import get_page_body, get_logos, logs
import os
import subprocess
import datetime

from apps.base.models import Country, Entity, LogoEntity, Position, ScientificCategory, ProcessClassifier, Employee, Process, Procedure
from apps.base.forms import CountryModelForm, EntityModelForm, LogoEntityModelForm, PositionModelForm, ScientificCategoryModelForm, ProcessClassifierModelForm, EmployeeModelForm, InfoEmployeeModelForm, ProcessModelForm, ProcedureModelForm



def CountryView(request):
    """
    En esta vista se listan los paises,
    :param request:
    :return: Vista listar para los Paises
    """
    models = Country.objects.filter(active=True)
    template_models_list = 'base/countries/list.html'

    return render(
        request,
        'base/countries/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_country(request):
    form = CountryModelForm()

    if request.method == 'POST':
        form = CountryModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Country, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:countries')}})

    return render(request, 'base/countries/create.html', {'form': form})



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



def activate_country(request, country_id):
    instance = get_object_or_404(Country, pk=country_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('base:countries'))



def delete_country(request, country_id):
    model = get_object_or_404(Country, pk=country_id)
    logs(request, Country, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:countries'))



def EntityView(request):
    """
    En esta vista se listan los paises,
    :param request:
    :return: Vista listar para los Paises
    """
    models = Entity.objects.filter(active=True).order_by('name')
    template_models_list = 'base/entities/list.html'
    return render(
        request,
        'base/entities/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_entity(request):
    form = EntityModelForm()

    if request.method == 'POST':
        form = EntityModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Entity, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:entities')}})

    return render(request, 'base/entities/create.html', {'form': form})



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



def activate_entity(request, entity_id):
    instance = get_object_or_404(Entity, pk=entity_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('base:entities'))



def delete_entity(request, entity_id):
    model = get_object_or_404(Entity, pk=entity_id)
    logs(request, Entity, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:entities'))



def create_logoentity(request):
    form = LogoEntityModelForm()

    if request.method == 'POST':
        form = LogoEntityModelForm(data=request.POST, files=request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, LogoEntity, instance, 1)
            return redirect(reverse_lazy('inicio'))

    return render(request, 'base/logo_entity/create.html', {'form': form})



def PositionView(request):
    """
    En esta vista se listan los cargos,
    :param request:
    :return: Vista listar para los Cargos
    """
    models = Position.objects.filter(active=True)
    template_models_list = 'base/positions/list.html'

    return render(
        request,
        'base/positions/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_position(request):
    form = PositionModelForm()

    if request.method == 'POST':
        form = PositionModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Position, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:positions')}})
        else:
            return JsonResponse({'results': {'errors': form.errors}})

    return render(request, 'base/positions/create.html', {'form': form})



def update_position(request, position_id):
    instance = get_object_or_404(Position, pk=position_id)
    form = PositionModelForm(instance=instance)

    if request.method == 'POST':
        form = PositionModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, Position, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:positions')}})
        else:
            return JsonResponse({'results': {'errors': form.errors}})

    return render(request, 'base/positions/update.html', {'instance': instance, 'form': form})



def activate_position(request, position_id):
    instance = get_object_or_404(Position, pk=position_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('base:positions'))



def delete_position(request, position_id):
    model = get_object_or_404(Position, pk=position_id)
    logs(request, Position, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:positions'))



def ScientificCategoriesView(request):
    """
    En esta vista se listan las categorías científicas,
    :param request:
    :return: Vista listar para las categorías científicas
    """
    models = ScientificCategory.objects.filter(active=True)
    template_models_list = 'base/scientific_categories/list.html'

    return render(
        request,
        'base/scientific_categories/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_scientific_category(request):
    form = ScientificCategoryModelForm()

    if request.method == 'POST':
        form = ScientificCategoryModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, ScientificCategory, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:scientific_categories')}})

    return render(request, 'base/scientific_categories/create.html', {'form': form})



def update_scientific_category(request, scientific_category_id):
    instance = get_object_or_404(ScientificCategory, pk=scientific_category_id)
    form = ScientificCategoryModelForm(instance=instance)

    if request.method == 'POST':
        form = ScientificCategoryModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, ScientificCategory, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:scientific_categories')}})

    return render(request, 'base/scientific_categories/update.html', {'instance': instance, 'form': form})



def activate_scientific_category(request, scientific_category_id):
    instance = get_object_or_404(ScientificCategory, pk=scientific_category_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('base:scientific_categories'))



def delete_scientific_category(request, scientific_category_id):
    model = get_object_or_404(ScientificCategory, pk=scientific_category_id)
    logs(request, ScientificCategory, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:scientific_categories'))



def ProcessesClassifierView(request):
    """
    En esta vista se listan los clasificadores de proceso,
    :param request:
    :return: Vista listar para llos clasificadores de proceso
    """
    models = ProcessClassifier.objects.filter(active=True)
    template_models_list = 'base/processes_classifier/list.html'
    return render(
        request,
        'base/processes_classifier/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_process_classifier(request):
    form = ProcessClassifierModelForm()

    if request.method == 'POST':
        form = ProcessClassifierModelForm(request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, ProcessClassifier, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:processes_classifier')}})

    return render(request, 'base/processes_classifier/create.html', {'form': form})



def update_process_classifier(request, process_classifier_id):
    instance = get_object_or_404(ProcessClassifier, pk=process_classifier_id)
    form = ProcessClassifierModelForm(instance=instance)

    if request.method == 'POST':
        form = ProcessClassifierModelForm(instance=instance, data=request.POST)

        if form.is_valid():
            instance = form.save()
            logs(request, ProcessClassifier, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:processes_classifier')}})

    return render(request, 'base/processes_classifier/update.html', {'instance': instance, 'form': form})



def activate_process_classifier(request, process_classifier_id):
    instance = get_object_or_404(ProcessClassifier, pk=process_classifier_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('base:processes_classifier'))



def delete_process_classifier(request, process_classifier_id):
    model = get_object_or_404(ProcessClassifier, pk=process_classifier_id)
    logs(request, ProcessClassifier, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:processes_classifier'))




def EmployeeView(request):
    """
    En esta vista se listan los trabajadores,
    :param request:
    :return: Vista listar para los Trabajadores
    """
    models = Employee.objects.filter(active=True)
    template_models_list = 'base/employees/list.html'
    return render(
        request,
        'base/employees/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def detail_employee(request, employee_id):
    instance = get_object_or_404(Employee, pk=employee_id)
    return render(request, 'base/employees/detail.html', {'instance': instance})



def create_employee(request):
    form = EmployeeModelForm()
    form_info = InfoEmployeeModelForm()

    if request.method == 'POST':
        form = EmployeeModelForm(request.POST, request.FILES)
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



def update_employee(request, employee_id):
    instance = get_object_or_404(Employee, pk=employee_id)
    form = EmployeeModelForm(instance=instance)
    if hasattr(instance, 'info'):
        form_info = InfoEmployeeModelForm(instance=instance.info)
    else:
        form_info = InfoEmployeeModelForm()

    if request.method == 'POST':
        form = EmployeeModelForm(instance=instance, data=request.POST, files=request.FILES)
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



def activate_employee(request, employee_id):
    instance = get_object_or_404(Employee, pk=employee_id)
    instance.active = True if request.POST.get('activate') == "on" else False
    instance.save()
    return redirect(reverse_lazy('base:employees'))



def delete_employee(request, employee_id):
    model = get_object_or_404(Employee, pk=employee_id)
    logs(request, Employee, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:employees'))



def export_employee(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        models = Employee.objects.all()
        filters = Q(pk__gt=0)

        if request.GET.get('export_status') and int(request.GET.get('export_status')) != 0:
            filters = filters & Q(status=request.GET.get('export_status'))

        if request.GET.get('search') and request.GET.get('search') != '':
            filters = filters & \
                    (
                        Q(first_name__icontains=request.GET.get('search'))
                        | Q(last_name__icontains=request.GET.get('search'))
                        | Q(identification__icontains=request.GET.get('search'))
                        | Q(position__name__icontains=request.GET.get('search'))
                    )

        html_string = render_to_string(
            'base/employees/export_list.html',
            {'models': models.filter(filters).distinct(), 'owner': request.user, 'date': datetime.date.today()}
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
            target=os.path.join(uri_tmp, 'Lista de Trabajadores.pdf'),
            zoom=0.75,
        )

        fs = FileSystemStorage(uri_tmp)
        with fs.open('Lista de Trabajadores.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Lista de Trabajadores.pdf"'
            return response

    return redirect(reverse_lazy('base:employees'))



def export_details_employee(request, employee_id):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        model = get_object_or_404(Employee, pk=employee_id)
        image = model.image
        html_string = render_to_string('base/employees/export_details.html', {'model': model})
        html = HTML(string=html_string, base_url=request.build_absolute_uri())
        uri_tmp = os.path.join(settings.MEDIA_ROOT, 'tmp')
        html.write_pdf(
            target=os.path.join(uri_tmp, 'Trabajadores.pdf'),
            zoom=0.75,
            stylesheets=[CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/styles.css'),
                         CSS(settings.STATICFILES_DIRS[0] + '/base/css/pdf/style.bundle.pdf.css'),
                         CSS(string=".logo-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo1.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 28rem;height: 12rem; opacity: 0.75;} .logo1-header-container {width: 50% !important;background-image: url(" + request.build_absolute_uri(
                             logo2.url or '') + ");background-position: right top;background-repeat: no-repeat;background-size: 8rem;height: 12rem; opacity: 0.75;}"),
                         CSS(string=".image-employee-container {width: 15% !important;background-image: url(" + request.build_absolute_uri(
                             image.url or '') + ");background-position: left top;background-repeat: no-repeat;background-size: 8rem;height: 12rem;}")
                        ],
            presentational_hints=True
        )
        fs = FileSystemStorage(uri_tmp)
        with fs.open('Trabajadores.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = 'attachment; filename="Trabajadores.pdf"'
            return response

    return redirect(reverse_lazy('base:employees'))


def validate_employee(request):
    if request.method == 'GET':
        query = Employee.objects.filter(identification=request.GET.get('identification'))
        id = request.GET.get('id')
        
        if id:
            query = query.exclude(pk=id)

        return JsonResponse({'exists': query.exists() })



def ProcessView(request):
    """
    En esta vista se listan los procesos,
    :param request:
    :return: Vista listar para los Procesos
    """
    models = Process.objects.filter(active=True)
    template_models_list = 'base/processes/list.html'
    if request.GET.getlist('excludes[]'):
        processes = Process.objects.filter(name__icontains=request.GET.get('search')).exclude(id__in=request.GET.getlist('excludes[]')) if request.GET.get('search') else Process.objects.all().exclude(id__in=request.GET.getlist('excludes[]'))
        return JsonResponse({"results": [{"id": process.id, "text": process.name} for process in processes]})

    return render(
        request,
        'base/processes/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_processes(request):
    form = ProcessModelForm()

    if request.method == 'POST':
        form = ProcessModelForm(request.POST, request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, Process, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:processes')}})

    return render(request, 'base/processes/create.html', {'form': form})



def update_processes(request, process_id):
    instance = get_object_or_404(Process, pk=process_id)
    form = ProcessModelForm(instance=instance)

    if request.method == 'POST':
        form = ProcessModelForm(instance=instance, data=request.POST, files=request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, Process, instance, 2)
            return JsonResponse({'results': {'url': reverse_lazy('base:processes')}})

    return render(request, 'base/processes/update.html', {'instance': instance, 'form': form})



def delete_processes(request, process_id):
    model = get_object_or_404(Process, pk=process_id)
    logs(request, Process, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:processes'))



def ProcedureView(request):
    """
    En esta vista se listan los procesos,
    :param request:
    :return: Vista listar para los Procesos
    """
    models = Procedure.objects.filter(active=True).order_by('process__order', 'process__classifier__name', 'process__abbreviation', 'process__name', 'name', 'abbreviation')
    template_models_list = 'base/procedures/list.html'

    return render(
        request,
        'base/procedures/base.html',
        {
            'template_models_list': template_models_list,
            'models': models,
        }
    )



def create_procedures(request):
    form = ProcedureModelForm()

    if request.method == 'POST':
        form = ProcedureModelForm(request.POST, request.FILES)

        if form.is_valid():
            instance = form.save()
            logs(request, Procedure, instance, 1)
            return JsonResponse({'results': {'url': reverse_lazy('base:procedures')}})

    return render(request, 'base/procedures/create.html', {'form': form})



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


def delete_procedures(request, procedure_id):
    model = get_object_or_404(Procedure, pk=procedure_id)
    logs(request, Procedure, model, 3)
    model.active = False
    model.save()
    return redirect(reverse_lazy('base:procedures'))


def export_procedures(request):
    if request.method == 'GET':
        logos = get_logos()
        logo1 = logos['logo1']
        logo2 = logos['logo2']
        models = Procedure.objects.all().order_by('process__order', 'process__classifier__name', 'process__abbreviation', 'process__name', 'name', 'abbreviation')
        filters = Q(pk__gt=0)

        if request.GET.get('export_status') and int(request.GET.get('export_status')) != 0:
            filters = filters & Q(status=request.GET.get('export_status'))

        if request.GET.get('search') and request.GET.get('search') != '':
            filters = filters & \
                    (
                        Q(process__abbreviation__icontains=request.GET.get('search'))
                        | Q(process__name__icontains=request.GET.get('search'))
                        | Q(process__responsible__first_name__icontains=request.GET.get('search'))
                        | Q(process__responsible__last_name__icontains=request.GET.get('search'))
                        | Q(process__abbreviation__icontains=request.GET.get('search'))
                        | Q(edition__icontains=request.GET.get('search'))
                        | Q(revision__icontains=request.GET.get('search'))
                    )

        html_string = render_to_string(
            'base/procedures/export_list.html',
            {'models': models.filter(filters).distinct(), 'owner': request.user, 'date': datetime.date.today()}
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
