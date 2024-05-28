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
from django.urls import path, include
from django.contrib import admin
from notifications import urls as notiURL
from Tesis_Citmatel import settings
from django.conf.urls.static import static
from django.contrib.auth import views as djangoViews
from ProyectoBaseApp import views, forms
from SISGDDO import views_sisgddo
#from SISGDDO.views_sisgddo import nomlinea_tematica, nomestado_proyecto, nomformato
from SISGDDO.views_sisgddo import create_afectation
import xavi

# # moduloJavier
# from SISGDDO.views_sisgddo import nomarea, area_update
# from SISGDDO.views_sisgddo import nomlinea_tematica, linea_tematica_update
# from SISGDDO.views_sisgddo import nomevaluacion, evaluacion_update
# from SISGDDO.views_sisgddo import nomestado_acuerdo, estado_acuerdo_update
# from SISGDDO.views_sisgddo import nomestado_proyecto, estado_proyecto_update
# from SISGDDO.views_sisgddo import nomtipo_proyecto, tipo_proyecto_update
# from SISGDDO.views_sisgddo import nomclasificacion, clasificacion_update
# from SISGDDO.views_sisgddo import nomfuente_financiamiento, fuente_financiamiento_update
# from SISGDDO.views_sisgddo import nomformato, formato_update
# from SISGDDO.views_sisgddo import nomestado_proyecto_dgca, estado_proyecto_dgca_update
# from SISGDDO.views_sisgddo import nomprioridad, prioridad_update
# from SISGDDO.views_sisgddo import nomperiodo, periodo_update
# from SISGDDO.views_sisgddo import nomtipo_extension, tipo_extension_update
# from SISGDDO.views_sisgddo import CambiarLogotipo

# importando path logotipo
from SISGDDO.views_sisgddo import CambiarLogotipo

# importando path logotipo
from SISGDDO.views_sisgddo import CambiarLogotipo
import notifications.urls

# handler404 = views.error404

urlpatterns = [
    # Creating a path to the index.html file.
   path("__reload__/", include("django_browser_reload.urls")),
#     path('inbox/notifications/', include(notifications.urls, namespace='notifications')),
    
#     path("prueba", xavi..prueba, name = "prueba"),
    path("cargar-datos", views_sisgddo.cargar_datos, name = "cargar_datos"),
    path("cargar-frase", views_sisgddo.cargar_frase, name = "cargar_frase"),
    path("acerca-de-SISGEPO", views_sisgddo.acerca_de, name = "acerca_de"),
    
#     #CRUD Area #javier
#     path('listar/area', views_sisgddo.listar_area, name = "listar_areas"),
#     path('adicionar/area', nomarea.as_view(), name = "agregar_area"),
#     path('modificar/area/<int:pk>', area_update.as_view(), name="modificar_area"),
# # path('activar/area/<int:id>/', views_sisgddo.act_desactarea, name="act_desactarea"),
#     path('eliminar/area/<int:id>/', views_sisgddo.eliminar_area, name="eliminar_area"),
    
#     #CRUD Area #javier
#     path('listar/evaluacion', views_sisgddo.listar_evaluacion, name = "listar_evaluaciones"),
#     path('adicionar/evaluacion', nomevaluacion.as_view(), name = "agregar_evaluacion"),
#     path('modificar/evaluacion/<int:pk>', evaluacion_update.as_view(), name="modificar_evaluacion"),
#     path('eliminar/evaluacion/<int:id>/', views_sisgddo.eliminar_evaluacion, name="eliminar_evaluacion"),
    
#     #CRUD prioridad #javier
#     path('listar/prioridad', views_sisgddo.listar_prioridad, name = "listar_prioridades"),
#     path('adicionar/prioridad', nomprioridad.as_view(), name = "agregar_prioridad"),
#     path('modificar/prioridad/<int:pk>', prioridad_update.as_view(), name="modificar_prioridad"),
# # path('activar/area/<int:id>/', views_sisgddo.act_desactarea, name="act_desactarea"),
#     path('eliminar/prioridad/<int:id>/', views_sisgddo.eliminar_prioridad, name="eliminar_prioridad"),
    
#     #CRUD prioridad #javier
#     path('listar/periodo', views_sisgddo.listar_periodo, name = "listar_periodos"),
#     path('adicionar/periodo', nomperiodo.as_view(), name = "agregar_periodo"),
#     path('modificar/periodo/<int:pk>', periodo_update.as_view(), name="modificar_periodo"),
#     path('eliminar/periodo/<int:id>/', views_sisgddo.eliminar_periodo, name="eliminar_periodo"),
    
#     #CRUD prioridad #javier
#     path('listar/tipo-extension', views_sisgddo.listar_tipo_extension, name = "listar_tipo_extension"),
#     path('adicionar/tipo-extension', nomtipo_extension.as_view(), name = "agregar_tipo_extension"),
#     path('modificar/tipo-extension/<int:pk>', tipo_extension_update.as_view(), name="modificar_tipo_extension"),
#     path('eliminar/tipo-extension/<int:id>/', views_sisgddo.eliminar_tipo_extension, name="eliminar_tipo_extension"),

#     #CRUD Línea temática #javier
#     path('listar/linea-tematica', views_sisgddo.listar_linea_tematica, name = "listar_linea_tematica"),
#     path('adicionar/linea-tematica', nomlinea_tematica.as_view(), name = "agregar_linea_tematica"),
#     path('modificar/linea-tematica/<int:pk>', linea_tematica_update.as_view(), name="modificar_linea_tematica"),
#     path('activar/linea-tematica/<int:id>/', views_sisgddo.act_desactlinea_tematica, name="act_desactlinea_tematica"),
#     path('eliminar/linea-tematica/<int:id>/', views_sisgddo.eliminar_linea_tematica, name="eliminar_linea_tematica"),

#     #CRUD Estado acuerdo #javier
#     path('listar/estado-acuerdo', views_sisgddo.listar_estado_acuerdo, name = "listar_estado_acuerdo"),
#     path('adicionar/estado-acuerdo', nomestado_acuerdo.as_view(), name = "agregar_estado_acuerdo"),
#     path('modificar/estado-acuerdo/<int:pk>', estado_acuerdo_update.as_view(), name="modificar_estado_acuerdo"),
#     path('activar/estado-acuerdo/<int:id>/', views_sisgddo.act_desactestado_acuerdo, name="act_desactestado_acuerdo"),
#     path('eliminar/estado-acuerdo/<int:id>/', views_sisgddo.eliminar_estado_acuerdo, name="eliminar_estado_acuerdo"),

#     #CRUD Estado proyecto #javier
#     path('listar/estado-proyecto', views_sisgddo.listar_estado_proyecto, name = "listar_estado_proyecto"),
#     path('adicionar/estado-proyecto', nomestado_proyecto.as_view(), name = "agregar_estado_proyecto"),
#     path('modificar/estado-proyecto/<int:pk>', estado_proyecto_update.as_view(), name="modificar_estado_proyecto"),
#     path('activar/estado-proyecto/<int:id>/', views_sisgddo.act_desactestado_proyecto, name="act_desactestado_proyecto"),
#     path('eliminar/estado-proyecto/<int:id>/', views_sisgddo.eliminar_estado_proyecto, name="eliminar_estado_proyecto"),
    
#     #CRUD Tipo proyecto #javier
#     path('listar/tipo-proyecto', views_sisgddo.listar_tipo_proyecto, name = "listar_tipo_proyecto"),
#     path('adicionar/tipo-proyecto', nomtipo_proyecto.as_view(), name = "agregar_tipo_proyecto"),
#     path('modificar/tipo-proyecto/<int:pk>', tipo_proyecto_update.as_view(), name="modificar_tipo_proyecto"),
#     path('activar/tipo-proyecto/<int:id>/', views_sisgddo.act_desacttipo_proyecto, name="act_desacttipo_proyecto"),
#     path('eliminar/tipo-proyecto/<int:id>/', views_sisgddo.eliminar_tipo_proyecto, name="eliminar_tipo_proyecto"),

#     #CRUD Tipo codigo #javier
#     path('listar/clasificacion', views_sisgddo.listar_clasificacion, name = "listar_clasificacion"),
#     path('adicionar/clasificacion', nomclasificacion.as_view(), name = "agregar_clasificacion"),
#     path('modificar/clasificacion/<int:pk>', clasificacion_update.as_view(), name="modificar_clasificacion"),
# #     path('activar/clasificacion/<int:id>/', views_sisgddo.act_desacttipo_codigo, name="act_desacttipo_codigo"),
#     path('eliminar/clasificacion/<int:id>/', views_sisgddo.eliminar_clasificacion, name="eliminar_clasificacion"),

#     #CRUD Fuente financiamiento #javier
#     path('listar/fuente-financiamiento', views_sisgddo.listar_fuente_financiamiento, name = "listar_fuente_financiamiento"),
#     path('adicionar/fuente-financiamiento', nomfuente_financiamiento.as_view(), name = "agregar_fuente_financiamiento"),
#     path('modificar/fuente-financiamiento/<int:pk>', fuente_financiamiento_update.as_view(), name="modificar_fuente_financiamiento"),
#     path('activar/fuente-financiamiento/<int:id>/', views_sisgddo.act_desactfuente_financiamiento, name="act_desactfuente_financiamiento"),
#     path('eliminar/fuente-financiamiento/<int:id>/', views_sisgddo.eliminar_fuente_financiamiento, name="eliminar_fuente_financiamiento"),
    
#     #CRUD Formato #javier
#     path('listar/formato', views_sisgddo.listar_formato, name = "listar_formato"),
#     path('adicionar/formato', nomformato.as_view(), name = "agregar_formato"),
#     path('modificar/formato/<int:pk>', formato_update.as_view(), name="modificar_formato"),
#     path('activar/formato/<int:id>/', views_sisgddo.act_desactformato, name="act_desactformato"),
#     path('eliminar/formato/<int:id>/', views_sisgddo.eliminar_formato, name="eliminar_formato"),

#     #CRUD Estado entrada #javier
#     path('listar/estado-proyecto-dgca', views_sisgddo.listar_estado_proyecto_dgca, name = "listar_estado_entrada"),
#     path('adicionar/estado-proyecto-dgca', nomestado_proyecto_dgca.as_view(), name = "agregar_estado_entrada"),
#     path('modificar/estado-proyecto-dgca/<int:pk>', estado_proyecto_dgca_update.as_view(), name="modificar_estado_entrada"),
#     path('eliminar/estado-proyecto-dgca/<int:id>/', views_sisgddo.eliminar_estado_proyecto_dgca, name="eliminar_estado_entrada"),

    #CRUD Entidad #javier
#     path('listar/entidad', views_sisgddo.listar_entidad, name = "listar_entidad"),
#     path('adicionar/entidad', nomentidad.as_view(), name = "agregar_entidad"),
#     path('modificar/entidad/<int:pk>', entidad_update.as_view(), name="modificar_entidad"),
#     path('activar/entidad/<int:id>/', views_sisgddo.act_desactentidad, name="act_desactentidad"),
#     path('eliminar/entidad/<int:id>/', views_sisgddo.eliminar_entidad, name="eliminar_entidad"),

    #CRUD Estado indicador #javier
#     path('listar/estado-indicador', views_sisgddo.listar_estado_indicador, name = "listar_estado_indicador"),
#     path('adicionar/estado-indicador', nomestado_indicador.as_view(), name = "agregar_estado_indicador"),
#     path('modificar/estado-indicador/<int:pk>', estado_indicador_update.as_view(), name="modificar_estado_indicador"),
#     path('activar/estado-indicador/<int:id>/', views_sisgddo.act_desactestado_indicador, name="act_desactestado_indicador"),
#     path('eliminar/estado-indicador/<int:id>/', views_sisgddo.eliminar_estado_indicador, name="eliminar_estado_indicador"),

    #CRUD rol proyecto #javier
#     path('listar/rol-proyecto', views_sisgddo.listar_rol_trabajador_proyecto, name = "listar_rol_trabajador_proyecto"),
#     path('adicionar/rol-proyecto', nomrol_trabajador_proyecto.as_view(), name = "agregar_rol_trabajador_proyecto"),
#     path('modificar/rol-proyecto/<int:pk>', rol_trabajador_proyecto_update.as_view(), name="modificar_rol_trabajador_proyecto"),
#     path('activar/rol-proyecto/<int:id>/', views_sisgddo.act_desactrol_proyecto, name="act_desactrol_proyecto"),
#     path('eliminar/rol-proyecto/<int:id>/', views_sisgddo.eliminar_rol_trabajador_proyecto, name="eliminar_rol_trabajador_proyecto"),

#     #CRUD proyecto #javier
#     path('listar/proyecto', views_sisgddo.listar_proyecto, name = "listar_proyecto"),
#     path('adicionar/proyecto', views_sisgddo.nomproyecto, name = "adicionar_proyecto"),
#     path('modificar/proyecto/<int:id>', views_sisgddo.proyecto_update, name="modificar_proyecto"),
#     path('activar/proyecto/<int:id>/', views_sisgddo.act_desactproyecto, name="act_desactproyecto"),
#     path('eliminar/proyecto/<int:id>/', views_sisgddo.eliminar_proyecto, name="eliminar_proyecto"),
#     path('detalle/proyecto/<int:id>/', views_sisgddo.detalle_proyecto, name= "detalle_proyecto"),
# #     path('exportar/proyecto/<int:id>/', views_sisgddo.exportar_proyecto, name= "exportar_proyecto"),

     #CRUD afectaciones #hermes
    path('listar/afectacion', views_sisgddo.listar_afectacion, name = "listar_afectacion"),
    path('crear/afectacion/', create_afectation, name='create_afectation'),
    path('activar/afectacion/<int:numero>/', views_sisgddo.act_desactafectacion, name="act_desactafectacion"),
    path('detalle/afectacion/<int:numero>/', views_sisgddo.detalle_afectacion, name= "detalle_afectacion"),
    path('eliminar/afectacion/<int:numero>/', views_sisgddo.eliminar_afectacion, name="eliminar_afectacion"),
    path('completar/afectacion/<int:numero>/', views_sisgddo.cambiar_afectacion, name='cambiar_afectacion'),
    path('modificar/afectacion/<int:numero>/', views_sisgddo.modificar_afectacion, name='modificar_afectacion'),
    path('exportar/afectacion/', views_sisgddo.exportar_afectaciones, name='exportar_afectaciones'),

 #Probar LDAP

    path('probar/ldap', views_sisgddo.prueba_LDAP, name = "prueba_LDAP"),
    path('probar/Rodas', views_sisgddo.prueba_MigrarRodas, name = "prueba_MigrarRodas"),
    path('probar/correo', views_sisgddo.prueba_Correo, name = "prueba_Correo"),

    #CRUD planes de trabajo #hermes
    path('listar/plan', views_sisgddo.listar_plan, name = "listar_plan"),
    path('listar/plan1', views_sisgddo.listar_plan1, name = "listar_plan1"),
    path('listar/plan2', views_sisgddo.listar_plan2, name = "listar_plan2"),
    path('crear/actividadEmpresa/', views_sisgddo.crearplanEmp, name='crearplanEmp'),
    path('crear/actividadCuadro/', views_sisgddo.crearplanAct, name='crearplanAct'),
    path('activar/plan/<int:id>/', views_sisgddo.act_desactplan, name="act_desactplan"),
    path('detalle/plan/<int:id>/', views_sisgddo.detalle_plan, name= "detalle_plan"),
    path('eliminar/plan/<int:id>/', views_sisgddo.eliminar_plan, name="eliminar_plan"),
    path('eliminar/plan1/<int:id>/', views_sisgddo.eliminar_plan1, name="eliminar_plan1"),
    path('modificar/plan/<int:id>/', views_sisgddo.cambiar_plan, name='cambiar_plan'),
    path('exportar/plan/', views_sisgddo.exportar_plan, name='exportar_plan'),
    path('exportar/plan1/', views_sisgddo.exportar_plan1, name='exportar_plan1'),
    path('exportar/plan2/', views_sisgddo.exportar_plan2, name='exportar_plan2'),

    path('listar/contactos', views_sisgddo.listar_contactos, name = "listar_contactos"),
    path('adicionar/contacto', views_sisgddo.agregar_contacto, name = "agregar_contacto"),
    path('modificar/contacto/<int:id>', views_sisgddo.modificar_contacto, name="modificar_contacto"),
    path('eliminar/contacto/<int:id>/', views_sisgddo.eliminar_contacto, name="eliminar_contacto"),
   

    #CRUD incidencias #hermes
    path('listar/incidencias', views_sisgddo.listar_incidencias, name="listar_incidencias"),
    path('crear/incidencias', views_sisgddo.crear_incidencias, name="crear_incidencias"),
    path('detalle/incidencias/<int:id>/', views_sisgddo.detalle_incidencias, name= "detalle_incidencias"),
    path('activar/incidencias/<int:id>/', views_sisgddo.act_desactincidencias, name="act_desactincidencias"),
    path('eliminar/incidencias/<int:id>/', views_sisgddo.eliminar_incidencias, name="eliminar_incidencias"),
    path('completar/incidencias/<int:id>/', views_sisgddo.cambiar_incidencias, name='cambiar_incidencias'),
    path('modificar/incidencias/<int:id>/', views_sisgddo.modificar_incidencias, name='modificar_incidencias'),
     path('pasar/incidencias/<int:id>/', views_sisgddo.paso_afectacion, name='paso_afectacion'),
    path('exportar/incidencias/', views_sisgddo.exportar_incidencias, name='exportar_incidencias'),
    
    #CRUD auditoria interna #hermes
    path('listar/auditoriasinternas', views_sisgddo.listar_auditoriainterna, name = "listar_auditoriainterna"),
    path('crear/auditoriasinternas', views_sisgddo.agregar_auditoriaInt, name="agregar_auditoriaInt"),
    path('activar/auditoriasinternas/<int:id>/', views_sisgddo.act_desactaudInter, name="act_desactaudInter"),
    path('detalle/auditoriasinternas/<int:id>/', views_sisgddo.detalle_audiInt, name= "detalle_audiInt"),
    path('eliminar/auditoriasinternas/<int:id>/', views_sisgddo.eliminar_auditoriasinternas, name="eliminar_auditoriasinternas"),
    path('modificar/auditoriasinternas/<int:id>/', views_sisgddo.cambiar_auditoriasinternas, name='cambiar_auditoriasinternas'),
    path('exportar/auditoriasinternas/', views_sisgddo.exportar_auditoriasinternas, name='exportar_auditoriasinternas'),

    #CRUD auditoria externa #hermes
    path('listar/auditoriasexternas', views_sisgddo.listar_auditoriaexterna, name = "listar_auditoriaexterna"),
    path('crear/auditoriasexternas', views_sisgddo.agregar_auditoriaExt, name="agregar_auditoriaExt"),
    path('activar/auditoriasexternas/<int:id>/', views_sisgddo.act_desactaudExter, name="act_desactaudExter"),
    path('detalle/auditoriasexternas/<int:id>/', views_sisgddo.detalle_audiExt, name= "detalle_audiExt"),
    path('eliminar/auditoriasexternas/<int:id>/', views_sisgddo.eliminar_auditoriasexternas, name="eliminar_auditoriasexternas"),
    path('modificar/auditoriasexternas/<int:id>/', views_sisgddo.cambiar_auditoriasexternas, name='cambiar_auditoriasexternas'),
    path('exportar/auditoriasexternas/', views_sisgddo.exportar_auditoriasexternas, name='exportar_auditoriasexternas'),
    



    #CRUD proyecto #javier
    # proyecto es lo mismo que proyecto, pero reciben tratamiento diferente
#     path('listar/proyecto', views_sisgddo.listar_proyecto, name = "listar_proyecto"),
#     path('adicionar/proyecto', views_sisgddo.nomproyecto, name = "adicionar_proyecto"),
#     path('modificar/proyecto/<int:id>', views_sisgddo.proyecto_update, name="modificar_proyecto"),
#     path('activar/proyecto/<int:id>/', views_sisgddo.act_desactproyecto, name="act_desactproyecto"),
#     path('eliminar/proyecto/<int:id>/', views_sisgddo.eliminar_proyecto, name="eliminar_proyecto"),
#     path('detalle/proyecto/<int:id>/', views_sisgddo.detalle_proyecto, name= "detalle_proyecto"),

#     #CRUD entradas_proyecto #javier
#     # path('listar/entrada_proyecto', views_sisgddo.listar_entrada_proyecto, name = "listar_entrada_proyecto"),
#     path('adicionar/entrada_proyecto/<int:id>', views_sisgddo.nomentrada_proyecto, name = "adicionar_entrada_proyecto"),
#     path('modificar/entrada_proyecto/<int:id>', views_sisgddo.entrada_proyecto_update, name="modificar_entrada_proyecto"),
#     path('activar/entrada_proyecto/<int:id>/', views_sisgddo.act_desactentrada_proyecto, name="act_desactentrada_proyecto"),
#     path('eliminar/entrada_proyecto/<int:id>/', views_sisgddo.eliminar_entrada_proyecto, name="eliminar_entrada_proyecto"),

#     #CRUD premios #javier
#     path('listar/premio', views_sisgddo.listar_premio, name = "listar_premio"),
#     path('adicionar/premio', views_sisgddo.nompremio, name = "adicionar_premio"),
#     path('modificar/premio/<int:id>', views_sisgddo.premio_update, name="modificar_premio"),
#     path('activar/premio/<int:id>/', views_sisgddo.act_desactpremio, name="act_desactpremio"),
#     path('eliminar/premio/<int:id>/', views_sisgddo.eliminar_premio, name="eliminar_premio"),
#     path('detalle/premio/<int:id>/', views_sisgddo.detalle_premio, name= "detalle_premio"),

#     #CRUD acuerdos #javier
#     path('listar/acuerdo', views_sisgddo.listar_acuerdo, name = "listar_acuerdo"),
#     path('adicionar/acuerdo', views_sisgddo.nomacuerdo, name = "adicionar_acuerdo"),
#     path('modificar/acuerdo/<int:id>', views_sisgddo.acuerdo_update, name="modificar_acuerdo"),
#     path('activar/acuerdo/<int:id>/', views_sisgddo.act_desactacuerdo, name="act_desactacuerdo"),
#     path('eliminar/acuerdo/<int:id>/', views_sisgddo.eliminar_acuerdo, name="eliminar_acuerdo"),
#     path('detalle/acuerdo/<int:id>/', views_sisgddo.detalle_acuerdo, name= "detalle_acuerdo"),

#     #CRUD objetivo #javier
#     path('listar/objetivo', views_sisgddo.listar_objetivo, name = "listar_objetivo"),
#     path('adicionar/objetivo', views_sisgddo.nomobjetivo, name = "adicionar_objetivo"),
#     path('modificar/objetivo/<int:id>', views_sisgddo.objetivo_update, name="modificar_objetivo"),
#     path('activar/objetivo/<int:id>/', views_sisgddo.act_desactobjetivo, name="act_desactobjetivo"),
#     path('eliminar/objetivo/<int:id>/', views_sisgddo.eliminar_objetivo, name="eliminar_objetivo"),
#     path('detalle/objetivo/<int:id>/', views_sisgddo.detalle_objetivo, name= "detalle_objetivo"),
#     path('evaluar/objetivo/', views_sisgddo.evaluar_objetivo, name= "evaluar_objetivo"),

#     #CRUD indicador_objetivo #javier
#     path('listar/indicador_objetivo', views_sisgddo.listar_indicador_objetivo, name = "listar_indicador_objetivo"),
#     path('adicionar/indicador_objetivo/<int:id>', views_sisgddo.nomindicador_objetivo, name = "adicionar_indicador_objetivo"),
#     path('modificar/indicador_objetivo/<int:id>', views_sisgddo.indicador_objetivo_update, name="modificar_indicador_objetivo"),
#     path('activar/indicador_objetivo/<int:id>/', views_sisgddo.act_desactindicador_objetivo, name="act_desactindicador_objetivo"),
#     path('eliminar/indicador_objetivo/<int:id>/', views_sisgddo.eliminar_indicador_objetivo, name="eliminar_indicador_objetivo"),
#     path('detalle/indicador_objetivo/<int:id>/', views_sisgddo.detalle_indicador_objetivo, name= "detalle_indicador_objetivo"),

#     #CRUD accion_indicador #javier
#     path('listar/accion_indicador', views_sisgddo.listar_accion_indicador_objetivo, name = "listar_accion_indicador_objetivo"),
#     path('adicionar/accion_indicador/<int:id>', views_sisgddo.nomaccion_indicador_objetivo, name = "adicionar_accion_indicador_objetivo"),
#     path('modificar/accion_indicador/<int:id>', views_sisgddo.accion_indicador_objetivo_update, name="modificar_accion_indicador_objetivo"),
#     path('activar/accion_indicador/<int:id>/', views_sisgddo.act_desactaccion_indicador_objetivo, name="act_desactaccion_indicador_objetivo"),
#     path('eliminar/accion_indicador/<int:id>/', views_sisgddo.eliminar_accion_indicador_objetivo, name="eliminar_accion_indicador_objetivo"),
#     path('detalle/accion_indicador/<int:id>/', views_sisgddo.detalle_accion_indicador_objetivo, name= "detalle_accion_indicador_objetivo"),

#     #CRUD sosi #javier
#     path('listar/sosi', views_sisgddo.listar_sosi, name = "listar_sosi"),
#     path('adicionar/sosi/<int:id>', views_sisgddo.nomsosi, name = "adicionar_sosi"),
#     path('modificar/sosi/<int:id>', views_sisgddo.sosi_update, name="modificar_sosi"),
#     path('activar/sosi/<int:id>/', views_sisgddo.act_desactsosi, name="act_desactsosi"),
#     path('eliminar/sosi/<int:id>/', views_sisgddo.eliminar_sosi, name="eliminar_sosi"),
#     path('detalle/sosi/<int:id>/', views_sisgddo.detalle_sosi, name= "detalle_sosi"),







     # # EXPORTAR Javier
     # # path('intermedia/', views_sisgddo.intermedia, name="intermedia"),
     # path('exportar/',
     #     views_sisgddo.exportar, name="exportar"),
    
    path('', views_sisgddo.DashboardGraficobarra.as_view(), name="inicio"),
    
    path('notificar', views_sisgddo.notificar, name='notificar'),
    
    path('admin/', admin.site.urls),
    path('i18n/', include('django.conf.urls.i18n')),
    path('accounts/login/', views.loguear, name='ce_login'),
    path('login/', views.just_login, name='just_login'),
    path('logout/', views.logout, name='logout'),

    path('administration/grupo/list', login_required(views.group_list), name="group_list"),
    path('administration/grupo/create', login_required(views.group_create), name='group_create'),
    path('administration/grupo/update/<int:pk>',
         permission_required('auth.add_user', login_url='ce_login')(forms.GroupUpdate.as_view()),
         name='group_update'),
    path('administration/grupo/delete/<int:pk>/',
         permission_required('auth.add_user', login_url='ce_login')(forms.GroupDelete.as_view()),
         name='group_delete'),
    path('administration/grupo/detalle/<int:pk>/',
         permission_required('auth.add_user', login_url='ce_login')(forms.GroupUpdate.as_view()),
         name='group_detalle'),
    path('administration/user/list', login_required(views.user_list), name="user_list"),
    path('administration/user/create', login_required(views.user_create), name='user_create'),
    path('administration/user/update/<int:pk>',forms.UserUpdate.as_view(),name='user_update'),
    path('administration/user/detail/<int:pk>',login_required(forms.UserDetail.as_view()),name='user_detail'),
    path('administration/user/delete/<int:pk>/',login_required(forms.UserDelete.as_view()),name='user_delete'),
    path('administration/user/activate/<int:pk>/',login_required(forms.UserActivate.as_view()),name='user_activate'),
    path('administration/password/update/<int:pk>/', login_required(views.password_update),name='password_update'),
    path('administration/password/updateadmin/<int:pk>/', login_required(views.password_update_admin),
         name='password_updateadmin'),

    # USUARIO
    path('user/password/reset/', views.PasswordResetView.as_view(),
         {'post_reset_redirect': '/user/password/reset/done/'}, name='password_reset'),
    path('user/password/reset/done/',
         djangoViews.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', djangoViews.PasswordResetConfirmView.as_view(),
         {'post_reset_redirect': '/user/reset/done/'}, name='password_reset_confirm'),
    path('user/reset/done/', djangoViews.PasswordResetCompleteView.as_view(),
         name='password_reset_complete'),
    path('good/count/activated', views.count_activated,
         name='account_activation_sent'),
    path('activate/<uidb64>/<token>/', views.activate, name='activate'),
    path('user/update/<int:pk>', login_required(forms.UserUpdateAdmin.as_view()), name="profile"),

    # logs del sistema
    path('administration/logs/list',
         login_required(views.history_list), name="history_list"),
    path('administration/logs/first_list',
         login_required(views.history_list_300), name="history_list_300"),

    # NOTIFICACIONES
    path('inbox/notifications/', include(notiURL, namespace='notifications')),
    path('notifications/read/<int:action>',
         login_required(views.notificacion_read), name="notificacion_read"),

    path('notifications/mark_noti_all_read',
         login_required(views.notification_all_mark_read), name="mark_all_read"),
    path('notifications/mark_noti_offer_all_read',
         login_required(views.notification_offer_all_mark_read), name="mark_offer_all_read"),

    # CAMBIAR LOGO
    path('cambiar/logo', CambiarLogotipo.as_view(), name="cambiar_logo"),

    # Salva y Reastaura bdd
    path('administration/db/list', views.db_list, name="db_list"),
    path('administration/db/save', views.db_save, name="db_save"),
    path('administration/db/restore/',
         views.db_restore, name="db_restore"),

    # Importar CSV sosi
#     path('importar/CSV/', views_sisgddo.ImportarCSV, name="importarCSV"),

    # EXCEPCIONES
    path('error500', views.error500, name="error500"),
    path('error404', views.error404, name="error404"),
    path('error403', views.error403, name="error403"),

    # URL FROM APPS
    path('', include(('apps.base.urls', 'apps.base'), namespace='base')),
    path('', include(('apps.complaints.urls', 'apps.complaints'), namespace='complaints')),
    path('', include(('apps.effectiveness.urls',
         'apps.effectiveness'), namespace='effectiveness')),
    path('', include(('apps.iproperty.urls', 'apps.iproperty'), namespace='iproperty')),
    path('', include(('apps.licenses.urls', 'apps.licenses'), namespace='licenses')),
    path('', include('xavi.urls')),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


