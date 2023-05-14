from django.urls import path
from apps.effectiveness.views import list_indicator, create_indicator, update_indicator, delete_indicator, get_measurers,\
    get_indicators, list_effectiveness, tableall_effectiveness, details_effectiveness, create_effectiveness, create_semester, clone_semester, \
    update_effectiveness, delete_effectiveness, delete_semester, export_effectiveness, export_details_effectiveness, \
    verify_semester, reports_effectiveness, get_chartprocess_data, get_chartprocess_teacher_data, exportall_effectiveness

urlpatterns = [
    # Effectiveness
    path('listar/eficacias/', list_effectiveness, name='list_effectiveness'),
    path('listar/procesos/eficacias/', tableall_effectiveness, name='tableall_effectiveness'),
    path('detalles/eficacia/<int:effectiveness_id>/', details_effectiveness, name='details_effectiveness'),
    path('crear/eficacia/', create_effectiveness, name='create_effectiveness'),
    path('crear/semestre/<int:effectiveness_id>/<int:semester>/', create_semester, name='create_semester'),
    path('clonar/semestre/<int:effectiveness_id>/<int:semester>/', clone_semester, name='clone_semester'),
    path('modificar/eficacia/<int:effectiveness_id>/<int:semester>/', update_effectiveness, name='update_effectiveness'),
    path('eliminar/eficacia/<int:effectiveness_id>/', delete_effectiveness, name='delete_effectiveness'),
    path('eliminar/semestre/<int:effectiveness_id>/<int:semester_id>/', delete_semester, name='delete_semester'),
    path('exportar/eficacias/', export_effectiveness, name='export_effectiveness'),
    path('exportar/detalles/eficacia/<int:effectiveness_id>/', export_details_effectiveness, name='export_details_effectiveness'),
    path('exportar/procesos/eficacias/', exportall_effectiveness, name='exportall_effectiveness'),
    path('reportes/eficacias/', reports_effectiveness, name='reports_effectiveness'),
    path('get_chartprocess_data/', get_chartprocess_data, name='get_chartprocess_data'),
    path('get_chartprocess_teacher_data/', get_chartprocess_teacher_data, name='get_chartprocess_teacher_data'),

    # Indicators
    path('listar/indicadores/', list_indicator, name='indicators'),
    path('crear/indicador/', create_indicator, name='create_indicator'),
    path('modificar/indicador/<int:indicator_id>/', update_indicator, name='update_indicator'),
    path('eliminar/indicador/<int:indicator_id>/', delete_indicator, name='delete_indicator'),

    # Measurers
    path('get_measurers/', get_measurers, name='get_measurers'),
    path('get_indicators/', get_indicators, name='get_indicators'),
    path('verify_semester/', verify_semester, name='verify_semester'),
]
