from django.urls import path
from apps.licenses.views import list_licenses, details_licenses, create_licenses, update_licenses, delete_licenses, export_licenses, export_details_licenses

urlpatterns = [
    # Licenses
    path('listar/licencias/', list_licenses, name='list_licenses'),
    path('detalles/licencia/<int:license_id>/', details_licenses, name='details_licenses'),
    path('crear/licencia/', create_licenses, name='create_licenses'),
    path('modificar/licencia/<int:license_id>/', update_licenses, name='update_licenses'),
    path('eliminar/licencia/<int:license_id>/', delete_licenses, name='delete_licenses'),
    path('exportar/licencias/', export_licenses, name='export_licenses'),
    path('exportar/detalles/licencia/<int:license_id>/', export_details_licenses, name='export_details_licenses'),
]
