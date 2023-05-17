from django.urls import path
from apps.base.views import create_afectation
from apps.base.views import CountryView, create_country, update_country, delete_country, \
        EntityView, create_entity,update_entity, delete_entity, \
        create_logoentity, \
        ClientView, create_client, update_client, delete_client, \
        PositionView, create_position, update_position, delete_position, \
        EmployeeView, create_employee, update_employee, delete_employee, \
        ProcessView, create_processes, update_processes, delete_processes, \
        ProcedureView, create_procedures, update_procedures, delete_procedures, export_procedures, export_db, import_db

urlpatterns = [
        path('listar/paises/', CountryView, name='countries'),
        path('crear/pais/', create_country, name='create_country'),
        path('modificar/pais/<int:country_id>/', update_country, name='update_country'),
        path('eliminar/pais/<int:country_id>/', delete_country, name='delete_country'),

        path('listar/entidades/', EntityView, name='entities'),
        path('crear/entidad/', create_entity, name='create_entity'),
        path('modificar/entidad/<int:entity_id>/', update_entity, name='update_entity'),
        path('eliminar/entidad/<int:entity_id>/', delete_entity, name='delete_entity'),

        path('crear/logo/', create_logoentity, name='create_logoentity'),

        path('listar/clientes/', ClientView, name='clients'),
        path('crear/cliente/', create_client, name='create_client'),
        path('modificar/cliente/<int:client_id>/', update_client, name='update_client'),
        path('eliminar/cliente/<int:client_id>/', delete_client, name='delete_client'),

        path('listar/cargos/', PositionView, name='positions'),
        path('crear/cargo/', create_position, name='create_position'),
        path('modificar/cargo/<int:position_id>/', update_position, name='update_position'),
        path('eliminar/cargo/<int:position_id>/', delete_position, name='delete_position'),

        path('listar/trabajadores/', EmployeeView, name='employees'),
        path('crear/trabajador/', create_employee, name='create_employee'),
        path('modificar/trabajador/<int:employee_id>/', update_employee, name='update_employee'),
        path('eliminar/trabajador/<int:employee_id>/', delete_employee, name='delete_employee'),

        path('listar/procesos/', ProcessView, name='processes'),
        path('crear/proceso/', create_processes, name='create_processes'),
        path('modificar/proceso/<int:process_id>/', update_processes, name='update_processes'),
        path('eliminar/proceso/<int:process_id>/', delete_processes, name='delete_processes'),

        path('listar/procedimientos/', ProcedureView, name='procedures'),
        path('crear/procedimiento/', create_procedures, name='create_procedures'),
        path('modificar/procedimiento/<int:procedure_id>/', update_procedures, name='update_procedures'),
        path('eliminar/procedimiento/<int:procedure_id>/', delete_procedures, name='delete_procedures'),
        path('exportar/procedimiento/', export_procedures, name='export_procedures'),

        path('db/', export_db, name='export_db'),
        path('db/<str:file>/', import_db, name='import_db'),

        path('crear/afectacion/', create_afectation, name='create_afectation'),
]
