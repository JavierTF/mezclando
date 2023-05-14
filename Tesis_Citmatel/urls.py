"""Tesis_Citmatel URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib.auth.decorators import login_required, permission_required
from notifications import urls as notiURL
from django.contrib import admin
from django.urls import path, include
from Tesis_Citmatel import settings
from django.conf.urls.static import static
from django.contrib.auth import views as djangoViews
from ProyectoBaseApp import views, forms
from SISGDDO import views_sisgddo, form
from SISGDDO.views_sisgddo import DashboardGraficoLine,DashboardGraficopastel,AcuerdosConsejoDetailView,IncidenciasDetailView,incidenciaUpdate, sosiUpdate,cendaUpdate,proyectoUpdate,ProyectoDetailView,LicenciaUpdate,auditoria_internaUpdate,auditoria_externaUpdate,nomlinea_tematica,cursoUpdate,nomcurso,nomestado_proyecto,nomformato,metodosUpdate,nommetodosprueba,procesoUpdate,nomproceso,nomindefic,indeficUpdate,nomcliemteexterno,clienteexternoUpdate,nomtrabajador,trabajadorUpdate
from django.views.generic import TemplateView

#moduloJavier
from SISGDDO.views_sisgddo import nomarea, area_update, eliminar_area
from SISGDDO.views_sisgddo import nomlinea_tematica, linea_tematica_update
from SISGDDO.views_sisgddo import nomestado_acuerdo, estado_acuerdo_update
from SISGDDO.views_sisgddo import nomestado_proyecto, estado_proyecto_update
from SISGDDO.views_sisgddo import nomtipo_proyecto, tipo_proyecto_update
from SISGDDO.views_sisgddo import nomfuente_financiamiento, fuente_financiamiento_update
from SISGDDO.views_sisgddo import nomformato, formato_update
from SISGDDO.views_sisgddo import nomestado_entrada, estado_entrada_update
from SISGDDO.views_sisgddo import nomentidad, entidad_update
from SISGDDO.views_sisgddo import nomestado_indicador, estado_indicador_update
from SISGDDO.views_sisgddo import nomrol_trabajador_consecutivo, rol_trabajador_consecutivo_update
from SISGDDO.views_sisgddo import nomrol_trabajador_proyecto, rol_trabajador_proyecto_update
from SISGDDO.views_sisgddo import nomconsecutivo, consecutivo_update

urlpatterns = [
    # Creating a path to the index.html file.
    # path('', TemplateView.as_view(template_name = 'index.html')),
    # path('prueba', TemplateView.as_view(template_name = 'prueba.js')),

    #CRUD Area #javier
    path('listar/area', views_sisgddo.listar_area, name = "listar_areas"),
    path('agregar/area', nomarea.as_view(), name = "agregar_area"),
    path('modificar/area/<int:pk>', area_update.as_view(), name="modificar_area"),
    path('activar/area/<int:id>/', views_sisgddo.act_desactarea, name="act_desactarea"),
    path('eliminar/area/<int:id>/', views_sisgddo.eliminar_area, name="eliminar_area"),

    #CRUD Línea temática #javier
    path('listar/linea-tematica', views_sisgddo.listar_linea_tematica, name = "listar_linea_tematica"),
    path('agregar/linea-tematica', nomlinea_tematica.as_view(), name = "agregar_linea_tematica"),
    path('modificar/linea-tematica/<int:pk>', linea_tematica_update.as_view(), name="modificar_linea_tematica"),
    path('activar/linea-tematica/<int:id>/', views_sisgddo.act_desactlinea_tematica, name="act_desactlinea_tematica"),
    path('eliminar/linea-tematica/<int:id>/', views_sisgddo.eliminar_linea_tematica, name="eliminar_linea_tematica"),

    #CRUD Estado acuerdo #javier
    path('listar/estado-acuerdo', views_sisgddo.listar_estado_acuerdo, name = "listar_estado_acuerdo"),
    path('agregar/estado-acuerdo', nomestado_acuerdo.as_view(), name = "agregar_estado_acuerdo"),
    path('modificar/estado-acuerdo/<int:pk>', estado_acuerdo_update.as_view(), name="modificar_estado_acuerdo"),
    path('activar/estado-acuerdo/<int:id>/', views_sisgddo.act_desactestado_acuerdo, name="act_desactestado_acuerdo"),
    path('eliminar/estado-acuerdo/<int:id>/', views_sisgddo.eliminar_estado_acuerdo, name="eliminar_estado_acuerdo"),

    #CRUD Estado proyecto #javier
    path('listar/estado-proyecto', views_sisgddo.listar_estado_proyecto, name = "listar_estado_proyecto"),
    path('agregar/estado-proyecto', nomestado_proyecto.as_view(), name = "agregar_estado_proyecto"),
    path('modificar/estado-proyecto/<int:pk>', estado_proyecto_update.as_view(), name="modificar_estado_proyecto"),
    path('activar/estado-proyecto/<int:id>/', views_sisgddo.act_desactestado_proyecto, name="act_desactestado_proyecto"),
    path('eliminar/estado-proyecto/<int:id>/', views_sisgddo.eliminar_estado_proyecto, name="eliminar_estado_proyecto"),
    
    #CRUD Tipo proyecto #javier
    path('listar/tipo-proyecto', views_sisgddo.listar_tipo_proyecto, name = "listar_tipo_proyecto"),
    path('agregar/tipo-proyecto', nomtipo_proyecto.as_view(), name = "agregar_tipo_proyecto"),
    path('modificar/tipo-proyecto/<int:pk>', tipo_proyecto_update.as_view(), name="modificar_tipo_proyecto"),
    path('activar/tipo-proyecto/<int:id>/', views_sisgddo.act_desacttipo_proyecto, name="act_desacttipo_proyecto"),
    path('eliminar/tipo-proyecto/<int:id>/', views_sisgddo.eliminar_tipo_proyecto, name="eliminar_tipo_proyecto"),

    #CRUD Fuente financiamiento #javier
    path('listar/fuente-financiamiento', views_sisgddo.listar_fuente_financiamiento, name = "listar_fuente_financiamiento"),
    path('agregar/fuente-financiamiento', nomfuente_financiamiento.as_view(), name = "agregar_fuente_financiamiento"),
    path('modificar/fuente-financiamiento/<int:pk>', fuente_financiamiento_update.as_view(), name="modificar_fuente_financiamiento"),
    path('activar/fuente-financiamiento/<int:id>/', views_sisgddo.act_desactfuente_financiamiento, name="act_desactfuente_financiamiento"),
    path('eliminar/fuente-financiamiento/<int:id>/', views_sisgddo.eliminar_fuente_financiamiento, name="eliminar_fuente_financiamiento"),
    
    #CRUD Formato #javier
    path('listar/formato', views_sisgddo.listar_formato, name = "listar_formato"),
    path('agregar/formato', nomformato.as_view(), name = "agregar_formato"),
    path('modificar/formato/<int:pk>', formato_update.as_view(), name="modificar_formato"),
    path('activar/formato/<int:id>/', views_sisgddo.act_desactformato, name="act_desactformato"),
    path('eliminar/formato/<int:id>/', views_sisgddo.eliminar_formato, name="eliminar_formato"),

    #CRUD Estado entrada #javier
    path('listar/estado-entrada', views_sisgddo.listar_estado_entrada, name = "listar_estado_entrada"),
    path('agregar/estado-entrada', nomestado_entrada.as_view(), name = "agregar_estado_entrada"),
    path('modificar/estado-entrada/<int:pk>', estado_entrada_update.as_view(), name="modificar_estado_entrada"),
    path('activar/estado-entrada/<int:id>/', views_sisgddo.act_desactestado_entrada, name="act_desactestado_entrada"),
    path('eliminar/estado-entrada/<int:id>/', views_sisgddo.eliminar_estado_entrada, name="eliminar_estado_entrada"),

    #CRUD Entidad #javier
    path('listar/entidad', views_sisgddo.listar_entidad, name = "listar_entidad"),
    path('agregar/entidad', nomentidad.as_view(), name = "agregar_entidad"),
    path('modificar/entidad/<int:pk>', entidad_update.as_view(), name="modificar_entidad"),
    path('activar/entidad/<int:id>/', views_sisgddo.act_desactentidad, name="act_desactentidad"),
    path('eliminar/entidad/<int:id>/', views_sisgddo.eliminar_entidad, name="eliminar_entidad"),

    #CRUD Estado indicador #javier
    path('listar/estado-indicador', views_sisgddo.listar_estado_indicador, name = "listar_estado_indicador"),
    path('agregar/estado-indicador', nomestado_indicador.as_view(), name = "agregar_estado_indicador"),
    path('modificar/estado-indicador/<int:pk>', estado_indicador_update.as_view(), name="modificar_estado_indicador"),
    path('activar/estado-indicador/<int:id>/', views_sisgddo.act_desactestado_indicador, name="act_desactestado_indicador"),
    path('eliminar/estado-indicador/<int:id>/', views_sisgddo.eliminar_estado_indicador, name="eliminar_estado_indicador"),

    #CRUD Rol consecutivo #javier
    path('listar/rol-consecutivo', views_sisgddo.listar_rol_trabajador_consecutivo, name = "listar_rol_trabajador_consecutivo"),
    path('agregar/rol-consecutivo', nomrol_trabajador_consecutivo.as_view(), name = "agregar_rol_trabajador_consecutivo"),
    path('modificar/rol-consecutivo/<int:pk>', rol_trabajador_consecutivo_update.as_view(), name="modificar_rol_trabajador_consecutivo"),
    path('activar/rol-consecutivo/<int:id>/', views_sisgddo.act_desactrol_consecutivo, name="act_desactrol_consecutivo"),
    path('eliminar/rol-consecutivo/<int:id>/', views_sisgddo.eliminar_rol_trabajador_consecutivo, name="eliminar_rol_trabajador_consecutivo"),

    #CRUD rol proyecto #javier
    path('listar/rol-proyecto', views_sisgddo.listar_rol_trabajador_proyecto, name = "listar_rol_trabajador_proyecto"),
    path('agregar/rol-proyecto', nomrol_trabajador_proyecto.as_view(), name = "agregar_rol_trabajador_proyecto"),
    path('modificar/rol-proyecto/<int:pk>', rol_trabajador_proyecto_update.as_view(), name="modificar_rol_trabajador_proyecto"),
    path('activar/rol-proyecto/<int:id>/', views_sisgddo.act_desactrol_proyecto, name="act_desactrol_proyecto"),
    path('eliminar/rol-proyecto/<int:id>/', views_sisgddo.eliminar_rol_trabajador_proyecto, name="eliminar_rol_trabajador_proyecto"),

    #CRUD consecutivo #javier
    path('listar/consecutivo', views_sisgddo.listar_consecutivo, name = "listar_consecutivo"),
    path('agregar/consecutivo', nomconsecutivo.as_view(), name = "agregar_consecutivo"),
    # path('modificar/consecutivo/<int:pk>', consecutivo_update.as_view(), name="modificar_consecutivo"),
    # path('activar/consecutivo/<int:id>/', views_sisgddo.act_desactconsecutivo, name="act_desactconsecutivo"),
    # path('eliminar/consecutivo/<int:id>/', views_sisgddo.eliminar_consecutivo, name="eliminar_consecutivo"),







    path('', views_sisgddo.DashboardGraficobarra.as_view(), name="inicio"),
    path('admin/', admin.site.urls),
    path('i18n/', include('django.conf.urls.i18n')),
    path('accounts/login/', views.loguear, name='ce_login'),
    path('login/', views.just_login, name='just_login'),
    path('logout/', views.logout, name='logout'),
    # path('register-by-url/<token>', views.register_by_url, name="register_by_url"),
    # path('administration', login_required(views.inicio), name="inicio"),

    path('administration/grupo/list', login_required(views.group_list), name="group_list"),
    path('administration/grupo/create', login_required(views.group_create), name='group_create'),
    path('administration/grupo/update/<int:pk>',
         permission_required('ProyectoBaseApp.change_group', login_url='ce_login')(forms.GroupUpdate.as_view()),
         name='group_update'),
    path('administration/grupo/delete/<int:pk>/',
         permission_required('ProyectoBaseApp.delete_group', login_url='ce_login')(forms.GroupDelete.as_view()),
         name='group_delete'),
    path('administration/user/list', login_required(views.user_list), name="user_list"),
    path('administration/user/create', login_required(views.user_create), name='user_create'),
    path('administration/user/update/<int:pk>',login_required(forms.UserUpdate.as_view()),name='user_update'),
    path('administration/user/delete/<int:pk>/',login_required(forms.UserDelete.as_view()),name='user_delete'),
    path('administration/password/update/<int:pk>/', login_required(views.password_update),name='password_update'),
    path('administration/password/updateadmin/<int:pk>/', login_required(views.password_update_admin),
         name='password_updateadmin'),

    # USUARIO
    path('user/password/reset/', views.PasswordResetView.as_view(),
         {'post_reset_redirect': '/user/password/reset/done/'}, name='password_reset'),
    path('user/password/reset/done/', djangoViews.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', djangoViews.PasswordResetConfirmView.as_view(),
         {'post_reset_redirect': '/user/reset/done/'}, name='password_reset_confirm'),
    path('user/reset/done/', djangoViews.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
    path('good/count/activated', views.count_activated, name='account_activation_sent'),
    path('activate/<uidb64>/<token>/', views.activate, name='activate'),
    path('user/update/<int:pk>', login_required(forms.UserUpdateAdmin.as_view()), name="profile"),

    # logs del sistema
    path('administration/logs/list', login_required(views.history_list), name="history_list"),
    path('administration/logs/first_list', login_required(views.history_list_300), name="history_list_300"),

    # NOTIFICACIONES
    path('inbox/notifications/', include(notiURL, namespace='notifications')),
    path('notifications/read/<int:action>', login_required(views.notificacion_read), name="notificacion_read"),

    path('notifications/mark_noti_all_read', login_required(views.notification_all_mark_read), name="mark_all_read"),
    path('notifications/mark_noti_offer_all_read', login_required(views.notification_offer_all_mark_read), name="mark_offer_all_read"),

    # CAPTCHA
    path('captcha/', include('captcha.urls')),

    # CAMBIAR LOGO
    path('cambiar/logo', views_sisgddo.CambiarLogotipo.as_view(), name="cambiar_logo"),

    # Salva y Reastaura bdd
    path('administration/db/save', views.db_save, name="db_save"),
    path('administration/db/restore/<str:name>)', views.db_restore, name="db_restore"),

    # Gestion Integrada
    path('listar/licencias', views_sisgddo.listar_licenciasxtrabajador, name="listar_licencias"),
    path('agregar/licencias/', views_sisgddo.Licencias_create,name="agregar_licencia"),
    path('modificar/licencia/<int:pk>', views_sisgddo.LicenciaUpdate.as_view(),name="modificar_licencia"),
    path('detalle/licencia/<int:pk>/', views_sisgddo.LicenciasDetailView.as_view(),name="detalle_licencia"),
    path('listar/vizincidencias', views_sisgddo.listar_visualizarincidencias, name="listar_visualizarincidencias"),
    path('listar/atencioncliente/',views_sisgddo.listar_atencioncliente, name="listar_ateclientext"),
    # path('agregar/atencioncliente/',views_sisgddo.atencioncliente_create, name="agregar_atencioncliente"),
    # path('modificar/atencioncliente/<int:pk>', atencionclienteUpdate.as_view(), name="modificar_atencioncliente"),
    # path('detalle/atencliente/<int:pk>/', views_sisgddo.AtencionClienteExternoDetailView.as_view(), name= "detalle_atencioncliente"),
    path('detalle/auditoriaint/<int:pk>/', views_sisgddo.AuditoriaInternaDetailView.as_view(), name= "detalle_auditoriaint"),
    path('detalle/auditoriaext/<int:pk>/', views_sisgddo.AuditoriaExternaDetailView.as_view(), name= "detalle_auditoriaext"),
    path('listar/auditoriainterna/', views_sisgddo.listar_auditoria_interno, name="listar_auditoriaint"),
    path('agregar/auditoriainterna/',views_sisgddo.auditoria_interna_create, name="agregar_auditoriaint"),
    path('modificar/auditoriainterna/<int:pk>', auditoria_internaUpdate.as_view(), name="modificar_auditoriaint"),
    path('listar/auditoriaexterna/', views_sisgddo.listar_auditoria_externa, name="listar_auditoriaext"),
    path('listar/auditoriaexterna/', views_sisgddo.listar_auditoria_externa, name="listar_auditoriaext"),
    path('agregar/auditoriaexterna/',views_sisgddo.auditoria_externa_create, name="agregar_auditoriaext"),
    path('modificar/auditoriaexterna/<int:pk>', auditoria_externaUpdate.as_view(), name="modificar_auditoriaext"),
    path('listar/eficacia/ajax', views_sisgddo.eficaciaajax, name="eficacia-ajax"),
    path('listar/eficacia/', views_sisgddo.listar_eficacia_procesos, name="listar_eficacia"),
    path('agregar/eficacia/',views_sisgddo.eficacia_procesos_create, name="agregar_eficacia"),
    path('detalles/eficacia/<int:pk>', views_sisgddo.EficaciaDetailView.as_view(), name="detalles_eficacia"),

#     #Gestion Innovación
    path('listar/sosi', views_sisgddo.listar_sosi, name="listar_sosi"),
    path('agregar/sosi/',views_sisgddo.sosi_create, name="agregar_sosi"),
    path('modificar/sosi/<int:pk>', sosiUpdate.as_view(), name="modificar_sosi"),
    path('detalle/sosi/<int:pk>/', views_sisgddo.sosiDetailView.as_view(),name="detalle_sosi"),
    path('listar/cenda', views_sisgddo.listar_cenda, name="listar_cenda"),
    path('agregar/cenda/',views_sisgddo.cenda_create, name="agregar_cenda"),
    path('modificar/cenda/<int:pk>', cendaUpdate.as_view(), name="modificar_cenda"),
    path('listar/proyectos', views_sisgddo.listar_proyectos, name="listar_proyectos"),
    path('agregar/proyecto/',views_sisgddo.proyecto_create, name="agregar_proyecto"),
    path('modificar/proyecto/<int:pk>', proyectoUpdate.as_view(), name="modificar_proyecto"),
    path('detalle/proyecto/<int:pk>', ProyectoDetailView.as_view(), name= "detalle_proyecto"),

#     #Gestión Desarrollo
    # path('agregar/historicoentradasproyectos', views_sisgddo.nomhistorico_entradas_proyectos.as_view(),name="agregar_histentproy"),
    # path('listar/historicoentradasproyectos', views_sisgddo.listar_historico_entradas_proyectos,name="listar_histentproy"),
    # path('modificar/historicoentradasproyectos/<int:pk>', views_sisgddo.historico_entradas_proyectosUpdate.as_view(),name="modificar_histentproy"),
#     #Gestion Información
    path('listar/incidencias', views_sisgddo.listar_incidencias, name="listar_incidencias"),
    path('listar/no_conformidad', views_sisgddo.listar_no_conformidad, name="listar_no_conformidad"),
    path('detalle/incidencia/<int:pk>/', IncidenciasDetailView.as_view(), name= "detalle_incidencia"),
    path('detalle/acuerdo/<int:pk>/', AcuerdosConsejoDetailView.as_view(), name= "detalle_acuerdo"),
    path('listar/reservas', views_sisgddo.listar_reservasdecuadro, name="listar_reservas"),
    path('detalle/reservas/<int:pk>/', views_sisgddo.det_reservasdecuadro, name="detalle_reservas"),
    path('listar/cuadros', views_sisgddo.listar_cuadro, name="listar_cuadros"),
    path('detalle/cuadros/<int:pk>/', views_sisgddo.det_cuadro, name="detalle_cuadros"),
    path('agregar/incidencia/',views_sisgddo.incidencias_create, name="agregar_incidencia"),
    path('modificar/incidencia/<int:pk>', incidenciaUpdate.as_view(), name="modificar_incidencia"),
    path('listar/acuerdos', views_sisgddo.listar_acuerdos, name="listar_acuerdos"),
    path('agregar/acuerdos', views_sisgddo.acuerdo_create, name="adicionar_acuerdos"),
    path('agregar/curso',nomcurso.as_view() , name= "agregar_curso"),
    path('listar/curso', views_sisgddo.listar_cursos , name="listar_curso"),
    path('modificar/curso/<int:pk>', cursoUpdate.as_view(), name="modificar_curso"),
    path('conformidadeficacia_act_des/<int:id>/', views_sisgddo.act_desactconformidadEficacia, name="act_desactConfEficacia"),

    #Activar y Desactivar
    # path('col_act_des/<int:id>/', views_sisgddo.act_desactCol, name="act_desactcol"),
    # path('org_act_des/<int:id>/', views_sisgddo.act_desactOrg, name="act_desactorg"),,
    # path('form_act_des/<int:id>/', views_sisgddo.act_desactForm, name="act_desactform"),
    path('clienteext_act_des/<int:id>/', views_sisgddo.act_desactClienteExterno, name="act_desactclienteext"),
    path('agregar/clasificacioninc', views_sisgddo.nomclasificacionincidencias.as_view(), name="agregar_clasificacioninc"),
    path('listar/clasificacioninc', views_sisgddo.listar_clasificacionincidencias, name="listar_clasificacioninc"),
    path('modificar/clasificacioninc/<int:pk>', views_sisgddo.clasificacionincidenciasUpdate.as_view(), name="modificar_clasificacioninc"),
    # path('agregar/estadonoconformidad', nomestado_no_conformidad.as_view(), name="agregar_estadonoconformidad"),
    # path('estadonoconformidad/create', views_sisgddo.estadonoconformidad_create, name="modalestadonoconformidad"),
    # path('listar/estadonoconformidad', views_sisgddo.listar_estadonoconformidad, name="listar_estadonoconformidad"),
    # path('modificar/estadonoconformidad/<int:pk>', estadonoconformUpdate.as_view(), name="modificar_estadonoconformidad"),
    # path('agregar/formacionpersonal',views_sisgddo.nomformacion.as_view() , name= "agregar_formacionpersonal"),
    # path('listar/formacionpersonal', views_sisgddo.listar_formacion, name="listar_formacionpersonal"),
    # path('modificar/formacionpersonal/<int:pk>', views_sisgddo.formacion_personalUpdate.as_view(), name="modificar_formacionpersonal"),
    path('agregar/metodosprueba',nommetodosprueba.as_view() , name= "agregar_metodosprueba"),
    path('listar/metodospruebas', views_sisgddo.listar_metodosprueb, name="listar_metodospruebas"),
    path('modificar/metodosprueba/<int:pk>', metodosUpdate.as_view(), name="modificar_metodosprueba"),
    path('agregar/proceso',nomproceso.as_view() , name= "agregar_proceso"),
    path('proceso/create',views_sisgddo.proceso_create, name="modalproceso"),
    # path('listar/formvalencuesta', views_sisgddo.visualizarformEncuesta, name="visualizarformencuesta"),
    path('listar/procesos', views_sisgddo.listar_procesos, name="listar_procesos"),
    path('modificar/proceso/<int:pk>', procesoUpdate.as_view(), name="modificar_proceso"),
    path('agregar/trabajador',nomtrabajador.as_view() , name= "agregar_trabajador"),
    path('listar/trabajadores', views_sisgddo.listar_trabajadoresentrar, name="listar_trabajadores"),
    path('modificar/trabajador/<int:pk>', trabajadorUpdate.as_view(), name="modificar_trabajador"),
    path('detalles/trabajador/<int:pk>', views_sisgddo.TrabajadorDetailView.as_view(), name="detalles_trabajador"),
    path('trabajador_act_des/<int:id>/', views_sisgddo.act_desactTrabajador, name="act_desactConfTrabajador"),
    path('agregar/clienteext',nomcliemteexterno.as_view() , name= "agregar_clienteext"),
    path('clienteext/create',views_sisgddo.clienteext_create, name="modalclienteext"),
    path('listar/clienteext', views_sisgddo.listar_clienteexternos, name="listar_clienteext"),
    path('modificar/clienteext/<int:pk>', clienteexternoUpdate.as_view(), name="modificar_clienteext"),
    # path('eliminar/clienteext/<int:pk>', form.ClienteExternoDelete.as_view(), name="eliminar_clienteext"),
    path('agregar/planmedidas',views_sisgddo.plan_medida_create , name= "agregar_planmedidas"),
    path('listar/planmedidas', views_sisgddo.listar_planmedidas, name="listar_planmedidas"),
    path('modificar/planmedidas/<int:pk>', views_sisgddo.planmedidasUpdate.as_view(), name="modificar_planmedidas"),
    path('detalles/planmedidas/<int:pk>', views_sisgddo.PlanMedidasDetailView.as_view(), name="detalles_planmedidas"),
    # path('agregar/aspeficacia',nomaspmedirefic.as_view() , name= "agregar_aspeficacia"),
    # path('listar/aspeficacia', views_sisgddo.listar_aspmedirefic, name="listar_aspeficacia"),
    # path('modificar/aspeficacia/<int:pk>', aspmedireficUpdate.as_view(), name="modificar_aspeficacia"),
    path('agregar/indeficacia',nomindefic.as_view() , name= "agregar_indeficacia"),
    path('listar/indeficacia', views_sisgddo.listar_indefic, name="listar_indeficacia"),
    path('modificar/indeficacia/<int:pk>', indeficUpdate.as_view(), name="modificar_indeficacia"),

    #Importar CSV sosi
    path('importar/CSV/', views_sisgddo.ImportarCSV, name="importarCSV"),

#     #Reporte y Graficos
    #path('ver/graficopastel',DashboardGraficopastel.as_view(), name="grafico_pastel"),
    #path('ver/graficoline',DashboardGraficoLine.as_view(), name="grafico_line"),
    path('ver/caldias',views_sisgddo.calculadias,name="cal"),
    path('exportar_pdf/incidencias',views_sisgddo.ExportarIncidencias_PDF.as_view(),name="exportar_incidencias"),
    path('exportar_pdf/reclamaciones',views_sisgddo.ExportarReclamaciones_PDF.as_view(),name="exportar_reclamaciones"),
    path('exportar_pdf/cursos',views_sisgddo.ExportarCapacitacion_PDF.as_view(),name="exportar_capacitacion"),
    path('exportar_pdf/licencias',views_sisgddo.ExportarLicencias_PDF.as_view(),name="exportar_licencias"),
    path('exportar_pdf/certificaciones',views_sisgddo.ExportarCertificaciones_PDF.as_view(),name="exportar_certific"),
    path('exportar_pdf/cuadros',views_sisgddo.ExportarCuadros_PDF.as_view(),name="exportar_cuadros"),
    path('exportar_pdf/reservas',views_sisgddo.ExportarReservas_PDF.as_view(),name="exportar_reservas"),
    path('exportar_pdf/proyatrasado',views_sisgddo.ExportarProyectAtrasados_PDF.as_view(),name="exportar_proy_atrasado"),
    path('exportar_pdf/proyaprob',views_sisgddo.ExportarProyectAprobados_PDF.as_view(),name="exportar_proy_aprobado"),
    # path('exportar_pdf/proyconf',views_sisgddo.ExportarProyectConforme_PDF.as_view(),name="exportar_proy_conform"),
    # path('exportar_pdf/proynoconf',views_sisgddo.ExportarProyectNoConforme_PDF.as_view(),name="exportar_proy_no_conform"),
    path('exportar_pdf/proyterm',views_sisgddo.ExportarProyectTerminado_PDF.as_view(),name="exportar_proy_term"),
    path('exportar_pdf/proyform',views_sisgddo.ExportarProyectFormatos_PDF.as_view(),name="exportar_proy_form"),
    path('exportar_pdf/proyestados',views_sisgddo.ExportarProyectEstadosTodos_PDF.as_view(),name="exportar_proy_estados"),
    path('exportar_pdf/eficacia',views_sisgddo.ExportarEficacia_PDF.as_view(),name="exportar_eficacia"),
    path('informe/certificacion',views_sisgddo.ReporteCertificacionesJefeProyectos,name="reporte_cert"),
    path('informe/reclamacion',views_sisgddo.ReporteReclamaciones,name="reporte_reclam"),
    path('informe/incidencia',views_sisgddo.ReporteIncidencias,name="reporte_inc"),
    path('informe/capacitacion',views_sisgddo.ReporteCapacitaciones,name="reporte_cap"),
    path('informe/reserva',views_sisgddo.ReporteReserva,name="reporte_reserva"),
    path('informe/cuadro',views_sisgddo.ReporteCuadros,name="reporte_cuadro"),
    path('informe/proyatrasado',views_sisgddo.ReporteProyectoAtrasado,name="reporte_proyecto_atrasado"),
    path('informe/proyaprob',views_sisgddo.ReporteProyectoAprobado,name="reporte_proyecto_aprobado"),
    # path('informe/proyconf',views_sisgddo.ReporteProyectoConform,name="reporte_proyecto_conforme"),
    # path('informe/proynoconf',views_sisgddo.ReporteProyectoNOconform,name="reporte_proyecto_no_conforme"),
    path('informe/proyterm',views_sisgddo.ReporteProyectoTerminado,name="reporte_proyecto_term"),
    path('informe/proyformato',views_sisgddo.ReporteProyectosFormatos,name="reporte_proyecto_format"),
    path('informe/proyestados',views_sisgddo.ReporteProyectosEstadosTodos,name="reporte_proyecto_estados"),
    path('informe/eficacia',views_sisgddo.ReporteEficacia,name="reporte_eficacia"),


              ]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

handler404= 'ProyectoBaseApp.views.error404'