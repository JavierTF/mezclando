from django.urls import path
from apps.base.views import CountryView, create_country, update_country, activate_country, delete_country, \
        EntityView, create_entity,update_entity, activate_entity, delete_entity, \
        create_logoentity, \
        PositionView, create_position, update_position, activate_position, delete_position, \
        EmployeeView, detail_employee, create_employee, update_employee, activate_employee, delete_employee, export_employee, validate_employee, export_details_employee, \
        ProcessView, create_processes, update_processes, delete_processes, \
        ScientificCategoriesView, create_scientific_category, update_scientific_category, activate_scientific_category, delete_scientific_category, \
        ProcedureView, create_procedures, update_procedures, delete_procedures, export_procedures, export_db, import_db, \
        ProcessesClassifierView, create_process_classifier, update_process_classifier, update_process_classifier, activate_process_classifier, delete_process_classifier

urlpatterns = [
        path('listar/paises/', CountryView, name='countries'),
        path('crear/pais/', create_country, name='create_country'),
        path('modificar/pais/<int:country_id>/', update_country, name='update_country'),
        path('activar/pais/<int:country_id>/', activate_country, name='activate_country'),
        path('eliminar/pais/<int:country_id>/', delete_country, name='delete_country'),

        path('listar/entidades/', EntityView, name='entities'),
        path('crear/entidad/', create_entity, name='create_entity'),
        path('modificar/entidad/<int:entity_id>/', update_entity, name='update_entity'),
        path('activar/entidad/<int:entity_id>/', activate_entity, name='activate_entity'),
        path('eliminar/entidad/<int:entity_id>/', delete_entity, name='delete_entity'),

        path('crear/logo/', create_logoentity, name='create_logoentity'),

        path('listar/cargos/', PositionView, name='positions'),
        path('crear/cargo/', create_position, name='create_position'),
        path('modificar/cargo/<int:position_id>/', update_position, name='update_position'),
        path('activar/cargo/<int:position_id>/', activate_position, name='activate_position'),
        path('eliminar/cargo/<int:position_id>/', delete_position, name='delete_position'),

        path('listar/categorias_cientificas/', ScientificCategoriesView, name='scientific_categories'),
        path('crear/categorias_cientificas/', create_scientific_category, name='create_scientific_category'),
        path('modificar/categorias_cientificas/<int:scientific_category_id>/', update_scientific_category, name='update_scientific_category'),
        path('activar/categorias_cientificas/<int:scientific_category_id>/', activate_scientific_category, name='activate_scientific_category'),
        path('eliminar/categorias_cientificas/<int:scientific_category_id>/', delete_scientific_category, name='delete_scientific_category'),

        path('listar/trabajadores/', EmployeeView, name='employees'),
        path('detalles/trabajador/<int:employee_id>/', detail_employee, name='detail_employee'),
        path('crear/trabajador/', create_employee, name='create_employee'),
        path('modificar/trabajador/<int:employee_id>/', update_employee, name='update_employee'),
        path('activar/trabajador/<int:employee_id>/', activate_employee, name='activate_employee'),
        path('eliminar/trabajador/<int:employee_id>/', delete_employee, name='delete_employee'),
        path('exportar/trabajador/', export_employee, name='export_employee'),
        path('exportar/detalles/trabajador/<int:employee_id>/', export_details_employee, name='export_details_employee'),
        path('validate_employee/', validate_employee, name='validate_employee'),

        path('listar/procesos/', ProcessView, name='processes'),
        path('crear/proceso/', create_processes, name='create_processes'),
        path('modificar/proceso/<int:process_id>/', update_processes, name='update_processes'),
        path('eliminar/proceso/<int:process_id>/', delete_processes, name='delete_processes'),

        path('listar/procedimientos/', ProcedureView, name='procedures'),
        path('crear/procedimiento/', create_procedures, name='create_procedures'),
        path('modificar/procedimiento/<int:procedure_id>/', update_procedures, name='update_procedures'),
        path('eliminar/procedimiento/<int:procedure_id>/', delete_procedures, name='delete_procedures'),
        path('exportar/procedimiento/', export_procedures, name='export_procedures'),

        path('listar/clasificadores de proceso/', ProcessesClassifierView, name='processes_classifier'),
        path('crear/clasificadores de proceso/', create_process_classifier, name='create_process_classifier'),
        path('modificar/clasificadores de proceso/<int:process_classifier_id>/', update_process_classifier, name='update_process_classifier'),
        path('activar/clasificadores de proceso/<int:process_classifier_id>/', activate_process_classifier, name='activate_process_classifier'),
        path('eliminar/clasificadores de proceso/<int:process_classifier_id>/', delete_process_classifier, name='delete_process_classifier'),

        path('db/', export_db, name='export_db'),
        path('db/<str:file>/', import_db, name='import_db'),
]
