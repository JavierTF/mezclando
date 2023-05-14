--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_target_content_type__ccb24d88_fk_django_co;
ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_recipient_id_d055f3f0_fk_auth_user;
ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co;
ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo" DROP CONSTRAINT "SISGDDO_valoracion_e_valoracion_encuesta__c912f9a4_fk_SISGDDO_v";
ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo" DROP CONSTRAINT "SISGDDO_valoracion_e_organismo_id_225b3b81_fk_SISGDDO_o";
ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta" DROP CONSTRAINT "SISGDDO_valoracion_e_elaborado_por_id_7818d5c9_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_trabajador" DROP CONSTRAINT "SISGDDO_trabajador_formacion_id_fa1b53dd_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias" DROP CONSTRAINT "SISGDDO_tipo_de_lice_trabajador_responsab_1d206130_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias" DROP CONSTRAINT "SISGDDO_tipo_de_lice_proceso_id_a88d99ee_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias" DROP CONSTRAINT "SISGDDO_tipo_de_lice_entidad_emite_id_0162d8b9_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_persona_recibe_id_6358f77d_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_persona_entrega_id_041d4b5c_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_sosi_idioma" DROP CONSTRAINT "SISGDDO_sosi_idioma_sosi_id_24f8706e_fk_SISGDDO_sosi_id";
ALTER TABLE ONLY public."SISGDDO_sosi_idioma" DROP CONSTRAINT "SISGDDO_sosi_idioma_idioma_id_1ae932f7_fk_SISGDDO_idioma_id";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_formatos_id_a958d2c2_fk_SISGDDO_formatos_id";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_coleccion_id_3f2777f3_fk_SISGDDO_coleccion_id";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_area_id_05a48fcb_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_sosi_id_c0041ac0_fk_SISGDDO_sosi_id";
ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_jef_trabajador_id_e25e2cd5_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_jef_proyecto_id_9a3affe7_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_estado_id_8f4b6d8d_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_cenda_id_692a6e9e_fk_SISGDDO_cenda_id";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_area_id_735950ad_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_plan_medidas" DROP CONSTRAINT "SISGDDO_plan_medidas_proceso_id_7f2c812c_fk_SISGDDO_proceso_id";
ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones" DROP CONSTRAINT "SISGDDO_plan_medidas_plan_medidas_id_561ff079_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones" DROP CONSTRAINT "SISGDDO_plan_medidas_acciones_id_a042ab82_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_no_conformidad" DROP CONSTRAINT "SISGDDO_no_conformid_trabajador_id_0d862d14_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_no_conformidad" DROP CONSTRAINT "SISGDDO_no_conformid_proceso_id_1e63ec91_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_no_conformidad" DROP CONSTRAINT "SISGDDO_no_conformid_estado_id_2df90f3f_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_indicador_eficacia" DROP CONSTRAINT "SISGDDO_indicador_ef_proceso_id_094dda9d_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_incidencias" DROP CONSTRAINT "SISGDDO_incidencias_no_conformidad_ptr_i_d475808a_fk_SISGDDO_n";
ALTER TABLE ONLY public."SISGDDO_incidencias" DROP CONSTRAINT "SISGDDO_incidencias_clasificacion_id_57da4e3b_fk_SISGDDO_c";
ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos" DROP CONSTRAINT "SISGDDO_historico_en_recibida_por_id_ca7c8b8f_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos" DROP CONSTRAINT "SISGDDO_historico_en_entregado_por_id_f4801336_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos" DROP CONSTRAINT "SISGDDO_historico_en_entradas_proyectos_i_cfc93f01_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_historico_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_historico_di_dictamen_tecnico_id_1682bbe4_fk_SISGDDO_d";
ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida" DROP CONSTRAINT "SISGDDO_formacion_pe_formacion_personal_i_b575b3d9_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida" DROP CONSTRAINT "SISGDDO_formacion_pe_curso_id_fa1a50f4_fk_SISGDDO_c";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" DROP CONSTRAINT "SISGDDO_entradas_pro_trabajador_calidad_i_a9f3f80b_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" DROP CONSTRAINT "SISGDDO_entradas_pro_sistema_operativo_id_c1af2015_fk_SISGDDO_s";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" DROP CONSTRAINT "SISGDDO_entradas_pro_proyecto_id_68c399c8_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" DROP CONSTRAINT "SISGDDO_entradas_pro_lenguaje_prog_id_b35eabb5_fk_SISGDDO_l";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" DROP CONSTRAINT "SISGDDO_entradas_pro_jefe_UEB_grupo_id_76b9163d_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos" DROP CONSTRAINT "SISGDDO_entradas_pro_formatos_id_e342b99c_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" DROP CONSTRAINT "SISGDDO_entradas_pro_estado_entradas_proy_925a3481_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos" DROP CONSTRAINT "SISGDDO_entradas_pro_entradas_proyecto_id_cf0784af_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_eficacia" DROP CONSTRAINT "SISGDDO_eficacia_trabajador_id_2732f0d3_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_eficacia" DROP CONSTRAINT "SISGDDO_eficacia_proceso_id_abdb7f9c_fk_SISGDDO_proceso_id";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tecnico_area_id_f9083026_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_proyecto_id_06d8ece0_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_nuevo_idioma_id_be75064b_fk_SISGDDO_i";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_idioma_subtitulado_i_c7dc0352_fk_SISGDDO_i";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_eval_por_id_d9862d85_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_estado_dictamen_id_7f0c5e1a_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_especialista_calidad_ceb4cd5a_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_entradas_proyectos_i_876a6a8b_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tec_disennador_id_fafc4868_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_cliente_externo" DROP CONSTRAINT "SISGDDO_cliente_exte_provincia_id_3a877989_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_cenda" DROP CONSTRAINT "SISGDDO_cenda_coleccion_id_f1849f11_fk_SISGDDO_coleccion_id";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_interna_area_id_0a1a83b5_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores" DROP CONSTRAINT "SISGDDO_auditoria_in_trabajador_id_56140742_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_in_plan_medidas_id_63c5c9b2_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_in_metodos_prueba_id_e192e768_fk_SISGDDO_m";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores" DROP CONSTRAINT "SISGDDO_auditoria_in_auditoria_interna_id_728c0512_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa" DROP CONSTRAINT "SISGDDO_auditoria_ex_plan_medidas_id_21caa244_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa" DROP CONSTRAINT "SISGDDO_auditoria_ex_entidad_id_c6530628_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area" DROP CONSTRAINT "SISGDDO_auditoria_ex_auditoria_externa_id_87c0cddc_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area" DROP CONSTRAINT "SISGDDO_auditoria_ex_area_id_57d84df0_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_atencion_cliente_externo" DROP CONSTRAINT "SISGDDO_atencion_cli_no_conformidad_ptr_i_703db51f_fk_SISGDDO_n";
ALTER TABLE ONLY public."SISGDDO_atencion_cliente_externo" DROP CONSTRAINT "SISGDDO_atencion_cli_cliente_id_86d49f42_fk_SISGDDO_c";
ALTER TABLE ONLY public."SISGDDO_aspecto_medir_indicadoreficacia" DROP CONSTRAINT "SISGDDO_aspecto_medi_indicadores_id_fa46a654_fk_SISGDDO_i";
ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable" DROP CONSTRAINT "SISGDDO_acuerdos_con_trabajador_id_25a921a6_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo" DROP CONSTRAINT "SISGDDO_acuerdos_con_estado_acuerd_id_56d24368_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable" DROP CONSTRAINT "SISGDDO_acuerdos_con_acuerdos_consejillo__d4170ee4_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_acciones" DROP CONSTRAINT "SISGDDO_acciones_tratamiento_id_72860531_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_acciones_responsable" DROP CONSTRAINT "SISGDDO_acciones_res_trabajador_id_98c4cbd4_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_acciones_responsable" DROP CONSTRAINT "SISGDDO_acciones_res_acciones_id_63c54b4e_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_acciones_prevenntivas" DROP CONSTRAINT "SISGDDO_acciones_pre_acciones_ptr_id_655ecb08_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_acciones_correptivas" DROP CONSTRAINT "SISGDDO_acciones_cor_acciones_ptr_id_16280263_fk_SISGDDO_a";
ALTER TABLE ONLY public."ProyectoBaseApp_userapp" DROP CONSTRAINT "ProyectoBaseApp_userapp_user_ptr_id_2c744a7c_fk_auth_user_id";
DROP INDEX public.notifications_notification_unread_cce4be30;
DROP INDEX public.notifications_notification_target_content_type_id_ccb24d88;
DROP INDEX public.notifications_notification_recipient_id_d055f3f0;
DROP INDEX public.notifications_notification_public_1bc30b1c;
DROP INDEX public.notifications_notification_emailed_23a5ad81;
DROP INDEX public.notifications_notification_deleted_b32b69e6;
DROP INDEX public.notifications_notification_actor_content_type_id_0c69d7b7;
DROP INDEX public.notifications_notification_action_object_content_type_7d2b8ee9;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.captcha_captchastore_hashkey_cbe8d15a_like;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
DROP INDEX public."SISGDDO_valoracion_encuesta_organismo_organismo_id_225b3b81";
DROP INDEX public."SISGDDO_valoracion_encuesta_elaborado_por_id_7818d5c9";
DROP INDEX public."SISGDDO_valoracion_encuest_valoracion_encuesta_id_c912f9a4";
DROP INDEX public."SISGDDO_trabajador_formacion_id_fa1b53dd";
DROP INDEX public."SISGDDO_tipo_de_licencias_trabajador_responsable_id_1d206130";
DROP INDEX public."SISGDDO_tipo_de_licencias_proceso_id_a88d99ee";
DROP INDEX public."SISGDDO_tipo_de_licencias_nombre_lic_8912533e_like";
DROP INDEX public."SISGDDO_tipo_de_licencias_entidad_emite_id_0162d8b9";
DROP INDEX public."SISGDDO_sosi_persona_recibe_id_6358f77d";
DROP INDEX public."SISGDDO_sosi_persona_entrega_id_041d4b5c";
DROP INDEX public."SISGDDO_sosi_idioma_sosi_id_24f8706e";
DROP INDEX public."SISGDDO_sosi_idioma_idioma_id_1ae932f7";
DROP INDEX public."SISGDDO_sosi_formatos_id_a958d2c2";
DROP INDEX public."SISGDDO_sosi_coleccion_id_3f2777f3";
DROP INDEX public."SISGDDO_sosi_area_id_05a48fcb";
DROP INDEX public."SISGDDO_sistema_operativo_nombre_Sistema_344503cd_like";
DROP INDEX public."SISGDDO_proyecto_sosi_id_c0041ac0";
DROP INDEX public."SISGDDO_proyecto_jefe_proyecto_trabajador_id_e25e2cd5";
DROP INDEX public."SISGDDO_proyecto_jefe_proyecto_proyecto_id_9a3affe7";
DROP INDEX public."SISGDDO_proyecto_estado_id_8f4b6d8d";
DROP INDEX public."SISGDDO_proyecto_cenda_id_692a6e9e";
DROP INDEX public."SISGDDO_proyecto_area_id_735950ad";
DROP INDEX public."SISGDDO_provincia_nombre_Provincia_a41e8d5d_like";
DROP INDEX public."SISGDDO_proceso_nombre_Proceso_43510f42_like";
DROP INDEX public."SISGDDO_plan_medidas_proceso_id_7f2c812c";
DROP INDEX public."SISGDDO_plan_medidas_acciones_plan_medidas_id_561ff079";
DROP INDEX public."SISGDDO_plan_medidas_acciones_acciones_id_a042ab82";
DROP INDEX public."SISGDDO_no_conformidad_trabajador_id_0d862d14";
DROP INDEX public."SISGDDO_no_conformidad_proceso_id_1e63ec91";
DROP INDEX public."SISGDDO_no_conformidad_estado_id_2df90f3f";
DROP INDEX public."SISGDDO_lenguaje_prog_nombre_Lenguaje_4cda3608_like";
DROP INDEX public."SISGDDO_indicador_eficacia_proceso_id_094dda9d";
DROP INDEX public."SISGDDO_incidencias_clasificacion_id_57da4e3b";
DROP INDEX public."SISGDDO_idioma_nombre_Idioma_00ff2600_like";
DROP INDEX public."SISGDDO_historico_entradas_proyectos_recibida_por_id_ca7c8b8f";
DROP INDEX public."SISGDDO_historico_entradas_proyectos_entregado_por_id_f4801336";
DROP INDEX public."SISGDDO_historico_entradas_entradas_proyectos_id_cfc93f01";
DROP INDEX public."SISGDDO_historico_dictamen_tecnico_dictamen_tecnico_id_1682bbe4";
DROP INDEX public."SISGDDO_formatos_nombre_Formato_44f72df3_like";
DROP INDEX public."SISGDDO_formacion_personal_formacion_personal_id_b575b3d9";
DROP INDEX public."SISGDDO_formacion_personal_curso_id_fa1a50f4";
DROP INDEX public."SISGDDO_entradas_proyecto_trabajador_calidad_interna_a9f3f80b";
DROP INDEX public."SISGDDO_entradas_proyecto_sistema_operativo_id_c1af2015";
DROP INDEX public."SISGDDO_entradas_proyecto_proyecto_id_68c399c8";
DROP INDEX public."SISGDDO_entradas_proyecto_lenguaje_prog_id_b35eabb5";
DROP INDEX public."SISGDDO_entradas_proyecto_jefe_UEB_grupo_id_76b9163d";
DROP INDEX public."SISGDDO_entradas_proyecto_formatos_formatos_id_e342b99c";
DROP INDEX public."SISGDDO_entradas_proyecto_estado_entradas_proyecto_id_925a3481";
DROP INDEX public."SISGDDO_entradas_proyecto__entradas_proyecto_id_cf0784af";
DROP INDEX public."SISGDDO_entidad_nombre_Entidad_a5e395fc_like";
DROP INDEX public."SISGDDO_eficacia_trabajador_id_2732f0d3";
DROP INDEX public."SISGDDO_eficacia_proceso_id_abdb7f9c";
DROP INDEX public."SISGDDO_dictamen_tecnico_proyecto_id_06d8ece0";
DROP INDEX public."SISGDDO_dictamen_tecnico_nuevo_idioma_id_be75064b";
DROP INDEX public."SISGDDO_dictamen_tecnico_idioma_subtitulado_id_c7dc0352";
DROP INDEX public."SISGDDO_dictamen_tecnico_eval_por_id_d9862d85";
DROP INDEX public."SISGDDO_dictamen_tecnico_estado_dictamen_id_7f0c5e1a";
DROP INDEX public."SISGDDO_dictamen_tecnico_especialista_calidad_id_ceb4cd5a";
DROP INDEX public."SISGDDO_dictamen_tecnico_entradas_proyectos_id_876a6a8b";
DROP INDEX public."SISGDDO_dictamen_tecnico_disennador_id_fafc4868";
DROP INDEX public."SISGDDO_dictamen_tecnico_area_id_f9083026";
DROP INDEX public."SISGDDO_curso_nombre_Curso_3a1e73ed_like";
DROP INDEX public."SISGDDO_coleccion_nombre_Coleccion_cbdeee35_like";
DROP INDEX public."SISGDDO_cliente_externo_provincia_id_3a877989";
DROP INDEX public."SISGDDO_cenda_coleccion_id_f1849f11";
DROP INDEX public."SISGDDO_auditoria_interna_trabajadores_trabajador_id_56140742";
DROP INDEX public."SISGDDO_auditoria_interna_plan_medidas_id_63c5c9b2";
DROP INDEX public."SISGDDO_auditoria_interna_metodos_prueba_id_e192e768";
DROP INDEX public."SISGDDO_auditoria_interna_area_id_0a1a83b5";
DROP INDEX public."SISGDDO_auditoria_interna__auditoria_interna_id_728c0512";
DROP INDEX public."SISGDDO_auditoria_externa_plan_medidas_id_21caa244";
DROP INDEX public."SISGDDO_auditoria_externa_entidad_id_c6530628";
DROP INDEX public."SISGDDO_auditoria_externa_area_auditoria_externa_id_87c0cddc";
DROP INDEX public."SISGDDO_auditoria_externa_area_area_id_57d84df0";
DROP INDEX public."SISGDDO_atencion_cliente_externo_cliente_id_86d49f42";
DROP INDEX public."SISGDDO_aspecto_medir_indicadoreficacia_indicadores_id_fa46a654";
DROP INDEX public."SISGDDO_area_nombre_Area_36770583_like";
DROP INDEX public."SISGDDO_acuerdos_consejillo_responsable_trabajador_id_25a921a6";
DROP INDEX public."SISGDDO_acuerdos_consejillo_estado_acuerd_id_56d24368";
DROP INDEX public."SISGDDO_acuerdos_consejill_acuerdos_consejillo_id_d4170ee4";
DROP INDEX public."SISGDDO_acciones_tratamiento_id_72860531";
DROP INDEX public."SISGDDO_acciones_responsable_trabajador_id_98c4cbd4";
DROP INDEX public."SISGDDO_acciones_responsable_acciones_id_63c54b4e";
ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notification_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.captcha_captchastore DROP CONSTRAINT captcha_captchastore_pkey;
ALTER TABLE ONLY public.captcha_captchastore DROP CONSTRAINT captcha_captchastore_hashkey_key;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta" DROP CONSTRAINT "SISGDDO_valoracion_encuesta_pkey";
ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo" DROP CONSTRAINT "SISGDDO_valoracion_encuesta_organismo_pkey";
ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo" DROP CONSTRAINT "SISGDDO_valoracion_encue_valoracion_encuesta_id_o_806e449f_uniq";
ALTER TABLE ONLY public."SISGDDO_tratamiento" DROP CONSTRAINT "SISGDDO_tratamiento_pkey";
ALTER TABLE ONLY public."SISGDDO_trabajador" DROP CONSTRAINT "SISGDDO_trabajador_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias" DROP CONSTRAINT "SISGDDO_tipo_de_licencias_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias" DROP CONSTRAINT "SISGDDO_tipo_de_licencias_nombre_lic_key";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_pkey";
ALTER TABLE ONLY public."SISGDDO_sosi_idioma" DROP CONSTRAINT "SISGDDO_sosi_idioma_sosi_id_idioma_id_4d79adb9_uniq";
ALTER TABLE ONLY public."SISGDDO_sosi_idioma" DROP CONSTRAINT "SISGDDO_sosi_idioma_pkey";
ALTER TABLE ONLY public."SISGDDO_sistema_operativo" DROP CONSTRAINT "SISGDDO_sistema_operativo_pkey";
ALTER TABLE ONLY public."SISGDDO_sistema_operativo" DROP CONSTRAINT "SISGDDO_sistema_operativo_nombre_Sistema_key";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_jefe_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_jefe_pr_proyecto_id_trabajador_i_c4be0452_uniq";
ALTER TABLE ONLY public."SISGDDO_provincia" DROP CONSTRAINT "SISGDDO_provincia_pkey";
ALTER TABLE ONLY public."SISGDDO_provincia" DROP CONSTRAINT "SISGDDO_provincia_nombre_Provincia_key";
ALTER TABLE ONLY public."SISGDDO_proceso" DROP CONSTRAINT "SISGDDO_proceso_pkey";
ALTER TABLE ONLY public."SISGDDO_proceso" DROP CONSTRAINT "SISGDDO_proceso_nombre_Proceso_key";
ALTER TABLE ONLY public."SISGDDO_plan_medidas" DROP CONSTRAINT "SISGDDO_plan_medidas_pkey";
ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones" DROP CONSTRAINT "SISGDDO_plan_medidas_acciones_pkey";
ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones" DROP CONSTRAINT "SISGDDO_plan_medidas_acc_plan_medidas_id_acciones_a1f12890_uniq";
ALTER TABLE ONLY public."SISGDDO_organismo" DROP CONSTRAINT "SISGDDO_organismo_pkey";
ALTER TABLE ONLY public."SISGDDO_no_conformidad" DROP CONSTRAINT "SISGDDO_no_conformidad_pkey";
ALTER TABLE ONLY public."SISGDDO_metodosprueba" DROP CONSTRAINT "SISGDDO_metodosprueba_pkey";
ALTER TABLE ONLY public."SISGDDO_lenguaje_prog" DROP CONSTRAINT "SISGDDO_lenguaje_prog_pkey";
ALTER TABLE ONLY public."SISGDDO_lenguaje_prog" DROP CONSTRAINT "SISGDDO_lenguaje_prog_nombre_Lenguaje_key";
ALTER TABLE ONLY public."SISGDDO_indicador_eficacia" DROP CONSTRAINT "SISGDDO_indicador_eficacia_pkey";
ALTER TABLE ONLY public."SISGDDO_incidencias" DROP CONSTRAINT "SISGDDO_incidencias_pkey";
ALTER TABLE ONLY public."SISGDDO_idioma" DROP CONSTRAINT "SISGDDO_idioma_pkey";
ALTER TABLE ONLY public."SISGDDO_idioma" DROP CONSTRAINT "SISGDDO_idioma_nombre_Idioma_key";
ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos" DROP CONSTRAINT "SISGDDO_historico_entradas_proyectos_pkey";
ALTER TABLE ONLY public."SISGDDO_historico_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_historico_dictamen_tecnico_pkey";
ALTER TABLE ONLY public."SISGDDO_formatos" DROP CONSTRAINT "SISGDDO_formatos_pkey";
ALTER TABLE ONLY public."SISGDDO_formatos" DROP CONSTRAINT "SISGDDO_formatos_nombre_Formato_key";
ALTER TABLE ONLY public."SISGDDO_formacion_personal" DROP CONSTRAINT "SISGDDO_formacion_personal_pkey";
ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida" DROP CONSTRAINT "SISGDDO_formacion_personal_capacitacion_adquirida_pkey";
ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida" DROP CONSTRAINT "SISGDDO_formacion_person_formacion_personal_id_cu_fd76a6c6_uniq";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto" DROP CONSTRAINT "SISGDDO_estado_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_no_conformidad" DROP CONSTRAINT "SISGDDO_estado_no_conformidad_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_entradas_proyecto" DROP CONSTRAINT "SISGDDO_estado_entradas_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_dictamen" DROP CONSTRAINT "SISGDDO_estado_dictamen_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_acuerdo" DROP CONSTRAINT "SISGDDO_estado_acuerdo_pkey";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" DROP CONSTRAINT "SISGDDO_entradas_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos" DROP CONSTRAINT "SISGDDO_entradas_proyecto_formatos_pkey";
ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos" DROP CONSTRAINT "SISGDDO_entradas_proyect_entradas_proyecto_id_for_0f12b3fc_uniq";
ALTER TABLE ONLY public."SISGDDO_entidad" DROP CONSTRAINT "SISGDDO_entidad_pkey";
ALTER TABLE ONLY public."SISGDDO_entidad" DROP CONSTRAINT "SISGDDO_entidad_nombre_Entidad_key";
ALTER TABLE ONLY public."SISGDDO_eficacia" DROP CONSTRAINT "SISGDDO_eficacia_pkey";
ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" DROP CONSTRAINT "SISGDDO_dictamen_tecnico_pkey";
ALTER TABLE ONLY public."SISGDDO_curso" DROP CONSTRAINT "SISGDDO_curso_pkey";
ALTER TABLE ONLY public."SISGDDO_curso" DROP CONSTRAINT "SISGDDO_curso_nombre_Curso_key";
ALTER TABLE ONLY public."SISGDDO_coleccion" DROP CONSTRAINT "SISGDDO_coleccion_pkey";
ALTER TABLE ONLY public."SISGDDO_coleccion" DROP CONSTRAINT "SISGDDO_coleccion_nombre_Coleccion_key";
ALTER TABLE ONLY public."SISGDDO_cliente_externo" DROP CONSTRAINT "SISGDDO_cliente_externo_pkey";
ALTER TABLE ONLY public."SISGDDO_clasificacionincidencias" DROP CONSTRAINT "SISGDDO_clasificacionincidencias_pkey";
ALTER TABLE ONLY public."SISGDDO_cenda" DROP CONSTRAINT "SISGDDO_cenda_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores" DROP CONSTRAINT "SISGDDO_auditoria_interna_trabajadores_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_interna_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores" DROP CONSTRAINT "SISGDDO_auditoria_intern_auditoria_interna_id_tra_95f9fd87_uniq";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa" DROP CONSTRAINT "SISGDDO_auditoria_externa_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa" DROP CONSTRAINT "SISGDDO_auditoria_externa_no_registro_key";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area" DROP CONSTRAINT "SISGDDO_auditoria_externa_area_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area" DROP CONSTRAINT "SISGDDO_auditoria_extern_auditoria_externa_id_are_d03f140d_uniq";
ALTER TABLE ONLY public."SISGDDO_atencion_cliente_externo" DROP CONSTRAINT "SISGDDO_atencion_cliente_externo_pkey";
ALTER TABLE ONLY public."SISGDDO_aspecto_medir_indicadoreficacia" DROP CONSTRAINT "SISGDDO_aspecto_medir_indicadoreficacia_pkey";
ALTER TABLE ONLY public."SISGDDO_area" DROP CONSTRAINT "SISGDDO_area_pkey";
ALTER TABLE ONLY public."SISGDDO_area" DROP CONSTRAINT "SISGDDO_area_nombre_Area_key";
ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable" DROP CONSTRAINT "SISGDDO_acuerdos_consejillo_responsable_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo" DROP CONSTRAINT "SISGDDO_acuerdos_consejillo_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable" DROP CONSTRAINT "SISGDDO_acuerdos_conseji_acuerdos_consejillo_id_t_6c75fbfb_uniq";
ALTER TABLE ONLY public."SISGDDO_acciones_responsable" DROP CONSTRAINT "SISGDDO_acciones_responsable_pkey";
ALTER TABLE ONLY public."SISGDDO_acciones_responsable" DROP CONSTRAINT "SISGDDO_acciones_respons_acciones_id_trabajador_i_c4078b69_uniq";
ALTER TABLE ONLY public."SISGDDO_acciones_prevenntivas" DROP CONSTRAINT "SISGDDO_acciones_prevenntivas_pkey";
ALTER TABLE ONLY public."SISGDDO_acciones" DROP CONSTRAINT "SISGDDO_acciones_pkey";
ALTER TABLE ONLY public."SISGDDO_acciones_correptivas" DROP CONSTRAINT "SISGDDO_acciones_correptivas_pkey";
ALTER TABLE ONLY public."ProyectoBaseApp_userapp" DROP CONSTRAINT "ProyectoBaseApp_userapp_pkey";
ALTER TABLE public.notifications_notification ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.captcha_captchastore ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_valoracion_encuesta_organismo" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_valoracion_encuesta" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_tratamiento" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_trabajador" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_tipo_de_licencias" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_sosi_idioma" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_sosi" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_sistema_operativo" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_proyecto_jefe_proyecto" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_provincia" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_proceso" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_plan_medidas_acciones" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_plan_medidas" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_organismo" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_no_conformidad" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_metodosprueba" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_lenguaje_prog" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_indicador_eficacia" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_idioma" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_historico_entradas_proyectos" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_historico_dictamen_tecnico" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_formatos" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_formacion_personal_capacitacion_adquirida" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_formacion_personal" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_estado_proyecto" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_estado_no_conformidad" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_estado_entradas_proyecto" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_estado_dictamen" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_estado_acuerdo" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_entradas_proyecto_formatos" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_entradas_proyecto" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_entidad" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_eficacia" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_dictamen_tecnico" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_curso" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_coleccion" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_cliente_externo" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_clasificacionincidencias" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_cenda" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_auditoria_interna_trabajadores" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_auditoria_interna" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_auditoria_externa_area" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_auditoria_externa" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_aspecto_medir_indicadoreficacia" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_area" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_acuerdos_consejillo_responsable" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_acciones_responsable" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SISGDDO_acciones" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.notifications_notification_id_seq;
DROP TABLE public.notifications_notification;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.captcha_captchastore_id_seq;
DROP TABLE public.captcha_captchastore;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP SEQUENCE public."SISGDDO_valoracion_encuesta_organismo_id_seq";
DROP TABLE public."SISGDDO_valoracion_encuesta_organismo";
DROP SEQUENCE public."SISGDDO_valoracion_encuesta_id_seq";
DROP TABLE public."SISGDDO_valoracion_encuesta";
DROP SEQUENCE public."SISGDDO_tratamiento_id_seq";
DROP TABLE public."SISGDDO_tratamiento";
DROP SEQUENCE public."SISGDDO_trabajador_id_seq";
DROP TABLE public."SISGDDO_trabajador";
DROP SEQUENCE public."SISGDDO_tipo_de_licencias_id_seq";
DROP TABLE public."SISGDDO_tipo_de_licencias";
DROP SEQUENCE public."SISGDDO_sosi_idioma_id_seq";
DROP TABLE public."SISGDDO_sosi_idioma";
DROP SEQUENCE public."SISGDDO_sosi_id_seq";
DROP TABLE public."SISGDDO_sosi";
DROP SEQUENCE public."SISGDDO_sistema_operativo_id_seq";
DROP TABLE public."SISGDDO_sistema_operativo";
DROP SEQUENCE public."SISGDDO_proyecto_jefe_proyecto_id_seq";
DROP TABLE public."SISGDDO_proyecto_jefe_proyecto";
DROP TABLE public."SISGDDO_proyecto";
DROP SEQUENCE public."SISGDDO_provincia_id_seq";
DROP TABLE public."SISGDDO_provincia";
DROP SEQUENCE public."SISGDDO_proceso_id_seq";
DROP TABLE public."SISGDDO_proceso";
DROP SEQUENCE public."SISGDDO_plan_medidas_id_seq";
DROP SEQUENCE public."SISGDDO_plan_medidas_acciones_id_seq";
DROP TABLE public."SISGDDO_plan_medidas_acciones";
DROP TABLE public."SISGDDO_plan_medidas";
DROP SEQUENCE public."SISGDDO_organismo_id_seq";
DROP TABLE public."SISGDDO_organismo";
DROP SEQUENCE public."SISGDDO_no_conformidad_id_seq";
DROP TABLE public."SISGDDO_no_conformidad";
DROP SEQUENCE public."SISGDDO_metodosprueba_id_seq";
DROP TABLE public."SISGDDO_metodosprueba";
DROP SEQUENCE public."SISGDDO_lenguaje_prog_id_seq";
DROP TABLE public."SISGDDO_lenguaje_prog";
DROP SEQUENCE public."SISGDDO_indicador_eficacia_id_seq";
DROP TABLE public."SISGDDO_indicador_eficacia";
DROP TABLE public."SISGDDO_incidencias";
DROP SEQUENCE public."SISGDDO_idioma_id_seq";
DROP TABLE public."SISGDDO_idioma";
DROP SEQUENCE public."SISGDDO_historico_entradas_proyectos_id_seq";
DROP TABLE public."SISGDDO_historico_entradas_proyectos";
DROP SEQUENCE public."SISGDDO_historico_dictamen_tecnico_id_seq";
DROP TABLE public."SISGDDO_historico_dictamen_tecnico";
DROP SEQUENCE public."SISGDDO_formatos_id_seq";
DROP TABLE public."SISGDDO_formatos";
DROP SEQUENCE public."SISGDDO_formacion_personal_id_seq";
DROP SEQUENCE public."SISGDDO_formacion_personal_capacitacion_adquirida_id_seq";
DROP TABLE public."SISGDDO_formacion_personal_capacitacion_adquirida";
DROP TABLE public."SISGDDO_formacion_personal";
DROP SEQUENCE public."SISGDDO_estado_proyecto_id_seq";
DROP TABLE public."SISGDDO_estado_proyecto";
DROP SEQUENCE public."SISGDDO_estado_no_conformidad_id_seq";
DROP TABLE public."SISGDDO_estado_no_conformidad";
DROP SEQUENCE public."SISGDDO_estado_entradas_proyecto_id_seq";
DROP TABLE public."SISGDDO_estado_entradas_proyecto";
DROP SEQUENCE public."SISGDDO_estado_dictamen_id_seq";
DROP TABLE public."SISGDDO_estado_dictamen";
DROP SEQUENCE public."SISGDDO_estado_acuerdo_id_seq";
DROP TABLE public."SISGDDO_estado_acuerdo";
DROP SEQUENCE public."SISGDDO_entradas_proyecto_id_seq";
DROP SEQUENCE public."SISGDDO_entradas_proyecto_formatos_id_seq";
DROP TABLE public."SISGDDO_entradas_proyecto_formatos";
DROP TABLE public."SISGDDO_entradas_proyecto";
DROP SEQUENCE public."SISGDDO_entidad_id_seq";
DROP TABLE public."SISGDDO_entidad";
DROP SEQUENCE public."SISGDDO_eficacia_id_seq";
DROP TABLE public."SISGDDO_eficacia";
DROP SEQUENCE public."SISGDDO_dictamen_tecnico_id_seq";
DROP TABLE public."SISGDDO_dictamen_tecnico";
DROP SEQUENCE public."SISGDDO_curso_id_seq";
DROP TABLE public."SISGDDO_curso";
DROP SEQUENCE public."SISGDDO_coleccion_id_seq";
DROP TABLE public."SISGDDO_coleccion";
DROP SEQUENCE public."SISGDDO_cliente_externo_id_seq";
DROP TABLE public."SISGDDO_cliente_externo";
DROP SEQUENCE public."SISGDDO_clasificacionincidencias_id_seq";
DROP TABLE public."SISGDDO_clasificacionincidencias";
DROP SEQUENCE public."SISGDDO_cenda_id_seq";
DROP TABLE public."SISGDDO_cenda";
DROP SEQUENCE public."SISGDDO_auditoria_interna_trabajadores_id_seq";
DROP TABLE public."SISGDDO_auditoria_interna_trabajadores";
DROP SEQUENCE public."SISGDDO_auditoria_interna_id_seq";
DROP TABLE public."SISGDDO_auditoria_interna";
DROP SEQUENCE public."SISGDDO_auditoria_externa_id_seq";
DROP SEQUENCE public."SISGDDO_auditoria_externa_area_id_seq";
DROP TABLE public."SISGDDO_auditoria_externa_area";
DROP TABLE public."SISGDDO_auditoria_externa";
DROP TABLE public."SISGDDO_atencion_cliente_externo";
DROP SEQUENCE public."SISGDDO_aspecto_medir_indicadoreficacia_id_seq";
DROP TABLE public."SISGDDO_aspecto_medir_indicadoreficacia";
DROP SEQUENCE public."SISGDDO_area_id_seq";
DROP TABLE public."SISGDDO_area";
DROP SEQUENCE public."SISGDDO_acuerdos_consejillo_responsable_id_seq";
DROP TABLE public."SISGDDO_acuerdos_consejillo_responsable";
DROP TABLE public."SISGDDO_acuerdos_consejillo";
DROP SEQUENCE public."SISGDDO_acciones_responsable_id_seq";
DROP TABLE public."SISGDDO_acciones_responsable";
DROP TABLE public."SISGDDO_acciones_prevenntivas";
DROP SEQUENCE public."SISGDDO_acciones_id_seq";
DROP TABLE public."SISGDDO_acciones_correptivas";
DROP TABLE public."SISGDDO_acciones";
DROP TABLE public."ProyectoBaseApp_userapp";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ProyectoBaseApp_userapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProyectoBaseApp_userapp" (
    user_ptr_id integer NOT NULL,
    uui uuid NOT NULL,
    image character varying(100),
    "referUser" uuid,
    fa2 boolean NOT NULL
);


ALTER TABLE public."ProyectoBaseApp_userapp" OWNER TO postgres;

--
-- Name: SISGDDO_acciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acciones" (
    id integer NOT NULL,
    fecha_cumplir date NOT NULL,
    seguimiento character varying(25) NOT NULL,
    tratamiento_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_acciones" OWNER TO postgres;

--
-- Name: SISGDDO_acciones_correptivas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acciones_correptivas" (
    acciones_ptr_id integer NOT NULL,
    accion_tomar character varying(255) NOT NULL
);


ALTER TABLE public."SISGDDO_acciones_correptivas" OWNER TO postgres;

--
-- Name: SISGDDO_acciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_acciones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_acciones_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_acciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_acciones_id_seq" OWNED BY public."SISGDDO_acciones".id;


--
-- Name: SISGDDO_acciones_prevenntivas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acciones_prevenntivas" (
    acciones_ptr_id integer NOT NULL,
    accion_tomar character varying(255) NOT NULL
);


ALTER TABLE public."SISGDDO_acciones_prevenntivas" OWNER TO postgres;

--
-- Name: SISGDDO_acciones_responsable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acciones_responsable" (
    id integer NOT NULL,
    acciones_id integer NOT NULL,
    trabajador_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_acciones_responsable" OWNER TO postgres;

--
-- Name: SISGDDO_acciones_responsable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_acciones_responsable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_acciones_responsable_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_acciones_responsable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_acciones_responsable_id_seq" OWNED BY public."SISGDDO_acciones_responsable".id;


--
-- Name: SISGDDO_acuerdos_consejillo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acuerdos_consejillo" (
    id integer NOT NULL,
    fecha_tomada date NOT NULL,
    fecha_cumplir date,
    descripcion character varying(255) NOT NULL,
    estado_acuerd_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_acuerdos_consejillo" OWNER TO postgres;

--
-- Name: SISGDDO_acuerdos_consejillo_responsable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acuerdos_consejillo_responsable" (
    id integer NOT NULL,
    acuerdos_consejillo_id integer NOT NULL,
    trabajador_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_acuerdos_consejillo_responsable" OWNER TO postgres;

--
-- Name: SISGDDO_acuerdos_consejillo_responsable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_acuerdos_consejillo_responsable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_acuerdos_consejillo_responsable_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_acuerdos_consejillo_responsable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_acuerdos_consejillo_responsable_id_seq" OWNED BY public."SISGDDO_acuerdos_consejillo_responsable".id;


--
-- Name: SISGDDO_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_area" (
    id integer NOT NULL,
    "nombre_Area" character varying(65) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_area" OWNER TO postgres;

--
-- Name: SISGDDO_area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_area_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_area_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_area_id_seq" OWNED BY public."SISGDDO_area".id;


--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_aspecto_medir_indicadoreficacia" (
    id integer NOT NULL,
    nombre_asp character varying(255) NOT NULL,
    indicadores_id integer NOT NULL,
    calificacion_asp integer
);


ALTER TABLE public."SISGDDO_aspecto_medir_indicadoreficacia" OWNER TO postgres;

--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_aspecto_medir_indicadoreficacia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_aspecto_medir_indicadoreficacia_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_aspecto_medir_indicadoreficacia_id_seq" OWNED BY public."SISGDDO_aspecto_medir_indicadoreficacia".id;


--
-- Name: SISGDDO_atencion_cliente_externo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_atencion_cliente_externo" (
    no_conformidad_ptr_id integer NOT NULL,
    via_recep character varying(25) NOT NULL,
    cliente_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_atencion_cliente_externo" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_externa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_externa" (
    id integer NOT NULL,
    no_registro integer NOT NULL,
    fecha_emision date NOT NULL,
    titulo_inf character varying(25) NOT NULL,
    resultados character varying(255) NOT NULL,
    entidad_id integer NOT NULL,
    plan_medidas_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_auditoria_externa" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_externa_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_externa_area" (
    id integer NOT NULL,
    auditoria_externa_id integer NOT NULL,
    area_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_auditoria_externa_area" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_externa_area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_auditoria_externa_area_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_auditoria_externa_area_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_externa_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_auditoria_externa_area_id_seq" OWNED BY public."SISGDDO_auditoria_externa_area".id;


--
-- Name: SISGDDO_auditoria_externa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_auditoria_externa_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_auditoria_externa_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_externa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_auditoria_externa_id_seq" OWNED BY public."SISGDDO_auditoria_externa".id;


--
-- Name: SISGDDO_auditoria_interna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_interna" (
    id integer NOT NULL,
    titulo_inf character varying(25) NOT NULL,
    fecha_aud date NOT NULL,
    periodo_comprueba character varying(15) NOT NULL,
    asunto character varying(25) NOT NULL,
    objetivos character varying(55) NOT NULL,
    documentos_referencia character varying(55) NOT NULL,
    muestra character varying(25) NOT NULL,
    conclusiones character varying(255) NOT NULL,
    area_id integer NOT NULL,
    metodos_prueba_id integer NOT NULL,
    plan_medidas_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_auditoria_interna" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_interna_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_auditoria_interna_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_auditoria_interna_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_interna_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_auditoria_interna_id_seq" OWNED BY public."SISGDDO_auditoria_interna".id;


--
-- Name: SISGDDO_auditoria_interna_trabajadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_interna_trabajadores" (
    id integer NOT NULL,
    auditoria_interna_id integer NOT NULL,
    trabajador_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_auditoria_interna_trabajadores" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_interna_trabajadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_auditoria_interna_trabajadores_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_auditoria_interna_trabajadores_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_interna_trabajadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_auditoria_interna_trabajadores_id_seq" OWNED BY public."SISGDDO_auditoria_interna_trabajadores".id;


--
-- Name: SISGDDO_cenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_cenda" (
    id integer NOT NULL,
    cotitular character varying(25) NOT NULL,
    fecha_incrip date NOT NULL,
    coleccion_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_cenda" OWNER TO postgres;

--
-- Name: SISGDDO_cenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_cenda_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_cenda_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_cenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_cenda_id_seq" OWNED BY public."SISGDDO_cenda".id;


--
-- Name: SISGDDO_clasificacionincidencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_clasificacionincidencias" (
    id integer NOT NULL,
    nombre_clasificacion character varying(15) NOT NULL
);


ALTER TABLE public."SISGDDO_clasificacionincidencias" OWNER TO postgres;

--
-- Name: SISGDDO_clasificacionincidencias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_clasificacionincidencias_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_clasificacionincidencias_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_clasificacionincidencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_clasificacionincidencias_id_seq" OWNED BY public."SISGDDO_clasificacionincidencias".id;


--
-- Name: SISGDDO_cliente_externo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_cliente_externo" (
    id integer NOT NULL,
    nombre_clienteext character varying(25) NOT NULL,
    apellidos character varying(25) NOT NULL,
    activo boolean NOT NULL,
    provincia_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_cliente_externo" OWNER TO postgres;

--
-- Name: SISGDDO_cliente_externo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_cliente_externo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_cliente_externo_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_cliente_externo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_cliente_externo_id_seq" OWNED BY public."SISGDDO_cliente_externo".id;


--
-- Name: SISGDDO_coleccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_coleccion" (
    id integer NOT NULL,
    "nombre_Coleccion" character varying(25) NOT NULL,
    anno integer,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_coleccion" OWNER TO postgres;

--
-- Name: SISGDDO_coleccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_coleccion_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_coleccion_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_coleccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_coleccion_id_seq" OWNED BY public."SISGDDO_coleccion".id;


--
-- Name: SISGDDO_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_curso" (
    id integer NOT NULL,
    "nombre_Curso" character varying(25) NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public."SISGDDO_curso" OWNER TO postgres;

--
-- Name: SISGDDO_curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_curso_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_curso_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_curso_id_seq" OWNED BY public."SISGDDO_curso".id;


--
-- Name: SISGDDO_dictamen_tecnico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_dictamen_tecnico" (
    id integer NOT NULL,
    no_dictamen integer NOT NULL,
    fecha date NOT NULL,
    nombre_capitulos character varying(25) NOT NULL,
    documento character varying(100) NOT NULL,
    area_id integer NOT NULL,
    disennador_id integer NOT NULL,
    entradas_proyectos_id integer NOT NULL,
    especialista_calidad_id integer NOT NULL,
    estado_dictamen_id integer NOT NULL,
    eval_por_id integer NOT NULL,
    idioma_subtitulado_id integer NOT NULL,
    nuevo_idioma_id integer NOT NULL,
    proyecto_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_dictamen_tecnico" OWNER TO postgres;

--
-- Name: SISGDDO_dictamen_tecnico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_dictamen_tecnico_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_dictamen_tecnico_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_dictamen_tecnico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_dictamen_tecnico_id_seq" OWNED BY public."SISGDDO_dictamen_tecnico".id;


--
-- Name: SISGDDO_eficacia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_eficacia" (
    id integer NOT NULL,
    eval_tot numeric(9,2) NOT NULL,
    eficaz boolean NOT NULL,
    conformidad boolean NOT NULL,
    fecha date NOT NULL,
    proceso_id integer NOT NULL,
    trabajador_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_eficacia" OWNER TO postgres;

--
-- Name: SISGDDO_eficacia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_eficacia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_eficacia_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_eficacia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_eficacia_id_seq" OWNED BY public."SISGDDO_eficacia".id;


--
-- Name: SISGDDO_entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_entidad" (
    id integer NOT NULL,
    "nombre_Entidad" character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_entidad" OWNER TO postgres;

--
-- Name: SISGDDO_entidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_entidad_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_entidad_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_entidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_entidad_id_seq" OWNED BY public."SISGDDO_entidad".id;


--
-- Name: SISGDDO_entradas_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_entradas_proyecto" (
    id integer NOT NULL,
    no_entrada integer NOT NULL,
    documentacion character varying(25) NOT NULL,
    direccion_sitio character varying(200) NOT NULL,
    observaciones character varying(255) NOT NULL,
    estado_entradas_proyecto_id integer NOT NULL,
    "jefe_UEB_grupo_id" integer NOT NULL,
    lenguaje_prog_id integer NOT NULL,
    proyecto_id integer NOT NULL,
    sistema_operativo_id integer NOT NULL,
    trabajador_calidad_interna_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_entradas_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_entradas_proyecto_formatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_entradas_proyecto_formatos" (
    id integer NOT NULL,
    entradas_proyecto_id integer NOT NULL,
    formatos_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_entradas_proyecto_formatos" OWNER TO postgres;

--
-- Name: SISGDDO_entradas_proyecto_formatos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_entradas_proyecto_formatos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_entradas_proyecto_formatos_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_entradas_proyecto_formatos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_entradas_proyecto_formatos_id_seq" OWNED BY public."SISGDDO_entradas_proyecto_formatos".id;


--
-- Name: SISGDDO_entradas_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_entradas_proyecto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_entradas_proyecto_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_entradas_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_entradas_proyecto_id_seq" OWNED BY public."SISGDDO_entradas_proyecto".id;


--
-- Name: SISGDDO_estado_acuerdo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_acuerdo" (
    id integer NOT NULL,
    "nombre_Estado" character varying(25) NOT NULL
);


ALTER TABLE public."SISGDDO_estado_acuerdo" OWNER TO postgres;

--
-- Name: SISGDDO_estado_acuerdo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_estado_acuerdo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_estado_acuerdo_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_estado_acuerdo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_estado_acuerdo_id_seq" OWNED BY public."SISGDDO_estado_acuerdo".id;


--
-- Name: SISGDDO_estado_dictamen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_dictamen" (
    id integer NOT NULL,
    "nombre_Estado" character varying(25) NOT NULL
);


ALTER TABLE public."SISGDDO_estado_dictamen" OWNER TO postgres;

--
-- Name: SISGDDO_estado_dictamen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_estado_dictamen_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_estado_dictamen_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_estado_dictamen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_estado_dictamen_id_seq" OWNED BY public."SISGDDO_estado_dictamen".id;


--
-- Name: SISGDDO_estado_entradas_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_entradas_proyecto" (
    id integer NOT NULL,
    "nombre_Estado" character varying(25) NOT NULL
);


ALTER TABLE public."SISGDDO_estado_entradas_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_estado_entradas_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_estado_entradas_proyecto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_estado_entradas_proyecto_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_estado_entradas_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_estado_entradas_proyecto_id_seq" OWNED BY public."SISGDDO_estado_entradas_proyecto".id;


--
-- Name: SISGDDO_estado_no_conformidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_no_conformidad" (
    id integer NOT NULL,
    "nombre_Estado" character varying(25) NOT NULL
);


ALTER TABLE public."SISGDDO_estado_no_conformidad" OWNER TO postgres;

--
-- Name: SISGDDO_estado_no_conformidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_estado_no_conformidad_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_estado_no_conformidad_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_estado_no_conformidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_estado_no_conformidad_id_seq" OWNED BY public."SISGDDO_estado_no_conformidad".id;


--
-- Name: SISGDDO_estado_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_proyecto" (
    id integer NOT NULL,
    "nombre_Estado" character varying(25) NOT NULL
);


ALTER TABLE public."SISGDDO_estado_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_estado_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_estado_proyecto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_estado_proyecto_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_estado_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_estado_proyecto_id_seq" OWNED BY public."SISGDDO_estado_proyecto".id;


--
-- Name: SISGDDO_formacion_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_formacion_personal" (
    id integer NOT NULL,
    titulo character varying(25) NOT NULL,
    capacitacion_necesita text NOT NULL
);


ALTER TABLE public."SISGDDO_formacion_personal" OWNER TO postgres;

--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_formacion_personal_capacitacion_adquirida" (
    id integer NOT NULL,
    formacion_personal_id integer NOT NULL,
    curso_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_formacion_personal_capacitacion_adquirida" OWNER TO postgres;

--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_formacion_personal_capacitacion_adquirida_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_formacion_personal_capacitacion_adquirida_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_formacion_personal_capacitacion_adquirida_id_seq" OWNED BY public."SISGDDO_formacion_personal_capacitacion_adquirida".id;


--
-- Name: SISGDDO_formacion_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_formacion_personal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_formacion_personal_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_formacion_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_formacion_personal_id_seq" OWNED BY public."SISGDDO_formacion_personal".id;


--
-- Name: SISGDDO_formatos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_formatos" (
    id integer NOT NULL,
    "nombre_Formato" character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_formatos" OWNER TO postgres;

--
-- Name: SISGDDO_formatos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_formatos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_formatos_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_formatos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_formatos_id_seq" OWNED BY public."SISGDDO_formatos".id;


--
-- Name: SISGDDO_historico_dictamen_tecnico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_historico_dictamen_tecnico" (
    id integer NOT NULL,
    fecha_entreda date NOT NULL,
    fecha_envio_resultado date NOT NULL,
    dictamen_tecnico_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_historico_dictamen_tecnico" OWNER TO postgres;

--
-- Name: SISGDDO_historico_dictamen_tecnico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_historico_dictamen_tecnico_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_historico_dictamen_tecnico_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_historico_dictamen_tecnico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_historico_dictamen_tecnico_id_seq" OWNED BY public."SISGDDO_historico_dictamen_tecnico".id;


--
-- Name: SISGDDO_historico_entradas_proyectos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_historico_entradas_proyectos" (
    id integer NOT NULL,
    comentarios character varying(55) NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    entradas_proyectos_id integer NOT NULL,
    entregado_por_id integer NOT NULL,
    recibida_por_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_historico_entradas_proyectos" OWNER TO postgres;

--
-- Name: SISGDDO_historico_entradas_proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_historico_entradas_proyectos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_historico_entradas_proyectos_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_historico_entradas_proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_historico_entradas_proyectos_id_seq" OWNED BY public."SISGDDO_historico_entradas_proyectos".id;


--
-- Name: SISGDDO_idioma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_idioma" (
    id integer NOT NULL,
    "nombre_Idioma" character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_idioma" OWNER TO postgres;

--
-- Name: SISGDDO_idioma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_idioma_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_idioma_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_idioma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_idioma_id_seq" OWNED BY public."SISGDDO_idioma".id;


--
-- Name: SISGDDO_incidencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_incidencias" (
    no_conformidad_ptr_id integer NOT NULL,
    descripcion text NOT NULL,
    clasificacion_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_incidencias" OWNER TO postgres;

--
-- Name: SISGDDO_indicador_eficacia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_indicador_eficacia" (
    id integer NOT NULL,
    nombre_ind character varying(200) NOT NULL,
    proceso_id integer NOT NULL,
    calif_ind integer
);


ALTER TABLE public."SISGDDO_indicador_eficacia" OWNER TO postgres;

--
-- Name: SISGDDO_indicador_eficacia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_indicador_eficacia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_indicador_eficacia_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_indicador_eficacia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_indicador_eficacia_id_seq" OWNED BY public."SISGDDO_indicador_eficacia".id;


--
-- Name: SISGDDO_lenguaje_prog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_lenguaje_prog" (
    id integer NOT NULL,
    "nombre_Lenguaje" character varying(25) NOT NULL,
    "version_Lenguaje" double precision NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_lenguaje_prog" OWNER TO postgres;

--
-- Name: SISGDDO_lenguaje_prog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_lenguaje_prog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_lenguaje_prog_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_lenguaje_prog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_lenguaje_prog_id_seq" OWNED BY public."SISGDDO_lenguaje_prog".id;


--
-- Name: SISGDDO_metodosprueba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_metodosprueba" (
    id integer NOT NULL,
    metodo character varying(25) NOT NULL
);


ALTER TABLE public."SISGDDO_metodosprueba" OWNER TO postgres;

--
-- Name: SISGDDO_metodosprueba_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_metodosprueba_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_metodosprueba_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_metodosprueba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_metodosprueba_id_seq" OWNED BY public."SISGDDO_metodosprueba".id;


--
-- Name: SISGDDO_no_conformidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_no_conformidad" (
    id integer NOT NULL,
    nombre_conformifdad character varying(55) NOT NULL,
    fecha_recibido timestamp with time zone NOT NULL,
    fecha_cierre date NOT NULL,
    observacion text NOT NULL,
    estado_id integer NOT NULL,
    proceso_id integer NOT NULL,
    trabajador_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_no_conformidad" OWNER TO postgres;

--
-- Name: SISGDDO_no_conformidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_no_conformidad_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_no_conformidad_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_no_conformidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_no_conformidad_id_seq" OWNED BY public."SISGDDO_no_conformidad".id;


--
-- Name: SISGDDO_organismo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_organismo" (
    id integer NOT NULL,
    "nombre_Organismo" character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_organismo" OWNER TO postgres;

--
-- Name: SISGDDO_organismo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_organismo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_organismo_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_organismo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_organismo_id_seq" OWNED BY public."SISGDDO_organismo".id;


--
-- Name: SISGDDO_plan_medidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_plan_medidas" (
    id integer NOT NULL,
    actividad character varying(25) NOT NULL,
    titulo_doc character varying(25) NOT NULL,
    fecha date NOT NULL,
    proceso_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_plan_medidas" OWNER TO postgres;

--
-- Name: SISGDDO_plan_medidas_acciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_plan_medidas_acciones" (
    id integer NOT NULL,
    plan_medidas_id integer NOT NULL,
    acciones_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_plan_medidas_acciones" OWNER TO postgres;

--
-- Name: SISGDDO_plan_medidas_acciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_plan_medidas_acciones_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_plan_medidas_acciones_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_plan_medidas_acciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_plan_medidas_acciones_id_seq" OWNED BY public."SISGDDO_plan_medidas_acciones".id;


--
-- Name: SISGDDO_plan_medidas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_plan_medidas_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_plan_medidas_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_plan_medidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_plan_medidas_id_seq" OWNED BY public."SISGDDO_plan_medidas".id;


--
-- Name: SISGDDO_proceso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_proceso" (
    id integer NOT NULL,
    "nombre_Proceso" character varying(55) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_proceso" OWNER TO postgres;

--
-- Name: SISGDDO_proceso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_proceso_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_proceso_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_proceso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_proceso_id_seq" OWNED BY public."SISGDDO_proceso".id;


--
-- Name: SISGDDO_provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_provincia" (
    id integer NOT NULL,
    "nombre_Provincia" character varying(25) NOT NULL
);


ALTER TABLE public."SISGDDO_provincia" OWNER TO postgres;

--
-- Name: SISGDDO_provincia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_provincia_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_provincia_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_provincia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_provincia_id_seq" OWNED BY public."SISGDDO_provincia".id;


--
-- Name: SISGDDO_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_proyecto" (
    id integer NOT NULL,
    nombre_proyecto character varying(25) NOT NULL,
    no_contrato integer NOT NULL,
    resolusion_proyecto character varying(10) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_terminacion date NOT NULL,
    fecha_entrega date NOT NULL,
    area_id integer NOT NULL,
    cenda_id integer,
    estado_id integer NOT NULL,
    sosi_id integer
);


ALTER TABLE public."SISGDDO_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_proyecto_jefe_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_proyecto_jefe_proyecto" (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    trabajador_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_proyecto_jefe_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_proyecto_jefe_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_proyecto_jefe_proyecto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_proyecto_jefe_proyecto_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_proyecto_jefe_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_proyecto_jefe_proyecto_id_seq" OWNED BY public."SISGDDO_proyecto_jefe_proyecto".id;


--
-- Name: SISGDDO_sistema_operativo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_sistema_operativo" (
    id integer NOT NULL,
    "nombre_Sistema" character varying(25) NOT NULL,
    "version_Sistema" double precision NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_sistema_operativo" OWNER TO postgres;

--
-- Name: SISGDDO_sistema_operativo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_sistema_operativo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_sistema_operativo_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_sistema_operativo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_sistema_operativo_id_seq" OWNED BY public."SISGDDO_sistema_operativo".id;


--
-- Name: SISGDDO_sosi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_sosi" (
    id integer NOT NULL,
    numero_salva integer NOT NULL,
    descripcion character varying(255),
    fecha_salv date NOT NULL,
    ubicacion_salv character varying(25) NOT NULL,
    documentacion boolean NOT NULL,
    materia_prima boolean NOT NULL,
    anno integer NOT NULL,
    autor character varying(25),
    cod_proyecto character varying(10) NOT NULL,
    nombre_proy_prod character varying(25) NOT NULL,
    area_id integer NOT NULL,
    coleccion_id integer NOT NULL,
    formatos_id integer NOT NULL,
    persona_entrega_id integer NOT NULL,
    persona_recibe_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_sosi" OWNER TO postgres;

--
-- Name: SISGDDO_sosi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_sosi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_sosi_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_sosi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_sosi_id_seq" OWNED BY public."SISGDDO_sosi".id;


--
-- Name: SISGDDO_sosi_idioma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_sosi_idioma" (
    id integer NOT NULL,
    sosi_id integer NOT NULL,
    idioma_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_sosi_idioma" OWNER TO postgres;

--
-- Name: SISGDDO_sosi_idioma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_sosi_idioma_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_sosi_idioma_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_sosi_idioma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_sosi_idioma_id_seq" OWNED BY public."SISGDDO_sosi_idioma".id;


--
-- Name: SISGDDO_tipo_de_licencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_tipo_de_licencias" (
    id integer NOT NULL,
    nombre_lic character varying(25) NOT NULL,
    no_licencia integer NOT NULL,
    actividad character varying(25) NOT NULL,
    fecha_otorg date NOT NULL,
    fecha_venc date NOT NULL,
    observacion text,
    entidad_emite_id integer NOT NULL,
    proceso_id integer NOT NULL,
    trabajador_responsable_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_tipo_de_licencias" OWNER TO postgres;

--
-- Name: SISGDDO_tipo_de_licencias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_tipo_de_licencias_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_tipo_de_licencias_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_tipo_de_licencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_tipo_de_licencias_id_seq" OWNED BY public."SISGDDO_tipo_de_licencias".id;


--
-- Name: SISGDDO_trabajador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_trabajador" (
    id integer NOT NULL,
    nombre_trabajador character varying(25),
    primer_apellido character varying(25),
    segundo_apellido character varying(25),
    ci character varying(11) NOT NULL,
    cargo character varying(25),
    activo boolean,
    formacion_id integer,
    es_cuadro boolean,
    es_reserva boolean,
    fotocuadro character varying(100),
    fotoreserva character varying(100),
    planillacuadro character varying(100),
    planillareserva character varying(100)
);


ALTER TABLE public."SISGDDO_trabajador" OWNER TO postgres;

--
-- Name: SISGDDO_trabajador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_trabajador_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_trabajador_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_trabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_trabajador_id_seq" OWNED BY public."SISGDDO_trabajador".id;


--
-- Name: SISGDDO_tratamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_tratamiento" (
    id integer NOT NULL,
    "nombre_Tratamiento" character varying(55) NOT NULL
);


ALTER TABLE public."SISGDDO_tratamiento" OWNER TO postgres;

--
-- Name: SISGDDO_tratamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_tratamiento_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_tratamiento_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_tratamiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_tratamiento_id_seq" OWNED BY public."SISGDDO_tratamiento".id;


--
-- Name: SISGDDO_valoracion_encuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_valoracion_encuesta" (
    id integer NOT NULL,
    fecha date NOT NULL,
    documento character varying(100) NOT NULL,
    "ISG_total" numeric(9,2) NOT NULL,
    elaborado_por_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_valoracion_encuesta" OWNER TO postgres;

--
-- Name: SISGDDO_valoracion_encuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_valoracion_encuesta_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_valoracion_encuesta_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_valoracion_encuesta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_valoracion_encuesta_id_seq" OWNED BY public."SISGDDO_valoracion_encuesta".id;


--
-- Name: SISGDDO_valoracion_encuesta_organismo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_valoracion_encuesta_organismo" (
    id integer NOT NULL,
    valoracion_encuesta_id integer NOT NULL,
    organismo_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_valoracion_encuesta_organismo" OWNER TO postgres;

--
-- Name: SISGDDO_valoracion_encuesta_organismo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SISGDDO_valoracion_encuesta_organismo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SISGDDO_valoracion_encuesta_organismo_id_seq" OWNER TO postgres;

--
-- Name: SISGDDO_valoracion_encuesta_organismo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SISGDDO_valoracion_encuesta_organismo_id_seq" OWNED BY public."SISGDDO_valoracion_encuesta_organismo".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: captcha_captchastore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.captcha_captchastore (
    id integer NOT NULL,
    challenge character varying(32) NOT NULL,
    response character varying(32) NOT NULL,
    hashkey character varying(40) NOT NULL,
    expiration timestamp with time zone NOT NULL
);


ALTER TABLE public.captcha_captchastore OWNER TO postgres;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.captcha_captchastore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.captcha_captchastore_id_seq OWNER TO postgres;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.captcha_captchastore_id_seq OWNED BY public.captcha_captchastore.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: notifications_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_notification (
    id integer NOT NULL,
    level character varying(20) NOT NULL,
    unread boolean NOT NULL,
    actor_object_id character varying(255) NOT NULL,
    verb character varying(255) NOT NULL,
    description text,
    target_object_id character varying(255),
    action_object_object_id character varying(255),
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    action_object_content_type_id integer,
    actor_content_type_id integer NOT NULL,
    recipient_id integer NOT NULL,
    target_content_type_id integer,
    deleted boolean NOT NULL,
    emailed boolean NOT NULL,
    data text
);


ALTER TABLE public.notifications_notification OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_notification_id_seq OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications_notification.id;


--
-- Name: SISGDDO_acciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_acciones_id_seq"'::regclass);


--
-- Name: SISGDDO_acciones_responsable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_responsable" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_acciones_responsable_id_seq"'::regclass);


--
-- Name: SISGDDO_acuerdos_consejillo_responsable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_acuerdos_consejillo_responsable_id_seq"'::regclass);


--
-- Name: SISGDDO_area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_area" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_area_id_seq"'::regclass);


--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_aspecto_medir_indicadoreficacia" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_aspecto_medir_indicadoreficacia_id_seq"'::regclass);


--
-- Name: SISGDDO_auditoria_externa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_auditoria_externa_id_seq"'::regclass);


--
-- Name: SISGDDO_auditoria_externa_area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_auditoria_externa_area_id_seq"'::regclass);


--
-- Name: SISGDDO_auditoria_interna id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_auditoria_interna_id_seq"'::regclass);


--
-- Name: SISGDDO_auditoria_interna_trabajadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_auditoria_interna_trabajadores_id_seq"'::regclass);


--
-- Name: SISGDDO_cenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_cenda" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_cenda_id_seq"'::regclass);


--
-- Name: SISGDDO_clasificacionincidencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_clasificacionincidencias" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_clasificacionincidencias_id_seq"'::regclass);


--
-- Name: SISGDDO_cliente_externo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_cliente_externo" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_cliente_externo_id_seq"'::regclass);


--
-- Name: SISGDDO_coleccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_coleccion" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_coleccion_id_seq"'::regclass);


--
-- Name: SISGDDO_curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_curso" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_curso_id_seq"'::regclass);


--
-- Name: SISGDDO_dictamen_tecnico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_dictamen_tecnico_id_seq"'::regclass);


--
-- Name: SISGDDO_eficacia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_eficacia" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_eficacia_id_seq"'::regclass);


--
-- Name: SISGDDO_entidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entidad" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_entidad_id_seq"'::regclass);


--
-- Name: SISGDDO_entradas_proyecto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_entradas_proyecto_id_seq"'::regclass);


--
-- Name: SISGDDO_entradas_proyecto_formatos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_entradas_proyecto_formatos_id_seq"'::regclass);


--
-- Name: SISGDDO_estado_acuerdo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_acuerdo" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_estado_acuerdo_id_seq"'::regclass);


--
-- Name: SISGDDO_estado_dictamen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_dictamen" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_estado_dictamen_id_seq"'::regclass);


--
-- Name: SISGDDO_estado_entradas_proyecto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_entradas_proyecto" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_estado_entradas_proyecto_id_seq"'::regclass);


--
-- Name: SISGDDO_estado_no_conformidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_no_conformidad" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_estado_no_conformidad_id_seq"'::regclass);


--
-- Name: SISGDDO_estado_proyecto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_proyecto" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_estado_proyecto_id_seq"'::regclass);


--
-- Name: SISGDDO_formacion_personal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formacion_personal" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_formacion_personal_id_seq"'::regclass);


--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_formacion_personal_capacitacion_adquirida_id_seq"'::regclass);


--
-- Name: SISGDDO_formatos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formatos" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_formatos_id_seq"'::regclass);


--
-- Name: SISGDDO_historico_dictamen_tecnico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_dictamen_tecnico" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_historico_dictamen_tecnico_id_seq"'::regclass);


--
-- Name: SISGDDO_historico_entradas_proyectos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_historico_entradas_proyectos_id_seq"'::regclass);


--
-- Name: SISGDDO_idioma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_idioma" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_idioma_id_seq"'::regclass);


--
-- Name: SISGDDO_indicador_eficacia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_eficacia" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_indicador_eficacia_id_seq"'::regclass);


--
-- Name: SISGDDO_lenguaje_prog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_lenguaje_prog" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_lenguaje_prog_id_seq"'::regclass);


--
-- Name: SISGDDO_metodosprueba id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_metodosprueba" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_metodosprueba_id_seq"'::regclass);


--
-- Name: SISGDDO_no_conformidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_no_conformidad" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_no_conformidad_id_seq"'::regclass);


--
-- Name: SISGDDO_organismo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_organismo" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_organismo_id_seq"'::regclass);


--
-- Name: SISGDDO_plan_medidas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_plan_medidas_id_seq"'::regclass);


--
-- Name: SISGDDO_plan_medidas_acciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_plan_medidas_acciones_id_seq"'::regclass);


--
-- Name: SISGDDO_proceso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proceso" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_proceso_id_seq"'::regclass);


--
-- Name: SISGDDO_provincia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_provincia" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_provincia_id_seq"'::regclass);


--
-- Name: SISGDDO_proyecto_jefe_proyecto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_proyecto_jefe_proyecto_id_seq"'::regclass);


--
-- Name: SISGDDO_sistema_operativo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sistema_operativo" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_sistema_operativo_id_seq"'::regclass);


--
-- Name: SISGDDO_sosi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_sosi_id_seq"'::regclass);


--
-- Name: SISGDDO_sosi_idioma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi_idioma" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_sosi_idioma_id_seq"'::regclass);


--
-- Name: SISGDDO_tipo_de_licencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_tipo_de_licencias_id_seq"'::regclass);


--
-- Name: SISGDDO_trabajador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_trabajador_id_seq"'::regclass);


--
-- Name: SISGDDO_tratamiento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tratamiento" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_tratamiento_id_seq"'::regclass);


--
-- Name: SISGDDO_valoracion_encuesta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_valoracion_encuesta_id_seq"'::regclass);


--
-- Name: SISGDDO_valoracion_encuesta_organismo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo" ALTER COLUMN id SET DEFAULT nextval('public."SISGDDO_valoracion_encuesta_organismo_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: captcha_captchastore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captcha_captchastore ALTER COLUMN id SET DEFAULT nextval('public.captcha_captchastore_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: notifications_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification ALTER COLUMN id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Data for Name: ProyectoBaseApp_userapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProyectoBaseApp_userapp" (user_ptr_id, uui, image, "referUser", fa2) FROM stdin;
1	99bd656b-3f51-4b7d-958e-09e24fdff9c4	foto/Citmatel_logo_GyfPbE2.png	\N	f
2	3379b202-11a5-4d0e-ab99-e44fad78302d	static/users/userDefault1.png	\N	f
3	eb08bdb3-24d9-4f13-ada2-8e73d3c0ed48	static/users/userDefault1.png	\N	f
5	3b7f589e-9624-48ea-99fa-2a1febfba8e3	foto/userDefault1.png	\N	f
4	d594882f-55e4-4b54-91ad-5f8181e2486f	foto/userDefault1_m1KcbFz.png	\N	f
\.


--
-- Data for Name: SISGDDO_acciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acciones" (id, fecha_cumplir, seguimiento, tratamiento_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_acciones_correptivas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acciones_correptivas" (acciones_ptr_id, accion_tomar) FROM stdin;
\.


--
-- Data for Name: SISGDDO_acciones_prevenntivas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acciones_prevenntivas" (acciones_ptr_id, accion_tomar) FROM stdin;
\.


--
-- Data for Name: SISGDDO_acciones_responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acciones_responsable" (id, acciones_id, trabajador_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_acuerdos_consejillo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdos_consejillo" (id, fecha_tomada, fecha_cumplir, descripcion, estado_acuerd_id) FROM stdin;
34	2020-11-27	2020-11-30	zczvzv	1
\.


--
-- Data for Name: SISGDDO_acuerdos_consejillo_responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdos_consejillo_responsable" (id, acuerdos_consejillo_id, trabajador_id) FROM stdin;
1	34	3
\.


--
-- Data for Name: SISGDDO_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_area" (id, "nombre_Area", activo) FROM stdin;
1	UEB Desarrollo de Software	t
2	UEB Proyectos Multimedia	t
3	UDI	t
4	UEB Servicios Web	t
5	UEB Proyectos e Instalaciones de Redes y Sistemas de Cómputo	t
6	UEB Operaciones de Internet	t
7	UEB Servicios Territoriales	t
8	UEB Sistemas Gerenciales	t
9	Dpto Contabilidad y Control	t
10	Dpto Cobros y Pagos	t
11	Dpto Recursos Humanos	t
12	Dpto Gestión de la Calidad y Auditoría	t
13	Dpto Nacional Ventas y Exportaciones	t
14	Dpto Marketing y Publicidad	t
15	Dirección Contable Financiera	t
16	Dirección Administrativa	t
17	Dirección Desarrollo Organizacional	t
18	Dirección Des. e Innovación Tecnológica	t
19	Dirección Comercial	t
20	Dirección General	t
\.


--
-- Data for Name: SISGDDO_aspecto_medir_indicadoreficacia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_aspecto_medir_indicadoreficacia" (id, nombre_asp, indicadores_id, calificacion_asp) FROM stdin;
1	No cumple con los objetivos.	1	2
2	No cumple con el alcance.	1	2
3	Deficiencias  con el cumplimiento en tiempo del programa y cumple con el  los objetivos, el alcance y documentación de la auditoria.	1	3
4	Cumple con el programa,  los objetivos, el alcance y documentación y fallas menores en la documentación.	1	4
5	Cumple con el programa, los objetivos , el alcance y documentación.	1	4
6	Algún Incumplimiento mayor. (Se clasifica la No conformidad como mayor  si existe algún incumplimiento	2	2
7	Mas de 2  incumplimientos menores	2	4
\.


--
-- Data for Name: SISGDDO_atencion_cliente_externo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_atencion_cliente_externo" (no_conformidad_ptr_id, via_recep, cliente_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_auditoria_externa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_externa" (id, no_registro, fecha_emision, titulo_inf, resultados, entidad_id, plan_medidas_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_auditoria_externa_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_externa_area" (id, auditoria_externa_id, area_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_auditoria_interna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_interna" (id, titulo_inf, fecha_aud, periodo_comprueba, asunto, objetivos, documentos_referencia, muestra, conclusiones, area_id, metodos_prueba_id, plan_medidas_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_auditoria_interna_trabajadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_interna_trabajadores" (id, auditoria_interna_id, trabajador_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_cenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_cenda" (id, cotitular, fecha_incrip, coleccion_id) FROM stdin;
1	juliet	2020-11-26	1
\.


--
-- Data for Name: SISGDDO_clasificacionincidencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_clasificacionincidencias" (id, nombre_clasificacion) FROM stdin;
1	Alta
\.


--
-- Data for Name: SISGDDO_cliente_externo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_cliente_externo" (id, nombre_clienteext, apellidos, activo, provincia_id) FROM stdin;
1	yaciel	perez ramirez	t	12
2	ASD	ASD	t	15
\.


--
-- Data for Name: SISGDDO_coleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_coleccion" (id, "nombre_Coleccion", anno, activo) FROM stdin;
1	audiovisual	2019	t
2	NP	2019	t
3	arte	2019	t
\.


--
-- Data for Name: SISGDDO_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_curso" (id, "nombre_Curso", fecha) FROM stdin;
1	inflador	2020-11-24
2	python	2020-11-28
3	administracion	2020-12-23
\.


--
-- Data for Name: SISGDDO_dictamen_tecnico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_dictamen_tecnico" (id, no_dictamen, fecha, nombre_capitulos, documento, area_id, disennador_id, entradas_proyectos_id, especialista_calidad_id, estado_dictamen_id, eval_por_id, idioma_subtitulado_id, nuevo_idioma_id, proyecto_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_eficacia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_eficacia" (id, eval_tot, eficaz, conformidad, fecha, proceso_id, trabajador_id) FROM stdin;
1	0.00	f	f	2021-01-06	1	3
2	0.00	f	f	2021-01-06	1	3
3	1.20	f	f	2021-01-06	1	3
\.


--
-- Data for Name: SISGDDO_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_entidad" (id, "nombre_Entidad", activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_entradas_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_entradas_proyecto" (id, no_entrada, documentacion, direccion_sitio, observaciones, estado_entradas_proyecto_id, "jefe_UEB_grupo_id", lenguaje_prog_id, proyecto_id, sistema_operativo_id, trabajador_calidad_interna_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_entradas_proyecto_formatos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_entradas_proyecto_formatos" (id, entradas_proyecto_id, formatos_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_estado_acuerdo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_acuerdo" (id, "nombre_Estado") FROM stdin;
2	Cumplido
1	Pendiente
3	Permanente
4	Incumplido
\.


--
-- Data for Name: SISGDDO_estado_dictamen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_dictamen" (id, "nombre_Estado") FROM stdin;
1	Conforme
2	No conforme
\.


--
-- Data for Name: SISGDDO_estado_entradas_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_entradas_proyecto" (id, "nombre_Estado") FROM stdin;
1	Conforme
2	No conforme
\.


--
-- Data for Name: SISGDDO_estado_no_conformidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_no_conformidad" (id, "nombre_Estado") FROM stdin;
1	Pendiente
5	Cerrada
3	En proceso
\.


--
-- Data for Name: SISGDDO_estado_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_proyecto" (id, "nombre_Estado") FROM stdin;
1	aprobado
2	atrasado
3	solicitado
4	en fecha
5	reiniciado
6	interrumpido
7	terminado
8	cancelado
9	adelantado
\.


--
-- Data for Name: SISGDDO_formacion_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_formacion_personal" (id, titulo, capacitacion_necesita) FROM stdin;
1	tecnico infladera	12 grado
2	informatico	django
3	Descubridor de Citmatel	Ponchero
\.


--
-- Data for Name: SISGDDO_formacion_personal_capacitacion_adquirida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_formacion_personal_capacitacion_adquirida" (id, formacion_personal_id, curso_id) FROM stdin;
1	1	1
2	2	2
3	3	1
\.


--
-- Data for Name: SISGDDO_formatos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_formatos" (id, "nombre_Formato", activo) FROM stdin;
1	ISO	t
2	Sitio Web	t
3	rar	t
4	NP	t
\.


--
-- Data for Name: SISGDDO_historico_dictamen_tecnico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_historico_dictamen_tecnico" (id, fecha_entreda, fecha_envio_resultado, dictamen_tecnico_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_historico_entradas_proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_historico_entradas_proyectos" (id, comentarios, fecha, hora, entradas_proyectos_id, entregado_por_id, recibida_por_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_idioma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_idioma" (id, "nombre_Idioma", activo) FROM stdin;
1	Español	t
4	Italiano	t
2	Inglés	t
3	Francés	t
5	Portugues	t
\.


--
-- Data for Name: SISGDDO_incidencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_incidencias" (no_conformidad_ptr_id, descripcion, clasificacion_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_indicador_eficacia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_indicador_eficacia" (id, nombre_ind, proceso_id, calif_ind) FROM stdin;
3	3- Gestión  y  respuesta al 100 % a las quejas y reclamaciones de los clientes	1	0
4	4- Eficacia promedio del 95  de los procesos declarados en el Sistema de Gestión	1	0
5	5- Índice global de satisfacción del cliente por encima del 90 %	1	0
1	1- Cumplimiento del plan de auditorías y controles internos al 95%	1	3
2	2- Gestión del 100% de  las no conformidades detectadas  en el periodo analizado	1	3
\.


--
-- Data for Name: SISGDDO_lenguaje_prog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_lenguaje_prog" (id, "nombre_Lenguaje", "version_Lenguaje", activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_metodosprueba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_metodosprueba" (id, metodo) FROM stdin;
1	Inspección
2	Observación
3	Entrevista
\.


--
-- Data for Name: SISGDDO_no_conformidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_no_conformidad" (id, nombre_conformifdad, fecha_recibido, fecha_cierre, observacion, estado_id, proceso_id, trabajador_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_organismo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_organismo" (id, "nombre_Organismo", activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_plan_medidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_plan_medidas" (id, actividad, titulo_doc, fecha, proceso_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_plan_medidas_acciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_plan_medidas_acciones" (id, plan_medidas_id, acciones_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_proceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_proceso" (id, "nombre_Proceso", activo) FROM stdin;
1	P00 Gestión Integrada	t
2	P02 Gestión Comercial	t
3	P01 Gestión de Innovación	t
4	P03 Gestión de Desarrollo	t
5	P04 Registro de Dominio	t
6	P06 Sistemas Gerenciales	t
7	P05 Servicio Mantenimiento y Reparación de PC	t
8	P07 Conectividad	t
9	P08 Instalación de Redes	t
10	P09 Cursos en Línea	t
11	P10 Comercio Electrónico	t
12	P11 Recursos Humanos	t
13	P12 Servicios Generales	t
14	P13 Dirección Contable Financiera	t
15	P15 Servicio de Reproducción	t
16	P14 Gestión de la Información	t
\.


--
-- Data for Name: SISGDDO_provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_provincia" (id, "nombre_Provincia") FROM stdin;
1	La Habana
2	Pinar del Río
3	Mayabeque
4	Artemisa
5	Matanzas
6	Cienfuegos
7	Villa Clara
8	Santi Spiritus
10	Camaguey
11	Las Tunas
13	Granma
14	Isla de la Juventud
9	Ciego de Ávila
12	Holguín
15	Santiago de Cuba
16	Guantanamo
\.


--
-- Data for Name: SISGDDO_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_proyecto" (id, nombre_proyecto, no_contrato, resolusion_proyecto, fecha_inicio, fecha_terminacion, fecha_entrega, area_id, cenda_id, estado_id, sosi_id) FROM stdin;
1	tesis juliet	2345	RS123	2020-12-02	2020-12-17	2020-12-18	1	1	1	1
\.


--
-- Data for Name: SISGDDO_proyecto_jefe_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_proyecto_jefe_proyecto" (id, proyecto_id, trabajador_id) FROM stdin;
2	1	3
\.


--
-- Data for Name: SISGDDO_sistema_operativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_sistema_operativo" (id, "nombre_Sistema", "version_Sistema", activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_sosi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_sosi" (id, numero_salva, descripcion, fecha_salv, ubicacion_salv, documentacion, materia_prima, anno, autor, cod_proyecto, nombre_proy_prod, area_id, coleccion_id, formatos_id, persona_entrega_id, persona_recibe_id) FROM stdin;
1	34	proyecto tesis	2020-11-26	D	t	t	2020	juliet	4578	tesis juliet	1	1	1	2	2
\.


--
-- Data for Name: SISGDDO_sosi_idioma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_sosi_idioma" (id, sosi_id, idioma_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_tipo_de_licencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_tipo_de_licencias" (id, nombre_lic, no_licencia, actividad, fecha_otorg, fecha_venc, observacion, entidad_emite_id, proceso_id, trabajador_responsable_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_trabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_trabajador" (id, nombre_trabajador, primer_apellido, segundo_apellido, ci, cargo, activo, formacion_id, es_cuadro, es_reserva, fotocuadro, fotoreserva, planillacuadro, planillareserva) FROM stdin;
3	Juliet	Pineda	Serrano	93091131631	informatica	t	2	f	f	foto/userDefault1.png	foto/userDefault1.png	foto/userDefault1.png	foto/userDefault1.png
2	Norma	Serranos	Capote	14253544666	ddcddgfgsetg	t	1	f	f	foto/userDefault1.png	foto/userDefault1.png	foto/userDefault1.png	foto/userDefault1.png
10	Cristobal	Colón	Genoves	-1	improvisado	t	3	t	t	foto/userDefault1.png	foto/userDefault1.png	foto/userDefault1.png	foto/userDefault1.png
\.


--
-- Data for Name: SISGDDO_tratamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_tratamiento" (id, "nombre_Tratamiento") FROM stdin;
\.


--
-- Data for Name: SISGDDO_valoracion_encuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_valoracion_encuesta" (id, fecha, documento, "ISG_total", elaborado_por_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_valoracion_encuesta_organismo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_valoracion_encuesta_organismo" (id, valoracion_encuesta_id, organismo_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name, activo) FROM stdin;
2	Especialista de Capacitación	t
1	Admin	t
3	Director Dirección Organizacional	t
4	Jefe de Recursos Humanos	t
5	Jefe de Proyecto	t
6	Especialista del Grupo de Información	t
7	Jefe de Calidad y Auditoría	t
8	Especialista de Calidad y Auditoría	t
9	Usuario	t
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
41	2	137
42	2	138
43	2	139
44	2	140
45	2	37
46	2	38
47	2	39
48	2	40
49	2	189
50	2	190
51	2	191
52	2	192
53	2	69
54	2	70
55	2	71
56	2	72
57	2	73
58	2	74
59	2	75
60	2	76
61	2	205
62	2	206
63	2	207
64	2	208
65	2	209
66	2	210
67	2	211
68	2	212
69	2	105
70	2	106
71	2	107
72	2	108
73	2	117
74	2	118
75	2	119
76	2	120
77	1	37
78	1	38
79	1	39
80	1	40
81	1	41
82	1	42
83	1	43
84	1	44
85	1	45
86	1	46
87	1	47
88	1	48
89	1	49
90	1	50
91	1	51
92	1	52
93	1	53
94	1	54
95	1	55
96	1	56
97	1	57
98	1	58
99	1	59
100	1	60
101	1	61
102	1	62
103	1	63
104	1	64
105	1	65
106	1	66
107	1	67
108	1	68
109	1	69
110	1	70
111	1	71
112	1	72
113	1	73
114	1	74
115	1	75
116	1	76
117	1	77
118	1	78
119	1	79
120	1	80
121	1	81
122	1	82
123	1	83
124	1	84
125	1	85
126	1	86
127	1	87
128	1	88
129	1	89
130	1	90
131	1	91
132	1	92
133	1	93
134	1	94
135	1	95
136	1	96
137	1	97
138	1	98
139	1	99
140	1	100
141	1	101
142	1	102
143	1	103
144	1	104
145	1	105
146	1	106
147	1	107
148	1	108
149	1	109
150	1	110
151	1	111
152	1	112
153	1	113
154	1	114
155	1	115
156	1	116
157	1	117
158	1	118
159	1	119
160	1	120
161	1	121
162	1	122
163	1	123
164	1	124
165	1	125
166	1	126
167	1	127
168	1	128
169	1	129
170	1	130
171	1	131
172	1	132
173	1	133
174	1	134
175	1	135
176	1	136
177	1	137
178	1	138
179	1	139
180	1	140
181	1	141
182	1	142
183	1	143
184	1	144
185	1	145
186	1	146
187	1	147
188	1	148
189	1	149
190	1	150
191	1	151
192	1	152
193	1	153
194	1	154
195	1	155
196	1	156
197	1	157
198	1	158
199	1	159
200	1	160
201	1	161
202	1	162
203	1	163
204	1	164
205	1	165
206	1	166
207	1	167
208	1	168
209	1	169
210	1	170
211	1	171
212	1	172
213	1	173
214	1	174
215	1	175
216	1	176
217	1	177
218	1	178
219	1	179
220	1	180
221	1	181
222	1	182
223	1	183
224	1	184
225	1	185
226	1	186
227	1	187
228	1	188
229	1	189
230	1	190
231	1	191
232	1	192
233	1	193
234	1	194
235	1	195
236	1	196
237	1	197
238	1	198
239	1	199
240	1	200
241	1	201
242	1	202
243	1	203
244	1	204
245	1	205
246	1	206
247	1	207
248	1	208
249	1	209
250	1	210
251	1	211
252	1	212
253	3	192
254	3	72
255	3	108
256	3	109
257	3	110
258	3	111
259	3	112
260	3	212
261	3	120
262	3	153
263	3	154
264	3	155
265	3	156
266	4	192
267	4	69
268	4	70
269	4	71
270	4	72
271	4	137
272	4	138
273	4	139
274	4	140
275	4	189
276	4	190
277	4	191
278	5	160
279	5	141
280	5	142
281	5	143
282	5	144
283	5	81
284	5	82
285	5	83
286	5	84
287	5	157
288	5	158
289	5	159
290	6	145
291	6	146
292	6	147
293	6	148
294	6	149
295	6	150
296	6	151
297	6	152
298	6	165
299	6	166
300	6	167
301	6	168
302	6	173
303	6	174
304	6	175
305	6	176
306	6	85
307	6	86
308	6	87
309	6	88
310	6	93
311	6	94
312	6	95
313	6	96
314	6	97
315	6	98
316	6	99
317	6	100
318	7	129
319	7	130
320	7	131
321	7	132
322	7	169
323	7	170
324	7	171
325	7	172
326	7	45
327	7	46
328	7	47
329	7	48
330	7	177
331	7	178
332	7	179
333	7	180
334	7	61
335	7	63
336	7	62
337	7	185
338	7	186
339	7	187
340	7	188
341	7	57
342	7	58
343	7	59
344	7	60
345	7	193
346	7	194
347	7	195
348	7	196
349	7	197
350	7	198
351	7	199
352	7	200
353	7	65
354	7	66
355	7	67
356	7	68
357	7	77
358	7	78
359	7	79
360	7	80
361	7	64
362	7	89
363	7	90
364	7	91
365	7	92
366	7	93
367	7	94
368	7	95
369	7	96
370	7	101
371	7	102
372	7	103
373	7	104
374	7	113
375	7	114
376	7	115
377	7	116
378	7	121
379	7	122
380	7	123
381	7	124
382	8	128
383	8	129
384	8	130
385	8	131
386	8	132
387	8	133
388	8	134
389	8	135
390	8	136
391	8	169
392	8	170
393	8	171
394	8	172
395	8	45
396	8	46
397	8	47
398	8	48
399	8	177
400	8	178
401	8	179
402	8	180
403	8	49
404	8	50
405	8	51
406	8	52
407	8	185
408	8	186
409	8	187
410	8	188
411	8	57
412	8	58
413	8	59
414	8	60
415	8	193
416	8	194
417	8	195
418	8	196
419	8	197
420	8	198
421	8	199
422	8	200
423	8	65
424	8	66
425	8	67
426	8	68
427	8	77
428	8	78
429	8	79
430	8	80
431	8	89
432	8	90
433	8	91
434	8	92
435	8	93
436	8	94
437	8	95
438	8	96
439	8	113
440	8	114
441	8	115
442	8	116
443	8	121
444	8	122
445	8	123
446	8	124
447	8	125
448	8	126
449	8	127
450	9	128
451	9	4
452	9	132
453	9	8
454	9	136
455	9	12
456	9	140
457	9	16
458	9	144
459	9	20
460	9	148
461	9	24
462	9	152
463	9	156
464	9	28
465	9	32
466	9	160
467	9	36
468	9	164
469	9	40
470	9	168
471	9	172
472	9	44
473	9	48
474	9	176
475	9	180
476	9	52
477	9	184
478	9	56
479	9	60
480	9	188
481	9	192
482	9	64
483	9	196
484	9	68
485	9	200
486	9	72
487	9	76
488	9	208
489	9	80
490	9	84
491	9	212
492	9	88
493	9	92
494	9	96
495	9	100
496	9	104
497	9	108
498	9	112
499	9	116
500	9	120
501	9	124
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add user app	7	add_userapp
26	Can change user app	7	change_userapp
27	Can delete user app	7	delete_userapp
28	Can view user app	7	view_userapp
29	Can add notification	8	add_notification
30	Can change notification	8	change_notification
31	Can delete notification	8	delete_notification
32	Can view notification	8	view_notification
33	Can add captcha store	9	add_captchastore
34	Can change captcha store	9	change_captchastore
35	Can delete captcha store	9	delete_captchastore
36	Can view captcha store	9	view_captchastore
37	Can add cliente_externo	10	add_cliente_externo
38	Can change cliente_externo	10	change_cliente_externo
39	Can delete cliente_externo	10	delete_cliente_externo
40	Can view cliente_externo	10	view_cliente_externo
41	Can add provincia	11	add_provincia
42	Can change provincia	11	change_provincia
43	Can delete provincia	11	delete_provincia
44	Can view provincia	11	view_provincia
45	Can add entradas_proyecto	12	add_entradas_proyecto
46	Can change entradas_proyecto	12	change_entradas_proyecto
47	Can delete entradas_proyecto	12	delete_entradas_proyecto
48	Can view entradas_proyecto	12	view_entradas_proyecto
49	Can add valoracion_encuesta	13	add_valoracion_encuesta
50	Can change valoracion_encuesta	13	change_valoracion_encuesta
51	Can delete valoracion_encuesta	13	delete_valoracion_encuesta
52	Can view valoracion_encuesta	13	view_valoracion_encuesta
53	Can add coleccion	14	add_coleccion
54	Can change coleccion	14	change_coleccion
55	Can delete coleccion	14	delete_coleccion
56	Can view coleccion	14	view_coleccion
57	Can add acciones	15	add_acciones
58	Can change acciones	15	change_acciones
59	Can delete acciones	15	delete_acciones
60	Can view acciones	15	view_acciones
61	Can add proceso	16	add_proceso
62	Can change proceso	16	change_proceso
63	Can delete proceso	16	delete_proceso
64	Can view proceso	16	view_proceso
65	Can add historico_ dictamen_tecnico	17	add_historico_dictamen_tecnico
66	Can change historico_ dictamen_tecnico	17	change_historico_dictamen_tecnico
67	Can delete historico_ dictamen_tecnico	17	delete_historico_dictamen_tecnico
68	Can view historico_ dictamen_tecnico	17	view_historico_dictamen_tecnico
69	Can add trabajador	18	add_trabajador
70	Can change trabajador	18	change_trabajador
71	Can delete trabajador	18	delete_trabajador
72	Can view trabajador	18	view_trabajador
73	Can add entidad	19	add_entidad
74	Can change entidad	19	change_entidad
75	Can delete entidad	19	delete_entidad
76	Can view entidad	19	view_entidad
77	Can add dictamen_tecnico	20	add_dictamen_tecnico
78	Can change dictamen_tecnico	20	change_dictamen_tecnico
79	Can delete dictamen_tecnico	20	delete_dictamen_tecnico
80	Can view dictamen_tecnico	20	view_dictamen_tecnico
81	Can add eficacia	21	add_eficacia
82	Can change eficacia	21	change_eficacia
83	Can delete eficacia	21	delete_eficacia
84	Can view eficacia	21	view_eficacia
85	Can add lenguaje_prog	22	add_lenguaje_prog
86	Can change lenguaje_prog	22	change_lenguaje_prog
87	Can delete lenguaje_prog	22	delete_lenguaje_prog
88	Can view lenguaje_prog	22	view_lenguaje_prog
89	Can add estado_dictamen	23	add_estado_dictamen
90	Can change estado_dictamen	23	change_estado_dictamen
91	Can delete estado_dictamen	23	delete_estado_dictamen
92	Can view estado_dictamen	23	view_estado_dictamen
93	Can add estado_proyecto	24	add_estado_proyecto
94	Can change estado_proyecto	24	change_estado_proyecto
95	Can delete estado_proyecto	24	delete_estado_proyecto
96	Can view estado_proyecto	24	view_estado_proyecto
97	Can add cenda	25	add_cenda
98	Can change cenda	25	change_cenda
99	Can delete cenda	25	delete_cenda
100	Can view cenda	25	view_cenda
101	Can add tipo_de_licencias	26	add_tipo_de_licencias
102	Can change tipo_de_licencias	26	change_tipo_de_licencias
103	Can delete tipo_de_licencias	26	delete_tipo_de_licencias
104	Can view tipo_de_licencias	26	view_tipo_de_licencias
105	Can add estado_no_conformidad	27	add_estado_no_conformidad
106	Can change estado_no_conformidad	27	change_estado_no_conformidad
107	Can delete estado_no_conformidad	27	delete_estado_no_conformidad
108	Can view estado_no_conformidad	27	view_estado_no_conformidad
109	Can add estado_acuerdo	28	add_estado_acuerdo
110	Can change estado_acuerdo	28	change_estado_acuerdo
111	Can delete estado_acuerdo	28	delete_estado_acuerdo
112	Can view estado_acuerdo	28	view_estado_acuerdo
113	Can add tratamiento	29	add_tratamiento
114	Can change tratamiento	29	change_tratamiento
115	Can delete tratamiento	29	delete_tratamiento
116	Can view tratamiento	29	view_tratamiento
117	Can add no_ conformidad	30	add_no_conformidad
118	Can change no_ conformidad	30	change_no_conformidad
119	Can delete no_ conformidad	30	delete_no_conformidad
120	Can view no_ conformidad	30	view_no_conformidad
121	Can add auditoria_interna	31	add_auditoria_interna
122	Can change auditoria_interna	31	change_auditoria_interna
123	Can delete auditoria_interna	31	delete_auditoria_interna
124	Can view auditoria_interna	31	view_auditoria_interna
125	Can add organismo	32	add_organismo
126	Can change organismo	32	change_organismo
127	Can delete organismo	32	delete_organismo
128	Can view organismo	32	view_organismo
129	Can add estado_entradas_proyecto	33	add_estado_entradas_proyecto
130	Can change estado_entradas_proyecto	33	change_estado_entradas_proyecto
131	Can delete estado_entradas_proyecto	33	delete_estado_entradas_proyecto
132	Can view estado_entradas_proyecto	33	view_estado_entradas_proyecto
133	Can add formatos	34	add_formatos
134	Can change formatos	34	change_formatos
135	Can delete formatos	34	delete_formatos
136	Can view formatos	34	view_formatos
137	Can add curso	35	add_curso
138	Can change curso	35	change_curso
139	Can delete curso	35	delete_curso
140	Can view curso	35	view_curso
141	Can add aspecto_ medir_ indicador eficacia	36	add_aspecto_medir_indicadoreficacia
142	Can change aspecto_ medir_ indicador eficacia	36	change_aspecto_medir_indicadoreficacia
143	Can delete aspecto_ medir_ indicador eficacia	36	delete_aspecto_medir_indicadoreficacia
144	Can view aspecto_ medir_ indicador eficacia	36	view_aspecto_medir_indicadoreficacia
145	Can add proyecto	37	add_proyecto
146	Can change proyecto	37	change_proyecto
147	Can delete proyecto	37	delete_proyecto
148	Can view proyecto	37	view_proyecto
149	Can add sistema_operativo	38	add_sistema_operativo
150	Can change sistema_operativo	38	change_sistema_operativo
151	Can delete sistema_operativo	38	delete_sistema_operativo
152	Can view sistema_operativo	38	view_sistema_operativo
153	Can add acuerdos_consejillo	39	add_acuerdos_consejillo
154	Can change acuerdos_consejillo	39	change_acuerdos_consejillo
155	Can delete acuerdos_consejillo	39	delete_acuerdos_consejillo
156	Can view acuerdos_consejillo	39	view_acuerdos_consejillo
157	Can add indicador_eficacia	40	add_indicador_eficacia
158	Can change indicador_eficacia	40	change_indicador_eficacia
159	Can delete indicador_eficacia	40	delete_indicador_eficacia
160	Can view indicador_eficacia	40	view_indicador_eficacia
161	Can add idioma	41	add_idioma
162	Can change idioma	41	change_idioma
163	Can delete idioma	41	delete_idioma
164	Can view idioma	41	view_idioma
165	Can add metodosprueba	42	add_metodosprueba
166	Can change metodosprueba	42	change_metodosprueba
167	Can delete metodosprueba	42	delete_metodosprueba
168	Can view metodosprueba	42	view_metodosprueba
169	Can add plan_medidas	43	add_plan_medidas
170	Can change plan_medidas	43	change_plan_medidas
171	Can delete plan_medidas	43	delete_plan_medidas
172	Can view plan_medidas	43	view_plan_medidas
173	Can add sosi	44	add_sosi
174	Can change sosi	44	change_sosi
175	Can delete sosi	44	delete_sosi
176	Can view sosi	44	view_sosi
177	Can add historico_ entradas_proyectos	45	add_historico_entradas_proyectos
178	Can change historico_ entradas_proyectos	45	change_historico_entradas_proyectos
179	Can delete historico_ entradas_proyectos	45	delete_historico_entradas_proyectos
180	Can view historico_ entradas_proyectos	45	view_historico_entradas_proyectos
181	Can add area	46	add_area
182	Can change area	46	change_area
183	Can delete area	46	delete_area
184	Can view area	46	view_area
185	Can add acciones_prevenntivas	47	add_acciones_prevenntivas
186	Can change acciones_prevenntivas	47	change_acciones_prevenntivas
187	Can delete acciones_prevenntivas	47	delete_acciones_prevenntivas
188	Can view acciones_prevenntivas	47	view_acciones_prevenntivas
189	Can add formacion_personal	48	add_formacion_personal
190	Can change formacion_personal	48	change_formacion_personal
191	Can delete formacion_personal	48	delete_formacion_personal
192	Can view formacion_personal	48	view_formacion_personal
193	Can add auditoria_externa	49	add_auditoria_externa
194	Can change auditoria_externa	49	change_auditoria_externa
195	Can delete auditoria_externa	49	delete_auditoria_externa
196	Can view auditoria_externa	49	view_auditoria_externa
197	Can add acciones_correptivas	50	add_acciones_correptivas
198	Can change acciones_correptivas	50	change_acciones_correptivas
199	Can delete acciones_correptivas	50	delete_acciones_correptivas
200	Can view acciones_correptivas	50	view_acciones_correptivas
201	Can add reserva_cuadro	51	add_reserva_cuadro
202	Can change reserva_cuadro	51	change_reserva_cuadro
203	Can delete reserva_cuadro	51	delete_reserva_cuadro
204	Can view reserva_cuadro	51	view_reserva_cuadro
205	Can add atencion_cliente_externo	52	add_atencion_cliente_externo
206	Can change atencion_cliente_externo	52	change_atencion_cliente_externo
207	Can delete atencion_cliente_externo	52	delete_atencion_cliente_externo
208	Can view atencion_cliente_externo	52	view_atencion_cliente_externo
209	Can add incidencias	53	add_incidencias
210	Can change incidencias	53	change_incidencias
211	Can delete incidencias	53	delete_incidencias
212	Can view incidencias	53	view_incidencias
213	Can add clasificacionincidencias	54	add_clasificacionincidencias
214	Can change clasificacionincidencias	54	change_clasificacionincidencias
215	Can delete clasificacionincidencias	54	delete_clasificacionincidencias
216	Can view clasificacionincidencias	54	view_clasificacionincidencias
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$150000$VDmXmSFHqQ0Q$ridjy07uYWet6DOXRrlu70GYOFikjTCAaGhpZOxm8ns=	2020-12-04 16:01:22-05	f	anays	Anays	Gómez García	anaysgg@citmatel.inf.cu	t	t	2020-03-09 23:55:44-04
5	pbkdf2_sha256$150000$13roZYQ2B30v$zZxUK3XwccIQcDP2MkCqJUolKNqz5krkWr0GUTXuF0w=	\N	f	Yoyi	Mercedez	Hernández Sosa	mechuco@citmatel.inf.cu	f	t	2021-01-16 12:42:38.527818-05
4	pbkdf2_sha256$150000$eWsfK5l0CijY$Q+XqiB2r2HV0/auNz5k1Qa+3h9ao5evDUqF8j6klc5I=	2020-12-04 16:05:42.895189-05	f	mechuco	Mercedez	Hernández Sosa	mechuco@citmatel.inf.cu	t	t	2020-11-24 16:55:43-05
1	pbkdf2_sha256$150000$ETD2SeovVreg$NVG2qO3DS3WwNjn01eaURwvoO+DgnY5H7wstAj22skQ=	2021-01-17 15:45:10.020992-05	t	proyecto	Tesis	CITMATEL	proyecto@gmail.com	t	t	2020-03-09 22:23:18.245683-04
2	pbkdf2_sha256$150000$6QjUWfMdKEjd$aOTnGzUB5hXYU6Do+vdNLH8YfCDaa0LSOqevIljyUz8=	2020-12-04 16:04:19.927931-05	t	julietta	Juliet	Pineda Serrano	julietta@nauta.cu	t	t	2020-03-09 22:48:30-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	2	9
3	4	9
4	4	7
5	3	8
6	3	9
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	1
2	2	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	2	15
16	2	16
17	2	17
18	2	18
19	2	19
20	2	20
21	2	21
22	2	22
23	2	23
24	2	24
25	2	25
26	2	26
27	2	27
28	2	28
29	2	29
30	2	30
31	2	31
32	2	32
33	2	33
34	2	34
35	2	35
36	2	36
37	2	37
38	2	38
39	2	39
40	2	40
41	2	41
42	2	42
43	2	43
44	2	44
45	2	45
46	2	46
47	2	47
48	2	48
49	2	49
50	2	50
51	2	51
52	2	52
53	2	53
54	2	54
55	2	55
56	2	56
57	2	57
58	2	58
59	2	59
60	2	60
61	2	61
62	2	62
63	2	63
64	2	64
65	2	65
66	2	66
67	2	67
68	2	68
69	2	69
70	2	70
71	2	71
72	2	72
73	2	73
74	2	74
75	2	75
76	2	76
77	2	77
78	2	78
79	2	79
80	2	80
81	2	81
82	2	82
83	2	83
84	2	84
85	2	85
86	2	86
87	2	87
88	2	88
89	2	89
90	2	90
91	2	91
92	2	92
93	2	93
94	2	94
95	2	95
96	2	96
97	2	97
98	2	98
99	2	99
100	2	100
101	2	101
102	2	102
103	2	103
104	2	104
105	2	105
106	2	106
107	2	107
108	2	108
109	2	109
110	2	110
111	2	111
112	2	112
113	2	113
114	2	114
115	2	115
116	2	116
117	2	117
118	2	118
119	2	119
120	2	120
121	2	121
122	2	122
123	2	123
124	2	124
125	2	125
126	2	126
127	2	127
128	2	128
129	2	129
130	2	130
131	2	131
132	2	132
133	2	133
134	2	134
135	2	135
136	2	136
137	2	137
138	2	138
139	2	139
140	2	140
141	2	141
142	2	142
143	2	143
144	2	144
145	2	145
146	2	146
147	2	147
148	2	148
149	2	149
150	2	150
151	2	151
152	2	152
153	2	153
154	2	154
155	2	155
156	2	156
157	2	157
158	2	158
159	2	159
160	2	160
161	2	161
162	2	162
163	2	163
164	2	164
165	2	165
166	2	166
167	2	167
168	2	168
169	2	169
170	2	170
171	2	171
172	2	172
173	2	173
174	2	174
175	2	175
176	2	176
177	2	177
178	2	178
179	2	179
180	2	180
181	2	181
182	2	182
183	2	183
184	2	184
185	2	185
186	2	186
187	2	187
188	2	188
189	2	189
190	2	190
191	2	191
192	2	192
193	2	193
194	2	194
195	2	195
196	2	196
197	2	197
198	2	198
199	2	199
200	2	200
201	2	201
202	2	202
203	2	203
204	2	204
205	2	205
206	2	206
207	2	207
208	2	208
209	2	209
210	2	210
211	2	211
212	2	212
\.


--
-- Data for Name: captcha_captchastore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.captcha_captchastore (id, challenge, response, hashkey, expiration) FROM stdin;
14	JRDA	jrda	7996089c78e9d59a86f5280b662a745114aff11c	2021-01-16 12:45:31.509059-05
15	FWNY	fwny	bef1be452a8a2bd0aa33c84627a8c8dca23998d7	2021-01-16 12:45:47.431335-05
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-03-09 22:35:46.674298-04			4	127.0.0.1	4	1
2	2020-03-09 22:38:17.512915-04			5	127.0.0.1	4	1
3	2020-03-09 22:38:25.964277-04			4	127.0.0.1	4	1
4	2020-03-09 22:40:26.22283-04	1	proyecto	2	127.0.0.1	4	1
5	2020-03-09 22:41:04.855843-04	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
6	2020-03-09 22:42:04.111309-04	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
7	2020-03-09 22:43:22.408055-04	1	proyecto	2	127.0.0.1	4	1
8	2020-03-09 22:46:06.122647-04	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
9	2020-03-09 22:48:30.463693-04	2	hector	1	127.0.0.1	4	1
10	2020-03-09 22:50:01.574054-04			5	127.0.0.1	4	1
11	2020-03-09 22:50:34.81455-04			4	127.0.0.1	4	2
12	2020-03-09 22:51:10.600324-04			5	127.0.0.1	4	2
13	2020-03-09 22:51:19.714679-04			4	127.0.0.1	4	1
14	2020-03-09 22:51:41.611512-04	1	Admin	1	127.0.0.1	3	1
15	2020-03-09 22:51:53.393855-04	3379b202-11a5-4d0e-ab99-e44fad78302d	hector	2	127.0.0.1	7	1
16	2020-03-09 23:48:34.1877-04			4	127.0.0.1	4	1
17	2020-03-09 23:48:44.978882-04			5	127.0.0.1	4	1
18	2020-03-09 23:52:30.350946-04			4	127.0.0.1	4	1
19	2020-03-09 23:52:38.593802-04			5	127.0.0.1	4	1
20	2020-03-09 23:56:34.885197-04			5	127.0.0.1	4	3
21	2020-11-23 18:23:48.493706-05			4	127.0.0.1	4	1
22	2020-11-23 18:46:02.256848-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
23	2020-11-23 18:48:26.675372-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
24	2020-11-23 18:48:55.77629-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
25	2020-11-23 18:49:48.835295-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
26	2020-11-23 18:50:20.466674-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
27	2020-11-23 18:51:13.596272-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
28	2020-11-23 20:25:53.608464-05			4	127.0.0.1	4	1
29	2020-11-24 16:01:45.779053-05			4	127.0.0.1	4	1
30	2020-11-24 16:02:19.512381-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
31	2020-11-24 16:03:29.273725-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
32	2020-11-24 16:03:46.681671-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
33	2020-11-24 16:10:57.397272-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
34	2020-11-24 16:13:28.112121-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
35	2020-11-24 16:15:07.250434-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
36	2020-11-24 16:15:46.72585-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
37	2020-11-24 16:17:39.256526-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
38	2020-11-24 16:20:00.22279-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
39	2020-11-24 16:20:24.974775-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
40	2020-11-24 16:20:59.299603-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
41	2020-11-24 16:28:23.689706-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
42	2020-11-24 16:28:50.059058-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
43	2020-11-24 16:29:13.472005-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
44	2020-11-24 16:31:06.718117-05			4	127.0.0.1	4	1
45	2020-11-24 16:31:18.183425-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
46	2020-11-24 16:35:26.136374-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
47	2020-11-24 16:41:52.547273-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
48	2020-11-24 16:42:10.725561-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
49	2020-11-24 16:43:04.539499-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
50	2020-11-24 16:43:40.372149-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
51	2020-11-24 16:45:12.521127-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
52	2020-11-24 16:45:47.171746-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
53	2020-11-24 16:46:43.289062-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
54	2020-11-24 16:46:59.649718-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
55	2020-11-24 16:55:43.571796-05	4	yoni	1	127.0.0.1	4	1
56	2020-11-24 16:55:50.218222-05			5	127.0.0.1	4	1
57	2020-11-24 16:56:09.125295-05			4	127.0.0.1	4	4
58	2020-11-24 16:56:32.992-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	4
59	2020-11-24 16:57:51.529794-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	4
60	2020-11-24 16:58:17.261647-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	4
61	2020-11-24 17:01:56.2254-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	4
62	2020-11-24 17:12:20.289334-05	1	inflador	1	[{"added": {}}]	35	1
63	2020-11-24 17:12:37.451398-05	1	tecnico infladera	1	[{"added": {}}]	48	1
64	2020-11-24 17:12:41.487283-05	1	Yoniel Rodriguez Aguilar	1	[{"added": {}}]	18	1
65	2020-11-24 17:14:40.157165-05	2	norma aeew arfa	1	[{"added": {}}]	51	1
66	2020-11-24 17:16:47.370879-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
67	2020-11-24 17:23:31.276837-05			4	127.0.0.1	4	1
68	2020-11-24 17:35:20.840735-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
69	2020-11-24 17:36:38.597697-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
70	2020-11-24 17:43:02.001336-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
71	2020-11-24 17:56:21.866035-05			4	127.0.0.1	4	1
72	2020-11-24 17:56:37.570743-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
73	2020-11-24 18:00:56.248429-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
74	2020-11-24 18:01:16.282118-05	99bd656b-3f51-4b7d-958e-09e24fdff9c4	proyecto	2	127.0.0.1	7	1
75	2020-11-24 18:23:36.042882-05			4	127.0.0.1	4	1
76	2020-11-24 19:42:29.05422-05			4	127.0.0.1	4	1
77	2020-11-24 20:20:05.002936-05			4	127.0.0.1	4	1
78	2020-11-24 22:19:14.773458-05			4	127.0.0.1	4	1
79	2020-11-24 22:46:59.968046-05			4	127.0.0.1	4	1
80	2020-11-25 00:13:47.190395-05			4	127.0.0.1	4	1
81	2020-11-25 10:31:48.656203-05			4	127.0.0.1	4	1
82	2020-11-25 11:27:41.688395-05			4	127.0.0.1	4	1
83	2020-11-25 13:48:49.291506-05			4	127.0.0.1	4	1
84	2020-11-25 14:52:05.096908-05			4	127.0.0.1	4	1
85	2020-11-25 16:35:40.715219-05			4	127.0.0.1	4	1
86	2020-11-25 18:37:43.978688-05			4	127.0.0.1	4	1
87	2020-11-25 21:27:01.300923-05			4	127.0.0.1	4	1
88	2020-11-25 21:46:04.761734-05			4	127.0.0.1	4	1
89	2020-11-25 22:34:21.357209-05			4	127.0.0.1	4	1
90	2020-11-25 23:16:49.979728-05			4	127.0.0.1	4	1
91	2020-11-25 23:41:46.237121-05			4	127.0.0.1	4	1
92	2020-11-26 10:45:04.67264-05			4	127.0.0.1	4	1
93	2020-11-26 10:46:52.7464-05			4	127.0.0.1	4	1
94	2020-11-26 11:47:48.743772-05			4	127.0.0.1	4	1
95	2020-11-26 11:50:57.912062-05	1	aprobado	1	[{"added": {}}]	24	1
96	2020-11-26 11:51:17.611362-05	1	UEB Desarrollo	1	[{"added": {}}]	46	1
97	2020-11-26 11:53:20.603277-05	1	ISO	1	[{"added": {}}]	34	1
98	2020-11-26 11:53:57.643142-05	1	audiovisual	1	[{"added": {}}]	14	1
99	2020-11-26 11:54:26.772504-05	1	español	1	[{"added": {}}]	41	1
100	2020-11-26 11:54:48.405068-05	2	multimedias	1	[{"added": {}}]	46	1
101	2020-11-26 11:55:22.813944-05	1	SOSI object (1)	1	[{"added": {}}]	44	1
102	2020-11-26 11:55:40.580448-05	1	juliet	1	[{"added": {}}]	25	1
103	2020-11-26 11:55:48.7128-05	1	tesis juliet	1	[{"added": {}}]	37	1
104	2020-11-26 12:52:49.173217-05			4	127.0.0.1	4	1
105	2020-11-26 12:54:02.244583-05	2	atrasado	1	127.0.0.1	24	1
106	2020-11-26 13:44:05.761915-05			4	127.0.0.1	4	1
107	2020-11-26 13:45:16.492999-05	2	Calidad	1	127.0.0.1	3	1
108	2020-11-26 14:41:19.530033-05			4	127.0.0.1	4	1
109	2020-11-26 21:17:59.473846-05			4	127.0.0.1	4	1
110	2020-11-26 21:18:13.807429-05			5	127.0.0.1	4	1
111	2020-11-26 21:18:53.488953-05			4	127.0.0.1	4	1
112	2020-11-26 21:19:22.713398-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	1
113	2020-11-26 21:19:42.731565-05			5	127.0.0.1	4	1
114	2020-11-26 21:20:22.558199-05			4	127.0.0.1	4	1
115	2020-11-26 21:20:47.344946-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	1
116	2020-11-26 21:21:08.373913-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	1
117	2020-11-26 21:21:19.391772-05			5	127.0.0.1	4	1
118	2020-11-26 21:21:58.930698-05			4	127.0.0.1	4	4
119	2020-11-26 21:23:13.853337-05			5	127.0.0.1	4	4
120	2020-11-26 21:23:37.863686-05			4	127.0.0.1	4	1
121	2020-11-26 21:25:06.163735-05	3	cepero	3	127.0.0.1	7	1
122	2020-11-26 21:26:24.358886-05	eb08bdb3-24d9-4f13-ada2-8e73d3c0ed48	cepero	2	127.0.0.1	7	1
123	2020-11-26 21:26:43.599419-05	eb08bdb3-24d9-4f13-ada2-8e73d3c0ed48	cepero	2	127.0.0.1	7	1
124	2020-11-26 21:50:55.179604-05	2	multimedias	2	127.0.0.1	46	1
125	2020-11-26 21:51:42.702891-05	2	UEB Multimedias	2	127.0.0.1	46	1
126	2020-11-26 22:57:53.012767-05			4	127.0.0.1	4	1
127	2020-11-26 23:00:11.991004-05			5	127.0.0.1	4	1
128	2020-11-26 23:11:40.458489-05			4	127.0.0.1	4	1
129	2020-11-26 23:12:07.916985-05	2	NP	1	127.0.0.1	14	1
130	2020-11-26 23:12:48.099541-05	2	Sitio Web	1	127.0.0.1	34	1
131	2020-11-26 23:37:57.992152-05			4	127.0.0.1	4	1
132	2020-11-26 23:50:41.943367-05	2	norma aeew arfa	2	127.0.0.1	48	1
133	2020-11-26 23:51:45.222988-05	2	norma aeew arfa	2	127.0.0.1	48	1
134	2020-11-26 23:52:51.074126-05	2	norma aeew arfa	2	127.0.0.1	48	1
135	2020-11-27 08:18:05.895412-05			4	127.0.0.1	4	1
136	2020-11-27 08:58:39.133495-05	1	pendiente	1	127.0.0.1	27	1
137	2020-11-27 09:08:16.016035-05	1	yaciel perez ramirez	1	127.0.0.1	10	1
138	2020-11-27 10:17:25.450703-05	2	en procesos	1	127.0.0.1	27	1
139	2020-11-27 10:25:52.734573-05	1	P00 Gestión Integrada	1	127.0.0.1	16	1
140	2020-11-27 10:26:01.251819-05	2	P02 Gestión Comercial	1	127.0.0.1	16	1
141	2020-11-27 10:26:12.900659-05	3	en proceso	1	127.0.0.1	27	1
142	2020-11-27 10:28:57.898725-05	1	kjdszhfjhsfhshfhsiuhfiuhsiufhsiuhfuihiufshuifhsuhfiushu	1	127.0.0.1	52	1
143	2020-11-27 11:02:16.033771-05	2	python	1	127.0.0.1	35	1
144	2020-11-27 11:31:23.951058-05	2	informatico	1	127.0.0.1	48	1
145	2020-11-27 11:36:08.705912-05	1	pe	1	127.0.0.1	28	1
146	2020-11-27 11:36:17.230823-05	1	pe	2	127.0.0.1	28	1
147	2020-11-27 11:37:15.258939-05	1	pendiente	2	127.0.0.1	28	1
148	2020-11-27 11:41:16.359708-05	3	Juliet Pineda Serrano	1	127.0.0.1	18	1
149	2020-11-27 11:42:10.918481-05	34	acuerdos_consejillo object (34)	1	127.0.0.1	39	1
150	2020-11-27 12:32:02.080166-05	9	Yoniel Rodriguez Aguilar	1	127.0.0.1	51	1
151	2020-11-27 12:42:53.683967-05			4	127.0.0.1	4	1
152	2020-11-27 13:47:56.366456-05			4	127.0.0.1	4	1
153	2020-11-27 15:03:26.089312-05			4	127.0.0.1	4	1
154	2020-11-27 15:10:06.872076-05	3	rar	1	127.0.0.1	34	1
155	2020-11-27 15:10:23.538884-05	3	arte	1	127.0.0.1	14	1
156	2020-11-27 15:53:28.884782-05	4	pendiente	1	127.0.0.1	27	1
157	2020-11-27 15:55:42.598854-05	2	ugygy	1	127.0.0.1	53	1
158	2020-12-02 10:24:16.923433-05			4	127.0.0.1	4	1
159	2020-12-02 10:47:19.044256-05	1	tesis juliet	2	127.0.0.1	37	1
160	2020-12-02 11:42:02.749702-05			4	127.0.0.1	4	1
161	2020-12-02 12:57:29.105445-05			4	127.0.0.1	4	1
162	2020-12-02 14:06:59.841306-05			4	127.0.0.1	4	1
163	2020-12-02 14:45:09.396696-05			4	127.0.0.1	4	1
164	2020-12-02 15:12:44.03017-05			4	127.0.0.1	4	1
165	2020-12-02 17:34:52.491525-05			4	127.0.0.1	4	1
166	2020-12-04 14:26:54.103808-05			4	127.0.0.1	4	1
167	2020-12-04 14:42:06.457775-05	2	Calidad	2	127.0.0.1	3	1
168	2020-12-04 14:42:32.01227-05	1	Admin	2	127.0.0.1	3	1
169	2020-12-04 14:46:25.099031-05	3	Director Dirección Organizacional	1	127.0.0.1	3	1
170	2020-12-04 14:48:31.317871-05	4	Jefe de Recursos Humanos	1	127.0.0.1	3	1
171	2020-12-04 14:50:12.163161-05	5	Jefe de Proyecto	1	127.0.0.1	3	1
172	2020-12-04 15:33:45.193118-05			4	127.0.0.1	4	1
173	2020-12-04 15:35:32.82066-05	6	Especialista del Grupo de Información	1	127.0.0.1	3	1
174	2020-12-04 15:39:01.606263-05	7	Jefe de Calidad y Auditoría	1	127.0.0.1	3	1
175	2020-12-04 15:42:07.338572-05	8	Especialista de Calidad y Auditoría	1	127.0.0.1	3	1
176	2020-12-04 15:49:41.128456-05	9	Usuario	1	127.0.0.1	3	1
177	2020-12-04 15:50:36.77312-05	3	cepero	3	127.0.0.1	7	1
178	2020-12-04 15:51:02.962944-05	4	yoni	3	127.0.0.1	7	1
179	2020-12-04 15:53:05.775369-05	3379b202-11a5-4d0e-ab99-e44fad78302d	hector	2	127.0.0.1	7	1
180	2020-12-04 15:53:27.545666-05	3379b202-11a5-4d0e-ab99-e44fad78302d	hector	2	127.0.0.1	7	1
181	2020-12-04 15:55:49.472936-05	eb08bdb3-24d9-4f13-ada2-8e73d3c0ed48	cepero	2	127.0.0.1	7	1
182	2020-12-04 15:58:11.574289-05	d594882f-55e4-4b54-91ad-5f8181e2486f	yoni	2	127.0.0.1	7	1
183	2020-12-04 15:59:56.662526-05	eb08bdb3-24d9-4f13-ada2-8e73d3c0ed48	anays	2	127.0.0.1	7	1
184	2020-12-04 16:00:21.451941-05			5	127.0.0.1	4	1
185	2020-12-04 16:00:38.619788-05			4	127.0.0.1	4	2
186	2020-12-04 16:00:49.65192-05			5	127.0.0.1	4	2
187	2020-12-04 16:01:02.275486-05			4	127.0.0.1	4	3
188	2020-12-04 16:01:10.269254-05			5	127.0.0.1	4	3
189	2020-12-04 16:01:22.224947-05			4	127.0.0.1	4	3
190	2020-12-04 16:01:29.737564-05			5	127.0.0.1	4	3
191	2020-12-04 16:01:48.701934-05			4	127.0.0.1	4	4
192	2020-12-04 16:03:21.759853-05	2	julietta	2	[{"changed": {"fields": ["is_staff", "is_superuser", "groups", "user_permissions"]}}]	4	1
193	2020-12-04 16:03:41.734566-05			5	127.0.0.1	4	1
194	2020-12-04 16:04:02.106748-05			4	127.0.0.1	4	4
195	2020-12-04 16:04:07.556163-05			5	127.0.0.1	4	4
196	2020-12-04 16:04:19.931928-05			4	127.0.0.1	4	2
197	2020-12-04 16:05:23.954379-05	4	mechuco	2	[{"changed": {"fields": ["is_staff", "groups"]}}]	4	2
198	2020-12-04 16:05:30.186906-05			5	127.0.0.1	4	2
199	2020-12-04 16:05:42.899186-05			4	127.0.0.1	4	4
200	2020-12-04 16:05:56.533691-05			5	127.0.0.1	4	4
201	2020-12-04 16:06:47.274931-05	3	anays	2	[{"changed": {"fields": ["is_staff", "groups"]}}]	4	1
202	2020-12-04 16:08:39.36088-05			4	127.0.0.1	4	1
203	2020-12-04 16:27:17.647687-05	3	P01 Gestión de Innovación	1	127.0.0.1	16	1
204	2020-12-04 16:28:03.067242-05	4	P03 Gestión de Desarrollo	1	127.0.0.1	16	1
205	2020-12-04 16:28:33.144192-05	5	P04 Registro de Dominio	1	127.0.0.1	16	1
206	2020-12-04 16:29:22.617488-05	6	P06 Sistemas Gerenciales	1	127.0.0.1	16	1
207	2020-12-04 16:31:47.290618-05	7	P05 Servicio Mantenimiento y Reparación de PC	1	127.0.0.1	16	1
208	2020-12-04 16:32:24.945253-05	8	P07 Conectividad	1	127.0.0.1	16	1
209	2020-12-04 16:32:55.722066-05	9	P08 Instalación de Redes	1	127.0.0.1	16	1
210	2020-12-04 16:33:30.745964-05	10	P09 Cursos en Línea	1	127.0.0.1	16	1
211	2020-12-04 16:33:59.948645-05	11	P10 Comercio Electrónico	1	127.0.0.1	16	1
212	2020-12-04 16:34:26.004499-05	12	P11 Recursos Humanos	1	127.0.0.1	16	1
213	2020-12-04 16:34:49.998129-05	13	P12 Servicios Generales	1	127.0.0.1	16	1
214	2020-12-04 16:35:23.868465-05	14	P13 Dirección Contable Financiera	1	127.0.0.1	16	1
215	2020-12-04 16:35:51.910753-05	15	P15 Servicio de Reproducción	1	127.0.0.1	16	1
216	2020-12-04 16:36:03.305764-05	16	P14 Gestión de la Información	1	127.0.0.1	16	1
217	2020-12-10 11:04:23.246487-05			4	127.0.0.1	4	1
218	2020-12-10 11:04:48.364755-05	1	UEB Desarrollo	2	127.0.0.1	46	1
219	2020-12-10 11:08:47.376948-05	1	UEB Desarrollo de Softwar	2	127.0.0.1	46	1
220	2020-12-10 11:09:15.573637-05	1	UEB Desarrollo de Softwar	2	127.0.0.1	46	1
221	2020-12-10 11:09:36.776563-05	2	UEB Multimedias	2	127.0.0.1	46	1
222	2020-12-10 11:10:20.41934-05	3	UDI	1	127.0.0.1	46	1
223	2020-12-10 11:10:37.107676-05	4	UEB Servicios Web	1	127.0.0.1	46	1
224	2020-12-10 11:12:46.799326-05	5	UEB Proyectos e Instalaciones de Redes y Sistemas de Cómputo	1	127.0.0.1	46	1
225	2020-12-10 11:13:10.188001-05	6	UEB Operaciones de Internet	1	127.0.0.1	46	1
226	2020-12-10 11:13:33.635473-05	7	UEB Servicios Territoriales	1	127.0.0.1	46	1
227	2020-12-10 11:13:52.619481-05	8	UEB Sistemas Gerenciales	1	127.0.0.1	46	1
228	2020-12-10 11:14:27.809362-05	9	Dpto Contabilidad y Control	1	127.0.0.1	46	1
229	2020-12-10 11:14:48.50889-05	10	Dpto Cobros y Pagos	1	127.0.0.1	46	1
230	2020-12-10 11:15:08.492497-05	11	Dpto Recursos Humanos	1	127.0.0.1	46	1
231	2020-12-10 11:15:36.309998-05	12	Dpto Gestión de la Calidad y Auditoría	1	127.0.0.1	46	1
232	2020-12-10 11:16:08.280507-05	13	Dpto Nacional Ventas y Exportaciones	1	127.0.0.1	46	1
233	2020-12-10 11:16:29.390347-05	14	Dpto Marketing y Publicidad	1	127.0.0.1	46	1
234	2020-12-10 11:16:48.971545-05	15	Dirección Contable Financiera	1	127.0.0.1	46	1
235	2020-12-10 11:17:06.749429-05	16	Dirección Administrativa	1	127.0.0.1	46	1
236	2020-12-10 11:17:30.80417-05	17	Dirección Desarrollo Organizacional	1	127.0.0.1	46	1
237	2020-12-10 11:18:09.183242-05	18	Dirección Des. e Innovación Tecnológica	1	127.0.0.1	46	1
238	2020-12-10 11:19:21.803275-05	19	Dirección Comercial	1	127.0.0.1	46	1
239	2020-12-10 11:19:38.263726-05	20	Dirección General	1	127.0.0.1	46	1
240	2020-12-10 11:20:15.128233-05	1	español	2	127.0.0.1	41	1
241	2020-12-10 11:20:27.656694-05	2	Ingles	1	127.0.0.1	41	1
242	2020-12-10 11:20:49.288234-05	3	Frances	1	127.0.0.1	41	1
243	2020-12-10 11:20:58.643078-05	4	Italiano	1	127.0.0.1	41	1
244	2020-12-10 11:21:14.924632-05	2	Ingles	2	127.0.0.1	41	1
245	2020-12-10 11:21:24.875403-05	3	Frances	2	127.0.0.1	41	1
246	2020-12-10 11:23:07.279492-05	2	Cumplido	1	127.0.0.1	28	1
247	2020-12-10 11:23:15.227972-05	1	pendiente	2	127.0.0.1	28	1
248	2020-12-10 11:23:28.543345-05	3	Permanente	1	127.0.0.1	28	1
249	2020-12-10 11:23:46.665597-05	4	Incumplido	1	127.0.0.1	28	1
250	2020-12-10 11:24:11.061003-05	5	cerrada	1	127.0.0.1	27	1
251	2020-12-10 11:24:46.579378-05	3	solicitado	1	127.0.0.1	24	1
252	2020-12-10 11:25:10.869017-05	4	en fecha	1	127.0.0.1	24	1
253	2020-12-10 11:27:45.849981-05	5	reiniciado	1	127.0.0.1	24	1
254	2020-12-10 11:28:00.890206-05	6	interrumpido	1	127.0.0.1	24	1
255	2020-12-10 11:28:15.303879-05	7	terminado	1	127.0.0.1	24	1
256	2020-12-10 11:28:29.55032-05	8	cancelado	1	127.0.0.1	24	1
257	2020-12-10 11:28:47.50554-05	9	adelantado	1	127.0.0.1	24	1
258	2020-12-10 11:29:55.016834-05	5	Portugues	1	127.0.0.1	41	1
259	2020-12-10 11:30:23.743546-05	1	conforme	1	127.0.0.1	34	1
260	2020-12-10 11:31:08.267861-05	1	conforme	1	127.0.0.1	23	1
261	2020-12-10 11:31:18.943633-05	2	no conforme	1	127.0.0.1	23	1
262	2020-12-10 11:31:35.557862-05	2	no conforme	1	127.0.0.1	34	1
263	2020-12-10 11:34:51.136532-05	1	Inspección	1	127.0.0.1	42	1
264	2020-12-10 11:35:04.162418-05	2	Observación	1	127.0.0.1	42	1
265	2020-12-10 11:35:14.016075-05	3	Entrevista	1	127.0.0.1	42	1
266	2020-12-10 13:26:30.637719-05			4	127.0.0.1	4	1
267	2020-12-10 14:06:02.298487-05			4	127.0.0.1	4	1
268	2020-12-16 11:38:17.378086-05			4	127.0.0.1	4	1
269	2020-12-16 11:39:27.246934-05			4	127.0.0.1	4	1
270	2020-12-16 11:42:19.140402-05			4	127.0.0.1	4	1
271	2020-12-16 11:44:05.006597-05			4	127.0.0.1	4	1
272	2020-12-16 11:44:46.918768-05			4	127.0.0.1	4	1
273	2020-12-16 11:49:40.23507-05			5	127.0.0.1	4	1
274	2020-12-16 11:50:06.304841-05			4	127.0.0.1	4	1
275	2020-12-16 11:52:30.496769-05			5	127.0.0.1	4	1
276	2020-12-16 11:59:38.077887-05			4	127.0.0.1	4	1
277	2020-12-16 12:00:16.44776-05			4	127.0.0.1	4	1
278	2020-12-16 12:00:34.96067-05			4	127.0.0.1	4	1
279	2020-12-16 12:01:39.025413-05			4	127.0.0.1	4	1
280	2020-12-16 12:01:53.139072-05			4	127.0.0.1	4	1
281	2020-12-16 12:03:48.318027-05			4	127.0.0.1	4	1
282	2020-12-16 12:33:38.970723-05			4	127.0.0.1	4	1
283	2020-12-16 13:41:05.17799-05			4	127.0.0.1	4	1
284	2020-12-16 14:25:28.975422-05			4	127.0.0.1	4	1
285	2020-12-16 17:33:12.110567-05			4	::1	4	1
286	2020-12-16 18:25:08.278294-05			4	127.0.0.1	4	1
287	2020-12-19 16:13:36.505366-05			4	127.0.0.1	4	1
288	2020-12-19 16:52:48.083327-05			4	127.0.0.1	4	1
289	2020-12-19 17:18:49.050947-05			4	127.0.0.1	4	1
290	2020-12-19 17:25:55.965954-05			4	127.0.0.1	4	1
291	2020-12-19 17:37:47.042736-05	1	Cumplimiento del plan de auditorías y controles internos al 95%	1	127.0.0.1	40	1
292	2020-12-19 17:38:35.310594-05	2	Gestión del 100% de  las no conformidades detectadas  en el periodo analizado	1	127.0.0.1	40	1
293	2020-12-19 17:38:58.574866-05	3	Gestión  y  respuesta al 100 % a las quejas y reclamaciones de los clientes	1	127.0.0.1	40	1
294	2020-12-19 17:39:23.080023-05	4	Eficacia promedio del 95  de los procesos declarados en el Sistema de Gestión	1	127.0.0.1	40	1
295	2020-12-19 17:39:43.383229-05	5	Índice global de satisfacción del cliente por encima del 90 %	1	127.0.0.1	40	1
296	2020-12-19 17:44:37.479472-05	1	No cumple con los objetivos	1	127.0.0.1	36	1
297	2020-12-19 17:48:47.731322-05	2	No cumple con el alcance	1	127.0.0.1	36	1
298	2020-12-19 17:54:27.333113-05	3	Deficiencias  con el cumplimiento en tiempo del programa y cumple con el  los ob	1	127.0.0.1	36	1
299	2020-12-19 18:01:13.038971-05	4	Cumple con el programa,  los objetivos, el alcance y documentación y fallas menores en la documentación.	1	127.0.0.1	36	1
300	2020-12-19 18:01:59.246583-05	5	Cumple con el programa, los objetivos , el alcance y documentación	1	127.0.0.1	36	1
301	2020-12-19 20:01:27.055251-05			4	127.0.0.1	4	1
302	2020-12-23 10:19:18.70709-05			4	127.0.0.1	4	1
303	2020-12-23 11:41:25.142332-05			4	127.0.0.1	4	1
304	2020-12-23 11:45:38.405251-05	3	administracion	1	127.0.0.1	35	1
305	2020-12-23 12:39:38.567454-05			4	127.0.0.1	4	1
306	2020-12-23 13:02:07.024609-05	1	conforme	2	127.0.0.1	33	1
307	2020-12-23 13:02:14.655947-05	2	no conforme	2	127.0.0.1	33	1
308	2020-12-23 13:02:32.438434-05	1	conforme	2	127.0.0.1	23	1
309	2020-12-23 13:02:39.182418-05	2	no conforme	2	127.0.0.1	23	1
310	2020-12-23 13:03:00.470525-05	1	pendiente	2	127.0.0.1	27	1
311	2020-12-23 13:03:12.522821-05	5	cerrada	2	127.0.0.1	27	1
312	2020-12-23 13:03:24.071255-05	3	en proceso	2	127.0.0.1	27	1
313	2020-12-28 16:12:32.28948-05			4	127.0.0.1	4	1
314	2020-12-28 17:15:17.668834-05			4	127.0.0.1	4	1
315	2020-12-28 17:21:10.837858-05			4	127.0.0.1	4	1
316	2020-12-28 18:04:25.300384-05			4	127.0.0.1	4	1
317	2020-12-28 19:07:28.507859-05			4	127.0.0.1	4	1
318	2021-01-03 11:12:28.453514-05			4	127.0.0.1	4	1
319	2021-01-03 11:55:35.591743-05			4	127.0.0.1	4	1
320	2021-01-03 12:01:53.087006-05	1	Cumplimiento del plan de auditorías y controles internos al 95%	2	127.0.0.1	40	1
321	2021-01-03 12:02:14.470869-05	2	Gestión del 100% de  las no conformidades detectadas  en el periodo analizado	2	127.0.0.1	40	1
322	2021-01-03 12:02:26.869668-05	3	Gestión  y  respuesta al 100 % a las quejas y reclamaciones de los clientes	2	127.0.0.1	40	1
323	2021-01-03 12:02:39.853941-05	4	Eficacia promedio del 95  de los procesos declarados en el Sistema de Gestión	2	127.0.0.1	40	1
324	2021-01-03 12:02:48.889688-05	5	Índice global de satisfacción del cliente por encima del 90 %	2	127.0.0.1	40	1
325	2021-01-03 12:09:32.658585-05	3	Deficiencias  con el cumplimiento en tiempo del programa y cumple con el  los ob	2	127.0.0.1	36	1
326	2021-01-03 12:10:19.641596-05	5	Cumple con el programa, los objetivos , el alcance y documentación	2	127.0.0.1	36	1
327	2021-01-03 12:10:53.532913-05	2	No cumple con el alcance	2	127.0.0.1	36	1
328	2021-01-03 12:11:00.070828-05	1	No cumple con los objetivos	2	127.0.0.1	36	1
329	2021-01-03 13:05:55.67751-05	2	ASD ASD	1	127.0.0.1	10	1
330	2021-01-04 11:01:31.507125-05			4	127.0.0.1	4	1
331	2021-01-04 11:09:05.442526-05	4	NP	1	127.0.0.1	34	1
332	2021-01-04 11:57:20.56943-05			4	127.0.0.1	4	1
333	2021-01-04 13:47:57.232915-05			4	127.0.0.1	4	1
334	2021-01-04 13:54:01.344926-05			4	127.0.0.1	4	1
335	2021-01-04 15:31:22.395685-05			4	127.0.0.1	4	1
336	2021-01-04 16:07:24.504004-05			4	127.0.0.1	4	1
337	2021-01-06 13:46:31.252329-05			4	127.0.0.1	4	1
338	2021-01-06 14:24:40.964603-05	6	Algún Incumplimiento mayor. (Se clasifica la No conformidad como mayor  si existe algún incumplimiento	1	127.0.0.1	36	1
339	2021-01-06 14:25:01.476448-05	7	Mas de 2  incumplimientos menores	1	127.0.0.1	36	1
340	2021-01-06 15:25:52.136581-05			4	127.0.0.1	4	1
341	2021-01-06 15:34:41.020288-05	2	P00 Gestión Integrada	1	127.0.0.1	21	1
342	2021-01-06 15:39:45.407881-05	3	P00 Gestión Integrada	1	127.0.0.1	21	1
343	2021-01-06 16:08:20.104006-05			4	127.0.0.1	4	1
344	2021-01-06 16:09:07.674319-05			4	127.0.0.1	4	1
345	2021-01-06 16:10:02.228236-05			4	127.0.0.1	4	1
346	2021-01-11 18:30:37.455217-05			4	127.0.0.1	4	1
347	2021-01-11 19:03:16.833672-05			4	127.0.0.1	4	1
348	2021-01-11 21:07:22.987049-05			4	127.0.0.1	4	1
349	2021-01-11 21:09:45.291951-05	1	clasificacionincidencias object (1)	1	127.0.0.1	54	1
350	2021-01-11 21:17:55.151799-05	2	norma aeew arfa	2	127.0.0.1	18	1
351	2021-01-11 21:23:39.524295-05	2	norma aeew arfa	2	127.0.0.1	18	1
352	2021-01-11 21:40:21.367391-05	2	Norma Serrano Capote	2	127.0.0.1	18	1
353	2021-01-12 19:17:54.92091-05			4	127.0.0.1	4	1
354	2021-01-12 19:41:00.230234-05			4	127.0.0.1	4	1
355	2021-01-12 20:17:18.468639-05			4	127.0.0.1	4	1
356	2021-01-16 12:35:40.827089-05			4	127.0.0.1	4	1
357	2021-01-16 12:35:52.696947-05			5	127.0.0.1	4	1
358	2021-01-16 12:36:49.212729-05			4	127.0.0.1	4	1
359	2021-01-16 12:38:54.162856-05	4	mechuco	3	127.0.0.1	7	1
360	2021-01-16 12:42:38.870657-05	5	Yoyi	1	127.0.0.1	4	1
361	2021-01-16 12:49:05.061994-05	3b7f589e-9624-48ea-99fa-2a1febfba8e3	Yoyi	2	127.0.0.1	7	1
362	2021-01-16 12:49:43.881067-05	d594882f-55e4-4b54-91ad-5f8181e2486f	mechuco	2	127.0.0.1	7	1
363	2021-01-16 13:10:41.365815-05	3	Descubridor de Citmatel	1	127.0.0.1	48	1
364	2021-01-16 13:12:32.83867-05	10	Cristobal Colón Genoves	1	127.0.0.1	18	1
365	2021-01-16 13:33:38.655196-05			4	127.0.0.1	4	1
366	2021-01-17 14:02:48.579484-05			4	127.0.0.1	4	1
367	2021-01-17 15:25:46.545549-05			4	127.0.0.1	4	1
368	2021-01-17 15:45:10.117652-05			4	127.0.0.1	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	ProyectoBaseApp	userapp
8	notifications	notification
9	captcha	captchastore
10	SISGDDO	cliente_externo
11	SISGDDO	provincia
12	SISGDDO	entradas_proyecto
13	SISGDDO	valoracion_encuesta
14	SISGDDO	coleccion
15	SISGDDO	acciones
16	SISGDDO	proceso
17	SISGDDO	historico_dictamen_tecnico
18	SISGDDO	trabajador
19	SISGDDO	entidad
20	SISGDDO	dictamen_tecnico
21	SISGDDO	eficacia
22	SISGDDO	lenguaje_prog
23	SISGDDO	estado_dictamen
24	SISGDDO	estado_proyecto
25	SISGDDO	cenda
26	SISGDDO	tipo_de_licencias
27	SISGDDO	estado_no_conformidad
28	SISGDDO	estado_acuerdo
29	SISGDDO	tratamiento
30	SISGDDO	no_conformidad
31	SISGDDO	auditoria_interna
32	SISGDDO	organismo
33	SISGDDO	estado_entradas_proyecto
34	SISGDDO	formatos
35	SISGDDO	curso
36	SISGDDO	aspecto_medir_indicadoreficacia
37	SISGDDO	proyecto
38	SISGDDO	sistema_operativo
39	SISGDDO	acuerdos_consejillo
40	SISGDDO	indicador_eficacia
41	SISGDDO	idioma
42	SISGDDO	metodosprueba
43	SISGDDO	plan_medidas
44	SISGDDO	sosi
45	SISGDDO	historico_entradas_proyectos
46	SISGDDO	area
47	SISGDDO	acciones_prevenntivas
48	SISGDDO	formacion_personal
49	SISGDDO	auditoria_externa
50	SISGDDO	acciones_correptivas
51	SISGDDO	reserva_cuadro
52	SISGDDO	atencion_cliente_externo
53	SISGDDO	incidencias
54	SISGDDO	clasificacionincidencias
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-03-09 21:40:37.225696-04
2	contenttypes	0002_remove_content_type_name	2020-03-09 21:40:37.294586-04
3	auth	0001_initial	2020-03-09 21:40:37.692418-04
4	auth	0002_alter_permission_name_max_length	2020-03-09 21:40:38.303963-04
5	auth	0003_alter_user_email_max_length	2020-03-09 21:40:38.314968-04
6	auth	0004_alter_user_username_opts	2020-03-09 21:40:38.324976-04
7	auth	0005_alter_user_last_login_null	2020-03-09 21:40:38.338988-04
8	auth	0006_require_contenttypes_0002	2020-03-09 21:40:38.341492-04
9	auth	0007_alter_validators_add_error_messages	2020-03-09 21:40:38.353004-04
10	auth	0008_alter_user_username_max_length	2020-03-09 21:40:38.433032-04
11	auth	0009_alter_user_last_name_max_length	2020-03-09 21:40:38.443037-04
12	auth	0010_alter_group_name_max_length	2020-03-09 21:40:38.455049-04
13	auth	0011_update_proxy_permissions	2020-03-09 21:40:38.466056-04
14	ProyectoBaseApp	0001_initial	2020-03-09 21:40:38.543894-04
15	admin	0001_initial	2020-03-09 21:40:38.637418-04
16	admin	0002_logentry_remove_auto_add	2020-03-09 21:40:38.727103-04
17	admin	0003_logentry_add_action_flag_choices	2020-03-09 21:40:38.740116-04
18	captcha	0001_initial	2020-03-09 21:40:38.815137-04
19	notifications	0001_initial	2020-03-09 21:40:38.937869-04
20	notifications	0002_auto_20150224_1134	2020-03-09 21:40:39.688992-04
21	notifications	0003_notification_data	2020-03-09 21:40:39.738544-04
22	notifications	0004_auto_20150826_1508	2020-03-09 21:40:39.759564-04
23	notifications	0005_auto_20160504_1520	2020-03-09 21:40:39.775576-04
24	notifications	0006_indexes	2020-03-09 21:40:40.099138-04
25	sessions	0001_initial	2020-03-09 21:40:40.186009-04
26	SISGDDO	0001_initial	2020-11-23 15:49:21.834399-05
27	SISGDDO	0002_atencion_cliente_externo_incidencias_reserva_cuadro	2020-11-23 15:50:09.568138-05
28	ProyectoBaseApp	0002_auto_20201124_1610	2020-11-24 16:10:29.248305-05
29	ProyectoBaseApp	0003_auto_20201124_1612	2020-11-24 16:12:54.755766-05
30	ProyectoBaseApp	0004_auto_20201124_1616	2020-11-24 16:17:03.766209-05
31	ProyectoBaseApp	0005_auto_20201124_1622	2020-11-24 16:23:01.21739-05
32	ProyectoBaseApp	0006_auto_20201124_1659	2020-11-24 16:59:35.540192-05
33	ProyectoBaseApp	0007_auto_20201124_1701	2020-11-24 17:01:06.631866-05
34	SISGDDO	0003_auto_20201126_2343	2020-11-26 23:44:27.474963-05
35	SISGDDO	0004_auto_20201127_1027	2020-11-27 10:28:07.390783-05
36	SISGDDO	0005_auto_20201127_1217	2020-11-27 12:17:39.641013-05
37	SISGDDO	0006_auto_20201127_1226	2020-11-27 12:31:01.252098-05
38	SISGDDO	0007_delete_reserva_cuadro	2020-12-02 09:54:17.683073-05
39	SISGDDO	0008_auto_20201202_1003	2020-12-02 10:03:18.950271-05
40	SISGDDO	0009_auto_20201202_1009	2020-12-02 10:09:06.246393-05
41	SISGDDO	0010_auto_20201202_1751	2020-12-02 17:51:07.288889-05
42	SISGDDO	0011_auto_20201202_1805	2020-12-02 18:07:37.702067-05
43	SISGDDO	0012_auto_20201202_1807	2020-12-02 18:07:37.986891-05
44	SISGDDO	0013_auto_20201204_1630	2020-12-04 16:31:02.830297-05
45	SISGDDO	0014_auto_20201210_1105	2020-12-10 11:09:08.478779-05
46	SISGDDO	0015_auto_20201210_1111	2020-12-10 11:11:48.250201-05
47	SISGDDO	0016_auto_20201210_1127	2020-12-10 11:27:25.900498-05
48	SISGDDO	0017_auto_20201216_1227	2020-12-16 12:27:53.82107-05
49	SISGDDO	0018_auto_20201219_1701	2020-12-19 17:02:15.640215-05
50	SISGDDO	0019_auto_20201219_1703	2020-12-19 17:03:22.335762-05
51	SISGDDO	0020_auto_20201219_1710	2020-12-19 17:10:36.38728-05
52	SISGDDO	0021_remove_indicador_eficacia_calif_ind	2020-12-19 17:35:00.415184-05
53	SISGDDO	0022_remove_aspecto_medir_indicadoreficacia_calificacion_asp	2020-12-19 17:43:43.177113-05
54	SISGDDO	0023_auto_20201219_1800	2020-12-19 18:00:14.013138-05
55	SISGDDO	0024_auto_20201219_1823	2020-12-19 18:23:12.810534-05
56	SISGDDO	0025_auto_20201219_1828	2020-12-19 18:28:27.974646-05
57	SISGDDO	0026_indicador_eficacia_proceso	2021-01-03 11:38:55.724936-05
58	SISGDDO	0027_auto_20210103_1139	2021-01-03 11:39:41.069619-05
59	auth	0012_group_activo	2021-01-03 11:49:34.308336-05
60	auth	0013_remove_group_activo	2021-01-03 11:49:34.322326-05
61	auth	0014_group_activo	2021-01-03 11:52:32.490818-05
62	SISGDDO	0028_auto_20210103_1205	2021-01-03 12:05:18.590905-05
63	SISGDDO	0029_auto_20210104_1126	2021-01-04 11:27:14.182559-05
64	SISGDDO	0030_auto_20210104_1159	2021-01-04 12:00:13.522271-05
65	SISGDDO	0031_auto_20210106_1428	2021-01-06 14:28:37.925706-05
66	SISGDDO	0032_auto_20210106_1503	2021-01-06 15:04:03.765898-05
67	SISGDDO	0033_indicador_eficacia_calif_ind	2021-01-06 15:04:03.78389-05
68	SISGDDO	0034_auto_20210111_1914	2021-01-11 19:14:29.860152-05
69	SISGDDO	0035_auto_20210111_1917	2021-01-11 19:17:19.11432-05
70	SISGDDO	0036_auto_20210111_2114	2021-01-11 21:14:12.341297-05
71	SISGDDO	0037_auto_20210111_2150	2021-01-11 21:50:25.321559-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
4rq9zl7bur87e2j6up3je2ufdlwbg4qw	ZTIzMzQxMjUzMGMxN2E4Mzk1M2Y2NjBhYTk1ODQ1MDI5Mzc2YTRmNzp7fQ==	2020-03-09 22:34:31.714809-04
3vcrwzw741mu2bpsewjodtat89kujoz1	Mzg4NTM4YTU4MGU4MzdkM2NmMGU2ZDJiODM4YjE3MThiZTU1N2IyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNDZmMWY3NTRjYjdhOTBkZjliMjljMmY3YTM2NGUxOWRjOTY2ZTFmIn0=	2020-03-09 23:02:35.269257-04
i5vah1x4yglhkabsaks1y586qxwbbuti	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 23:14:56.034469-05
z5x2ur14ypxbloqg6a8dj0a2eubviu4y	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-23 19:12:10.108443-05
atif49voe2y6lvwc7qagaqw77qh1varn	NjM1MGY2MTNmZDAxZjNlMmNmY2YxZWVjNWFkYWFiOWEzMzE4ZDYyMTp7fQ==	2020-12-16 11:41:41.869321-05
kicrri5uk7e2yl0it0kmt14bc6uvpt1q	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 00:46:49.003848-05
6p8sytbn4ir80fipozwmyf3zblbtd5q4	NjM1MGY2MTNmZDAxZjNlMmNmY2YxZWVjNWFkYWFiOWEzMzE4ZDYyMTp7fQ==	2020-12-16 11:38:34.528344-05
zc4s8uj4f9866ty4r4nu2u6tzx7lj3zb	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 17:37:01.529382-05
zmrnlncm8477pgnll2qqjsa3abj6w5o4	NjM1MGY2MTNmZDAxZjNlMmNmY2YxZWVjNWFkYWFiOWEzMzE4ZDYyMTp7fQ==	2020-12-16 11:39:17.605282-05
8u4dhdmoocxpvqnz87p0dlgz21bxj2uz	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 10:58:41.892252-05
m7r45kranjjcsuxquibqb2r82hpvrnbw	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-23 21:24:39.521787-05
6tk8uff8aaapvfsjkp73gmfyhjiv5ohi	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 21:05:39.698074-05
9iq67tnpgo8hkhsscfynrhps8wtl24q2	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 22:39:15.138452-05
wpba0mevuzmh0cp0w5aapfttinwux5ez	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 18:22:42.627368-05
so3zrs6psn8kwsfzgkmj1eh8bnvi2n28	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 16:51:24.629622-05
hv0g301cvw5887463uyjc6n6ekozp78d	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 18:24:07.960536-05
n59u46nabvm7yjnwed8edetvea2jlkts	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 14:46:55.444885-05
47e68sqjdf2o3tg6rpnr6un3vcn2werp	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 23:50:09.158326-05
rh7edvj73bbwr5z4ozdjlxpm7nc82x5t	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 18:45:33.040528-05
s72y9e194iqlm5x8pplhxec0bvr7m5t1	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 19:05:48.541778-05
2mwo0m1lbrgxqw3wzlu5ydnq7ms2nuns	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 18:50:54.350282-05
8277g8nn83hbw5ryal96rs3qaf1jlecn	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 21:47:07.168652-05
mc2frt8gzsed8jbwwqtqsduio7alxqxn	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-24 20:02:39.326739-05
1lkks7ypkzic7z61bw5dzx56nxu5wwl1	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 22:06:12.082256-05
c6djh25sjk7xapk2vn3awvnwn4q0313x	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 16:33:06.903945-05
s8v18wn1bgu8scxswbjn7dkb5wfrveka	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 12:53:09.90381-05
ic1iqyewjpp95iyuamvoefhw8nsn8nax	NjM1MGY2MTNmZDAxZjNlMmNmY2YxZWVjNWFkYWFiOWEzMzE4ZDYyMTp7fQ==	2020-12-16 11:38:59.770981-05
mm96q7ahaqolybcullqr6e6uc0jxwg44	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-02 11:30:21.129512-05
asw03hbr65ac9mzfnouhednc921a7dsz	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-25 23:39:28.498963-05
red0ntlh9ygwlo86uweb4mlwemcjzz8o	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-27 13:02:20.814863-05
dxqitbgxf1wtdb14xc9ryyn2aez0hxr2	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 00:48:05.917571-05
c6wg0b43urd5oofn4zmqvmdzilis5lg8	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 12:15:49.161546-05
7ejejd5h937u67xlpyq1onweojfvrur7	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 11:05:11.440983-05
20v0y0g8rq19blci3xtvg3rgbvnabu26	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-27 13:03:05.345114-05
b5nlvg803vj189nlzga6f5hzw9d9ekr8	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-02 12:03:43.019362-05
77lopj6zqsaignrg2ypp6dlg1glkm9pp	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 13:14:02.589552-05
4cb8kqg3cl7hjfoswe9rdg1yhhx1gq8d	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-27 14:16:13.240238-05
jf3sq274nxoiojlbt1fm379hpcpp92zf	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 11:24:18.248372-05
sdp4k3rxlg5al1yxb76jij5tcgwvnv7y	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 14:08:41.384323-05
npx9728sthq5qvz9clui99k8p52ij9tm	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-27 00:32:38.013807-05
mrm18y2pw0mti28h8j674lzvfvy1d0k4	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 15:02:03.574569-05
ro0c7p59z1voqmcm47fwswex4a1nmrrs	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-02 18:54:42.217027-05
7hbi87pu8j1km9y1okn3o1rw7i5alrv2	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 22:33:48.885229-05
2lg9g7jtln5phxwr876lew39kkurjtxr	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-27 17:11:51.259563-05
xee09qlior2a4ux80tmukocompf7zvkr	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-02 13:27:30.4523-05
qvmwbjqsrb8k4r4abugpwbqkqib2og21	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-11-26 23:32:48.225464-05
4u6qtn1wvfcz5srn92z6xn66tjrf54c8	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-04 15:10:26.68755-05
jd4aht4n2frq1k827ky1o9ay9felbd1a	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-02 16:22:37.413209-05
kf15smbininaaaczg51xe1mt2p1lc534	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-02 14:27:49.279286-05
ua7wi74fbpxt22i5jsredyv3ku3lnan8	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-02 15:06:58.11048-05
e5v144a440gedeykd670imkjtnvbrtn9	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 11:42:20.145397-05
6midjnqemjcrcwu6zvqzlu0l0p3j1t4f	NjM1MGY2MTNmZDAxZjNlMmNmY2YxZWVjNWFkYWFiOWEzMzE4ZDYyMTp7fQ==	2020-12-16 11:43:23.833634-05
fnkwn7gi8sn0jof38atfbdsm5kw71rwv	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 18:14:08.767549-05
nbv5tnau6gz3vjrwpt1r03igjdl8oxd0	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 11:44:20.011593-05
noz8xfgimzym3qtm11rkazogf8670xd5	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-06 16:29:16.875947-05
8nykkl61e406osuakamaazlpusz0xk1n	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 14:08:33.865155-05
si0jisumqyws64x6dxzrxqnzjjitckq9	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-19 16:36:20.666744-05
q80g4nxujgz2radxv7tdnaz7nkwi3shl	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 12:00:03.703366-05
zqiqzuqjwkeeg6m1mqr5n165uqaljm6i	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 12:00:17.722456-05
ae5hfm3b7r6tb5t89yfhwse5a166ws34	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 12:00:36.090589-05
940z3p7pr1szxvbbdohcifciwthaokob	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 12:01:40.161328-05
30q0mvhicinq108ppy8mq7c45m8awtdu	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 12:01:54.544176-05
ua9seon9t96tc5pg0tbt4035s86jc5q4	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-19 17:41:55.69781-05
zn37hw1le10lgzkhzfrcyo9r0o8mop95	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 15:18:48.024053-05
72mjo7luwvich1lb6x08hnlhq1u9bhhm	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-10 12:13:54.131299-05
3e26eaa9a7kkoup7081fv2l7prjxkitt	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-10 13:55:23.376223-05
k9ktpcgluzp4k7pdzil85o5q0pggznc3	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-04 16:56:48.735266-05
g63i00qn9quh894vc8t7kfxbbz84nh7q	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-10 15:11:06.49451-05
8ksljz43meb5xo9off6fqjpmnntfmqtm	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 11:38:18.706077-05
d0ux40vetictz75ljk99tcwbb0kem3ey	NjM1MGY2MTNmZDAxZjNlMmNmY2YxZWVjNWFkYWFiOWEzMzE4ZDYyMTp7fQ==	2020-12-16 11:39:04.954566-05
dc6hk7nkk3c8ithxo5oogqo533shjvdm	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 11:39:28.25293-05
w7o2n3tv58blhqxdff3c1mk6fjuo6eur	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 12:54:53.685932-05
uhn0bwyjtcxt38w8a87xjhq7g8r1tbe9	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 12:56:37.924651-05
6c13itusb3oc8asvva8o1bgyu91f9n46	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-16 18:45:53.642077-05
6h1iuqq1tnbm8k4mdx3p18i83886z4j9	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-06 15:14:03.037784-05
mym2nrbwooehe2xu7sv1na38vodt3l68	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-23 13:23:34.139726-05
suocqnkd741yevmqplwm9o6dw60sx625	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-03 11:54:35.533135-05
ifzluqvcafdfeekxakahep0thjo566h2	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-19 17:30:59.746591-05
fz77w88j0te2nee7jbhserlqyx3nog9j	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-06 16:12:17.684861-05
i0i5ftpp648f0bhr408ts4az4k600zkt	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-06 16:28:29.875526-05
rz5ciadm94zapw33z6p006xvt8a6sst0	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-28 17:06:33.901531-05
ifpsu2h090gajh026np39lwjx2hoak4i	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-28 18:27:06.200272-05
pk74lic38et3sdsq7sko8sd1km7u4nlo	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-19 18:56:42.484531-05
a3xt7si01leu9bqch7qnjjxb20mr7htn	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-04 14:42:02.86428-05
wlllkz76xs3xn4i0lsolgzicpk891zgb	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-23 12:38:43.511298-05
dzefz3i1nku5r12god8gkue27r4as3ek	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-04 16:23:05.626014-05
fo0invdncv6wtqt69yxjjd320grogkwr	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-19 20:22:00.984508-05
57lmx4l07hzndp8ixl88un4pdyzp496e	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-28 17:40:01.856235-05
ws2652dltsql83ppjgqggd1k51wm3nrj	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-04 16:27:33.396175-05
bhlgwt3qxgo6rfwd39x5ex72oq4oguv2	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-03 13:30:56.638507-05
vo3mqzzwgn19m4baq8layphs6eqa79xa	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-28 19:08:10.000351-05
ayu9ig3bkh0g4y4zfyr2qzyc03l9s64g	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-23 11:12:32.542523-05
iv7kh2jl359nwyu242jyx2jibe4e9avw	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-04 11:50:44.806419-05
mhn3vb5zccz0s74wwsjccw0ern0mulxl	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-04 12:17:20.834819-05
9fpwbafijvk3me0gwkr8l61jad41h20a	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2020-12-28 19:34:38.432578-05
zyg1o2accurp6394rnmlqk6hkux2f5ao	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-04 14:08:25.789369-05
ce4fblmyazwhegsoucyhua54tdf81xc0	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-06 16:30:10.894182-05
760l8pteknvjam66u910stl8sqskgn5y	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-12 20:03:37.639626-05
17fd75vjanmcgku6h5kmn9765pin21kx	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-12 20:39:53.057848-05
364x7cus1r3mbz6bjfb519m0uea8vqe9	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-16 13:32:33.109523-05
ar3kx0s3okh6jvdet9wdf99nqg71wzv0	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-16 14:17:34.084567-05
8kytod86fh3a762byz0lrex7abi3ythu	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-17 15:45:50.030803-05
m3sco3u0rgapb153cow3hlas4tnx7pce	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-11 18:50:49.54824-05
47wpf1q582ztbzq3mzqdrpf3fhvialnd	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-17 14:41:29.314164-05
glyq6nsfs89jx2t89df98mg0yqk4vx9v	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-17 16:05:18.090009-05
ize0df19271gv15z9ppwn5lyiqakpdd6	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-11 19:37:23.801816-05
lit3od465pqsecbsgmy0k46gpwqp2u2j	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-11 22:10:30.476829-05
5l1xdcio762e9ykearhiwyqwut4gmx57	YmE3OGFjZTc2MDVkODQyNzBkOTJiYjZhZGE4YzkwZDU0NDYxZDE0Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODFhY2Y2MzYwY2NkYTMyNjc3ZjRiYzc2NDBmYWMzYWM2NWUyNTU2In0=	2021-01-12 20:04:53.867227-05
\.


--
-- Data for Name: notifications_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_notification (id, level, unread, actor_object_id, verb, description, target_object_id, action_object_object_id, "timestamp", public, action_object_content_type_id, actor_content_type_id, recipient_id, target_content_type_id, deleted, emailed, data) FROM stdin;
6	success	f	1	Bienvenido a CubaExchange!!	\N	\N	\N	2020-03-09 22:48:30.466695-04	t	\N	4	2	\N	f	f	\N
7	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-03-09 22:51:53.430884-04	t	\N	4	2	\N	f	f	\N
8	success	t	3	Bienvenido a Proyecto!!	\N	\N	\N	2020-03-09 23:55:45.008304-04	t	\N	7	3	\N	f	f	\N
55	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-11-26 21:26:43.605415-05	t	\N	4	3	\N	f	f	\N
50	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 18:01:16.289114-05	t	\N	4	1	\N	f	f	\N
49	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 18:00:56.257422-05	t	\N	4	1	\N	f	f	\N
48	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 17:56:37.577733-05	t	\N	4	1	\N	f	f	\N
12	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-23 18:49:48.841293-05	t	\N	4	1	\N	f	f	\N
58	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-12-04 15:55:49.495921-05	t	\N	4	3	\N	f	f	\N
59	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-12-04 15:58:11.586282-05	t	\N	4	4	\N	f	f	\N
60	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-12-04 15:59:56.697583-05	t	\N	4	3	\N	f	f	\N
61	success	t	1	Bienvenido a SISGDDO!!	\N	\N	\N	2021-01-16 12:42:38.88372-05	t	\N	4	5	\N	f	f	\N
62	warning	t	1	Se han modificado sus datos	\N	\N	\N	2021-01-16 12:49:05.069785-05	t	\N	4	5	\N	f	f	\N
63	warning	t	1	Se han modificado sus datos	\N	\N	\N	2021-01-16 12:49:43.887063-05	t	\N	4	4	\N	f	f	\N
53	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-26 21:21:08.37891-05	t	\N	4	4	\N	f	f	\N
52	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-26 21:20:47.351942-05	t	\N	4	4	\N	f	f	\N
51	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-26 21:19:22.719392-05	t	\N	4	4	\N	f	f	\N
43	warning	f	4	Se han modificado sus datos	\N	\N	\N	2020-11-24 17:01:56.230399-05	t	\N	4	4	\N	f	f	\N
42	warning	f	4	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:58:17.267414-05	t	\N	4	4	\N	f	f	\N
41	warning	f	4	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:57:51.53479-05	t	\N	4	4	\N	f	f	\N
40	warning	f	4	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:56:32.997996-05	t	\N	4	4	\N	f	f	\N
39	success	f	1	Bienvenido a SISGDDO!!	\N	\N	\N	2020-11-24 16:55:43.574795-05	t	\N	4	4	\N	f	f	\N
54	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-11-26 21:26:24.365882-05	t	\N	4	3	\N	f	f	\N
47	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 17:43:02.01233-05	t	\N	4	1	\N	f	f	\N
46	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 17:36:38.603692-05	t	\N	4	1	\N	f	f	\N
45	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 17:35:20.846745-05	t	\N	4	1	\N	f	f	\N
44	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 17:16:47.375876-05	t	\N	4	1	\N	f	f	\N
38	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:46:59.658713-05	t	\N	4	1	\N	f	f	\N
37	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:46:43.294271-05	t	\N	4	1	\N	f	f	\N
36	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:45:47.179741-05	t	\N	4	1	\N	f	f	\N
35	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:45:12.527124-05	t	\N	4	1	\N	f	f	\N
34	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:43:40.378146-05	t	\N	4	1	\N	f	f	\N
33	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:43:04.545496-05	t	\N	4	1	\N	f	f	\N
32	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:42:10.731555-05	t	\N	4	1	\N	f	f	\N
31	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:41:52.552273-05	t	\N	4	1	\N	f	f	\N
30	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:35:26.143368-05	t	\N	4	1	\N	f	f	\N
29	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:31:18.20741-05	t	\N	4	1	\N	f	f	\N
28	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:29:13.479001-05	t	\N	4	1	\N	f	f	\N
27	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:28:50.068051-05	t	\N	4	1	\N	f	f	\N
26	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:28:23.694703-05	t	\N	4	1	\N	f	f	\N
25	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:20:59.305601-05	t	\N	4	1	\N	f	f	\N
24	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:20:24.984766-05	t	\N	4	1	\N	f	f	\N
23	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:20:00.230786-05	t	\N	4	1	\N	f	f	\N
22	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:17:39.261522-05	t	\N	4	1	\N	f	f	\N
21	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:15:46.732843-05	t	\N	4	1	\N	f	f	\N
20	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:15:07.256435-05	t	\N	4	1	\N	f	f	\N
19	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:13:28.117116-05	t	\N	4	1	\N	f	f	\N
18	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:10:57.402268-05	t	\N	4	1	\N	f	f	\N
17	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:03:46.687665-05	t	\N	4	1	\N	f	f	\N
16	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:03:29.280715-05	t	\N	4	1	\N	f	f	\N
15	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-24 16:02:19.525372-05	t	\N	4	1	\N	f	f	\N
14	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-23 18:51:13.602268-05	t	\N	4	1	\N	f	f	\N
13	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-23 18:50:20.473671-05	t	\N	4	1	\N	f	f	\N
11	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-23 18:48:55.782287-05	t	\N	4	1	\N	f	f	\N
10	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-23 18:48:26.682368-05	t	\N	4	1	\N	f	f	\N
9	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-11-23 18:46:02.262845-05	t	\N	4	1	\N	f	f	\N
5	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-03-09 22:46:06.173687-04	t	\N	4	1	\N	f	f	\N
4	warning	f	1	Se ha cambiado su contraseña	\N	\N	\N	2020-03-09 22:43:22.411058-04	t	\N	4	1	\N	f	f	\N
3	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-03-09 22:42:04.133824-04	t	\N	4	1	\N	f	f	\N
2	warning	f	1	Se han modificado sus datos	\N	\N	\N	2020-03-09 22:41:04.956875-04	t	\N	4	1	\N	f	f	\N
1	warning	f	1	Se ha cambiado su contraseña	\N	\N	\N	2020-03-09 22:40:26.226834-04	t	\N	4	1	\N	f	f	\N
56	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-12-04 15:53:05.791353-05	t	\N	4	2	\N	f	f	\N
57	warning	t	1	Se han modificado sus datos	\N	\N	\N	2020-12-04 15:53:27.553042-05	t	\N	4	2	\N	f	f	\N
\.


--
-- Name: SISGDDO_acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acciones_id_seq"', 1, false);


--
-- Name: SISGDDO_acciones_responsable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acciones_responsable_id_seq"', 1, false);


--
-- Name: SISGDDO_acuerdos_consejillo_responsable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acuerdos_consejillo_responsable_id_seq"', 1, true);


--
-- Name: SISGDDO_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_area_id_seq"', 20, true);


--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_aspecto_medir_indicadoreficacia_id_seq"', 7, true);


--
-- Name: SISGDDO_auditoria_externa_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_externa_area_id_seq"', 1, false);


--
-- Name: SISGDDO_auditoria_externa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_externa_id_seq"', 1, false);


--
-- Name: SISGDDO_auditoria_interna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_interna_id_seq"', 1, false);


--
-- Name: SISGDDO_auditoria_interna_trabajadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_interna_trabajadores_id_seq"', 1, false);


--
-- Name: SISGDDO_cenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_cenda_id_seq"', 1, true);


--
-- Name: SISGDDO_clasificacionincidencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_clasificacionincidencias_id_seq"', 1, true);


--
-- Name: SISGDDO_cliente_externo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_cliente_externo_id_seq"', 2, true);


--
-- Name: SISGDDO_coleccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_coleccion_id_seq"', 3, true);


--
-- Name: SISGDDO_curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_curso_id_seq"', 3, true);


--
-- Name: SISGDDO_dictamen_tecnico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_dictamen_tecnico_id_seq"', 1, false);


--
-- Name: SISGDDO_eficacia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_eficacia_id_seq"', 3, true);


--
-- Name: SISGDDO_entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_entidad_id_seq"', 1, false);


--
-- Name: SISGDDO_entradas_proyecto_formatos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_entradas_proyecto_formatos_id_seq"', 1, false);


--
-- Name: SISGDDO_entradas_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_entradas_proyecto_id_seq"', 1, false);


--
-- Name: SISGDDO_estado_acuerdo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_acuerdo_id_seq"', 4, true);


--
-- Name: SISGDDO_estado_dictamen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_dictamen_id_seq"', 2, true);


--
-- Name: SISGDDO_estado_entradas_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_entradas_proyecto_id_seq"', 2, true);


--
-- Name: SISGDDO_estado_no_conformidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_no_conformidad_id_seq"', 5, true);


--
-- Name: SISGDDO_estado_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_proyecto_id_seq"', 9, true);


--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_formacion_personal_capacitacion_adquirida_id_seq"', 3, true);


--
-- Name: SISGDDO_formacion_personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_formacion_personal_id_seq"', 3, true);


--
-- Name: SISGDDO_formatos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_formatos_id_seq"', 4, true);


--
-- Name: SISGDDO_historico_dictamen_tecnico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_historico_dictamen_tecnico_id_seq"', 1, false);


--
-- Name: SISGDDO_historico_entradas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_historico_entradas_proyectos_id_seq"', 1, false);


--
-- Name: SISGDDO_idioma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_idioma_id_seq"', 5, true);


--
-- Name: SISGDDO_indicador_eficacia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_indicador_eficacia_id_seq"', 5, true);


--
-- Name: SISGDDO_lenguaje_prog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_lenguaje_prog_id_seq"', 1, false);


--
-- Name: SISGDDO_metodosprueba_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_metodosprueba_id_seq"', 3, true);


--
-- Name: SISGDDO_no_conformidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_no_conformidad_id_seq"', 2, true);


--
-- Name: SISGDDO_organismo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_organismo_id_seq"', 1, false);


--
-- Name: SISGDDO_plan_medidas_acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_plan_medidas_acciones_id_seq"', 1, false);


--
-- Name: SISGDDO_plan_medidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_plan_medidas_id_seq"', 1, false);


--
-- Name: SISGDDO_proceso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_proceso_id_seq"', 16, true);


--
-- Name: SISGDDO_provincia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_provincia_id_seq"', 1, false);


--
-- Name: SISGDDO_proyecto_jefe_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_proyecto_jefe_proyecto_id_seq"', 2, true);


--
-- Name: SISGDDO_sistema_operativo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_sistema_operativo_id_seq"', 1, false);


--
-- Name: SISGDDO_sosi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_sosi_id_seq"', 1, true);


--
-- Name: SISGDDO_sosi_idioma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_sosi_idioma_id_seq"', 1, false);


--
-- Name: SISGDDO_tipo_de_licencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tipo_de_licencias_id_seq"', 1, false);


--
-- Name: SISGDDO_trabajador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_trabajador_id_seq"', 10, true);


--
-- Name: SISGDDO_tratamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tratamiento_id_seq"', 1, false);


--
-- Name: SISGDDO_valoracion_encuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_valoracion_encuesta_id_seq"', 1, false);


--
-- Name: SISGDDO_valoracion_encuesta_organismo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_valoracion_encuesta_organismo_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 9, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 501, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 216, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 6, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 212, true);


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.captcha_captchastore_id_seq', 17, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 368, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 54, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 71, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 63, true);


--
-- Name: ProyectoBaseApp_userapp ProyectoBaseApp_userapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProyectoBaseApp_userapp"
    ADD CONSTRAINT "ProyectoBaseApp_userapp_pkey" PRIMARY KEY (user_ptr_id);


--
-- Name: SISGDDO_acciones_correptivas SISGDDO_acciones_correptivas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_correptivas"
    ADD CONSTRAINT "SISGDDO_acciones_correptivas_pkey" PRIMARY KEY (acciones_ptr_id);


--
-- Name: SISGDDO_acciones SISGDDO_acciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones"
    ADD CONSTRAINT "SISGDDO_acciones_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_acciones_prevenntivas SISGDDO_acciones_prevenntivas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_prevenntivas"
    ADD CONSTRAINT "SISGDDO_acciones_prevenntivas_pkey" PRIMARY KEY (acciones_ptr_id);


--
-- Name: SISGDDO_acciones_responsable SISGDDO_acciones_respons_acciones_id_trabajador_i_c4078b69_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_responsable"
    ADD CONSTRAINT "SISGDDO_acciones_respons_acciones_id_trabajador_i_c4078b69_uniq" UNIQUE (acciones_id, trabajador_id);


--
-- Name: SISGDDO_acciones_responsable SISGDDO_acciones_responsable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_responsable"
    ADD CONSTRAINT "SISGDDO_acciones_responsable_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_acuerdos_consejillo_responsable SISGDDO_acuerdos_conseji_acuerdos_consejillo_id_t_6c75fbfb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable"
    ADD CONSTRAINT "SISGDDO_acuerdos_conseji_acuerdos_consejillo_id_t_6c75fbfb_uniq" UNIQUE (acuerdos_consejillo_id, trabajador_id);


--
-- Name: SISGDDO_acuerdos_consejillo SISGDDO_acuerdos_consejillo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo"
    ADD CONSTRAINT "SISGDDO_acuerdos_consejillo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_acuerdos_consejillo_responsable SISGDDO_acuerdos_consejillo_responsable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable"
    ADD CONSTRAINT "SISGDDO_acuerdos_consejillo_responsable_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_area SISGDDO_area_nombre_Area_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_area"
    ADD CONSTRAINT "SISGDDO_area_nombre_Area_key" UNIQUE ("nombre_Area");


--
-- Name: SISGDDO_area SISGDDO_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_area"
    ADD CONSTRAINT "SISGDDO_area_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia SISGDDO_aspecto_medir_indicadoreficacia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_aspecto_medir_indicadoreficacia"
    ADD CONSTRAINT "SISGDDO_aspecto_medir_indicadoreficacia_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_atencion_cliente_externo SISGDDO_atencion_cliente_externo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_atencion_cliente_externo"
    ADD CONSTRAINT "SISGDDO_atencion_cliente_externo_pkey" PRIMARY KEY (no_conformidad_ptr_id);


--
-- Name: SISGDDO_auditoria_externa_area SISGDDO_auditoria_extern_auditoria_externa_id_are_d03f140d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area"
    ADD CONSTRAINT "SISGDDO_auditoria_extern_auditoria_externa_id_are_d03f140d_uniq" UNIQUE (auditoria_externa_id, area_id);


--
-- Name: SISGDDO_auditoria_externa_area SISGDDO_auditoria_externa_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area"
    ADD CONSTRAINT "SISGDDO_auditoria_externa_area_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_auditoria_externa SISGDDO_auditoria_externa_no_registro_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa"
    ADD CONSTRAINT "SISGDDO_auditoria_externa_no_registro_key" UNIQUE (no_registro);


--
-- Name: SISGDDO_auditoria_externa SISGDDO_auditoria_externa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa"
    ADD CONSTRAINT "SISGDDO_auditoria_externa_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_auditoria_interna_trabajadores SISGDDO_auditoria_intern_auditoria_interna_id_tra_95f9fd87_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores"
    ADD CONSTRAINT "SISGDDO_auditoria_intern_auditoria_interna_id_tra_95f9fd87_uniq" UNIQUE (auditoria_interna_id, trabajador_id);


--
-- Name: SISGDDO_auditoria_interna SISGDDO_auditoria_interna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna"
    ADD CONSTRAINT "SISGDDO_auditoria_interna_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_auditoria_interna_trabajadores SISGDDO_auditoria_interna_trabajadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores"
    ADD CONSTRAINT "SISGDDO_auditoria_interna_trabajadores_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_cenda SISGDDO_cenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_cenda"
    ADD CONSTRAINT "SISGDDO_cenda_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_clasificacionincidencias SISGDDO_clasificacionincidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_clasificacionincidencias"
    ADD CONSTRAINT "SISGDDO_clasificacionincidencias_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_cliente_externo SISGDDO_cliente_externo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_cliente_externo"
    ADD CONSTRAINT "SISGDDO_cliente_externo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_coleccion SISGDDO_coleccion_nombre_Coleccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_coleccion"
    ADD CONSTRAINT "SISGDDO_coleccion_nombre_Coleccion_key" UNIQUE ("nombre_Coleccion");


--
-- Name: SISGDDO_coleccion SISGDDO_coleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_coleccion"
    ADD CONSTRAINT "SISGDDO_coleccion_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_curso SISGDDO_curso_nombre_Curso_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_curso"
    ADD CONSTRAINT "SISGDDO_curso_nombre_Curso_key" UNIQUE ("nombre_Curso");


--
-- Name: SISGDDO_curso SISGDDO_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_curso"
    ADD CONSTRAINT "SISGDDO_curso_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tecnico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tecnico_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_eficacia SISGDDO_eficacia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_eficacia"
    ADD CONSTRAINT "SISGDDO_eficacia_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_entidad SISGDDO_entidad_nombre_Entidad_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entidad"
    ADD CONSTRAINT "SISGDDO_entidad_nombre_Entidad_key" UNIQUE ("nombre_Entidad");


--
-- Name: SISGDDO_entidad SISGDDO_entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entidad"
    ADD CONSTRAINT "SISGDDO_entidad_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_entradas_proyecto_formatos SISGDDO_entradas_proyect_entradas_proyecto_id_for_0f12b3fc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos"
    ADD CONSTRAINT "SISGDDO_entradas_proyect_entradas_proyecto_id_for_0f12b3fc_uniq" UNIQUE (entradas_proyecto_id, formatos_id);


--
-- Name: SISGDDO_entradas_proyecto_formatos SISGDDO_entradas_proyecto_formatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos"
    ADD CONSTRAINT "SISGDDO_entradas_proyecto_formatos_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_entradas_proyecto SISGDDO_entradas_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_entradas_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_acuerdo SISGDDO_estado_acuerdo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_acuerdo"
    ADD CONSTRAINT "SISGDDO_estado_acuerdo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_dictamen SISGDDO_estado_dictamen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_dictamen"
    ADD CONSTRAINT "SISGDDO_estado_dictamen_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_entradas_proyecto SISGDDO_estado_entradas_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_estado_entradas_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_no_conformidad SISGDDO_estado_no_conformidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_no_conformidad"
    ADD CONSTRAINT "SISGDDO_estado_no_conformidad_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_proyecto SISGDDO_estado_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_proyecto"
    ADD CONSTRAINT "SISGDDO_estado_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida SISGDDO_formacion_person_formacion_personal_id_cu_fd76a6c6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida"
    ADD CONSTRAINT "SISGDDO_formacion_person_formacion_personal_id_cu_fd76a6c6_uniq" UNIQUE (formacion_personal_id, curso_id);


--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida SISGDDO_formacion_personal_capacitacion_adquirida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida"
    ADD CONSTRAINT "SISGDDO_formacion_personal_capacitacion_adquirida_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_formacion_personal SISGDDO_formacion_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formacion_personal"
    ADD CONSTRAINT "SISGDDO_formacion_personal_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_formatos SISGDDO_formatos_nombre_Formato_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formatos"
    ADD CONSTRAINT "SISGDDO_formatos_nombre_Formato_key" UNIQUE ("nombre_Formato");


--
-- Name: SISGDDO_formatos SISGDDO_formatos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formatos"
    ADD CONSTRAINT "SISGDDO_formatos_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_historico_dictamen_tecnico SISGDDO_historico_dictamen_tecnico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_historico_dictamen_tecnico_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_historico_entradas_proyectos SISGDDO_historico_entradas_proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos"
    ADD CONSTRAINT "SISGDDO_historico_entradas_proyectos_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_idioma SISGDDO_idioma_nombre_Idioma_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_idioma"
    ADD CONSTRAINT "SISGDDO_idioma_nombre_Idioma_key" UNIQUE ("nombre_Idioma");


--
-- Name: SISGDDO_idioma SISGDDO_idioma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_idioma"
    ADD CONSTRAINT "SISGDDO_idioma_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_incidencias SISGDDO_incidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencias"
    ADD CONSTRAINT "SISGDDO_incidencias_pkey" PRIMARY KEY (no_conformidad_ptr_id);


--
-- Name: SISGDDO_indicador_eficacia SISGDDO_indicador_eficacia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_eficacia"
    ADD CONSTRAINT "SISGDDO_indicador_eficacia_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_lenguaje_prog SISGDDO_lenguaje_prog_nombre_Lenguaje_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_lenguaje_prog"
    ADD CONSTRAINT "SISGDDO_lenguaje_prog_nombre_Lenguaje_key" UNIQUE ("nombre_Lenguaje");


--
-- Name: SISGDDO_lenguaje_prog SISGDDO_lenguaje_prog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_lenguaje_prog"
    ADD CONSTRAINT "SISGDDO_lenguaje_prog_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_metodosprueba SISGDDO_metodosprueba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_metodosprueba"
    ADD CONSTRAINT "SISGDDO_metodosprueba_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_no_conformidad SISGDDO_no_conformidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_no_conformidad"
    ADD CONSTRAINT "SISGDDO_no_conformidad_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_organismo SISGDDO_organismo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_organismo"
    ADD CONSTRAINT "SISGDDO_organismo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_plan_medidas_acciones SISGDDO_plan_medidas_acc_plan_medidas_id_acciones_a1f12890_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones"
    ADD CONSTRAINT "SISGDDO_plan_medidas_acc_plan_medidas_id_acciones_a1f12890_uniq" UNIQUE (plan_medidas_id, acciones_id);


--
-- Name: SISGDDO_plan_medidas_acciones SISGDDO_plan_medidas_acciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones"
    ADD CONSTRAINT "SISGDDO_plan_medidas_acciones_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_plan_medidas SISGDDO_plan_medidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas"
    ADD CONSTRAINT "SISGDDO_plan_medidas_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_proceso SISGDDO_proceso_nombre_Proceso_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proceso"
    ADD CONSTRAINT "SISGDDO_proceso_nombre_Proceso_key" UNIQUE ("nombre_Proceso");


--
-- Name: SISGDDO_proceso SISGDDO_proceso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proceso"
    ADD CONSTRAINT "SISGDDO_proceso_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_provincia SISGDDO_provincia_nombre_Provincia_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_provincia"
    ADD CONSTRAINT "SISGDDO_provincia_nombre_Provincia_key" UNIQUE ("nombre_Provincia");


--
-- Name: SISGDDO_provincia SISGDDO_provincia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_provincia"
    ADD CONSTRAINT "SISGDDO_provincia_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_proyecto_jefe_proyecto SISGDDO_proyecto_jefe_pr_proyecto_id_trabajador_i_c4be0452_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_jefe_pr_proyecto_id_trabajador_i_c4be0452_uniq" UNIQUE (proyecto_id, trabajador_id);


--
-- Name: SISGDDO_proyecto_jefe_proyecto SISGDDO_proyecto_jefe_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_jefe_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_sistema_operativo SISGDDO_sistema_operativo_nombre_Sistema_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sistema_operativo"
    ADD CONSTRAINT "SISGDDO_sistema_operativo_nombre_Sistema_key" UNIQUE ("nombre_Sistema");


--
-- Name: SISGDDO_sistema_operativo SISGDDO_sistema_operativo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sistema_operativo"
    ADD CONSTRAINT "SISGDDO_sistema_operativo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_sosi_idioma SISGDDO_sosi_idioma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi_idioma"
    ADD CONSTRAINT "SISGDDO_sosi_idioma_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_sosi_idioma SISGDDO_sosi_idioma_sosi_id_idioma_id_4d79adb9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi_idioma"
    ADD CONSTRAINT "SISGDDO_sosi_idioma_sosi_id_idioma_id_4d79adb9_uniq" UNIQUE (sosi_id, idioma_id);


--
-- Name: SISGDDO_sosi SISGDDO_sosi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_tipo_de_licencias SISGDDO_tipo_de_licencias_nombre_lic_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias"
    ADD CONSTRAINT "SISGDDO_tipo_de_licencias_nombre_lic_key" UNIQUE (nombre_lic);


--
-- Name: SISGDDO_tipo_de_licencias SISGDDO_tipo_de_licencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias"
    ADD CONSTRAINT "SISGDDO_tipo_de_licencias_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_trabajador SISGDDO_trabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador"
    ADD CONSTRAINT "SISGDDO_trabajador_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_tratamiento SISGDDO_tratamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tratamiento"
    ADD CONSTRAINT "SISGDDO_tratamiento_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_valoracion_encuesta_organismo SISGDDO_valoracion_encue_valoracion_encuesta_id_o_806e449f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo"
    ADD CONSTRAINT "SISGDDO_valoracion_encue_valoracion_encuesta_id_o_806e449f_uniq" UNIQUE (valoracion_encuesta_id, organismo_id);


--
-- Name: SISGDDO_valoracion_encuesta_organismo SISGDDO_valoracion_encuesta_organismo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo"
    ADD CONSTRAINT "SISGDDO_valoracion_encuesta_organismo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_valoracion_encuesta SISGDDO_valoracion_encuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta"
    ADD CONSTRAINT "SISGDDO_valoracion_encuesta_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: captcha_captchastore captcha_captchastore_hashkey_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_hashkey_key UNIQUE (hashkey);


--
-- Name: captcha_captchastore captcha_captchastore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: notifications_notification notifications_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);


--
-- Name: SISGDDO_acciones_responsable_acciones_id_63c54b4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acciones_responsable_acciones_id_63c54b4e" ON public."SISGDDO_acciones_responsable" USING btree (acciones_id);


--
-- Name: SISGDDO_acciones_responsable_trabajador_id_98c4cbd4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acciones_responsable_trabajador_id_98c4cbd4" ON public."SISGDDO_acciones_responsable" USING btree (trabajador_id);


--
-- Name: SISGDDO_acciones_tratamiento_id_72860531; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acciones_tratamiento_id_72860531" ON public."SISGDDO_acciones" USING btree (tratamiento_id);


--
-- Name: SISGDDO_acuerdos_consejill_acuerdos_consejillo_id_d4170ee4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acuerdos_consejill_acuerdos_consejillo_id_d4170ee4" ON public."SISGDDO_acuerdos_consejillo_responsable" USING btree (acuerdos_consejillo_id);


--
-- Name: SISGDDO_acuerdos_consejillo_estado_acuerd_id_56d24368; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acuerdos_consejillo_estado_acuerd_id_56d24368" ON public."SISGDDO_acuerdos_consejillo" USING btree (estado_acuerd_id);


--
-- Name: SISGDDO_acuerdos_consejillo_responsable_trabajador_id_25a921a6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acuerdos_consejillo_responsable_trabajador_id_25a921a6" ON public."SISGDDO_acuerdos_consejillo_responsable" USING btree (trabajador_id);


--
-- Name: SISGDDO_area_nombre_Area_36770583_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_area_nombre_Area_36770583_like" ON public."SISGDDO_area" USING btree ("nombre_Area" varchar_pattern_ops);


--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia_indicadores_id_fa46a654; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_aspecto_medir_indicadoreficacia_indicadores_id_fa46a654" ON public."SISGDDO_aspecto_medir_indicadoreficacia" USING btree (indicadores_id);


--
-- Name: SISGDDO_atencion_cliente_externo_cliente_id_86d49f42; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_atencion_cliente_externo_cliente_id_86d49f42" ON public."SISGDDO_atencion_cliente_externo" USING btree (cliente_id);


--
-- Name: SISGDDO_auditoria_externa_area_area_id_57d84df0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_externa_area_area_id_57d84df0" ON public."SISGDDO_auditoria_externa_area" USING btree (area_id);


--
-- Name: SISGDDO_auditoria_externa_area_auditoria_externa_id_87c0cddc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_externa_area_auditoria_externa_id_87c0cddc" ON public."SISGDDO_auditoria_externa_area" USING btree (auditoria_externa_id);


--
-- Name: SISGDDO_auditoria_externa_entidad_id_c6530628; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_externa_entidad_id_c6530628" ON public."SISGDDO_auditoria_externa" USING btree (entidad_id);


--
-- Name: SISGDDO_auditoria_externa_plan_medidas_id_21caa244; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_externa_plan_medidas_id_21caa244" ON public."SISGDDO_auditoria_externa" USING btree (plan_medidas_id);


--
-- Name: SISGDDO_auditoria_interna__auditoria_interna_id_728c0512; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna__auditoria_interna_id_728c0512" ON public."SISGDDO_auditoria_interna_trabajadores" USING btree (auditoria_interna_id);


--
-- Name: SISGDDO_auditoria_interna_area_id_0a1a83b5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_area_id_0a1a83b5" ON public."SISGDDO_auditoria_interna" USING btree (area_id);


--
-- Name: SISGDDO_auditoria_interna_metodos_prueba_id_e192e768; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_metodos_prueba_id_e192e768" ON public."SISGDDO_auditoria_interna" USING btree (metodos_prueba_id);


--
-- Name: SISGDDO_auditoria_interna_plan_medidas_id_63c5c9b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_plan_medidas_id_63c5c9b2" ON public."SISGDDO_auditoria_interna" USING btree (plan_medidas_id);


--
-- Name: SISGDDO_auditoria_interna_trabajadores_trabajador_id_56140742; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_trabajadores_trabajador_id_56140742" ON public."SISGDDO_auditoria_interna_trabajadores" USING btree (trabajador_id);


--
-- Name: SISGDDO_cenda_coleccion_id_f1849f11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_cenda_coleccion_id_f1849f11" ON public."SISGDDO_cenda" USING btree (coleccion_id);


--
-- Name: SISGDDO_cliente_externo_provincia_id_3a877989; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_cliente_externo_provincia_id_3a877989" ON public."SISGDDO_cliente_externo" USING btree (provincia_id);


--
-- Name: SISGDDO_coleccion_nombre_Coleccion_cbdeee35_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_coleccion_nombre_Coleccion_cbdeee35_like" ON public."SISGDDO_coleccion" USING btree ("nombre_Coleccion" varchar_pattern_ops);


--
-- Name: SISGDDO_curso_nombre_Curso_3a1e73ed_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_curso_nombre_Curso_3a1e73ed_like" ON public."SISGDDO_curso" USING btree ("nombre_Curso" varchar_pattern_ops);


--
-- Name: SISGDDO_dictamen_tecnico_area_id_f9083026; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_area_id_f9083026" ON public."SISGDDO_dictamen_tecnico" USING btree (area_id);


--
-- Name: SISGDDO_dictamen_tecnico_disennador_id_fafc4868; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_disennador_id_fafc4868" ON public."SISGDDO_dictamen_tecnico" USING btree (disennador_id);


--
-- Name: SISGDDO_dictamen_tecnico_entradas_proyectos_id_876a6a8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_entradas_proyectos_id_876a6a8b" ON public."SISGDDO_dictamen_tecnico" USING btree (entradas_proyectos_id);


--
-- Name: SISGDDO_dictamen_tecnico_especialista_calidad_id_ceb4cd5a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_especialista_calidad_id_ceb4cd5a" ON public."SISGDDO_dictamen_tecnico" USING btree (especialista_calidad_id);


--
-- Name: SISGDDO_dictamen_tecnico_estado_dictamen_id_7f0c5e1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_estado_dictamen_id_7f0c5e1a" ON public."SISGDDO_dictamen_tecnico" USING btree (estado_dictamen_id);


--
-- Name: SISGDDO_dictamen_tecnico_eval_por_id_d9862d85; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_eval_por_id_d9862d85" ON public."SISGDDO_dictamen_tecnico" USING btree (eval_por_id);


--
-- Name: SISGDDO_dictamen_tecnico_idioma_subtitulado_id_c7dc0352; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_idioma_subtitulado_id_c7dc0352" ON public."SISGDDO_dictamen_tecnico" USING btree (idioma_subtitulado_id);


--
-- Name: SISGDDO_dictamen_tecnico_nuevo_idioma_id_be75064b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_nuevo_idioma_id_be75064b" ON public."SISGDDO_dictamen_tecnico" USING btree (nuevo_idioma_id);


--
-- Name: SISGDDO_dictamen_tecnico_proyecto_id_06d8ece0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_dictamen_tecnico_proyecto_id_06d8ece0" ON public."SISGDDO_dictamen_tecnico" USING btree (proyecto_id);


--
-- Name: SISGDDO_eficacia_proceso_id_abdb7f9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_eficacia_proceso_id_abdb7f9c" ON public."SISGDDO_eficacia" USING btree (proceso_id);


--
-- Name: SISGDDO_eficacia_trabajador_id_2732f0d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_eficacia_trabajador_id_2732f0d3" ON public."SISGDDO_eficacia" USING btree (trabajador_id);


--
-- Name: SISGDDO_entidad_nombre_Entidad_a5e395fc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entidad_nombre_Entidad_a5e395fc_like" ON public."SISGDDO_entidad" USING btree ("nombre_Entidad" varchar_pattern_ops);


--
-- Name: SISGDDO_entradas_proyecto__entradas_proyecto_id_cf0784af; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto__entradas_proyecto_id_cf0784af" ON public."SISGDDO_entradas_proyecto_formatos" USING btree (entradas_proyecto_id);


--
-- Name: SISGDDO_entradas_proyecto_estado_entradas_proyecto_id_925a3481; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto_estado_entradas_proyecto_id_925a3481" ON public."SISGDDO_entradas_proyecto" USING btree (estado_entradas_proyecto_id);


--
-- Name: SISGDDO_entradas_proyecto_formatos_formatos_id_e342b99c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto_formatos_formatos_id_e342b99c" ON public."SISGDDO_entradas_proyecto_formatos" USING btree (formatos_id);


--
-- Name: SISGDDO_entradas_proyecto_jefe_UEB_grupo_id_76b9163d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto_jefe_UEB_grupo_id_76b9163d" ON public."SISGDDO_entradas_proyecto" USING btree ("jefe_UEB_grupo_id");


--
-- Name: SISGDDO_entradas_proyecto_lenguaje_prog_id_b35eabb5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto_lenguaje_prog_id_b35eabb5" ON public."SISGDDO_entradas_proyecto" USING btree (lenguaje_prog_id);


--
-- Name: SISGDDO_entradas_proyecto_proyecto_id_68c399c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto_proyecto_id_68c399c8" ON public."SISGDDO_entradas_proyecto" USING btree (proyecto_id);


--
-- Name: SISGDDO_entradas_proyecto_sistema_operativo_id_c1af2015; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto_sistema_operativo_id_c1af2015" ON public."SISGDDO_entradas_proyecto" USING btree (sistema_operativo_id);


--
-- Name: SISGDDO_entradas_proyecto_trabajador_calidad_interna_a9f3f80b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entradas_proyecto_trabajador_calidad_interna_a9f3f80b" ON public."SISGDDO_entradas_proyecto" USING btree (trabajador_calidad_interna_id);


--
-- Name: SISGDDO_formacion_personal_curso_id_fa1a50f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_formacion_personal_curso_id_fa1a50f4" ON public."SISGDDO_formacion_personal_capacitacion_adquirida" USING btree (curso_id);


--
-- Name: SISGDDO_formacion_personal_formacion_personal_id_b575b3d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_formacion_personal_formacion_personal_id_b575b3d9" ON public."SISGDDO_formacion_personal_capacitacion_adquirida" USING btree (formacion_personal_id);


--
-- Name: SISGDDO_formatos_nombre_Formato_44f72df3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_formatos_nombre_Formato_44f72df3_like" ON public."SISGDDO_formatos" USING btree ("nombre_Formato" varchar_pattern_ops);


--
-- Name: SISGDDO_historico_dictamen_tecnico_dictamen_tecnico_id_1682bbe4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_historico_dictamen_tecnico_dictamen_tecnico_id_1682bbe4" ON public."SISGDDO_historico_dictamen_tecnico" USING btree (dictamen_tecnico_id);


--
-- Name: SISGDDO_historico_entradas_entradas_proyectos_id_cfc93f01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_historico_entradas_entradas_proyectos_id_cfc93f01" ON public."SISGDDO_historico_entradas_proyectos" USING btree (entradas_proyectos_id);


--
-- Name: SISGDDO_historico_entradas_proyectos_entregado_por_id_f4801336; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_historico_entradas_proyectos_entregado_por_id_f4801336" ON public."SISGDDO_historico_entradas_proyectos" USING btree (entregado_por_id);


--
-- Name: SISGDDO_historico_entradas_proyectos_recibida_por_id_ca7c8b8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_historico_entradas_proyectos_recibida_por_id_ca7c8b8f" ON public."SISGDDO_historico_entradas_proyectos" USING btree (recibida_por_id);


--
-- Name: SISGDDO_idioma_nombre_Idioma_00ff2600_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_idioma_nombre_Idioma_00ff2600_like" ON public."SISGDDO_idioma" USING btree ("nombre_Idioma" varchar_pattern_ops);


--
-- Name: SISGDDO_incidencias_clasificacion_id_57da4e3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_incidencias_clasificacion_id_57da4e3b" ON public."SISGDDO_incidencias" USING btree (clasificacion_id);


--
-- Name: SISGDDO_indicador_eficacia_proceso_id_094dda9d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_indicador_eficacia_proceso_id_094dda9d" ON public."SISGDDO_indicador_eficacia" USING btree (proceso_id);


--
-- Name: SISGDDO_lenguaje_prog_nombre_Lenguaje_4cda3608_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_lenguaje_prog_nombre_Lenguaje_4cda3608_like" ON public."SISGDDO_lenguaje_prog" USING btree ("nombre_Lenguaje" varchar_pattern_ops);


--
-- Name: SISGDDO_no_conformidad_estado_id_2df90f3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_no_conformidad_estado_id_2df90f3f" ON public."SISGDDO_no_conformidad" USING btree (estado_id);


--
-- Name: SISGDDO_no_conformidad_proceso_id_1e63ec91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_no_conformidad_proceso_id_1e63ec91" ON public."SISGDDO_no_conformidad" USING btree (proceso_id);


--
-- Name: SISGDDO_no_conformidad_trabajador_id_0d862d14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_no_conformidad_trabajador_id_0d862d14" ON public."SISGDDO_no_conformidad" USING btree (trabajador_id);


--
-- Name: SISGDDO_plan_medidas_acciones_acciones_id_a042ab82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_plan_medidas_acciones_acciones_id_a042ab82" ON public."SISGDDO_plan_medidas_acciones" USING btree (acciones_id);


--
-- Name: SISGDDO_plan_medidas_acciones_plan_medidas_id_561ff079; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_plan_medidas_acciones_plan_medidas_id_561ff079" ON public."SISGDDO_plan_medidas_acciones" USING btree (plan_medidas_id);


--
-- Name: SISGDDO_plan_medidas_proceso_id_7f2c812c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_plan_medidas_proceso_id_7f2c812c" ON public."SISGDDO_plan_medidas" USING btree (proceso_id);


--
-- Name: SISGDDO_proceso_nombre_Proceso_43510f42_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proceso_nombre_Proceso_43510f42_like" ON public."SISGDDO_proceso" USING btree ("nombre_Proceso" varchar_pattern_ops);


--
-- Name: SISGDDO_provincia_nombre_Provincia_a41e8d5d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_provincia_nombre_Provincia_a41e8d5d_like" ON public."SISGDDO_provincia" USING btree ("nombre_Provincia" varchar_pattern_ops);


--
-- Name: SISGDDO_proyecto_area_id_735950ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_area_id_735950ad" ON public."SISGDDO_proyecto" USING btree (area_id);


--
-- Name: SISGDDO_proyecto_cenda_id_692a6e9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_cenda_id_692a6e9e" ON public."SISGDDO_proyecto" USING btree (cenda_id);


--
-- Name: SISGDDO_proyecto_estado_id_8f4b6d8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_estado_id_8f4b6d8d" ON public."SISGDDO_proyecto" USING btree (estado_id);


--
-- Name: SISGDDO_proyecto_jefe_proyecto_proyecto_id_9a3affe7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_jefe_proyecto_proyecto_id_9a3affe7" ON public."SISGDDO_proyecto_jefe_proyecto" USING btree (proyecto_id);


--
-- Name: SISGDDO_proyecto_jefe_proyecto_trabajador_id_e25e2cd5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_jefe_proyecto_trabajador_id_e25e2cd5" ON public."SISGDDO_proyecto_jefe_proyecto" USING btree (trabajador_id);


--
-- Name: SISGDDO_proyecto_sosi_id_c0041ac0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_sosi_id_c0041ac0" ON public."SISGDDO_proyecto" USING btree (sosi_id);


--
-- Name: SISGDDO_sistema_operativo_nombre_Sistema_344503cd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sistema_operativo_nombre_Sistema_344503cd_like" ON public."SISGDDO_sistema_operativo" USING btree ("nombre_Sistema" varchar_pattern_ops);


--
-- Name: SISGDDO_sosi_area_id_05a48fcb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_area_id_05a48fcb" ON public."SISGDDO_sosi" USING btree (area_id);


--
-- Name: SISGDDO_sosi_coleccion_id_3f2777f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_coleccion_id_3f2777f3" ON public."SISGDDO_sosi" USING btree (coleccion_id);


--
-- Name: SISGDDO_sosi_formatos_id_a958d2c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_formatos_id_a958d2c2" ON public."SISGDDO_sosi" USING btree (formatos_id);


--
-- Name: SISGDDO_sosi_idioma_idioma_id_1ae932f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_idioma_idioma_id_1ae932f7" ON public."SISGDDO_sosi_idioma" USING btree (idioma_id);


--
-- Name: SISGDDO_sosi_idioma_sosi_id_24f8706e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_idioma_sosi_id_24f8706e" ON public."SISGDDO_sosi_idioma" USING btree (sosi_id);


--
-- Name: SISGDDO_sosi_persona_entrega_id_041d4b5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_persona_entrega_id_041d4b5c" ON public."SISGDDO_sosi" USING btree (persona_entrega_id);


--
-- Name: SISGDDO_sosi_persona_recibe_id_6358f77d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_persona_recibe_id_6358f77d" ON public."SISGDDO_sosi" USING btree (persona_recibe_id);


--
-- Name: SISGDDO_tipo_de_licencias_entidad_emite_id_0162d8b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_de_licencias_entidad_emite_id_0162d8b9" ON public."SISGDDO_tipo_de_licencias" USING btree (entidad_emite_id);


--
-- Name: SISGDDO_tipo_de_licencias_nombre_lic_8912533e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_de_licencias_nombre_lic_8912533e_like" ON public."SISGDDO_tipo_de_licencias" USING btree (nombre_lic varchar_pattern_ops);


--
-- Name: SISGDDO_tipo_de_licencias_proceso_id_a88d99ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_de_licencias_proceso_id_a88d99ee" ON public."SISGDDO_tipo_de_licencias" USING btree (proceso_id);


--
-- Name: SISGDDO_tipo_de_licencias_trabajador_responsable_id_1d206130; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_de_licencias_trabajador_responsable_id_1d206130" ON public."SISGDDO_tipo_de_licencias" USING btree (trabajador_responsable_id);


--
-- Name: SISGDDO_trabajador_formacion_id_fa1b53dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_formacion_id_fa1b53dd" ON public."SISGDDO_trabajador" USING btree (formacion_id);


--
-- Name: SISGDDO_valoracion_encuest_valoracion_encuesta_id_c912f9a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_valoracion_encuest_valoracion_encuesta_id_c912f9a4" ON public."SISGDDO_valoracion_encuesta_organismo" USING btree (valoracion_encuesta_id);


--
-- Name: SISGDDO_valoracion_encuesta_elaborado_por_id_7818d5c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_valoracion_encuesta_elaborado_por_id_7818d5c9" ON public."SISGDDO_valoracion_encuesta" USING btree (elaborado_por_id);


--
-- Name: SISGDDO_valoracion_encuesta_organismo_organismo_id_225b3b81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_valoracion_encuesta_organismo_organismo_id_225b3b81" ON public."SISGDDO_valoracion_encuesta_organismo" USING btree (organismo_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: captcha_captchastore_hashkey_cbe8d15a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX captcha_captchastore_hashkey_cbe8d15a_like ON public.captcha_captchastore USING btree (hashkey varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: notifications_notification_action_object_content_type_7d2b8ee9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_action_object_content_type_7d2b8ee9 ON public.notifications_notification USING btree (action_object_content_type_id);


--
-- Name: notifications_notification_actor_content_type_id_0c69d7b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_actor_content_type_id_0c69d7b7 ON public.notifications_notification USING btree (actor_content_type_id);


--
-- Name: notifications_notification_deleted_b32b69e6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_deleted_b32b69e6 ON public.notifications_notification USING btree (deleted);


--
-- Name: notifications_notification_emailed_23a5ad81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_emailed_23a5ad81 ON public.notifications_notification USING btree (emailed);


--
-- Name: notifications_notification_public_1bc30b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_public_1bc30b1c ON public.notifications_notification USING btree (public);


--
-- Name: notifications_notification_recipient_id_d055f3f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_recipient_id_d055f3f0 ON public.notifications_notification USING btree (recipient_id);


--
-- Name: notifications_notification_target_content_type_id_ccb24d88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_target_content_type_id_ccb24d88 ON public.notifications_notification USING btree (target_content_type_id);


--
-- Name: notifications_notification_unread_cce4be30; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_unread_cce4be30 ON public.notifications_notification USING btree (unread);


--
-- Name: ProyectoBaseApp_userapp ProyectoBaseApp_userapp_user_ptr_id_2c744a7c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProyectoBaseApp_userapp"
    ADD CONSTRAINT "ProyectoBaseApp_userapp_user_ptr_id_2c744a7c_fk_auth_user_id" FOREIGN KEY (user_ptr_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acciones_correptivas SISGDDO_acciones_cor_acciones_ptr_id_16280263_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_correptivas"
    ADD CONSTRAINT "SISGDDO_acciones_cor_acciones_ptr_id_16280263_fk_SISGDDO_a" FOREIGN KEY (acciones_ptr_id) REFERENCES public."SISGDDO_acciones"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acciones_prevenntivas SISGDDO_acciones_pre_acciones_ptr_id_655ecb08_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_prevenntivas"
    ADD CONSTRAINT "SISGDDO_acciones_pre_acciones_ptr_id_655ecb08_fk_SISGDDO_a" FOREIGN KEY (acciones_ptr_id) REFERENCES public."SISGDDO_acciones"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acciones_responsable SISGDDO_acciones_res_acciones_id_63c54b4e_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_responsable"
    ADD CONSTRAINT "SISGDDO_acciones_res_acciones_id_63c54b4e_fk_SISGDDO_a" FOREIGN KEY (acciones_id) REFERENCES public."SISGDDO_acciones"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acciones_responsable SISGDDO_acciones_res_trabajador_id_98c4cbd4_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones_responsable"
    ADD CONSTRAINT "SISGDDO_acciones_res_trabajador_id_98c4cbd4_fk_SISGDDO_t" FOREIGN KEY (trabajador_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acciones SISGDDO_acciones_tratamiento_id_72860531_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acciones"
    ADD CONSTRAINT "SISGDDO_acciones_tratamiento_id_72860531_fk_SISGDDO_t" FOREIGN KEY (tratamiento_id) REFERENCES public."SISGDDO_tratamiento"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acuerdos_consejillo_responsable SISGDDO_acuerdos_con_acuerdos_consejillo__d4170ee4_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable"
    ADD CONSTRAINT "SISGDDO_acuerdos_con_acuerdos_consejillo__d4170ee4_fk_SISGDDO_a" FOREIGN KEY (acuerdos_consejillo_id) REFERENCES public."SISGDDO_acuerdos_consejillo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acuerdos_consejillo SISGDDO_acuerdos_con_estado_acuerd_id_56d24368_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo"
    ADD CONSTRAINT "SISGDDO_acuerdos_con_estado_acuerd_id_56d24368_fk_SISGDDO_e" FOREIGN KEY (estado_acuerd_id) REFERENCES public."SISGDDO_estado_acuerdo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acuerdos_consejillo_responsable SISGDDO_acuerdos_con_trabajador_id_25a921a6_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdos_consejillo_responsable"
    ADD CONSTRAINT "SISGDDO_acuerdos_con_trabajador_id_25a921a6_fk_SISGDDO_t" FOREIGN KEY (trabajador_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_aspecto_medir_indicadoreficacia SISGDDO_aspecto_medi_indicadores_id_fa46a654_fk_SISGDDO_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_aspecto_medir_indicadoreficacia"
    ADD CONSTRAINT "SISGDDO_aspecto_medi_indicadores_id_fa46a654_fk_SISGDDO_i" FOREIGN KEY (indicadores_id) REFERENCES public."SISGDDO_indicador_eficacia"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_atencion_cliente_externo SISGDDO_atencion_cli_cliente_id_86d49f42_fk_SISGDDO_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_atencion_cliente_externo"
    ADD CONSTRAINT "SISGDDO_atencion_cli_cliente_id_86d49f42_fk_SISGDDO_c" FOREIGN KEY (cliente_id) REFERENCES public."SISGDDO_cliente_externo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_atencion_cliente_externo SISGDDO_atencion_cli_no_conformidad_ptr_i_703db51f_fk_SISGDDO_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_atencion_cliente_externo"
    ADD CONSTRAINT "SISGDDO_atencion_cli_no_conformidad_ptr_i_703db51f_fk_SISGDDO_n" FOREIGN KEY (no_conformidad_ptr_id) REFERENCES public."SISGDDO_no_conformidad"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_externa_area SISGDDO_auditoria_ex_area_id_57d84df0_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area"
    ADD CONSTRAINT "SISGDDO_auditoria_ex_area_id_57d84df0_fk_SISGDDO_a" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_externa_area SISGDDO_auditoria_ex_auditoria_externa_id_87c0cddc_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_area"
    ADD CONSTRAINT "SISGDDO_auditoria_ex_auditoria_externa_id_87c0cddc_fk_SISGDDO_a" FOREIGN KEY (auditoria_externa_id) REFERENCES public."SISGDDO_auditoria_externa"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_externa SISGDDO_auditoria_ex_entidad_id_c6530628_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa"
    ADD CONSTRAINT "SISGDDO_auditoria_ex_entidad_id_c6530628_fk_SISGDDO_e" FOREIGN KEY (entidad_id) REFERENCES public."SISGDDO_entidad"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_externa SISGDDO_auditoria_ex_plan_medidas_id_21caa244_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa"
    ADD CONSTRAINT "SISGDDO_auditoria_ex_plan_medidas_id_21caa244_fk_SISGDDO_p" FOREIGN KEY (plan_medidas_id) REFERENCES public."SISGDDO_plan_medidas"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna_trabajadores SISGDDO_auditoria_in_auditoria_interna_id_728c0512_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores"
    ADD CONSTRAINT "SISGDDO_auditoria_in_auditoria_interna_id_728c0512_fk_SISGDDO_a" FOREIGN KEY (auditoria_interna_id) REFERENCES public."SISGDDO_auditoria_interna"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna SISGDDO_auditoria_in_metodos_prueba_id_e192e768_fk_SISGDDO_m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna"
    ADD CONSTRAINT "SISGDDO_auditoria_in_metodos_prueba_id_e192e768_fk_SISGDDO_m" FOREIGN KEY (metodos_prueba_id) REFERENCES public."SISGDDO_metodosprueba"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna SISGDDO_auditoria_in_plan_medidas_id_63c5c9b2_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna"
    ADD CONSTRAINT "SISGDDO_auditoria_in_plan_medidas_id_63c5c9b2_fk_SISGDDO_p" FOREIGN KEY (plan_medidas_id) REFERENCES public."SISGDDO_plan_medidas"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna_trabajadores SISGDDO_auditoria_in_trabajador_id_56140742_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_trabajadores"
    ADD CONSTRAINT "SISGDDO_auditoria_in_trabajador_id_56140742_fk_SISGDDO_t" FOREIGN KEY (trabajador_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna SISGDDO_auditoria_interna_area_id_0a1a83b5_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna"
    ADD CONSTRAINT "SISGDDO_auditoria_interna_area_id_0a1a83b5_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_cenda SISGDDO_cenda_coleccion_id_f1849f11_fk_SISGDDO_coleccion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_cenda"
    ADD CONSTRAINT "SISGDDO_cenda_coleccion_id_f1849f11_fk_SISGDDO_coleccion_id" FOREIGN KEY (coleccion_id) REFERENCES public."SISGDDO_coleccion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_cliente_externo SISGDDO_cliente_exte_provincia_id_3a877989_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_cliente_externo"
    ADD CONSTRAINT "SISGDDO_cliente_exte_provincia_id_3a877989_fk_SISGDDO_p" FOREIGN KEY (provincia_id) REFERENCES public."SISGDDO_provincia"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_disennador_id_fafc4868_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_disennador_id_fafc4868_fk_SISGDDO_t" FOREIGN KEY (disennador_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_entradas_proyectos_i_876a6a8b_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_entradas_proyectos_i_876a6a8b_fk_SISGDDO_e" FOREIGN KEY (entradas_proyectos_id) REFERENCES public."SISGDDO_entradas_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_especialista_calidad_ceb4cd5a_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_especialista_calidad_ceb4cd5a_fk_SISGDDO_t" FOREIGN KEY (especialista_calidad_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_estado_dictamen_id_7f0c5e1a_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_estado_dictamen_id_7f0c5e1a_fk_SISGDDO_e" FOREIGN KEY (estado_dictamen_id) REFERENCES public."SISGDDO_estado_dictamen"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_eval_por_id_d9862d85_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_eval_por_id_d9862d85_fk_SISGDDO_t" FOREIGN KEY (eval_por_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_idioma_subtitulado_i_c7dc0352_fk_SISGDDO_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_idioma_subtitulado_i_c7dc0352_fk_SISGDDO_i" FOREIGN KEY (idioma_subtitulado_id) REFERENCES public."SISGDDO_idioma"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_nuevo_idioma_id_be75064b_fk_SISGDDO_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_nuevo_idioma_id_be75064b_fk_SISGDDO_i" FOREIGN KEY (nuevo_idioma_id) REFERENCES public."SISGDDO_idioma"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tec_proyecto_id_06d8ece0_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tec_proyecto_id_06d8ece0_fk_SISGDDO_p" FOREIGN KEY (proyecto_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dictamen_tecnico SISGDDO_dictamen_tecnico_area_id_f9083026_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_dictamen_tecnico_area_id_f9083026_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_eficacia SISGDDO_eficacia_proceso_id_abdb7f9c_fk_SISGDDO_proceso_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_eficacia"
    ADD CONSTRAINT "SISGDDO_eficacia_proceso_id_abdb7f9c_fk_SISGDDO_proceso_id" FOREIGN KEY (proceso_id) REFERENCES public."SISGDDO_proceso"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_eficacia SISGDDO_eficacia_trabajador_id_2732f0d3_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_eficacia"
    ADD CONSTRAINT "SISGDDO_eficacia_trabajador_id_2732f0d3_fk_SISGDDO_t" FOREIGN KEY (trabajador_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto_formatos SISGDDO_entradas_pro_entradas_proyecto_id_cf0784af_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos"
    ADD CONSTRAINT "SISGDDO_entradas_pro_entradas_proyecto_id_cf0784af_fk_SISGDDO_e" FOREIGN KEY (entradas_proyecto_id) REFERENCES public."SISGDDO_entradas_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto SISGDDO_entradas_pro_estado_entradas_proy_925a3481_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_entradas_pro_estado_entradas_proy_925a3481_fk_SISGDDO_e" FOREIGN KEY (estado_entradas_proyecto_id) REFERENCES public."SISGDDO_estado_entradas_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto_formatos SISGDDO_entradas_pro_formatos_id_e342b99c_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto_formatos"
    ADD CONSTRAINT "SISGDDO_entradas_pro_formatos_id_e342b99c_fk_SISGDDO_f" FOREIGN KEY (formatos_id) REFERENCES public."SISGDDO_formatos"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto SISGDDO_entradas_pro_jefe_UEB_grupo_id_76b9163d_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_entradas_pro_jefe_UEB_grupo_id_76b9163d_fk_SISGDDO_t" FOREIGN KEY ("jefe_UEB_grupo_id") REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto SISGDDO_entradas_pro_lenguaje_prog_id_b35eabb5_fk_SISGDDO_l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_entradas_pro_lenguaje_prog_id_b35eabb5_fk_SISGDDO_l" FOREIGN KEY (lenguaje_prog_id) REFERENCES public."SISGDDO_lenguaje_prog"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto SISGDDO_entradas_pro_proyecto_id_68c399c8_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_entradas_pro_proyecto_id_68c399c8_fk_SISGDDO_p" FOREIGN KEY (proyecto_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto SISGDDO_entradas_pro_sistema_operativo_id_c1af2015_fk_SISGDDO_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_entradas_pro_sistema_operativo_id_c1af2015_fk_SISGDDO_s" FOREIGN KEY (sistema_operativo_id) REFERENCES public."SISGDDO_sistema_operativo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entradas_proyecto SISGDDO_entradas_pro_trabajador_calidad_i_a9f3f80b_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_entradas_pro_trabajador_calidad_i_a9f3f80b_fk_SISGDDO_t" FOREIGN KEY (trabajador_calidad_interna_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida SISGDDO_formacion_pe_curso_id_fa1a50f4_fk_SISGDDO_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida"
    ADD CONSTRAINT "SISGDDO_formacion_pe_curso_id_fa1a50f4_fk_SISGDDO_c" FOREIGN KEY (curso_id) REFERENCES public."SISGDDO_curso"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_formacion_personal_capacitacion_adquirida SISGDDO_formacion_pe_formacion_personal_i_b575b3d9_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formacion_personal_capacitacion_adquirida"
    ADD CONSTRAINT "SISGDDO_formacion_pe_formacion_personal_i_b575b3d9_fk_SISGDDO_f" FOREIGN KEY (formacion_personal_id) REFERENCES public."SISGDDO_formacion_personal"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_historico_dictamen_tecnico SISGDDO_historico_di_dictamen_tecnico_id_1682bbe4_fk_SISGDDO_d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_dictamen_tecnico"
    ADD CONSTRAINT "SISGDDO_historico_di_dictamen_tecnico_id_1682bbe4_fk_SISGDDO_d" FOREIGN KEY (dictamen_tecnico_id) REFERENCES public."SISGDDO_dictamen_tecnico"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_historico_entradas_proyectos SISGDDO_historico_en_entradas_proyectos_i_cfc93f01_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos"
    ADD CONSTRAINT "SISGDDO_historico_en_entradas_proyectos_i_cfc93f01_fk_SISGDDO_e" FOREIGN KEY (entradas_proyectos_id) REFERENCES public."SISGDDO_entradas_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_historico_entradas_proyectos SISGDDO_historico_en_entregado_por_id_f4801336_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos"
    ADD CONSTRAINT "SISGDDO_historico_en_entregado_por_id_f4801336_fk_SISGDDO_t" FOREIGN KEY (entregado_por_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_historico_entradas_proyectos SISGDDO_historico_en_recibida_por_id_ca7c8b8f_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_historico_entradas_proyectos"
    ADD CONSTRAINT "SISGDDO_historico_en_recibida_por_id_ca7c8b8f_fk_SISGDDO_t" FOREIGN KEY (recibida_por_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_incidencias SISGDDO_incidencias_clasificacion_id_57da4e3b_fk_SISGDDO_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencias"
    ADD CONSTRAINT "SISGDDO_incidencias_clasificacion_id_57da4e3b_fk_SISGDDO_c" FOREIGN KEY (clasificacion_id) REFERENCES public."SISGDDO_clasificacionincidencias"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_incidencias SISGDDO_incidencias_no_conformidad_ptr_i_d475808a_fk_SISGDDO_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencias"
    ADD CONSTRAINT "SISGDDO_incidencias_no_conformidad_ptr_i_d475808a_fk_SISGDDO_n" FOREIGN KEY (no_conformidad_ptr_id) REFERENCES public."SISGDDO_no_conformidad"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_indicador_eficacia SISGDDO_indicador_ef_proceso_id_094dda9d_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_eficacia"
    ADD CONSTRAINT "SISGDDO_indicador_ef_proceso_id_094dda9d_fk_SISGDDO_p" FOREIGN KEY (proceso_id) REFERENCES public."SISGDDO_proceso"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_no_conformidad SISGDDO_no_conformid_estado_id_2df90f3f_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_no_conformidad"
    ADD CONSTRAINT "SISGDDO_no_conformid_estado_id_2df90f3f_fk_SISGDDO_e" FOREIGN KEY (estado_id) REFERENCES public."SISGDDO_estado_no_conformidad"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_no_conformidad SISGDDO_no_conformid_proceso_id_1e63ec91_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_no_conformidad"
    ADD CONSTRAINT "SISGDDO_no_conformid_proceso_id_1e63ec91_fk_SISGDDO_p" FOREIGN KEY (proceso_id) REFERENCES public."SISGDDO_proceso"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_no_conformidad SISGDDO_no_conformid_trabajador_id_0d862d14_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_no_conformidad"
    ADD CONSTRAINT "SISGDDO_no_conformid_trabajador_id_0d862d14_fk_SISGDDO_t" FOREIGN KEY (trabajador_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_plan_medidas_acciones SISGDDO_plan_medidas_acciones_id_a042ab82_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones"
    ADD CONSTRAINT "SISGDDO_plan_medidas_acciones_id_a042ab82_fk_SISGDDO_a" FOREIGN KEY (acciones_id) REFERENCES public."SISGDDO_acciones"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_plan_medidas_acciones SISGDDO_plan_medidas_plan_medidas_id_561ff079_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas_acciones"
    ADD CONSTRAINT "SISGDDO_plan_medidas_plan_medidas_id_561ff079_fk_SISGDDO_p" FOREIGN KEY (plan_medidas_id) REFERENCES public."SISGDDO_plan_medidas"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_plan_medidas SISGDDO_plan_medidas_proceso_id_7f2c812c_fk_SISGDDO_proceso_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plan_medidas"
    ADD CONSTRAINT "SISGDDO_plan_medidas_proceso_id_7f2c812c_fk_SISGDDO_proceso_id" FOREIGN KEY (proceso_id) REFERENCES public."SISGDDO_proceso"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_area_id_735950ad_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_area_id_735950ad_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_cenda_id_692a6e9e_fk_SISGDDO_cenda_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_cenda_id_692a6e9e_fk_SISGDDO_cenda_id" FOREIGN KEY (cenda_id) REFERENCES public."SISGDDO_cenda"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_estado_id_8f4b6d8d_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_estado_id_8f4b6d8d_fk_SISGDDO_e" FOREIGN KEY (estado_id) REFERENCES public."SISGDDO_estado_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto_jefe_proyecto SISGDDO_proyecto_jef_proyecto_id_9a3affe7_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_jef_proyecto_id_9a3affe7_fk_SISGDDO_p" FOREIGN KEY (proyecto_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto_jefe_proyecto SISGDDO_proyecto_jef_trabajador_id_e25e2cd5_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_jefe_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_jef_trabajador_id_e25e2cd5_fk_SISGDDO_t" FOREIGN KEY (trabajador_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_sosi_id_c0041ac0_fk_SISGDDO_sosi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_sosi_id_c0041ac0_fk_SISGDDO_sosi_id" FOREIGN KEY (sosi_id) REFERENCES public."SISGDDO_sosi"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi SISGDDO_sosi_area_id_05a48fcb_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_area_id_05a48fcb_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi SISGDDO_sosi_coleccion_id_3f2777f3_fk_SISGDDO_coleccion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_coleccion_id_3f2777f3_fk_SISGDDO_coleccion_id" FOREIGN KEY (coleccion_id) REFERENCES public."SISGDDO_coleccion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi SISGDDO_sosi_formatos_id_a958d2c2_fk_SISGDDO_formatos_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_formatos_id_a958d2c2_fk_SISGDDO_formatos_id" FOREIGN KEY (formatos_id) REFERENCES public."SISGDDO_formatos"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi_idioma SISGDDO_sosi_idioma_idioma_id_1ae932f7_fk_SISGDDO_idioma_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi_idioma"
    ADD CONSTRAINT "SISGDDO_sosi_idioma_idioma_id_1ae932f7_fk_SISGDDO_idioma_id" FOREIGN KEY (idioma_id) REFERENCES public."SISGDDO_idioma"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi_idioma SISGDDO_sosi_idioma_sosi_id_24f8706e_fk_SISGDDO_sosi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi_idioma"
    ADD CONSTRAINT "SISGDDO_sosi_idioma_sosi_id_24f8706e_fk_SISGDDO_sosi_id" FOREIGN KEY (sosi_id) REFERENCES public."SISGDDO_sosi"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi SISGDDO_sosi_persona_entrega_id_041d4b5c_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_persona_entrega_id_041d4b5c_fk_SISGDDO_t" FOREIGN KEY (persona_entrega_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi SISGDDO_sosi_persona_recibe_id_6358f77d_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_persona_recibe_id_6358f77d_fk_SISGDDO_t" FOREIGN KEY (persona_recibe_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_tipo_de_licencias SISGDDO_tipo_de_lice_entidad_emite_id_0162d8b9_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias"
    ADD CONSTRAINT "SISGDDO_tipo_de_lice_entidad_emite_id_0162d8b9_fk_SISGDDO_e" FOREIGN KEY (entidad_emite_id) REFERENCES public."SISGDDO_entidad"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_tipo_de_licencias SISGDDO_tipo_de_lice_proceso_id_a88d99ee_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias"
    ADD CONSTRAINT "SISGDDO_tipo_de_lice_proceso_id_a88d99ee_fk_SISGDDO_p" FOREIGN KEY (proceso_id) REFERENCES public."SISGDDO_proceso"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_tipo_de_licencias SISGDDO_tipo_de_lice_trabajador_responsab_1d206130_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_licencias"
    ADD CONSTRAINT "SISGDDO_tipo_de_lice_trabajador_responsab_1d206130_fk_SISGDDO_t" FOREIGN KEY (trabajador_responsable_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_trabajador SISGDDO_trabajador_formacion_id_fa1b53dd_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador"
    ADD CONSTRAINT "SISGDDO_trabajador_formacion_id_fa1b53dd_fk_SISGDDO_f" FOREIGN KEY (formacion_id) REFERENCES public."SISGDDO_formacion_personal"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_valoracion_encuesta SISGDDO_valoracion_e_elaborado_por_id_7818d5c9_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta"
    ADD CONSTRAINT "SISGDDO_valoracion_e_elaborado_por_id_7818d5c9_fk_SISGDDO_t" FOREIGN KEY (elaborado_por_id) REFERENCES public."SISGDDO_trabajador"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_valoracion_encuesta_organismo SISGDDO_valoracion_e_organismo_id_225b3b81_fk_SISGDDO_o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo"
    ADD CONSTRAINT "SISGDDO_valoracion_e_organismo_id_225b3b81_fk_SISGDDO_o" FOREIGN KEY (organismo_id) REFERENCES public."SISGDDO_organismo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_valoracion_encuesta_organismo SISGDDO_valoracion_e_valoracion_encuesta__c912f9a4_fk_SISGDDO_v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_valoracion_encuesta_organismo"
    ADD CONSTRAINT "SISGDDO_valoracion_e_valoracion_encuesta__c912f9a4_fk_SISGDDO_v" FOREIGN KEY (valoracion_encuesta_id) REFERENCES public."SISGDDO_valoracion_encuesta"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co FOREIGN KEY (action_object_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co FOREIGN KEY (actor_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_recipient_id_d055f3f0_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_recipient_id_d055f3f0_fk_auth_user FOREIGN KEY (recipient_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_target_content_type__ccb24d88_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_target_content_type__ccb24d88_fk_django_co FOREIGN KEY (target_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

