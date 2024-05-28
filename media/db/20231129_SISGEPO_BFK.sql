--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10
-- Dumped by pg_dump version 12.10

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
ALTER TABLE ONLY public.licenses_license DROP CONSTRAINT licenses_license_responsible_id_0bd6dff1_fk_base_employee_id;
ALTER TABLE ONLY public.licenses_license DROP CONSTRAINT licenses_license_process_id_dcbf4da2_fk_base_process_id;
ALTER TABLE ONLY public.licenses_license DROP CONSTRAINT licenses_license_entity_id_c7bd8c2e_fk_base_entity_id;
ALTER TABLE ONLY public.licenses_license DROP CONSTRAINT licenses_license_associated_process_i_a5903141_fk_base_proc;
ALTER TABLE ONLY public.iproperty_industrialproperty DROP CONSTRAINT iproperty_industrial_type_legal_document__b8d57c0f_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_products DROP CONSTRAINT iproperty_industrial_productclassificatio_67d8230e_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_patents DROP CONSTRAINT iproperty_industrial_patentclassification_df39c097_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_patents DROP CONSTRAINT iproperty_industrial_industrialproperty_i_d852c90a_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_drawings DROP CONSTRAINT iproperty_industrial_industrialproperty_i_bff6aaa7_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements DROP CONSTRAINT iproperty_industrial_industrialproperty_i_56182c20_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_products DROP CONSTRAINT iproperty_industrial_industrialproperty_i_0322db86_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements DROP CONSTRAINT iproperty_industrial_figurativeelementcla_a8c5f01a_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty_drawings DROP CONSTRAINT iproperty_industrial_drawingclassificatio_79ec40ea_fk_iproperty;
ALTER TABLE ONLY public.iproperty_industrialproperty DROP CONSTRAINT iproperty_industrial_country_id_79753bf4_fk_base_coun;
ALTER TABLE ONLY public.effectiveness_semestermeasurer DROP CONSTRAINT effectiveness_semest_semester_id_bb53c5bd_fk_effective;
ALTER TABLE ONLY public.effectiveness_semestermeasurer DROP CONSTRAINT effectiveness_semest_measurer_id_446ad6c1_fk_effective;
ALTER TABLE ONLY public.effectiveness_indicatormeasurer DROP CONSTRAINT effectiveness_indica_indicator_id_f42c87b2_fk_effective;
ALTER TABLE ONLY public.effectiveness_effectiveness DROP CONSTRAINT effectiveness_effect_process_id_6d5884fe_fk_base_proc;
ALTER TABLE ONLY public.effectiveness_effectivenesssemester DROP CONSTRAINT effectiveness_effect_effectiveness_id_a0af5cc8_fk_effective;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.complaints_complaint DROP CONSTRAINT complaints_complaint_way_of_reception_id_640b2401_fk_complaint;
ALTER TABLE ONLY public.complaints_complaint DROP CONSTRAINT complaints_complaint_process_id_e77bc23c_fk_base_process_id;
ALTER TABLE ONLY public.complaints_complaintaction DROP CONSTRAINT complaints_complaint_complaint_id_807b6ee9_fk_complaint;
ALTER TABLE ONLY public.base_process DROP CONSTRAINT base_process_responsible_id_344e4108_fk_base_employee_id;
ALTER TABLE ONLY public.base_procedure DROP CONSTRAINT base_procedure_process_id_14cdad40_fk_base_process_id;
ALTER TABLE ONLY public.base_infoemployee DROP CONSTRAINT base_infoemployee_employee_id_42ec708c_fk_base_employee_id;
ALTER TABLE ONLY public.base_employee DROP CONSTRAINT base_employee_position_id_79f70088_fk_base_position_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto" DROP CONSTRAINT "SISGDDO_trabajador_proyecto_rol_id_02adf738_fk_base_position_id";
ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto" DROP CONSTRAINT "SISGDDO_trabajador_p_proyecto_id_d0ca6712_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto" DROP CONSTRAINT "SISGDDO_trabajador_p_employee_id_f90c9f24_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_c_rol_id_1daa1fc0_fk_base_posi";
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_c_employee_id_53d7c9a3_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_c_consecutivo_id_cd8a53e9_fk_SISGDDO_c";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_especialista_id_24d6da69_fk_base_employee_id";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_consecutivo_id_67aca643_fk_SISGDDO_consecutivo_id";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_tipo_id_c88e10ea_fk_SISGDDO_tipo_proyecto_id";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_tipo_codigo_id_b05ed44d_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_linea_tematica_id_10a43b97_fk_SISGDDO_l";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_fuente_financiamient_b3aa398a_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_proyecto_formato" DROP CONSTRAINT "SISGDDO_proyecto_for_proyecto_id_36235f96_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_proyecto_formato" DROP CONSTRAINT "SISGDDO_proyecto_for_formato_id_d4c1b27a_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_estado_id_8f4b6d8d_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_consecutivo_id_41e708e2_fk_SISGDDO_c";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_area_id_735950ad_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_premio" DROP CONSTRAINT "SISGDDO_premio_entidad_id_32643785_fk_base_entity_id";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_ob_objetivo_id_c1883a69_fk_SISGDDO_o";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_trabajador_id_88ef29b2_fk_base_employee_id";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_procesos_id_a2f5fa16_fk_base_process_id";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_ejecutante_id_acf271a3_fk_base_employee_id";
ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral" DROP CONSTRAINT "SISGDDO_evaluacion_t_periodo_id_6aba39a9_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral" DROP CONSTRAINT "SISGDDO_evaluacion_t_objetivo_id_b0eea8d6_fk_SISGDDO_o";
ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral" DROP CONSTRAINT "SISGDDO_evaluacion_t_evaluacion_id_644fc73e_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto" DROP CONSTRAINT "SISGDDO_estado_proye_etapa_id_434b07a4_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto" DROP CONSTRAINT "SISGDDO_entrada_proy_proyecto_id_7890fee4_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato" DROP CONSTRAINT "SISGDDO_entrada_proy_formato_id_66c1ef29_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto" DROP CONSTRAINT "SISGDDO_entrada_proy_estado_id_fe9c37be_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto" DROP CONSTRAINT "SISGDDO_entrada_proy_entregado_por_id_3361ea52_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato" DROP CONSTRAINT "SISGDDO_entrada_proy_entrada_proyecto_id_a1eaef93_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_dato_adicional" DROP CONSTRAINT "SISGDDO_dato_adicion_proyecto_ptr_id_7113cfc3_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_tipo_id_31db9a9d_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_tipo_codigo_id_bb30e90d_fk_SISGDDO_t";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_linea_tematica_id_4cbb0544_fk_SISGDDO_l";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_fuente_financiamient_bf5a8394_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_estado_id_cf1181a9_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_area_id_07694d17_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_consecutivo_formato" DROP CONSTRAINT "SISGDDO_consecutivo__formato_id_42177e48_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_consecutivo_formato" DROP CONSTRAINT "SISGDDO_consecutivo__consecutivo_id_0863363c_fk_SISGDDO_c";
ALTER TABLE ONLY public."SISGDDO_conclusion_adicional" DROP CONSTRAINT "SISGDDO_conclusion_a_proyecto_ptr_id_fd573ea0_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_in_proceso_id_17b71d4d_fk_base_proc";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo" DROP CONSTRAINT "SISGDDO_auditoria_in_employee_id_51387c36_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo" DROP CONSTRAINT "SISGDDO_auditoria_in_auditoria_interna_id_5841c585_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa" DROP CONSTRAINT "SISGDDO_auditoria_externa_entidad_id_c6530628_fk_base_entity_id";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso" DROP CONSTRAINT "SISGDDO_auditoria_ex_process_id_3dfdb35a_fk_base_proc";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso" DROP CONSTRAINT "SISGDDO_auditoria_ex_auditoria_externa_id_eb98e133_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_afectaciones" DROP CONSTRAINT "SISGDDO_afectaciones_responsable_id_44e3f4f1_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_afectaciones" DROP CONSTRAINT "SISGDDO_afectaciones_propuesto_id_79f10bb1_fk_base_employee_id";
ALTER TABLE ONLY public."SISGDDO_acuerdo" DROP CONSTRAINT "SISGDDO_acuerdo_estado_id_1c8e022e_fk_SISGDDO_estado_acuerdo_id";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_empl_employee_id_343fc6cb_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_empl_acuerdo_id_7d77dcfc_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_actividadplan" DROP CONSTRAINT "SISGDDO_actividadplan_preside_id_911d0fb5_fk_base_employee_id";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadpla_employee_id_a4490474_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadpla_actividadplan_id_f484ee3d_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_accion_indicador_objetivo" DROP CONSTRAINT "SISGDDO_accion_indic_indicador_id_fb30c80e_fk_SISGDDO_i";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_accion_area_area_id_b3974b55_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_accion_area_accion_id_8ef839e5_fk_SISGDDO_a";
ALTER TABLE ONLY public."ProyectoBaseApp_userapp" DROP CONSTRAINT "ProyectoBaseApp_userapp_user_ptr_id_2c744a7c_fk_auth_user_id";
DROP INDEX public.notifications_notification_unread_cce4be30;
DROP INDEX public.notifications_notification_timestamp_6a797bad;
DROP INDEX public.notifications_notification_target_content_type_id_ccb24d88;
DROP INDEX public.notifications_notification_recipient_id_unread_253aadc9_idx;
DROP INDEX public.notifications_notification_recipient_id_d055f3f0;
DROP INDEX public.notifications_notification_public_1bc30b1c;
DROP INDEX public.notifications_notification_emailed_23a5ad81;
DROP INDEX public.notifications_notification_deleted_b32b69e6;
DROP INDEX public.notifications_notification_actor_content_type_id_0c69d7b7;
DROP INDEX public.notifications_notification_action_object_content_type_7d2b8ee9;
DROP INDEX public.licenses_license_responsible_id_0bd6dff1;
DROP INDEX public.licenses_license_process_id_dcbf4da2;
DROP INDEX public.licenses_license_number_ab22c049_like;
DROP INDEX public.licenses_license_entity_id_c7bd8c2e;
DROP INDEX public.licenses_license_associated_process_id_a5903141;
DROP INDEX public.iproperty_patentclassification_name_e4fa6a81_like;
DROP INDEX public.iproperty_industrialproperty_type_legal_document_id_b8d57c0f;
DROP INDEX public.iproperty_industrialproperty_number_9a40f78a_like;
DROP INDEX public.iproperty_industrialproperty_name_e9a4b8cb_like;
DROP INDEX public.iproperty_industrialproperty_country_id_79753bf4;
DROP INDEX public.iproperty_industrialproper_productclassification_id_67d8230e;
DROP INDEX public.iproperty_industrialproper_patentclassification_id_df39c097;
DROP INDEX public.iproperty_industrialproper_industrialproperty_id_d852c90a;
DROP INDEX public.iproperty_industrialproper_industrialproperty_id_bff6aaa7;
DROP INDEX public.iproperty_industrialproper_industrialproperty_id_56182c20;
DROP INDEX public.iproperty_industrialproper_industrialproperty_id_0322db86;
DROP INDEX public.iproperty_industrialproper_figurativeelementclassific_a8c5f01a;
DROP INDEX public.iproperty_industrialproper_drawingclassification_id_79ec40ea;
DROP INDEX public.iproperty_figurativeelementclassification_number_9384a716_like;
DROP INDEX public.iproperty_drawingclassification_name_79f1ed43_like;
DROP INDEX public.effectiveness_semestermeasurer_semester_id_bb53c5bd;
DROP INDEX public.effectiveness_semestermeasurer_measurer_id_446ad6c1;
DROP INDEX public.effectiveness_indicatormeasurer_indicator_id_f42c87b2;
DROP INDEX public.effectiveness_effectivenesssemester_effectiveness_id_a0af5cc8;
DROP INDEX public.effectiveness_effectiveness_process_id_6d5884fe;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.complaints_complaintaction_complaint_id_807b6ee9;
DROP INDEX public.complaints_complaint_way_of_reception_id_640b2401;
DROP INDEX public.complaints_complaint_process_id_e77bc23c;
DROP INDEX public.complaints_complaint_number_0bd00cd2_like;
DROP INDEX public.captcha_captchastore_hashkey_cbe8d15a_like;
DROP INDEX public.base_process_responsible_id_344e4108;
DROP INDEX public.base_process_name_681a7114_like;
DROP INDEX public.base_procedure_process_id_14cdad40;
DROP INDEX public.base_procedure_name_b841c895_like;
DROP INDEX public.base_employee_position_id_79f70088;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
DROP INDEX public."SISGDDO_trimestre_nombre_f5e8a1d1_like";
DROP INDEX public."SISGDDO_trabajador_proyecto_rol_id_02adf738";
DROP INDEX public."SISGDDO_trabajador_proyecto_proyecto_id_d0ca6712";
DROP INDEX public."SISGDDO_trabajador_proyecto_employee_id_f90c9f24";
DROP INDEX public."SISGDDO_trabajador_consecutivo_rol_id_1daa1fc0";
DROP INDEX public."SISGDDO_trabajador_consecutivo_employee_id_53d7c9a3";
DROP INDEX public."SISGDDO_trabajador_consecutivo_consecutivo_id_cd8a53e9";
DROP INDEX public."SISGDDO_tipo_proyecto_nombre_6c46c070_like";
DROP INDEX public."SISGDDO_tipo_de_obra_nombre_c085e828_like";
DROP INDEX public."SISGDDO_tipo_codigo_siglas_5bd8c683_like";
DROP INDEX public."SISGDDO_tipo_codigo_nombre_da4b866e_like";
DROP INDEX public."SISGDDO_sosi_especialista_id_24d6da69";
DROP INDEX public."SISGDDO_proyecto_tipo_id_c88e10ea";
DROP INDEX public."SISGDDO_proyecto_tipo_codigo_id_b05ed44d";
DROP INDEX public."SISGDDO_proyecto_nombre_proyecto_f4676558_like";
DROP INDEX public."SISGDDO_proyecto_no_f796bcb4_like";
DROP INDEX public."SISGDDO_proyecto_linea_tematica_id_10a43b97";
DROP INDEX public."SISGDDO_proyecto_fuente_financiamiento_id_b3aa398a";
DROP INDEX public."SISGDDO_proyecto_formato_proyecto_id_36235f96";
DROP INDEX public."SISGDDO_proyecto_formato_formato_id_d4c1b27a";
DROP INDEX public."SISGDDO_proyecto_estado_id_8f4b6d8d";
DROP INDEX public."SISGDDO_proyecto_codigo_02279a4d_like";
DROP INDEX public."SISGDDO_proyecto_area_id_735950ad";
DROP INDEX public."SISGDDO_prioridad_nombre_c4a4e387_like";
DROP INDEX public."SISGDDO_premio_entidad_id_32643785";
DROP INDEX public."SISGDDO_linea_tematica_nombre_9f7df45b_like";
DROP INDEX public."SISGDDO_indicador_objetivos_objetivo_id_c1883a69";
DROP INDEX public."SISGDDO_indicador_objetivos_nombre_0a1844bf_like";
DROP INDEX public."SISGDDO_indicador_objetivos_no_c3d38afe_like";
DROP INDEX public."SISGDDO_incidencia_trabajador_id_88ef29b2";
DROP INDEX public."SISGDDO_incidencia_procesos_id_a2f5fa16";
DROP INDEX public."SISGDDO_incidencia_ejecutante_id_acf271a3";
DROP INDEX public."SISGDDO_fuente_financiamiento_nombre_fafab37a_like";
DROP INDEX public."SISGDDO_formato_nombre_15f8a22b_like";
DROP INDEX public."SISGDDO_evaluacion_valor_7f502f5e_like";
DROP INDEX public."SISGDDO_evaluacion_trimestral_periodo_id_6aba39a9";
DROP INDEX public."SISGDDO_evaluacion_trimestral_objetivo_id_b0eea8d6";
DROP INDEX public."SISGDDO_evaluacion_trimestral_evaluacion_id_644fc73e";
DROP INDEX public."SISGDDO_evaluacion_nombre_a4424535_like";
DROP INDEX public."SISGDDO_etapa_proyecto_nombre_8806c230_like";
DROP INDEX public."SISGDDO_estado_proyecto_nombre_99d390cd_like";
DROP INDEX public."SISGDDO_estado_proyecto_estado_id_08f582f8";
DROP INDEX public."SISGDDO_estado_proyecto_dgca_nombre_130ef725_like";
DROP INDEX public."SISGDDO_estado_indicador_objetivos_nombre_fba308f5_like";
DROP INDEX public."SISGDDO_estado_cenda_nombre_abeefaae_like";
DROP INDEX public."SISGDDO_estado_acuerdo_nombre_0ae91081_like";
DROP INDEX public."SISGDDO_entrada_proyecto_proyecto_id_7890fee4";
DROP INDEX public."SISGDDO_entrada_proyecto_formato_formato_id_66c1ef29";
DROP INDEX public."SISGDDO_entrada_proyecto_formato_entrada_proyecto_id_a1eaef93";
DROP INDEX public."SISGDDO_entrada_proyecto_estado_id_fe9c37be";
DROP INDEX public."SISGDDO_entrada_proyecto_entregado_por_id_3361ea52";
DROP INDEX public."SISGDDO_entidad_nombre_f6a9ebad_like";
DROP INDEX public."SISGDDO_consecutivo_tipo_id_31db9a9d";
DROP INDEX public."SISGDDO_consecutivo_tipo_codigo_id_bb30e90d";
DROP INDEX public."SISGDDO_consecutivo_no_ea708152_like";
DROP INDEX public."SISGDDO_consecutivo_linea_tematica_id_4cbb0544";
DROP INDEX public."SISGDDO_consecutivo_fuente_financiamiento_id_bf5a8394";
DROP INDEX public."SISGDDO_consecutivo_formato_formato_id_42177e48";
DROP INDEX public."SISGDDO_consecutivo_formato_consecutivo_id_0863363c";
DROP INDEX public."SISGDDO_consecutivo_estado_id_cf1181a9";
DROP INDEX public."SISGDDO_consecutivo_area_id_07694d17";
DROP INDEX public."SISGDDO_configuracion_nombre_69a10587_like";
DROP INDEX public."SISGDDO_auditoria_interna_proceso_id_17b71d4d";
DROP INDEX public."SISGDDO_auditoria_interna_equipo_employee_id_51387c36";
DROP INDEX public."SISGDDO_auditoria_interna_equipo_auditoria_interna_id_5841c585";
DROP INDEX public."SISGDDO_auditoria_externa_proceso_process_id_3dfdb35a";
DROP INDEX public."SISGDDO_auditoria_externa_proceso_auditoria_externa_id_eb98e133";
DROP INDEX public."SISGDDO_auditoria_externa_entidad_id_c6530628";
DROP INDEX public."SISGDDO_area_nombre_9983a3f3_like";
DROP INDEX public."SISGDDO_afectaciones_responsable_id_44e3f4f1";
DROP INDEX public."SISGDDO_afectaciones_propuesto_id_79f10bb1";
DROP INDEX public."SISGDDO_acuerdo_numero_62f7297a_like";
DROP INDEX public."SISGDDO_acuerdo_estado_id_1c8e022e";
DROP INDEX public."SISGDDO_acuerdo_employee_employee_id_343fc6cb";
DROP INDEX public."SISGDDO_acuerdo_employee_acuerdo_id_7d77dcfc";
DROP INDEX public."SISGDDO_actividadplan_preside_id_911d0fb5";
DROP INDEX public."SISGDDO_actividadplan_participantes_employee_id_a4490474";
DROP INDEX public."SISGDDO_actividadplan_participantes_actividadplan_id_f484ee3d";
DROP INDEX public."SISGDDO_accion_indicador_objetivo_indicador_id_fb30c80e";
DROP INDEX public."SISGDDO_accion_area_area_id_b3974b55";
DROP INDEX public."SISGDDO_accion_area_accion_id_8ef839e5";
ALTER TABLE ONLY public.notifications_notification DROP CONSTRAINT notifications_notification_pkey;
ALTER TABLE ONLY public.licenses_license DROP CONSTRAINT licenses_license_pkey;
ALTER TABLE ONLY public.licenses_license DROP CONSTRAINT licenses_license_number_key;
ALTER TABLE ONLY public.iproperty_typelegaldocument DROP CONSTRAINT iproperty_typelegaldocument_pkey;
ALTER TABLE ONLY public.iproperty_productclassification DROP CONSTRAINT iproperty_productclassification_pkey;
ALTER TABLE ONLY public.iproperty_productclassification DROP CONSTRAINT iproperty_productclassification_number_key;
ALTER TABLE ONLY public.iproperty_patentclassification DROP CONSTRAINT iproperty_patentclassification_pkey;
ALTER TABLE ONLY public.iproperty_patentclassification DROP CONSTRAINT iproperty_patentclassification_name_key;
ALTER TABLE ONLY public.iproperty_industrialproperty_products DROP CONSTRAINT iproperty_industrialproperty_products_pkey;
ALTER TABLE ONLY public.iproperty_industrialproperty DROP CONSTRAINT iproperty_industrialproperty_pkey;
ALTER TABLE ONLY public.iproperty_industrialproperty_patents DROP CONSTRAINT iproperty_industrialproperty_patents_pkey;
ALTER TABLE ONLY public.iproperty_industrialproperty DROP CONSTRAINT iproperty_industrialproperty_number_key;
ALTER TABLE ONLY public.iproperty_industrialproperty DROP CONSTRAINT iproperty_industrialproperty_name_key;
ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements DROP CONSTRAINT iproperty_industrialproperty_figurative_elements_pkey;
ALTER TABLE ONLY public.iproperty_industrialproperty_drawings DROP CONSTRAINT iproperty_industrialproperty_drawings_pkey;
ALTER TABLE ONLY public.iproperty_industrialproperty_products DROP CONSTRAINT iproperty_industrialprop_industrialproperty_id_pr_955457b2_uniq;
ALTER TABLE ONLY public.iproperty_industrialproperty_patents DROP CONSTRAINT iproperty_industrialprop_industrialproperty_id_pa_1162812d_uniq;
ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements DROP CONSTRAINT iproperty_industrialprop_industrialproperty_id_fi_0cd6be8d_uniq;
ALTER TABLE ONLY public.iproperty_industrialproperty_drawings DROP CONSTRAINT iproperty_industrialprop_industrialproperty_id_dr_636a4a82_uniq;
ALTER TABLE ONLY public.iproperty_figurativeelementclassification DROP CONSTRAINT iproperty_figurativeelementclassification_pkey;
ALTER TABLE ONLY public.iproperty_figurativeelementclassification DROP CONSTRAINT iproperty_figurativeelementclassification_number_key;
ALTER TABLE ONLY public.iproperty_drawingclassification DROP CONSTRAINT iproperty_drawingclassification_pkey;
ALTER TABLE ONLY public.iproperty_drawingclassification DROP CONSTRAINT iproperty_drawingclassification_name_key;
ALTER TABLE ONLY public.effectiveness_semestermeasurer DROP CONSTRAINT effectiveness_semestermeasurer_pkey;
ALTER TABLE ONLY public.effectiveness_semestermeasurer DROP CONSTRAINT effectiveness_semesterme_semester_id_measurer_id_752ccecc_uniq;
ALTER TABLE ONLY public.effectiveness_indicatormeasurer DROP CONSTRAINT effectiveness_indicatormeasurer_pkey;
ALTER TABLE ONLY public.effectiveness_indicatormeasurer DROP CONSTRAINT effectiveness_indicatormeasurer_indicator_id_name_4764c36c_uniq;
ALTER TABLE ONLY public.effectiveness_indicator DROP CONSTRAINT effectiveness_indicator_pkey;
ALTER TABLE ONLY public.effectiveness_effectivenesssemester DROP CONSTRAINT effectiveness_effectivenesssemester_pkey;
ALTER TABLE ONLY public.effectiveness_effectiveness DROP CONSTRAINT effectiveness_effectiveness_process_id_year_7634d99c_uniq;
ALTER TABLE ONLY public.effectiveness_effectiveness DROP CONSTRAINT effectiveness_effectiveness_pkey;
ALTER TABLE ONLY public.effectiveness_effectivenesssemester DROP CONSTRAINT effectiveness_effectiven_effectiveness_id_semeste_0ea590a5_uniq;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.complaints_wayofreception DROP CONSTRAINT complaints_wayofreception_pkey;
ALTER TABLE ONLY public.complaints_complaintaction DROP CONSTRAINT complaints_complaintaction_pkey;
ALTER TABLE ONLY public.complaints_complaintaction DROP CONSTRAINT complaints_complaintaction_complaint_id_action_4571e1da_uniq;
ALTER TABLE ONLY public.complaints_complaint DROP CONSTRAINT complaints_complaint_pkey;
ALTER TABLE ONLY public.complaints_complaint DROP CONSTRAINT complaints_complaint_number_key;
ALTER TABLE ONLY public.captcha_captchastore DROP CONSTRAINT captcha_captchastore_pkey;
ALTER TABLE ONLY public.captcha_captchastore DROP CONSTRAINT captcha_captchastore_hashkey_key;
ALTER TABLE ONLY public.base_process DROP CONSTRAINT base_process_pkey;
ALTER TABLE ONLY public.base_process DROP CONSTRAINT base_process_name_key;
ALTER TABLE ONLY public.base_procedure DROP CONSTRAINT base_procedure_pkey;
ALTER TABLE ONLY public.base_procedure DROP CONSTRAINT base_procedure_name_key;
ALTER TABLE ONLY public.base_position DROP CONSTRAINT base_position_pkey;
ALTER TABLE ONLY public.base_logoentity DROP CONSTRAINT base_logoentity_pkey;
ALTER TABLE ONLY public.base_infoemployee DROP CONSTRAINT base_infoemployee_pkey;
ALTER TABLE ONLY public.base_infoemployee DROP CONSTRAINT base_infoemployee_employee_id_key;
ALTER TABLE ONLY public.base_entity DROP CONSTRAINT base_entity_pkey;
ALTER TABLE ONLY public.base_employee DROP CONSTRAINT base_employee_pkey;
ALTER TABLE ONLY public.base_country DROP CONSTRAINT base_country_pkey;
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
ALTER TABLE ONLY public."SISGDDO_periodo" DROP CONSTRAINT "SISGDDO_trimestre_pkey";
ALTER TABLE ONLY public."SISGDDO_periodo" DROP CONSTRAINT "SISGDDO_trimestre_nombre_key";
ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto" DROP CONSTRAINT "SISGDDO_trabajador_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_consecutivo_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_proyecto" DROP CONSTRAINT "SISGDDO_tipo_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_proyecto" DROP CONSTRAINT "SISGDDO_tipo_proyecto_nombre_key";
ALTER TABLE ONLY public."SISGDDO_tipo_de_obra" DROP CONSTRAINT "SISGDDO_tipo_de_obra_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_de_obra" DROP CONSTRAINT "SISGDDO_tipo_de_obra_nombre_key";
ALTER TABLE ONLY public."SISGDDO_tipo_codigo" DROP CONSTRAINT "SISGDDO_tipo_codigo_siglas_key";
ALTER TABLE ONLY public."SISGDDO_tipo_codigo" DROP CONSTRAINT "SISGDDO_tipo_codigo_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_codigo" DROP CONSTRAINT "SISGDDO_tipo_codigo_nombre_key";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_pkey";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_consecutivo_id_key";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_nombre_proyecto_key";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_no_key";
ALTER TABLE ONLY public."SISGDDO_proyecto_formato" DROP CONSTRAINT "SISGDDO_proyecto_formato_proyecto_id_formato_id_6f56d224_uniq";
ALTER TABLE ONLY public."SISGDDO_proyecto_formato" DROP CONSTRAINT "SISGDDO_proyecto_formato_pkey";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_consecutivo_id_key";
ALTER TABLE ONLY public."SISGDDO_proyecto" DROP CONSTRAINT "SISGDDO_proyecto_codigo_key";
ALTER TABLE ONLY public."SISGDDO_prioridad" DROP CONSTRAINT "SISGDDO_prioridad_pkey";
ALTER TABLE ONLY public."SISGDDO_prioridad" DROP CONSTRAINT "SISGDDO_prioridad_nombre_key";
ALTER TABLE ONLY public."SISGDDO_premio" DROP CONSTRAINT "SISGDDO_premio_pkey";
ALTER TABLE ONLY public."SISGDDO_plantrabajo" DROP CONSTRAINT "SISGDDO_plantrabajo_pkey";
ALTER TABLE ONLY public."SISGDDO_permisos_personalizados" DROP CONSTRAINT "SISGDDO_permisos_personalizados_pkey";
ALTER TABLE ONLY public."SISGDDO_objetivo" DROP CONSTRAINT "SISGDDO_objetivo_pkey";
ALTER TABLE ONLY public."SISGDDO_linea_tematica" DROP CONSTRAINT "SISGDDO_linea_tematica_pkey";
ALTER TABLE ONLY public."SISGDDO_linea_tematica" DROP CONSTRAINT "SISGDDO_linea_tematica_nombre_key";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_objetivos_pkey";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_objetivos_nombre_key";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_objetivos_no_c3d38afe_uniq";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_pkey";
ALTER TABLE ONLY public."SISGDDO_fuente_financiamiento" DROP CONSTRAINT "SISGDDO_fuente_financiamiento_pkey";
ALTER TABLE ONLY public."SISGDDO_fuente_financiamiento" DROP CONSTRAINT "SISGDDO_fuente_financiamiento_nombre_key";
ALTER TABLE ONLY public."SISGDDO_formato" DROP CONSTRAINT "SISGDDO_formato_pkey";
ALTER TABLE ONLY public."SISGDDO_formato" DROP CONSTRAINT "SISGDDO_formato_nombre_key";
ALTER TABLE ONLY public."SISGDDO_evaluacion" DROP CONSTRAINT "SISGDDO_evaluacion_valor_key";
ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral" DROP CONSTRAINT "SISGDDO_evaluacion_trimestral_pkey";
ALTER TABLE ONLY public."SISGDDO_evaluacion" DROP CONSTRAINT "SISGDDO_evaluacion_pkey";
ALTER TABLE ONLY public."SISGDDO_evaluacion" DROP CONSTRAINT "SISGDDO_evaluacion_nombre_key";
ALTER TABLE ONLY public."SISGDDO_etapa_proyecto" DROP CONSTRAINT "SISGDDO_etapa_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_etapa_proyecto" DROP CONSTRAINT "SISGDDO_etapa_proyecto_nombre_key";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto" DROP CONSTRAINT "SISGDDO_estado_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto" DROP CONSTRAINT "SISGDDO_estado_proyecto_nombre_key";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto_dgca" DROP CONSTRAINT "SISGDDO_estado_proyecto_dgca_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto_dgca" DROP CONSTRAINT "SISGDDO_estado_proyecto_dgca_nombre_key";
ALTER TABLE ONLY public."SISGDDO_estado_indicador_objetivos" DROP CONSTRAINT "SISGDDO_estado_indicador_objetivos_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_indicador_objetivos" DROP CONSTRAINT "SISGDDO_estado_indicador_objetivos_nombre_key";
ALTER TABLE ONLY public."SISGDDO_estado_entradas_proyecto" DROP CONSTRAINT "SISGDDO_estado_entradas_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_cenda" DROP CONSTRAINT "SISGDDO_estado_cenda_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_cenda" DROP CONSTRAINT "SISGDDO_estado_cenda_nombre_key";
ALTER TABLE ONLY public."SISGDDO_estado_acuerdo" DROP CONSTRAINT "SISGDDO_estado_acuerdo_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_acuerdo" DROP CONSTRAINT "SISGDDO_estado_acuerdo_nombre_key";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto" DROP CONSTRAINT "SISGDDO_entrada_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato" DROP CONSTRAINT "SISGDDO_entrada_proyecto_formato_pkey";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato" DROP CONSTRAINT "SISGDDO_entrada_proyecto_entrada_proyecto_id_form_769be411_uniq";
ALTER TABLE ONLY public."SISGDDO_entidad" DROP CONSTRAINT "SISGDDO_entidad_pkey";
ALTER TABLE ONLY public."SISGDDO_entidad" DROP CONSTRAINT "SISGDDO_entidad_nombre_key";
ALTER TABLE ONLY public."SISGDDO_dato_adicional" DROP CONSTRAINT "SISGDDO_dato_adicional_pkey";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_pkey";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_no_key";
ALTER TABLE ONLY public."SISGDDO_consecutivo_formato" DROP CONSTRAINT "SISGDDO_consecutivo_formato_pkey";
ALTER TABLE ONLY public."SISGDDO_consecutivo_formato" DROP CONSTRAINT "SISGDDO_consecutivo_form_consecutivo_id_formato_i_00dac759_uniq";
ALTER TABLE ONLY public."SISGDDO_configuracion" DROP CONSTRAINT "SISGDDO_configuracion_pkey";
ALTER TABLE ONLY public."SISGDDO_configuracion" DROP CONSTRAINT "SISGDDO_configuracion_nombre_key";
ALTER TABLE ONLY public."SISGDDO_conclusion_adicional" DROP CONSTRAINT "SISGDDO_conclusion_adicional_pkey";
ALTER TABLE ONLY public."SISGDDO_cambiarlogotipo" DROP CONSTRAINT "SISGDDO_cambiarlogotipo_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_interna_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo" DROP CONSTRAINT "SISGDDO_auditoria_interna_equipo_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo" DROP CONSTRAINT "SISGDDO_auditoria_intern_auditoria_interna_id_emp_5bc61ab2_uniq";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso" DROP CONSTRAINT "SISGDDO_auditoria_externa_proceso_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa" DROP CONSTRAINT "SISGDDO_auditoria_externa_pkey";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso" DROP CONSTRAINT "SISGDDO_auditoria_extern_auditoria_externa_id_pro_6797b040_uniq";
ALTER TABLE ONLY public."SISGDDO_area" DROP CONSTRAINT "SISGDDO_area_pkey";
ALTER TABLE ONLY public."SISGDDO_area" DROP CONSTRAINT "SISGDDO_area_nombre_key";
ALTER TABLE ONLY public."SISGDDO_afectaciones" DROP CONSTRAINT "SISGDDO_afectaciones_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdo" DROP CONSTRAINT "SISGDDO_acuerdo_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdo" DROP CONSTRAINT "SISGDDO_acuerdo_numero_key";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_employee_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_employee_acuerdo_id_employee_id_8cf1b53c_uniq";
ALTER TABLE ONLY public."SISGDDO_actividadplan" DROP CONSTRAINT "SISGDDO_actividadplan_pkey";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadplan_participantes_pkey";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadplan_pa_actividadplan_id_employe_36e34bde_uniq";
ALTER TABLE ONLY public."SISGDDO_accion_indicador_objetivo" DROP CONSTRAINT "SISGDDO_accion_indicador_objetivo_pkey";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_accion_area_pkey";
ALTER TABLE ONLY public."ProyectoBaseApp_userapp" DROP CONSTRAINT "ProyectoBaseApp_userapp_pkey";
DROP TABLE public.notifications_notification;
DROP TABLE public.licenses_license;
DROP TABLE public.iproperty_typelegaldocument;
DROP TABLE public.iproperty_productclassification;
DROP TABLE public.iproperty_patentclassification;
DROP TABLE public.iproperty_industrialproperty_products;
DROP TABLE public.iproperty_industrialproperty_patents;
DROP TABLE public.iproperty_industrialproperty_figurative_elements;
DROP TABLE public.iproperty_industrialproperty_drawings;
DROP TABLE public.iproperty_industrialproperty;
DROP TABLE public.iproperty_figurativeelementclassification;
DROP TABLE public.iproperty_drawingclassification;
DROP TABLE public.effectiveness_semestermeasurer;
DROP TABLE public.effectiveness_indicatormeasurer;
DROP TABLE public.effectiveness_indicator;
DROP TABLE public.effectiveness_effectivenesssemester;
DROP TABLE public.effectiveness_effectiveness;
DROP TABLE public.django_session;
DROP TABLE public.django_migrations;
DROP TABLE public.django_content_type;
DROP TABLE public.django_admin_log;
DROP TABLE public.complaints_wayofreception;
DROP TABLE public.complaints_complaintaction;
DROP TABLE public.complaints_complaint;
DROP TABLE public.captcha_captchastore;
DROP TABLE public.base_process;
DROP TABLE public.base_procedure;
DROP TABLE public.base_position;
DROP TABLE public.base_logoentity;
DROP TABLE public.base_infoemployee;
DROP TABLE public.base_entity;
DROP TABLE public.base_employee;
DROP TABLE public.base_country;
DROP TABLE public.auth_user_user_permissions;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP TABLE public.auth_permission;
DROP TABLE public.auth_group_permissions;
DROP TABLE public.auth_group;
DROP TABLE public."SISGDDO_trabajador_proyecto";
DROP TABLE public."SISGDDO_trabajador_consecutivo";
DROP TABLE public."SISGDDO_tipo_proyecto";
DROP TABLE public."SISGDDO_tipo_de_obra";
DROP TABLE public."SISGDDO_tipo_codigo";
DROP TABLE public."SISGDDO_sosi";
DROP TABLE public."SISGDDO_proyecto_formato";
DROP TABLE public."SISGDDO_proyecto";
DROP TABLE public."SISGDDO_prioridad";
DROP TABLE public."SISGDDO_premio";
DROP TABLE public."SISGDDO_plantrabajo";
DROP TABLE public."SISGDDO_permisos_personalizados";
DROP TABLE public."SISGDDO_periodo";
DROP TABLE public."SISGDDO_objetivo";
DROP TABLE public."SISGDDO_linea_tematica";
DROP TABLE public."SISGDDO_indicador_objetivos";
DROP TABLE public."SISGDDO_incidencia";
DROP TABLE public."SISGDDO_fuente_financiamiento";
DROP TABLE public."SISGDDO_formato";
DROP TABLE public."SISGDDO_evaluacion_trimestral";
DROP TABLE public."SISGDDO_evaluacion";
DROP TABLE public."SISGDDO_etapa_proyecto";
DROP TABLE public."SISGDDO_estado_proyecto_dgca";
DROP TABLE public."SISGDDO_estado_proyecto";
DROP TABLE public."SISGDDO_estado_indicador_objetivos";
DROP TABLE public."SISGDDO_estado_entradas_proyecto";
DROP TABLE public."SISGDDO_estado_cenda";
DROP TABLE public."SISGDDO_estado_acuerdo";
DROP TABLE public."SISGDDO_entrada_proyecto_formato";
DROP TABLE public."SISGDDO_entrada_proyecto";
DROP TABLE public."SISGDDO_entidad";
DROP TABLE public."SISGDDO_dato_adicional";
DROP TABLE public."SISGDDO_consecutivo_formato";
DROP TABLE public."SISGDDO_consecutivo";
DROP TABLE public."SISGDDO_configuracion";
DROP TABLE public."SISGDDO_conclusion_adicional";
DROP TABLE public."SISGDDO_cambiarlogotipo";
DROP TABLE public."SISGDDO_auditoria_interna_equipo";
DROP TABLE public."SISGDDO_auditoria_interna";
DROP TABLE public."SISGDDO_auditoria_externa_proceso";
DROP TABLE public."SISGDDO_auditoria_externa";
DROP TABLE public."SISGDDO_area";
DROP TABLE public."SISGDDO_afectaciones";
DROP TABLE public."SISGDDO_acuerdo_employee";
DROP TABLE public."SISGDDO_acuerdo";
DROP TABLE public."SISGDDO_actividadplan_participantes";
DROP TABLE public."SISGDDO_actividadplan";
DROP TABLE public."SISGDDO_accion_indicador_objetivo";
DROP TABLE public."SISGDDO_descripcion";
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
    fa2 boolean NOT NULL,
    notificado boolean NOT NULL
);


ALTER TABLE public."ProyectoBaseApp_userapp" OWNER TO postgres;

--
-- Name: SISGDDO_descripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_descripcion" (
    id integer NOT NULL,
    descripcion character varying(500),
    accion_id integer NOT NULL,
    area_id integer NOT NULL,
    activo boolean NOT NULL,
    fecha_creacion timestamp with time zone NOT NULL
);


ALTER TABLE public."SISGDDO_descripcion" OWNER TO postgres;

--
-- Name: SISGDDO_accion_area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_descripcion" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_accion_area_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_accion_indicador_objetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_accion_indicador_objetivo" (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    activo boolean NOT NULL,
    indicador_id integer,
    no character varying(10),
    codigo character varying(10)
);


ALTER TABLE public."SISGDDO_accion_indicador_objetivo" OWNER TO postgres;

--
-- Name: SISGDDO_accion_indicador_objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_accion_indicador_objetivo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_accion_indicador_objetivo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_actividadplan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_actividadplan" (
    id integer NOT NULL,
    descripcion character varying(80),
    dia date NOT NULL,
    hora time without time zone NOT NULL,
    lugar character varying(80),
    preside_id bigint,
    activo boolean NOT NULL,
    plan character varying(80) NOT NULL,
    otro character varying(80) NOT NULL
);


ALTER TABLE public."SISGDDO_actividadplan" OWNER TO postgres;

--
-- Name: SISGDDO_actividadplan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_actividadplan" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_actividadplan_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_actividadplan_participantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_actividadplan_participantes" (
    id integer NOT NULL,
    actividadplan_id integer NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_actividadplan_participantes" OWNER TO postgres;

--
-- Name: SISGDDO_actividadplan_participantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_actividadplan_participantes" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_actividadplan_participantes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_acuerdo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acuerdo" (
    id integer NOT NULL,
    numero character varying(6),
    nombre character varying(125),
    fecha date NOT NULL,
    fecha_limite date,
    fecha_cumplimiento date,
    observaciones text,
    activo boolean NOT NULL,
    estado_id integer
);


ALTER TABLE public."SISGDDO_acuerdo" OWNER TO postgres;

--
-- Name: SISGDDO_acuerdo_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_acuerdo_employee" (
    id integer NOT NULL,
    acuerdo_id integer NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_acuerdo_employee" OWNER TO postgres;

--
-- Name: SISGDDO_acuerdo_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_acuerdo_employee" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_acuerdo_employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_acuerdo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_acuerdo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_acuerdo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_afectaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_afectaciones" (
    activo boolean NOT NULL,
    numero integer NOT NULL,
    fecha_recepcion timestamp with time zone NOT NULL,
    fechacierre timestamp with time zone,
    afectacion character varying(80) NOT NULL,
    mesplaneado date NOT NULL,
    observacioneshistoricos character varying(250) NOT NULL,
    observacionesactual character varying(250) NOT NULL,
    observacionesfutura character varying(250),
    estado character varying(50) NOT NULL,
    propuesto_id bigint,
    responsable_id integer
);


ALTER TABLE public."SISGDDO_afectaciones" OWNER TO postgres;

--
-- Name: SISGDDO_afectaciones_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_afectaciones" ALTER COLUMN numero ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_afectaciones_numero_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_area" (
    id integer NOT NULL,
    nombre character varying(65),
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_area" OWNER TO postgres;

--
-- Name: SISGDDO_area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_area" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_area_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_auditoria_externa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_externa" (
    registro integer,
    id integer NOT NULL,
    fechainicio date,
    fechafin date,
    titulo character varying(150),
    resultados character varying(150),
    observaciones character varying(250),
    informe character varying(100),
    plan_medidas character varying(100),
    activo boolean NOT NULL,
    entidad_id bigint
);


ALTER TABLE public."SISGDDO_auditoria_externa" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_externa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_auditoria_externa" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_auditoria_externa_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_auditoria_externa_proceso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_externa_proceso" (
    id integer NOT NULL,
    auditoria_externa_id integer NOT NULL,
    process_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_auditoria_externa_proceso" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_externa_proceso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_auditoria_externa_proceso" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_auditoria_externa_proceso_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_auditoria_interna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_interna" (
    id integer NOT NULL,
    fechainicio date,
    fechafin date,
    titulo character varying(150),
    resultados character varying(150),
    objetivos character varying(250),
    alcance character varying(250),
    criterios character varying(250),
    observaciones character varying(250),
    informe character varying(100),
    activo boolean NOT NULL,
    proceso_id bigint
);


ALTER TABLE public."SISGDDO_auditoria_interna" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_interna_equipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_auditoria_interna_equipo" (
    id integer NOT NULL,
    auditoria_interna_id integer NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_auditoria_interna_equipo" OWNER TO postgres;

--
-- Name: SISGDDO_auditoria_interna_equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_auditoria_interna_equipo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_auditoria_interna_equipo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_auditoria_interna_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_auditoria_interna" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_auditoria_interna_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_cambiarlogotipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_cambiarlogotipo" (
    id integer NOT NULL,
    fecha_cambio date NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public."SISGDDO_cambiarlogotipo" OWNER TO postgres;

--
-- Name: SISGDDO_cambiarlogotipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_cambiarlogotipo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_cambiarlogotipo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_conclusion_adicional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_conclusion_adicional" (
    proyecto_ptr_id integer NOT NULL,
    fecha date NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public."SISGDDO_conclusion_adicional" OWNER TO postgres;

--
-- Name: SISGDDO_configuracion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_configuracion" (
    id integer NOT NULL,
    nombre character varying(65),
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_configuracion" OWNER TO postgres;

--
-- Name: SISGDDO_configuracion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_configuracion" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_configuracion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_consecutivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_consecutivo" (
    id integer NOT NULL,
    no character varying(10),
    codigo character varying(10),
    fecha_entrada date NOT NULL,
    nombre_proyecto character varying(250),
    aprobacion_consejo character varying(25),
    fecha_aprobacion date,
    fecha_inicio date NOT NULL,
    fecha_interrupcion date,
    causa_interrupcion character varying(250),
    fecha_terminacion date,
    fecha_extension date,
    fecha_cierre date,
    costo integer NOT NULL,
    observacion character varying(250),
    informe_apertura character varying(100),
    informe_cierre character varying(100),
    activo boolean NOT NULL,
    area_id integer NOT NULL,
    estado_id integer NOT NULL,
    fuente_financiamiento_id integer,
    linea_tematica_id integer,
    tipo_id integer,
    tipo_codigo_id integer
);


ALTER TABLE public."SISGDDO_consecutivo" OWNER TO postgres;

--
-- Name: SISGDDO_consecutivo_formato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_consecutivo_formato" (
    id integer NOT NULL,
    consecutivo_id integer NOT NULL,
    formato_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_consecutivo_formato" OWNER TO postgres;

--
-- Name: SISGDDO_consecutivo_formato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_consecutivo_formato" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_consecutivo_formato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_consecutivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_consecutivo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_consecutivo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_dato_adicional; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_dato_adicional" (
    proyecto_ptr_id integer NOT NULL,
    fecha date NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public."SISGDDO_dato_adicional" OWNER TO postgres;

--
-- Name: SISGDDO_entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_entidad" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_entidad" OWNER TO postgres;

--
-- Name: SISGDDO_entidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_entidad" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_entidad_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_entrada_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_entrada_proyecto" (
    id integer NOT NULL,
    fecha_entrada date NOT NULL,
    fecha_salida date,
    dictamen character varying(100),
    activo boolean NOT NULL,
    entregado_por_id bigint,
    estado_id integer,
    proyecto_id integer
);


ALTER TABLE public."SISGDDO_entrada_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_entrada_proyecto_formato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_entrada_proyecto_formato" (
    id integer NOT NULL,
    entrada_proyecto_id integer NOT NULL,
    formato_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_entrada_proyecto_formato" OWNER TO postgres;

--
-- Name: SISGDDO_entrada_proyecto_formato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_entrada_proyecto_formato" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_entrada_proyecto_formato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_entrada_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_entrada_proyecto" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_entrada_proyecto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_estado_acuerdo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_acuerdo" (
    id integer NOT NULL,
    nombre character varying(25),
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_estado_acuerdo" OWNER TO postgres;

--
-- Name: SISGDDO_estado_acuerdo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_estado_acuerdo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_estado_acuerdo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_estado_cenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_cenda" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_estado_cenda" OWNER TO postgres;

--
-- Name: SISGDDO_estado_cenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_estado_cenda" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_estado_cenda_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_estado_entradas_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_entradas_proyecto" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_estado_entradas_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_estado_entradas_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_estado_entradas_proyecto" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_estado_entradas_proyecto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_estado_indicador_objetivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_indicador_objetivos" (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_estado_indicador_objetivos" OWNER TO postgres;

--
-- Name: SISGDDO_estado_indicador_objetivos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_estado_indicador_objetivos" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_estado_indicador_objetivos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_estado_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_proyecto" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL,
    etapa_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_estado_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_estado_proyecto_dgca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_estado_proyecto_dgca" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_estado_proyecto_dgca" OWNER TO postgres;

--
-- Name: SISGDDO_estado_proyecto_dgca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_estado_proyecto_dgca" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_estado_proyecto_dgca_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_estado_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_estado_proyecto" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_estado_proyecto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_etapa_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_etapa_proyecto" (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_etapa_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_etapa_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_etapa_proyecto" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_etapa_proyecto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_evaluacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_evaluacion" (
    id integer NOT NULL,
    valor character varying(3) NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_evaluacion" OWNER TO postgres;

--
-- Name: SISGDDO_evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_evaluacion" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_evaluacion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_evaluacion_trimestral; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_evaluacion_trimestral" (
    id integer NOT NULL,
    evaluacion_id integer NOT NULL,
    objetivo_id integer NOT NULL,
    periodo_id integer NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_evaluacion_trimestral" OWNER TO postgres;

--
-- Name: SISGDDO_evaluacion_trimestral_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_evaluacion_trimestral" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_evaluacion_trimestral_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_formato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_formato" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_formato" OWNER TO postgres;

--
-- Name: SISGDDO_formato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_formato" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_formato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_fuente_financiamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_fuente_financiamiento" (
    id integer NOT NULL,
    nombre character varying(80) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_fuente_financiamiento" OWNER TO postgres;

--
-- Name: SISGDDO_fuente_financiamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_fuente_financiamiento" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_fuente_financiamiento_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_incidencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_incidencia" (
    id integer NOT NULL,
    titulo character varying(250) NOT NULL,
    fecha_recepcion date NOT NULL,
    fecha_cierre date,
    descripcion character varying(250) NOT NULL,
    respuesta text,
    estado character varying(250),
    activo boolean NOT NULL,
    ejecutante_id bigint,
    procesos_id bigint,
    trabajador_id bigint
);


ALTER TABLE public."SISGDDO_incidencia" OWNER TO postgres;

--
-- Name: SISGDDO_incidencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_incidencia" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_incidencia_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_indicador_objetivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_indicador_objetivos" (
    id integer NOT NULL,
    nombre character varying(150),
    activo boolean NOT NULL,
    objetivo_id integer,
    no character varying(10) NOT NULL
);


ALTER TABLE public."SISGDDO_indicador_objetivos" OWNER TO postgres;

--
-- Name: SISGDDO_indicador_objetivos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_indicador_objetivos" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_indicador_objetivos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_linea_tematica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_linea_tematica" (
    id integer NOT NULL,
    nombre character varying(55) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_linea_tematica" OWNER TO postgres;

--
-- Name: SISGDDO_linea_tematica_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_linea_tematica" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_linea_tematica_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_objetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_objetivo" (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    fecha_definicion date NOT NULL,
    activo boolean NOT NULL,
    no character varying(10) NOT NULL
);


ALTER TABLE public."SISGDDO_objetivo" OWNER TO postgres;

--
-- Name: SISGDDO_objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_objetivo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_objetivo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_periodo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_periodo" (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL,
    orden character varying(3) NOT NULL
);


ALTER TABLE public."SISGDDO_periodo" OWNER TO postgres;

--
-- Name: SISGDDO_permisos_personalizados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_permisos_personalizados" (
    id integer NOT NULL
);


ALTER TABLE public."SISGDDO_permisos_personalizados" OWNER TO postgres;

--
-- Name: SISGDDO_permisos_personalizados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_permisos_personalizados" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_permisos_personalizados_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_plantrabajo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_plantrabajo" (
    activo boolean NOT NULL,
    numero integer NOT NULL,
    nivel character varying(80) NOT NULL
);


ALTER TABLE public."SISGDDO_plantrabajo" OWNER TO postgres;

--
-- Name: SISGDDO_plantrabajo_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_plantrabajo" ALTER COLUMN numero ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_plantrabajo_numero_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_premio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_premio" (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    fecha date NOT NULL,
    archivo character varying(100),
    entidad_id bigint NOT NULL,
    activo boolean NOT NULL,
    descripcion character varying(500)
);


ALTER TABLE public."SISGDDO_premio" OWNER TO postgres;

--
-- Name: SISGDDO_premio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_premio" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_premio_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_prioridad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_prioridad" (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_prioridad" OWNER TO postgres;

--
-- Name: SISGDDO_prioridad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_prioridad" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_prioridad_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_proyecto" (
    id integer NOT NULL,
    no character varying(10),
    codigo character varying(10),
    fecha_entrada date NOT NULL,
    nombre_proyecto character varying(250),
    aprobacion_consejo character varying(25),
    fecha_aprobacion date,
    fecha_inicio date NOT NULL,
    fecha_interrupcion date,
    causa_interrupcion character varying(250),
    fecha_terminacion date,
    fecha_extension date,
    fecha_cierre date,
    costo integer NOT NULL,
    observacion character varying(250),
    informe_apertura character varying(100),
    informe_cierre character varying(100),
    activo boolean NOT NULL,
    area_id integer NOT NULL,
    consecutivo_id integer,
    estado_id integer NOT NULL,
    fuente_financiamiento_id integer,
    linea_tematica_id integer,
    tipo_id integer,
    tipo_codigo_id integer
);


ALTER TABLE public."SISGDDO_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_proyecto_formato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_proyecto_formato" (
    id integer NOT NULL,
    proyecto_id integer NOT NULL,
    formato_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_proyecto_formato" OWNER TO postgres;

--
-- Name: SISGDDO_proyecto_formato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_proyecto_formato" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_proyecto_formato_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_proyecto" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_proyecto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_sosi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_sosi" (
    id integer NOT NULL,
    numero_salva character varying(10) NOT NULL,
    fecha date NOT NULL,
    anno character varying(4),
    autor character varying(50),
    ubicacion_salva character varying(3),
    observaciones character varying(150),
    archivo character varying(100),
    activo boolean NOT NULL,
    consecutivo_id integer,
    especialista_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_sosi" OWNER TO postgres;

--
-- Name: SISGDDO_sosi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_sosi" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_sosi_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_tipo_codigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_tipo_codigo" (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    activo boolean NOT NULL,
    siglas character varying(6) NOT NULL
);


ALTER TABLE public."SISGDDO_tipo_codigo" OWNER TO postgres;

--
-- Name: SISGDDO_tipo_codigo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_tipo_codigo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_tipo_codigo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_tipo_de_obra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_tipo_de_obra" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_tipo_de_obra" OWNER TO postgres;

--
-- Name: SISGDDO_tipo_de_obra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_tipo_de_obra" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_tipo_de_obra_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_tipo_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_tipo_proyecto" (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_tipo_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_tipo_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_tipo_proyecto" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_tipo_proyecto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_trabajador_consecutivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_trabajador_consecutivo" (
    id integer NOT NULL,
    consecutivo_id integer,
    employee_id bigint NOT NULL,
    rol_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_trabajador_consecutivo" OWNER TO postgres;

--
-- Name: SISGDDO_trabajador_consecutivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_trabajador_consecutivo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_trabajador_consecutivo_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_trabajador_proyecto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_trabajador_proyecto" (
    id integer NOT NULL,
    activo boolean NOT NULL,
    employee_id bigint NOT NULL,
    proyecto_id integer NOT NULL,
    rol_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_trabajador_proyecto" OWNER TO postgres;

--
-- Name: SISGDDO_trabajador_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_trabajador_proyecto" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_trabajador_proyecto_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SISGDDO_trimestre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_periodo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_trimestre_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
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

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_country (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    acronym character varying(3) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.base_country OWNER TO postgres;

--
-- Name: base_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_country ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_employee (
    id bigint NOT NULL,
    prefix character varying(15),
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    identification character varying(11),
    active boolean NOT NULL,
    position_id bigint
);


ALTER TABLE public.base_employee OWNER TO postgres;

--
-- Name: base_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_employee ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_entity (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.base_entity OWNER TO postgres;

--
-- Name: base_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_entity ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_infoemployee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_infoemployee (
    id bigint NOT NULL,
    is_reserve boolean NOT NULL,
    init_date_reserve date,
    finish_date_reserve date,
    image_reserve character varying(100),
    spreadsheet_reserve character varying(100),
    is_executive boolean NOT NULL,
    init_date_executive date,
    finish_date_executive date,
    image_executive character varying(100),
    spreadsheet_executive character varying(100),
    employee_id bigint NOT NULL
);


ALTER TABLE public.base_infoemployee OWNER TO postgres;

--
-- Name: base_infoemployee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_infoemployee ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_infoemployee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_logoentity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_logoentity (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    logo1 character varying(100) NOT NULL,
    logo2 character varying(100) NOT NULL
);


ALTER TABLE public.base_logoentity OWNER TO postgres;

--
-- Name: base_logoentity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_logoentity ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_logoentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_position (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.base_position OWNER TO postgres;

--
-- Name: base_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_position ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_procedure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_procedure (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    abbreviation character varying(15) NOT NULL,
    edition character varying(3) NOT NULL,
    revision character varying(3) NOT NULL,
    file character varying(100),
    active boolean NOT NULL,
    process_id bigint NOT NULL
);


ALTER TABLE public.base_procedure OWNER TO postgres;

--
-- Name: base_procedure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_procedure ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_procedure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_process (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    name character varying(150) NOT NULL,
    abbreviation character varying(15) NOT NULL,
    edition character varying(3) NOT NULL,
    revision character varying(3) NOT NULL,
    active boolean NOT NULL,
    responsible_id bigint,
    CONSTRAINT base_process_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.base_process OWNER TO postgres;

--
-- Name: base_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_process ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.captcha_captchastore ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.captcha_captchastore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: complaints_complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaints_complaint (
    id bigint NOT NULL,
    number character varying(15) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    reception_date date NOT NULL,
    deadline date,
    client character varying(255) NOT NULL,
    reason character varying(150) NOT NULL,
    status integer NOT NULL,
    process_id bigint NOT NULL,
    way_of_reception_id bigint NOT NULL,
    CONSTRAINT complaints_complaint_status_check CHECK ((status >= 0))
);


ALTER TABLE public.complaints_complaint OWNER TO postgres;

--
-- Name: complaints_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.complaints_complaint ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.complaints_complaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: complaints_complaintaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaints_complaintaction (
    id bigint NOT NULL,
    date date NOT NULL,
    action character varying(150) NOT NULL,
    complaint_id bigint NOT NULL
);


ALTER TABLE public.complaints_complaintaction OWNER TO postgres;

--
-- Name: complaints_complaintaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.complaints_complaintaction ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.complaints_complaintaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: complaints_wayofreception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complaints_wayofreception (
    id bigint NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.complaints_wayofreception OWNER TO postgres;

--
-- Name: complaints_wayofreception_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.complaints_wayofreception ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.complaints_wayofreception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: effectiveness_effectiveness; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.effectiveness_effectiveness (
    id bigint NOT NULL,
    year integer NOT NULL,
    process_id bigint NOT NULL
);


ALTER TABLE public.effectiveness_effectiveness OWNER TO postgres;

--
-- Name: effectiveness_effectiveness_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.effectiveness_effectiveness ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.effectiveness_effectiveness_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: effectiveness_effectivenesssemester; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.effectiveness_effectivenesssemester (
    id bigint NOT NULL,
    semester smallint NOT NULL,
    effectiveness_id bigint NOT NULL,
    CONSTRAINT effectiveness_effectivenesssemester_semester_check CHECK ((semester >= 0))
);


ALTER TABLE public.effectiveness_effectivenesssemester OWNER TO postgres;

--
-- Name: effectiveness_effectivenesssemester_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.effectiveness_effectivenesssemester ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.effectiveness_effectivenesssemester_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: effectiveness_indicator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.effectiveness_indicator (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.effectiveness_indicator OWNER TO postgres;

--
-- Name: effectiveness_indicator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.effectiveness_indicator ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.effectiveness_indicator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: effectiveness_indicatormeasurer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.effectiveness_indicatormeasurer (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    qualification integer NOT NULL,
    indicator_id bigint NOT NULL,
    CONSTRAINT effectiveness_indicatormeasurer_qualification_check CHECK ((qualification >= 0))
);


ALTER TABLE public.effectiveness_indicatormeasurer OWNER TO postgres;

--
-- Name: effectiveness_indicatormeasurer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.effectiveness_indicatormeasurer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.effectiveness_indicatormeasurer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: effectiveness_semestermeasurer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.effectiveness_semestermeasurer (
    id bigint NOT NULL,
    measurer_id bigint NOT NULL,
    semester_id bigint NOT NULL
);


ALTER TABLE public.effectiveness_semestermeasurer OWNER TO postgres;

--
-- Name: effectiveness_semestermeasurer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.effectiveness_semestermeasurer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.effectiveness_semestermeasurer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_drawingclassification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_drawingclassification (
    id bigint NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.iproperty_drawingclassification OWNER TO postgres;

--
-- Name: iproperty_drawingclassification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_drawingclassification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_drawingclassification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_figurativeelementclassification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_figurativeelementclassification (
    id bigint NOT NULL,
    number character varying(10) NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.iproperty_figurativeelementclassification OWNER TO postgres;

--
-- Name: iproperty_figurativeelementclassification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_figurativeelementclassification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_figurativeelementclassification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_industrialproperty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_industrialproperty (
    id bigint NOT NULL,
    number character varying(15) NOT NULL,
    name character varying(150) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modality integer NOT NULL,
    application_date date NOT NULL,
    application_number character varying(10) NOT NULL,
    status integer NOT NULL,
    certificate_number character varying(10) NOT NULL,
    grant_date date,
    expiration_date date,
    granted_resolution character varying(15),
    observation text,
    file character varying(100),
    country_id bigint NOT NULL,
    type_legal_document_id bigint,
    CONSTRAINT iproperty_industrialproperty_modality_check CHECK ((modality >= 0)),
    CONSTRAINT iproperty_industrialproperty_status_check CHECK ((status >= 0))
);


ALTER TABLE public.iproperty_industrialproperty OWNER TO postgres;

--
-- Name: iproperty_industrialproperty_drawings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_industrialproperty_drawings (
    id integer NOT NULL,
    industrialproperty_id bigint NOT NULL,
    drawingclassification_id bigint NOT NULL
);


ALTER TABLE public.iproperty_industrialproperty_drawings OWNER TO postgres;

--
-- Name: iproperty_industrialproperty_drawings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_industrialproperty_drawings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_industrialproperty_drawings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_industrialproperty_figurative_elements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_industrialproperty_figurative_elements (
    id integer NOT NULL,
    industrialproperty_id bigint NOT NULL,
    figurativeelementclassification_id bigint NOT NULL
);


ALTER TABLE public.iproperty_industrialproperty_figurative_elements OWNER TO postgres;

--
-- Name: iproperty_industrialproperty_figurative_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_industrialproperty_figurative_elements ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_industrialproperty_figurative_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_industrialproperty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_industrialproperty ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_industrialproperty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_industrialproperty_patents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_industrialproperty_patents (
    id integer NOT NULL,
    industrialproperty_id bigint NOT NULL,
    patentclassification_id bigint NOT NULL
);


ALTER TABLE public.iproperty_industrialproperty_patents OWNER TO postgres;

--
-- Name: iproperty_industrialproperty_patents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_industrialproperty_patents ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_industrialproperty_patents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_industrialproperty_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_industrialproperty_products (
    id integer NOT NULL,
    industrialproperty_id bigint NOT NULL,
    productclassification_id bigint NOT NULL
);


ALTER TABLE public.iproperty_industrialproperty_products OWNER TO postgres;

--
-- Name: iproperty_industrialproperty_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_industrialproperty_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_industrialproperty_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_patentclassification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_patentclassification (
    id bigint NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.iproperty_patentclassification OWNER TO postgres;

--
-- Name: iproperty_patentclassification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_patentclassification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_patentclassification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_productclassification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_productclassification (
    id bigint NOT NULL,
    number integer NOT NULL,
    name character varying(150) NOT NULL,
    CONSTRAINT iproperty_productclassification_number_check CHECK ((number >= 0))
);


ALTER TABLE public.iproperty_productclassification OWNER TO postgres;

--
-- Name: iproperty_productclassification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_productclassification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_productclassification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iproperty_typelegaldocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iproperty_typelegaldocument (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.iproperty_typelegaldocument OWNER TO postgres;

--
-- Name: iproperty_typelegaldocument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iproperty_typelegaldocument ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iproperty_typelegaldocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: licenses_license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licenses_license (
    id bigint NOT NULL,
    number character varying(15) NOT NULL,
    name character varying(150) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    grant_date date NOT NULL,
    expiration_date date NOT NULL,
    status integer,
    observation text,
    file character varying(100),
    active boolean NOT NULL,
    associated_process_id bigint,
    entity_id bigint NOT NULL,
    process_id bigint NOT NULL,
    responsible_id bigint NOT NULL,
    CONSTRAINT licenses_license_status_check CHECK ((status >= 0))
);


ALTER TABLE public.licenses_license OWNER TO postgres;

--
-- Name: licenses_license_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.licenses_license ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.licenses_license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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

ALTER TABLE public.notifications_notification ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notifications_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: ProyectoBaseApp_userapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProyectoBaseApp_userapp" (user_ptr_id, uui, image, "referUser", fa2, notificado) FROM stdin;
5	032a3361-7ec8-4d0e-9abb-7a7b0d643bf4	foto/userDefault1.png	\N	f	f
4	a41d3518-41f0-4013-baf1-f3397ed18d35	foto/userDefault1.png	\N	f	f
1	550e8400-e29b-41d4-a716-446655440000		\N	t	t
\.


--
-- Data for Name: SISGDDO_accion_indicador_objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_accion_indicador_objetivo" (id, nombre, activo, indicador_id, no, codigo) FROM stdin;
52	asd	f	80	1	2.1
54	79	f	79	3	1.3
51	82	f	80	1	4.1
53	T1	f	80	4	1.4
\.


--
-- Data for Name: SISGDDO_actividadplan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_actividadplan" (id, descripcion, dia, hora, lugar, preside_id, activo, plan, otro) FROM stdin;
\.


--
-- Data for Name: SISGDDO_actividadplan_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_actividadplan_participantes" (id, actividadplan_id, employee_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_acuerdo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdo" (id, numero, nombre, fecha, fecha_limite, fecha_cumplimiento, observaciones, activo, estado_id) FROM stdin;
15	7	asd	2023-11-26	\N	\N	\N	f	2
14	6	asdasd	2023-11-09	2023-12-28	2023-12-02	\N	f	3
16	8	esto es una pru3^^^^	2023-11-14	2023-12-28	2023-12-02	gygjhggjjjjkk	f	2
1	1	qqqq	2023-11-11	2023-12-27	2023-11-26	sdfg	f	1
2	2	ACD2	2023-10-11	2023-12-29	2023-11-11	asdads	f	3
\.


--
-- Data for Name: SISGDDO_acuerdo_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdo_employee" (id, acuerdo_id, employee_id) FROM stdin;
6	15	1
8	1	1
9	2	1
13	14	1
14	14	2
15	16	2
\.


--
-- Data for Name: SISGDDO_afectaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_afectaciones" (activo, numero, fecha_recepcion, fechacierre, afectacion, mesplaneado, observacioneshistoricos, observacionesactual, observacionesfutura, estado, propuesto_id, responsable_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_area" (id, nombre, activo) FROM stdin;
13	ertert	f
10	dffgnfgh	f
4	prueba	f
8	asd	f
14	Area nueva	f
15	sdf	f
16	jhjk	f
17	111	f
9	sdfsfdxx	f
5	asdasd	f
6	ZZZ	f
1	UDI fg	f
2	a	f
18	sdrgfdfg	f
7	yuii	f
11	34sd	f
3	Desarrollo	f
12	asds	f
\.


--
-- Data for Name: SISGDDO_auditoria_externa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_externa" (registro, id, fechainicio, fechafin, titulo, resultados, observaciones, informe, plan_medidas, activo, entidad_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_auditoria_externa_proceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_externa_proceso" (id, auditoria_externa_id, process_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_auditoria_interna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_interna" (id, fechainicio, fechafin, titulo, resultados, objetivos, alcance, criterios, observaciones, informe, activo, proceso_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_auditoria_interna_equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_interna_equipo" (id, auditoria_interna_id, employee_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_cambiarlogotipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_cambiarlogotipo" (id, fecha_cambio, logo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_conclusion_adicional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_conclusion_adicional" (proyecto_ptr_id, fecha, descripcion) FROM stdin;
\.


--
-- Data for Name: SISGDDO_configuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_configuracion" (id, nombre, activo) FROM stdin;
1	notificado	f
\.


--
-- Data for Name: SISGDDO_consecutivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_consecutivo" (id, no, codigo, fecha_entrada, nombre_proyecto, aprobacion_consejo, fecha_aprobacion, fecha_inicio, fecha_interrupcion, causa_interrupcion, fecha_terminacion, fecha_extension, fecha_cierre, costo, observacion, informe_apertura, informe_cierre, activo, area_id, estado_id, fuente_financiamiento_id, linea_tematica_id, tipo_id, tipo_codigo_id) FROM stdin;
1	1	RED2301	2023-11-03	adad	\N	\N	2023-11-16	\N	\N	2023-11-11	2023-11-28	2023-12-03	111111	\N			t	4	1	1	1	1	1
\.


--
-- Data for Name: SISGDDO_consecutivo_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_consecutivo_formato" (id, consecutivo_id, formato_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: SISGDDO_dato_adicional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_dato_adicional" (proyecto_ptr_id, fecha, descripcion) FROM stdin;
\.


--
-- Data for Name: SISGDDO_descripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_descripcion" (id, descripcion, accion_id, area_id, activo, fecha_creacion) FROM stdin;
30	\N	51	10	t	2023-11-27 23:46:40.647451+01
31	\N	52	8	t	2023-11-27 23:56:37.280763+01
32	fghfgh	52	8	t	2023-11-27 23:57:06.403523+01
33	\N	53	13	t	2023-11-28 04:39:17.582908+01
34	\N	54	6	t	2023-11-28 04:39:29.070344+01
\.


--
-- Data for Name: SISGDDO_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_entidad" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_entrada_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_entrada_proyecto" (id, fecha_entrada, fecha_salida, dictamen, activo, entregado_por_id, estado_id, proyecto_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_entrada_proyecto_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_entrada_proyecto_formato" (id, entrada_proyecto_id, formato_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_estado_acuerdo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_acuerdo" (id, nombre, activo) FROM stdin;
3	Cumplido	f
1	Pendiente	f
2	En proceso	f
\.


--
-- Data for Name: SISGDDO_estado_cenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_cenda" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_estado_entradas_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_entradas_proyecto" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_estado_indicador_objetivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_indicador_objetivos" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_estado_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_proyecto" (id, nombre, activo, etapa_id) FROM stdin;
1	Solicitado	t	1
2	Aprobado	t	1
3	Adelantado	t	2
4	Atraso	t	2
5	En fecha	t	2
6	Interrumpido	t	2
7	Terminado	t	2
8	Cancelado	t	2
9	Reiniciado	t	2
\.


--
-- Data for Name: SISGDDO_estado_proyecto_dgca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_proyecto_dgca" (id, nombre, activo) FROM stdin;
1	Conforme	t
2	No conforme	t
3	Rechazado	t
4	Liberado	t
5	En revisión	t
\.


--
-- Data for Name: SISGDDO_etapa_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_etapa_proyecto" (id, nombre, activo) FROM stdin;
1	Definición	t
2	Ejecución	t
\.


--
-- Data for Name: SISGDDO_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_evaluacion" (id, valor, nombre, activo) FROM stdin;
2	4	4. Casi bien	t
3	3	3. Regular	t
4	2	2. Algo mal	t
5	1	1. Muy mal	t
1	5	5. Muy bien	t
\.


--
-- Data for Name: SISGDDO_evaluacion_trimestral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_evaluacion_trimestral" (id, evaluacion_id, objetivo_id, periodo_id, activo) FROM stdin;
6	5	27	1	f
10	2	27	2	f
7	1	27	3	f
11	1	27	4	f
17	5	28	1	f
18	2	28	2	f
19	1	28	3	f
12	1	28	4	f
\.


--
-- Data for Name: SISGDDO_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_formato" (id, nombre, activo) FROM stdin;
1	APK	t
\.


--
-- Data for Name: SISGDDO_fuente_financiamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_fuente_financiamiento" (id, nombre, activo) FROM stdin;
1	wer	t
\.


--
-- Data for Name: SISGDDO_incidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_incidencia" (id, titulo, fecha_recepcion, fecha_cierre, descripcion, respuesta, estado, activo, ejecutante_id, procesos_id, trabajador_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_indicador_objetivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_indicador_objetivos" (id, nombre, activo, objetivo_id, no) FROM stdin;
80	OT 2	f	29	2
81	sdfsfd	f	28	3
82	NUEVO	f	28	4
79	qwe	f	28	1
\.


--
-- Data for Name: SISGDDO_linea_tematica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_linea_tematica" (id, nombre, activo) FROM stdin;
1	EUA	f
3	Argentina	f
2	Cuba Libre	f
\.


--
-- Data for Name: SISGDDO_objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_objetivo" (id, nombre, fecha_definicion, activo, no) FROM stdin;
27	OE1.2	2023-11-17	f	1
30	O.E. 30	2023-11-10	f	4
28	O.E. 28	2023-11-29	f	2
29	OE10	2023-11-29	f	3
\.


--
-- Data for Name: SISGDDO_periodo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_periodo" (id, nombre, activo, orden) FROM stdin;
1	enero-marzo	t	1
2	abril-junio	t	2
3	julio-septiembre	t	3
4	octubre-diciembre	t	4
\.


--
-- Data for Name: SISGDDO_permisos_personalizados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_permisos_personalizados" (id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_plantrabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_plantrabajo" (activo, numero, nivel) FROM stdin;
\.


--
-- Data for Name: SISGDDO_premio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_premio" (id, nombre, fecha, archivo, entidad_id, activo, descripcion) FROM stdin;
10	P1 2	1990-07-28	premios/P1 2/Unad-ojsImportanciaGestióndelconocimiento.pdf	1	f	Nacimiento Probando
11	fghfgh	2023-11-26		2	f	\N
12	tyu	2023-10-13	premios/tyu/Scrum__Kanban__XP.pdf	2	f	were wrwer werwer
13	Premio nacional a la innovación tecnológica 2022	2023-11-08	premios/Premio nacional a la innovación tecnológica 2022/Adopción_y_uso_de_las_Tecnologí_wVS55va.pdf	2	f	Por si sistema integrado de Comercio electrónico
\.


--
-- Data for Name: SISGDDO_prioridad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_prioridad" (id, nombre, activo) FROM stdin;
1	Área	t
2	CITMATEL	t
3	No priorizado	t
4	Objetivos anuales	t
5	Ramal	t
\.


--
-- Data for Name: SISGDDO_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_proyecto" (id, no, codigo, fecha_entrada, nombre_proyecto, aprobacion_consejo, fecha_aprobacion, fecha_inicio, fecha_interrupcion, causa_interrupcion, fecha_terminacion, fecha_extension, fecha_cierre, costo, observacion, informe_apertura, informe_cierre, activo, area_id, consecutivo_id, estado_id, fuente_financiamiento_id, linea_tematica_id, tipo_id, tipo_codigo_id) FROM stdin;
1	2	RED2301	2023-11-03	adad	\N	\N	2023-11-16	\N	\N	2023-11-11	2023-11-28	2023-12-03	111111	\N			t	4	1	1	1	1	1	1
\.


--
-- Data for Name: SISGDDO_proyecto_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_proyecto_formato" (id, proyecto_id, formato_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: SISGDDO_sosi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_sosi" (id, numero_salva, fecha, anno, autor, ubicacion_salva, observaciones, archivo, activo, consecutivo_id, especialista_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_tipo_codigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_tipo_codigo" (id, nombre, activo, siglas) FROM stdin;
1	Capacitación	t	CAP
2	Comercial	t	COM
3	Desarrollo	t	DES
4	Evento	t	EV
5	I+D	t	I+D
6	Innovación	t	INN
7	Inversión	t	INV
8	Servicio	t	SER
9	Calidad	t	CAL
\.


--
-- Data for Name: SISGDDO_tipo_de_obra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_tipo_de_obra" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_tipo_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_tipo_proyecto" (id, nombre, activo) FROM stdin;
1	fvdfg	t
\.


--
-- Data for Name: SISGDDO_trabajador_consecutivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_trabajador_consecutivo" (id, consecutivo_id, employee_id, rol_id) FROM stdin;
1	1	1	2
\.


--
-- Data for Name: SISGDDO_trabajador_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_trabajador_proyecto" (id, activo, employee_id, proyecto_id, rol_id) FROM stdin;
1	t	1	1	2
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
15	acuerdo
16	registro
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
21	15	136
22	15	137
23	15	138
24	15	135
25	16	143
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add actividad plan	1	add_actividadplan
2	Can change actividad plan	1	change_actividadplan
3	Can delete actividad plan	1	delete_actividadplan
4	Can view actividad plan	1	view_actividadplan
5	Can add area	2	add_area
6	Can change area	2	change_area
7	Can delete area	2	delete_area
8	Can view area	2	view_area
9	Can add cambiar logotipo	3	add_cambiarlogotipo
10	Can change cambiar logotipo	3	change_cambiarlogotipo
11	Can delete cambiar logotipo	3	delete_cambiarlogotipo
12	Can view cambiar logotipo	3	view_cambiarlogotipo
13	Can add consecutivo	4	add_consecutivo
14	Can change consecutivo	4	change_consecutivo
15	Can delete consecutivo	4	delete_consecutivo
16	Can view consecutivo	4	view_consecutivo
17	Can add entidad	5	add_entidad
18	Can change entidad	5	change_entidad
19	Can delete entidad	5	delete_entidad
20	Can view entidad	5	view_entidad
21	Can add estado_acuerdo	6	add_estado_acuerdo
22	Can change estado_acuerdo	6	change_estado_acuerdo
23	Can delete estado_acuerdo	6	delete_estado_acuerdo
24	Can view estado_acuerdo	6	view_estado_acuerdo
25	Can add estado_cenda	7	add_estado_cenda
26	Can change estado_cenda	7	change_estado_cenda
27	Can delete estado_cenda	7	delete_estado_cenda
28	Can view estado_cenda	7	view_estado_cenda
29	Can add estado_entradas_proyecto	8	add_estado_entradas_proyecto
30	Can change estado_entradas_proyecto	8	change_estado_entradas_proyecto
31	Can delete estado_entradas_proyecto	8	delete_estado_entradas_proyecto
32	Can view estado_entradas_proyecto	8	view_estado_entradas_proyecto
33	Can add estado_indicador_objetivos	9	add_estado_indicador_objetivos
34	Can change estado_indicador_objetivos	9	change_estado_indicador_objetivos
35	Can delete estado_indicador_objetivos	9	delete_estado_indicador_objetivos
36	Can view estado_indicador_objetivos	9	view_estado_indicador_objetivos
37	Can add estado_proyecto	10	add_estado_proyecto
38	Can change estado_proyecto	10	change_estado_proyecto
39	Can delete estado_proyecto	10	delete_estado_proyecto
40	Can view estado_proyecto	10	view_estado_proyecto
41	Can add formato	11	add_formato
42	Can change formato	11	change_formato
43	Can delete formato	11	delete_formato
44	Can view formato	11	view_formato
45	Can add fuente_financiamiento	12	add_fuente_financiamiento
46	Can change fuente_financiamiento	12	change_fuente_financiamiento
47	Can delete fuente_financiamiento	12	delete_fuente_financiamiento
48	Can view fuente_financiamiento	12	view_fuente_financiamiento
49	Can add linea_tematica	13	add_linea_tematica
50	Can change linea_tematica	13	change_linea_tematica
51	Can delete linea_tematica	13	delete_linea_tematica
52	Can view linea_tematica	13	view_linea_tematica
53	Can add objetivo	14	add_objetivo
54	Can change objetivo	14	change_objetivo
55	Can delete objetivo	14	delete_objetivo
56	Can view objetivo	14	view_objetivo
57	Can add permisos_personalizados	15	add_permisos_personalizados
58	Can change permisos_personalizados	15	change_permisos_personalizados
59	Can delete permisos_personalizados	15	delete_permisos_personalizados
60	Can view permisos_personalizados	15	view_permisos_personalizados
61	Ver grafico de RRHH	15	grafico_RH
62	Ver grafico de CAP	15	grafico_Cap
63	Ver grafico de C y A	15	grafico_CA
64	Ver grafico de Direccion	15	grafico_D
65	Ver grafico de Inform	15	grafico_I
66	Ver grafico de Admin	15	grafico_Admin
67	Can add proyecto	16	add_proyecto
68	Can change proyecto	16	change_proyecto
69	Can delete proyecto	16	delete_proyecto
70	Can view proyecto	16	view_proyecto
71	Can add tipo_codigo	17	add_tipo_codigo
72	Can change tipo_codigo	17	change_tipo_codigo
73	Can delete tipo_codigo	17	delete_tipo_codigo
74	Can view tipo_codigo	17	view_tipo_codigo
75	Can add tipo_de_obra	18	add_tipo_de_obra
76	Can change tipo_de_obra	18	change_tipo_de_obra
77	Can delete tipo_de_obra	18	delete_tipo_de_obra
78	Can view tipo_de_obra	18	view_tipo_de_obra
79	Can add tipo_proyecto	19	add_tipo_proyecto
80	Can change tipo_proyecto	19	change_tipo_proyecto
81	Can delete tipo_proyecto	19	delete_tipo_proyecto
82	Can view tipo_proyecto	19	view_tipo_proyecto
83	Can add conclusion_adicional	20	add_conclusion_adicional
84	Can change conclusion_adicional	20	change_conclusion_adicional
85	Can delete conclusion_adicional	20	delete_conclusion_adicional
86	Can view conclusion_adicional	20	view_conclusion_adicional
87	Can add dato_adicional	21	add_dato_adicional
88	Can change dato_adicional	21	change_dato_adicional
89	Can delete dato_adicional	21	delete_dato_adicional
90	Can view dato_adicional	21	view_dato_adicional
91	Can add trabajador_proyecto	22	add_trabajador_proyecto
92	Can change trabajador_proyecto	22	change_trabajador_proyecto
93	Can delete trabajador_proyecto	22	delete_trabajador_proyecto
94	Can view trabajador_proyecto	22	view_trabajador_proyecto
95	Can add trabajador_consecutivo	23	add_trabajador_consecutivo
96	Can change trabajador_consecutivo	23	change_trabajador_consecutivo
97	Can delete trabajador_consecutivo	23	delete_trabajador_consecutivo
98	Can view trabajador_consecutivo	23	view_trabajador_consecutivo
99	Can add sosi	24	add_sosi
100	Can change sosi	24	change_sosi
101	Can delete sosi	24	delete_sosi
102	Can view sosi	24	view_sosi
103	Can add premio	25	add_premio
104	Can change premio	25	change_premio
105	Can delete premio	25	delete_premio
106	Can view premio	25	view_premio
107	Can add plan trabajo	26	add_plantrabajo
108	Can change plan trabajo	26	change_plantrabajo
109	Can delete plan trabajo	26	delete_plantrabajo
110	Can view plan trabajo	26	view_plantrabajo
111	Can add indicador_objetivos	27	add_indicador_objetivos
112	Can change indicador_objetivos	27	change_indicador_objetivos
113	Can delete indicador_objetivos	27	delete_indicador_objetivos
114	Can view indicador_objetivos	27	view_indicador_objetivos
115	Can add incidencia	28	add_incidencia
116	Can change incidencia	28	change_incidencia
117	Can delete incidencia	28	delete_incidencia
118	Can view incidencia	28	view_incidencia
119	Can add entrada_proyecto	29	add_entrada_proyecto
120	Can change entrada_proyecto	29	change_entrada_proyecto
121	Can delete entrada_proyecto	29	delete_entrada_proyecto
122	Can view entrada_proyecto	29	view_entrada_proyecto
123	Can add auditoria_interna	30	add_auditoria_interna
124	Can change auditoria_interna	30	change_auditoria_interna
125	Can delete auditoria_interna	30	delete_auditoria_interna
126	Can view auditoria_interna	30	view_auditoria_interna
127	Can add auditoria_externa	31	add_auditoria_externa
128	Can change auditoria_externa	31	change_auditoria_externa
129	Can delete auditoria_externa	31	delete_auditoria_externa
130	Can view auditoria_externa	31	view_auditoria_externa
131	Can add afectaciones	32	add_afectaciones
132	Can change afectaciones	32	change_afectaciones
133	Can delete afectaciones	32	delete_afectaciones
134	Can view afectaciones	32	view_afectaciones
135	Can add acuerdo	33	add_acuerdo
136	Can change acuerdo	33	change_acuerdo
137	Can delete acuerdo	33	delete_acuerdo
138	Can view acuerdo	33	view_acuerdo
139	Can add accion_indicador_objetivo	34	add_accion_indicador_objetivo
140	Can change accion_indicador_objetivo	34	change_accion_indicador_objetivo
141	Can delete accion_indicador_objetivo	34	delete_accion_indicador_objetivo
142	Can view accion_indicador_objetivo	34	view_accion_indicador_objetivo
143	Can add log entry	35	add_logentry
144	Can change log entry	35	change_logentry
145	Can delete log entry	35	delete_logentry
146	Can view log entry	35	view_logentry
147	Can add permission	36	add_permission
148	Can change permission	36	change_permission
149	Can delete permission	36	delete_permission
150	Can view permission	36	view_permission
151	Can add group	37	add_group
152	Can change group	37	change_group
153	Can delete group	37	delete_group
154	Can view group	37	view_group
155	Can add user	38	add_user
156	Can change user	38	change_user
157	Can delete user	38	delete_user
158	Can view user	38	view_user
159	Can add content type	39	add_contenttype
160	Can change content type	39	change_contenttype
161	Can delete content type	39	delete_contenttype
162	Can view content type	39	view_contenttype
163	Can add session	40	add_session
164	Can change session	40	change_session
165	Can delete session	40	delete_session
166	Can view session	40	view_session
167	Can add user app	41	add_userapp
168	Can change user app	41	change_userapp
169	Can delete user app	41	delete_userapp
170	Can view user app	41	view_userapp
171	Can add notification	42	add_notification
172	Can change notification	42	change_notification
173	Can delete notification	42	delete_notification
174	Can view notification	42	view_notification
175	Can add captcha store	43	add_captchastore
176	Can change captcha store	43	change_captchastore
177	Can delete captcha store	43	delete_captchastore
178	Can view captcha store	43	view_captchastore
179	Can add Country	44	add_country
180	Can change Country	44	change_country
181	Can delete Country	44	delete_country
182	Can view Country	44	view_country
183	Can add employee	45	add_employee
184	Can change employee	45	change_employee
185	Can delete employee	45	delete_employee
186	Can view employee	45	view_employee
187	Can add entity	46	add_entity
188	Can change entity	46	change_entity
189	Can delete entity	46	delete_entity
190	Can view entity	46	view_entity
191	Can add logo entity	47	add_logoentity
192	Can change logo entity	47	change_logoentity
193	Can delete logo entity	47	delete_logoentity
194	Can view logo entity	47	view_logoentity
195	Can add position	48	add_position
196	Can change position	48	change_position
197	Can delete position	48	delete_position
198	Can view position	48	view_position
199	Can add process	49	add_process
200	Can change process	49	change_process
201	Can delete process	49	delete_process
202	Can view process	49	view_process
203	Can add procedure	50	add_procedure
204	Can change procedure	50	change_procedure
205	Can delete procedure	50	delete_procedure
206	Can view procedure	50	view_procedure
207	Can add info employee	51	add_infoemployee
208	Can change info employee	51	change_infoemployee
209	Can delete info employee	51	delete_infoemployee
210	Can view info employee	51	view_infoemployee
211	Can add effectiveness	52	add_effectiveness
212	Can change effectiveness	52	change_effectiveness
213	Can delete effectiveness	52	delete_effectiveness
214	Can view effectiveness	52	view_effectiveness
215	Can add effectiveness semester	53	add_effectivenesssemester
216	Can change effectiveness semester	53	change_effectivenesssemester
217	Can delete effectiveness semester	53	delete_effectivenesssemester
218	Can view effectiveness semester	53	view_effectivenesssemester
219	Can add indicator	54	add_indicator
220	Can change indicator	54	change_indicator
221	Can delete indicator	54	delete_indicator
222	Can view indicator	54	view_indicator
223	Can add indicator measurer	55	add_indicatormeasurer
224	Can change indicator measurer	55	change_indicatormeasurer
225	Can delete indicator measurer	55	delete_indicatormeasurer
226	Can view indicator measurer	55	view_indicatormeasurer
227	Can add semester measurer	56	add_semestermeasurer
228	Can change semester measurer	56	change_semestermeasurer
229	Can delete semester measurer	56	delete_semestermeasurer
230	Can view semester measurer	56	view_semestermeasurer
231	Can add license	57	add_license
232	Can change license	57	change_license
233	Can delete license	57	delete_license
234	Can view license	57	view_license
235	Can add way of reception	58	add_wayofreception
236	Can change way of reception	58	change_wayofreception
237	Can delete way of reception	58	delete_wayofreception
238	Can view way of reception	58	view_wayofreception
239	Can add complaint	59	add_complaint
240	Can change complaint	59	change_complaint
241	Can delete complaint	59	delete_complaint
242	Can view complaint	59	view_complaint
243	Can add complaint action	60	add_complaintaction
244	Can change complaint action	60	change_complaintaction
245	Can delete complaint action	60	delete_complaintaction
246	Can view complaint action	60	view_complaintaction
247	Can add drawing classification	61	add_drawingclassification
248	Can change drawing classification	61	change_drawingclassification
249	Can delete drawing classification	61	delete_drawingclassification
250	Can view drawing classification	61	view_drawingclassification
251	Can add figurative element classification	62	add_figurativeelementclassification
252	Can change figurative element classification	62	change_figurativeelementclassification
253	Can delete figurative element classification	62	delete_figurativeelementclassification
254	Can view figurative element classification	62	view_figurativeelementclassification
255	Can add patent classification	63	add_patentclassification
256	Can change patent classification	63	change_patentclassification
257	Can delete patent classification	63	delete_patentclassification
258	Can view patent classification	63	view_patentclassification
259	Can add product classification	64	add_productclassification
260	Can change product classification	64	change_productclassification
261	Can delete product classification	64	delete_productclassification
262	Can view product classification	64	view_productclassification
263	Can add type legal document	65	add_typelegaldocument
264	Can change type legal document	65	change_typelegaldocument
265	Can delete type legal document	65	delete_typelegaldocument
266	Can view type legal document	65	view_typelegaldocument
267	Can add industrial property	66	add_industrialproperty
268	Can change industrial property	66	change_industrialproperty
269	Can delete industrial property	66	delete_industrialproperty
270	Can view industrial property	66	view_industrialproperty
271	Can add accion_area	67	add_accion_area
272	Can change accion_area	67	change_accion_area
273	Can delete accion_area	67	delete_accion_area
274	Can view accion_area	67	view_accion_area
275	Can add descripcion	67	add_descripcion
276	Can change descripcion	67	change_descripcion
277	Can delete descripcion	67	delete_descripcion
278	Can view descripcion	67	view_descripcion
279	Can add evaluacion	68	add_evaluacion
280	Can change evaluacion	68	change_evaluacion
281	Can delete evaluacion	68	delete_evaluacion
282	Can view evaluacion	68	view_evaluacion
283	Can add evaluacion_trimestral	69	add_evaluacion_trimestral
284	Can change evaluacion_trimestral	69	change_evaluacion_trimestral
285	Can delete evaluacion_trimestral	69	delete_evaluacion_trimestral
286	Can view evaluacion_trimestral	69	view_evaluacion_trimestral
287	Can add trimestre	70	add_trimestre
288	Can change trimestre	70	change_trimestre
289	Can delete trimestre	70	delete_trimestre
290	Can view trimestre	70	view_trimestre
291	Can add periodo	70	add_periodo
292	Can change periodo	70	change_periodo
293	Can delete periodo	70	delete_periodo
294	Can view periodo	70	view_periodo
295	Can add configuracion	71	add_configuracion
296	Can change configuracion	71	change_configuracion
297	Can delete configuracion	71	delete_configuracion
298	Can view configuracion	71	view_configuracion
299	Can add etapa_proyecto	72	add_etapa_proyecto
300	Can change etapa_proyecto	72	change_etapa_proyecto
301	Can delete etapa_proyecto	72	delete_etapa_proyecto
302	Can view etapa_proyecto	72	view_etapa_proyecto
303	Can add estado_proyecto_dgca	73	add_estado_proyecto_dgca
304	Can change estado_proyecto_dgca	73	change_estado_proyecto_dgca
305	Can delete estado_proyecto_dgca	73	delete_estado_proyecto_dgca
306	Can view estado_proyecto_dgca	73	view_estado_proyecto_dgca
307	Can add prioridad	74	add_prioridad
308	Can change prioridad	74	change_prioridad
309	Can delete prioridad	74	delete_prioridad
310	Can view prioridad	74	view_prioridad
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4		\N	f	doki123	pastor aleman	mallinois	perro123@citmatel.inf.cu	f	f	2023-11-29 07:58:51.637607+01
5		\N	f	cosy123	cosy	rodriguez	cosy@citmatel.inf.cu	f	f	2023-11-29 14:10:24.610165+01
1	pbkdf2_sha256$390000$PchFvqA6oKI40k8lTN1blL$BHn3WEC8NnnQIE1PNtXL70VXhURSjPSi+Z9lzURWGEk=	2023-11-29 21:17:15.193742+01	t	xavi	Administrador		asd@asd.com	t	t	2023-11-22 22:18:09.063214+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
8	4	143
9	5	151
10	5	158
\.


--
-- Data for Name: base_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_country (id, name, acronym, active) FROM stdin;
\.


--
-- Data for Name: base_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_employee (id, prefix, first_name, last_name, identification, active, position_id) FROM stdin;
1	ad	dfdfg	gghfgh	09665555589	t	2
2	Ing.	Javier	Toussent	90072827569	t	2
\.


--
-- Data for Name: base_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_entity (id, name, active) FROM stdin;
1	CITMATEL	t
2	ISPJAE	t
\.


--
-- Data for Name: base_infoemployee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_infoemployee (id, is_reserve, init_date_reserve, finish_date_reserve, image_reserve, spreadsheet_reserve, is_executive, init_date_executive, finish_date_executive, image_executive, spreadsheet_executive, employee_id) FROM stdin;
\.


--
-- Data for Name: base_logoentity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_logoentity (id, date, logo1, logo2) FROM stdin;
1	2023-11-28 01:55:13.798915+01	logo/1005244.png	logo/NASA.jpg
2	2023-11-28 01:56:10.336939+01	logo/NASA.jpg	logo/1005244.png
\.


--
-- Data for Name: base_position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_position (id, name, active) FROM stdin;
1	sdf	t
2	Jefe de proyecto	t
3	sdff	t
4	asd	t
\.


--
-- Data for Name: base_procedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_procedure (id, name, abbreviation, edition, revision, file, active, process_id) FROM stdin;
\.


--
-- Data for Name: base_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_process (id, "order", name, abbreviation, edition, revision, active, responsible_id) FROM stdin;
\.


--
-- Data for Name: captcha_captchastore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.captcha_captchastore (id, challenge, response, hashkey, expiration) FROM stdin;
\.


--
-- Data for Name: complaints_complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints_complaint (id, number, created_date, reception_date, deadline, client, reason, status, process_id, way_of_reception_id) FROM stdin;
\.


--
-- Data for Name: complaints_complaintaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints_complaintaction (id, date, action, complaint_id) FROM stdin;
\.


--
-- Data for Name: complaints_wayofreception; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints_wayofreception (id, name) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-11-22 22:18:17.51278+01			4	127.0.0.1	38	1
2	2023-11-23 01:39:57.632391+01	1	UDI	1	127.0.0.1	2	1
3	2023-11-23 01:42:20.99237+01	2	Multimedia	1	127.0.0.1	2	1
4	2023-11-23 01:42:26.899434+01	3	Desarrollo	1	127.0.0.1	2	1
5	2023-11-23 01:48:46.42896+01	1	UDI	3	127.0.0.1	2	1
6	2023-11-23 01:48:55.903191+01	2	Multimedia	3	127.0.0.1	2	1
7	2023-11-23 01:52:01.55161+01	4	prueba	1	127.0.0.1	2	1
8	2023-11-23 03:38:59.58654+01	5	asdasd	1	127.0.0.1	2	1
9	2023-11-23 03:39:25.259562+01	6	ert	1	127.0.0.1	2	1
10	2023-11-23 03:39:46.075541+01	7	yuii	1	127.0.0.1	2	1
11	2023-11-23 05:33:35.12314+01	8	asd	1	127.0.0.1	2	1
12	2023-11-23 05:35:33.479165+01	1	sdfsdf	1	127.0.0.1	34	1
13	2023-11-23 05:38:04.493869+01	2	vcb	1	127.0.0.1	34	1
14	2023-11-23 06:09:33.025279+01	1	sdf	0	127.0.0.1	27	1
15	2023-11-23 06:14:10.61846+01	10	ghfgh	1	127.0.0.1	27	1
16	2023-11-23 06:15:48.976148+01	3	etgfdfg	1	127.0.0.1	34	1
17	2023-11-23 06:16:19.037847+01	11	OT1	1	127.0.0.1	27	1
18	2023-11-23 07:16:31.084842+01	20	5 - 2023 - uyi	1	127.0.0.1	14	1
19	2023-11-23 07:17:15.808616+01	4	Tarea jabsdkjb jbasd	1	127.0.0.1	34	1
20	2023-11-23 07:18:31.556011+01	5	Tarea 2	1	127.0.0.1	34	1
21	2023-11-23 07:18:52.275066+01	12	OT1	1	127.0.0.1	27	1
22	2023-11-23 07:19:14.935459+01	13	OT2	1	127.0.0.1	27	1
23	2023-11-23 07:19:42.600028+01	21	1 - 2023 - OE1	1	127.0.0.1	14	1
24	2023-11-23 07:20:39.692783+01	21	1 - 2023 - OE1	0	127.0.0.1	14	1
25	2023-11-23 15:41:24.229901+01			4	127.0.0.1	38	1
26	2023-11-23 16:03:28.416821+01	6	TAnays	1	127.0.0.1	34	1
27	2023-11-23 16:03:46.195303+01	6	TAnays	0	127.0.0.1	34	1
28	2023-11-23 16:10:41.743835+01	14	sdfdf	1	127.0.0.1	27	1
29	2023-11-23 16:17:20.095136+01	14	sdfdf	0	127.0.0.1	27	1
30	2023-11-23 16:19:27.875853+01	21	1 - 2023 - OE1	0	127.0.0.1	14	1
31	2023-11-23 16:27:16.323755+01	22	2 - 2023 - lt9	1	127.0.0.1	14	1
32	2023-11-23 16:27:22.724412+01	22	2 - 2023 - lt9	0	127.0.0.1	14	1
33	2023-11-23 16:30:17.52849+01	15	er	1	127.0.0.1	27	1
34	2023-11-23 16:36:59.671839+01	12	OT1	0	127.0.0.1	27	1
35	2023-11-23 17:29:44.672935+01	1	sdf	1	127.0.0.1	48	1
36	2023-11-23 17:32:44.989354+01	1	fhfhgh	1	127.0.0.1	6	1
37	2023-11-23 17:33:04.005412+01	1	1 rhrh	1	127.0.0.1	33	1
38	2023-11-23 17:43:10.052152+01	1	1 qqqq	2	127.0.0.1	33	1
39	2023-11-23 17:49:34.404827+01	1	1 qqqq	2	127.0.0.1	33	1
40	2023-11-23 17:49:37.668876+01	1	1 qqqq	0	127.0.0.1	33	1
41	2023-11-23 17:52:37.858597+01	1	1 qqqq	3	127.0.0.1	33	1
42	2023-11-23 17:58:19.726214+01	2	Jefe de proyecto	1	127.0.0.1	48	1
43	2023-11-23 18:14:20.099142+01	1	fvdfg	1	127.0.0.1	19	1
44	2023-11-23 18:14:36.509059+01	1	Redes	1	127.0.0.1	17	1
45	2023-11-23 18:14:49.921038+01	1	APK	1	127.0.0.1	11	1
46	2023-11-23 18:54:40.480355+01	1	sddf	1	127.0.0.1	13	1
47	2023-11-23 18:55:06.137623+01	1	wer	1	127.0.0.1	12	1
48	2023-11-23 18:55:15.301475+01	1	fghfgh	1	127.0.0.1	10	1
49	2023-11-23 18:55:57.104436+01	1	RED2301 adad	1	127.0.0.1	4	1
50	2023-11-23 18:55:57.147998+01	1	RED2301 adad	1	127.0.0.1	4	1
51	2023-11-24 00:33:26.921748+01			4	127.0.0.1	38	1
52	2023-11-24 00:34:34.174874+01	3	sdff	1	127.0.0.1	48	1
53	2023-11-24 01:00:08.616075+01	9	sdfsfd	1	127.0.0.1	2	1
54	2023-11-24 01:37:44.706019+01	4	asd	1	127.0.0.1	48	1
55	2023-11-24 01:46:24.081278+01	10	dffgnfgh	1	127.0.0.1	2	1
56	2023-11-24 01:51:29.330039+01	11	34sd	1	127.0.0.1	2	1
57	2023-11-24 02:46:20.160932+01	12	asds	1	127.0.0.1	2	1
58	2023-11-24 02:48:51.56406+01	13	ertert	1	127.0.0.1	2	1
59	2023-11-24 05:39:11.288345+01	16	sdf	1	127.0.0.1	27	1
60	2023-11-24 05:43:08.186384+01	17	asd	1	127.0.0.1	27	1
61	2023-11-24 05:48:07.894303+01	12	OT1	0	127.0.0.1	27	1
62	2023-11-24 05:49:36.860421+01	12	OT1	0	127.0.0.1	27	1
63	2023-11-24 05:49:53.435298+01	12	OT1	0	127.0.0.1	27	1
64	2023-11-24 05:50:12.434862+01	12	OT1	0	127.0.0.1	27	1
65	2023-11-24 17:39:07.467188+01			4	127.0.0.1	38	1
66	2023-11-24 18:10:16.86732+01			4	127.0.0.1	38	1
67	2023-11-24 18:34:35.743718+01	7	asd	1	127.0.0.1	34	1
68	2023-11-24 18:36:09.586293+01	8	asd	1	127.0.0.1	34	1
69	2023-11-24 18:36:52.008259+01	9	asd	1	127.0.0.1	34	1
70	2023-11-24 18:41:32.343464+01	10	asd	1	127.0.0.1	34	1
71	2023-11-24 18:43:27.889517+01	11	asd	1	127.0.0.1	34	1
72	2023-11-24 18:54:52.998504+01	12	asd	1	127.0.0.1	34	1
73	2023-11-24 19:04:37.366634+01	13	asd	1	127.0.0.1	34	1
74	2023-11-24 19:05:04.873357+01	18	asd	1	127.0.0.1	27	1
75	2023-11-24 19:09:23.225042+01	18	asd	3	127.0.0.1	27	1
76	2023-11-24 19:21:40.954027+01	14	asd	1	127.0.0.1	34	1
77	2023-11-24 19:24:40.850867+01	15	asd	1	127.0.0.1	34	1
78	2023-11-24 20:02:12.824776+01	57	ot1	1	127.0.0.1	27	1
79	2023-11-24 20:15:49.098001+01	16	we	1	127.0.0.1	34	1
80	2023-11-24 20:16:39.153883+01	17	adf	1	127.0.0.1	34	1
81	2023-11-24 20:20:07.472834+01	18	yui	1	127.0.0.1	34	1
82	2023-11-24 20:20:28.128514+01	19	bnm	1	127.0.0.1	34	1
83	2023-11-24 20:22:33.263776+01	20	dfds	1	127.0.0.1	34	1
84	2023-11-24 20:24:53.218524+01	59	ewr	1	127.0.0.1	27	1
85	2023-11-24 20:25:25.00008+01	59	ewr	0	127.0.0.1	27	1
86	2023-11-24 20:25:40.324567+01	60	yui	1	127.0.0.1	27	1
87	2023-11-24 20:30:18.624815+01	62	bn	1	127.0.0.1	27	1
88	2023-11-24 20:32:07.102705+01	63	rty	1	127.0.0.1	27	1
89	2023-11-24 20:33:42.481806+01	64	vbvbn	1	127.0.0.1	27	1
90	2023-11-24 20:34:12.461906+01	21	asd	1	127.0.0.1	34	1
91	2023-11-24 20:34:40.258014+01	65	qwe	1	127.0.0.1	27	1
92	2023-11-24 20:35:27.061196+01	22	nb	1	127.0.0.1	34	1
93	2023-11-24 20:35:38.727055+01	66	qweqwe	1	127.0.0.1	27	1
94	2023-11-24 20:45:25.52023+01	67	asdasd	1	127.0.0.1	27	1
95	2023-11-24 20:45:50.176026+01	68	sdf	1	127.0.0.1	27	1
96	2023-11-24 20:51:45.660081+01	72	qwet	1	127.0.0.1	27	1
97	2023-11-24 20:53:46.598839+01	73	CVBCVB	1	127.0.0.1	27	1
98	2023-11-24 20:55:10.417306+01	74	fgh	1	127.0.0.1	27	1
99	2023-11-24 20:57:02.484628+01	75	bnmbnm	1	127.0.0.1	27	1
100	2023-11-24 20:57:33.984175+01	23	T1	1	127.0.0.1	34	1
101	2023-11-24 20:57:41.21966+01	24	T2	1	127.0.0.1	34	1
102	2023-11-24 20:57:48.374579+01	25	T3	1	127.0.0.1	34	1
103	2023-11-24 20:57:57.562674+01	26	T4	1	127.0.0.1	34	1
104	2023-11-24 20:58:18.879297+01	27	T5	1	127.0.0.1	34	1
105	2023-11-24 20:58:37.393433+01	76	OT1	1	127.0.0.1	27	1
106	2023-11-24 20:58:48.085387+01	77	OT2	1	127.0.0.1	27	1
107	2023-11-24 20:58:56.799587+01	78	OT3	1	127.0.0.1	27	1
108	2023-11-24 21:25:23.582731+01	23	1 - 2023 - sdf	1	127.0.0.1	14	1
109	2023-11-24 21:28:33.785572+01	24	2 - 2023 - asd	1	127.0.0.1	14	1
110	2023-11-24 22:00:54.354379+01	26	3 - 2023 - asd3	1	127.0.0.1	14	1
111	2023-11-24 22:03:35.085346+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
112	2023-11-24 22:04:24.714155+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
113	2023-11-24 22:04:27.253869+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
114	2023-11-24 22:07:16.227635+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
115	2023-11-24 22:07:22.826598+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
116	2023-11-24 22:07:38.398715+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
117	2023-11-24 22:13:12.154851+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
118	2023-11-24 22:13:22.827973+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
119	2023-11-24 22:13:25.175848+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
120	2023-11-24 22:15:43.242379+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
121	2023-11-24 22:15:47.982539+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
122	2023-11-24 22:15:51.558025+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
123	2023-11-24 22:15:53.931468+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
124	2023-11-24 22:15:59.869227+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
125	2023-11-24 22:16:05.82605+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
126	2023-11-24 22:16:37.721603+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
127	2023-11-24 22:16:39.006202+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
128	2023-11-24 22:16:46.069877+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
129	2023-11-24 22:25:27.656692+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
130	2023-11-24 22:25:32.409189+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
131	2023-11-24 22:25:34.836097+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
132	2023-11-24 22:26:08.841482+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
133	2023-11-24 22:26:36.908361+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
134	2023-11-24 22:26:55.726314+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
135	2023-11-24 22:27:13.572385+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
136	2023-11-24 22:27:17.121907+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
137	2023-11-24 22:27:24.282903+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
138	2023-11-24 22:27:26.664516+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
139	2023-11-24 22:27:43.411477+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
140	2023-11-24 22:28:02.320715+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
141	2023-11-24 22:28:29.24226+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
142	2023-11-24 22:28:42.179149+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
143	2023-11-24 22:29:29.727863+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
144	2023-11-24 22:32:31.910904+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
145	2023-11-24 22:32:34.31443+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
146	2023-11-24 22:32:50.015143+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
147	2023-11-24 22:32:52.377906+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
148	2023-11-24 22:32:54.728227+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
149	2023-11-24 22:32:58.337763+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
150	2023-11-24 22:33:03.06234+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
151	2023-11-24 22:33:05.429027+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
152	2023-11-24 22:33:14.950032+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
153	2023-11-24 22:33:24.363075+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
154	2023-11-24 22:33:44.361934+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
155	2023-11-24 22:33:54.976615+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
156	2023-11-24 22:34:02.03562+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
157	2023-11-24 22:34:04.420483+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
158	2023-11-24 22:34:10.331419+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
159	2023-11-24 22:34:28.31338+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
160	2023-11-24 22:34:31.066259+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
161	2023-11-24 22:35:13.269875+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
162	2023-11-24 22:35:19.179712+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
163	2023-11-24 22:35:21.707513+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
164	2023-11-24 22:44:16.042159+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
165	2023-11-24 22:44:20.13724+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
166	2023-11-24 22:44:26.444092+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
167	2023-11-24 22:44:37.336574+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
168	2023-11-24 22:46:16.858701+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
169	2023-11-24 22:46:22.834286+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
170	2023-11-24 22:46:27.538627+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
171	2023-11-24 22:47:41.75249+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
172	2023-11-24 22:47:49.875324+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
173	2023-11-24 22:47:58.236709+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
174	2023-11-24 22:48:24.41709+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
175	2023-11-24 22:48:32.665892+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
176	2023-11-24 22:48:37.602485+01	24	2 - 2023 - asd	0	127.0.0.1	14	1
177	2023-11-24 22:48:59.045066+01	24	2 - 2023 - asd	0	127.0.0.1	14	1
178	2023-11-24 22:49:15.219302+01	24	2 - 2023 - asd	0	127.0.0.1	14	1
179	2023-11-24 22:49:17.663388+01	24	2 - 2023 - asd	0	127.0.0.1	14	1
180	2023-11-24 22:49:24.41669+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
181	2023-11-24 22:49:34.878947+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
182	2023-11-24 22:49:46.288104+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
183	2023-11-24 22:50:48.158701+01	24	2 - 2023 - asd	0	127.0.0.1	14	1
184	2023-11-24 22:52:56.251633+01	77	OT2	0	127.0.0.1	27	1
185	2023-11-24 22:53:34.970939+01	77	OT2	0	127.0.0.1	27	1
186	2023-11-24 22:53:37.371697+01	77	OT2	0	127.0.0.1	27	1
187	2023-11-24 22:53:43.266755+01	77	OT2	0	127.0.0.1	27	1
188	2023-11-24 22:53:49.185739+01	77	OT2	0	127.0.0.1	27	1
189	2023-11-24 22:53:52.763473+01	77	OT2	0	127.0.0.1	27	1
190	2023-11-24 22:54:00.196674+01	77	OT2	0	127.0.0.1	27	1
191	2023-11-24 22:55:01.517627+01	77	OT2	0	127.0.0.1	27	1
192	2023-11-24 22:55:05.033422+01	77	OT2	0	127.0.0.1	27	1
193	2023-11-24 22:55:07.4696+01	77	OT2	0	127.0.0.1	27	1
194	2023-11-24 22:55:11.061044+01	77	OT2	0	127.0.0.1	27	1
195	2023-11-24 22:55:18.100316+01	77	OT2	0	127.0.0.1	27	1
196	2023-11-24 22:55:25.135212+01	77	OT2	0	127.0.0.1	27	1
197	2023-11-24 22:55:34.609411+01	77	OT2	0	127.0.0.1	27	1
198	2023-11-24 22:55:39.311003+01	77	OT2	0	127.0.0.1	27	1
199	2023-11-24 22:55:47.598987+01	77	OT2	0	127.0.0.1	27	1
200	2023-11-24 22:56:04.024306+01	77	OT2	0	127.0.0.1	27	1
201	2023-11-24 22:56:06.42438+01	77	OT2	0	127.0.0.1	27	1
202	2023-11-24 22:56:13.486241+01	77	OT2	0	127.0.0.1	27	1
203	2023-11-24 22:56:37.744579+01	77	OT2	0	127.0.0.1	27	1
204	2023-11-24 22:56:50.31644+01	77	OT2	0	127.0.0.1	27	1
205	2023-11-24 22:56:58.563088+01	77	OT2	0	127.0.0.1	27	1
206	2023-11-24 22:57:14.089172+01	77	OT2	0	127.0.0.1	27	1
207	2023-11-24 22:57:26.32057+01	77	OT2	0	127.0.0.1	27	1
208	2023-11-24 22:57:46.056887+01	77	OT2	0	127.0.0.1	27	1
209	2023-11-24 22:58:06.503976+01	77	OT2	0	127.0.0.1	27	1
210	2023-11-24 22:58:22.384556+01	77	OT2	0	127.0.0.1	27	1
211	2023-11-24 22:59:26.363008+01	77	OT2	0	127.0.0.1	27	1
212	2023-11-24 22:59:40.160711+01	77	OT2	0	127.0.0.1	27	1
213	2023-11-24 23:00:12.720496+01	77	OT2	0	127.0.0.1	27	1
214	2023-11-24 23:00:16.550023+01	77	OT2	0	127.0.0.1	27	1
215	2023-11-24 23:00:20.939483+01	77	OT2	0	127.0.0.1	27	1
216	2023-11-24 23:00:31.832169+01	77	OT2	0	127.0.0.1	27	1
217	2023-11-24 23:00:49.291763+01	77	OT2	0	127.0.0.1	27	1
218	2023-11-24 23:01:02.184798+01	77	OT2	0	127.0.0.1	27	1
219	2023-11-24 23:01:15.624228+01	77	OT2	0	127.0.0.1	27	1
220	2023-11-24 23:01:18.134694+01	77	OT2	0	127.0.0.1	27	1
221	2023-11-24 23:01:26.106619+01	77	OT2	0	127.0.0.1	27	1
222	2023-11-24 23:01:51.584701+01	77	OT2	0	127.0.0.1	27	1
223	2023-11-24 23:01:55.075933+01	77	OT2	0	127.0.0.1	27	1
224	2023-11-24 23:01:58.667014+01	77	OT2	0	127.0.0.1	27	1
225	2023-11-24 23:02:01.057901+01	77	OT2	0	127.0.0.1	27	1
226	2023-11-24 23:02:05.765048+01	77	OT2	0	127.0.0.1	27	1
227	2023-11-24 23:02:10.504601+01	77	OT2	0	127.0.0.1	27	1
228	2023-11-24 23:02:11.709074+01	77	OT2	0	127.0.0.1	27	1
229	2023-11-24 23:02:15.274427+01	77	OT2	0	127.0.0.1	27	1
230	2023-11-24 23:02:19.991135+01	77	OT2	0	127.0.0.1	27	1
231	2023-11-24 23:02:29.645364+01	77	OT2	0	127.0.0.1	27	1
232	2023-11-24 23:02:44.009273+01	77	OT2	0	127.0.0.1	27	1
233	2023-11-24 23:02:47.54942+01	77	OT2	0	127.0.0.1	27	1
234	2023-11-24 23:02:49.965391+01	77	OT2	0	127.0.0.1	27	1
235	2023-11-24 23:02:52.359376+01	77	OT2	0	127.0.0.1	27	1
236	2023-11-24 23:02:55.883186+01	77	OT2	0	127.0.0.1	27	1
237	2023-11-24 23:02:59.518102+01	77	OT2	0	127.0.0.1	27	1
238	2023-11-24 23:03:04.387662+01	77	OT2	0	127.0.0.1	27	1
239	2023-11-24 23:03:21.146618+01	77	OT2	0	127.0.0.1	27	1
240	2023-11-24 23:03:23.494084+01	77	OT2	0	127.0.0.1	27	1
241	2023-11-24 23:03:25.93772+01	77	OT2	0	127.0.0.1	27	1
242	2023-11-24 23:03:28.336986+01	77	OT2	0	127.0.0.1	27	1
243	2023-11-24 23:03:49.43003+01	77	OT2	0	127.0.0.1	27	1
244	2023-11-24 23:03:56.523269+01	77	OT2	0	127.0.0.1	27	1
245	2023-11-24 23:04:02.441261+01	77	OT2	0	127.0.0.1	27	1
246	2023-11-24 23:04:15.361141+01	77	OT2	0	127.0.0.1	27	1
247	2023-11-24 23:04:29.401043+01	77	OT2	0	127.0.0.1	27	1
248	2023-11-24 23:04:36.514005+01	77	OT2	0	127.0.0.1	27	1
249	2023-11-24 23:04:38.92581+01	77	OT2	0	127.0.0.1	27	1
250	2023-11-24 23:04:42.517287+01	77	OT2	0	127.0.0.1	27	1
251	2023-11-24 23:04:48.467639+01	77	OT2	0	127.0.0.1	27	1
252	2023-11-24 23:04:50.837054+01	77	OT2	0	127.0.0.1	27	1
253	2023-11-24 23:04:54.449428+01	77	OT2	0	127.0.0.1	27	1
254	2023-11-24 23:04:56.815869+01	77	OT2	0	127.0.0.1	27	1
255	2023-11-24 23:05:01.590295+01	77	OT2	0	127.0.0.1	27	1
256	2023-11-24 23:05:06.3641+01	77	OT2	0	127.0.0.1	27	1
257	2023-11-24 23:05:08.742238+01	77	OT2	0	127.0.0.1	27	1
258	2023-11-24 23:05:19.326101+01	77	OT2	0	127.0.0.1	27	1
259	2023-11-24 23:05:31.134394+01	77	OT2	0	127.0.0.1	27	1
260	2023-11-24 23:05:33.578372+01	77	OT2	0	127.0.0.1	27	1
261	2023-11-24 23:05:40.953178+01	77	OT2	0	127.0.0.1	27	1
262	2023-11-24 23:05:44.537016+01	77	OT2	0	127.0.0.1	27	1
263	2023-11-24 23:05:46.939544+01	77	OT2	0	127.0.0.1	27	1
264	2023-11-24 23:05:50.470518+01	77	OT2	0	127.0.0.1	27	1
265	2023-11-24 23:07:30.480743+01	77	OT2	0	127.0.0.1	27	1
266	2023-11-24 23:07:34.968157+01	78	OT3	0	127.0.0.1	27	1
267	2023-11-24 23:07:52.345946+01	78	OT3	0	127.0.0.1	27	1
268	2023-11-24 23:08:04.097873+01	78	OT3	0	127.0.0.1	27	1
269	2023-11-24 23:08:06.471631+01	78	OT3	0	127.0.0.1	27	1
270	2023-11-24 23:08:13.539167+01	78	OT3	0	127.0.0.1	27	1
271	2023-11-24 23:08:14.768759+01	78	OT3	0	127.0.0.1	27	1
272	2023-11-24 23:08:17.155919+01	78	OT3	0	127.0.0.1	27	1
273	2023-11-24 23:08:19.582394+01	78	OT3	0	127.0.0.1	27	1
274	2023-11-24 23:08:30.463701+01	78	OT3	0	127.0.0.1	27	1
275	2023-11-24 23:08:40.076801+01	78	OT3	0	127.0.0.1	27	1
276	2023-11-24 23:08:41.628563+01	78	OT3	0	127.0.0.1	27	1
277	2023-11-24 23:08:45.19232+01	78	OT3	0	127.0.0.1	27	1
278	2023-11-24 23:09:00.758448+01	78	OT3	0	127.0.0.1	27	1
279	2023-11-24 23:09:07.874568+01	78	OT3	0	127.0.0.1	27	1
280	2023-11-24 23:10:48.855579+01	23	T1	0	127.0.0.1	34	1
281	2023-11-24 23:12:23.978739+01	23	T1	0	127.0.0.1	34	1
282	2023-11-24 23:12:59.964206+01	23	T1	0	127.0.0.1	34	1
283	2023-11-24 23:13:19.259027+01	23	T1	0	127.0.0.1	34	1
284	2023-11-24 23:13:21.651284+01	23	T1	0	127.0.0.1	34	1
285	2023-11-24 23:13:36.178012+01	23	T1	0	127.0.0.1	34	1
286	2023-11-24 23:13:47.890963+01	23	T1	0	127.0.0.1	34	1
287	2023-11-24 23:13:51.438049+01	23	T1	0	127.0.0.1	34	1
288	2023-11-24 23:13:56.210076+01	23	T1	0	127.0.0.1	34	1
289	2023-11-24 23:14:00.956986+01	23	T1	0	127.0.0.1	34	1
290	2023-11-24 23:14:11.780733+01	23	T1	0	127.0.0.1	34	1
291	2023-11-24 23:17:08.845945+01	23	T1	0	127.0.0.1	34	1
292	2023-11-24 23:19:31.366701+01	23	T1	0	127.0.0.1	34	1
293	2023-11-24 23:19:47.45839+01	23	T1	0	127.0.0.1	34	1
294	2023-11-24 23:19:58.610568+01	23	T1	0	127.0.0.1	34	1
295	2023-11-24 23:20:15.727558+01	23	T1	0	127.0.0.1	34	1
296	2023-11-24 23:38:33.219396+01	23	T1	0	127.0.0.1	34	1
297	2023-11-24 23:40:34.236341+01	23	T1	0	127.0.0.1	34	1
298	2023-11-24 23:41:06.110664+01	23	T1	0	127.0.0.1	34	1
299	2023-11-24 23:41:37.08738+01	23	T1	0	127.0.0.1	34	1
300	2023-11-25 00:35:48.49979+01	23	T1	0	127.0.0.1	34	1
301	2023-11-25 00:37:08.015746+01	23	T1	0	127.0.0.1	34	1
302	2023-11-25 00:37:13.957069+01	23	T1	0	127.0.0.1	34	1
303	2023-11-25 00:37:22.270854+01	23	T1	0	127.0.0.1	34	1
304	2023-11-25 00:37:27.059018+01	23	T1	0	127.0.0.1	34	1
305	2023-11-25 00:37:30.621365+01	23	T1	0	127.0.0.1	34	1
306	2023-11-25 00:37:33.059212+01	23	T1	0	127.0.0.1	34	1
307	2023-11-25 00:37:35.487699+01	23	T1	0	127.0.0.1	34	1
308	2023-11-25 00:38:50.868018+01	26	T4	0	127.0.0.1	34	1
309	2023-11-25 00:39:01.90705+01	26	T4	0	127.0.0.1	34	1
310	2023-11-25 00:41:30.097975+01	26	T4	0	127.0.0.1	34	1
311	2023-11-25 00:41:40.655253+01	26	T4	0	127.0.0.1	34	1
312	2023-11-25 00:41:51.248614+01	26	T4	0	127.0.0.1	34	1
313	2023-11-25 00:41:53.670954+01	26	T4	0	127.0.0.1	34	1
314	2023-11-25 00:41:58.475496+01	26	T4	0	127.0.0.1	34	1
315	2023-11-25 00:42:13.690383+01	26	T4	0	127.0.0.1	34	1
316	2023-11-25 00:51:15.267909+01	26	T4	0	127.0.0.1	34	1
317	2023-11-25 00:51:22.93318+01	26	T4	0	127.0.0.1	34	1
318	2023-11-25 00:52:08.980698+01	26	T4	0	127.0.0.1	34	1
319	2023-11-25 00:53:18.417573+01	26	T4	0	127.0.0.1	34	1
320	2023-11-25 00:53:24.310925+01	26	T4	0	127.0.0.1	34	1
321	2023-11-25 00:53:41.660167+01	26	T4	0	127.0.0.1	34	1
322	2023-11-25 00:53:55.996024+01	26	T4	0	127.0.0.1	34	1
323	2023-11-25 00:54:02.418761+01	26	T4	0	127.0.0.1	34	1
324	2023-11-25 00:54:08.748493+01	26	T4	0	127.0.0.1	34	1
325	2023-11-25 00:54:23.506024+01	26	T4	0	127.0.0.1	34	1
326	2023-11-25 00:54:27.487117+01	26	T4	0	127.0.0.1	34	1
327	2023-11-25 00:57:06.011229+01	23	T1	0	127.0.0.1	34	1
328	2023-11-25 00:58:06.361739+01	23	T1	0	127.0.0.1	34	1
329	2023-11-25 00:58:47.607155+01	23	T1	0	127.0.0.1	34	1
330	2023-11-25 00:58:55.047795+01	23	T1	0	127.0.0.1	34	1
331	2023-11-25 01:03:02.98619+01	23	T1	0	127.0.0.1	34	1
332	2023-11-25 01:03:53.845193+01	23	T1	0	127.0.0.1	34	1
333	2023-11-25 01:04:06.501963+01	23	T1	0	127.0.0.1	34	1
334	2023-11-25 01:04:21.346075+01	23	T1	0	127.0.0.1	34	1
335	2023-11-25 01:04:43.959124+01	23	T1	0	127.0.0.1	34	1
336	2023-11-25 01:05:14.566087+01	23	T1	0	127.0.0.1	34	1
337	2023-11-25 01:05:16.974363+01	23	T1	0	127.0.0.1	34	1
338	2023-11-25 01:05:19.488931+01	23	T1	0	127.0.0.1	34	1
339	2023-11-25 01:05:24.414008+01	23	T1	0	127.0.0.1	34	1
340	2023-11-25 01:05:26.798747+01	23	T1	0	127.0.0.1	34	1
341	2023-11-25 01:05:29.297469+01	23	T1	0	127.0.0.1	34	1
342	2023-11-25 01:06:18.782113+01	23	T1	0	127.0.0.1	34	1
343	2023-11-25 01:06:22.372163+01	23	T1	0	127.0.0.1	34	1
344	2023-11-25 01:06:29.445181+01	23	T1	0	127.0.0.1	34	1
345	2023-11-25 01:06:33.220955+01	23	T1	0	127.0.0.1	34	1
346	2023-11-25 01:06:38.060374+01	23	T1	0	127.0.0.1	34	1
347	2023-11-25 01:06:40.442045+01	23	T1	0	127.0.0.1	34	1
348	2023-11-25 01:06:42.866228+01	23	T1	0	127.0.0.1	34	1
349	2023-11-25 01:06:46.475808+01	23	T1	0	127.0.0.1	34	1
350	2023-11-25 01:06:58.610866+01	23	T1	0	127.0.0.1	34	1
351	2023-11-25 01:07:04.650124+01	23	T1	0	127.0.0.1	34	1
352	2023-11-25 01:07:07.109597+01	23	T1	0	127.0.0.1	34	1
353	2023-11-25 01:07:15.319927+01	23	T1	0	127.0.0.1	34	1
354	2023-11-25 01:07:27.350223+01	23	T1	0	127.0.0.1	34	1
355	2023-11-25 01:07:30.943093+01	23	T1	0	127.0.0.1	34	1
356	2023-11-25 01:07:39.231269+01	23	T1	0	127.0.0.1	34	1
357	2023-11-25 01:07:41.660667+01	23	T1	0	127.0.0.1	34	1
358	2023-11-25 01:08:35.475492+01	23	T1	0	127.0.0.1	34	1
359	2023-11-25 01:08:39.033028+01	23	T1	0	127.0.0.1	34	1
360	2023-11-25 01:08:42.716442+01	23	T1	0	127.0.0.1	34	1
361	2023-11-25 01:08:45.12335+01	23	T1	0	127.0.0.1	34	1
362	2023-11-25 01:08:48.727969+01	23	T1	0	127.0.0.1	34	1
363	2023-11-25 01:08:54.630049+01	23	T1	0	127.0.0.1	34	1
364	2023-11-25 01:09:11.508928+01	23	T1	0	127.0.0.1	34	1
365	2023-11-25 01:09:17.448417+01	23	T1	0	127.0.0.1	34	1
366	2023-11-25 01:09:36.29324+01	23	T1	0	127.0.0.1	34	1
367	2023-11-25 01:09:38.638876+01	23	T1	0	127.0.0.1	34	1
368	2023-11-25 01:09:41.110242+01	23	T1	0	127.0.0.1	34	1
369	2023-11-25 01:12:15.538023+01	23	T1	0	127.0.0.1	34	1
370	2023-11-25 01:12:17.947341+01	23	T1	0	127.0.0.1	34	1
371	2023-11-25 01:12:21.654844+01	23	T1	0	127.0.0.1	34	1
372	2023-11-25 01:12:25.344273+01	23	T1	0	127.0.0.1	34	1
373	2023-11-25 01:12:36.389857+01	23	T1	0	127.0.0.1	34	1
374	2023-11-25 01:12:40.03007+01	23	T1	0	127.0.0.1	34	1
375	2023-11-25 01:12:57.40813+01	23	T1	0	127.0.0.1	34	1
376	2023-11-25 01:13:27.273121+01	23	T1	0	127.0.0.1	34	1
377	2023-11-25 01:15:27.649222+01	23	T1	0	127.0.0.1	34	1
378	2023-11-25 01:15:31.728423+01	23	T1	0	127.0.0.1	34	1
379	2023-11-25 01:15:44.284115+01	23	T1	0	127.0.0.1	34	1
380	2023-11-25 01:15:46.653435+01	23	T1	0	127.0.0.1	34	1
381	2023-11-25 01:16:45.392225+01	23	T1	0	127.0.0.1	34	1
382	2023-11-25 01:16:49.00219+01	23	T1	0	127.0.0.1	34	1
383	2023-11-25 01:16:54.939328+01	23	T1	0	127.0.0.1	34	1
384	2023-11-25 01:17:17.854412+01	23	T1	0	127.0.0.1	34	1
385	2023-11-25 01:17:37.97133+01	23	T1	0	127.0.0.1	34	1
386	2023-11-25 01:17:41.606154+01	23	T1	0	127.0.0.1	34	1
387	2023-11-25 01:17:49.909413+01	23	T1	0	127.0.0.1	34	1
388	2023-11-25 01:17:56.986486+01	23	T1	0	127.0.0.1	34	1
389	2023-11-25 01:18:09.919442+01	23	T1	0	127.0.0.1	34	1
390	2023-11-25 01:18:13.932242+01	23	T1	0	127.0.0.1	34	1
391	2023-11-25 01:20:38.126318+01	24	T2	0	127.0.0.1	34	1
392	2023-11-25 01:24:04.69682+01	26	T4	0	127.0.0.1	34	1
393	2023-11-25 01:24:18.883855+01	26	T4	0	127.0.0.1	34	1
394	2023-11-25 01:24:46.992345+01	23	T1	0	127.0.0.1	34	1
395	2023-11-25 01:25:08.770788+01	23	T1	0	127.0.0.1	34	1
396	2023-11-25 01:25:48.250764+01	23	T1	0	127.0.0.1	34	1
397	2023-11-25 01:26:09.563969+01	23	T1	0	127.0.0.1	34	1
398	2023-11-25 01:26:14.291088+01	23	T1	0	127.0.0.1	34	1
399	2023-11-25 01:26:22.623026+01	23	T1	0	127.0.0.1	34	1
400	2023-11-25 01:26:25.024018+01	23	T1	0	127.0.0.1	34	1
401	2023-11-25 01:26:30.605326+01	23	T1	0	127.0.0.1	34	1
402	2023-11-25 01:26:49.426467+01	23	T1	0	127.0.0.1	34	1
403	2023-11-25 01:27:27.2936+01	23	T1	0	127.0.0.1	34	1
404	2023-11-25 01:28:44.410239+01	78	OT3	0	127.0.0.1	27	1
405	2023-11-25 01:29:53.136084+01	77	OT2	0	127.0.0.1	27	1
406	2023-11-25 01:30:02.796965+01	78	OT3	0	127.0.0.1	27	1
407	2023-11-25 01:34:23.47423+01	23	1 - 2023 - sdf	0	127.0.0.1	14	1
408	2023-11-25 02:38:45.307528+01	26	T4	2	127.0.0.1	34	1
409	2023-11-25 02:43:04.129401+01	26	T4	2	127.0.0.1	34	1
410	2023-11-25 02:43:59.717181+01	23	T1	2	127.0.0.1	34	1
411	2023-11-25 02:45:19.104051+01	24	T2	2	127.0.0.1	34	1
412	2023-11-25 02:48:32.185314+01	23	T1	2	127.0.0.1	34	1
413	2023-11-25 04:13:10.831246+01	77	OT2	2	127.0.0.1	27	1
414	2023-11-25 04:31:24.76405+01	78	OT3	2	127.0.0.1	27	1
415	2023-11-25 04:31:42.641813+01	76	OT1	0	127.0.0.1	27	1
416	2023-11-25 04:31:47.228523+01	77	OT2	0	127.0.0.1	27	1
417	2023-11-25 04:31:50.654308+01	78	OT3	0	127.0.0.1	27	1
418	2023-11-25 05:24:20.594889+01			4	127.0.0.1	38	1
419	2023-11-25 06:30:54.973868+01	24	2 - 2023 - asd	2	127.0.0.1	14	1
420	2023-11-25 06:45:11.655637+01	26	3 - 2023 - asd3	2	127.0.0.1	14	1
421	2023-11-25 06:45:33.273275+01	26	3 - 2023 - asd3	2	127.0.0.1	14	1
422	2023-11-25 06:50:11.734131+01	26	3 - 2023 - asd3	2	127.0.0.1	14	1
423	2023-11-25 06:51:04.136013+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
424	2023-11-25 06:54:22.743074+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
425	2023-11-25 06:54:28.762364+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
426	2023-11-25 06:54:40.729817+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
427	2023-11-25 06:54:45.480964+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
428	2023-11-25 06:54:50.212921+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
429	2023-11-25 06:54:51.47368+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
430	2023-11-25 06:54:53.907083+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
431	2023-11-25 06:55:05.628512+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
432	2023-11-25 06:55:11.549131+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
433	2023-11-25 06:55:13.945912+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
434	2023-11-25 06:55:17.560353+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
435	2023-11-25 06:55:20.041141+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
436	2023-11-25 06:59:02.411524+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
437	2023-11-25 06:59:16.101985+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
438	2023-11-25 06:59:34.506054+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
439	2023-11-25 06:59:41.555839+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
440	2023-11-25 06:59:52.967332+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
441	2023-11-25 07:00:15.315445+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
442	2023-11-25 07:01:36.903291+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
443	2023-11-25 07:01:48.53803+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
444	2023-11-25 07:02:18.201111+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
445	2023-11-25 07:02:37.09829+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
446	2023-11-25 07:02:54.207058+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
447	2023-11-25 07:02:56.654304+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
448	2023-11-25 07:02:59.045905+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
449	2023-11-25 07:03:02.647747+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
450	2023-11-25 07:03:07.382205+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
451	2023-11-25 07:03:09.773869+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
452	2023-11-25 07:04:59.820339+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
453	2023-11-25 07:05:03.444093+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
454	2023-11-25 07:05:05.880272+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
455	2023-11-25 07:05:10.793285+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
456	2023-11-25 07:05:13.118664+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
457	2023-11-25 07:05:15.42468+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
458	2023-11-25 07:05:16.637768+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
459	2023-11-25 07:05:19.113025+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
460	2023-11-25 07:05:23.830935+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
461	2023-11-25 07:05:26.226198+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
462	2023-11-25 07:05:28.615601+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
463	2023-11-25 07:05:31.073069+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
464	2023-11-25 07:05:34.663024+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
465	2023-11-25 07:05:35.905921+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
466	2023-11-25 07:05:38.302587+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
467	2023-11-25 07:05:50.324458+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
468	2023-11-25 07:05:52.865396+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
469	2023-11-25 07:05:55.141463+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
470	2023-11-25 07:06:12.159777+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
471	2023-11-25 07:06:16.873636+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
472	2023-11-25 07:07:24.337084+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
473	2023-11-25 07:07:26.721475+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
474	2023-11-25 07:07:30.276793+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
475	2023-11-25 07:07:38.554871+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
476	2023-11-25 07:07:39.753617+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
477	2023-11-25 07:07:43.428109+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
478	2023-11-25 07:07:55.503594+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
479	2023-11-25 07:08:01.424841+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
480	2023-11-25 07:08:02.645552+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
481	2023-11-25 07:08:06.348031+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
482	2023-11-25 07:10:11.796845+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
483	2023-11-25 07:10:15.356674+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
484	2023-11-25 07:10:18.951087+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
485	2023-11-25 07:10:38.882653+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
486	2023-11-25 07:10:50.901997+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
487	2023-11-25 07:10:58.084853+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
488	2023-11-25 07:11:05.129496+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
489	2023-11-25 07:11:06.366039+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
490	2023-11-25 07:11:40.627783+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
491	2023-11-25 07:11:45.411509+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
492	2023-11-25 07:12:19.400146+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
493	2023-11-25 07:12:48.720625+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
494	2023-11-25 07:12:52.022929+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
495	2023-11-25 07:13:06.066169+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
496	2023-11-25 07:13:08.509314+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
497	2023-11-25 07:13:11.302215+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
498	2023-11-25 07:13:28.011899+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
499	2023-11-25 07:13:31.3619+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
500	2023-11-25 07:14:12.336367+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
501	2023-11-25 07:14:25.714891+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
502	2023-11-25 07:15:08.238608+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
503	2023-11-25 07:15:13.69119+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
504	2023-11-25 07:15:29.88688+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
505	2023-11-25 07:15:32.322664+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
506	2023-11-25 07:15:55.046869+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
507	2023-11-25 07:15:57.421154+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
508	2023-11-25 07:15:59.828575+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
509	2023-11-25 07:16:05.661117+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
510	2023-11-25 07:16:23.566013+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
511	2023-11-25 07:16:25.978174+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
512	2023-11-25 07:16:27.148344+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
513	2023-11-25 07:16:29.586154+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
514	2023-11-25 07:16:31.973839+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
515	2023-11-25 07:16:45.281498+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
516	2023-11-25 07:16:46.485152+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
517	2023-11-25 07:16:50.049262+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
518	2023-11-25 07:16:52.426279+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
519	2023-11-25 07:16:54.847503+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
520	2023-11-25 07:16:57.255631+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
521	2023-11-25 07:17:06.532102+01	26	3 - 2023 - asd3	2	127.0.0.1	14	1
522	2023-11-25 07:17:10.434121+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
523	2023-11-25 07:19:02.213708+01	26	3 - 2023 - asd3	2	127.0.0.1	14	1
524	2023-11-25 07:19:10.028345+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
525	2023-11-25 07:19:18.174032+01	26	3 - 2023 - asd3	2	127.0.0.1	14	1
526	2023-11-25 07:19:21.960448+01	26	3 - 2023 - asd3	0	127.0.0.1	14	1
527	2023-11-25 07:32:45.793898+01	77	OT2	3	127.0.0.1	27	1
528	2023-11-25 07:39:49.793665+01	77	OT2	3	127.0.0.1	27	1
529	2023-11-25 07:42:22.243533+01	77	OT2	3	127.0.0.1	27	1
530	2023-11-25 07:43:51.767315+01	78	OT3	3	127.0.0.1	27	1
531	2023-11-25 07:44:55.992745+01	24	T2	3	127.0.0.1	34	1
532	2023-11-25 07:44:55.994744+01	25	T3	3	127.0.0.1	34	1
533	2023-11-25 07:44:55.997745+01	77	OT2	3	127.0.0.1	27	1
534	2023-11-25 07:48:56.026374+01	23	T1	3	127.0.0.1	34	1
535	2023-11-25 07:48:56.030374+01	76	OT1	3	127.0.0.1	27	1
536	2023-11-25 07:55:09.952257+01	26	T4	3	127.0.0.1	34	1
537	2023-11-25 07:56:59.330083+01	27	T5	3	127.0.0.1	34	1
538	2023-11-25 07:58:24.469698+01	78	OT3	3	127.0.0.1	27	1
539	2023-11-25 08:01:24.261878+01	24	T2	3	127.0.0.1	34	1
540	2023-11-25 08:07:12.744875+01	23	T1	3	127.0.0.1	34	1
541	2023-11-25 08:07:12.748876+01	76	OT1	3	127.0.0.1	27	1
542	2023-11-25 08:07:12.751879+01	26	3 - 2023 - asd3	3	127.0.0.1	14	1
543	2023-11-25 08:08:12.121739+01	78	OT3	0	127.0.0.1	27	1
544	2023-11-25 08:08:24.076546+01	26	T4	3	127.0.0.1	34	1
545	2023-11-25 08:08:24.078546+01	27	T5	3	127.0.0.1	34	1
546	2023-11-25 08:08:24.080646+01	78	OT3	3	127.0.0.1	27	1
547	2023-11-25 08:08:24.081547+01	25	T3	3	127.0.0.1	34	1
548	2023-11-25 08:08:24.082547+01	77	OT2	3	127.0.0.1	27	1
549	2023-11-25 08:08:24.084547+01	24	2 - 2023 - asd	3	127.0.0.1	14	1
550	2023-11-25 08:12:26.628601+01	23	T1	3	127.0.0.1	34	1
551	2023-11-25 08:13:15.21726+01	26	T4	3	127.0.0.1	34	1
552	2023-11-25 08:14:07.727788+01	23	1 - 2023 - sdf	3	127.0.0.1	14	1
553	2023-11-25 08:14:48.801451+01	76	OT1	3	127.0.0.1	27	1
554	2023-11-25 08:14:48.80445+01	26	3 - 2023 - asd3	3	127.0.0.1	14	1
555	2023-11-25 08:16:06.306011+01	27	T5	3	127.0.0.1	34	1
556	2023-11-25 08:16:06.309008+01	78	OT3	3	127.0.0.1	27	1
557	2023-11-25 08:16:06.311037+01	25	T3	3	127.0.0.1	34	1
558	2023-11-25 08:16:06.312009+01	24	T2	3	127.0.0.1	34	1
559	2023-11-25 08:16:06.313034+01	77	OT2	3	127.0.0.1	27	1
560	2023-11-25 08:16:06.316014+01	24	2 - 2023 - asd	3	127.0.0.1	14	1
561	2023-11-25 16:55:06.659131+01			4	127.0.0.1	38	1
562	2023-11-25 17:45:13.162269+01	23	T1	0	127.0.0.1	34	1
563	2023-11-25 17:46:30.004297+01	76	OT1	0	127.0.0.1	27	1
564	2023-11-25 20:57:53.106008+01			4	127.0.0.1	38	1
567	2023-11-25 21:04:03.11539+01	30	asdasd	1	127.0.0.1	34	1
568	2023-11-25 21:04:03.11539+01	3	asdasd por asdasd	1	127.0.0.1	67	1
569	2023-11-25 23:00:05.020748+01			4	127.0.0.1	38	1
570	2023-11-25 23:02:12.096729+01			5	127.0.0.1	38	1
571	2023-11-25 23:05:12.284343+01			4	127.0.0.1	38	1
572	2023-11-25 23:05:14.964189+01			5	127.0.0.1	38	1
573	2023-11-25 23:05:25.61475+01			4	127.0.0.1	38	1
574	2023-11-25 23:06:30.723895+01			5	127.0.0.1	38	1
575	2023-11-25 23:06:36.157975+01			4	127.0.0.1	38	1
586	2023-11-26 00:23:29.393557+01	30	('asdasd',)	2	127.0.0.1	34	1
587	2023-11-26 00:23:29.40252+01	4	('asdasd',) por asdasd	1	127.0.0.1	67	1
588	2023-11-26 00:24:46.563732+01	31	qwe	1	127.0.0.1	34	1
589	2023-11-26 00:24:46.569734+01	5	qwe por Desarrollo	1	127.0.0.1	67	1
590	2023-11-26 00:24:55.053517+01	31	('qwe',)	2	127.0.0.1	34	1
591	2023-11-26 00:24:55.061527+01	6	('qwe',) por Desarrollo	1	127.0.0.1	67	1
592	2023-11-26 00:26:44.804057+01	32	fgh	1	127.0.0.1	34	1
593	2023-11-26 00:26:44.812945+01	7	fgh por asdasd	1	127.0.0.1	67	1
594	2023-11-26 00:27:03.093017+01	32	('fgh',)	2	127.0.0.1	34	1
595	2023-11-26 00:27:03.101015+01	8	('fgh',) por asdasd	1	127.0.0.1	67	1
596	2023-11-26 00:38:29.178465+01	30	('uuu',)	2	127.0.0.1	34	1
597	2023-11-26 00:38:29.187976+01	9	('uuu',) por asdasd	1	127.0.0.1	67	1
598	2023-11-26 00:40:11.503247+01	30	uuu	2	127.0.0.1	34	1
599	2023-11-26 00:40:11.514271+01	10	uuu por asdasd	1	127.0.0.1	67	1
600	2023-11-26 01:15:38.788928+01	30	uuu	2	127.0.0.1	34	1
601	2023-11-26 01:15:38.794409+01	11	uuu por asdasd	1	127.0.0.1	67	1
602	2023-11-26 01:22:29.307599+01	30	uuu	0	127.0.0.1	34	1
603	2023-11-26 01:23:22.825366+01	30	uuu	0	127.0.0.1	34	1
604	2023-11-26 01:42:14.644582+01	30	uuu	0	127.0.0.1	34	1
605	2023-11-26 01:42:34.787295+01	30	uuu	0	127.0.0.1	34	1
606	2023-11-26 01:43:37.649505+01	33	1111	1	127.0.0.1	34	1
607	2023-11-26 01:43:37.658541+01	12	1111 por Desarrollo	1	127.0.0.1	67	1
608	2023-11-26 01:43:41.992623+01	33	1111	0	127.0.0.1	34	1
609	2023-11-26 01:44:20.962616+01	33	1111	0	127.0.0.1	34	1
610	2023-11-26 01:47:01.581769+01	33	11112	2	127.0.0.1	34	1
611	2023-11-26 01:48:35.040396+01	33	111	2	127.0.0.1	34	1
612	2023-11-26 02:34:25.927+01	79	qwe	1	127.0.0.1	27	1
613	2023-11-26 02:34:43.160016+01	27	1 - 2023 - OE1	1	127.0.0.1	14	1
614	2023-11-26 04:58:26.713427+01	27	1 - 2023 - OE1.2	2	127.0.0.1	14	1
615	2023-11-26 06:32:36.445682+01			4	127.0.0.1	38	1
616	2023-11-26 09:19:08.435891+01	2	OE1.2 / Evaluación: 3. Regular	1	127.0.0.1	69	1
617	2023-11-26 09:21:25.773494+01	3	OE1.2 / Evaluación: 4. Casi bien	1	127.0.0.1	69	1
618	2023-11-26 09:21:38.774908+01	4	OE1.2 / Evaluación: 5. Muy bien	1	127.0.0.1	69	1
1024	2023-11-27 01:15:49.555607+01	6		1	127.0.0.1	25	1
619	2023-11-26 09:28:55.188973+01	5	OE1.2 / Evaluación: 2. Algo mal	1	127.0.0.1	69	1
620	2023-11-26 09:30:56.520188+01	2	OE1.2 / Evaluación: 3. Regular	2	127.0.0.1	69	1
621	2023-11-26 09:31:31.404023+01	1	OE1.2 / Evaluación: 1. Muy mal	2	127.0.0.1	69	1
622	2023-11-26 09:53:07.307262+01	2	OE1.2 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
623	2023-11-26 09:53:36.445974+01	1	OE1.2 / Evaluación: 3. Regular	2	127.0.0.1	69	1
624	2023-11-26 09:55:18.948196+01	1	OE1.2 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
625	2023-11-26 09:56:53.19517+01	1	OE1.2 / Evaluación: 1. Muy mal	2	127.0.0.1	69	1
626	2023-11-26 17:24:34.218609+01			4	127.0.0.1	38	1
627	2023-11-26 17:25:27.260482+01	6	OE1.2 / Evaluación: 2. Algo mal	1	127.0.0.1	69	1
628	2023-11-26 17:26:30.896623+01	7	OE1.2 / Evaluación: 2. Algo mal	1	127.0.0.1	69	1
629	2023-11-26 17:39:33.627347+01	7	OE1.2 / Evaluación: 3. Regular	2	127.0.0.1	69	1
630	2023-11-26 17:39:41.86392+01	7	OE1.2 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
631	2023-11-26 18:19:53.243047+01	8	OE1.2 / Evaluación: 4. Casi bien	1	127.0.0.1	69	1
632	2023-11-26 18:19:58.986073+01	8	OE1.2 / Evaluación: 3. Regular	2	127.0.0.1	69	1
633	2023-11-26 18:30:15.393863+01	33	111	3	127.0.0.1	34	1
634	2023-11-26 18:30:15.397863+01	79	qwe	3	127.0.0.1	27	1
635	2023-11-26 18:30:48.745025+01	27	1 - 2023 - OE1.2	3	127.0.0.1	14	1
636	2023-11-26 18:40:39.553871+01	1	1 qqqq	0	127.0.0.1	33	1
637	2023-11-26 20:04:45.402774+01	2	2 acd1	1	127.0.0.1	33	1
638	2023-11-26 20:08:38.383437+01	3	3 vhjb	1	127.0.0.1	33	1
639	2023-11-26 20:09:46.401753+01	4	4 kbkb	1	127.0.0.1	33	1
640	2023-11-26 20:12:33.817822+01	5	5 sdfsdf	1	127.0.0.1	33	1
649	2023-11-26 20:27:41.873439+01	14	6 asdasd	1	127.0.0.1	33	1
650	2023-11-26 21:36:59.22895+01	15	7 asd	1	127.0.0.1	33	1
651	2023-11-26 21:37:04.673296+01	15	7 asd	0	127.0.0.1	33	1
652	2023-11-26 21:37:22.333837+01	15	7 asd	0	127.0.0.1	33	1
653	2023-11-26 21:50:54.326465+01	15	7 asd	0	127.0.0.1	33	1
654	2023-11-26 21:51:00.283681+01	15	7 asd	0	127.0.0.1	33	1
655	2023-11-26 21:51:08.597555+01	15	7 asd	0	127.0.0.1	33	1
656	2023-11-26 21:51:47.361525+01	15	7 asd	0	127.0.0.1	33	1
657	2023-11-26 21:52:11.015357+01	15	7 asd	0	127.0.0.1	33	1
658	2023-11-26 21:52:12.270485+01	15	7 asd	0	127.0.0.1	33	1
659	2023-11-26 21:52:15.829305+01	15	7 asd	0	127.0.0.1	33	1
660	2023-11-26 21:52:18.169567+01	15	7 asd	0	127.0.0.1	33	1
661	2023-11-26 21:52:29.938569+01	15	7 asd	0	127.0.0.1	33	1
662	2023-11-26 21:52:34.6901+01	15	7 asd	0	127.0.0.1	33	1
663	2023-11-26 21:52:40.580217+01	15	7 asd	0	127.0.0.1	33	1
664	2023-11-26 21:53:05.340074+01	15	7 asd	0	127.0.0.1	33	1
665	2023-11-26 21:53:09.08266+01	15	7 asd	0	127.0.0.1	33	1
666	2023-11-26 21:53:13.794302+01	15	7 asd	0	127.0.0.1	33	1
667	2023-11-26 21:53:20.872123+01	15	7 asd	0	127.0.0.1	33	1
668	2023-11-26 21:53:22.114257+01	15	7 asd	0	127.0.0.1	33	1
669	2023-11-26 21:53:31.499156+01	15	7 asd	0	127.0.0.1	33	1
670	2023-11-26 21:53:32.748483+01	15	7 asd	0	127.0.0.1	33	1
671	2023-11-26 21:53:51.579601+01	15	7 asd	0	127.0.0.1	33	1
672	2023-11-26 21:53:57.483543+01	15	7 asd	0	127.0.0.1	33	1
673	2023-11-26 21:53:58.679769+01	15	7 asd	0	127.0.0.1	33	1
674	2023-11-26 21:54:03.407128+01	15	7 asd	0	127.0.0.1	33	1
675	2023-11-26 21:54:06.94397+01	15	7 asd	0	127.0.0.1	33	1
676	2023-11-26 21:54:11.757763+01	15	7 asd	0	127.0.0.1	33	1
677	2023-11-26 21:54:23.426484+01	15	7 asd	0	127.0.0.1	33	1
678	2023-11-26 21:54:38.351235+01	1	1 qqqq	0	127.0.0.1	33	1
679	2023-11-26 21:55:04.534877+01	1	1 qqqq	0	127.0.0.1	33	1
680	2023-11-26 21:55:15.836743+01	1	1 qqqq	0	127.0.0.1	33	1
681	2023-11-26 21:55:18.274061+01	1	1 qqqq	0	127.0.0.1	33	1
682	2023-11-26 21:56:55.833955+01	1	1 qqqq	0	127.0.0.1	33	1
683	2023-11-26 21:57:03.047976+01	1	1 qqqq	0	127.0.0.1	33	1
684	2023-11-26 21:57:09.066962+01	1	1 qqqq	0	127.0.0.1	33	1
685	2023-11-26 21:57:18.603795+01	1	1 qqqq	0	127.0.0.1	33	1
686	2023-11-26 21:57:22.166788+01	1	1 qqqq	0	127.0.0.1	33	1
687	2023-11-26 21:57:28.223907+01	1	1 qqqq	0	127.0.0.1	33	1
688	2023-11-26 21:57:31.746941+01	1	1 qqqq	0	127.0.0.1	33	1
689	2023-11-26 21:57:34.095866+01	1	1 qqqq	0	127.0.0.1	33	1
690	2023-11-26 21:57:36.420774+01	1	1 qqqq	0	127.0.0.1	33	1
691	2023-11-26 21:57:41.12932+01	1	1 qqqq	0	127.0.0.1	33	1
692	2023-11-26 21:57:44.679715+01	1	1 qqqq	0	127.0.0.1	33	1
693	2023-11-26 21:57:47.015139+01	1	1 qqqq	0	127.0.0.1	33	1
694	2023-11-26 21:57:49.429058+01	1	1 qqqq	0	127.0.0.1	33	1
695	2023-11-26 21:57:50.570577+01	1	1 qqqq	0	127.0.0.1	33	1
696	2023-11-26 21:57:52.958364+01	1	1 qqqq	0	127.0.0.1	33	1
697	2023-11-26 21:57:55.372108+01	1	1 qqqq	0	127.0.0.1	33	1
698	2023-11-26 21:58:16.463922+01	1	1 qqqq	0	127.0.0.1	33	1
699	2023-11-26 21:58:17.624011+01	1	1 qqqq	0	127.0.0.1	33	1
700	2023-11-26 21:58:31.752737+01	1	1 qqqq	0	127.0.0.1	33	1
701	2023-11-26 21:58:32.933118+01	1	1 qqqq	0	127.0.0.1	33	1
702	2023-11-26 21:58:38.839464+01	1	1 qqqq	0	127.0.0.1	33	1
703	2023-11-26 21:58:41.231602+01	1	1 qqqq	0	127.0.0.1	33	1
704	2023-11-26 21:58:43.612784+01	1	1 qqqq	0	127.0.0.1	33	1
705	2023-11-26 21:58:47.188839+01	1	1 qqqq	0	127.0.0.1	33	1
706	2023-11-26 21:58:49.541534+01	1	1 qqqq	0	127.0.0.1	33	1
707	2023-11-26 21:58:58.929851+01	1	1 qqqq	0	127.0.0.1	33	1
708	2023-11-26 21:59:03.68455+01	1	1 qqqq	0	127.0.0.1	33	1
709	2023-11-26 21:59:31.856188+01	1	1 qqqq	0	127.0.0.1	33	1
710	2023-11-26 21:59:59.940278+01	1	1 qqqq	0	127.0.0.1	33	1
711	2023-11-26 22:00:04.661259+01	1	1 qqqq	0	127.0.0.1	33	1
712	2023-11-26 22:00:06.989724+01	1	1 qqqq	0	127.0.0.1	33	1
713	2023-11-26 22:00:09.352058+01	1	1 qqqq	0	127.0.0.1	33	1
714	2023-11-26 22:00:11.728171+01	1	1 qqqq	0	127.0.0.1	33	1
715	2023-11-26 22:00:45.406828+01	1	1 qqqq	0	127.0.0.1	33	1
716	2023-11-26 22:00:58.44202+01	1	1 qqqq	0	127.0.0.1	33	1
717	2023-11-26 22:01:05.462222+01	1	1 qqqq	0	127.0.0.1	33	1
718	2023-11-26 22:01:13.64556+01	1	1 qqqq	0	127.0.0.1	33	1
719	2023-11-26 22:01:19.522969+01	1	1 qqqq	0	127.0.0.1	33	1
720	2023-11-26 22:01:25.453006+01	1	1 qqqq	0	127.0.0.1	33	1
721	2023-11-26 22:01:29.012942+01	1	1 qqqq	0	127.0.0.1	33	1
722	2023-11-26 22:01:40.776046+01	1	1 qqqq	0	127.0.0.1	33	1
723	2023-11-26 22:01:45.494193+01	1	1 qqqq	0	127.0.0.1	33	1
724	2023-11-26 22:02:03.014185+01	1	1 qqqq	0	127.0.0.1	33	1
725	2023-11-26 22:02:47.553072+01	1	1 qqqq	0	127.0.0.1	33	1
726	2023-11-26 22:02:49.926738+01	1	1 qqqq	0	127.0.0.1	33	1
727	2023-11-26 22:02:54.657923+01	1	1 qqqq	0	127.0.0.1	33	1
728	2023-11-26 22:02:55.84785+01	1	1 qqqq	0	127.0.0.1	33	1
729	2023-11-26 22:03:02.951269+01	1	1 qqqq	0	127.0.0.1	33	1
730	2023-11-26 22:03:04.146132+01	1	1 qqqq	0	127.0.0.1	33	1
731	2023-11-26 22:03:06.510811+01	1	1 qqqq	0	127.0.0.1	33	1
732	2023-11-26 22:03:08.884854+01	1	1 qqqq	0	127.0.0.1	33	1
733	2023-11-26 22:03:14.775883+01	1	1 qqqq	0	127.0.0.1	33	1
734	2023-11-26 22:03:28.910733+01	1	1 qqqq	0	127.0.0.1	33	1
735	2023-11-26 22:03:34.780779+01	1	1 qqqq	0	127.0.0.1	33	1
736	2023-11-26 22:03:53.593226+01	1	1 qqqq	0	127.0.0.1	33	1
737	2023-11-26 22:03:55.960245+01	1	1 qqqq	0	127.0.0.1	33	1
738	2023-11-26 22:04:01.837498+01	1	1 qqqq	0	127.0.0.1	33	1
739	2023-11-26 22:04:04.249587+01	1	1 qqqq	0	127.0.0.1	33	1
740	2023-11-26 22:04:06.64836+01	1	1 qqqq	0	127.0.0.1	33	1
741	2023-11-26 22:04:10.225775+01	1	1 qqqq	0	127.0.0.1	33	1
742	2023-11-26 22:04:13.75463+01	1	1 qqqq	0	127.0.0.1	33	1
743	2023-11-26 22:04:27.811402+01	1	1 qqqq	0	127.0.0.1	33	1
744	2023-11-26 22:04:35.987936+01	1	1 qqqq	0	127.0.0.1	33	1
745	2023-11-26 22:04:40.694745+01	1	1 qqqq	0	127.0.0.1	33	1
746	2023-11-26 22:04:55.832363+01	1	1 qqqq	0	127.0.0.1	33	1
747	2023-11-26 22:05:30.681239+01	1	1 qqqq	0	127.0.0.1	33	1
748	2023-11-26 22:05:33.029218+01	1	1 qqqq	0	127.0.0.1	33	1
749	2023-11-26 22:05:38.844735+01	1	1 qqqq	0	127.0.0.1	33	1
750	2023-11-26 22:06:11.036473+01	2	tomado	2	127.0.0.1	6	1
751	2023-11-26 22:06:20.062576+01	1	fhfhgh	2	127.0.0.1	6	1
752	2023-11-26 22:07:06.149235+01	1	1 qqqq	2	127.0.0.1	33	1
753	2023-11-26 22:07:16.504771+01	2	2 acd1	0	127.0.0.1	33	1
754	2023-11-26 22:07:42.356861+01	2	2 acd1	0	127.0.0.1	33	1
755	2023-11-26 22:07:46.511679+01	2	2 acd1	0	127.0.0.1	33	1
756	2023-11-26 22:08:10.947848+01	2	2 acd1	0	127.0.0.1	33	1
757	2023-11-26 22:08:29.993068+01	2	2 acd1	0	127.0.0.1	33	1
758	2023-11-26 22:08:31.177098+01	2	2 acd1	0	127.0.0.1	33	1
759	2023-11-26 22:08:54.743102+01	2	2 acd1	0	127.0.0.1	33	1
760	2023-11-26 22:09:05.315827+01	2	2 acd1	0	127.0.0.1	33	1
761	2023-11-26 22:09:20.785956+01	2	2 acd1	0	127.0.0.1	33	1
762	2023-11-26 22:09:28.368368+01	1	1 qqqq	0	127.0.0.1	33	1
763	2023-11-26 22:09:30.947493+01	15	7 asd	0	127.0.0.1	33	1
764	2023-11-26 22:09:34.54861+01	15	7 asd	0	127.0.0.1	33	1
765	2023-11-26 22:10:48.910699+01	15	7 asd	0	127.0.0.1	33	1
766	2023-11-26 22:11:10.169438+01	2	2 acd1	0	127.0.0.1	33	1
767	2023-11-26 22:11:23.595825+01	2	2 acd1	0	127.0.0.1	33	1
768	2023-11-26 22:11:30.676289+01	2	2 acd1	0	127.0.0.1	33	1
769	2023-11-26 22:11:35.406148+01	2	2 acd1	0	127.0.0.1	33	1
770	2023-11-26 22:11:41.339412+01	2	2 acd1	0	127.0.0.1	33	1
771	2023-11-26 22:11:43.702867+01	2	2 acd1	0	127.0.0.1	33	1
772	2023-11-26 22:11:49.621407+01	2	2 acd1	0	127.0.0.1	33	1
773	2023-11-26 22:11:56.738326+01	2	2 acd1	0	127.0.0.1	33	1
774	2023-11-26 22:11:57.929284+01	2	2 acd1	0	127.0.0.1	33	1
775	2023-11-26 22:12:02.670891+01	2	2 acd1	0	127.0.0.1	33	1
776	2023-11-26 22:12:05.008624+01	2	2 acd1	0	127.0.0.1	33	1
777	2023-11-26 22:22:36.365996+01	1	1 qqqq	2	127.0.0.1	33	1
778	2023-11-26 22:26:05.252889+01	2	2 ACD2	2	127.0.0.1	33	1
779	2023-11-26 22:26:16.050184+01	2	2 ACD2	0	127.0.0.1	33	1
780	2023-11-26 22:27:51.967368+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
781	2023-11-26 22:28:56.028719+01	9	OE1.2 / Evaluación: 5. Muy bien	1	127.0.0.1	69	1
782	2023-11-26 22:29:05.715957+01	10	OE1.2 / Evaluación: 4. Casi bien	1	127.0.0.1	69	1
783	2023-11-26 22:29:43.678191+01	11	OE1.2 / Evaluación: 3. Regular	1	127.0.0.1	69	1
784	2023-11-26 22:29:58.711411+01	12	OE1.2 / Evaluación: 1. Muy mal	1	127.0.0.1	69	1
785	2023-11-26 22:33:43.058097+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
786	2023-11-26 22:36:44.984305+01	33	111	3	127.0.0.1	34	1
787	2023-11-26 22:36:44.986305+01	79	qwe	3	127.0.0.1	27	1
788	2023-11-26 22:36:44.989305+01	27	1 - 2023 - OE1.2	3	127.0.0.1	14	1
789	2023-11-26 22:41:03.451887+01	14	6 asdasd	0	127.0.0.1	33	1
790	2023-11-26 22:41:07.583538+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
791	2023-11-26 22:41:17.851697+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
792	2023-11-26 22:41:20.243793+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
793	2023-11-26 22:41:23.792017+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
794	2023-11-26 22:41:44.730942+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
795	2023-11-26 22:42:00.243555+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
796	2023-11-26 22:42:05.044451+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
797	2023-11-26 22:42:17.910249+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
798	2023-11-26 22:42:20.308354+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
799	2023-11-26 22:42:21.490702+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
800	2023-11-26 22:42:27.42317+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
801	2023-11-26 22:42:45.213779+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
802	2023-11-26 22:42:51.134074+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
803	2023-11-26 22:44:10.490429+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
804	2023-11-26 22:44:58.155183+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
805	2023-11-26 22:45:16.959559+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
806	2023-11-26 22:46:17.060042+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
807	2023-11-26 22:46:30.006033+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
808	2023-11-26 22:46:31.181374+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
809	2023-11-26 22:46:43.236237+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
810	2023-11-26 22:47:22.050619+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
811	2023-11-26 22:47:24.423932+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
812	2023-11-26 22:47:38.493978+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
813	2023-11-26 22:48:06.56985+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
814	2023-11-26 22:48:13.604037+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
815	2023-11-26 22:48:21.834554+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
816	2023-11-26 22:48:25.414481+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
817	2023-11-26 22:48:44.102268+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
818	2023-11-26 22:48:46.512347+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
819	2023-11-26 22:48:47.729767+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
820	2023-11-26 22:48:57.171252+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
821	2023-11-26 22:49:05.492569+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
822	2023-11-26 22:49:07.902695+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
823	2023-11-26 22:49:27.918929+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
824	2023-11-26 22:49:30.286723+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
825	2023-11-26 22:49:53.023872+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
826	2023-11-26 22:49:59.870607+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
827	2023-11-26 22:50:08.297128+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
828	2023-11-26 22:50:09.609227+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
829	2023-11-26 22:50:12.998464+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
830	2023-11-26 22:50:17.757922+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
831	2023-11-26 22:50:25.06487+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
832	2023-11-26 22:50:37.991921+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
833	2023-11-26 22:50:39.17729+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
834	2023-11-26 22:50:46.249414+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
835	2023-11-26 22:50:55.679659+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
836	2023-11-26 22:51:33.84146+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
837	2023-11-26 22:51:38.990619+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
838	2023-11-26 22:51:44.265379+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
839	2023-11-26 22:51:49.445805+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
840	2023-11-26 22:52:03.279206+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
841	2023-11-26 22:52:24.211463+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
842	2023-11-26 22:53:04.323741+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
843	2023-11-26 22:54:33.905187+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
844	2023-11-26 22:54:35.239416+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
845	2023-11-26 22:54:38.983117+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
846	2023-11-26 22:54:41.239123+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
847	2023-11-26 22:54:49.63954+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
848	2023-11-26 22:54:53.462356+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
849	2023-11-26 22:54:55.942577+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
850	2023-11-26 22:54:58.336345+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
851	2023-11-26 22:55:00.661295+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
852	2023-11-26 22:55:01.881327+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
853	2023-11-26 22:55:21.680926+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
854	2023-11-26 22:55:24.048511+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
855	2023-11-26 22:55:36.959084+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
856	2023-11-26 22:55:44.027303+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
857	2023-11-26 22:55:52.250946+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
858	2023-11-26 22:55:54.668866+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
859	2023-11-26 22:56:01.685726+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
860	2023-11-26 22:56:04.061306+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
861	2023-11-26 22:57:11.482736+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
862	2023-11-26 22:57:13.887834+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
863	2023-11-26 22:57:36.12791+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
864	2023-11-26 22:57:39.704223+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
865	2023-11-26 22:57:42.078383+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
866	2023-11-26 22:57:52.67285+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
867	2023-11-26 22:58:00.956678+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
868	2023-11-26 23:00:16.246394+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
869	2023-11-26 23:00:18.658911+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
870	2023-11-26 23:00:41.999413+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
871	2023-11-26 23:00:44.356486+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
872	2023-11-26 23:00:49.09894+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
873	2023-11-26 23:01:05.53696+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
874	2023-11-26 23:01:07.913099+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
875	2023-11-26 23:01:13.910611+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
876	2023-11-26 23:01:18.653582+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
877	2023-11-26 23:01:37.570432+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
878	2023-11-26 23:01:39.978437+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
879	2023-11-26 23:01:41.164873+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
880	2023-11-26 23:01:43.490431+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
881	2023-11-26 23:01:50.561098+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
882	2023-11-26 23:01:59.206933+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
883	2023-11-26 23:02:21.615819+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
884	2023-11-26 23:02:25.351769+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
885	2023-11-26 23:02:30.10718+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
886	2023-11-26 23:02:32.476829+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
887	2023-11-26 23:02:36.017273+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
888	2023-11-26 23:02:38.358019+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
889	2023-11-26 23:02:41.911475+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
890	2023-11-26 23:03:14.70418+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
891	2023-11-26 23:07:16.773995+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
892	2023-11-26 23:09:41.38396+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
893	2023-11-26 23:09:49.697626+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
894	2023-11-26 23:10:14.598762+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
895	2023-11-26 23:10:42.72736+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
896	2023-11-26 23:11:41.028558+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
897	2023-11-26 23:11:44.473924+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
898	2023-11-26 23:12:03.24701+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
899	2023-11-26 23:12:05.623342+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
900	2023-11-26 23:12:06.880253+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
901	2023-11-26 23:12:11.63128+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
902	2023-11-26 23:12:12.804969+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
903	2023-11-26 23:12:13.990886+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
904	2023-11-26 23:12:21.014783+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
905	2023-11-26 23:12:29.383837+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
906	2023-11-26 23:12:57.126353+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
907	2023-11-26 23:12:57.891077+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
908	2023-11-26 23:13:17.428636+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
909	2023-11-26 23:13:43.937339+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
910	2023-11-26 23:13:57.992394+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
911	2023-11-26 23:14:00.342866+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
912	2023-11-26 23:14:10.89856+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
913	2023-11-26 23:14:23.839336+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
914	2023-11-26 23:14:27.324402+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
915	2023-11-26 23:14:34.353053+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
916	2023-11-26 23:14:36.799643+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
917	2023-11-26 23:16:22.238201+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
918	2023-11-26 23:16:39.633514+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
919	2023-11-26 23:17:01.902051+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
920	2023-11-26 23:17:23.124941+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
921	2023-11-26 23:17:27.859967+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
922	2023-11-26 23:17:30.249175+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
923	2023-11-26 23:17:36.155355+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
924	2023-11-26 23:18:08.105728+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
925	2023-11-26 23:18:15.280933+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
926	2023-11-26 23:18:23.602193+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
927	2023-11-26 23:18:24.775935+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
928	2023-11-26 23:18:27.209625+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
929	2023-11-26 23:18:29.591036+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
930	2023-11-26 23:18:43.472632+01	7	OE1.2 / Evaluación: 1. Muy mal	2	127.0.0.1	69	1
931	2023-11-26 23:18:58.225938+01	7	OE1.2 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
932	2023-11-26 23:20:24.446964+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
933	2023-11-26 23:21:25.001859+01	14	6 asdasd	0	127.0.0.1	33	1
934	2023-11-26 23:22:09.15022+01	14	6 asdasd	2	127.0.0.1	33	1
935	2023-11-26 23:22:15.976381+01	14	6 asdasd	0	127.0.0.1	33	1
936	2023-11-26 23:22:20.247881+01	14	6 asdasd	0	127.0.0.1	33	1
937	2023-11-26 23:24:00.370927+01	15	7 asd	0	127.0.0.1	33	1
938	2023-11-26 23:24:03.114626+01	15	7 asd	0	127.0.0.1	33	1
939	2023-11-26 23:24:13.057391+01	2	2 ACD2	0	127.0.0.1	33	1
940	2023-11-26 23:25:29.805329+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
941	2023-11-26 23:26:20.489471+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
942	2023-11-26 23:26:26.397648+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
943	2023-11-26 23:26:32.325007+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
944	2023-11-26 23:26:33.501989+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
945	2023-11-26 23:26:38.031695+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
946	2023-11-26 23:26:45.465061+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
947	2023-11-26 23:26:52.363182+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
948	2023-11-26 23:26:59.855093+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
949	2023-11-26 23:27:07.683772+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
950	2023-11-26 23:29:37.187667+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
951	2023-11-26 23:30:28.853338+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
952	2023-11-26 23:35:24.703755+01	15	7 asd	0	127.0.0.1	33	1
953	2023-11-26 23:36:04.901043+01	14	6 asdasd	2	127.0.0.1	33	1
954	2023-11-26 23:36:09.941719+01	14	6 asdasd	0	127.0.0.1	33	1
955	2023-11-26 23:36:23.125121+01	14	6 asdasd	2	127.0.0.1	33	1
956	2023-11-26 23:37:48.479624+01	14	6 asdasd	3	127.0.0.1	33	1
957	2023-11-26 23:39:04.217745+01	33	111	3	127.0.0.1	34	1
958	2023-11-26 23:39:04.221766+01	79	qwe	3	127.0.0.1	27	1
959	2023-11-26 23:39:04.227765+01	27	1 - 2023 - OE1.2	3	127.0.0.1	14	1
960	2023-11-26 23:42:13.714598+01	1	1 qqqq	3	127.0.0.1	33	1
961	2023-11-26 23:42:43.306218+01	15	7 asd	3	127.0.0.1	33	1
962	2023-11-26 23:44:18.958793+01	1	1 qqqq	3	127.0.0.1	33	1
963	2023-11-26 23:45:24.470925+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
964	2023-11-26 23:47:52.22282+01	1	CITMATEL	1	127.0.0.1	46	1
965	2023-11-26 23:51:16.064346+01	<property object at 0x00000195461B1630>	<class 'SISGDDO.models.premio'>	1	127.0.0.1	25	1
966	2023-11-26 23:51:56.20726+01	1	asdads	0	127.0.0.1	25	1
967	2023-11-26 23:55:32.282647+01	1	asdads	0	127.0.0.1	25	1
968	2023-11-26 23:55:51.31406+01	1	asdads	0	127.0.0.1	25	1
969	2023-11-26 23:55:53.823828+01	1	asdads	0	127.0.0.1	25	1
970	2023-11-26 23:56:17.607663+01	1	asdads	0	127.0.0.1	25	1
971	2023-11-26 23:56:27.248509+01	1	asdads	0	127.0.0.1	25	1
972	2023-11-26 23:56:29.70823+01	1	asdads	0	127.0.0.1	25	1
973	2023-11-26 23:56:40.435099+01	1	asdads	0	127.0.0.1	25	1
974	2023-11-26 23:56:44.106456+01	1	asdads	0	127.0.0.1	25	1
975	2023-11-26 23:57:02.011514+01	1	asdads	0	127.0.0.1	25	1
976	2023-11-26 23:57:05.657308+01	1	asdads	0	127.0.0.1	25	1
977	2023-11-26 23:57:10.442983+01	1	asdads	0	127.0.0.1	25	1
978	2023-11-26 23:58:01.435821+01	1	asdads	0	127.0.0.1	25	1
979	2023-11-26 23:58:02.654447+01	1	asdads	0	127.0.0.1	25	1
980	2023-11-26 23:58:06.282339+01	1	asdads	0	127.0.0.1	25	1
981	2023-11-26 23:58:41.42414+01	1	asdads	0	127.0.0.1	25	1
982	2023-11-26 23:58:51.048194+01	1	asdads	0	127.0.0.1	25	1
983	2023-11-26 23:58:53.512973+01	1	asdads	0	127.0.0.1	25	1
984	2023-11-26 23:58:55.9613+01	1	asdads	0	127.0.0.1	25	1
985	2023-11-26 23:59:04.322891+01	1	asdads	0	127.0.0.1	25	1
986	2023-11-26 23:59:06.773308+01	1	asdads	0	127.0.0.1	25	1
987	2023-11-26 23:59:10.372015+01	1	asdads	0	127.0.0.1	25	1
988	2023-11-26 23:59:15.168287+01	1	asdads	0	127.0.0.1	25	1
989	2023-11-26 23:59:21.233317+01	1	asdads	0	127.0.0.1	25	1
990	2023-11-26 23:59:22.319942+01	1	asdads	0	127.0.0.1	25	1
991	2023-11-27 00:00:20.302081+01	1	asdads	0	127.0.0.1	25	1
992	2023-11-27 00:00:22.744037+01	1	asdads	0	127.0.0.1	25	1
993	2023-11-27 00:00:32.392363+01	1	asdads	0	127.0.0.1	25	1
994	2023-11-27 00:00:39.588767+01	1	asdads	0	127.0.0.1	25	1
995	2023-11-27 00:00:42.026328+01	1	asdads	0	127.0.0.1	25	1
996	2023-11-27 00:01:32.850669+01	1	asdads	0	127.0.0.1	25	1
997	2023-11-27 00:01:36.519056+01	1	asdads	0	127.0.0.1	25	1
998	2023-11-27 00:01:42.856999+01	1	asdads	0	127.0.0.1	25	1
999	2023-11-27 00:01:46.476787+01	1	asdads	0	127.0.0.1	25	1
1000	2023-11-27 00:01:48.932833+01	1	asdads	0	127.0.0.1	25	1
1001	2023-11-27 00:01:53.740648+01	1	asdads	0	127.0.0.1	25	1
1002	2023-11-27 00:01:58.557551+01	1	asdads	0	127.0.0.1	25	1
1003	2023-11-27 00:01:59.799677+01	1	asdads	0	127.0.0.1	25	1
1004	2023-11-27 00:02:04.58072+01	1	asdads	0	127.0.0.1	25	1
1005	2023-11-27 00:02:26.163457+01	1	asdads	0	127.0.0.1	25	1
1006	2023-11-27 00:02:28.464928+01	1	asdads	0	127.0.0.1	25	1
1007	2023-11-27 00:02:30.912749+01	1	asdads	0	127.0.0.1	25	1
1008	2023-11-27 00:02:35.735149+01	1	asdads	0	127.0.0.1	25	1
1009	2023-11-27 00:02:40.54417+01	1	asdads	0	127.0.0.1	25	1
1010	2023-11-27 00:02:47.693787+01	1	asdads	0	127.0.0.1	25	1
1011	2023-11-27 00:02:50.124049+01	1	asdads	0	127.0.0.1	25	1
1012	2023-11-27 00:02:53.781454+01	1	asdads	0	127.0.0.1	25	1
1013	2023-11-27 00:03:16.137832+01	1	asdads	0	127.0.0.1	25	1
1014	2023-11-27 00:37:40.027556+01	1	a	2	127.0.0.1	25	1
1015	2023-11-27 00:51:01.214641+01	2		1	127.0.0.1	25	1
1016	2023-11-27 01:00:00.705311+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1017	2023-11-27 01:00:46.233042+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1018	2023-11-27 01:00:51.51205+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1019	2023-11-27 01:02:40.581274+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1020	2023-11-27 01:09:35.670943+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1021	2023-11-27 01:09:47.384712+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1022	2023-11-27 01:09:56.880906+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1023	2023-11-27 01:13:40.588705+01	1	a	0	127.0.0.1	25	1
1025	2023-11-27 01:16:44.17803+01	7	asdasd	1	127.0.0.1	25	1
1026	2023-11-27 01:18:42.349505+01	8	asdad	1	127.0.0.1	25	1
1027	2023-11-27 01:18:53.090678+01	9	22222	1	127.0.0.1	25	1
1028	2023-11-27 01:25:39.080484+01	1	hj	2	127.0.0.1	25	1
1029	2023-11-27 01:28:26.756651+01	1	modificado	2	127.0.0.1	25	1
1030	2023-11-27 01:30:56.805053+01	2	QQQ	2	127.0.0.1	25	1
1031	2023-11-27 01:34:50.560281+01	10	P1	1	127.0.0.1	25	1
1032	2023-11-27 01:34:56.019882+01	10	P1	0	127.0.0.1	25	1
1033	2023-11-27 01:35:18.48708+01	10	P1	0	127.0.0.1	25	1
1034	2023-11-27 01:35:20.88599+01	10	P1	0	127.0.0.1	25	1
1035	2023-11-27 01:35:24.446544+01	10	P1	0	127.0.0.1	25	1
1036	2023-11-27 01:35:30.321738+01	10	P1	0	127.0.0.1	25	1
1037	2023-11-27 01:35:38.627252+01	10	P1	0	127.0.0.1	25	1
1038	2023-11-27 01:35:42.125828+01	10	P1	0	127.0.0.1	25	1
1039	2023-11-27 01:35:45.691835+01	10	P1	0	127.0.0.1	25	1
1040	2023-11-27 01:35:48.007181+01	10	P1	0	127.0.0.1	25	1
1041	2023-11-27 01:35:52.70415+01	10	P1	0	127.0.0.1	25	1
1042	2023-11-27 01:36:31.525082+01	10	P1	0	127.0.0.1	25	1
1043	2023-11-27 01:36:39.356517+01	10	P1	0	127.0.0.1	25	1
1044	2023-11-27 01:37:43.635005+01	10	P1	2	127.0.0.1	25	1
1045	2023-11-27 01:38:56.544177+01	10	P1 2	2	127.0.0.1	25	1
1046	2023-11-27 01:39:01.758449+01	10	P1 2	0	127.0.0.1	25	1
1047	2023-11-27 01:39:23.945579+01	10	P1 2	2	127.0.0.1	25	1
1048	2023-11-27 01:39:36.561859+01	10	P1 2	0	127.0.0.1	25	1
1049	2023-11-27 01:42:26.081946+01	10	P1 2	3	127.0.0.1	25	1
1050	2023-11-27 01:44:57.121459+01	33	111	3	127.0.0.1	34	1
1051	2023-11-27 01:44:57.121459+01	79	qwe	3	127.0.0.1	27	1
1052	2023-11-27 01:44:57.13801+01	27	1 - 2023 - OE1.2	3	127.0.0.1	14	1
1053	2023-11-27 01:47:11.852312+01	10	P1 2	3	127.0.0.1	25	1
1054	2023-11-27 01:58:13.133323+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1055	2023-11-27 02:01:52.497421+01	14	Area nueva	1	127.0.0.1	2	1
1056	2023-11-27 02:03:10.486603+01	10	dffgnfgh	3	127.0.0.1	2	1
1057	2023-11-27 02:03:53.788607+01	4	prueba	3	127.0.0.1	2	1
1058	2023-11-27 02:04:40.746947+01	4	prueba	3	127.0.0.1	2	1
1059	2023-11-27 02:04:45.986506+01	8	asd	3	127.0.0.1	2	1
1060	2023-11-27 02:05:33.237443+01	14	Area nueva	3	127.0.0.1	2	1
1061	2023-11-27 02:23:21.810977+01	15	sdf	1	127.0.0.1	2	1
1062	2023-11-27 02:23:28.407966+01	3	Desarrollo	3	127.0.0.1	2	1
1063	2023-11-27 02:38:08.735209+01	16	jhjk	1	127.0.0.1	2	1
1064	2023-11-27 02:38:16.326628+01	17	111	1	127.0.0.1	2	1
1065	2023-11-27 02:39:20.858946+01	9	sdfsfd	2	127.0.0.1	2	1
1066	2023-11-27 02:41:56.069794+01	7	yuii	2	127.0.0.1	2	1
1067	2023-11-27 02:43:26.461824+01	6	ert	2	127.0.0.1	2	1
1068	2023-11-27 02:43:40.157767+01	16	jhjk	2	127.0.0.1	2	1
1069	2023-11-27 03:22:12.838467+01	6	ZZZ	2	127.0.0.1	2	1
1070	2023-11-27 03:22:23.279249+01	5	asdasd	3	127.0.0.1	2	1
1071	2023-11-27 03:22:28.922349+01	6	ZZZ	3	127.0.0.1	2	1
1072	2023-11-27 03:35:46.639426+01	2	Cuba	1	127.0.0.1	13	1
1073	2023-11-27 03:36:11.51721+01	2	Cuba	2	127.0.0.1	13	1
1074	2023-11-27 03:38:25.188804+01	2	Cuba Libre	2	127.0.0.1	13	1
1075	2023-11-27 03:44:47.778613+01	2	Cuba Libre asd	2	127.0.0.1	13	1
1076	2023-11-27 03:52:00.129577+01	1	EUA	2	127.0.0.1	13	1
1077	2023-11-27 04:05:59.126285+01	2	Cuba Libre 789789	2	127.0.0.1	13	1
1078	2023-11-27 04:06:07.779174+01	2	Cuba Libre 789789	3	127.0.0.1	13	1
1079	2023-11-27 04:07:31.360675+01	2	Cuba Libre 789789	3	127.0.0.1	13	1
1080	2023-11-27 04:08:13.606396+01	2	Cuba Libre 789789	3	127.0.0.1	13	1
1081	2023-11-27 04:10:14.067291+01	1	EUA	3	127.0.0.1	13	1
1082	2023-11-27 04:10:26.289331+01	3	Argentina	1	127.0.0.1	13	1
1083	2023-11-27 04:10:33.622335+01	2	Cuba Libre	2	127.0.0.1	13	1
1084	2023-11-27 04:10:40.088317+01	2	Cuba Libre	3	127.0.0.1	13	1
1085	2023-11-27 04:14:17.365154+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1086	2023-11-27 04:15:05.953017+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1087	2023-11-27 04:15:09.051108+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1088	2023-11-27 04:15:18.22384+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1089	2023-11-27 04:15:21.721856+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1090	2023-11-27 04:15:26.112668+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1091	2023-11-27 04:15:30.822128+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1092	2023-11-27 04:17:49.402576+01	1	UDI fg	2	127.0.0.1	2	1
1093	2023-11-27 04:19:51.917416+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1094	2023-11-27 04:25:58.551239+01	11	OE1.2 / Evaluación: 2. Algo mal	2	127.0.0.1	69	1
1095	2023-11-27 04:26:14.994982+01	11	OE1.2 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
1096	2023-11-27 04:26:27.039295+01	10	OE1.2 / Evaluación: 4. Casi bien	2	127.0.0.1	69	1
1097	2023-11-27 04:26:55.751858+01	2	2 ACD2	0	127.0.0.1	33	1
1098	2023-11-27 04:27:53.678314+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1099	2023-11-27 04:28:00.503048+01	31	iiii	0	127.0.0.1	34	1
1100	2023-11-27 04:28:27.710877+01	31	iiii	0	127.0.0.1	34	1
1101	2023-11-27 04:28:46.780333+01	31	iiii	0	127.0.0.1	34	1
1102	2023-11-27 04:28:49.222534+01	31	iiii	0	127.0.0.1	34	1
1103	2023-11-27 04:28:56.341313+01	31	iiii	0	127.0.0.1	34	1
1104	2023-11-27 04:28:58.59772+01	31	iiii	0	127.0.0.1	34	1
1105	2023-11-27 04:29:02.151448+01	31	iiii	0	127.0.0.1	34	1
1106	2023-11-27 04:29:24.526237+01	31	iiii	0	127.0.0.1	34	1
1107	2023-11-27 04:29:30.423937+01	31	iiii	0	127.0.0.1	34	1
1108	2023-11-27 04:29:36.362798+01	31	iiii	0	127.0.0.1	34	1
1109	2023-11-27 04:29:44.567518+01	31	iiii	0	127.0.0.1	34	1
1110	2023-11-27 04:29:55.353886+01	31	iiii	0	127.0.0.1	34	1
1111	2023-11-27 04:30:52.511666+01	31	iiii	0	127.0.0.1	34	1
1112	2023-11-27 04:30:58.570601+01	31	iiii	0	127.0.0.1	34	1
1113	2023-11-27 04:31:27.258763+01	31	iiii	0	127.0.0.1	34	1
1114	2023-11-27 04:31:30.866163+01	31	iiii	0	127.0.0.1	34	1
1115	2023-11-27 04:40:31.764374+01	4	asd	1	127.0.0.1	6	1
1116	2023-11-27 04:40:40.365886+01	5	QWE	1	127.0.0.1	6	1
1117	2023-11-27 04:42:58.995647+01	3	Cumplido	2	127.0.0.1	6	1
1118	2023-11-27 04:45:46.019615+01	2	a	2	127.0.0.1	2	1
1119	2023-11-27 04:46:48.474918+01	3	Cumplido	2	127.0.0.1	6	1
1120	2023-11-27 04:46:54.806851+01	4	QQQ	2	127.0.0.1	6	1
1121	2023-11-27 04:57:24.781328+01	2	Tomado	3	127.0.0.1	6	1
1122	2023-11-27 04:57:55.763841+01	5	QWE	3	127.0.0.1	6	1
1123	2023-11-27 04:58:55.791757+01	5	QWE	3	127.0.0.1	6	1
1124	2023-11-27 05:01:49.098075+01	4	QQQ	3	127.0.0.1	6	1
1125	2023-11-27 05:08:26.712905+01	11	fghfgh	1	127.0.0.1	25	1
1126	2023-11-27 05:08:52.100401+01	2	ISPJAE	1	127.0.0.1	46	1
1127	2023-11-27 05:09:07.39006+01	11	fghfgh	2	127.0.0.1	25	1
1128	2023-11-27 06:11:50.305566+01	18	sdrgfdfg	1	127.0.0.1	2	1
1129	2023-11-27 06:14:07.705184+01	7	yuii	3	127.0.0.1	2	1
1130	2023-11-27 06:14:38.311616+01	11	34sd	3	127.0.0.1	2	1
1131	2023-11-27 06:16:24.256211+01	3	Desarrollo	3	127.0.0.1	2	1
1132	2023-11-27 06:46:23.760444+01	12	asd	1	127.0.0.1	25	1
1133	2023-11-27 06:46:28.477695+01	12	asd	0	127.0.0.1	25	1
1134	2023-11-27 06:47:05.466188+01	12	tyu	2	127.0.0.1	25	1
1135	2023-11-27 06:47:09.890112+01	12	tyu	0	127.0.0.1	25	1
1136	2023-11-27 06:47:38.508941+01	12	tyu	3	127.0.0.1	25	1
1137	2023-11-27 13:44:41.41507+01			4	127.0.0.1	38	1
1138	2023-11-27 15:55:16.55769+01			4	127.0.0.1	38	1
1139	2023-11-27 15:57:11.254986+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1140	2023-11-27 16:02:26.930685+01	6	OE1.2 / Evaluación: 4. Casi bien	2	127.0.0.1	69	1
1141	2023-11-27 16:04:17.55907+01	33	111	3	127.0.0.1	34	1
1142	2023-11-27 16:04:17.565346+01	79	qwe	3	127.0.0.1	27	1
1143	2023-11-27 16:04:17.581831+01	27	1 - 2023 - OE1.2	3	127.0.0.1	14	1
1144	2023-11-27 16:06:37.880463+01	28	2 - 2023 - Nuevo	1	127.0.0.1	14	1
1145	2023-11-27 16:07:15.533033+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1148	2023-11-27 16:15:32.961887+01	31	iiii	0	127.0.0.1	34	1
1149	2023-11-27 16:16:05.109838+01	31	iiii	0	127.0.0.1	34	1
1150	2023-11-27 16:16:09.658775+01	33	111	0	127.0.0.1	34	1
1151	2023-11-27 16:17:27.616245+01	80	OT 2	1	127.0.0.1	27	1
1152	2023-11-27 16:17:32.706493+01	79	qwe	0	127.0.0.1	27	1
1153	2023-11-27 16:18:29.245391+01	80	OT 2	0	127.0.0.1	27	1
1154	2023-11-27 16:20:22.360558+01	80	OT 2	0	127.0.0.1	27	1
1155	2023-11-27 16:20:30.076967+01	79	qwe	0	127.0.0.1	27	1
1156	2023-11-27 16:21:39.263654+01	79	qwe	0	127.0.0.1	27	1
1157	2023-11-27 16:21:44.558228+01	79	qwe	0	127.0.0.1	27	1
1158	2023-11-27 16:21:47.559864+01	79	qwe	0	127.0.0.1	27	1
1159	2023-11-27 16:21:51.141812+01	79	qwe	0	127.0.0.1	27	1
1160	2023-11-27 16:21:58.060958+01	79	qwe	0	127.0.0.1	27	1
1161	2023-11-27 16:22:14.198078+01	79	qwe	0	127.0.0.1	27	1
1162	2023-11-27 16:22:20.815108+01	79	qwe	0	127.0.0.1	27	1
1163	2023-11-27 16:22:23.683909+01	79	qwe	0	127.0.0.1	27	1
1164	2023-11-27 16:22:33.019506+01	79	qwe	0	127.0.0.1	27	1
1165	2023-11-27 16:23:49.037156+01	80	OT 2	0	127.0.0.1	27	1
1166	2023-11-27 16:34:06.381557+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1167	2023-11-27 16:37:56.635158+01	32	ooooo	0	127.0.0.1	34	1
1168	2023-11-27 16:39:48.584428+01	32	ooooo	0	127.0.0.1	34	1
1169	2023-11-27 16:40:08.759313+01	32	ooooo	0	127.0.0.1	34	1
1170	2023-11-27 16:40:12.953986+01	32	ooooo	0	127.0.0.1	34	1
1171	2023-11-27 16:40:15.690743+01	32	ooooo	0	127.0.0.1	34	1
1172	2023-11-27 16:40:31.874476+01	32	ooooo	0	127.0.0.1	34	1
1173	2023-11-27 16:40:34.829527+01	32	ooooo	0	127.0.0.1	34	1
1174	2023-11-27 16:40:38.982934+01	32	ooooo	0	127.0.0.1	34	1
1175	2023-11-27 16:42:07.000155+01	2	2 ACD2	0	127.0.0.1	33	1
1176	2023-11-27 16:42:16.552375+01	2	2 ACD2	0	127.0.0.1	33	1
1177	2023-11-27 16:44:09.49242+01	2	2 ACD2	0	127.0.0.1	33	1
1178	2023-11-27 16:51:08.517683+01	16	8 esto es una pru3^^^^	1	127.0.0.1	33	1
1179	2023-11-27 16:51:15.636546+01	2	2 ACD2	0	127.0.0.1	33	1
1180	2023-11-27 16:52:36.593839+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1181	2023-11-27 16:52:59.270594+01	79	qwe	0	127.0.0.1	27	1
1182	2023-11-27 16:53:04.566652+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1183	2023-11-27 16:55:01.277029+01	79	qwe	0	127.0.0.1	27	1
1184	2023-11-27 17:00:04.020995+01	10	OE1.2 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
1185	2023-11-27 17:05:52.427715+01	13	Premio nacional a la innovación tecnológica 2022	1	127.0.0.1	25	1
1186	2023-11-27 17:25:37.811395+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1187	2023-11-27 21:53:56.967994+01			4	127.0.0.1	38	1
1188	2023-11-27 21:55:54.02719+01	10	P1 2	0	127.0.0.1	25	1
1189	2023-11-27 21:56:08.882358+01	10	P1 2	0	127.0.0.1	25	1
1190	2023-11-27 21:56:21.771544+01	10	P1 2	0	127.0.0.1	25	1
1191	2023-11-27 21:56:24.271588+01	10	P1 2	0	127.0.0.1	25	1
1192	2023-11-27 21:56:27.708663+01	10	P1 2	0	127.0.0.1	25	1
1193	2023-11-27 21:56:40.843551+01	10	P1 2	0	127.0.0.1	25	1
1194	2023-11-27 21:57:07.990431+01	10	P1 2	0	127.0.0.1	25	1
1195	2023-11-27 21:57:46.512571+01	10	P1 2	0	127.0.0.1	25	1
1196	2023-11-27 21:57:50.05592+01	10	P1 2	0	127.0.0.1	25	1
1197	2023-11-27 21:57:51.23913+01	10	P1 2	0	127.0.0.1	25	1
1198	2023-11-27 21:58:08.716743+01	10	P1 2	0	127.0.0.1	25	1
1199	2023-11-27 21:58:11.215326+01	10	P1 2	0	127.0.0.1	25	1
1200	2023-11-27 21:58:14.734902+01	10	P1 2	0	127.0.0.1	25	1
1201	2023-11-27 21:58:58.745473+01	10	P1 2	0	127.0.0.1	25	1
1202	2023-11-27 21:59:20.792277+01	10	P1 2	0	127.0.0.1	25	1
1203	2023-11-27 21:59:52.013666+01	10	P1 2	0	127.0.0.1	25	1
1204	2023-11-27 22:00:37.429902+01	10	P1 2	0	127.0.0.1	25	1
1207	2023-11-27 22:25:28.948612+01	6	OE1.2 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
1214	2023-11-27 22:35:03.502896+01	6	OE1.2 / Evaluación: 1. Muy mal	2	127.0.0.1	69	1
1215	2023-11-27 22:35:42.806113+01	10	OE1.2 / Evaluación: 4. Casi bien	2	127.0.0.1	69	1
1216	2023-11-27 22:55:33.008506+01	11	fghfgh	0	127.0.0.1	25	1
1217	2023-11-27 22:57:07.806209+01	29	3 - 2023 - OE10	1	127.0.0.1	14	1
1218	2023-11-27 22:57:20.131087+01	30	4 - 2023 - fgh	1	127.0.0.1	14	1
1219	2023-11-27 22:57:50.935381+01	29	3 - 2023 - OE10	2	127.0.0.1	14	1
1220	2023-11-27 22:57:59.875938+01	10	OE1.2 / Evaluación: 4. Casi bien	2	127.0.0.1	69	1
1221	2023-11-27 23:00:01.094433+01	27	1 - 2023 - OE1.2	3	127.0.0.1	14	1
1222	2023-11-27 23:00:17.994191+01	81	sdfsfd	1	127.0.0.1	27	1
1223	2023-11-27 23:01:59.493673+01	82	NUEVO	1	127.0.0.1	27	1
1230	2023-11-27 23:07:45.857486+01	79	qwe	0	127.0.0.1	27	1
1231	2023-11-27 23:07:57.008947+01	79	qwe	0	127.0.0.1	27	1
1232	2023-11-27 23:08:06.437456+01	79	qwe	0	127.0.0.1	27	1
1235	2023-11-27 23:25:43.603197+01	33	111	0	127.0.0.1	34	1
1236	2023-11-27 23:25:54.741708+01	33	111	0	127.0.0.1	34	1
1239	2023-11-27 23:26:23.817262+01	33	111	0	127.0.0.1	34	1
1242	2023-11-27 23:28:26.08282+01	41	dfgfdg	1	127.0.0.1	34	1
1243	2023-11-27 23:28:26.089819+01	20	dfgfdg por prueba	1	127.0.0.1	67	1
1244	2023-11-27 23:28:46.665028+01	42	79	1	127.0.0.1	34	1
1245	2023-11-27 23:28:46.670027+01	21	79 por dffgnfgh	1	127.0.0.1	67	1
1246	2023-11-27 23:31:00.927624+01	43	80	1	127.0.0.1	34	1
1247	2023-11-27 23:31:00.934692+01	22	80 por asd	1	127.0.0.1	67	1
1248	2023-11-27 23:33:33.568179+01	44	asd	1	127.0.0.1	34	1
1249	2023-11-27 23:33:33.572179+01	23	asd por dffgnfgh	1	127.0.0.1	67	1
1250	2023-11-27 23:34:17.324922+01	45	79	1	127.0.0.1	34	1
1251	2023-11-27 23:34:17.333038+01	24	79 por dffgnfgh	1	127.0.0.1	67	1
1252	2023-11-27 23:36:44.026284+01	46	asdd	1	127.0.0.1	34	1
1253	2023-11-27 23:36:44.033286+01	25	asdd por dffgnfgh	1	127.0.0.1	67	1
1254	2023-11-27 23:37:23.552153+01	47	82	1	127.0.0.1	34	1
1255	2023-11-27 23:37:23.556133+01	26	82 por dffgnfgh	1	127.0.0.1	67	1
1256	2023-11-27 23:43:55.420087+01	48	82	1	127.0.0.1	34	1
1257	2023-11-27 23:43:55.425086+01	27	82 por dffgnfgh	1	127.0.0.1	67	1
1258	2023-11-27 23:44:47.669804+01	49	82	1	127.0.0.1	34	1
1259	2023-11-27 23:44:47.676807+01	28	82 por asd	1	127.0.0.1	67	1
1260	2023-11-27 23:46:16.331281+01	50	82	1	127.0.0.1	34	1
1261	2023-11-27 23:46:16.336795+01	29	82 por dffgnfgh	1	127.0.0.1	67	1
1262	2023-11-27 23:46:40.64345+01	51	82	1	127.0.0.1	34	1
1263	2023-11-27 23:46:40.649457+01	30	82 por dffgnfgh	1	127.0.0.1	67	1
1265	2023-11-27 23:56:37.277764+01	52	asd	1	127.0.0.1	34	1
1266	2023-11-27 23:56:37.282763+01	31	asd por asd	1	127.0.0.1	67	1
1267	2023-11-27 23:57:06.399491+01	52	asd	2	127.0.0.1	34	1
1268	2023-11-27 23:57:06.404522+01	32	asd por asd	1	127.0.0.1	67	1
1269	2023-11-27 23:57:11.779812+01	52	asd	0	127.0.0.1	34	1
1270	2023-11-27 23:57:37.063661+01	52	asd	2	127.0.0.1	34	1
1271	2023-11-27 23:57:40.375359+01	52	asd	0	127.0.0.1	34	1
1272	2023-11-27 23:59:55.298859+01	52	asd	0	127.0.0.1	34	1
1273	2023-11-28 00:00:12.648515+01	80	OT 2	2	127.0.0.1	27	1
1274	2023-11-28 00:00:44.287445+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1275	2023-11-28 00:02:31.862516+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1276	2023-11-28 00:02:33.120072+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1277	2023-11-28 00:02:44.778588+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1278	2023-11-28 00:02:54.213515+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1279	2023-11-28 00:03:01.263537+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1280	2023-11-28 00:03:10.633507+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1281	2023-11-28 00:03:43.870493+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1282	2023-11-28 00:10:08.865542+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1283	2023-11-28 00:10:28.546932+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1284	2023-11-28 00:10:40.350422+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1285	2023-11-28 00:11:10.797821+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1286	2023-11-28 00:11:24.510928+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1287	2023-11-28 00:11:25.858959+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1288	2023-11-28 00:12:44.773796+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1289	2023-11-28 00:12:58.250199+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1290	2023-11-28 00:13:06.653193+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1291	2023-11-28 00:13:12.626312+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1292	2023-11-28 00:13:16.193234+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1293	2023-11-28 00:13:28.025867+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1294	2023-11-28 00:15:54.913716+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1295	2023-11-28 00:16:30.440283+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1296	2023-11-28 00:16:36.344728+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1297	2023-11-28 00:17:10.410871+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1298	2023-11-28 00:17:16.338341+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1299	2023-11-28 00:17:24.614745+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1300	2023-11-28 00:17:25.881472+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1301	2023-11-28 00:17:30.651366+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1302	2023-11-28 00:17:36.565461+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1303	2023-11-28 00:17:40.133601+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1304	2023-11-28 00:17:42.536988+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1305	2023-11-28 00:18:00.256144+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1306	2023-11-28 00:18:02.652006+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1307	2023-11-28 00:18:06.239983+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1308	2023-11-28 00:18:19.208675+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1309	2023-11-28 00:18:23.949785+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1310	2023-11-28 00:18:41.515794+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1311	2023-11-28 00:18:43.924561+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1312	2023-11-28 00:18:47.51244+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1313	2023-11-28 00:18:52.219979+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1314	2023-11-28 00:19:05.195784+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1315	2023-11-28 00:19:09.962157+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1316	2023-11-28 00:19:13.556043+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1317	2023-11-28 00:19:15.967577+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1318	2023-11-28 00:19:19.533004+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1319	2023-11-28 00:19:32.560486+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1320	2023-11-28 00:19:37.303461+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1321	2023-11-28 00:19:43.302428+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1322	2023-11-28 00:19:44.530219+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1323	2023-11-28 00:19:56.312521+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1324	2023-11-28 00:20:01.024086+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1325	2023-11-28 00:20:02.292595+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1326	2023-11-28 00:20:26.372842+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1327	2023-11-28 00:20:33.456977+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1328	2023-11-28 00:20:34.676797+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1329	2023-11-28 00:20:38.242874+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1330	2023-11-28 00:20:44.181489+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1331	2023-11-28 00:21:20.773561+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1332	2023-11-28 00:21:56.320709+01	28	2 - 2023 - Nuevo	2	127.0.0.1	14	1
1333	2023-11-28 00:22:02.401737+01	30	4 - 2023 - fgh	0	127.0.0.1	14	1
1334	2023-11-28 00:22:05.027803+01	29	3 - 2023 - OE10	0	127.0.0.1	14	1
1335	2023-11-28 00:22:07.328612+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1336	2023-11-28 00:22:30.340269+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1337	2023-11-28 00:22:33.984555+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1338	2023-11-28 00:22:38.692458+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1339	2023-11-28 00:22:39.947087+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1340	2023-11-28 00:22:41.139778+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1341	2023-11-28 00:22:43.519557+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1342	2023-11-28 00:22:45.941229+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1343	2023-11-28 00:22:50.658311+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1344	2023-11-28 00:22:51.892348+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1345	2023-11-28 00:23:00.109061+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1346	2023-11-28 00:23:26.58043+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1347	2023-11-28 00:23:38.358464+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1348	2023-11-28 00:24:26.023349+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1349	2023-11-28 00:24:47.361495+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1350	2023-11-28 00:25:01.479305+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1351	2023-11-28 00:25:05.076804+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1352	2023-11-28 00:25:11.839094+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1353	2023-11-28 00:25:57.24618+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1354	2023-11-28 00:28:04.631273+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1355	2023-11-28 00:28:08.219067+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1356	2023-11-28 00:28:11.800133+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1357	2023-11-28 00:28:17.676861+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1358	2023-11-28 00:28:24.845599+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1359	2023-11-28 00:28:56.381909+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1360	2023-11-28 00:29:12.357376+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1361	2023-11-28 00:29:27.822991+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1362	2023-11-28 00:31:14.029464+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1363	2023-11-28 00:33:23.540429+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1364	2023-11-28 00:33:49.511569+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1365	2023-11-28 00:34:13.901517+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1366	2023-11-28 00:35:03.895003+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1367	2023-11-28 00:35:12.25049+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1368	2023-11-28 00:35:22.835568+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1369	2023-11-28 00:35:35.995974+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1370	2023-11-28 00:35:55.158418+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1371	2023-11-28 00:36:05.20435+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1372	2023-11-28 00:36:14.59735+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1373	2023-11-28 00:36:34.411181+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1374	2023-11-28 00:36:35.620621+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1375	2023-11-28 00:36:39.089885+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1376	2023-11-28 00:36:52.334952+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1377	2023-11-28 00:36:57.153945+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1378	2023-11-28 00:37:16.239794+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1379	2023-11-28 00:37:22.73017+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1380	2023-11-28 00:37:36.916329+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1381	2023-11-28 00:37:54.637022+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1382	2023-11-28 00:38:17.243493+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1383	2023-11-28 00:38:27.010931+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1384	2023-11-28 00:40:47.511478+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1385	2023-11-28 00:40:50.11157+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1386	2023-11-28 00:40:51.23738+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1387	2023-11-28 00:40:59.712478+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1388	2023-11-28 00:41:10.5016+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1389	2023-11-28 00:41:13.193727+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1390	2023-11-28 00:41:16.840063+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1391	2023-11-28 00:41:20.505894+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1392	2023-11-28 00:41:22.942859+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1393	2023-11-28 00:43:06.678186+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1394	2023-11-28 00:43:17.480052+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1395	2023-11-28 00:43:23.538396+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1396	2023-11-28 00:45:34.170721+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1397	2023-11-28 00:45:39.123102+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1398	2023-11-28 00:45:42.736205+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1399	2023-11-28 00:45:45.136995+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1400	2023-11-28 00:46:19.725022+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1401	2023-11-28 00:46:26.939026+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1402	2023-11-28 00:46:30.711375+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1403	2023-11-28 00:46:37.791582+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1404	2023-11-28 00:46:54.451362+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1405	2023-11-28 00:46:56.873583+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1406	2023-11-28 00:47:00.387389+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1407	2023-11-28 00:47:01.629492+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1408	2023-11-28 00:47:10.995212+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1409	2023-11-28 00:47:20.38457+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1410	2023-11-28 00:47:22.771745+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1411	2023-11-28 00:47:28.679801+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1412	2023-11-28 00:49:51.173859+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1413	2023-11-28 00:50:14.274437+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1414	2023-11-28 00:50:22.702623+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1415	2023-11-28 00:50:26.296864+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1416	2023-11-28 00:50:31.048692+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1417	2023-11-28 00:50:32.258715+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1418	2023-11-28 00:50:34.648856+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1419	2023-11-28 00:50:54.968826+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1420	2023-11-28 00:50:56.344146+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1421	2023-11-28 00:51:13.330177+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1422	2023-11-28 00:51:14.832904+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1423	2023-11-28 00:51:24.529337+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1424	2023-11-28 00:51:43.441268+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1425	2023-11-28 00:51:45.866997+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1426	2023-11-28 00:51:58.987871+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1427	2023-11-28 00:52:02.691807+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1428	2023-11-28 00:52:10.92789+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1429	2023-11-28 00:52:20.3058+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1430	2023-11-28 00:52:22.812778+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1431	2023-11-28 00:52:53.520922+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1432	2023-11-28 00:53:18.247785+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1433	2023-11-28 00:53:20.700001+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1434	2023-11-28 00:53:24.256513+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1435	2023-11-28 00:53:25.481288+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1436	2023-11-28 00:53:43.304729+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1437	2023-11-28 00:53:52.081511+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1438	2023-11-28 00:53:53.415812+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1439	2023-11-28 00:53:58.265267+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1440	2023-11-28 00:53:59.486686+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1441	2023-11-28 00:54:14.039056+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1442	2023-11-28 00:54:16.415737+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1443	2023-11-28 01:15:53.487232+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1444	2023-11-28 01:15:55.009856+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1445	2023-11-28 01:15:56.22787+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1446	2023-11-28 01:16:02.17993+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1447	2023-11-28 01:16:39.272886+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1448	2023-11-28 01:16:46.338643+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1449	2023-11-28 01:16:53.484532+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1450	2023-11-28 01:17:10.034283+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1451	2023-11-28 01:17:12.410462+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1452	2023-11-28 01:17:14.803999+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1453	2023-11-28 01:17:31.295897+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1454	2023-11-28 01:17:33.674717+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1455	2023-11-28 01:17:36.098318+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1456	2023-11-28 01:17:46.73575+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1457	2023-11-28 01:17:49.141399+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1458	2023-11-28 01:17:56.230859+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1459	2023-11-28 01:17:57.435719+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1460	2023-11-28 01:18:17.72967+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1461	2023-11-28 01:18:22.501303+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1462	2023-11-28 01:18:24.919909+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1463	2023-11-28 01:18:30.877089+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1464	2023-11-28 01:18:35.599999+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1465	2023-11-28 01:18:36.833746+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1466	2023-11-28 01:18:40.420467+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1467	2023-11-28 01:18:42.830244+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1468	2023-11-28 01:18:49.905479+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1469	2023-11-28 01:18:54.631422+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1470	2023-11-28 01:18:58.216191+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1471	2023-11-28 01:19:04.191737+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1472	2023-11-28 01:19:12.660111+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1473	2023-11-28 01:19:28.112341+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1474	2023-11-28 01:23:15.177733+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1475	2023-11-28 01:23:18.736762+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1476	2023-11-28 01:23:53.753314+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1477	2023-11-28 01:24:00.875217+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1478	2023-11-28 01:26:57.183318+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1479	2023-11-28 01:28:16.760486+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1480	2023-11-28 01:28:22.087223+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1481	2023-11-28 01:28:26.410987+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1482	2023-11-28 01:28:49.353321+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1483	2023-11-28 01:28:55.089758+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1484	2023-11-28 01:28:59.233669+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1485	2023-11-28 01:29:02.101713+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1486	2023-11-28 01:30:11.295509+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1487	2023-11-28 01:30:25.803761+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1488	2023-11-28 01:31:03.235732+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1489	2023-11-28 01:31:06.031784+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1490	2023-11-28 01:31:09.847411+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1491	2023-11-28 01:31:18.429846+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1492	2023-11-28 01:32:26.678897+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1493	2023-11-28 01:32:46.856656+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1494	2023-11-28 01:32:50.869748+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1495	2023-11-28 01:32:53.60393+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1496	2023-11-28 01:33:18.776251+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1497	2023-11-28 01:33:41.551079+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1498	2023-11-28 01:33:54.003315+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1499	2023-11-28 01:34:33.393702+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1500	2023-11-28 01:34:47.485698+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1501	2023-11-28 01:34:58.354641+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1502	2023-11-28 01:35:34.049936+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1503	2023-11-28 01:35:57.454913+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1504	2023-11-28 01:36:01.328727+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1505	2023-11-28 01:36:33.097752+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1506	2023-11-28 01:36:59.193716+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1507	2023-11-28 01:37:07.851673+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1508	2023-11-28 01:37:19.163777+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1509	2023-11-28 01:55:13.803318+01	1	LogoEntity object (1)	1	127.0.0.1	47	1
1510	2023-11-28 01:56:10.340907+01	2	LogoEntity object (2)	1	127.0.0.1	47	1
1511	2023-11-28 04:29:09.729011+01	80	OT 2	0	127.0.0.1	27	1
1512	2023-11-28 04:30:17.211583+01	80	OT 2	0	127.0.0.1	27	1
1513	2023-11-28 04:30:49.598529+01	80	OT 2	0	127.0.0.1	27	1
1514	2023-11-28 04:31:11.828134+01	80	OT 2	0	127.0.0.1	27	1
1515	2023-11-28 04:31:14.232953+01	80	OT 2	0	127.0.0.1	27	1
1516	2023-11-28 04:31:56.394955+01	80	OT 2	0	127.0.0.1	27	1
1517	2023-11-28 04:32:03.483576+01	80	OT 2	0	127.0.0.1	27	1
1518	2023-11-28 04:32:04.787483+01	80	OT 2	0	127.0.0.1	27	1
1519	2023-11-28 04:32:21.724827+01	80	OT 2	0	127.0.0.1	27	1
1520	2023-11-28 04:32:24.150808+01	80	OT 2	0	127.0.0.1	27	1
1521	2023-11-28 04:32:26.457457+01	80	OT 2	0	127.0.0.1	27	1
1522	2023-11-28 04:32:30.288631+01	80	OT 2	0	127.0.0.1	27	1
1523	2023-11-28 04:32:32.898074+01	80	OT 2	0	127.0.0.1	27	1
1524	2023-11-28 04:32:35.394244+01	80	OT 2	0	127.0.0.1	27	1
1525	2023-11-28 04:32:52.058512+01	80	OT 2	0	127.0.0.1	27	1
1526	2023-11-28 04:33:18.346768+01	80	OT 2	0	127.0.0.1	27	1
1527	2023-11-28 04:33:23.214836+01	80	OT 2	0	127.0.0.1	27	1
1528	2023-11-28 04:33:35.049607+01	80	OT 2	0	127.0.0.1	27	1
1529	2023-11-28 04:35:09.809136+01	80	OT 2	0	127.0.0.1	27	1
1530	2023-11-28 04:36:54.077492+01	80	OT 2	0	127.0.0.1	27	1
1531	2023-11-28 04:37:44.050647+01	80	OT 2	0	127.0.0.1	27	1
1532	2023-11-28 04:38:26.774258+01	80	OT 2	0	127.0.0.1	27	1
1533	2023-11-28 04:39:01.371751+01	51	82	0	127.0.0.1	34	1
1534	2023-11-28 04:39:17.579908+01	53	T1	1	127.0.0.1	34	1
1535	2023-11-28 04:39:17.587908+01	33	T1 por ertert	1	127.0.0.1	67	1
1536	2023-11-28 04:39:29.067368+01	54	79	1	127.0.0.1	34	1
1537	2023-11-28 04:39:29.073345+01	34	79 por ZZZ	1	127.0.0.1	67	1
1538	2023-11-28 04:39:44.202646+01	52	asd	0	127.0.0.1	34	1
1539	2023-11-28 04:40:26.992536+01	52	asd	0	127.0.0.1	34	1
1540	2023-11-28 04:40:31.70759+01	52	asd	0	127.0.0.1	34	1
1541	2023-11-28 04:40:38.842581+01	52	asd	0	127.0.0.1	34	1
1542	2023-11-28 04:40:41.291028+01	52	asd	0	127.0.0.1	34	1
1543	2023-11-28 04:40:46.153517+01	52	asd	0	127.0.0.1	34	1
1544	2023-11-28 04:40:54.381012+01	52	asd	0	127.0.0.1	34	1
1545	2023-11-28 04:40:58.083345+01	52	asd	0	127.0.0.1	34	1
1546	2023-11-28 04:41:08.720271+01	52	asd	0	127.0.0.1	34	1
1547	2023-11-28 04:41:18.404577+01	52	asd	0	127.0.0.1	34	1
1548	2023-11-28 04:41:29.29477+01	52	asd	0	127.0.0.1	34	1
1549	2023-11-28 04:41:37.321128+01	52	asd	0	127.0.0.1	34	1
1550	2023-11-28 04:41:39.85239+01	52	asd	0	127.0.0.1	34	1
1551	2023-11-28 04:42:31.987671+01	52	asd	0	127.0.0.1	34	1
1552	2023-11-28 04:42:39.058617+01	52	asd	0	127.0.0.1	34	1
1553	2023-11-28 04:42:53.369834+01	52	asd	0	127.0.0.1	34	1
1554	2023-11-28 04:44:01.673424+01	52	asd	0	127.0.0.1	34	1
1555	2023-11-28 04:44:10.692092+01	52	asd	0	127.0.0.1	34	1
1556	2023-11-28 04:45:30.837568+01	52	asd	0	127.0.0.1	34	1
1557	2023-11-28 04:46:09.460442+01	52	asd	0	127.0.0.1	34	1
1558	2023-11-28 04:46:14.346428+01	52	asd	0	127.0.0.1	34	1
1559	2023-11-28 04:47:54.440932+01	52	asd	0	127.0.0.1	34	1
1560	2023-11-28 04:48:00.451942+01	52	asd	0	127.0.0.1	34	1
1561	2023-11-28 04:48:04.179293+01	52	asd	0	127.0.0.1	34	1
1562	2023-11-28 04:48:07.752635+01	52	asd	0	127.0.0.1	34	1
1563	2023-11-28 04:53:15.402541+01			5	127.0.0.1	38	1
1564	2023-11-28 04:53:52.249282+01			4	127.0.0.1	38	1
1565	2023-11-28 04:55:19.194629+01			4	127.0.0.1	38	1
1566	2023-11-28 04:56:04.393404+01			4	127.0.0.1	38	1
1567	2023-11-28 06:06:13.060133+01			5	127.0.0.1	38	1
1568	2023-11-28 06:07:38.356106+01			4	127.0.0.1	38	1
1569	2023-11-28 06:08:12.068143+01			4	127.0.0.1	38	1
1570	2023-11-28 06:08:53.368006+01			5	127.0.0.1	38	1
1571	2023-11-28 06:09:01.667345+01			4	127.0.0.1	38	1
1572	2023-11-28 06:09:29.66155+01			5	127.0.0.1	38	1
1573	2023-11-28 06:09:38.602987+01			4	127.0.0.1	38	1
1574	2023-11-28 06:13:53.840902+01			5	127.0.0.1	38	1
1575	2023-11-28 06:14:02.08828+01			4	127.0.0.1	38	1
1576	2023-11-28 06:14:36.264911+01			5	127.0.0.1	38	1
1577	2023-11-28 06:14:44.063242+01			4	127.0.0.1	38	1
1578	2023-11-28 06:17:29.057063+01			5	127.0.0.1	38	1
1579	2023-11-28 06:18:48.7508+01			4	127.0.0.1	38	1
1580	2023-11-28 06:19:09.326998+01			5	127.0.0.1	38	1
1581	2023-11-28 06:19:17.937144+01			4	127.0.0.1	38	1
1582	2023-11-28 06:28:57.977279+01			5	127.0.0.1	38	1
1583	2023-11-28 06:29:24.152574+01			4	127.0.0.1	38	1
1584	2023-11-28 06:29:40.805565+01			5	127.0.0.1	38	1
1585	2023-11-28 06:29:46.180006+01			4	127.0.0.1	38	1
1586	2023-11-28 06:30:54.943527+01			5	127.0.0.1	38	1
1587	2023-11-28 06:31:05.060522+01			4	127.0.0.1	38	1
1588	2023-11-28 06:31:15.811563+01			5	127.0.0.1	38	1
1589	2023-11-28 06:31:21.10931+01			4	127.0.0.1	38	1
1590	2023-11-28 06:31:56.22073+01			5	127.0.0.1	38	1
1591	2023-11-28 06:32:13.959143+01			4	127.0.0.1	38	1
1592	2023-11-28 06:33:20.167551+01			5	127.0.0.1	38	1
1593	2023-11-28 06:34:33.928527+01			4	127.0.0.1	38	1
1594	2023-11-28 06:34:43.697371+01			5	127.0.0.1	38	1
1595	2023-11-28 06:34:48.422692+01			4	127.0.0.1	38	1
1596	2023-11-28 06:34:58.807234+01			5	127.0.0.1	38	1
1597	2023-11-28 06:35:03.284807+01			4	127.0.0.1	38	1
1598	2023-11-28 06:37:15.806679+01			5	127.0.0.1	38	1
1599	2023-11-28 06:37:21.870935+01			4	127.0.0.1	38	1
1600	2023-11-28 06:37:38.459978+01			5	127.0.0.1	38	1
1601	2023-11-28 06:37:43.247177+01			4	127.0.0.1	38	1
1602	2023-11-28 06:46:52.466669+01			5	127.0.0.1	38	1
1603	2023-11-28 06:47:01.233366+01			4	127.0.0.1	38	1
1604	2023-11-28 06:49:12.224586+01			5	127.0.0.1	38	1
1605	2023-11-28 06:49:19.955723+01			4	127.0.0.1	38	1
1606	2023-11-28 06:49:24.703577+01			5	127.0.0.1	38	1
1607	2023-11-28 06:49:36.559948+01			4	127.0.0.1	38	1
1608	2023-11-28 06:52:37.876477+01			5	127.0.0.1	38	1
1609	2023-11-28 06:52:46.379851+01			4	127.0.0.1	38	1
1610	2023-11-28 06:55:40.187171+01			5	127.0.0.1	38	1
1611	2023-11-28 06:55:45.651877+01			4	127.0.0.1	38	1
1612	2023-11-28 06:57:19.775269+01			5	127.0.0.1	38	1
1613	2023-11-28 06:57:26.518194+01			4	127.0.0.1	38	1
1614	2023-11-28 06:57:53.035217+01			5	127.0.0.1	38	1
1615	2023-11-28 06:58:13.585191+01			4	127.0.0.1	38	1
1616	2023-11-28 06:59:32.791342+01			5	127.0.0.1	38	1
1617	2023-11-28 06:59:38.123527+01			4	127.0.0.1	38	1
1618	2023-11-28 07:03:14.699533+01			5	127.0.0.1	38	1
1619	2023-11-28 07:03:18.816491+01			4	127.0.0.1	38	1
1620	2023-11-28 07:04:46.156882+01			5	127.0.0.1	38	1
1621	2023-11-28 07:04:50.818008+01			4	127.0.0.1	38	1
1622	2023-11-28 07:06:36.168217+01			5	127.0.0.1	38	1
1623	2023-11-28 07:06:47.496053+01			4	127.0.0.1	38	1
1624	2023-11-28 07:07:55.078095+01			5	127.0.0.1	38	1
1625	2023-11-28 07:08:00.737479+01			4	127.0.0.1	38	1
1626	2023-11-28 07:10:07.548884+01			5	127.0.0.1	38	1
1627	2023-11-28 07:10:13.009811+01			4	127.0.0.1	38	1
1628	2023-11-28 07:11:28.396708+01			5	127.0.0.1	38	1
1629	2023-11-28 07:11:32.632485+01			4	127.0.0.1	38	1
1630	2023-11-28 07:12:46.484001+01			5	127.0.0.1	38	1
1631	2023-11-28 07:12:50.972993+01			4	127.0.0.1	38	1
1632	2023-11-28 07:13:27.961411+01			5	127.0.0.1	38	1
1633	2023-11-28 07:13:32.192114+01			4	127.0.0.1	38	1
1634	2023-11-28 07:14:05.011856+01			5	127.0.0.1	38	1
1635	2023-11-28 07:14:09.62921+01			4	127.0.0.1	38	1
1636	2023-11-28 14:02:16.345458+01			4	127.0.0.1	38	1
1637	2023-11-28 14:02:22.382165+01			5	127.0.0.1	38	1
1638	2023-11-28 14:02:28.715599+01			4	127.0.0.1	38	1
1639	2023-11-28 14:06:51.995629+01			5	127.0.0.1	38	1
1640	2023-11-28 14:06:56.124396+01			4	127.0.0.1	38	1
1641	2023-11-28 14:07:17.522141+01			5	127.0.0.1	38	1
1642	2023-11-28 14:07:23.914011+01			4	127.0.0.1	38	1
1643	2023-11-28 14:09:21.865538+01			5	127.0.0.1	38	1
1644	2023-11-28 14:09:26.435163+01			4	127.0.0.1	38	1
1645	2023-11-28 14:09:50.465539+01			5	127.0.0.1	38	1
1646	2023-11-28 14:09:56.661529+01			4	127.0.0.1	38	1
1647	2023-11-28 14:13:57.353467+01			5	127.0.0.1	38	1
1648	2023-11-28 14:14:18.134594+01			4	127.0.0.1	38	1
1649	2023-11-28 14:15:07.906645+01			5	127.0.0.1	38	1
1650	2023-11-28 14:15:12.718175+01			4	127.0.0.1	38	1
1651	2023-11-28 14:21:36.948182+01			5	127.0.0.1	38	1
1652	2023-11-28 14:21:42.199237+01			4	127.0.0.1	38	1
1653	2023-11-28 14:21:50.292422+01			5	127.0.0.1	38	1
1654	2023-11-28 14:21:54.646328+01			4	127.0.0.1	38	1
1655	2023-11-28 14:24:55.542407+01			5	127.0.0.1	38	1
1656	2023-11-28 14:25:00.450837+01			4	127.0.0.1	38	1
1657	2023-11-28 14:25:04.489073+01			5	127.0.0.1	38	1
1658	2023-11-28 14:25:23.76829+01			4	127.0.0.1	38	1
1659	2023-11-28 14:39:23.345933+01			5	127.0.0.1	38	1
1660	2023-11-28 14:39:27.897622+01			4	127.0.0.1	38	1
1661	2023-11-28 14:44:39.509057+01			5	127.0.0.1	38	1
1662	2023-11-28 14:44:44.175367+01			4	127.0.0.1	38	1
1663	2023-11-28 14:48:39.172566+01			5	127.0.0.1	38	1
1664	2023-11-28 14:48:44.361715+01			4	127.0.0.1	38	1
1665	2023-11-28 15:03:40.936438+01			5	127.0.0.1	38	1
1666	2023-11-28 15:03:44.936243+01			4	127.0.0.1	38	1
1667	2023-11-28 15:07:39.712451+01			5	127.0.0.1	38	1
1668	2023-11-28 15:07:46.271854+01			4	127.0.0.1	38	1
1669	2023-11-28 15:08:46.759709+01			5	127.0.0.1	38	1
1670	2023-11-28 15:08:57.600627+01			4	127.0.0.1	38	1
1671	2023-11-28 15:09:29.024252+01			5	127.0.0.1	38	1
1672	2023-11-28 15:09:43.813573+01			4	127.0.0.1	38	1
1673	2023-11-28 15:10:14.150293+01			5	127.0.0.1	38	1
1674	2023-11-28 15:10:17.886261+01			4	127.0.0.1	38	1
1675	2023-11-28 15:10:45.420482+01			5	127.0.0.1	38	1
1676	2023-11-28 15:10:49.596587+01			4	127.0.0.1	38	1
1677	2023-11-28 15:13:16.889397+01			5	127.0.0.1	38	1
1678	2023-11-28 15:13:21.107891+01			4	127.0.0.1	38	1
1679	2023-11-28 15:16:57.804621+01			5	127.0.0.1	38	1
1680	2023-11-28 15:17:16.185633+01			4	127.0.0.1	38	1
1681	2023-11-28 15:25:06.065818+01			5	127.0.0.1	38	1
1682	2023-11-28 15:26:15.423065+01			4	127.0.0.1	38	1
1683	2023-11-28 15:27:01.65348+01			5	127.0.0.1	38	1
1684	2023-11-28 15:27:06.925664+01			4	127.0.0.1	38	1
1685	2023-11-28 15:27:22.506246+01			5	127.0.0.1	38	1
1686	2023-11-28 15:27:26.576384+01			4	127.0.0.1	38	1
1687	2023-11-28 15:29:39.152296+01			5	127.0.0.1	38	1
1688	2023-11-28 15:32:03.19713+01			4	127.0.0.1	38	1
1689	2023-11-28 15:33:18.004612+01			5	127.0.0.1	38	1
1690	2023-11-28 15:33:21.518446+01			4	127.0.0.1	38	1
1691	2023-11-28 15:53:02.571548+01			5	127.0.0.1	38	1
1692	2023-11-28 15:53:19.674152+01			4	127.0.0.1	38	1
1693	2023-11-28 18:59:18.896954+01	15	7 asd	0	127.0.0.1	33	1
1694	2023-11-28 18:59:24.921405+01	15	7 asd	0	127.0.0.1	33	1
1695	2023-11-28 18:59:40.480164+01	15	7 asd	0	127.0.0.1	33	1
1696	2023-11-28 18:59:44.056999+01	15	7 asd	0	127.0.0.1	33	1
1697	2023-11-28 18:59:45.381064+01	15	7 asd	0	127.0.0.1	33	1
1698	2023-11-28 18:59:47.758116+01	15	7 asd	0	127.0.0.1	33	1
1699	2023-11-28 18:59:56.030781+01	15	7 asd	0	127.0.0.1	33	1
1700	2023-11-28 19:00:07.865225+01	15	7 asd	0	127.0.0.1	33	1
1701	2023-11-28 19:00:25.539661+01	15	7 asd	0	127.0.0.1	33	1
1702	2023-11-28 19:00:39.651337+01	15	7 asd	0	127.0.0.1	33	1
1703	2023-11-28 19:00:42.080827+01	15	7 asd	0	127.0.0.1	33	1
1704	2023-11-28 19:00:45.696623+01	15	7 asd	0	127.0.0.1	33	1
1705	2023-11-28 19:00:49.284069+01	15	7 asd	0	127.0.0.1	33	1
1706	2023-11-28 19:05:14.849952+01	15	7 asd	0	127.0.0.1	33	1
1707	2023-11-28 19:05:18.431698+01	15	7 asd	0	127.0.0.1	33	1
1708	2023-11-28 19:05:57.566737+01	15	7 asd	0	127.0.0.1	33	1
1709	2023-11-28 19:06:00.159745+01	15	7 asd	0	127.0.0.1	33	1
1710	2023-11-28 19:07:13.149485+01	15	7 asd	0	127.0.0.1	33	1
1711	2023-11-28 19:07:15.557513+01	15	7 asd	0	127.0.0.1	33	1
1712	2023-11-28 19:07:22.639698+01	15	7 asd	0	127.0.0.1	33	1
1713	2023-11-28 19:07:34.385314+01	15	7 asd	0	127.0.0.1	33	1
1714	2023-11-28 19:07:36.832274+01	15	7 asd	0	127.0.0.1	33	1
1715	2023-11-28 19:07:40.383575+01	15	7 asd	0	127.0.0.1	33	1
1716	2023-11-28 19:07:41.612515+01	15	7 asd	0	127.0.0.1	33	1
1717	2023-11-28 19:07:53.425292+01	15	7 asd	0	127.0.0.1	33	1
1718	2023-11-28 19:08:02.924061+01	15	7 asd	0	127.0.0.1	33	1
1719	2023-11-28 19:08:15.42956+01	15	7 asd	0	127.0.0.1	33	1
1720	2023-11-28 19:08:18.181465+01	15	7 asd	0	127.0.0.1	33	1
1721	2023-11-28 19:09:00.816459+01	15	7 asd	0	127.0.0.1	33	1
1722	2023-11-28 19:09:05.582328+01	15	7 asd	0	127.0.0.1	33	1
1723	2023-11-28 19:09:26.816132+01	15	7 asd	0	127.0.0.1	33	1
1724	2023-11-28 19:09:33.996437+01	15	7 asd	0	127.0.0.1	33	1
1725	2023-11-28 19:09:36.430603+01	15	7 asd	0	127.0.0.1	33	1
1726	2023-11-28 19:09:43.548285+01	15	7 asd	0	127.0.0.1	33	1
1727	2023-11-28 19:09:47.27581+01	15	7 asd	0	127.0.0.1	33	1
1728	2023-11-28 19:10:02.491318+01	15	7 asd	0	127.0.0.1	33	1
1729	2023-11-28 19:10:06.13261+01	15	7 asd	0	127.0.0.1	33	1
1730	2023-11-28 19:10:16.791268+01	15	7 asd	0	127.0.0.1	33	1
1731	2023-11-28 19:10:21.575631+01	15	7 asd	0	127.0.0.1	33	1
1732	2023-11-28 19:10:26.353473+01	15	7 asd	0	127.0.0.1	33	1
1733	2023-11-28 19:10:38.184522+01	15	7 asd	0	127.0.0.1	33	1
1734	2023-11-28 19:10:41.863527+01	15	7 asd	0	127.0.0.1	33	1
1735	2023-11-28 19:10:44.301497+01	15	7 asd	0	127.0.0.1	33	1
1736	2023-11-28 19:10:49.142784+01	15	7 asd	0	127.0.0.1	33	1
1737	2023-11-28 19:11:01.039585+01	15	7 asd	0	127.0.0.1	33	1
1738	2023-11-28 19:11:02.268825+01	15	7 asd	0	127.0.0.1	33	1
1739	2023-11-28 19:11:07.060842+01	15	7 asd	0	127.0.0.1	33	1
1740	2023-11-28 19:11:08.311419+01	15	7 asd	0	127.0.0.1	33	1
1741	2023-11-28 19:11:13.120532+01	15	7 asd	0	127.0.0.1	33	1
1742	2023-11-28 19:11:14.344315+01	15	7 asd	0	127.0.0.1	33	1
1743	2023-11-28 19:11:22.709953+01	15	7 asd	0	127.0.0.1	33	1
1744	2023-11-28 19:11:39.289789+01	15	7 asd	0	127.0.0.1	33	1
1745	2023-11-28 19:11:41.786898+01	15	7 asd	0	127.0.0.1	33	1
1746	2023-11-28 19:11:55.99639+01	15	7 asd	0	127.0.0.1	33	1
1747	2023-11-28 19:11:57.241346+01	15	7 asd	0	127.0.0.1	33	1
1748	2023-11-28 19:11:59.672794+01	15	7 asd	0	127.0.0.1	33	1
1749	2023-11-28 19:12:02.140434+01	15	7 asd	0	127.0.0.1	33	1
1750	2023-11-28 19:12:03.374488+01	15	7 asd	0	127.0.0.1	33	1
1751	2023-11-28 19:12:07.015994+01	15	7 asd	0	127.0.0.1	33	1
1752	2023-11-28 19:12:11.816999+01	15	7 asd	0	127.0.0.1	33	1
1753	2023-11-28 19:12:16.64779+01	15	7 asd	0	127.0.0.1	33	1
1754	2023-11-28 19:12:21.479213+01	15	7 asd	0	127.0.0.1	33	1
1755	2023-11-28 19:12:27.520423+01	15	7 asd	0	127.0.0.1	33	1
1756	2023-11-28 19:12:31.185687+01	15	7 asd	0	127.0.0.1	33	1
1757	2023-11-28 19:12:37.254376+01	15	7 asd	0	127.0.0.1	33	1
1758	2023-11-28 19:12:42.146397+01	15	7 asd	0	127.0.0.1	33	1
1759	2023-11-28 19:12:44.643926+01	15	7 asd	0	127.0.0.1	33	1
1760	2023-11-28 19:12:50.730698+01	15	7 asd	0	127.0.0.1	33	1
1761	2023-11-28 19:13:00.305696+01	15	7 asd	0	127.0.0.1	33	1
1762	2023-11-28 19:13:04.052246+01	15	7 asd	0	127.0.0.1	33	1
1763	2023-11-28 19:13:07.728556+01	15	7 asd	0	127.0.0.1	33	1
1764	2023-11-28 19:13:12.523597+01	15	7 asd	0	127.0.0.1	33	1
1765	2023-11-28 19:13:22.20103+01	15	7 asd	0	127.0.0.1	33	1
1766	2023-11-28 19:13:27.04983+01	15	7 asd	0	127.0.0.1	33	1
1767	2023-11-28 19:13:30.677746+01	15	7 asd	0	127.0.0.1	33	1
1768	2023-11-28 19:13:45.259828+01	15	7 asd	0	127.0.0.1	33	1
1769	2023-11-28 19:13:46.521783+01	15	7 asd	0	127.0.0.1	33	1
1770	2023-11-28 19:13:58.827884+01	15	7 asd	0	127.0.0.1	33	1
1771	2023-11-28 19:14:00.107738+01	15	7 asd	0	127.0.0.1	33	1
1772	2023-11-28 19:14:06.497355+01	15	7 asd	0	127.0.0.1	33	1
1773	2023-11-28 19:14:13.982674+01	15	7 asd	0	127.0.0.1	33	1
1774	2023-11-28 19:14:19.007906+01	15	7 asd	0	127.0.0.1	33	1
1775	2023-11-28 19:14:27.650412+01	15	7 asd	0	127.0.0.1	33	1
1776	2023-11-28 19:15:04.466441+01	15	7 asd	0	127.0.0.1	33	1
1777	2023-11-28 19:15:06.851686+01	15	7 asd	0	127.0.0.1	33	1
1778	2023-11-28 19:15:10.457307+01	15	7 asd	0	127.0.0.1	33	1
1779	2023-11-28 19:15:11.671936+01	15	7 asd	0	127.0.0.1	33	1
1780	2023-11-28 19:15:16.402406+01	15	7 asd	0	127.0.0.1	33	1
1781	2023-11-28 19:15:18.798357+01	15	7 asd	0	127.0.0.1	33	1
1782	2023-11-28 19:15:23.590097+01	15	7 asd	0	127.0.0.1	33	1
1783	2023-11-28 19:15:31.936236+01	15	7 asd	0	127.0.0.1	33	1
1784	2023-11-28 19:15:44.235591+01	15	7 asd	0	127.0.0.1	33	1
1785	2023-11-28 19:15:51.696355+01	15	7 asd	0	127.0.0.1	33	1
1786	2023-11-28 19:15:57.859991+01	15	7 asd	0	127.0.0.1	33	1
1787	2023-11-28 19:16:05.24547+01	15	7 asd	0	127.0.0.1	33	1
1788	2023-11-28 19:27:38.344536+01	15	7 asd	0	127.0.0.1	33	1
1789	2023-11-28 19:27:48.403652+01	15	7 asd	0	127.0.0.1	33	1
1790	2023-11-28 19:27:49.819371+01	15	7 asd	0	127.0.0.1	33	1
1791	2023-11-28 19:46:25.728763+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1792	2023-11-28 19:46:34.202083+01	30	4 - 2023 - fgh	0	127.0.0.1	14	1
1793	2023-11-28 19:46:45.515904+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1794	2023-11-28 19:47:54.265904+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1795	2023-11-28 19:48:07.279701+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1796	2023-11-28 19:48:08.535966+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1797	2023-11-28 19:48:10.927343+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1798	2023-11-28 19:48:13.393615+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1799	2023-11-28 19:48:14.592706+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1800	2023-11-28 19:48:15.858062+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1801	2023-11-28 19:48:18.455862+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1802	2023-11-28 19:48:20.98881+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1803	2023-11-28 19:48:23.655746+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1804	2023-11-28 19:48:29.671926+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1805	2023-11-28 19:48:33.285444+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1806	2023-11-28 19:48:35.70441+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1807	2023-11-28 19:48:38.08143+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1808	2023-11-28 19:48:39.362526+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1809	2023-11-28 19:48:40.564313+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1810	2023-11-28 19:48:41.824437+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1811	2023-11-28 19:48:45.429547+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1812	2023-11-28 19:48:46.631405+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1813	2023-11-28 19:48:51.332716+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1814	2023-11-28 19:49:05.475541+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1815	2023-11-28 19:49:07.899562+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1816	2023-11-28 19:49:13.853969+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1817	2023-11-28 19:49:24.551498+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1818	2023-11-28 19:49:26.959779+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1819	2023-11-28 19:49:39.295292+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1820	2023-11-28 19:49:40.691093+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1821	2023-11-28 19:49:43.21485+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1822	2023-11-28 19:50:23.850203+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1823	2023-11-28 19:50:24.665309+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1824	2023-11-28 19:50:31.913621+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1825	2023-11-28 19:50:32.604628+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1826	2023-11-28 19:50:39.308752+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1827	2023-11-28 19:50:41.729488+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1828	2023-11-28 19:50:50.022884+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1829	2023-11-28 19:50:52.458052+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1830	2023-11-28 19:51:01.875835+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1831	2023-11-28 19:51:06.64041+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1832	2023-11-28 19:51:11.431243+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1833	2023-11-28 19:51:18.541376+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1834	2023-11-28 19:51:36.410121+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1835	2023-11-28 19:51:53.019675+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1836	2023-11-28 19:52:09.626486+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1837	2023-11-28 19:52:14.369325+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1838	2023-11-28 19:52:31.491458+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1839	2023-11-28 19:52:48.25237+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1840	2023-11-28 19:52:52.961649+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1841	2023-11-28 19:52:56.547635+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1842	2023-11-28 19:53:00.104016+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1843	2023-11-28 19:53:21.359908+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1844	2023-11-28 19:53:28.480281+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1845	2023-11-28 19:53:36.784611+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1846	2023-11-28 19:53:43.949532+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1847	2023-11-28 19:53:48.737706+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1848	2023-11-28 19:54:08.872358+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1849	2023-11-28 20:15:35.465572+01	80	OT 2	0	127.0.0.1	27	1
1850	2023-11-28 20:15:49.118501+01	80	OT 2	0	127.0.0.1	27	1
1851	2023-11-28 20:16:08.078479+01	80	OT 2	0	127.0.0.1	27	1
1852	2023-11-28 20:19:45.075271+01	80	OT 2	0	127.0.0.1	27	1
1853	2023-11-28 20:19:55.760989+01	80	OT 2	0	127.0.0.1	27	1
1854	2023-11-28 20:19:59.364667+01	80	OT 2	0	127.0.0.1	27	1
1855	2023-11-28 20:20:06.604558+01	80	OT 2	0	127.0.0.1	27	1
1856	2023-11-28 20:36:14.703918+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1857	2023-11-28 20:36:22.141989+01	80	OT 2	0	127.0.0.1	27	1
1858	2023-11-28 20:36:49.407806+01	80	OT 2	0	127.0.0.1	27	1
1859	2023-11-28 20:37:00.060322+01	80	OT 2	0	127.0.0.1	27	1
1860	2023-11-28 20:37:07.150806+01	80	OT 2	0	127.0.0.1	27	1
1861	2023-11-28 20:37:21.288064+01	80	OT 2	0	127.0.0.1	27	1
1862	2023-11-28 20:37:24.872942+01	80	OT 2	0	127.0.0.1	27	1
1863	2023-11-28 20:37:27.319576+01	80	OT 2	0	127.0.0.1	27	1
1864	2023-11-28 20:37:28.535054+01	80	OT 2	0	127.0.0.1	27	1
1865	2023-11-28 20:37:30.987196+01	80	OT 2	0	127.0.0.1	27	1
1866	2023-11-28 20:37:32.262021+01	80	OT 2	0	127.0.0.1	27	1
1867	2023-11-28 20:37:40.517582+01	80	OT 2	0	127.0.0.1	27	1
1868	2023-11-28 20:37:45.31194+01	80	OT 2	0	127.0.0.1	27	1
1869	2023-11-28 20:38:14.801808+01	80	OT 2	0	127.0.0.1	27	1
1870	2023-11-28 20:38:26.558855+01	80	OT 2	0	127.0.0.1	27	1
1871	2023-11-28 20:38:28.938215+01	80	OT 2	0	127.0.0.1	27	1
1872	2023-11-28 20:38:33.771666+01	80	OT 2	0	127.0.0.1	27	1
1873	2023-11-28 20:38:50.308138+01	80	OT 2	0	127.0.0.1	27	1
1874	2023-11-28 20:38:55.109828+01	80	OT 2	0	127.0.0.1	27	1
1875	2023-11-28 20:39:08.078813+01	80	OT 2	0	127.0.0.1	27	1
1876	2023-11-28 20:39:11.650633+01	80	OT 2	0	127.0.0.1	27	1
1877	2023-11-28 20:39:14.075311+01	80	OT 2	0	127.0.0.1	27	1
1878	2023-11-28 20:39:20.019206+01	80	OT 2	0	127.0.0.1	27	1
1879	2023-11-28 20:39:35.364173+01	80	OT 2	0	127.0.0.1	27	1
1880	2023-11-28 20:39:37.75141+01	80	OT 2	0	127.0.0.1	27	1
1881	2023-11-28 20:39:38.98819+01	80	OT 2	0	127.0.0.1	27	1
1882	2023-11-28 20:39:40.263373+01	80	OT 2	0	127.0.0.1	27	1
1883	2023-11-28 20:39:44.996557+01	80	OT 2	0	127.0.0.1	27	1
1884	2023-11-28 20:40:13.320385+01	80	OT 2	0	127.0.0.1	27	1
1885	2023-11-28 20:40:16.015512+01	80	OT 2	0	127.0.0.1	27	1
1886	2023-11-28 20:40:22.089717+01	80	OT 2	0	127.0.0.1	27	1
1887	2023-11-28 20:40:24.500264+01	80	OT 2	0	127.0.0.1	27	1
1888	2023-11-28 20:40:26.929575+01	80	OT 2	0	127.0.0.1	27	1
1889	2023-11-28 20:40:36.518147+01	80	OT 2	0	127.0.0.1	27	1
1890	2023-11-28 20:40:39.167784+01	80	OT 2	0	127.0.0.1	27	1
1891	2023-11-28 20:40:54.481402+01	80	OT 2	0	127.0.0.1	27	1
1892	2023-11-28 20:40:59.258595+01	80	OT 2	0	127.0.0.1	27	1
1893	2023-11-28 20:41:05.287416+01	80	OT 2	0	127.0.0.1	27	1
1894	2023-11-28 20:41:08.901537+01	80	OT 2	0	127.0.0.1	27	1
1895	2023-11-28 20:41:14.934964+01	80	OT 2	0	127.0.0.1	27	1
1896	2023-11-28 20:41:18.633002+01	80	OT 2	0	127.0.0.1	27	1
1897	2023-11-28 20:41:21.101294+01	80	OT 2	0	127.0.0.1	27	1
1898	2023-11-28 20:41:31.823622+01	80	OT 2	0	127.0.0.1	27	1
1899	2023-11-28 20:41:34.280523+01	80	OT 2	0	127.0.0.1	27	1
1900	2023-11-28 20:41:39.158742+01	80	OT 2	0	127.0.0.1	27	1
1901	2023-11-28 20:41:54.607947+01	80	OT 2	0	127.0.0.1	27	1
1902	2023-11-28 20:41:55.894644+01	80	OT 2	0	127.0.0.1	27	1
1903	2023-11-28 20:41:57.219523+01	80	OT 2	0	127.0.0.1	27	1
1904	2023-11-28 20:42:03.388088+01	80	OT 2	0	127.0.0.1	27	1
1905	2023-11-28 20:42:05.902524+01	80	OT 2	0	127.0.0.1	27	1
1906	2023-11-28 20:42:09.545729+01	80	OT 2	0	127.0.0.1	27	1
1907	2023-11-28 20:42:10.848483+01	80	OT 2	0	127.0.0.1	27	1
1908	2023-11-28 20:42:16.948592+01	80	OT 2	0	127.0.0.1	27	1
1909	2023-11-28 20:42:19.393424+01	80	OT 2	0	127.0.0.1	27	1
1910	2023-11-28 20:42:20.633037+01	80	OT 2	0	127.0.0.1	27	1
1911	2023-11-28 20:42:44.428013+01	80	OT 2	0	127.0.0.1	27	1
1912	2023-11-28 20:42:54.020306+01	80	OT 2	0	127.0.0.1	27	1
1913	2023-11-28 20:43:00.081335+01	80	OT 2	0	127.0.0.1	27	1
1914	2023-11-28 20:43:01.369758+01	80	OT 2	0	127.0.0.1	27	1
1915	2023-11-28 20:43:03.980319+01	80	OT 2	0	127.0.0.1	27	1
1916	2023-11-28 20:48:58.604779+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1917	2023-11-28 20:49:05.856417+01	28	2 - 2023 - Nuevo	0	127.0.0.1	14	1
1918	2023-11-28 21:48:52.966114+01	28	2 - 2023 - O.E. 28	2	127.0.0.1	14	1
1919	2023-11-28 21:57:47.740079+01	30	4 - 2023 - O.E. 30	2	127.0.0.1	14	1
1920	2023-11-28 21:58:50.696575+01	79	qwe	2	127.0.0.1	27	1
1921	2023-11-28 22:26:26.733935+01	80	OT 2	0	127.0.0.1	27	1
1922	2023-11-28 22:26:29.473267+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1923	2023-11-28 22:26:35.634076+01	15	7 asd	0	127.0.0.1	33	1
1924	2023-11-28 22:26:38.369676+01	51	82	0	127.0.0.1	34	1
1925	2023-11-28 22:26:42.686162+01	51	82	0	127.0.0.1	34	1
1926	2023-11-28 22:26:46.733284+01	80	OT 2	0	127.0.0.1	27	1
1927	2023-11-28 22:26:50.217366+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1928	2023-11-28 22:26:57.299391+01	80	OT 2	0	127.0.0.1	27	1
1929	2023-11-28 22:28:21.36664+01	80	OT 2	0	127.0.0.1	27	1
1930	2023-11-28 22:28:31.500585+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1931	2023-11-28 22:28:36.587061+01	29	3 - 2023 - OE10	0	127.0.0.1	14	1
1932	2023-11-28 22:29:05.678369+01	28	2 - 2023 - O.E. 28	0	127.0.0.1	14	1
1933	2023-11-28 22:30:00.227406+01	30	4 - 2023 - O.E. 30	0	127.0.0.1	14	1
1934	2023-11-28 22:30:04.728108+01	81	sdfsfd	0	127.0.0.1	27	1
1935	2023-11-28 22:30:07.50155+01	80	OT 2	0	127.0.0.1	27	1
1936	2023-11-28 22:31:56.738075+01	80	OT 2	0	127.0.0.1	27	1
1937	2023-11-28 22:31:58.035927+01	80	OT 2	0	127.0.0.1	27	1
1938	2023-11-28 22:32:02.942428+01	80	OT 2	0	127.0.0.1	27	1
1939	2023-11-28 22:32:04.318443+01	80	OT 2	0	127.0.0.1	27	1
1940	2023-11-28 23:34:11.913378+01	28	2 - 2023 - O.E. 28	0	127.0.0.1	14	1
1941	2023-11-28 23:52:33.465508+01			5	127.0.0.1	38	1
1942	2023-11-28 23:52:36.855799+01			4	127.0.0.1	38	1
1943	2023-11-28 23:53:33.155599+01			5	127.0.0.1	38	1
1944	2023-11-28 23:53:35.739733+01			4	127.0.0.1	38	1
1945	2023-11-28 23:54:28.140145+01			5	127.0.0.1	38	1
1946	2023-11-28 23:54:35.601946+01			4	127.0.0.1	38	1
1947	2023-11-28 23:54:49.767375+01			5	127.0.0.1	38	1
1948	2023-11-28 23:55:10.625932+01			4	127.0.0.1	38	1
1949	2023-11-28 23:55:19.921879+01			5	127.0.0.1	38	1
1950	2023-11-28 23:55:22.565366+01			4	127.0.0.1	38	1
1951	2023-11-29 02:17:22.41744+01	15	7 asd	0	127.0.0.1	33	1
1952	2023-11-29 02:17:26.036331+01	2	2 ACD2	0	127.0.0.1	33	1
1953	2023-11-29 02:17:55.933396+01	27	1 - 2023 - OE1.2	0	127.0.0.1	14	1
1954	2023-11-29 02:17:59.622575+01	30	4 - 2023 - O.E. 30	0	127.0.0.1	14	1
1955	2023-11-29 02:18:02.141838+01	28	2 - 2023 - O.E. 28	0	127.0.0.1	14	1
1956	2023-11-29 02:18:07.064496+01	29	3 - 2023 - OE10	0	127.0.0.1	14	1
1957	2023-11-29 02:18:10.968135+01	28	2 - 2023 - O.E. 28	0	127.0.0.1	14	1
1958	2023-11-29 02:18:24.644517+01	17	O.E. 28 / Evaluación: 1. Muy mal	1	127.0.0.1	69	1
1959	2023-11-29 02:18:34.678049+01	18	O.E. 28 / Evaluación: 3. Regular	1	127.0.0.1	69	1
1960	2023-11-29 02:18:46.667523+01	18	O.E. 28 / Evaluación: 4. Casi bien	2	127.0.0.1	69	1
1961	2023-11-29 02:18:53.701022+01	19	O.E. 28 / Evaluación: 5. Muy bien	1	127.0.0.1	69	1
1962	2023-11-29 02:19:00.392919+01	12	O.E. 28 / Evaluación: 5. Muy bien	2	127.0.0.1	69	1
1963	2023-11-29 02:19:09.864415+01	28	2 - 2023 - O.E. 28	0	127.0.0.1	14	1
1964	2023-11-29 03:54:49.608209+01	1	premio	1	127.0.0.1	37	1
1965	2023-11-29 04:04:38.353892+01	2	asd	1	127.0.0.1	37	1
1966	2023-11-29 04:05:41.702521+01	3	e	1	127.0.0.1	37	1
1967	2023-11-29 04:06:07.183781+01	4	w	1	127.0.0.1	37	1
1968	2023-11-29 04:37:38.2229+01	5	asd	1	127.0.0.1	37	1
1969	2023-11-29 04:39:27.625198+01	6	asde	1	127.0.0.1	37	1
1970	2023-11-29 04:46:45.31021+01	7	wer	1	127.0.0.1	37	1
1971	2023-11-29 04:48:42.73557+01	8	werrty	1	127.0.0.1	37	1
1972	2023-11-29 04:48:52.667512+01	9	tyu	1	127.0.0.1	37	1
1973	2023-11-29 04:53:44.310912+01	10	sdf	1	127.0.0.1	37	1
1974	2023-11-29 04:59:23.702599+01	11	dfsdf	1	127.0.0.1	37	1
1975	2023-11-29 05:09:15.328373+01	9	tyu	3	127.0.0.1	37	1
1976	2023-11-29 05:19:25.663082+01	12	dfgh	1	127.0.0.1	37	1
1977	2023-11-29 05:19:58.054698+01	13	QQQQ	1	127.0.0.1	37	1
1978	2023-11-29 05:20:56.926389+01	14	WWW	1	127.0.0.1	37	1
1979	2023-11-29 05:21:02.020263+01	10	sdf	3	127.0.0.1	37	1
1980	2023-11-29 05:21:09.262837+01	13	QQQQ	3	127.0.0.1	37	1
1981	2023-11-29 06:16:58.541316+01	2	asd	1	127.0.0.1	38	1
1982	2023-11-29 06:21:43.747028+01	3	asd2	1	127.0.0.1	38	1
1983	2023-11-29 07:20:09.833111+01	8aecf576-aa0b-4715-af8d-2f6d914b1e13	asd2	2	127.0.0.1	41	1
1984	2023-11-29 07:21:07.363528+01	8aecf576-aa0b-4715-af8d-2f6d914b1e13	asd2	2	127.0.0.1	41	1
1985	2023-11-29 07:29:36.958253+01	8aecf576-aa0b-4715-af8d-2f6d914b1e13	asd2	2	127.0.0.1	41	1
1986	2023-11-29 07:29:49.130449+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	2	127.0.0.1	41	1
1987	2023-11-29 07:32:32.552837+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	2	127.0.0.1	41	1
1988	2023-11-29 07:32:42.669072+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1989	2023-11-29 07:35:58.360382+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1990	2023-11-29 07:35:59.608408+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1991	2023-11-29 07:36:12.614702+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1992	2023-11-29 07:36:46.746213+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1993	2023-11-29 07:36:56.206738+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1994	2023-11-29 07:36:58.655453+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1995	2023-11-29 07:37:03.394939+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1996	2023-11-29 07:37:33.900086+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1997	2023-11-29 07:37:38.640582+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1998	2023-11-29 07:37:41.007351+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
1999	2023-11-29 07:37:53.966343+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2000	2023-11-29 07:37:56.463808+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2001	2023-11-29 07:37:58.85521+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2002	2023-11-29 07:38:01.288829+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2003	2023-11-29 07:38:03.675074+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2004	2023-11-29 07:39:06.648684+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2005	2023-11-29 07:39:07.946908+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2006	2023-11-29 07:39:26.782547+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2007	2023-11-29 07:39:28.038363+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2008	2023-11-29 07:39:43.38924+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2009	2023-11-29 07:39:48.233171+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2010	2023-11-29 07:39:56.536763+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2011	2023-11-29 07:39:58.952388+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2012	2023-11-29 07:42:09.503103+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2013	2023-11-29 07:42:12.205425+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2014	2023-11-29 07:42:34.914297+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2015	2023-11-29 07:42:35.539357+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2016	2023-11-29 07:43:33.878181+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2017	2023-11-29 07:43:37.518184+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2018	2023-11-29 07:43:48.138353+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2019	2023-11-29 07:43:52.942645+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2020	2023-11-29 07:43:58.864143+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2021	2023-11-29 07:44:04.836169+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2022	2023-11-29 07:44:21.473071+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2023	2023-11-29 07:46:20.793211+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2024	2023-11-29 07:47:00.858816+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2025	2023-11-29 07:47:06.963965+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2026	2023-11-29 07:47:26.124675+01	77273046-3516-46a2-921a-db52e3d47cbd	doki	0	127.0.0.1	41	1
2027	2023-11-29 07:58:51.853535+01	4	doki	1	127.0.0.1	38	1
2028	2023-11-29 08:04:04.176186+01	4	doki	3	127.0.0.1	41	1
2029	2023-11-29 09:09:13.857179+01			5	127.0.0.1	38	1
2030	2023-11-29 09:09:19.7992+01			4	127.0.0.1	38	1
2031	2023-11-29 14:06:34.168144+01			4	127.0.0.1	38	1
2032	2023-11-29 14:10:24.743749+01	5	cosy	1	127.0.0.1	38	1
2033	2023-11-29 14:10:39.300559+01	032a3361-7ec8-4d0e-9abb-7a7b0d643bf4	cosy	0	127.0.0.1	41	1
2034	2023-11-29 14:13:16.185886+01	032a3361-7ec8-4d0e-9abb-7a7b0d643bf4	cosy2	2	127.0.0.1	41	1
2035	2023-11-29 14:17:07.923943+01	032a3361-7ec8-4d0e-9abb-7a7b0d643bf4	cosy123	2	127.0.0.1	41	1
2036	2023-11-29 14:25:07.195934+01	a41d3518-41f0-4013-baf1-f3397ed18d35	doki123	2	127.0.0.1	41	1
2037	2023-11-29 14:25:40.185284+01	5	cosy123	3	127.0.0.1	41	1
2038	2023-11-29 14:29:32.223162+01	15	acuerdo	1	127.0.0.1	37	1
2039	2023-11-29 14:44:25.655117+01	16	registro	1	127.0.0.1	37	1
2040	2023-11-29 14:44:41.938818+01	17	acuerdo1	1	127.0.0.1	37	1
2041	2023-11-29 14:45:32.914836+01	17	acuerdo1	3	127.0.0.1	37	1
2042	2023-11-29 14:45:40.00729+01	11	dfsdf	3	127.0.0.1	37	1
2043	2023-11-29 15:59:23.48478+01	12	dfgh	3	127.0.0.1	37	1
2044	2023-11-29 16:00:03.153998+01	14	WWW	3	127.0.0.1	37	1
2045	2023-11-29 19:17:35.513059+01	1	Se restauró la base de datos desde 20231129_SISGEPO_idB.sql\n	12	127.0.0.1	38	1
2046	2023-11-29 19:18:59.830141+01	12	asds	3	127.0.0.1	2	1
2047	2023-11-29 21:17:15.196779+01			4	127.0.0.1	38	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	SISGDDO	actividadplan
2	SISGDDO	area
3	SISGDDO	cambiarlogotipo
4	SISGDDO	consecutivo
5	SISGDDO	entidad
6	SISGDDO	estado_acuerdo
7	SISGDDO	estado_cenda
8	SISGDDO	estado_entradas_proyecto
9	SISGDDO	estado_indicador_objetivos
10	SISGDDO	estado_proyecto
11	SISGDDO	formato
12	SISGDDO	fuente_financiamiento
13	SISGDDO	linea_tematica
14	SISGDDO	objetivo
15	SISGDDO	permisos_personalizados
16	SISGDDO	proyecto
17	SISGDDO	tipo_codigo
18	SISGDDO	tipo_de_obra
19	SISGDDO	tipo_proyecto
20	SISGDDO	conclusion_adicional
21	SISGDDO	dato_adicional
22	SISGDDO	trabajador_proyecto
23	SISGDDO	trabajador_consecutivo
24	SISGDDO	sosi
25	SISGDDO	premio
26	SISGDDO	plantrabajo
27	SISGDDO	indicador_objetivos
28	SISGDDO	incidencia
29	SISGDDO	entrada_proyecto
30	SISGDDO	auditoria_interna
31	SISGDDO	auditoria_externa
32	SISGDDO	afectaciones
33	SISGDDO	acuerdo
34	SISGDDO	accion_indicador_objetivo
35	admin	logentry
36	auth	permission
37	auth	group
38	auth	user
39	contenttypes	contenttype
40	sessions	session
41	ProyectoBaseApp	userapp
42	notifications	notification
43	captcha	captchastore
44	base	country
45	base	employee
46	base	entity
47	base	logoentity
48	base	position
49	base	process
50	base	procedure
51	base	infoemployee
52	effectiveness	effectiveness
53	effectiveness	effectivenesssemester
54	effectiveness	indicator
55	effectiveness	indicatormeasurer
56	effectiveness	semestermeasurer
57	licenses	license
58	complaints	wayofreception
59	complaints	complaint
60	complaints	complaintaction
61	iproperty	drawingclassification
62	iproperty	figurativeelementclassification
63	iproperty	patentclassification
64	iproperty	productclassification
65	iproperty	typelegaldocument
66	iproperty	industrialproperty
67	SISGDDO	descripcion
68	SISGDDO	evaluacion
69	SISGDDO	evaluacion_trimestral
70	SISGDDO	periodo
71	SISGDDO	configuracion
72	SISGDDO	etapa_proyecto
73	SISGDDO	estado_proyecto_dgca
74	SISGDDO	prioridad
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-11-22 22:17:23.21959+01
2	contenttypes	0002_remove_content_type_name	2023-11-22 22:17:23.231615+01
3	auth	0001_initial	2023-11-22 22:17:23.316857+01
4	auth	0002_alter_permission_name_max_length	2023-11-22 22:17:23.3224+01
5	auth	0003_alter_user_email_max_length	2023-11-22 22:17:23.327432+01
6	auth	0004_alter_user_username_opts	2023-11-22 22:17:23.365408+01
7	auth	0005_alter_user_last_login_null	2023-11-22 22:17:23.370394+01
8	auth	0006_require_contenttypes_0002	2023-11-22 22:17:23.371618+01
9	auth	0007_alter_validators_add_error_messages	2023-11-22 22:17:23.376628+01
10	auth	0008_alter_user_username_max_length	2023-11-22 22:17:23.385638+01
11	auth	0009_alter_user_last_name_max_length	2023-11-22 22:17:23.389638+01
12	auth	0010_alter_group_name_max_length	2023-11-22 22:17:23.39564+01
13	auth	0011_update_proxy_permissions	2023-11-22 22:17:23.401639+01
14	auth	0012_alter_user_first_name_max_length	2023-11-22 22:17:23.405638+01
15	ProyectoBaseApp	0001_initial	2023-11-22 22:17:23.419648+01
16	base	0001_initial	2023-11-22 22:17:23.499227+01
17	SISGDDO	0001_initial	2023-11-22 22:17:24.353102+01
18	SISGDDO	0002_plantrabajo_ano	2023-11-22 22:17:24.364267+01
19	SISGDDO	0003_remove_plantrabajo_actividades_and_more	2023-11-22 22:17:24.385267+01
20	SISGDDO	0004_actividadplan_activo_actividadplan_plan	2023-11-22 22:17:24.413697+01
21	SISGDDO	0005_actividadplan_otro	2023-11-22 22:17:24.42771+01
22	SISGDDO	0006_alter_actividadplan_otro	2023-11-22 22:17:24.443222+01
23	SISGDDO	0007_premio_activo_alter_cambiarlogotipo_fecha_cambio_and_more	2023-11-22 22:17:24.777522+01
24	admin	0001_initial	2023-11-22 22:17:24.810522+01
25	admin	0002_logentry_remove_auto_add	2023-11-22 22:17:24.817088+01
26	admin	0003_logentry_add_action_flag_choices	2023-11-22 22:17:24.823085+01
27	captcha	0001_initial	2023-11-22 22:17:24.8364+01
28	captcha	0002_alter_captchastore_id	2023-11-22 22:17:24.840903+01
29	complaints	0001_initial	2023-11-22 22:17:24.915908+01
30	effectiveness	0001_initial	2023-11-22 22:17:25.029425+01
31	iproperty	0001_initial	2023-11-22 22:17:25.179192+01
32	licenses	0001_initial	2023-11-22 22:17:25.226193+01
33	notifications	0001_initial	2023-11-22 22:17:25.258374+01
34	notifications	0002_auto_20150224_1134	2023-11-22 22:17:25.272373+01
35	notifications	0003_notification_data	2023-11-22 22:17:25.282375+01
36	notifications	0004_auto_20150826_1508	2023-11-22 22:17:25.289373+01
37	notifications	0005_auto_20160504_1520	2023-11-22 22:17:25.298373+01
38	notifications	0006_indexes	2023-11-22 22:17:25.39189+01
39	notifications	0007_add_timestamp_index	2023-11-22 22:17:25.402892+01
40	notifications	0008_index_together_recipient_unread	2023-11-22 22:17:25.41489+01
41	sessions	0001_initial	2023-11-22 22:17:25.430894+01
42	SISGDDO	0008_objetivo_no	2023-11-22 23:33:57.533257+01
43	SISGDDO	0009_remove_indicador_objetivos_estado	2023-11-23 01:01:27.248077+01
44	SISGDDO	0010_accion_indicador_objetivo_codigo_and_more	2023-11-23 01:14:13.617066+01
45	SISGDDO	0011_alter_accion_indicador_objetivo_codigo	2023-11-23 01:15:43.326342+01
46	SISGDDO	0012_alter_accion_indicador_objetivo_area_and_more	2023-11-23 01:16:44.668941+01
47	SISGDDO	0013_alter_accion_indicador_objetivo_indicador	2023-11-23 01:38:59.651944+01
48	SISGDDO	0014_alter_indicador_objetivos_objetivo	2023-11-23 05:56:01.671609+01
49	SISGDDO	0015_alter_cambiarlogotipo_fecha_cambio_alter_objetivo_no_and_more	2023-11-23 06:29:12.097215+01
50	SISGDDO	0016_alter_objetivo_no_alter_objetivo_nombre	2023-11-23 06:29:12.110032+01
51	SISGDDO	0017_alter_objetivo_no_alter_objetivo_nombre	2023-11-23 06:29:12.120096+01
52	SISGDDO	0018_indicador_objetivos_no_and_more	2023-11-24 05:56:47.619187+01
53	SISGDDO	0019_alter_indicador_objetivos_no	2023-11-24 05:56:47.633933+01
54	SISGDDO	0020_alter_indicador_objetivos_no	2023-11-24 05:56:47.645785+01
55	SISGDDO	0021_remove_accion_indicador_objetivo_codigo_and_more	2023-11-24 06:02:53.046746+01
56	SISGDDO	0022_premio_descripcion_alter_premio_activo	2023-11-24 06:10:45.665187+01
57	SISGDDO	0023_alter_premio_descripcion	2023-11-24 06:13:44.577172+01
58	SISGDDO	0024_alter_accion_indicador_objetivo_no	2023-11-24 17:59:06.686502+01
59	SISGDDO	0025_rename_no_accion_indicador_objetivo_codigo	2023-11-24 18:34:23.730006+01
60	SISGDDO	0026_rename_codigo_accion_indicador_objetivo_no	2023-11-24 19:23:02.55661+01
61	SISGDDO	0027_accion_indicador_objetivo_codigo_and_more	2023-11-24 19:24:16.886402+01
62	SISGDDO	0028_alter_objetivo_no_alter_objetivo_nombre	2023-11-24 21:42:36.217531+01
63	SISGDDO	0029_remove_accion_indicador_objetivo_area_accion_area_and_more	2023-11-24 23:36:18.217143+01
64	SISGDDO	0030_alter_accion_area_descripcion	2023-11-24 23:38:23.410539+01
65	SISGDDO	0031_rename_accion_area_descripcion_and_more	2023-11-25 00:51:09.997382+01
66	SISGDDO	0032_alter_descripcion_accion_alter_descripcion_area	2023-11-25 01:04:14.930246+01
67	SISGDDO	0033_objetivo_evaluacion	2023-11-25 05:14:11.144242+01
68	SISGDDO	0034_descripcion_activo_and_more	2023-11-25 23:33:38.245485+01
69	SISGDDO	0035_alter_accion_indicador_objetivo_nombre	2023-11-26 00:15:34.333253+01
70	SISGDDO	0036_descripcion_fecha_creacion	2023-11-26 01:38:59.005503+01
71	SISGDDO	0037_evaluacion_trimestre_evaluacion_trimestral	2023-11-26 02:28:29.770954+01
72	SISGDDO	0038_evaluacion_trimestral_activo	2023-11-26 02:44:43.855938+01
73	SISGDDO	0039_rename_trimestre_periodo_and_more	2023-11-26 02:48:17.470448+01
74	SISGDDO	0040_alter_cambiarlogotipo_fecha_cambio_and_more	2023-11-26 23:53:43.257427+01
75	SISGDDO	0041_periodo_orden	2023-11-27 01:01:16.156908+01
76	SISGDDO	0042_alter_premio_nombre	2023-11-27 01:15:27.074172+01
77	SISGDDO	0043_alter_premio_archivo	2023-11-27 01:18:16.255576+01
78	SISGDDO	0044_remove_linea_tematica_anno	2023-11-27 03:27:32.718095+01
79	SISGDDO	0045_configuracion_alter_cambiarlogotipo_fecha_cambio_and_more	2023-11-27 13:25:33.193865+01
80	ProyectoBaseApp	0002_userapp_notificado	2023-11-27 13:51:14.55643+01
81	ProyectoBaseApp	0003_remove_userapp_notificado	2023-11-27 23:45:41.425395+01
82	SISGDDO	0046_alter_acuerdo_nombre	2023-11-28 04:44:06.989504+01
83	ProyectoBaseApp	0004_userapp_notificado	2023-11-28 14:03:30.70674+01
84	SISGDDO	0047_alter_cambiarlogotipo_fecha_cambio_alter_sosi_fecha	2023-11-28 14:03:30.728686+01
85	SISGDDO	0048_remove_objetivo_evaluacion	2023-11-28 15:36:07.038535+01
86	SISGDDO	0049_remove_evaluacion_trimestral_activo	2023-11-28 15:55:51.193575+01
87	SISGDDO	0050_evaluacion_trimestral_activo	2023-11-28 19:46:02.428776+01
88	SISGDDO	0051_etapa_proyecto	2023-11-29 01:42:14.846988+01
89	SISGDDO	0052_estado_proyecto_dgca_estado_proyecto_estado_and_more	2023-11-29 01:45:58.780054+01
90	SISGDDO	0053_alter_estado_proyecto_estado	2023-11-29 01:46:48.038022+01
91	SISGDDO	0054_rename_estado_estado_proyecto_etapa	2023-11-29 01:49:32.708328+01
92	SISGDDO	0055_prioridad	2023-11-29 01:51:49.964391+01
93	SISGDDO	0056_tipo_codigo_siglas	2023-11-29 01:54:17.409968+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
sspcoy1mbqv96a1zmd6md7gxfzvnbohn	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r6mum:QejmnPxDlqMnzcJ5OYrAsomjGHoOjDQUEeVteehiAjY	2023-11-25 10:17:20.158464+01
hgr892dtlw30f87n9163wo36p3dkhuo9	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r6EKK:_LUFcyged3HfI_sG92RwHFHZPs1ZHXcxR1Qa5Ll7ktk	2023-11-23 21:21:24.707629+01
l9jm46fokkirwbmc6q78wgfd9kuhwrqk	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r7UlD:PGrZlyS6kdsH3Y3gPfvN6qCAtywo0OCwrsscjceSbeI	2023-11-27 09:06:23.907233+01
fm3lz4s31455spu77b1wt7l04oltxni2	e30:1r7r88:Tcyv0FQ6jIYSkFqEp1m8gJaWqNxnXqFEH24MvnSMDwo	2023-11-28 08:59:32.843089+01
dfmnnmyrhvmualdf13ltuceeqebbsac9	e30:1r7pAW:hb-FH9IE_iZGCtdRrCLJnSSr81-xVn6RZ52P9qDGD5o	2023-11-28 06:53:52.244277+01
pecghoz6xp1jvdauikku5t39hestlfrc	e30:1r7pBv:E64HYTqhqnV2n9j2eh_SH0Aak6vVHryY_uv4ZpPVSso	2023-11-28 06:55:19.194629+01
wjxpm2w9hzmzheq6ret27vaa3nn89s5t	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r7rOI:6ZhbWaUjzPv6emukP-RWW8K5J5PWymknuIJQTNt4zkQ	2023-11-28 09:16:14.032525+01
ja7qafuqh2ci3yw4eqo0yfxrjgvuppqf	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r6OX4:jU_62hLhG2sMTyOZWK2abC3L4k0axokLtC5lNpdbghE	2023-11-24 08:15:14.482689+01
z0p1nnwdda3tyrot4zg38jxs7qeiq7s5	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r8FdI:ZkmWAiLLnMDykLTkymBb-PdBK93mWqVB0E-9dnbMFgg	2023-11-29 11:09:20.574665+01
eu8buxz3p6p2dsnflu392wekajd1hp4p	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r7eQU:jyQAkIt_94cpQzCg15K-Qw2eyezWFTl9LK7iExOhCHY	2023-11-27 19:25:38.310519+01
upm7r4jb5ir32ulsfukg4kykegpkuiex	e30:1r7qJ1:8NkOtkBYplUHBXC8WK98GGNpHd8lyqVi-4x7nM3wiyI	2023-11-28 08:06:43.798737+01
mjp13934l3p3tfchwbik2cjh60s8u30n	e30:1r7qJu:HzYyb_0NwvicCVEPpgVM2RomxGAlP1ad1VUgjTzj9Ck	2023-11-28 08:07:38.356106+01
o11rhk9lsj1gobd1pkvy4foo9ew1jqx1	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r6z3w:eW8FTzkphT1dOtHYdEj5IMFQXjLYP07T9HLYV0M0PKw	2023-11-25 23:15:36.931585+01
wp2u9gorzhp457jwp5fe238zxwfhzle0	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r634z:fE5F6N3kDcWop8LkzrgPW2AdAa-UNQbFO7thUbsBxUY	2023-11-23 09:20:49.55465+01
v4oomau5n26k3jpk11mzg16ctxsouheb	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r7bE9:4sSZ2Azqkio2ViYP2lo4wiVFbidKCa-LoFy7e9m_WxY	2023-11-27 16:00:41.925394+01
cp8xj82zisebv3knqsqmw35np1hdgvl3	e30:1r7qV3:qbfuH5MmIm9ZhPxNmJPfWtidTp7D97U5R5m21rFYWUE	2023-11-28 08:19:09.384163+01
b21oslx9nlwjdul8cz0z0xvlgcqfzwgs	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r6vqS:f4WdwoTRvLzFrr3uFIaxsPr7iqzRqB6g3fnFJUlGVBk	2023-11-25 19:49:28.250498+01
i8kzmkziblsk97tx4g86r4xfzpc7bia6	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r7B4V:EkqcoVBV2ENPRdlIqbyDWoRkIHp3V_B507BhqXIpYcE	2023-11-26 12:04:59.805328+01
p8sum7b4cww7oc1qvtbmmlttte9wmizh	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r6jkN:B6GqlAcgjQISvkenJG3jv5kYFkcLD2hCKndpxbCN88Y	2023-11-25 06:54:23.179444+01
xbao857b6khrp20xvg8nkiw08n50421b	e30:1r7qk7:LzCX61QwuNyqFGoBsWMw6EWObrksAoTcNgs9dUXX08U	2023-11-28 08:34:43.754352+01
0z4r2llhh2v1mbl8r2we1zvurmrxe3tn	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r77it:UEdcZ4ykSPcPA19fRhb1JkSLh-UcounE-l77YU4trwo	2023-11-26 08:30:27.193224+01
2xogo8y95879tjt3v5ftgfnathprpeo8	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r6Zcp:annVTqD-cnD0oEdRC6SypxQlli_19x29CRXRnEwOUsM	2023-11-24 20:05:55.170881+01
ucqksmpoghywrmkgbtibbjwlv1gi5nb5	e30:1r7r5z:ETxE_DGBPf6mrffL4Oz4RJ3fNK__fSUDOf54D9Vq7Lk	2023-11-28 08:57:19.824064+01
zaqktqliwb01mu6h7lkrgqe3r96ovfmr	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r8PAV:WExogRAH-t-U6VQc0atzPyQ7af43CSPZArVyu-2AAxU	2023-11-29 21:20:15.407941+01
u9c1czoo8s3b8ycnk0xm02rlv98ietls	.eJxVjEEOwiAQRe_C2hBgqgWX7nsGMsNMpWpoUtqV8e6WpAvdvvf-f6uI25rjVmWJE6ursur0ywjTU0oT_MByn3Way7pMpFuiD1v1MLO8bkf7d5Cx5rbu-GwlJG8IPI2UjOkhdGGnjoAFwQruzF_GJNQTinUA3qEzzguT-nwB8PE4Rg:1r8R3v:R47caalM_Hu5NBKBePrEZPBwIC7XgJVtH0Q--gzuWUo	2023-11-29 23:21:35.740236+01
\.


--
-- Data for Name: effectiveness_effectiveness; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.effectiveness_effectiveness (id, year, process_id) FROM stdin;
\.


--
-- Data for Name: effectiveness_effectivenesssemester; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.effectiveness_effectivenesssemester (id, semester, effectiveness_id) FROM stdin;
\.


--
-- Data for Name: effectiveness_indicator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.effectiveness_indicator (id, name, active) FROM stdin;
\.


--
-- Data for Name: effectiveness_indicatormeasurer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.effectiveness_indicatormeasurer (id, name, qualification, indicator_id) FROM stdin;
\.


--
-- Data for Name: effectiveness_semestermeasurer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.effectiveness_semestermeasurer (id, measurer_id, semester_id) FROM stdin;
\.


--
-- Data for Name: iproperty_drawingclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_drawingclassification (id, name) FROM stdin;
\.


--
-- Data for Name: iproperty_figurativeelementclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_figurativeelementclassification (id, number, name) FROM stdin;
\.


--
-- Data for Name: iproperty_industrialproperty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_industrialproperty (id, number, name, created_date, modality, application_date, application_number, status, certificate_number, grant_date, expiration_date, granted_resolution, observation, file, country_id, type_legal_document_id) FROM stdin;
\.


--
-- Data for Name: iproperty_industrialproperty_drawings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_industrialproperty_drawings (id, industrialproperty_id, drawingclassification_id) FROM stdin;
\.


--
-- Data for Name: iproperty_industrialproperty_figurative_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_industrialproperty_figurative_elements (id, industrialproperty_id, figurativeelementclassification_id) FROM stdin;
\.


--
-- Data for Name: iproperty_industrialproperty_patents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_industrialproperty_patents (id, industrialproperty_id, patentclassification_id) FROM stdin;
\.


--
-- Data for Name: iproperty_industrialproperty_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_industrialproperty_products (id, industrialproperty_id, productclassification_id) FROM stdin;
\.


--
-- Data for Name: iproperty_patentclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_patentclassification (id, name) FROM stdin;
\.


--
-- Data for Name: iproperty_productclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_productclassification (id, number, name) FROM stdin;
\.


--
-- Data for Name: iproperty_typelegaldocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_typelegaldocument (id, name, active) FROM stdin;
\.


--
-- Data for Name: licenses_license; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licenses_license (id, number, name, created_date, grant_date, expiration_date, status, observation, file, active, associated_process_id, entity_id, process_id, responsible_id) FROM stdin;
\.


--
-- Data for Name: notifications_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_notification (id, level, unread, actor_object_id, verb, description, target_object_id, action_object_object_id, "timestamp", public, action_object_content_type_id, actor_content_type_id, recipient_id, target_content_type_id, deleted, emailed, data) FROM stdin;
150	info	f	1	ALERTAS ENVIADAS!!!	\N	\N	\N	2023-11-28 23:55:22.591359+01	t	\N	38	1	\N	f	f	\N
149	error	f	1	El Objetivo "OE10" está por vencerse	\N	\N	\N	2023-11-28 23:55:22.58844+01	t	\N	38	1	\N	f	f	\N
148	error	f	1	El Objetivo "O.E. 28" está por vencerse	\N	\N	\N	2023-11-28 23:55:22.586442+01	t	\N	38	1	\N	f	f	\N
147	error	f	1	El Objetivo "O.E. 30" está por vencerse	\N	\N	\N	2023-11-28 23:55:22.584431+01	t	\N	38	1	\N	f	f	\N
146	warning	f	1	El Acuerdo "esto es una pru3^^^^" vence en un mes	\N	\N	\N	2023-11-28 23:55:22.57437+01	t	\N	38	1	\N	f	f	\N
145	info	f	1	ALERTAS ENVIADAS!!!	\N	\N	\N	2023-11-28 23:54:35.633808+01	t	\N	38	1	\N	f	f	\N
144	error	f	1	El Objetivo "OE10" está por vencerse	\N	\N	\N	2023-11-28 23:54:35.630866+01	t	\N	38	1	\N	f	f	\N
143	error	f	1	El Objetivo "O.E. 28" está por vencerse	\N	\N	\N	2023-11-28 23:54:35.627784+01	t	\N	38	1	\N	f	f	\N
142	error	f	1	El Objetivo "O.E. 30" está por vencerse	\N	\N	\N	2023-11-28 23:54:35.624764+01	t	\N	38	1	\N	f	f	\N
141	warning	f	1	El Acuerdo "esto es una pru3^^^^" vence en un mes	\N	\N	\N	2023-11-28 23:54:35.613943+01	t	\N	38	1	\N	f	f	\N
140	info	f	1	ALERTAS ENVIADAS!!!	\N	\N	\N	2023-11-28 23:53:35.756561+01	t	\N	38	1	\N	f	f	\N
139	warning	f	1	El Acuerdo "esto es una pru3^^^^" vence en un mes	\N	\N	\N	2023-11-28 23:53:35.750598+01	t	\N	38	1	\N	f	f	\N
138	info	f	1	ALERTAS ENVIADAS!!!	\N	\N	\N	2023-11-28 23:52:36.870825+01	t	\N	38	1	\N	f	f	\N
137	warning	f	1	El Acuerdo "esto es una pru3^^^^" vence en un mes	\N	\N	\N	2023-11-28 23:52:36.86482+01	t	\N	38	1	\N	f	f	\N
136	info	f	1	Actualización de Objetivo de trabajo: qwe	\N	\N	\N	2023-11-28 21:58:50.697574+01	t	\N	38	1	\N	f	f	\N
135	info	f	1	Actualización de Objetivo estratégico: 4 - 2023 - O.E. 30	\N	\N	\N	2023-11-28 21:57:47.742095+01	t	\N	38	1	\N	f	f	\N
134	info	f	1	Actualización de Objetivo estratégico: 2 - 2023 - O.E. 28	\N	\N	\N	2023-11-28 21:48:52.968124+01	t	\N	38	1	\N	f	f	\N
158	success	t	1	¡Bienvenido a SISGEPO!	\N	\N	\N	2023-11-29 07:58:51.854566+01	t	\N	38	4	\N	f	f	\N
159	success	t	1	¡Bienvenido a SISGEPO!	\N	\N	\N	2023-11-29 14:10:24.743749+01	t	\N	38	5	\N	f	f	\N
160	warning	t	1	Se han modificado sus datos	\N	\N	\N	2023-11-29 14:13:16.185886+01	t	\N	38	5	\N	f	f	\N
161	warning	t	1	Se han modificado sus datos	\N	\N	\N	2023-11-29 14:17:07.923943+01	t	\N	38	5	\N	f	f	\N
162	warning	t	1	Se han modificado sus datos	\N	\N	\N	2023-11-29 14:25:07.195934+01	t	\N	38	4	\N	f	f	\N
163	warning	t	1	Eliminación de área: asds	\N	\N	\N	2023-11-29 19:18:59.830141+01	t	\N	38	1	\N	f	f	\N
164	info	t	1	ALERTAS ENVIADAS!!!	\N	\N	\N	2023-11-29 21:17:15.207777+01	t	\N	38	1	\N	f	f	\N
\.


--
-- Name: SISGDDO_accion_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_accion_area_id_seq"', 34, true);


--
-- Name: SISGDDO_accion_indicador_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_accion_indicador_objetivo_id_seq"', 54, true);


--
-- Name: SISGDDO_actividadplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_id_seq"', 1, false);


--
-- Name: SISGDDO_actividadplan_participantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_participantes_id_seq"', 1, false);


--
-- Name: SISGDDO_acuerdo_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acuerdo_employee_id_seq"', 15, true);


--
-- Name: SISGDDO_acuerdo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acuerdo_id_seq"', 16, true);


--
-- Name: SISGDDO_afectaciones_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_afectaciones_numero_seq"', 1, false);


--
-- Name: SISGDDO_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_area_id_seq"', 18, true);


--
-- Name: SISGDDO_auditoria_externa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_externa_id_seq"', 1, false);


--
-- Name: SISGDDO_auditoria_externa_proceso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_externa_proceso_id_seq"', 1, false);


--
-- Name: SISGDDO_auditoria_interna_equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_interna_equipo_id_seq"', 1, false);


--
-- Name: SISGDDO_auditoria_interna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_interna_id_seq"', 1, false);


--
-- Name: SISGDDO_cambiarlogotipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_cambiarlogotipo_id_seq"', 1, false);


--
-- Name: SISGDDO_configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_configuracion_id_seq"', 1, false);


--
-- Name: SISGDDO_consecutivo_formato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_consecutivo_formato_id_seq"', 1, true);


--
-- Name: SISGDDO_consecutivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_consecutivo_id_seq"', 1, true);


--
-- Name: SISGDDO_entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_entidad_id_seq"', 1, false);


--
-- Name: SISGDDO_entrada_proyecto_formato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_entrada_proyecto_formato_id_seq"', 1, false);


--
-- Name: SISGDDO_entrada_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_entrada_proyecto_id_seq"', 1, false);


--
-- Name: SISGDDO_estado_acuerdo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_acuerdo_id_seq"', 5, true);


--
-- Name: SISGDDO_estado_cenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_cenda_id_seq"', 1, false);


--
-- Name: SISGDDO_estado_entradas_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_entradas_proyecto_id_seq"', 1, false);


--
-- Name: SISGDDO_estado_indicador_objetivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_indicador_objetivos_id_seq"', 1, false);


--
-- Name: SISGDDO_estado_proyecto_dgca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_proyecto_dgca_id_seq"', 1, false);


--
-- Name: SISGDDO_estado_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_proyecto_id_seq"', 1, true);


--
-- Name: SISGDDO_etapa_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_etapa_proyecto_id_seq"', 1, false);


--
-- Name: SISGDDO_evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_evaluacion_id_seq"', 1, false);


--
-- Name: SISGDDO_evaluacion_trimestral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_evaluacion_trimestral_id_seq"', 19, true);


--
-- Name: SISGDDO_formato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_formato_id_seq"', 1, true);


--
-- Name: SISGDDO_fuente_financiamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_fuente_financiamiento_id_seq"', 1, true);


--
-- Name: SISGDDO_incidencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_incidencia_id_seq"', 1, false);


--
-- Name: SISGDDO_indicador_objetivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_indicador_objetivos_id_seq"', 82, true);


--
-- Name: SISGDDO_linea_tematica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_linea_tematica_id_seq"', 3, true);


--
-- Name: SISGDDO_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_objetivo_id_seq"', 30, true);


--
-- Name: SISGDDO_permisos_personalizados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_permisos_personalizados_id_seq"', 1, false);


--
-- Name: SISGDDO_plantrabajo_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_plantrabajo_numero_seq"', 1, false);


--
-- Name: SISGDDO_premio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_premio_id_seq"', 13, true);


--
-- Name: SISGDDO_prioridad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_prioridad_id_seq"', 1, false);


--
-- Name: SISGDDO_proyecto_formato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_proyecto_formato_id_seq"', 1, true);


--
-- Name: SISGDDO_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_proyecto_id_seq"', 1, true);


--
-- Name: SISGDDO_sosi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_sosi_id_seq"', 1, false);


--
-- Name: SISGDDO_tipo_codigo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tipo_codigo_id_seq"', 1, true);


--
-- Name: SISGDDO_tipo_de_obra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tipo_de_obra_id_seq"', 1, false);


--
-- Name: SISGDDO_tipo_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tipo_proyecto_id_seq"', 1, true);


--
-- Name: SISGDDO_trabajador_consecutivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_trabajador_consecutivo_id_seq"', 1, true);


--
-- Name: SISGDDO_trabajador_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_trabajador_proyecto_id_seq"', 1, true);


--
-- Name: SISGDDO_trimestre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_trimestre_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 17, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 29, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 310, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 21, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 10, true);


--
-- Name: base_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_country_id_seq', 1, false);


--
-- Name: base_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_employee_id_seq', 1, false);


--
-- Name: base_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_entity_id_seq', 2, true);


--
-- Name: base_infoemployee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_infoemployee_id_seq', 1, false);


--
-- Name: base_logoentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_logoentity_id_seq', 2, true);


--
-- Name: base_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_position_id_seq', 4, true);


--
-- Name: base_procedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_procedure_id_seq', 1, false);


--
-- Name: base_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_process_id_seq', 1, false);


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.captcha_captchastore_id_seq', 1, false);


--
-- Name: complaints_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_complaint_id_seq', 1, false);


--
-- Name: complaints_complaintaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_complaintaction_id_seq', 1, false);


--
-- Name: complaints_wayofreception_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_wayofreception_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2047, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 74, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 93, true);


--
-- Name: effectiveness_effectiveness_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.effectiveness_effectiveness_id_seq', 1, false);


--
-- Name: effectiveness_effectivenesssemester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.effectiveness_effectivenesssemester_id_seq', 1, false);


--
-- Name: effectiveness_indicator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.effectiveness_indicator_id_seq', 1, false);


--
-- Name: effectiveness_indicatormeasurer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.effectiveness_indicatormeasurer_id_seq', 1, false);


--
-- Name: effectiveness_semestermeasurer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.effectiveness_semestermeasurer_id_seq', 1, false);


--
-- Name: iproperty_drawingclassification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_drawingclassification_id_seq', 1, false);


--
-- Name: iproperty_figurativeelementclassification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_figurativeelementclassification_id_seq', 1, false);


--
-- Name: iproperty_industrialproperty_drawings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_industrialproperty_drawings_id_seq', 1, false);


--
-- Name: iproperty_industrialproperty_figurative_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_industrialproperty_figurative_elements_id_seq', 1, false);


--
-- Name: iproperty_industrialproperty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_industrialproperty_id_seq', 1, false);


--
-- Name: iproperty_industrialproperty_patents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_industrialproperty_patents_id_seq', 1, false);


--
-- Name: iproperty_industrialproperty_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_industrialproperty_products_id_seq', 1, false);


--
-- Name: iproperty_patentclassification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_patentclassification_id_seq', 1, false);


--
-- Name: iproperty_productclassification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_productclassification_id_seq', 1, false);


--
-- Name: iproperty_typelegaldocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_typelegaldocument_id_seq', 1, false);


--
-- Name: licenses_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licenses_license_id_seq', 1, false);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 164, true);


--
-- Name: ProyectoBaseApp_userapp ProyectoBaseApp_userapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProyectoBaseApp_userapp"
    ADD CONSTRAINT "ProyectoBaseApp_userapp_pkey" PRIMARY KEY (user_ptr_id);


--
-- Name: SISGDDO_descripcion SISGDDO_accion_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_descripcion"
    ADD CONSTRAINT "SISGDDO_accion_area_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_accion_indicador_objetivo SISGDDO_accion_indicador_objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_accion_indicador_objetivo"
    ADD CONSTRAINT "SISGDDO_accion_indicador_objetivo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_actividadplan_participantes SISGDDO_actividadplan_pa_actividadplan_id_employe_36e34bde_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes"
    ADD CONSTRAINT "SISGDDO_actividadplan_pa_actividadplan_id_employe_36e34bde_uniq" UNIQUE (actividadplan_id, employee_id);


--
-- Name: SISGDDO_actividadplan_participantes SISGDDO_actividadplan_participantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes"
    ADD CONSTRAINT "SISGDDO_actividadplan_participantes_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_actividadplan SISGDDO_actividadplan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan"
    ADD CONSTRAINT "SISGDDO_actividadplan_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_acuerdo_employee SISGDDO_acuerdo_employee_acuerdo_id_employee_id_8cf1b53c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdo_employee"
    ADD CONSTRAINT "SISGDDO_acuerdo_employee_acuerdo_id_employee_id_8cf1b53c_uniq" UNIQUE (acuerdo_id, employee_id);


--
-- Name: SISGDDO_acuerdo_employee SISGDDO_acuerdo_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdo_employee"
    ADD CONSTRAINT "SISGDDO_acuerdo_employee_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_acuerdo SISGDDO_acuerdo_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdo"
    ADD CONSTRAINT "SISGDDO_acuerdo_numero_key" UNIQUE (numero);


--
-- Name: SISGDDO_acuerdo SISGDDO_acuerdo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdo"
    ADD CONSTRAINT "SISGDDO_acuerdo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_afectaciones SISGDDO_afectaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_afectaciones"
    ADD CONSTRAINT "SISGDDO_afectaciones_pkey" PRIMARY KEY (numero);


--
-- Name: SISGDDO_area SISGDDO_area_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_area"
    ADD CONSTRAINT "SISGDDO_area_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_area SISGDDO_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_area"
    ADD CONSTRAINT "SISGDDO_area_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_auditoria_externa_proceso SISGDDO_auditoria_extern_auditoria_externa_id_pro_6797b040_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso"
    ADD CONSTRAINT "SISGDDO_auditoria_extern_auditoria_externa_id_pro_6797b040_uniq" UNIQUE (auditoria_externa_id, process_id);


--
-- Name: SISGDDO_auditoria_externa SISGDDO_auditoria_externa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa"
    ADD CONSTRAINT "SISGDDO_auditoria_externa_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_auditoria_externa_proceso SISGDDO_auditoria_externa_proceso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso"
    ADD CONSTRAINT "SISGDDO_auditoria_externa_proceso_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_auditoria_interna_equipo SISGDDO_auditoria_intern_auditoria_interna_id_emp_5bc61ab2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo"
    ADD CONSTRAINT "SISGDDO_auditoria_intern_auditoria_interna_id_emp_5bc61ab2_uniq" UNIQUE (auditoria_interna_id, employee_id);


--
-- Name: SISGDDO_auditoria_interna_equipo SISGDDO_auditoria_interna_equipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo"
    ADD CONSTRAINT "SISGDDO_auditoria_interna_equipo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_auditoria_interna SISGDDO_auditoria_interna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna"
    ADD CONSTRAINT "SISGDDO_auditoria_interna_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_cambiarlogotipo SISGDDO_cambiarlogotipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_cambiarlogotipo"
    ADD CONSTRAINT "SISGDDO_cambiarlogotipo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_conclusion_adicional SISGDDO_conclusion_adicional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_conclusion_adicional"
    ADD CONSTRAINT "SISGDDO_conclusion_adicional_pkey" PRIMARY KEY (proyecto_ptr_id);


--
-- Name: SISGDDO_configuracion SISGDDO_configuracion_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_configuracion"
    ADD CONSTRAINT "SISGDDO_configuracion_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_configuracion SISGDDO_configuracion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_configuracion"
    ADD CONSTRAINT "SISGDDO_configuracion_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_consecutivo_formato SISGDDO_consecutivo_form_consecutivo_id_formato_i_00dac759_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo_formato"
    ADD CONSTRAINT "SISGDDO_consecutivo_form_consecutivo_id_formato_i_00dac759_uniq" UNIQUE (consecutivo_id, formato_id);


--
-- Name: SISGDDO_consecutivo_formato SISGDDO_consecutivo_formato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo_formato"
    ADD CONSTRAINT "SISGDDO_consecutivo_formato_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_no_key" UNIQUE (no);


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_dato_adicional SISGDDO_dato_adicional_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dato_adicional"
    ADD CONSTRAINT "SISGDDO_dato_adicional_pkey" PRIMARY KEY (proyecto_ptr_id);


--
-- Name: SISGDDO_entidad SISGDDO_entidad_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entidad"
    ADD CONSTRAINT "SISGDDO_entidad_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_entidad SISGDDO_entidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entidad"
    ADD CONSTRAINT "SISGDDO_entidad_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_entrada_proyecto_formato SISGDDO_entrada_proyecto_entrada_proyecto_id_form_769be411_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_entrada_proyecto_entrada_proyecto_id_form_769be411_uniq" UNIQUE (entrada_proyecto_id, formato_id);


--
-- Name: SISGDDO_entrada_proyecto_formato SISGDDO_entrada_proyecto_formato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_entrada_proyecto_formato_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_entrada_proyecto SISGDDO_entrada_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto"
    ADD CONSTRAINT "SISGDDO_entrada_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_acuerdo SISGDDO_estado_acuerdo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_acuerdo"
    ADD CONSTRAINT "SISGDDO_estado_acuerdo_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_estado_acuerdo SISGDDO_estado_acuerdo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_acuerdo"
    ADD CONSTRAINT "SISGDDO_estado_acuerdo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_cenda SISGDDO_estado_cenda_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_cenda"
    ADD CONSTRAINT "SISGDDO_estado_cenda_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_estado_cenda SISGDDO_estado_cenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_cenda"
    ADD CONSTRAINT "SISGDDO_estado_cenda_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_entradas_proyecto SISGDDO_estado_entradas_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_entradas_proyecto"
    ADD CONSTRAINT "SISGDDO_estado_entradas_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_indicador_objetivos SISGDDO_estado_indicador_objetivos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_indicador_objetivos"
    ADD CONSTRAINT "SISGDDO_estado_indicador_objetivos_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_estado_indicador_objetivos SISGDDO_estado_indicador_objetivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_indicador_objetivos"
    ADD CONSTRAINT "SISGDDO_estado_indicador_objetivos_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_proyecto_dgca SISGDDO_estado_proyecto_dgca_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_proyecto_dgca"
    ADD CONSTRAINT "SISGDDO_estado_proyecto_dgca_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_estado_proyecto_dgca SISGDDO_estado_proyecto_dgca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_proyecto_dgca"
    ADD CONSTRAINT "SISGDDO_estado_proyecto_dgca_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_estado_proyecto SISGDDO_estado_proyecto_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_proyecto"
    ADD CONSTRAINT "SISGDDO_estado_proyecto_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_estado_proyecto SISGDDO_estado_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_proyecto"
    ADD CONSTRAINT "SISGDDO_estado_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_etapa_proyecto SISGDDO_etapa_proyecto_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_etapa_proyecto"
    ADD CONSTRAINT "SISGDDO_etapa_proyecto_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_etapa_proyecto SISGDDO_etapa_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_etapa_proyecto"
    ADD CONSTRAINT "SISGDDO_etapa_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_evaluacion SISGDDO_evaluacion_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_evaluacion"
    ADD CONSTRAINT "SISGDDO_evaluacion_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_evaluacion SISGDDO_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_evaluacion"
    ADD CONSTRAINT "SISGDDO_evaluacion_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_evaluacion_trimestral SISGDDO_evaluacion_trimestral_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral"
    ADD CONSTRAINT "SISGDDO_evaluacion_trimestral_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_evaluacion SISGDDO_evaluacion_valor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_evaluacion"
    ADD CONSTRAINT "SISGDDO_evaluacion_valor_key" UNIQUE (valor);


--
-- Name: SISGDDO_formato SISGDDO_formato_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formato"
    ADD CONSTRAINT "SISGDDO_formato_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_formato SISGDDO_formato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_formato"
    ADD CONSTRAINT "SISGDDO_formato_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_fuente_financiamiento SISGDDO_fuente_financiamiento_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_fuente_financiamiento"
    ADD CONSTRAINT "SISGDDO_fuente_financiamiento_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_fuente_financiamiento SISGDDO_fuente_financiamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_fuente_financiamiento"
    ADD CONSTRAINT "SISGDDO_fuente_financiamiento_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_incidencia SISGDDO_incidencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencia"
    ADD CONSTRAINT "SISGDDO_incidencia_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_indicador_objetivos SISGDDO_indicador_objetivos_no_c3d38afe_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_objetivos"
    ADD CONSTRAINT "SISGDDO_indicador_objetivos_no_c3d38afe_uniq" UNIQUE (no);


--
-- Name: SISGDDO_indicador_objetivos SISGDDO_indicador_objetivos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_objetivos"
    ADD CONSTRAINT "SISGDDO_indicador_objetivos_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_indicador_objetivos SISGDDO_indicador_objetivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_objetivos"
    ADD CONSTRAINT "SISGDDO_indicador_objetivos_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_linea_tematica SISGDDO_linea_tematica_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_linea_tematica"
    ADD CONSTRAINT "SISGDDO_linea_tematica_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_linea_tematica SISGDDO_linea_tematica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_linea_tematica"
    ADD CONSTRAINT "SISGDDO_linea_tematica_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_objetivo SISGDDO_objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_objetivo"
    ADD CONSTRAINT "SISGDDO_objetivo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_permisos_personalizados SISGDDO_permisos_personalizados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_permisos_personalizados"
    ADD CONSTRAINT "SISGDDO_permisos_personalizados_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_plantrabajo SISGDDO_plantrabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_plantrabajo"
    ADD CONSTRAINT "SISGDDO_plantrabajo_pkey" PRIMARY KEY (numero);


--
-- Name: SISGDDO_premio SISGDDO_premio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_premio"
    ADD CONSTRAINT "SISGDDO_premio_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_prioridad SISGDDO_prioridad_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_prioridad"
    ADD CONSTRAINT "SISGDDO_prioridad_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_prioridad SISGDDO_prioridad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_prioridad"
    ADD CONSTRAINT "SISGDDO_prioridad_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_codigo_key" UNIQUE (codigo);


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_consecutivo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_consecutivo_id_key" UNIQUE (consecutivo_id);


--
-- Name: SISGDDO_proyecto_formato SISGDDO_proyecto_formato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_proyecto_formato_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_proyecto_formato SISGDDO_proyecto_formato_proyecto_id_formato_id_6f56d224_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_proyecto_formato_proyecto_id_formato_id_6f56d224_uniq" UNIQUE (proyecto_id, formato_id);


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_no_key" UNIQUE (no);


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_nombre_proyecto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_nombre_proyecto_key" UNIQUE (nombre_proyecto);


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_sosi SISGDDO_sosi_consecutivo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_consecutivo_id_key" UNIQUE (consecutivo_id);


--
-- Name: SISGDDO_sosi SISGDDO_sosi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_tipo_codigo SISGDDO_tipo_codigo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_codigo"
    ADD CONSTRAINT "SISGDDO_tipo_codigo_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_tipo_codigo SISGDDO_tipo_codigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_codigo"
    ADD CONSTRAINT "SISGDDO_tipo_codigo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_tipo_codigo SISGDDO_tipo_codigo_siglas_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_codigo"
    ADD CONSTRAINT "SISGDDO_tipo_codigo_siglas_key" UNIQUE (siglas);


--
-- Name: SISGDDO_tipo_de_obra SISGDDO_tipo_de_obra_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_obra"
    ADD CONSTRAINT "SISGDDO_tipo_de_obra_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_tipo_de_obra SISGDDO_tipo_de_obra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_de_obra"
    ADD CONSTRAINT "SISGDDO_tipo_de_obra_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_tipo_proyecto SISGDDO_tipo_proyecto_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_proyecto"
    ADD CONSTRAINT "SISGDDO_tipo_proyecto_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_tipo_proyecto SISGDDO_tipo_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_tipo_proyecto"
    ADD CONSTRAINT "SISGDDO_tipo_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_trabajador_consecutivo SISGDDO_trabajador_consecutivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo"
    ADD CONSTRAINT "SISGDDO_trabajador_consecutivo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_trabajador_proyecto SISGDDO_trabajador_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto"
    ADD CONSTRAINT "SISGDDO_trabajador_proyecto_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_periodo SISGDDO_trimestre_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_periodo"
    ADD CONSTRAINT "SISGDDO_trimestre_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_periodo SISGDDO_trimestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_periodo"
    ADD CONSTRAINT "SISGDDO_trimestre_pkey" PRIMARY KEY (id);


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
-- Name: base_country base_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_country
    ADD CONSTRAINT base_country_pkey PRIMARY KEY (id);


--
-- Name: base_employee base_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_employee
    ADD CONSTRAINT base_employee_pkey PRIMARY KEY (id);


--
-- Name: base_entity base_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_entity
    ADD CONSTRAINT base_entity_pkey PRIMARY KEY (id);


--
-- Name: base_infoemployee base_infoemployee_employee_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_infoemployee
    ADD CONSTRAINT base_infoemployee_employee_id_key UNIQUE (employee_id);


--
-- Name: base_infoemployee base_infoemployee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_infoemployee
    ADD CONSTRAINT base_infoemployee_pkey PRIMARY KEY (id);


--
-- Name: base_logoentity base_logoentity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_logoentity
    ADD CONSTRAINT base_logoentity_pkey PRIMARY KEY (id);


--
-- Name: base_position base_position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_position
    ADD CONSTRAINT base_position_pkey PRIMARY KEY (id);


--
-- Name: base_procedure base_procedure_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_procedure
    ADD CONSTRAINT base_procedure_name_key UNIQUE (name);


--
-- Name: base_procedure base_procedure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_procedure
    ADD CONSTRAINT base_procedure_pkey PRIMARY KEY (id);


--
-- Name: base_process base_process_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_process
    ADD CONSTRAINT base_process_name_key UNIQUE (name);


--
-- Name: base_process base_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_process
    ADD CONSTRAINT base_process_pkey PRIMARY KEY (id);


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
-- Name: complaints_complaint complaints_complaint_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_complaint
    ADD CONSTRAINT complaints_complaint_number_key UNIQUE (number);


--
-- Name: complaints_complaint complaints_complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_complaint
    ADD CONSTRAINT complaints_complaint_pkey PRIMARY KEY (id);


--
-- Name: complaints_complaintaction complaints_complaintaction_complaint_id_action_4571e1da_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_complaintaction
    ADD CONSTRAINT complaints_complaintaction_complaint_id_action_4571e1da_uniq UNIQUE (complaint_id, action);


--
-- Name: complaints_complaintaction complaints_complaintaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_complaintaction
    ADD CONSTRAINT complaints_complaintaction_pkey PRIMARY KEY (id);


--
-- Name: complaints_wayofreception complaints_wayofreception_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_wayofreception
    ADD CONSTRAINT complaints_wayofreception_pkey PRIMARY KEY (id);


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
-- Name: effectiveness_effectivenesssemester effectiveness_effectiven_effectiveness_id_semeste_0ea590a5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_effectivenesssemester
    ADD CONSTRAINT effectiveness_effectiven_effectiveness_id_semeste_0ea590a5_uniq UNIQUE (effectiveness_id, semester);


--
-- Name: effectiveness_effectiveness effectiveness_effectiveness_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_effectiveness
    ADD CONSTRAINT effectiveness_effectiveness_pkey PRIMARY KEY (id);


--
-- Name: effectiveness_effectiveness effectiveness_effectiveness_process_id_year_7634d99c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_effectiveness
    ADD CONSTRAINT effectiveness_effectiveness_process_id_year_7634d99c_uniq UNIQUE (process_id, year);


--
-- Name: effectiveness_effectivenesssemester effectiveness_effectivenesssemester_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_effectivenesssemester
    ADD CONSTRAINT effectiveness_effectivenesssemester_pkey PRIMARY KEY (id);


--
-- Name: effectiveness_indicator effectiveness_indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_indicator
    ADD CONSTRAINT effectiveness_indicator_pkey PRIMARY KEY (id);


--
-- Name: effectiveness_indicatormeasurer effectiveness_indicatormeasurer_indicator_id_name_4764c36c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_indicatormeasurer
    ADD CONSTRAINT effectiveness_indicatormeasurer_indicator_id_name_4764c36c_uniq UNIQUE (indicator_id, name);


--
-- Name: effectiveness_indicatormeasurer effectiveness_indicatormeasurer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_indicatormeasurer
    ADD CONSTRAINT effectiveness_indicatormeasurer_pkey PRIMARY KEY (id);


--
-- Name: effectiveness_semestermeasurer effectiveness_semesterme_semester_id_measurer_id_752ccecc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_semestermeasurer
    ADD CONSTRAINT effectiveness_semesterme_semester_id_measurer_id_752ccecc_uniq UNIQUE (semester_id, measurer_id);


--
-- Name: effectiveness_semestermeasurer effectiveness_semestermeasurer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_semestermeasurer
    ADD CONSTRAINT effectiveness_semestermeasurer_pkey PRIMARY KEY (id);


--
-- Name: iproperty_drawingclassification iproperty_drawingclassification_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_drawingclassification
    ADD CONSTRAINT iproperty_drawingclassification_name_key UNIQUE (name);


--
-- Name: iproperty_drawingclassification iproperty_drawingclassification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_drawingclassification
    ADD CONSTRAINT iproperty_drawingclassification_pkey PRIMARY KEY (id);


--
-- Name: iproperty_figurativeelementclassification iproperty_figurativeelementclassification_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_figurativeelementclassification
    ADD CONSTRAINT iproperty_figurativeelementclassification_number_key UNIQUE (number);


--
-- Name: iproperty_figurativeelementclassification iproperty_figurativeelementclassification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_figurativeelementclassification
    ADD CONSTRAINT iproperty_figurativeelementclassification_pkey PRIMARY KEY (id);


--
-- Name: iproperty_industrialproperty_drawings iproperty_industrialprop_industrialproperty_id_dr_636a4a82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_drawings
    ADD CONSTRAINT iproperty_industrialprop_industrialproperty_id_dr_636a4a82_uniq UNIQUE (industrialproperty_id, drawingclassification_id);


--
-- Name: iproperty_industrialproperty_figurative_elements iproperty_industrialprop_industrialproperty_id_fi_0cd6be8d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements
    ADD CONSTRAINT iproperty_industrialprop_industrialproperty_id_fi_0cd6be8d_uniq UNIQUE (industrialproperty_id, figurativeelementclassification_id);


--
-- Name: iproperty_industrialproperty_patents iproperty_industrialprop_industrialproperty_id_pa_1162812d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_patents
    ADD CONSTRAINT iproperty_industrialprop_industrialproperty_id_pa_1162812d_uniq UNIQUE (industrialproperty_id, patentclassification_id);


--
-- Name: iproperty_industrialproperty_products iproperty_industrialprop_industrialproperty_id_pr_955457b2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_products
    ADD CONSTRAINT iproperty_industrialprop_industrialproperty_id_pr_955457b2_uniq UNIQUE (industrialproperty_id, productclassification_id);


--
-- Name: iproperty_industrialproperty_drawings iproperty_industrialproperty_drawings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_drawings
    ADD CONSTRAINT iproperty_industrialproperty_drawings_pkey PRIMARY KEY (id);


--
-- Name: iproperty_industrialproperty_figurative_elements iproperty_industrialproperty_figurative_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements
    ADD CONSTRAINT iproperty_industrialproperty_figurative_elements_pkey PRIMARY KEY (id);


--
-- Name: iproperty_industrialproperty iproperty_industrialproperty_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty
    ADD CONSTRAINT iproperty_industrialproperty_name_key UNIQUE (name);


--
-- Name: iproperty_industrialproperty iproperty_industrialproperty_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty
    ADD CONSTRAINT iproperty_industrialproperty_number_key UNIQUE (number);


--
-- Name: iproperty_industrialproperty_patents iproperty_industrialproperty_patents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_patents
    ADD CONSTRAINT iproperty_industrialproperty_patents_pkey PRIMARY KEY (id);


--
-- Name: iproperty_industrialproperty iproperty_industrialproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty
    ADD CONSTRAINT iproperty_industrialproperty_pkey PRIMARY KEY (id);


--
-- Name: iproperty_industrialproperty_products iproperty_industrialproperty_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_products
    ADD CONSTRAINT iproperty_industrialproperty_products_pkey PRIMARY KEY (id);


--
-- Name: iproperty_patentclassification iproperty_patentclassification_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_patentclassification
    ADD CONSTRAINT iproperty_patentclassification_name_key UNIQUE (name);


--
-- Name: iproperty_patentclassification iproperty_patentclassification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_patentclassification
    ADD CONSTRAINT iproperty_patentclassification_pkey PRIMARY KEY (id);


--
-- Name: iproperty_productclassification iproperty_productclassification_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_productclassification
    ADD CONSTRAINT iproperty_productclassification_number_key UNIQUE (number);


--
-- Name: iproperty_productclassification iproperty_productclassification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_productclassification
    ADD CONSTRAINT iproperty_productclassification_pkey PRIMARY KEY (id);


--
-- Name: iproperty_typelegaldocument iproperty_typelegaldocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_typelegaldocument
    ADD CONSTRAINT iproperty_typelegaldocument_pkey PRIMARY KEY (id);


--
-- Name: licenses_license licenses_license_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses_license
    ADD CONSTRAINT licenses_license_number_key UNIQUE (number);


--
-- Name: licenses_license licenses_license_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses_license
    ADD CONSTRAINT licenses_license_pkey PRIMARY KEY (id);


--
-- Name: notifications_notification notifications_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);


--
-- Name: SISGDDO_accion_area_accion_id_8ef839e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_accion_area_accion_id_8ef839e5" ON public."SISGDDO_descripcion" USING btree (accion_id);


--
-- Name: SISGDDO_accion_area_area_id_b3974b55; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_accion_area_area_id_b3974b55" ON public."SISGDDO_descripcion" USING btree (area_id);


--
-- Name: SISGDDO_accion_indicador_objetivo_indicador_id_fb30c80e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_accion_indicador_objetivo_indicador_id_fb30c80e" ON public."SISGDDO_accion_indicador_objetivo" USING btree (indicador_id);


--
-- Name: SISGDDO_actividadplan_participantes_actividadplan_id_f484ee3d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_actividadplan_participantes_actividadplan_id_f484ee3d" ON public."SISGDDO_actividadplan_participantes" USING btree (actividadplan_id);


--
-- Name: SISGDDO_actividadplan_participantes_employee_id_a4490474; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_actividadplan_participantes_employee_id_a4490474" ON public."SISGDDO_actividadplan_participantes" USING btree (employee_id);


--
-- Name: SISGDDO_actividadplan_preside_id_911d0fb5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_actividadplan_preside_id_911d0fb5" ON public."SISGDDO_actividadplan" USING btree (preside_id);


--
-- Name: SISGDDO_acuerdo_employee_acuerdo_id_7d77dcfc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acuerdo_employee_acuerdo_id_7d77dcfc" ON public."SISGDDO_acuerdo_employee" USING btree (acuerdo_id);


--
-- Name: SISGDDO_acuerdo_employee_employee_id_343fc6cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acuerdo_employee_employee_id_343fc6cb" ON public."SISGDDO_acuerdo_employee" USING btree (employee_id);


--
-- Name: SISGDDO_acuerdo_estado_id_1c8e022e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acuerdo_estado_id_1c8e022e" ON public."SISGDDO_acuerdo" USING btree (estado_id);


--
-- Name: SISGDDO_acuerdo_numero_62f7297a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_acuerdo_numero_62f7297a_like" ON public."SISGDDO_acuerdo" USING btree (numero varchar_pattern_ops);


--
-- Name: SISGDDO_afectaciones_propuesto_id_79f10bb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_afectaciones_propuesto_id_79f10bb1" ON public."SISGDDO_afectaciones" USING btree (propuesto_id);


--
-- Name: SISGDDO_afectaciones_responsable_id_44e3f4f1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_afectaciones_responsable_id_44e3f4f1" ON public."SISGDDO_afectaciones" USING btree (responsable_id);


--
-- Name: SISGDDO_area_nombre_9983a3f3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_area_nombre_9983a3f3_like" ON public."SISGDDO_area" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_auditoria_externa_entidad_id_c6530628; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_externa_entidad_id_c6530628" ON public."SISGDDO_auditoria_externa" USING btree (entidad_id);


--
-- Name: SISGDDO_auditoria_externa_proceso_auditoria_externa_id_eb98e133; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_externa_proceso_auditoria_externa_id_eb98e133" ON public."SISGDDO_auditoria_externa_proceso" USING btree (auditoria_externa_id);


--
-- Name: SISGDDO_auditoria_externa_proceso_process_id_3dfdb35a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_externa_proceso_process_id_3dfdb35a" ON public."SISGDDO_auditoria_externa_proceso" USING btree (process_id);


--
-- Name: SISGDDO_auditoria_interna_equipo_auditoria_interna_id_5841c585; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_equipo_auditoria_interna_id_5841c585" ON public."SISGDDO_auditoria_interna_equipo" USING btree (auditoria_interna_id);


--
-- Name: SISGDDO_auditoria_interna_equipo_employee_id_51387c36; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_equipo_employee_id_51387c36" ON public."SISGDDO_auditoria_interna_equipo" USING btree (employee_id);


--
-- Name: SISGDDO_auditoria_interna_proceso_id_17b71d4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_proceso_id_17b71d4d" ON public."SISGDDO_auditoria_interna" USING btree (proceso_id);


--
-- Name: SISGDDO_configuracion_nombre_69a10587_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_configuracion_nombre_69a10587_like" ON public."SISGDDO_configuracion" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_consecutivo_area_id_07694d17; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_area_id_07694d17" ON public."SISGDDO_consecutivo" USING btree (area_id);


--
-- Name: SISGDDO_consecutivo_estado_id_cf1181a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_estado_id_cf1181a9" ON public."SISGDDO_consecutivo" USING btree (estado_id);


--
-- Name: SISGDDO_consecutivo_formato_consecutivo_id_0863363c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_formato_consecutivo_id_0863363c" ON public."SISGDDO_consecutivo_formato" USING btree (consecutivo_id);


--
-- Name: SISGDDO_consecutivo_formato_formato_id_42177e48; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_formato_formato_id_42177e48" ON public."SISGDDO_consecutivo_formato" USING btree (formato_id);


--
-- Name: SISGDDO_consecutivo_fuente_financiamiento_id_bf5a8394; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_fuente_financiamiento_id_bf5a8394" ON public."SISGDDO_consecutivo" USING btree (fuente_financiamiento_id);


--
-- Name: SISGDDO_consecutivo_linea_tematica_id_4cbb0544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_linea_tematica_id_4cbb0544" ON public."SISGDDO_consecutivo" USING btree (linea_tematica_id);


--
-- Name: SISGDDO_consecutivo_no_ea708152_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_no_ea708152_like" ON public."SISGDDO_consecutivo" USING btree (no varchar_pattern_ops);


--
-- Name: SISGDDO_consecutivo_tipo_codigo_id_bb30e90d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_tipo_codigo_id_bb30e90d" ON public."SISGDDO_consecutivo" USING btree (tipo_codigo_id);


--
-- Name: SISGDDO_consecutivo_tipo_id_31db9a9d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_consecutivo_tipo_id_31db9a9d" ON public."SISGDDO_consecutivo" USING btree (tipo_id);


--
-- Name: SISGDDO_entidad_nombre_f6a9ebad_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entidad_nombre_f6a9ebad_like" ON public."SISGDDO_entidad" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_entrada_proyecto_entregado_por_id_3361ea52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entrada_proyecto_entregado_por_id_3361ea52" ON public."SISGDDO_entrada_proyecto" USING btree (entregado_por_id);


--
-- Name: SISGDDO_entrada_proyecto_estado_id_fe9c37be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entrada_proyecto_estado_id_fe9c37be" ON public."SISGDDO_entrada_proyecto" USING btree (estado_id);


--
-- Name: SISGDDO_entrada_proyecto_formato_entrada_proyecto_id_a1eaef93; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entrada_proyecto_formato_entrada_proyecto_id_a1eaef93" ON public."SISGDDO_entrada_proyecto_formato" USING btree (entrada_proyecto_id);


--
-- Name: SISGDDO_entrada_proyecto_formato_formato_id_66c1ef29; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entrada_proyecto_formato_formato_id_66c1ef29" ON public."SISGDDO_entrada_proyecto_formato" USING btree (formato_id);


--
-- Name: SISGDDO_entrada_proyecto_proyecto_id_7890fee4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_entrada_proyecto_proyecto_id_7890fee4" ON public."SISGDDO_entrada_proyecto" USING btree (proyecto_id);


--
-- Name: SISGDDO_estado_acuerdo_nombre_0ae91081_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_acuerdo_nombre_0ae91081_like" ON public."SISGDDO_estado_acuerdo" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_estado_cenda_nombre_abeefaae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_cenda_nombre_abeefaae_like" ON public."SISGDDO_estado_cenda" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_estado_indicador_objetivos_nombre_fba308f5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_indicador_objetivos_nombre_fba308f5_like" ON public."SISGDDO_estado_indicador_objetivos" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_estado_proyecto_dgca_nombre_130ef725_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_proyecto_dgca_nombre_130ef725_like" ON public."SISGDDO_estado_proyecto_dgca" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_estado_proyecto_estado_id_08f582f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_proyecto_estado_id_08f582f8" ON public."SISGDDO_estado_proyecto" USING btree (etapa_id);


--
-- Name: SISGDDO_estado_proyecto_nombre_99d390cd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_proyecto_nombre_99d390cd_like" ON public."SISGDDO_estado_proyecto" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_etapa_proyecto_nombre_8806c230_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_etapa_proyecto_nombre_8806c230_like" ON public."SISGDDO_etapa_proyecto" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_evaluacion_nombre_a4424535_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_evaluacion_nombre_a4424535_like" ON public."SISGDDO_evaluacion" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_evaluacion_trimestral_evaluacion_id_644fc73e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_evaluacion_trimestral_evaluacion_id_644fc73e" ON public."SISGDDO_evaluacion_trimestral" USING btree (evaluacion_id);


--
-- Name: SISGDDO_evaluacion_trimestral_objetivo_id_b0eea8d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_evaluacion_trimestral_objetivo_id_b0eea8d6" ON public."SISGDDO_evaluacion_trimestral" USING btree (objetivo_id);


--
-- Name: SISGDDO_evaluacion_trimestral_periodo_id_6aba39a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_evaluacion_trimestral_periodo_id_6aba39a9" ON public."SISGDDO_evaluacion_trimestral" USING btree (periodo_id);


--
-- Name: SISGDDO_evaluacion_valor_7f502f5e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_evaluacion_valor_7f502f5e_like" ON public."SISGDDO_evaluacion" USING btree (valor varchar_pattern_ops);


--
-- Name: SISGDDO_formato_nombre_15f8a22b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_formato_nombre_15f8a22b_like" ON public."SISGDDO_formato" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_fuente_financiamiento_nombre_fafab37a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_fuente_financiamiento_nombre_fafab37a_like" ON public."SISGDDO_fuente_financiamiento" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_incidencia_ejecutante_id_acf271a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_incidencia_ejecutante_id_acf271a3" ON public."SISGDDO_incidencia" USING btree (ejecutante_id);


--
-- Name: SISGDDO_incidencia_procesos_id_a2f5fa16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_incidencia_procesos_id_a2f5fa16" ON public."SISGDDO_incidencia" USING btree (procesos_id);


--
-- Name: SISGDDO_incidencia_trabajador_id_88ef29b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_incidencia_trabajador_id_88ef29b2" ON public."SISGDDO_incidencia" USING btree (trabajador_id);


--
-- Name: SISGDDO_indicador_objetivos_no_c3d38afe_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_indicador_objetivos_no_c3d38afe_like" ON public."SISGDDO_indicador_objetivos" USING btree (no varchar_pattern_ops);


--
-- Name: SISGDDO_indicador_objetivos_nombre_0a1844bf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_indicador_objetivos_nombre_0a1844bf_like" ON public."SISGDDO_indicador_objetivos" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_indicador_objetivos_objetivo_id_c1883a69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_indicador_objetivos_objetivo_id_c1883a69" ON public."SISGDDO_indicador_objetivos" USING btree (objetivo_id);


--
-- Name: SISGDDO_linea_tematica_nombre_9f7df45b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_linea_tematica_nombre_9f7df45b_like" ON public."SISGDDO_linea_tematica" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_premio_entidad_id_32643785; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_premio_entidad_id_32643785" ON public."SISGDDO_premio" USING btree (entidad_id);


--
-- Name: SISGDDO_prioridad_nombre_c4a4e387_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_prioridad_nombre_c4a4e387_like" ON public."SISGDDO_prioridad" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_proyecto_area_id_735950ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_area_id_735950ad" ON public."SISGDDO_proyecto" USING btree (area_id);


--
-- Name: SISGDDO_proyecto_codigo_02279a4d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_codigo_02279a4d_like" ON public."SISGDDO_proyecto" USING btree (codigo varchar_pattern_ops);


--
-- Name: SISGDDO_proyecto_estado_id_8f4b6d8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_estado_id_8f4b6d8d" ON public."SISGDDO_proyecto" USING btree (estado_id);


--
-- Name: SISGDDO_proyecto_formato_formato_id_d4c1b27a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_formato_formato_id_d4c1b27a" ON public."SISGDDO_proyecto_formato" USING btree (formato_id);


--
-- Name: SISGDDO_proyecto_formato_proyecto_id_36235f96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_formato_proyecto_id_36235f96" ON public."SISGDDO_proyecto_formato" USING btree (proyecto_id);


--
-- Name: SISGDDO_proyecto_fuente_financiamiento_id_b3aa398a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_fuente_financiamiento_id_b3aa398a" ON public."SISGDDO_proyecto" USING btree (fuente_financiamiento_id);


--
-- Name: SISGDDO_proyecto_linea_tematica_id_10a43b97; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_linea_tematica_id_10a43b97" ON public."SISGDDO_proyecto" USING btree (linea_tematica_id);


--
-- Name: SISGDDO_proyecto_no_f796bcb4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_no_f796bcb4_like" ON public."SISGDDO_proyecto" USING btree (no varchar_pattern_ops);


--
-- Name: SISGDDO_proyecto_nombre_proyecto_f4676558_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_nombre_proyecto_f4676558_like" ON public."SISGDDO_proyecto" USING btree (nombre_proyecto varchar_pattern_ops);


--
-- Name: SISGDDO_proyecto_tipo_codigo_id_b05ed44d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_tipo_codigo_id_b05ed44d" ON public."SISGDDO_proyecto" USING btree (tipo_codigo_id);


--
-- Name: SISGDDO_proyecto_tipo_id_c88e10ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_proyecto_tipo_id_c88e10ea" ON public."SISGDDO_proyecto" USING btree (tipo_id);


--
-- Name: SISGDDO_sosi_especialista_id_24d6da69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_sosi_especialista_id_24d6da69" ON public."SISGDDO_sosi" USING btree (especialista_id);


--
-- Name: SISGDDO_tipo_codigo_nombre_da4b866e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_codigo_nombre_da4b866e_like" ON public."SISGDDO_tipo_codigo" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_tipo_codigo_siglas_5bd8c683_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_codigo_siglas_5bd8c683_like" ON public."SISGDDO_tipo_codigo" USING btree (siglas varchar_pattern_ops);


--
-- Name: SISGDDO_tipo_de_obra_nombre_c085e828_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_de_obra_nombre_c085e828_like" ON public."SISGDDO_tipo_de_obra" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_tipo_proyecto_nombre_6c46c070_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_tipo_proyecto_nombre_6c46c070_like" ON public."SISGDDO_tipo_proyecto" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_trabajador_consecutivo_consecutivo_id_cd8a53e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_consecutivo_consecutivo_id_cd8a53e9" ON public."SISGDDO_trabajador_consecutivo" USING btree (consecutivo_id);


--
-- Name: SISGDDO_trabajador_consecutivo_employee_id_53d7c9a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_consecutivo_employee_id_53d7c9a3" ON public."SISGDDO_trabajador_consecutivo" USING btree (employee_id);


--
-- Name: SISGDDO_trabajador_consecutivo_rol_id_1daa1fc0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_consecutivo_rol_id_1daa1fc0" ON public."SISGDDO_trabajador_consecutivo" USING btree (rol_id);


--
-- Name: SISGDDO_trabajador_proyecto_employee_id_f90c9f24; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_proyecto_employee_id_f90c9f24" ON public."SISGDDO_trabajador_proyecto" USING btree (employee_id);


--
-- Name: SISGDDO_trabajador_proyecto_proyecto_id_d0ca6712; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_proyecto_proyecto_id_d0ca6712" ON public."SISGDDO_trabajador_proyecto" USING btree (proyecto_id);


--
-- Name: SISGDDO_trabajador_proyecto_rol_id_02adf738; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_proyecto_rol_id_02adf738" ON public."SISGDDO_trabajador_proyecto" USING btree (rol_id);


--
-- Name: SISGDDO_trimestre_nombre_f5e8a1d1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trimestre_nombre_f5e8a1d1_like" ON public."SISGDDO_periodo" USING btree (nombre varchar_pattern_ops);


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
-- Name: base_employee_position_id_79f70088; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_employee_position_id_79f70088 ON public.base_employee USING btree (position_id);


--
-- Name: base_procedure_name_b841c895_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_procedure_name_b841c895_like ON public.base_procedure USING btree (name varchar_pattern_ops);


--
-- Name: base_procedure_process_id_14cdad40; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_procedure_process_id_14cdad40 ON public.base_procedure USING btree (process_id);


--
-- Name: base_process_name_681a7114_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_process_name_681a7114_like ON public.base_process USING btree (name varchar_pattern_ops);


--
-- Name: base_process_responsible_id_344e4108; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_process_responsible_id_344e4108 ON public.base_process USING btree (responsible_id);


--
-- Name: captcha_captchastore_hashkey_cbe8d15a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX captcha_captchastore_hashkey_cbe8d15a_like ON public.captcha_captchastore USING btree (hashkey varchar_pattern_ops);


--
-- Name: complaints_complaint_number_0bd00cd2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX complaints_complaint_number_0bd00cd2_like ON public.complaints_complaint USING btree (number varchar_pattern_ops);


--
-- Name: complaints_complaint_process_id_e77bc23c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX complaints_complaint_process_id_e77bc23c ON public.complaints_complaint USING btree (process_id);


--
-- Name: complaints_complaint_way_of_reception_id_640b2401; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX complaints_complaint_way_of_reception_id_640b2401 ON public.complaints_complaint USING btree (way_of_reception_id);


--
-- Name: complaints_complaintaction_complaint_id_807b6ee9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX complaints_complaintaction_complaint_id_807b6ee9 ON public.complaints_complaintaction USING btree (complaint_id);


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
-- Name: effectiveness_effectiveness_process_id_6d5884fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX effectiveness_effectiveness_process_id_6d5884fe ON public.effectiveness_effectiveness USING btree (process_id);


--
-- Name: effectiveness_effectivenesssemester_effectiveness_id_a0af5cc8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX effectiveness_effectivenesssemester_effectiveness_id_a0af5cc8 ON public.effectiveness_effectivenesssemester USING btree (effectiveness_id);


--
-- Name: effectiveness_indicatormeasurer_indicator_id_f42c87b2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX effectiveness_indicatormeasurer_indicator_id_f42c87b2 ON public.effectiveness_indicatormeasurer USING btree (indicator_id);


--
-- Name: effectiveness_semestermeasurer_measurer_id_446ad6c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX effectiveness_semestermeasurer_measurer_id_446ad6c1 ON public.effectiveness_semestermeasurer USING btree (measurer_id);


--
-- Name: effectiveness_semestermeasurer_semester_id_bb53c5bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX effectiveness_semestermeasurer_semester_id_bb53c5bd ON public.effectiveness_semestermeasurer USING btree (semester_id);


--
-- Name: iproperty_drawingclassification_name_79f1ed43_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_drawingclassification_name_79f1ed43_like ON public.iproperty_drawingclassification USING btree (name varchar_pattern_ops);


--
-- Name: iproperty_figurativeelementclassification_number_9384a716_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_figurativeelementclassification_number_9384a716_like ON public.iproperty_figurativeelementclassification USING btree (number varchar_pattern_ops);


--
-- Name: iproperty_industrialproper_drawingclassification_id_79ec40ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_drawingclassification_id_79ec40ea ON public.iproperty_industrialproperty_drawings USING btree (drawingclassification_id);


--
-- Name: iproperty_industrialproper_figurativeelementclassific_a8c5f01a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_figurativeelementclassific_a8c5f01a ON public.iproperty_industrialproperty_figurative_elements USING btree (figurativeelementclassification_id);


--
-- Name: iproperty_industrialproper_industrialproperty_id_0322db86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_industrialproperty_id_0322db86 ON public.iproperty_industrialproperty_products USING btree (industrialproperty_id);


--
-- Name: iproperty_industrialproper_industrialproperty_id_56182c20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_industrialproperty_id_56182c20 ON public.iproperty_industrialproperty_figurative_elements USING btree (industrialproperty_id);


--
-- Name: iproperty_industrialproper_industrialproperty_id_bff6aaa7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_industrialproperty_id_bff6aaa7 ON public.iproperty_industrialproperty_drawings USING btree (industrialproperty_id);


--
-- Name: iproperty_industrialproper_industrialproperty_id_d852c90a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_industrialproperty_id_d852c90a ON public.iproperty_industrialproperty_patents USING btree (industrialproperty_id);


--
-- Name: iproperty_industrialproper_patentclassification_id_df39c097; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_patentclassification_id_df39c097 ON public.iproperty_industrialproperty_patents USING btree (patentclassification_id);


--
-- Name: iproperty_industrialproper_productclassification_id_67d8230e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproper_productclassification_id_67d8230e ON public.iproperty_industrialproperty_products USING btree (productclassification_id);


--
-- Name: iproperty_industrialproperty_country_id_79753bf4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproperty_country_id_79753bf4 ON public.iproperty_industrialproperty USING btree (country_id);


--
-- Name: iproperty_industrialproperty_name_e9a4b8cb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproperty_name_e9a4b8cb_like ON public.iproperty_industrialproperty USING btree (name varchar_pattern_ops);


--
-- Name: iproperty_industrialproperty_number_9a40f78a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproperty_number_9a40f78a_like ON public.iproperty_industrialproperty USING btree (number varchar_pattern_ops);


--
-- Name: iproperty_industrialproperty_type_legal_document_id_b8d57c0f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_industrialproperty_type_legal_document_id_b8d57c0f ON public.iproperty_industrialproperty USING btree (type_legal_document_id);


--
-- Name: iproperty_patentclassification_name_e4fa6a81_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iproperty_patentclassification_name_e4fa6a81_like ON public.iproperty_patentclassification USING btree (name varchar_pattern_ops);


--
-- Name: licenses_license_associated_process_id_a5903141; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX licenses_license_associated_process_id_a5903141 ON public.licenses_license USING btree (associated_process_id);


--
-- Name: licenses_license_entity_id_c7bd8c2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX licenses_license_entity_id_c7bd8c2e ON public.licenses_license USING btree (entity_id);


--
-- Name: licenses_license_number_ab22c049_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX licenses_license_number_ab22c049_like ON public.licenses_license USING btree (number varchar_pattern_ops);


--
-- Name: licenses_license_process_id_dcbf4da2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX licenses_license_process_id_dcbf4da2 ON public.licenses_license USING btree (process_id);


--
-- Name: licenses_license_responsible_id_0bd6dff1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX licenses_license_responsible_id_0bd6dff1 ON public.licenses_license USING btree (responsible_id);


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
-- Name: notifications_notification_recipient_id_unread_253aadc9_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_recipient_id_unread_253aadc9_idx ON public.notifications_notification USING btree (recipient_id, unread);


--
-- Name: notifications_notification_target_content_type_id_ccb24d88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_target_content_type_id_ccb24d88 ON public.notifications_notification USING btree (target_content_type_id);


--
-- Name: notifications_notification_timestamp_6a797bad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_timestamp_6a797bad ON public.notifications_notification USING btree ("timestamp");


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
-- Name: SISGDDO_descripcion SISGDDO_accion_area_accion_id_8ef839e5_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_descripcion"
    ADD CONSTRAINT "SISGDDO_accion_area_accion_id_8ef839e5_fk_SISGDDO_a" FOREIGN KEY (accion_id) REFERENCES public."SISGDDO_accion_indicador_objetivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_descripcion SISGDDO_accion_area_area_id_b3974b55_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_descripcion"
    ADD CONSTRAINT "SISGDDO_accion_area_area_id_b3974b55_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_accion_indicador_objetivo SISGDDO_accion_indic_indicador_id_fb30c80e_fk_SISGDDO_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_accion_indicador_objetivo"
    ADD CONSTRAINT "SISGDDO_accion_indic_indicador_id_fb30c80e_fk_SISGDDO_i" FOREIGN KEY (indicador_id) REFERENCES public."SISGDDO_indicador_objetivos"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_actividadplan_participantes SISGDDO_actividadpla_actividadplan_id_f484ee3d_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes"
    ADD CONSTRAINT "SISGDDO_actividadpla_actividadplan_id_f484ee3d_fk_SISGDDO_a" FOREIGN KEY (actividadplan_id) REFERENCES public."SISGDDO_actividadplan"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_actividadplan_participantes SISGDDO_actividadpla_employee_id_a4490474_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes"
    ADD CONSTRAINT "SISGDDO_actividadpla_employee_id_a4490474_fk_base_empl" FOREIGN KEY (employee_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_actividadplan SISGDDO_actividadplan_preside_id_911d0fb5_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan"
    ADD CONSTRAINT "SISGDDO_actividadplan_preside_id_911d0fb5_fk_base_employee_id" FOREIGN KEY (preside_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acuerdo_employee SISGDDO_acuerdo_empl_acuerdo_id_7d77dcfc_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdo_employee"
    ADD CONSTRAINT "SISGDDO_acuerdo_empl_acuerdo_id_7d77dcfc_fk_SISGDDO_a" FOREIGN KEY (acuerdo_id) REFERENCES public."SISGDDO_acuerdo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acuerdo_employee SISGDDO_acuerdo_empl_employee_id_343fc6cb_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdo_employee"
    ADD CONSTRAINT "SISGDDO_acuerdo_empl_employee_id_343fc6cb_fk_base_empl" FOREIGN KEY (employee_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_acuerdo SISGDDO_acuerdo_estado_id_1c8e022e_fk_SISGDDO_estado_acuerdo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_acuerdo"
    ADD CONSTRAINT "SISGDDO_acuerdo_estado_id_1c8e022e_fk_SISGDDO_estado_acuerdo_id" FOREIGN KEY (estado_id) REFERENCES public."SISGDDO_estado_acuerdo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_afectaciones SISGDDO_afectaciones_propuesto_id_79f10bb1_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_afectaciones"
    ADD CONSTRAINT "SISGDDO_afectaciones_propuesto_id_79f10bb1_fk_base_employee_id" FOREIGN KEY (propuesto_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_afectaciones SISGDDO_afectaciones_responsable_id_44e3f4f1_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_afectaciones"
    ADD CONSTRAINT "SISGDDO_afectaciones_responsable_id_44e3f4f1_fk_SISGDDO_area_id" FOREIGN KEY (responsable_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_externa_proceso SISGDDO_auditoria_ex_auditoria_externa_id_eb98e133_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso"
    ADD CONSTRAINT "SISGDDO_auditoria_ex_auditoria_externa_id_eb98e133_fk_SISGDDO_a" FOREIGN KEY (auditoria_externa_id) REFERENCES public."SISGDDO_auditoria_externa"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_externa_proceso SISGDDO_auditoria_ex_process_id_3dfdb35a_fk_base_proc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso"
    ADD CONSTRAINT "SISGDDO_auditoria_ex_process_id_3dfdb35a_fk_base_proc" FOREIGN KEY (process_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_externa SISGDDO_auditoria_externa_entidad_id_c6530628_fk_base_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_externa"
    ADD CONSTRAINT "SISGDDO_auditoria_externa_entidad_id_c6530628_fk_base_entity_id" FOREIGN KEY (entidad_id) REFERENCES public.base_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna_equipo SISGDDO_auditoria_in_auditoria_interna_id_5841c585_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo"
    ADD CONSTRAINT "SISGDDO_auditoria_in_auditoria_interna_id_5841c585_fk_SISGDDO_a" FOREIGN KEY (auditoria_interna_id) REFERENCES public."SISGDDO_auditoria_interna"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna_equipo SISGDDO_auditoria_in_employee_id_51387c36_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo"
    ADD CONSTRAINT "SISGDDO_auditoria_in_employee_id_51387c36_fk_base_empl" FOREIGN KEY (employee_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_auditoria_interna SISGDDO_auditoria_in_proceso_id_17b71d4d_fk_base_proc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna"
    ADD CONSTRAINT "SISGDDO_auditoria_in_proceso_id_17b71d4d_fk_base_proc" FOREIGN KEY (proceso_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_conclusion_adicional SISGDDO_conclusion_a_proyecto_ptr_id_fd573ea0_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_conclusion_adicional"
    ADD CONSTRAINT "SISGDDO_conclusion_a_proyecto_ptr_id_fd573ea0_fk_SISGDDO_p" FOREIGN KEY (proyecto_ptr_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo_formato SISGDDO_consecutivo__consecutivo_id_0863363c_fk_SISGDDO_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo_formato"
    ADD CONSTRAINT "SISGDDO_consecutivo__consecutivo_id_0863363c_fk_SISGDDO_c" FOREIGN KEY (consecutivo_id) REFERENCES public."SISGDDO_consecutivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo_formato SISGDDO_consecutivo__formato_id_42177e48_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo_formato"
    ADD CONSTRAINT "SISGDDO_consecutivo__formato_id_42177e48_fk_SISGDDO_f" FOREIGN KEY (formato_id) REFERENCES public."SISGDDO_formato"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_area_id_07694d17_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_area_id_07694d17_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_estado_id_cf1181a9_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_estado_id_cf1181a9_fk_SISGDDO_e" FOREIGN KEY (estado_id) REFERENCES public."SISGDDO_estado_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_fuente_financiamient_bf5a8394_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_fuente_financiamient_bf5a8394_fk_SISGDDO_f" FOREIGN KEY (fuente_financiamiento_id) REFERENCES public."SISGDDO_fuente_financiamiento"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_linea_tematica_id_4cbb0544_fk_SISGDDO_l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_linea_tematica_id_4cbb0544_fk_SISGDDO_l" FOREIGN KEY (linea_tematica_id) REFERENCES public."SISGDDO_linea_tematica"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_tipo_codigo_id_bb30e90d_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_tipo_codigo_id_bb30e90d_fk_SISGDDO_t" FOREIGN KEY (tipo_codigo_id) REFERENCES public."SISGDDO_tipo_codigo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_consecutivo SISGDDO_consecutivo_tipo_id_31db9a9d_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_consecutivo"
    ADD CONSTRAINT "SISGDDO_consecutivo_tipo_id_31db9a9d_fk_SISGDDO_t" FOREIGN KEY (tipo_id) REFERENCES public."SISGDDO_tipo_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_dato_adicional SISGDDO_dato_adicion_proyecto_ptr_id_7113cfc3_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_dato_adicional"
    ADD CONSTRAINT "SISGDDO_dato_adicion_proyecto_ptr_id_7113cfc3_fk_SISGDDO_p" FOREIGN KEY (proyecto_ptr_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entrada_proyecto_formato SISGDDO_entrada_proy_entrada_proyecto_id_a1eaef93_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_entrada_proy_entrada_proyecto_id_a1eaef93_fk_SISGDDO_e" FOREIGN KEY (entrada_proyecto_id) REFERENCES public."SISGDDO_entrada_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entrada_proyecto SISGDDO_entrada_proy_entregado_por_id_3361ea52_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto"
    ADD CONSTRAINT "SISGDDO_entrada_proy_entregado_por_id_3361ea52_fk_base_empl" FOREIGN KEY (entregado_por_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entrada_proyecto SISGDDO_entrada_proy_estado_id_fe9c37be_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto"
    ADD CONSTRAINT "SISGDDO_entrada_proy_estado_id_fe9c37be_fk_SISGDDO_e" FOREIGN KEY (estado_id) REFERENCES public."SISGDDO_estado_entradas_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entrada_proyecto_formato SISGDDO_entrada_proy_formato_id_66c1ef29_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_entrada_proy_formato_id_66c1ef29_fk_SISGDDO_f" FOREIGN KEY (formato_id) REFERENCES public."SISGDDO_formato"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_entrada_proyecto SISGDDO_entrada_proy_proyecto_id_7890fee4_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_entrada_proyecto"
    ADD CONSTRAINT "SISGDDO_entrada_proy_proyecto_id_7890fee4_fk_SISGDDO_p" FOREIGN KEY (proyecto_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_estado_proyecto SISGDDO_estado_proye_etapa_id_434b07a4_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_estado_proyecto"
    ADD CONSTRAINT "SISGDDO_estado_proye_etapa_id_434b07a4_fk_SISGDDO_e" FOREIGN KEY (etapa_id) REFERENCES public."SISGDDO_etapa_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_evaluacion_trimestral SISGDDO_evaluacion_t_evaluacion_id_644fc73e_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral"
    ADD CONSTRAINT "SISGDDO_evaluacion_t_evaluacion_id_644fc73e_fk_SISGDDO_e" FOREIGN KEY (evaluacion_id) REFERENCES public."SISGDDO_evaluacion"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_evaluacion_trimestral SISGDDO_evaluacion_t_objetivo_id_b0eea8d6_fk_SISGDDO_o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral"
    ADD CONSTRAINT "SISGDDO_evaluacion_t_objetivo_id_b0eea8d6_fk_SISGDDO_o" FOREIGN KEY (objetivo_id) REFERENCES public."SISGDDO_objetivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_evaluacion_trimestral SISGDDO_evaluacion_t_periodo_id_6aba39a9_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral"
    ADD CONSTRAINT "SISGDDO_evaluacion_t_periodo_id_6aba39a9_fk_SISGDDO_p" FOREIGN KEY (periodo_id) REFERENCES public."SISGDDO_periodo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_incidencia SISGDDO_incidencia_ejecutante_id_acf271a3_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencia"
    ADD CONSTRAINT "SISGDDO_incidencia_ejecutante_id_acf271a3_fk_base_employee_id" FOREIGN KEY (ejecutante_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_incidencia SISGDDO_incidencia_procesos_id_a2f5fa16_fk_base_process_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencia"
    ADD CONSTRAINT "SISGDDO_incidencia_procesos_id_a2f5fa16_fk_base_process_id" FOREIGN KEY (procesos_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_incidencia SISGDDO_incidencia_trabajador_id_88ef29b2_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencia"
    ADD CONSTRAINT "SISGDDO_incidencia_trabajador_id_88ef29b2_fk_base_employee_id" FOREIGN KEY (trabajador_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_indicador_objetivos SISGDDO_indicador_ob_objetivo_id_c1883a69_fk_SISGDDO_o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_objetivos"
    ADD CONSTRAINT "SISGDDO_indicador_ob_objetivo_id_c1883a69_fk_SISGDDO_o" FOREIGN KEY (objetivo_id) REFERENCES public."SISGDDO_objetivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_premio SISGDDO_premio_entidad_id_32643785_fk_base_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_premio"
    ADD CONSTRAINT "SISGDDO_premio_entidad_id_32643785_fk_base_entity_id" FOREIGN KEY (entidad_id) REFERENCES public.base_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_area_id_735950ad_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_area_id_735950ad_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_consecutivo_id_41e708e2_fk_SISGDDO_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_consecutivo_id_41e708e2_fk_SISGDDO_c" FOREIGN KEY (consecutivo_id) REFERENCES public."SISGDDO_consecutivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_estado_id_8f4b6d8d_fk_SISGDDO_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_estado_id_8f4b6d8d_fk_SISGDDO_e" FOREIGN KEY (estado_id) REFERENCES public."SISGDDO_estado_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto_formato SISGDDO_proyecto_for_formato_id_d4c1b27a_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_proyecto_for_formato_id_d4c1b27a_fk_SISGDDO_f" FOREIGN KEY (formato_id) REFERENCES public."SISGDDO_formato"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto_formato SISGDDO_proyecto_for_proyecto_id_36235f96_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto_formato"
    ADD CONSTRAINT "SISGDDO_proyecto_for_proyecto_id_36235f96_fk_SISGDDO_p" FOREIGN KEY (proyecto_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_fuente_financiamient_b3aa398a_fk_SISGDDO_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_fuente_financiamient_b3aa398a_fk_SISGDDO_f" FOREIGN KEY (fuente_financiamiento_id) REFERENCES public."SISGDDO_fuente_financiamiento"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_linea_tematica_id_10a43b97_fk_SISGDDO_l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_linea_tematica_id_10a43b97_fk_SISGDDO_l" FOREIGN KEY (linea_tematica_id) REFERENCES public."SISGDDO_linea_tematica"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_tipo_codigo_id_b05ed44d_fk_SISGDDO_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_tipo_codigo_id_b05ed44d_fk_SISGDDO_t" FOREIGN KEY (tipo_codigo_id) REFERENCES public."SISGDDO_tipo_codigo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_proyecto SISGDDO_proyecto_tipo_id_c88e10ea_fk_SISGDDO_tipo_proyecto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_proyecto"
    ADD CONSTRAINT "SISGDDO_proyecto_tipo_id_c88e10ea_fk_SISGDDO_tipo_proyecto_id" FOREIGN KEY (tipo_id) REFERENCES public."SISGDDO_tipo_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi SISGDDO_sosi_consecutivo_id_67aca643_fk_SISGDDO_consecutivo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_consecutivo_id_67aca643_fk_SISGDDO_consecutivo_id" FOREIGN KEY (consecutivo_id) REFERENCES public."SISGDDO_consecutivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_sosi SISGDDO_sosi_especialista_id_24d6da69_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_especialista_id_24d6da69_fk_base_employee_id" FOREIGN KEY (especialista_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_trabajador_consecutivo SISGDDO_trabajador_c_consecutivo_id_cd8a53e9_fk_SISGDDO_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo"
    ADD CONSTRAINT "SISGDDO_trabajador_c_consecutivo_id_cd8a53e9_fk_SISGDDO_c" FOREIGN KEY (consecutivo_id) REFERENCES public."SISGDDO_consecutivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_trabajador_consecutivo SISGDDO_trabajador_c_employee_id_53d7c9a3_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo"
    ADD CONSTRAINT "SISGDDO_trabajador_c_employee_id_53d7c9a3_fk_base_empl" FOREIGN KEY (employee_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_trabajador_consecutivo SISGDDO_trabajador_c_rol_id_1daa1fc0_fk_base_posi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo"
    ADD CONSTRAINT "SISGDDO_trabajador_c_rol_id_1daa1fc0_fk_base_posi" FOREIGN KEY (rol_id) REFERENCES public.base_position(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_trabajador_proyecto SISGDDO_trabajador_p_employee_id_f90c9f24_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto"
    ADD CONSTRAINT "SISGDDO_trabajador_p_employee_id_f90c9f24_fk_base_empl" FOREIGN KEY (employee_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_trabajador_proyecto SISGDDO_trabajador_p_proyecto_id_d0ca6712_fk_SISGDDO_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto"
    ADD CONSTRAINT "SISGDDO_trabajador_p_proyecto_id_d0ca6712_fk_SISGDDO_p" FOREIGN KEY (proyecto_id) REFERENCES public."SISGDDO_proyecto"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_trabajador_proyecto SISGDDO_trabajador_proyecto_rol_id_02adf738_fk_base_position_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto"
    ADD CONSTRAINT "SISGDDO_trabajador_proyecto_rol_id_02adf738_fk_base_position_id" FOREIGN KEY (rol_id) REFERENCES public.base_position(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: base_employee base_employee_position_id_79f70088_fk_base_position_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_employee
    ADD CONSTRAINT base_employee_position_id_79f70088_fk_base_position_id FOREIGN KEY (position_id) REFERENCES public.base_position(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_infoemployee base_infoemployee_employee_id_42ec708c_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_infoemployee
    ADD CONSTRAINT base_infoemployee_employee_id_42ec708c_fk_base_employee_id FOREIGN KEY (employee_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_procedure base_procedure_process_id_14cdad40_fk_base_process_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_procedure
    ADD CONSTRAINT base_procedure_process_id_14cdad40_fk_base_process_id FOREIGN KEY (process_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_process base_process_responsible_id_344e4108_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_process
    ADD CONSTRAINT base_process_responsible_id_344e4108_fk_base_employee_id FOREIGN KEY (responsible_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: complaints_complaintaction complaints_complaint_complaint_id_807b6ee9_fk_complaint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_complaintaction
    ADD CONSTRAINT complaints_complaint_complaint_id_807b6ee9_fk_complaint FOREIGN KEY (complaint_id) REFERENCES public.complaints_complaint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: complaints_complaint complaints_complaint_process_id_e77bc23c_fk_base_process_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_complaint
    ADD CONSTRAINT complaints_complaint_process_id_e77bc23c_fk_base_process_id FOREIGN KEY (process_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: complaints_complaint complaints_complaint_way_of_reception_id_640b2401_fk_complaint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complaints_complaint
    ADD CONSTRAINT complaints_complaint_way_of_reception_id_640b2401_fk_complaint FOREIGN KEY (way_of_reception_id) REFERENCES public.complaints_wayofreception(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: effectiveness_effectivenesssemester effectiveness_effect_effectiveness_id_a0af5cc8_fk_effective; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_effectivenesssemester
    ADD CONSTRAINT effectiveness_effect_effectiveness_id_a0af5cc8_fk_effective FOREIGN KEY (effectiveness_id) REFERENCES public.effectiveness_effectiveness(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: effectiveness_effectiveness effectiveness_effect_process_id_6d5884fe_fk_base_proc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_effectiveness
    ADD CONSTRAINT effectiveness_effect_process_id_6d5884fe_fk_base_proc FOREIGN KEY (process_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: effectiveness_indicatormeasurer effectiveness_indica_indicator_id_f42c87b2_fk_effective; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_indicatormeasurer
    ADD CONSTRAINT effectiveness_indica_indicator_id_f42c87b2_fk_effective FOREIGN KEY (indicator_id) REFERENCES public.effectiveness_indicator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: effectiveness_semestermeasurer effectiveness_semest_measurer_id_446ad6c1_fk_effective; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_semestermeasurer
    ADD CONSTRAINT effectiveness_semest_measurer_id_446ad6c1_fk_effective FOREIGN KEY (measurer_id) REFERENCES public.effectiveness_indicatormeasurer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: effectiveness_semestermeasurer effectiveness_semest_semester_id_bb53c5bd_fk_effective; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_semestermeasurer
    ADD CONSTRAINT effectiveness_semest_semester_id_bb53c5bd_fk_effective FOREIGN KEY (semester_id) REFERENCES public.effectiveness_effectivenesssemester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty iproperty_industrial_country_id_79753bf4_fk_base_coun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty
    ADD CONSTRAINT iproperty_industrial_country_id_79753bf4_fk_base_coun FOREIGN KEY (country_id) REFERENCES public.base_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_drawings iproperty_industrial_drawingclassificatio_79ec40ea_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_drawings
    ADD CONSTRAINT iproperty_industrial_drawingclassificatio_79ec40ea_fk_iproperty FOREIGN KEY (drawingclassification_id) REFERENCES public.iproperty_drawingclassification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_figurative_elements iproperty_industrial_figurativeelementcla_a8c5f01a_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements
    ADD CONSTRAINT iproperty_industrial_figurativeelementcla_a8c5f01a_fk_iproperty FOREIGN KEY (figurativeelementclassification_id) REFERENCES public.iproperty_figurativeelementclassification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_products iproperty_industrial_industrialproperty_i_0322db86_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_products
    ADD CONSTRAINT iproperty_industrial_industrialproperty_i_0322db86_fk_iproperty FOREIGN KEY (industrialproperty_id) REFERENCES public.iproperty_industrialproperty(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_figurative_elements iproperty_industrial_industrialproperty_i_56182c20_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_figurative_elements
    ADD CONSTRAINT iproperty_industrial_industrialproperty_i_56182c20_fk_iproperty FOREIGN KEY (industrialproperty_id) REFERENCES public.iproperty_industrialproperty(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_drawings iproperty_industrial_industrialproperty_i_bff6aaa7_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_drawings
    ADD CONSTRAINT iproperty_industrial_industrialproperty_i_bff6aaa7_fk_iproperty FOREIGN KEY (industrialproperty_id) REFERENCES public.iproperty_industrialproperty(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_patents iproperty_industrial_industrialproperty_i_d852c90a_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_patents
    ADD CONSTRAINT iproperty_industrial_industrialproperty_i_d852c90a_fk_iproperty FOREIGN KEY (industrialproperty_id) REFERENCES public.iproperty_industrialproperty(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_patents iproperty_industrial_patentclassification_df39c097_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_patents
    ADD CONSTRAINT iproperty_industrial_patentclassification_df39c097_fk_iproperty FOREIGN KEY (patentclassification_id) REFERENCES public.iproperty_patentclassification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty_products iproperty_industrial_productclassificatio_67d8230e_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty_products
    ADD CONSTRAINT iproperty_industrial_productclassificatio_67d8230e_fk_iproperty FOREIGN KEY (productclassification_id) REFERENCES public.iproperty_productclassification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iproperty_industrialproperty iproperty_industrial_type_legal_document__b8d57c0f_fk_iproperty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iproperty_industrialproperty
    ADD CONSTRAINT iproperty_industrial_type_legal_document__b8d57c0f_fk_iproperty FOREIGN KEY (type_legal_document_id) REFERENCES public.iproperty_typelegaldocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: licenses_license licenses_license_associated_process_i_a5903141_fk_base_proc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses_license
    ADD CONSTRAINT licenses_license_associated_process_i_a5903141_fk_base_proc FOREIGN KEY (associated_process_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: licenses_license licenses_license_entity_id_c7bd8c2e_fk_base_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses_license
    ADD CONSTRAINT licenses_license_entity_id_c7bd8c2e_fk_base_entity_id FOREIGN KEY (entity_id) REFERENCES public.base_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: licenses_license licenses_license_process_id_dcbf4da2_fk_base_process_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses_license
    ADD CONSTRAINT licenses_license_process_id_dcbf4da2_fk_base_process_id FOREIGN KEY (process_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: licenses_license licenses_license_responsible_id_0bd6dff1_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licenses_license
    ADD CONSTRAINT licenses_license_responsible_id_0bd6dff1_fk_base_employee_id FOREIGN KEY (responsible_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


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

