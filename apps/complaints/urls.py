from django.urls import path
from apps.complaints.views import ReceptionView, create_reception, update_reception, delete_reception, \
    list_complaints, detail_complaint, create_complaint, update_complaint, delete_complaint, export_complaints, \
    export_details_complaints, get_actions, reports_complaints, get_chartcomplaint_data

urlpatterns = [
    path('listar/vias_de_recepcion/', ReceptionView, name='receptions'),
    path('crear/via_de_recepcion/', create_reception, name='create_reception'),
    path('modificar/via_de_recepcion/<int:reception_id>/', update_reception, name='update_reception'),
    path('eliminar/via_de_recepcion/<int:reception_id>/', delete_reception, name='delete_reception'),

    path('listar/quejas/', list_complaints, name='list_complaints'),
    path('detalles/queja/<int:complaint_id>/', detail_complaint, name='detail_complaint'),
    path('crear/queja/', create_complaint, name='create_complaint'),
    path('modificar/queja/<int:complaint_id>/', update_complaint, name='update_complaint'),
    path('eliminar/queja/<int:complaint_id>/', delete_complaint, name='delete_complaint'),
    path('exportar/quejas/', export_complaints, name='export_complaints'),
    path('exportar/detalles/queja/<int:complaint_id>/', export_details_complaints, name='export_details_complaints'),
    path('get_actions/', get_actions, name='get_actions'),
    path('reportes/quejas/', reports_complaints, name='reports_complaints'),
    path('get_chartcomplaint_data/', get_chartcomplaint_data, name='get_chartcomplaint_data'),
]
