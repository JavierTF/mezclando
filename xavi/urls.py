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
from ProyectoBaseApp import views as view_proyecto, forms
from SISGDDO import views_sisgddo
from xavi.views import nomlinea_tematica, nomestado_proyecto, nomformato
from SISGDDO.views_sisgddo import create_afectation

# moduloJavier
from xavi import views
from xavi.views import nomarea, area_update
from xavi.views import nomautor, autor_update
from xavi.views import nomtipo_moneda, tipo_moneda_update
from xavi.views import nomcliente, cliente_update
from xavi.views import nomidioma, idioma_update
from xavi.views import nomrepresentante, representante_update
from xavi.views import nomevaluacion, evaluacion_update
from xavi.views import nomlinea_tematica, linea_tematica_update
from xavi.views import nomestado_acuerdo, estado_acuerdo_update
from xavi.views import nomestado_proyecto, estado_proyecto_update
from xavi.views import nometapa_proyecto, etapa_proyecto_update
from xavi.views import nomtipo_proyecto, tipo_proyecto_update
from xavi.views import nomclasificacion, clasificacion_update
from xavi.views import nomsubclasificacion, subclasificacion_update
from xavi.views import nomfuente_financiamiento, fuente_financiamiento_update
from xavi.views import nomformato, formato_update
from xavi.views import nomestado_proyecto_dgca, estado_proyecto_dgca_update
from xavi.views import nomprioridad, prioridad_update
from xavi.views import nomperiodo, periodo_update
from xavi.views import nomtipo_extension, tipo_extension_update
# from SISGDDO.views import nomentidad, entidad_update
# from SISGDDO.views import nomestado_indicador, estado_indicador_update
# from SISGDDO.views import nomrol_trabajador_proyecto, rol_trabajador_proyecto_update
import notifications.urls

# handler404 = views.error404

urlpatterns = [
    # Creating a path to the index.html file.
    # path("__reload__/", include("django_browser_reload.urls")),
#     path('inbox/notifications/', include(notifications.urls, namespace='notifications')),
    
    path("prueba", views.prueba, name = "prueba"),
#     path("cargar-datos", views.cargar_datos, name = "cargar_datos"),
#     path("cargar-frase", views.cargar_frase, name = "cargar_frase"),
#     path("acerca-de-SISGEPO", views.acerca_de, name = "acerca_de"),
     # path('intermedia/', views.intermedia, name="intermedia"),
    path('exportar/', views.exportar, name="exportar"),
    
    #CRUD Area #javier
    path('listar/area', views.listar_area, name = "listar_areas"),
    path('adicionar/area', nomarea.as_view(), name = "agregar_area"),
    path('modificar/area/<int:pk>', area_update.as_view(), name="modificar_area"),
    path('eliminar/area/<int:id>/', views.eliminar_area, name="eliminar_area"),
    
    #CRUD Cliente #javier
    path('listar/cliente', views.listar_cliente, name = "listar_clientes"),
    path('adicionar/cliente', nomcliente.as_view(), name = "agregar_cliente"),
    path('modificar/cliente/<int:pk>', cliente_update.as_view(), name="modificar_cliente"),
    path('eliminar/cliente/<int:id>/', views.eliminar_cliente, name="eliminar_cliente"),
    
    #CRUD autor #javier
    path('listar/autor', views.listar_autor, name = "listar_autor"),
    path('adicionar/autor', nomautor.as_view(), name = "agregar_autor"),
    path('modificar/autor/<int:pk>', autor_update.as_view(), name="modificar_autor"),
    path('eliminar/autor/<int:id>/', views.eliminar_autor, name="eliminar_autor"),
    
    #CRUD Idioma #javier
    path('listar/idioma', views.listar_idioma, name = "listar_idiomas"),
    path('adicionar/idioma', nomidioma.as_view(), name = "agregar_idioma"),
    path('modificar/idioma/<int:pk>', idioma_update.as_view(), name="modificar_idioma"),
    path('eliminar/idioma/<int:id>/', views.eliminar_idioma, name="eliminar_idioma"),
    
    #CRUD Representante #javier
    path('listar/representante', views.listar_representante, name = "listar_representantes"),
    path('adicionar/representante', nomrepresentante.as_view(), name = "agregar_representante"),
    path('modificar/representante/<int:pk>', representante_update.as_view(), name="modificar_representante"),
    path('eliminar/representante/<int:id>/', views.eliminar_representante, name="eliminar_representante"),
    
    #CRUD Area #javier
    path('listar/evaluacion', views.listar_evaluacion, name = "listar_evaluaciones"),
    path('adicionar/evaluacion', nomevaluacion.as_view(), name = "agregar_evaluacion"),
    path('modificar/evaluacion/<int:pk>', evaluacion_update.as_view(), name="modificar_evaluacion"),
    path('eliminar/evaluacion/<int:id>/', views.eliminar_evaluacion, name="eliminar_evaluacion"),
    
    #CRUD prioridad #javier
    path('listar/prioridad', views.listar_prioridad, name = "listar_prioridades"),
    path('adicionar/prioridad', nomprioridad.as_view(), name = "agregar_prioridad"),
    path('modificar/prioridad/<int:pk>', prioridad_update.as_view(), name="modificar_prioridad"),
# path('activar/area/<int:id>/', views.act_desactarea, name="act_desactarea"),
    path('eliminar/prioridad/<int:id>/', views.eliminar_prioridad, name="eliminar_prioridad"),
    
    #CRUD prioridad #javier
    path('listar/periodo', views.listar_periodo, name = "listar_periodos"),
    path('adicionar/periodo', nomperiodo.as_view(), name = "agregar_periodo"),
    path('modificar/periodo/<int:pk>', periodo_update.as_view(), name="modificar_periodo"),
    path('eliminar/periodo/<int:id>/', views.eliminar_periodo, name="eliminar_periodo"),
    
    #CRUD prioridad #javier
    path('listar/tipo-extension', views.listar_tipo_extension, name = "listar_tipo_extension"),
    path('adicionar/tipo-extension', nomtipo_extension.as_view(), name = "agregar_tipo_extension"),
    path('modificar/tipo-extension/<int:pk>', tipo_extension_update.as_view(), name="modificar_tipo_extension"),
    path('eliminar/tipo-extension/<int:id>/', views.eliminar_tipo_extension, name="eliminar_tipo_extension"),
    
    #CRUD tipo-moneda #javier
    path('listar/tipo-moneda', views.listar_tipo_moneda, name = "listar_tipo_moneda"),
    path('adicionar/tipo-moneda', nomtipo_moneda.as_view(), name = "agregar_tipo_moneda"),
    path('modificar/tipo-moneda/<int:pk>', tipo_moneda_update.as_view(), name="modificar_tipo_moneda"),
    path('eliminar/tipo-moneda/<int:id>/', views.eliminar_tipo_moneda, name="eliminar_tipo_moneda"),

    #CRUD Línea temática #javier
    path('listar/linea-tematica', views.listar_linea_tematica, name = "listar_linea_tematica"),
    path('adicionar/linea-tematica', nomlinea_tematica.as_view(), name = "agregar_linea_tematica"),
    path('modificar/linea-tematica/<int:pk>', linea_tematica_update.as_view(), name="modificar_linea_tematica"),
#     path('activar/linea-tematica/<int:id>/', views.act_desactlinea_tematica, name="act_desactlinea_tematica"),
    path('eliminar/linea-tematica/<int:id>/', views.eliminar_linea_tematica, name="eliminar_linea_tematica"),

    #CRUD Estado acuerdo #javier
    path('listar/estado-acuerdo', views.listar_estado_acuerdo, name = "listar_estado_acuerdo"),
    path('adicionar/estado-acuerdo', nomestado_acuerdo.as_view(), name = "agregar_estado_acuerdo"),
    path('modificar/estado-acuerdo/<int:pk>', estado_acuerdo_update.as_view(), name="modificar_estado_acuerdo"),
#     path('activar/estado-acuerdo/<int:id>/', views.act_desactestado_acuerdo, name="act_desactestado_acuerdo"),
    path('eliminar/estado-acuerdo/<int:id>/', views.eliminar_estado_acuerdo, name="eliminar_estado_acuerdo"),

    #CRUD Estado proyecto #javier
    path('listar/estado-proyecto', views.listar_estado_proyecto, name = "listar_estado_proyecto"),
    path('adicionar/estado-proyecto', nomestado_proyecto.as_view(), name = "agregar_estado_proyecto"),
    path('modificar/estado-proyecto/<int:pk>', estado_proyecto_update.as_view(), name="modificar_estado_proyecto"),
#     path('activar/estado-proyecto/<int:id>/', views.act_desactestado_proyecto, name="act_desactestado_proyecto"),
    path('eliminar/estado-proyecto/<int:id>/', views.eliminar_estado_proyecto, name="eliminar_estado_proyecto"),
    
    #CRUD Etapa proyecto #javier
    path('listar/etapa-proyecto', views.listar_etapa_proyecto, name = "listar_etapa_proyecto"),
    path('adicionar/etapa-proyecto', nometapa_proyecto.as_view(), name = "agregar_etapa_proyecto"),
    path('modificar/etapa-proyecto/<int:pk>', etapa_proyecto_update.as_view(), name="modificar_etapa_proyecto"),
#     path('activar/estado-proyecto/<int:id>/', views.act_desactestado_proyecto, name="act_desactestado_proyecto"),
    path('eliminar/etapa-proyecto/<int:id>/', views.eliminar_etapa_proyecto, name="eliminar_etapa_proyecto"),
    
    #CRUD Tipo proyecto #javier
    path('listar/tipo-proyecto', views.listar_tipo_proyecto, name = "listar_tipo_proyecto"),
    path('adicionar/tipo-proyecto', nomtipo_proyecto.as_view(), name = "agregar_tipo_proyecto"),
    path('modificar/tipo-proyecto/<int:pk>', tipo_proyecto_update.as_view(), name="modificar_tipo_proyecto"),
#     path('activar/tipo-proyecto/<int:id>/', views.act_desacttipo_proyecto, name="act_desacttipo_proyecto"),
    path('eliminar/tipo-proyecto/<int:id>/', views.eliminar_tipo_proyecto, name="eliminar_tipo_proyecto"),

    #CRUD Tipo codigo #javier
    path('listar/clasificacion', views.listar_clasificacion, name = "listar_clasificacion"),
    path('adicionar/clasificacion', nomclasificacion.as_view(), name = "agregar_clasificacion"),
    path('modificar/clasificacion/<int:pk>', clasificacion_update.as_view(), name="modificar_clasificacion"),
#     path('activar/clasificacion/<int:id>/', views.act_desacttipo_codigo, name="act_desacttipo_codigo"),
    path('eliminar/clasificacion/<int:id>/', views.eliminar_clasificacion, name="eliminar_clasificacion"),
    
    #CRUD Tipo codigo #javier
    path('listar/subclasificacion', views.listar_subclasificacion, name = "listar_subclasificacion"),
    path('adicionar/subclasificacion', nomsubclasificacion.as_view(), name = "agregar_subclasificacion"),
    path('modificar/subclasificacion/<int:pk>', subclasificacion_update.as_view(), name="modificar_subclasificacion"),
#     path('activar/clasificacion/<int:id>/', views.act_desacttipo_codigo, name="act_desacttipo_codigo"),
    path('eliminar/subclasificacion/<int:id>/', views.eliminar_subclasificacion, name="eliminar_subclasificacion"),

    #CRUD Fuente financiamiento #javier
    path('listar/fuente-financiamiento', views.listar_fuente_financiamiento, name = "listar_fuente_financiamiento"),
    path('adicionar/fuente-financiamiento', nomfuente_financiamiento.as_view(), name = "agregar_fuente_financiamiento"),
    path('modificar/fuente-financiamiento/<int:pk>', fuente_financiamiento_update.as_view(), name="modificar_fuente_financiamiento"),
#     path('activar/fuente-financiamiento/<int:id>/', views.act_desactfuente_financiamiento, name="act_desactfuente_financiamiento"),
    path('eliminar/fuente-financiamiento/<int:id>/', views.eliminar_fuente_financiamiento, name="eliminar_fuente_financiamiento"),
    
    #CRUD Formato #javier
    path('listar/formato', views.listar_formato, name = "listar_formato"),
    path('adicionar/formato', nomformato.as_view(), name = "agregar_formato"),
    path('modificar/formato/<int:pk>', formato_update.as_view(), name="modificar_formato"),
#     path('activar/formato/<int:id>/', views.act_desactformato, name="act_desactformato"),
    path('eliminar/formato/<int:id>/', views.eliminar_formato, name="eliminar_formato"),

    #CRUD Estado entrada #javier
    path('listar/estado-proyecto-dgca', views.listar_estado_proyecto_dgca, name = "listar_estado_entrada"),
    path('adicionar/estado-proyecto-dgca', nomestado_proyecto_dgca.as_view(), name = "agregar_estado_entrada"),
    path('modificar/estado-proyecto-dgca/<int:pk>', estado_proyecto_dgca_update.as_view(), name="modificar_estado_entrada"),
    path('eliminar/estado-proyecto-dgca/<int:id>/', views.eliminar_estado_proyecto_dgca, name="eliminar_estado_entrada"),
    
    #CRUD entradas_proyecto #javier
    # path('listar/entrada_proyecto', views_sisgddo.listar_entrada_proyecto, name = "listar_entrada_proyecto"),
    path('adicionar/entrada_proyecto/<int:id>', views.nomentrada_proyecto, name = "adicionar_entrada_proyecto"),
    path('modificar/entrada_proyecto/<int:id>', views.entrada_proyecto_update, name="modificar_entrada_proyecto"),
    # path('activar/entrada_proyecto/<int:id>/', views.act_desactentrada_proyecto, name="act_desactentrada_proyecto"),
    path('eliminar/entrada_proyecto/<int:id>/', views.eliminar_entrada_proyecto, name="eliminar_entrada_proyecto"),

    #CRUD Entidad #javier
#     path('listar/entidad', views.listar_entidad, name = "listar_entidad"),
#     path('adicionar/entidad', nomentidad.as_view(), name = "agregar_entidad"),
#     path('modificar/entidad/<int:pk>', entidad_update.as_view(), name="modificar_entidad"),
#     path('activar/entidad/<int:id>/', views.act_desactentidad, name="act_desactentidad"),
#     path('eliminar/entidad/<int:id>/', views.eliminar_entidad, name="eliminar_entidad"),

    #CRUD Estado indicador #javier
#     path('listar/estado-indicador', views.listar_estado_indicador, name = "listar_estado_indicador"),
#     path('adicionar/estado-indicador', nomestado_indicador.as_view(), name = "agregar_estado_indicador"),
#     path('modificar/estado-indicador/<int:pk>', estado_indicador_update.as_view(), name="modificar_estado_indicador"),
#     path('activar/estado-indicador/<int:id>/', views.act_desactestado_indicador, name="act_desactestado_indicador"),
#     path('eliminar/estado-indicador/<int:id>/', views.eliminar_estado_indicador, name="eliminar_estado_indicador"),

    #CRUD rol proyecto #javier
#     path('listar/rol-proyecto', views.listar_rol_trabajador_proyecto, name = "listar_rol_trabajador_proyecto"),
#     path('adicionar/rol-proyecto', nomrol_trabajador_proyecto.as_view(), name = "agregar_rol_trabajador_proyecto"),
#     path('modificar/rol-proyecto/<int:pk>', rol_trabajador_proyecto_update.as_view(), name="modificar_rol_trabajador_proyecto"),
#     path('activar/rol-proyecto/<int:id>/', views.act_desactrol_proyecto, name="act_desactrol_proyecto"),
#     path('eliminar/rol-proyecto/<int:id>/', views.eliminar_rol_trabajador_proyecto, name="eliminar_rol_trabajador_proyecto"),

    #CRUD proyecto #javier
    path('listar/proyecto', views.listar_proyecto, name = "listar_proyecto"),
    path('adicionar/proyecto', views.nomproyecto, name = "adicionar_proyecto"),
    path('modificar/proyecto/<int:id>', views.proyecto_update, name="modificar_proyecto"),
    path('modificar/aprobacion/<int:id>', views.aprobacion_update, name="modificar_aprobacion"),
#     path('activar/proyecto/<int:id>/', views.act_desactproyecto, name="act_desactproyecto"),
    path('eliminar/proyecto/<int:id>/', views.eliminar_proyecto, name="eliminar_proyecto"),
    path('detalle/proyecto/<int:id>/', views.detalle_proyecto, name= "detalle_proyecto"),
    path('detalle/aprobacion/<int:id>/', views.detalle_aprobacion, name= "detalle_aprobacion"),
    path('adicionar/terminacion/<int:id>/', views.nomterminacion, name = "adicionar_terminacion"),
    path('adicionar/interrupcion/<int:id>/', views.nominterrupcion, name = "adicionar_interrupcion"),
    path('adicionar/reinicio/<int:id>/', views.nomreinicio, name = "adicionar_reinicio"),
    path('adicionar/extension/<int:id>/', views.nomextension, name = "adicionar_extension"),
    path('adicionar/control-etapa/<int:id>/', views.nomcontrol_etapa, name = "adicionar_control_etapa"),
    path('modificar/control-etapa/<int:id>/', views.control_etapa_update, name = "modificar_control_etapa"),
    path('detalle/control-etapa/<int:id>/', views.detalle_control_etapa, name = "detalle_control_etapa"),
    path('modificar/reinicio/<int:id>/', views.reinicio_update, name = "modificar_reinicio"),
    path('modificar/interrupcion/<int:id>/', views.interrupcion_update, name = "modificar_interrupcion"),
    path('modificar/extension/<int:id>/', views.extension_update, name = "modificar_extension"),
    path('detalle/interrupcion/<int:id>/', views.detalle_interrupcion, name = "detalle_interrupcion"),
    path('detalle/reinicio/<int:id>/', views.detalle_reinicio, name = "detalle_reinicio"),
    path('modificar/terminacion/<int:id>/', views.terminacion_update, name = "modificar_terminacion"),
    path('detalle/terminacion/<int:id>/', views.detalle_terminacion, name= "detalle_terminacion"),
    path('detalle/extension/<int:id>/', views.detalle_extension, name= "detalle_extension"),
#     path('exportar/proyecto/<int:id>/', views.exportar_proyecto, name= "exportar_proyecto"),

    path('cargar-subclasificacion/', views.cargar_subclasificacion, name= "cargar_subclasificacion"),

    #CRUD registro_aprobacion #javier
    # path('listar/registro_aprobacion', views.listar_registro_aprobacion, name = "listar_registro_aprobacion"),
    # path('adicionar/registro_aprobacion', views.nompregistro_aprobacion, name = "adicionar_registro_aprobacion"),
    # path('modificar/registro_aprobacion/<int:id>', views.registro_aprobacion_update, name="modificar_registro_aprobacion"),
    # path('eliminar/registro_aprobacion/<int:id>/', views.eliminar_registro_aprobacion, name="eliminar_registro_aprobacion"),
    # path('detalle/registro_aprobacion/<int:id>/', views.detalle_registro_aprobacion, name= "detalle_registro_aprobacion"),
#     path('exportar/proyecto/<int:id>/', views.exportar_proyecto, name= "exportar_proyecto"),

     #CRUD afectaciones #hermes
#     path('listar/afectacion', views.listar_afectacion, name = "listar_afectacion"),
#     path('crear/afectacion/', create_afectation, name='create_afectation'),
#     path('activar/afectacion/<int:numero>/', views.act_desactafectacion, name="act_desactafectacion"),
#     path('detalle/afectacion/<int:numero>/', views.detalle_afectacion, name= "detalle_afectacion"),
#     path('eliminar/afectacion/<int:numero>/', views.eliminar_afectacion, name="eliminar_afectacion"),
#     path('completar/afectacion/<int:numero>/', views.cambiar_afectacion, name='cambiar_afectacion'),
#     path('modificar/afectacion/<int:numero>/', views.modificar_afectacion, name='modificar_afectacion'),
#     path('exportar/afectacion/', views.exportar_afectaciones, name='exportar_afectaciones'),


    #CRUD planes de trabajo #hermes
#     path('listar/plan', views.listar_plan, name = "listar_plan"),
#     path('listar/plan1', views.listar_plan1, name = "listar_plan1"),
#     path('listar/plan2', views.listar_plan2, name = "listar_plan2"),
#     path('crear/actividadGrupo/', views.crearplan, name='crearplan'),
#     path('crear/actividadEmpresa/', views.crearplan1, name='crearplan1'),
#     path('crear/actividadCuadro/', views.crearplan2, name='crearplan2'),
#     path('activar/plan/<int:id>/', views.act_desactplan, name="act_desactplan"),
#     path('detalle/plan/<int:id>/', views.detalle_plan, name= "detalle_plan"),
#     path('eliminar/plan/<int:id>/', views.eliminar_plan, name="eliminar_plan"),
#     path('modificar/plan/<int:id>/', views.cambiar_plan, name='cambiar_plan'),
#     path('exportar/plan/', views.exportar_plan, name='exportar_plan'),
#     path('exportar/plan1/', views.exportar_plan1, name='exportar_plan1'),
#     path('exportar/plan2/', views.exportar_plan2, name='exportar_plan2'),

   

    #CRUD incidencias #hermes
#     path('listar/incidencias', views.listar_incidencias, name="listar_incidencias"),
#     path('crear/incidencias', views.crear_incidencias, name="crear_incidencias"),
#     path('detalle/incidencias/<int:id>/', views.detalle_incidencias, name= "detalle_incidencias"),
#     path('activar/incidencias/<int:id>/', views.act_desactincidencias, name="act_desactincidencias"),
#     path('eliminar/incidencias/<int:id>/', views.eliminar_incidencias, name="eliminar_incidencias"),
#     path('completar/incidencias/<int:id>/', views.cambiar_incidencias, name='cambiar_incidencias'),
#     path('modificar/incidencias/<int:id>/', views.modificar_incidencias, name='modificar_incidencias'),
#     path('exportar/incidencias/', views.exportar_incidencias, name='exportar_incidencias'),
    
    #CRUD auditoria interna #hermes
#     path('listar/auditoriasinternas', views.listar_auditoriainterna, name = "listar_auditoriainterna"),
#     path('crear/auditoriasinternas', views.agregar_auditoriaInt, name="agregar_auditoriaInt"),
#     path('activar/auditoriasinternas/<int:id>/', views.act_desactaudInter, name="act_desactaudInter"),
#     path('detalle/auditoriasinternas/<int:id>/', views.detalle_audiInt, name= "detalle_audiInt"),
#     path('eliminar/auditoriasinternas/<int:id>/', views.eliminar_auditoriasinternas, name="eliminar_auditoriasinternas"),
#     path('modificar/auditoriasinternas/<int:id>/', views.cambiar_auditoriasinternas, name='cambiar_auditoriasinternas'),
#     path('exportar/auditoriasinternas/', views.exportar_auditoriasinternas, name='exportar_auditoriasinternas'),

    #CRUD auditoria externa #hermes
#     path('listar/auditoriasexternas', views.listar_auditoriaexterna, name = "listar_auditoriaexterna"),
#     path('crear/auditoriasexternas', views.agregar_auditoriaExt, name="agregar_auditoriaExt"),
#     path('activar/auditoriasexternas/<int:id>/', views.act_desactaudExter, name="act_desactaudExter"),
#     path('detalle/auditoriasexternas/<int:id>/', views.detalle_audiExt, name= "detalle_audiExt"),
#     path('eliminar/auditoriasexternas/<int:id>/', views.eliminar_auditoriasexternas, name="eliminar_auditoriasexternas"),
#     path('modificar/auditoriasexternas/<int:id>/', views.cambiar_auditoriasexternas, name='cambiar_auditoriasexternas'),
#     path('exportar/auditoriasexternas/', views.exportar_auditoriasexternas, name='exportar_auditoriasexternas'),
    



    #CRUD proyecto #javier
    # proyecto es lo mismo que proyecto, pero reciben tratamiento diferente
#     path('listar/proyecto', views.listar_proyecto, name = "listar_proyecto"),
#     path('adicionar/proyecto', views.nomproyecto, name = "adicionar_proyecto"),
#     path('modificar/proyecto/<int:id>', views.proyecto_update, name="modificar_proyecto"),
#     path('activar/proyecto/<int:id>/', views.act_desactproyecto, name="act_desactproyecto"),
#     path('eliminar/proyecto/<int:id>/', views.eliminar_proyecto, name="eliminar_proyecto"),
#     path('detalle/proyecto/<int:id>/', views.detalle_proyecto, name= "detalle_proyecto"),

    #CRUD premios #javier
    path('listar/premio', views.listar_premio, name = "listar_premio"),
    path('listar/premio/<str:orden>', views.listar_premio, name = "listar_premio_orden"),
    path('adicionar/premio', views.nompremio, name = "adicionar_premio"),
    path('modificar/premio/<int:id>', views.premio_update, name="modificar_premio"),
#     path('activar/premio/<int:id>/', views.act_desactpremio, name="act_desactpremio"),
    path('eliminar/premio/<int:id>/', views.eliminar_premio, name="eliminar_premio"),
    path('detalle/premio/<int:id>/', views.detalle_premio, name= "detalle_premio"),

    #CRUD acuerdos #javier
    path('listar/acuerdo', views.listar_acuerdo, name = "listar_acuerdo"),
    path('adicionar/acuerdo', views.nomacuerdo, name = "adicionar_acuerdo"),
    path('modificar/acuerdo/<int:id>', views.acuerdo_update, name="modificar_acuerdo"),
#     path('activar/acuerdo/<int:id>/', views.act_desactacuerdo, name="act_desactacuerdo"),
    path('eliminar/acuerdo/<int:id>/', views.eliminar_acuerdo, name="eliminar_acuerdo"),
    path('detalle/acuerdo/<int:id>/', views.detalle_acuerdo, name= "detalle_acuerdo"),

    #CRUD objetivo #javier
    path('listar/objetivo', views.listar_objetivo, name = "listar_objetivo"),
    path('adicionar/objetivo', views.nomobjetivo, name = "adicionar_objetivo"),
    path('modificar/objetivo/<int:id>', views.objetivo_update, name="modificar_objetivo"),
#     path('activar/objetivo/<int:id>/', views.act_desactobjetivo, name="act_desactobjetivo"),
    path('eliminar/objetivo/<int:id>/', views.eliminar_objetivo, name="eliminar_objetivo"),
    path('detalle/objetivo/<int:id>/', views.detalle_objetivo, name= "detalle_objetivo"),
    path('evaluar/objetivo/', views.evaluar_objetivo, name= "evaluar_objetivo"),

    #CRUD indicador_objetivo #javier
    path('listar/indicador_objetivo', views.listar_indicador_objetivo, name = "listar_indicador_objetivo"),
    path('adicionar/indicador_objetivo/<int:id>', views.nomindicador_objetivo, name = "adicionar_indicador_objetivo"),
    path('modificar/indicador_objetivo/<int:id>', views.indicador_objetivo_update, name="modificar_indicador_objetivo"),
#     path('activar/indicador_objetivo/<int:id>/', views.act_desactindicador_objetivo, name="act_desactindicador_objetivo"),
    path('eliminar/indicador_objetivo/<int:id>/', views.eliminar_indicador_objetivo, name="eliminar_indicador_objetivo"),
    path('detalle/indicador_objetivo/<int:id>/', views.detalle_indicador_objetivo, name= "detalle_indicador_objetivo"),

    #CRUD accion_indicador #javier
    path('listar/accion_indicador', views.listar_accion_indicador_objetivo, name = "listar_accion_indicador_objetivo"),
    path('adicionar/accion_indicador/<int:id>', views.nomaccion_indicador_objetivo, name = "adicionar_accion_indicador_objetivo"),
    path('modificar/accion_indicador/<int:id>', views.accion_indicador_objetivo_update, name="modificar_accion_indicador_objetivo"),
#     path('activar/accion_indicador/<int:id>/', views.act_desactaccion_indicador_objetivo, name="act_desactaccion_indicador_objetivo"),
    path('eliminar/accion_indicador/<int:id>/', views.eliminar_accion_indicador_objetivo, name="eliminar_accion_indicador_objetivo"),
    path('detalle/accion_indicador/<int:id>/', views.detalle_accion_indicador_objetivo, name= "detalle_accion_indicador_objetivo"),

    #CRUD sosi #javier
    path('listar/sosi', views.listar_sosi, name = "listar_sosi"),
    path('adicionar/sosi/<int:id>', views.nomsosi, name = "adicionar_sosi"),
    path('modificar/sosi/<int:id>', views.sosi_update, name="modificar_sosi"),
    path('eliminar/sosi/<int:id>/', views.eliminar_sosi, name="eliminar_sosi"),
    path('detalle/sosi/<int:id>/', views.detalle_sosi, name= "detalle_sosi"),
    path('abrir-recurso/', views.abrir_recurso, name= "abrir_recurso"),
#     path('activar/sosi/<int:id>/', views.act_desactsosi, name="act_desactsosi"),

#     path('', views.DashboardGraficobarra.as_view(), name="inicio"),
    
#     path('notificar', views.notificar, name='notificar'),
    
#     path('admin/', admin.site.urls),
#     path('i18n/', include('django.conf.urls.i18n')),
#     path('accounts/login/', views.loguear, name='ce_login'),
#     path('login/', views.just_login, name='just_login'),
#     path('logout/', views.logout, name='logout'),

#     path('administration/grupo/list', login_required(views.group_list), name="group_list"),
#     path('administration/grupo/create', login_required(views.group_create), name='group_create'),
#     path('administration/grupo/update/<int:pk>',
#          permission_required('ProyectoBaseApp.change_group', login_url='ce_login')(forms.GroupUpdate.as_view()),
#          name='group_update'),
#     path('administration/grupo/delete/<int:pk>/',
#          permission_required('ProyectoBaseApp.delete_group', login_url='ce_login')(forms.GroupDelete.as_view()),
#          name='group_delete'),
#     path('administration/grupo/detalle/<int:pk>/',
#          permission_required('ProyectoBaseApp.view_group', login_url='ce_login')(forms.GroupUpdate.as_view()),
#          name='group_detalle'),
#     path('administration/user/list', login_required(views.user_list), name="user_list"),
#     path('administration/user/create', login_required(views.user_create), name='user_create'),
#     path('administration/user/update/<int:pk>',forms.UserUpdate.as_view(),name='user_update'),
#     path('administration/user/detail/<int:pk>',login_required(forms.UserDetail.as_view()),name='user_detail'),
#     path('administration/user/delete/<int:pk>/',login_required(forms.UserDelete.as_view()),name='user_delete'),
#     path('administration/user/activate/<int:pk>/',login_required(forms.UserActivate.as_view()),name='user_activate'),
#     path('administration/password/update/<int:pk>/', login_required(views.password_update),name='password_update'),
#     path('administration/password/updateadmin/<int:pk>/', login_required(views.password_update_admin),
#          name='password_updateadmin'),

    # USUARIO
#     path('user/password/reset/', views.PasswordResetView.as_view(),
#          {'post_reset_redirect': '/user/password/reset/done/'}, name='password_reset'),
#     path('user/password/reset/done/',
#          djangoViews.PasswordResetDoneView.as_view(), name='password_reset_done'),
#     path('reset/<uidb64>/<token>/', djangoViews.PasswordResetConfirmView.as_view(),
#          {'post_reset_redirect': '/user/reset/done/'}, name='password_reset_confirm'),
#     path('user/reset/done/', djangoViews.PasswordResetCompleteView.as_view(),
#          name='password_reset_complete'),
#     path('good/count/activated', views.count_activated,
#          name='account_activation_sent'),
#     path('activate/<uidb64>/<token>/', views.activate, name='activate'),
#     path('user/update/<int:pk>', login_required(forms.UserUpdateAdmin.as_view()), name="profile"),

    # logs del sistema
#     path('administration/logs/list',
#          login_required(views.history_list), name="history_list"),
#     path('administration/logs/first_list',
#          login_required(views.history_list_300), name="history_list_300"),

    # NOTIFICACIONES
#     path('inbox/notifications/', include(notiURL, namespace='notifications')),
#     path('notifications/read/<int:action>',
#          login_required(views.notificacion_read), name="notificacion_read"),

#     path('notifications/mark_noti_all_read',
#          login_required(views.notification_all_mark_read), name="mark_all_read"),
#     path('notifications/mark_noti_offer_all_read',
#          login_required(views.notification_offer_all_mark_read), name="mark_offer_all_read"),

    # CAMBIAR LOGO
#     path('cambiar/logo', CambiarLogotipo.as_view(), name="cambiar_logo"),

    # Salva y Reastaura bdd
#     path('administration/db/list', views.db_list, name="db_list"),
#     path('administration/db/save', views.db_save, name="db_save"),
#     path('administration/db/restore/',
#          views.db_restore, name="db_restore"),

    # Importar CSV sosi
#     path('importar/CSV/', views.ImportarCSV, name="importarCSV"),

    # EXCEPCIONES
#     path('error500', views.error500, name="error500"),
#     path('error404', views.error404, name="error404"),
#     path('error403', views.error403, name="error403"),

    # URL FROM APPS
#     path('', include(('apps.base.urls', 'apps.base'), namespace='base')),
#     path('', include(('apps.complaints.urls', 'apps.complaints'), namespace='complaints')),
#     path('', include(('apps.effectiveness.urls',
#          'apps.effectiveness'), namespace='effectiveness')),
#     path('', include(('apps.iproperty.urls', 'apps.iproperty'), namespace='iproperty')),
#     path('', include(('apps.licenses.urls', 'apps.licenses'), namespace='licenses')),
]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
