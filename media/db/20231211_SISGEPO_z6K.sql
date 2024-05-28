--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
ALTER TABLE ONLY public.effectiveness_indicator DROP CONSTRAINT effectiveness_indicator_process_id_7b2552ec_fk_base_process_id;
ALTER TABLE ONLY public.effectiveness_indicatormeasurer DROP CONSTRAINT effectiveness_indica_indicator_id_f42c87b2_fk_effective;
ALTER TABLE ONLY public.effectiveness_effectiveness DROP CONSTRAINT effectiveness_effect_process_id_6d5884fe_fk_base_proc;
ALTER TABLE ONLY public.effectiveness_effectivenesssemester DROP CONSTRAINT effectiveness_effect_effectiveness_id_a0af5cc8_fk_effective;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.complaints_complaint DROP CONSTRAINT complaints_complaint_way_of_reception_id_640b2401_fk_complaint;
ALTER TABLE ONLY public.complaints_complaint DROP CONSTRAINT complaints_complaint_process_id_e77bc23c_fk_base_process_id;
ALTER TABLE ONLY public.complaints_complaintaction DROP CONSTRAINT complaints_complaint_complaint_id_807b6ee9_fk_complaint;
ALTER TABLE ONLY public.base_process DROP CONSTRAINT base_process_responsible_id_344e4108_fk_base_employee_id;
ALTER TABLE ONLY public.base_process DROP CONSTRAINT base_process_classifier_id_07340843_fk_base_proc;
ALTER TABLE ONLY public.base_procedure DROP CONSTRAINT base_procedure_process_id_14cdad40_fk_base_process_id;
ALTER TABLE ONLY public.base_infoemployee DROP CONSTRAINT base_infoemployee_employee_id_42ec708c_fk_base_employee_id;
ALTER TABLE ONLY public.base_employee DROP CONSTRAINT base_employee_scientific_category__011fa789_fk_base_scie;
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
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_trabajador_id_88ef29b2_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_proceso_id_a0b6cbe7_fk_base_process_id";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_ejecutante_id_acf271a3_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto" DROP CONSTRAINT "SISGDDO_entrada_proy_proyecto_id_7890fee4_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato" DROP CONSTRAINT "SISGDDO_entrada_proy_formato_id_66c1ef29_fk_SISGDDO_f";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto" DROP CONSTRAINT "SISGDDO_entrada_proy_estado_id_fe9c37be_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto" DROP CONSTRAINT "SISGDDO_entrada_proy_entregado_por_id_3361ea52_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_entrada_proyecto_formato" DROP CONSTRAINT "SISGDDO_entrada_proy_entrada_proyecto_id_a1eaef93_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_descripcion_area_id_bfa1be01_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_descripcion_accion_id_52f1d318_fk_SISGDDO_a";
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
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_in_responsable_id_84e7e919_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna" DROP CONSTRAINT "SISGDDO_auditoria_in_proceso_id_17b71d4d_fk_base_proc";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo" DROP CONSTRAINT "SISGDDO_auditoria_in_employee_id_51387c36_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_auditoria_interna_equipo" DROP CONSTRAINT "SISGDDO_auditoria_in_auditoria_interna_id_5841c585_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa" DROP CONSTRAINT "SISGDDO_auditoria_externa_entidad_id_c6530628_fk_base_entity_id";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso" DROP CONSTRAINT "SISGDDO_auditoria_ex_process_id_3dfdb35a_fk_base_proc";
ALTER TABLE ONLY public."SISGDDO_auditoria_externa_proceso" DROP CONSTRAINT "SISGDDO_auditoria_ex_auditoria_externa_id_eb98e133_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos" DROP CONSTRAINT "SISGDDO_agruparroles_permission_id_0b9aa5f4_fk_auth_perm";
ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos" DROP CONSTRAINT "SISGDDO_agruparroles_agruparroles_id_3ec66735_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_afectaciones" DROP CONSTRAINT "SISGDDO_afectaciones_responsable_id_44e3f4f1_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_afectaciones" DROP CONSTRAINT "SISGDDO_afectaciones_propuesto_id_79f10bb1_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_afectaciones" DROP CONSTRAINT "SISGDDO_afectaciones_formato_id_478fff44_fk_SISGDDO_formato_id";
ALTER TABLE ONLY public."SISGDDO_acuerdo" DROP CONSTRAINT "SISGDDO_acuerdo_estado_id_1c8e022e_fk_SISGDDO_estado_acuerdo_id";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_empl_employee_id_343fc6cb_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_empl_acuerdo_id_7d77dcfc_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_actividadplan_preside" DROP CONSTRAINT "SISGDDO_actividadpla_employee_id_bf830be8_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadpla_employee_id_a4490474_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadpla_actividadplan_id_f484ee3d_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_actividadplan_preside" DROP CONSTRAINT "SISGDDO_actividadpla_actividadplan_id_ab13840c_fk_SISGDDO_a";
ALTER TABLE ONLY public."SISGDDO_accion_indicador_objetivo" DROP CONSTRAINT "SISGDDO_accion_indic_indicador_id_fb30c80e_fk_SISGDDO_i";
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
DROP INDEX public.effectiveness_indicator_process_id_7b2552ec;
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
DROP INDEX public.base_processclassifier_name_edb1145f_like;
DROP INDEX public.base_process_responsible_id_344e4108;
DROP INDEX public.base_process_name_681a7114_like;
DROP INDEX public.base_process_classifier_id_07340843;
DROP INDEX public.base_procedure_process_id_14cdad40;
DROP INDEX public.base_procedure_name_b841c895_like;
DROP INDEX public.base_position_name_1bda98f7_like;
DROP INDEX public.base_employee_scientific_category_id_011fa789;
DROP INDEX public.base_employee_position_id_79f70088;
DROP INDEX public.base_employee_identification_7db91c93_like;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
DROP INDEX public."SISGDDO_trabajador_proyecto_rol_id_02adf738";
DROP INDEX public."SISGDDO_trabajador_proyecto_proyecto_id_d0ca6712";
DROP INDEX public."SISGDDO_trabajador_proyecto_employee_id_f90c9f24";
DROP INDEX public."SISGDDO_trabajador_consecutivo_rol_id_1daa1fc0";
DROP INDEX public."SISGDDO_trabajador_consecutivo_employee_id_53d7c9a3";
DROP INDEX public."SISGDDO_trabajador_consecutivo_consecutivo_id_cd8a53e9";
DROP INDEX public."SISGDDO_tipo_proyecto_nombre_6c46c070_like";
DROP INDEX public."SISGDDO_tipo_de_obra_nombre_c085e828_like";
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
DROP INDEX public."SISGDDO_premio_nombre_b0593919_like";
DROP INDEX public."SISGDDO_premio_entidad_id_32643785";
DROP INDEX public."SISGDDO_linea_tematica_nombre_9f7df45b_like";
DROP INDEX public."SISGDDO_indicador_objetivos_objetivo_id_c1883a69";
DROP INDEX public."SISGDDO_indicador_objetivos_nombre_0a1844bf_like";
DROP INDEX public."SISGDDO_indicador_objetivos_no_c3d38afe_like";
DROP INDEX public."SISGDDO_incidencia_trabajador_id_88ef29b2";
DROP INDEX public."SISGDDO_incidencia_proceso_id_a0b6cbe7";
DROP INDEX public."SISGDDO_incidencia_ejecutante_id_acf271a3";
DROP INDEX public."SISGDDO_fuente_financiamiento_nombre_fafab37a_like";
DROP INDEX public."SISGDDO_formato_nombre_15f8a22b_like";
DROP INDEX public."SISGDDO_estado_proyecto_nombre_99d390cd_like";
DROP INDEX public."SISGDDO_estado_indicador_objetivos_nombre_fba308f5_like";
DROP INDEX public."SISGDDO_estado_cenda_nombre_abeefaae_like";
DROP INDEX public."SISGDDO_estado_acuerdo_nombre_0ae91081_like";
DROP INDEX public."SISGDDO_entrada_proyecto_proyecto_id_7890fee4";
DROP INDEX public."SISGDDO_entrada_proyecto_formato_formato_id_66c1ef29";
DROP INDEX public."SISGDDO_entrada_proyecto_formato_entrada_proyecto_id_a1eaef93";
DROP INDEX public."SISGDDO_entrada_proyecto_estado_id_fe9c37be";
DROP INDEX public."SISGDDO_entrada_proyecto_entregado_por_id_3361ea52";
DROP INDEX public."SISGDDO_entidad_nombre_f6a9ebad_like";
DROP INDEX public."SISGDDO_descripcion_area_id_bfa1be01";
DROP INDEX public."SISGDDO_descripcion_accion_id_52f1d318";
DROP INDEX public."SISGDDO_consecutivo_tipo_id_31db9a9d";
DROP INDEX public."SISGDDO_consecutivo_tipo_codigo_id_bb30e90d";
DROP INDEX public."SISGDDO_consecutivo_no_ea708152_like";
DROP INDEX public."SISGDDO_consecutivo_linea_tematica_id_4cbb0544";
DROP INDEX public."SISGDDO_consecutivo_fuente_financiamiento_id_bf5a8394";
DROP INDEX public."SISGDDO_consecutivo_formato_formato_id_42177e48";
DROP INDEX public."SISGDDO_consecutivo_formato_consecutivo_id_0863363c";
DROP INDEX public."SISGDDO_consecutivo_estado_id_cf1181a9";
DROP INDEX public."SISGDDO_consecutivo_area_id_07694d17";
DROP INDEX public."SISGDDO_auditoria_interna_responsable_id_84e7e919";
DROP INDEX public."SISGDDO_auditoria_interna_proceso_id_17b71d4d";
DROP INDEX public."SISGDDO_auditoria_interna_equipo_employee_id_51387c36";
DROP INDEX public."SISGDDO_auditoria_interna_equipo_auditoria_interna_id_5841c585";
DROP INDEX public."SISGDDO_auditoria_externa_proceso_process_id_3dfdb35a";
DROP INDEX public."SISGDDO_auditoria_externa_proceso_auditoria_externa_id_eb98e133";
DROP INDEX public."SISGDDO_auditoria_externa_entidad_id_c6530628";
DROP INDEX public."SISGDDO_area_nombre_9983a3f3_like";
DROP INDEX public."SISGDDO_agruparroles_permisos_permission_id_0b9aa5f4";
DROP INDEX public."SISGDDO_agruparroles_permisos_agruparroles_id_3ec66735";
DROP INDEX public."SISGDDO_afectaciones_responsable_id_44e3f4f1";
DROP INDEX public."SISGDDO_afectaciones_propuesto_id_79f10bb1";
DROP INDEX public."SISGDDO_afectaciones_formato_id_478fff44";
DROP INDEX public."SISGDDO_acuerdo_numero_62f7297a_like";
DROP INDEX public."SISGDDO_acuerdo_estado_id_1c8e022e";
DROP INDEX public."SISGDDO_acuerdo_employee_employee_id_343fc6cb";
DROP INDEX public."SISGDDO_acuerdo_employee_acuerdo_id_7d77dcfc";
DROP INDEX public."SISGDDO_actividadplan_preside_employee_id_bf830be8";
DROP INDEX public."SISGDDO_actividadplan_preside_actividadplan_id_ab13840c";
DROP INDEX public."SISGDDO_actividadplan_participantes_employee_id_a4490474";
DROP INDEX public."SISGDDO_actividadplan_participantes_actividadplan_id_f484ee3d";
DROP INDEX public."SISGDDO_accion_indicador_objetivo_indicador_id_fb30c80e";
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
ALTER TABLE ONLY public.base_scientificcategory DROP CONSTRAINT base_scientificcategory_pkey;
ALTER TABLE ONLY public.base_processclassifier DROP CONSTRAINT base_processclassifier_pkey;
ALTER TABLE ONLY public.base_processclassifier DROP CONSTRAINT base_processclassifier_name_key;
ALTER TABLE ONLY public.base_process DROP CONSTRAINT base_process_pkey;
ALTER TABLE ONLY public.base_process DROP CONSTRAINT base_process_name_key;
ALTER TABLE ONLY public.base_procedure DROP CONSTRAINT base_procedure_pkey;
ALTER TABLE ONLY public.base_procedure DROP CONSTRAINT base_procedure_name_key;
ALTER TABLE ONLY public.base_position DROP CONSTRAINT base_position_pkey;
ALTER TABLE ONLY public.base_position DROP CONSTRAINT base_position_name_key;
ALTER TABLE ONLY public.base_logoentity DROP CONSTRAINT base_logoentity_pkey;
ALTER TABLE ONLY public.base_infoemployee DROP CONSTRAINT base_infoemployee_pkey;
ALTER TABLE ONLY public.base_infoemployee DROP CONSTRAINT base_infoemployee_employee_id_key;
ALTER TABLE ONLY public.base_entity DROP CONSTRAINT base_entity_pkey;
ALTER TABLE ONLY public.base_employee DROP CONSTRAINT base_employee_pkey;
ALTER TABLE ONLY public.base_employee DROP CONSTRAINT base_employee_identification_key;
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
ALTER TABLE ONLY public."SISGDDO_trabajador_proyecto" DROP CONSTRAINT "SISGDDO_trabajador_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_consecutivo_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_proyecto" DROP CONSTRAINT "SISGDDO_tipo_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_proyecto" DROP CONSTRAINT "SISGDDO_tipo_proyecto_nombre_key";
ALTER TABLE ONLY public."SISGDDO_tipo_de_obra" DROP CONSTRAINT "SISGDDO_tipo_de_obra_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_de_obra" DROP CONSTRAINT "SISGDDO_tipo_de_obra_nombre_key";
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
ALTER TABLE ONLY public."SISGDDO_premio" DROP CONSTRAINT "SISGDDO_premio_pkey";
ALTER TABLE ONLY public."SISGDDO_premio" DROP CONSTRAINT "SISGDDO_premio_nombre_key";
ALTER TABLE ONLY public."SISGDDO_permisos_personalizados" DROP CONSTRAINT "SISGDDO_permisos_personalizados_pkey";
ALTER TABLE ONLY public."SISGDDO_objetivo" DROP CONSTRAINT "SISGDDO_objetivo_pkey";
ALTER TABLE ONLY public."SISGDDO_linea_tematica" DROP CONSTRAINT "SISGDDO_linea_tematica_pkey";
ALTER TABLE ONLY public."SISGDDO_linea_tematica" DROP CONSTRAINT "SISGDDO_linea_tematica_nombre_key";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_objetivos_pkey";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_objetivos_nombre_key";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_objetivos_no_key";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_pkey";
ALTER TABLE ONLY public."SISGDDO_fuente_financiamiento" DROP CONSTRAINT "SISGDDO_fuente_financiamiento_pkey";
ALTER TABLE ONLY public."SISGDDO_fuente_financiamiento" DROP CONSTRAINT "SISGDDO_fuente_financiamiento_nombre_key";
ALTER TABLE ONLY public."SISGDDO_formato" DROP CONSTRAINT "SISGDDO_formato_pkey";
ALTER TABLE ONLY public."SISGDDO_formato" DROP CONSTRAINT "SISGDDO_formato_nombre_key";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto" DROP CONSTRAINT "SISGDDO_estado_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto" DROP CONSTRAINT "SISGDDO_estado_proyecto_nombre_key";
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
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_descripcion_pkey";
ALTER TABLE ONLY public."SISGDDO_dato_adicional" DROP CONSTRAINT "SISGDDO_dato_adicional_pkey";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_pkey";
ALTER TABLE ONLY public."SISGDDO_consecutivo" DROP CONSTRAINT "SISGDDO_consecutivo_no_key";
ALTER TABLE ONLY public."SISGDDO_consecutivo_formato" DROP CONSTRAINT "SISGDDO_consecutivo_formato_pkey";
ALTER TABLE ONLY public."SISGDDO_consecutivo_formato" DROP CONSTRAINT "SISGDDO_consecutivo_form_consecutivo_id_formato_i_00dac759_uniq";
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
ALTER TABLE ONLY public."SISGDDO_agruparroles" DROP CONSTRAINT "SISGDDO_agruparroles_pkey";
ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos" DROP CONSTRAINT "SISGDDO_agruparroles_permisos_pkey";
ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos" DROP CONSTRAINT "SISGDDO_agruparroles_per_agruparroles_id_permissi_2653402f_uniq";
ALTER TABLE ONLY public."SISGDDO_afectaciones" DROP CONSTRAINT "SISGDDO_afectaciones_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdo" DROP CONSTRAINT "SISGDDO_acuerdo_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdo" DROP CONSTRAINT "SISGDDO_acuerdo_numero_key";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_employee_pkey";
ALTER TABLE ONLY public."SISGDDO_acuerdo_employee" DROP CONSTRAINT "SISGDDO_acuerdo_employee_acuerdo_id_employee_id_8cf1b53c_uniq";
ALTER TABLE ONLY public."SISGDDO_actividadplan_preside" DROP CONSTRAINT "SISGDDO_actividadplan_preside_pkey";
ALTER TABLE ONLY public."SISGDDO_actividadplan_preside" DROP CONSTRAINT "SISGDDO_actividadplan_pr_actividadplan_id_employe_008eafdd_uniq";
ALTER TABLE ONLY public."SISGDDO_actividadplan" DROP CONSTRAINT "SISGDDO_actividadplan_pkey";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadplan_participantes_pkey";
ALTER TABLE ONLY public."SISGDDO_actividadplan_participantes" DROP CONSTRAINT "SISGDDO_actividadplan_pa_actividadplan_id_employe_36e34bde_uniq";
ALTER TABLE ONLY public."SISGDDO_accion_indicador_objetivo" DROP CONSTRAINT "SISGDDO_accion_indicador_objetivo_pkey";
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
DROP TABLE public.base_scientificcategory;
DROP TABLE public.base_processclassifier;
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
DROP TABLE public."SISGDDO_premio";
DROP TABLE public."SISGDDO_permisos_personalizados";
DROP TABLE public."SISGDDO_objetivo";
DROP TABLE public."SISGDDO_linea_tematica";
DROP TABLE public."SISGDDO_indicador_objetivos";
DROP TABLE public."SISGDDO_incidencia";
DROP TABLE public."SISGDDO_fuente_financiamiento";
DROP TABLE public."SISGDDO_formato";
DROP TABLE public."SISGDDO_estado_proyecto";
DROP TABLE public."SISGDDO_estado_indicador_objetivos";
DROP TABLE public."SISGDDO_estado_entradas_proyecto";
DROP TABLE public."SISGDDO_estado_cenda";
DROP TABLE public."SISGDDO_estado_acuerdo";
DROP TABLE public."SISGDDO_entrada_proyecto_formato";
DROP TABLE public."SISGDDO_entrada_proyecto";
DROP TABLE public."SISGDDO_entidad";
DROP TABLE public."SISGDDO_descripcion";
DROP TABLE public."SISGDDO_dato_adicional";
DROP TABLE public."SISGDDO_consecutivo_formato";
DROP TABLE public."SISGDDO_consecutivo";
DROP TABLE public."SISGDDO_conclusion_adicional";
DROP TABLE public."SISGDDO_cambiarlogotipo";
DROP TABLE public."SISGDDO_auditoria_interna_equipo";
DROP TABLE public."SISGDDO_auditoria_interna";
DROP TABLE public."SISGDDO_auditoria_externa_proceso";
DROP TABLE public."SISGDDO_auditoria_externa";
DROP TABLE public."SISGDDO_area";
DROP TABLE public."SISGDDO_agruparroles_permisos";
DROP TABLE public."SISGDDO_agruparroles";
DROP TABLE public."SISGDDO_afectaciones";
DROP TABLE public."SISGDDO_acuerdo_employee";
DROP TABLE public."SISGDDO_acuerdo";
DROP TABLE public."SISGDDO_actividadplan_preside";
DROP TABLE public."SISGDDO_actividadplan_participantes";
DROP TABLE public."SISGDDO_actividadplan";
DROP TABLE public."SISGDDO_accion_indicador_objetivo";
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
-- Name: SISGDDO_accion_indicador_objetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_accion_indicador_objetivo" (
    id integer NOT NULL,
    no character varying(10),
    codigo character varying(10),
    nombre character varying(80) NOT NULL,
    activo boolean NOT NULL,
    indicador_id integer
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
    activo boolean NOT NULL,
    id integer NOT NULL,
    descripcion character varying(80),
    dia date NOT NULL,
    plan character varying(80) NOT NULL,
    hora time without time zone NOT NULL,
    lugar character varying(80),
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
-- Name: SISGDDO_actividadplan_preside; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_actividadplan_preside" (
    id integer NOT NULL,
    actividadplan_id integer NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public."SISGDDO_actividadplan_preside" OWNER TO postgres;

--
-- Name: SISGDDO_actividadplan_preside_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_actividadplan_preside" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_actividadplan_preside_id_seq"
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
    nombre character varying(25),
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
    fecha_cierre date,
    afectacion character varying(80) NOT NULL,
    observacionesactual character varying(250) NOT NULL,
    estado character varying(50) NOT NULL,
    formato_id integer,
    propuesto_id integer,
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
-- Name: SISGDDO_agruparroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_agruparroles" (
    id integer NOT NULL,
    accion character varying(255) NOT NULL,
    modulo character varying(255) NOT NULL
);


ALTER TABLE public."SISGDDO_agruparroles" OWNER TO postgres;

--
-- Name: SISGDDO_agruparroles_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_agruparroles_permisos" (
    id integer NOT NULL,
    agruparroles_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_agruparroles_permisos" OWNER TO postgres;

--
-- Name: SISGDDO_agruparroles_permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_agruparroles_permisos" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_agruparroles_permisos_id_seq"
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
    proceso_id bigint,
    responsable_id bigint
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
-- Name: SISGDDO_descripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_descripcion" (
    id integer NOT NULL,
    descripcion character varying(500),
    accion_id integer NOT NULL,
    area_id integer NOT NULL
);


ALTER TABLE public."SISGDDO_descripcion" OWNER TO postgres;

--
-- Name: SISGDDO_descripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_descripcion" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_descripcion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_estado_proyecto" OWNER TO postgres;

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
    hora time without time zone NOT NULL,
    descripcion character varying(250) NOT NULL,
    respuesta text,
    estado character varying(250),
    activo boolean NOT NULL,
    ejecutante_id integer,
    proceso_id bigint,
    trabajador_id integer
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
    no character varying(10) NOT NULL,
    nombre character varying(150),
    activo boolean NOT NULL,
    objetivo_id integer
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
    anno character varying(4),
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
    no character varying(10) NOT NULL,
    nombre character varying(150) NOT NULL,
    fecha_definicion date NOT NULL,
    evaluacion character varying(10),
    activo boolean NOT NULL
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
-- Name: SISGDDO_premio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_premio" (
    id integer NOT NULL,
    nombre character varying(150),
    descripcion character varying(500),
    fecha timestamp with time zone NOT NULL,
    archivo character varying(100) NOT NULL,
    activo boolean NOT NULL,
    entidad_id bigint NOT NULL
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
    activo boolean NOT NULL
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
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    identification character varying(11) NOT NULL,
    image character varying(100),
    active boolean NOT NULL,
    position_id bigint,
    scientific_category_id bigint
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
    file character varying(100),
    active boolean NOT NULL,
    classifier_id bigint,
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
-- Name: base_processclassifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_processclassifier (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.base_processclassifier OWNER TO postgres;

--
-- Name: base_processclassifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_processclassifier ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_processclassifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: base_scientificcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_scientificcategory (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    prefix character varying(15),
    active boolean NOT NULL
);


ALTER TABLE public.base_scientificcategory OWNER TO postgres;

--
-- Name: base_scientificcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.base_scientificcategory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.base_scientificcategory_id_seq
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
    status integer,
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
    name character varying(150) NOT NULL,
    active boolean NOT NULL
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
    active boolean NOT NULL,
    process_id bigint NOT NULL
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
    name character varying(150) NOT NULL,
    active boolean NOT NULL
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
    name character varying(150) NOT NULL,
    active boolean NOT NULL
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
    name character varying(150) NOT NULL,
    active boolean NOT NULL
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
    active boolean NOT NULL,
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
2	fee66f80-4d2b-47ed-a474-443241304d5f	foto/images.jpeg	\N	f	f
3	aca03dac-0dbc-4603-b9ed-a905bad62615	foto/userDefault1.png	\N	f	f
\.


--
-- Data for Name: SISGDDO_accion_indicador_objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_accion_indicador_objetivo" (id, no, codigo, nombre, activo, indicador_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_actividadplan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_actividadplan" (activo, id, descripcion, dia, plan, hora, lugar, otro) FROM stdin;
t	1	asdsa	2023-12-05	Empresa	14:55:00	Salon de Protocolo 5to piso	
\.


--
-- Data for Name: SISGDDO_actividadplan_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_actividadplan_participantes" (id, actividadplan_id, employee_id) FROM stdin;
1	1	1
2	1	2
\.


--
-- Data for Name: SISGDDO_actividadplan_preside; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_actividadplan_preside" (id, actividadplan_id, employee_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: SISGDDO_acuerdo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdo" (id, numero, nombre, fecha, fecha_limite, fecha_cumplimiento, observaciones, activo, estado_id) FROM stdin;
6	1	asda	2023-12-11	2023-12-23	\N	\N	t	2
\.


--
-- Data for Name: SISGDDO_acuerdo_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdo_employee" (id, acuerdo_id, employee_id) FROM stdin;
3	6	1
\.


--
-- Data for Name: SISGDDO_afectaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_afectaciones" (activo, numero, fecha_recepcion, fecha_cierre, afectacion, observacionesactual, estado, formato_id, propuesto_id, responsable_id) FROM stdin;
t	4	2023-12-06 00:00:00-05	\N	asdas	asda\r\naaa	Cerrado	1	1	2
t	3	2023-12-04 00:00:00-05	\N	zzzzzzzzzzz	aaaaaaaa	Cerrado	1	2	1
t	1	2023-12-04 00:00:00-05	\N	asdsa	asdasd	Cerrado	\N	1	1
f	2	2023-12-01 00:00:00-05	\N	adsdsad	dddddddd	Cerrado	\N	2	1
t	5	2023-12-01 00:00:00-05	2023-12-06	aaaa	ssssss	Cerrado	1	1	2
t	6	2023-11-30 00:00:00-05	\N	asd	- - sadaad  2023-12-06\r\naaaaaa  2023-12-06	En proceso	\N	1	2
f	7	2023-12-06 00:00:00-05	\N	aaaa	asd  2023-12-06	Iniciada	1	1	2
t	8	2023-12-06 00:00:00-05	\N	aaaa	adsadas  2023-12-06	Iniciada	1	1	2
\.


--
-- Data for Name: SISGDDO_agruparroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_agruparroles" (id, accion, modulo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_agruparroles_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_agruparroles_permisos" (id, agruparroles_id, permission_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_area" (id, nombre, activo) FROM stdin;
1	aaaaaaaa	t
2	asd	t
\.


--
-- Data for Name: SISGDDO_auditoria_externa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_externa" (registro, id, fechainicio, fechafin, titulo, resultados, observaciones, informe, plan_medidas, activo, entidad_id) FROM stdin;
1	1	2023-12-04	2023-12-05	zzzzz	Satifactorio	aaa			t	1
\.


--
-- Data for Name: SISGDDO_auditoria_externa_proceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_externa_proceso" (id, auditoria_externa_id, process_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: SISGDDO_auditoria_interna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_interna" (id, fechainicio, fechafin, titulo, resultados, objetivos, alcance, criterios, observaciones, informe, activo, proceso_id, responsable_id) FROM stdin;
1	2023-12-08	2023-12-10	adsa	\N	\N	\N	\N	\N		t	1	1
\.


--
-- Data for Name: SISGDDO_auditoria_interna_equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_auditoria_interna_equipo" (id, auditoria_interna_id, employee_id) FROM stdin;
1	1	1
2	1	2
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
-- Data for Name: SISGDDO_consecutivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_consecutivo" (id, no, codigo, fecha_entrada, nombre_proyecto, aprobacion_consejo, fecha_aprobacion, fecha_inicio, fecha_interrupcion, causa_interrupcion, fecha_terminacion, fecha_extension, fecha_cierre, costo, observacion, informe_apertura, informe_cierre, activo, area_id, estado_id, fuente_financiamiento_id, linea_tematica_id, tipo_id, tipo_codigo_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_consecutivo_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_consecutivo_formato" (id, consecutivo_id, formato_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_dato_adicional; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_dato_adicional" (proyecto_ptr_id, fecha, descripcion) FROM stdin;
\.


--
-- Data for Name: SISGDDO_descripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_descripcion" (id, descripcion, accion_id, area_id) FROM stdin;
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
1	ccccccccccccccc	t
2	Pendiente	t
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

COPY public."SISGDDO_estado_proyecto" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_formato" (id, nombre, activo) FROM stdin;
1	Video	t
\.


--
-- Data for Name: SISGDDO_fuente_financiamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_fuente_financiamiento" (id, nombre, activo) FROM stdin;
1	ddddddd	t
\.


--
-- Data for Name: SISGDDO_incidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_incidencia" (id, titulo, fecha_recepcion, fecha_cierre, hora, descripcion, respuesta, estado, activo, ejecutante_id, proceso_id, trabajador_id) FROM stdin;
1	as	2023-12-04	\N	19:00:00	sads	asd	Cerrado	t	2	1	1
2	aaaa	2023-12-05	\N	05:00:00	ssss	\N	Iniciada	f	2	1	1
\.


--
-- Data for Name: SISGDDO_indicador_objetivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_indicador_objetivos" (id, no, nombre, activo, objetivo_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_linea_tematica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_linea_tematica" (id, nombre, anno, activo) FROM stdin;
1	bbbbbbbbbbbb	\N	t
\.


--
-- Data for Name: SISGDDO_objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_objetivo" (id, no, nombre, fecha_definicion, evaluacion, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_permisos_personalizados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_permisos_personalizados" (id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_premio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_premio" (id, nombre, descripcion, fecha, archivo, activo, entidad_id) FROM stdin;
1	asdsa	adsada	2023-12-08 00:00:00-05		f	1
\.


--
-- Data for Name: SISGDDO_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_proyecto" (id, no, codigo, fecha_entrada, nombre_proyecto, aprobacion_consejo, fecha_aprobacion, fecha_inicio, fecha_interrupcion, causa_interrupcion, fecha_terminacion, fecha_extension, fecha_cierre, costo, observacion, informe_apertura, informe_cierre, activo, area_id, consecutivo_id, estado_id, fuente_financiamiento_id, linea_tematica_id, tipo_id, tipo_codigo_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_proyecto_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_proyecto_formato" (id, proyecto_id, formato_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_sosi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_sosi" (id, numero_salva, fecha, anno, autor, ubicacion_salva, observaciones, archivo, activo, consecutivo_id, especialista_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_tipo_codigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_tipo_codigo" (id, nombre, activo) FROM stdin;
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
\.


--
-- Data for Name: SISGDDO_trabajador_consecutivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_trabajador_consecutivo" (id, consecutivo_id, employee_id, rol_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_trabajador_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_trabajador_proyecto" (id, activo, employee_id, proyecto_id, rol_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	Administrador
2	Prop Ind
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	160
2	1	161
3	1	162
4	1	171
5	1	172
6	1	173
7	1	174
8	1	147
9	1	148
10	1	149
11	1	150
12	1	155
13	1	156
14	1	157
15	1	158
16	1	159
17	2	275
18	2	276
19	2	277
20	2	278
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add accion_indicador_objetivo	1	add_accion_indicador_objetivo
2	Can change accion_indicador_objetivo	1	change_accion_indicador_objetivo
3	Can delete accion_indicador_objetivo	1	delete_accion_indicador_objetivo
4	Can view accion_indicador_objetivo	1	view_accion_indicador_objetivo
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
107	Can add indicador_objetivos	26	add_indicador_objetivos
108	Can change indicador_objetivos	26	change_indicador_objetivos
109	Can delete indicador_objetivos	26	delete_indicador_objetivos
110	Can view indicador_objetivos	26	view_indicador_objetivos
111	Can add incidencia	27	add_incidencia
112	Can change incidencia	27	change_incidencia
113	Can delete incidencia	27	delete_incidencia
114	Can view incidencia	27	view_incidencia
115	Can add entrada_proyecto	28	add_entrada_proyecto
116	Can change entrada_proyecto	28	change_entrada_proyecto
117	Can delete entrada_proyecto	28	delete_entrada_proyecto
118	Can view entrada_proyecto	28	view_entrada_proyecto
119	Can add descripcion	29	add_descripcion
120	Can change descripcion	29	change_descripcion
121	Can delete descripcion	29	delete_descripcion
122	Can view descripcion	29	view_descripcion
123	Can add auditoria_interna	30	add_auditoria_interna
124	Can change auditoria_interna	30	change_auditoria_interna
125	Can delete auditoria_interna	30	delete_auditoria_interna
126	Can view auditoria_interna	30	view_auditoria_interna
127	Can add auditoria_externa	31	add_auditoria_externa
128	Can change auditoria_externa	31	change_auditoria_externa
129	Can delete auditoria_externa	31	delete_auditoria_externa
130	Can view auditoria_externa	31	view_auditoria_externa
131	Can add agrupar roles	32	add_agruparroles
132	Can change agrupar roles	32	change_agruparroles
133	Can delete agrupar roles	32	delete_agruparroles
134	Can view agrupar roles	32	view_agruparroles
135	Can add afectaciones	33	add_afectaciones
136	Can change afectaciones	33	change_afectaciones
137	Can delete afectaciones	33	delete_afectaciones
138	Can view afectaciones	33	view_afectaciones
139	Can add acuerdo	34	add_acuerdo
140	Can change acuerdo	34	change_acuerdo
141	Can delete acuerdo	34	delete_acuerdo
142	Can view acuerdo	34	view_acuerdo
143	Can add actividad plan	35	add_actividadplan
144	Can change actividad plan	35	change_actividadplan
145	Can delete actividad plan	35	delete_actividadplan
146	Can view actividad plan	35	view_actividadplan
147	Can add log entry	36	add_logentry
148	Can change log entry	36	change_logentry
149	Can delete log entry	36	delete_logentry
150	Can view log entry	36	view_logentry
151	Can add permission	37	add_permission
152	Can change permission	37	change_permission
153	Can delete permission	37	delete_permission
154	Can view permission	37	view_permission
155	Can add group	38	add_group
156	Can change group	38	change_group
157	Can delete group	38	delete_group
158	Can view group	38	view_group
159	Can add user	39	add_user
160	Can change user	39	change_user
161	Can delete user	39	delete_user
162	Can view user	39	view_user
163	Can add content type	40	add_contenttype
164	Can change content type	40	change_contenttype
165	Can delete content type	40	delete_contenttype
166	Can view content type	40	view_contenttype
167	Can add session	41	add_session
168	Can change session	41	change_session
169	Can delete session	41	delete_session
170	Can view session	41	view_session
171	Can add user app	42	add_userapp
172	Can change user app	42	change_userapp
173	Can delete user app	42	delete_userapp
174	Can view user app	42	view_userapp
175	Can add notification	43	add_notification
176	Can change notification	43	change_notification
177	Can delete notification	43	delete_notification
178	Can view notification	43	view_notification
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
199	Can add process classifier	49	add_processclassifier
200	Can change process classifier	49	change_processclassifier
201	Can delete process classifier	49	delete_processclassifier
202	Can view process classifier	49	view_processclassifier
203	Can add scientific category	50	add_scientificcategory
204	Can change scientific category	50	change_scientificcategory
205	Can delete scientific category	50	delete_scientificcategory
206	Can view scientific category	50	view_scientificcategory
207	Can add process	51	add_process
208	Can change process	51	change_process
209	Can delete process	51	delete_process
210	Can view process	51	view_process
211	Can add procedure	52	add_procedure
212	Can change procedure	52	change_procedure
213	Can delete procedure	52	delete_procedure
214	Can view procedure	52	view_procedure
215	Can add info employee	53	add_infoemployee
216	Can change info employee	53	change_infoemployee
217	Can delete info employee	53	delete_infoemployee
218	Can view info employee	53	view_infoemployee
219	Can add effectiveness	54	add_effectiveness
220	Can change effectiveness	54	change_effectiveness
221	Can delete effectiveness	54	delete_effectiveness
222	Can view effectiveness	54	view_effectiveness
223	Can add effectiveness semester	55	add_effectivenesssemester
224	Can change effectiveness semester	55	change_effectivenesssemester
225	Can delete effectiveness semester	55	delete_effectivenesssemester
226	Can view effectiveness semester	55	view_effectivenesssemester
227	Can add indicator	56	add_indicator
228	Can change indicator	56	change_indicator
229	Can delete indicator	56	delete_indicator
230	Can view indicator	56	view_indicator
231	Can add indicator measurer	57	add_indicatormeasurer
232	Can change indicator measurer	57	change_indicatormeasurer
233	Can delete indicator measurer	57	delete_indicatormeasurer
234	Can view indicator measurer	57	view_indicatormeasurer
235	Can add semester measurer	58	add_semestermeasurer
236	Can change semester measurer	58	change_semestermeasurer
237	Can delete semester measurer	58	delete_semestermeasurer
238	Can view semester measurer	58	view_semestermeasurer
239	Can add license	59	add_license
240	Can change license	59	change_license
241	Can delete license	59	delete_license
242	Can view license	59	view_license
243	Can add way of reception	60	add_wayofreception
244	Can change way of reception	60	change_wayofreception
245	Can delete way of reception	60	delete_wayofreception
246	Can view way of reception	60	view_wayofreception
247	Can add complaint	61	add_complaint
248	Can change complaint	61	change_complaint
249	Can delete complaint	61	delete_complaint
250	Can view complaint	61	view_complaint
251	Can add complaint action	62	add_complaintaction
252	Can change complaint action	62	change_complaintaction
253	Can delete complaint action	62	delete_complaintaction
254	Can view complaint action	62	view_complaintaction
255	Can add drawing classification	63	add_drawingclassification
256	Can change drawing classification	63	change_drawingclassification
257	Can delete drawing classification	63	delete_drawingclassification
258	Can view drawing classification	63	view_drawingclassification
259	Can add figurative element classification	64	add_figurativeelementclassification
260	Can change figurative element classification	64	change_figurativeelementclassification
261	Can delete figurative element classification	64	delete_figurativeelementclassification
262	Can view figurative element classification	64	view_figurativeelementclassification
263	Can add patent classification	65	add_patentclassification
264	Can change patent classification	65	change_patentclassification
265	Can delete patent classification	65	delete_patentclassification
266	Can view patent classification	65	view_patentclassification
267	Can add product classification	66	add_productclassification
268	Can change product classification	66	change_productclassification
269	Can delete product classification	66	delete_productclassification
270	Can view product classification	66	view_productclassification
271	Can add type legal document	67	add_typelegaldocument
272	Can change type legal document	67	change_typelegaldocument
273	Can delete type legal document	67	delete_typelegaldocument
274	Can view type legal document	67	view_typelegaldocument
275	Can add industrial property	68	add_industrialproperty
276	Can change industrial property	68	change_industrialproperty
277	Can delete industrial property	68	delete_industrialproperty
278	Can view industrial property	68	view_industrialproperty
279	Can add configuracion	69	add_configuracion
280	Can change configuracion	69	change_configuracion
281	Can delete configuracion	69	delete_configuracion
282	Can view configuracion	69	view_configuracion
283	Can add estado_proyecto_dgca	70	add_estado_proyecto_dgca
284	Can change estado_proyecto_dgca	70	change_estado_proyecto_dgca
285	Can delete estado_proyecto_dgca	70	delete_estado_proyecto_dgca
286	Can view estado_proyecto_dgca	70	view_estado_proyecto_dgca
287	Can add etapa_proyecto	71	add_etapa_proyecto
288	Can change etapa_proyecto	71	change_etapa_proyecto
289	Can delete etapa_proyecto	71	delete_etapa_proyecto
290	Can view etapa_proyecto	71	view_etapa_proyecto
291	Can add evaluacion	72	add_evaluacion
292	Can change evaluacion	72	change_evaluacion
293	Can delete evaluacion	72	delete_evaluacion
294	Can view evaluacion	72	view_evaluacion
295	Can add periodo	73	add_periodo
296	Can change periodo	73	change_periodo
297	Can delete periodo	73	delete_periodo
298	Can view periodo	73	view_periodo
299	Can add prioridad	74	add_prioridad
300	Can change prioridad	74	change_prioridad
301	Can delete prioridad	74	delete_prioridad
302	Can view prioridad	74	view_prioridad
303	Can add registro_aprobacion	75	add_registro_aprobacion
304	Can change registro_aprobacion	75	change_registro_aprobacion
305	Can delete registro_aprobacion	75	delete_registro_aprobacion
306	Can view registro_aprobacion	75	view_registro_aprobacion
307	Can add evaluacion_trimestral	76	add_evaluacion_trimestral
308	Can change evaluacion_trimestral	76	change_evaluacion_trimestral
309	Can delete evaluacion_trimestral	76	delete_evaluacion_trimestral
310	Can view evaluacion_trimestral	76	view_evaluacion_trimestral
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$390000$fkoFkpF8Gvr5WSoLsmVQsT$CcEK1zHWZI4Oy32h0OjvnicPrlLs/e+jzPAWJ7XJ4nA=	2023-12-11 13:14:13.857815-05	f	abelc	Abel	Creagh	abelc@citmatel.inf.cu	f	t	2023-12-08 16:14:58.284641-05
3	pbkdf2_sha256$390000$G7w50U17fPSIcuGw6IGb62$A8pi0JP5AWNn5RoqhBHvVfHxIVRevGWMqHmROGUBKdg=	2023-12-11 13:16:08.3197-05	f	manolo	Manolo	Escobar	manolo@citmatel.inf.cu	f	t	2023-12-08 17:01:50.120445-05
1	pbkdf2_sha256$390000$foWprdnWbpEt7COl25WsLW$rrRvDgb+rGhNCVu4bdk7ko5/Of9XMN2emylGvEwpaEI=	2023-12-11 13:42:08.522593-05	t	hermes			hermes22@gmail.com	t	t	2023-11-29 19:08:57.587282-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
2	3	2
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	147
2	2	148
3	2	149
4	2	150
5	2	155
6	2	156
7	2	157
8	2	158
9	2	159
10	2	160
11	2	161
12	2	162
13	2	171
14	2	172
15	2	173
16	2	174
17	3	275
18	3	276
19	3	277
20	3	278
\.


--
-- Data for Name: base_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_country (id, name, acronym, active) FROM stdin;
1	Cuba	CUB	t
\.


--
-- Data for Name: base_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_employee (id, first_name, last_name, identification, image, active, position_id, scientific_category_id) FROM stdin;
1	as	asda	98052208527	images/employee/aab89cf0-240c-438b-9ff1-b259e30753f1.jpg	t	1	1
2	ssss	saaa	96081524785		t	1	1
\.


--
-- Data for Name: base_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_entity (id, name, active) FROM stdin;
1	CUJAE	t
\.


--
-- Data for Name: base_infoemployee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_infoemployee (id, is_reserve, init_date_reserve, finish_date_reserve, image_reserve, spreadsheet_reserve, is_executive, init_date_executive, finish_date_executive, image_executive, spreadsheet_executive, employee_id) FROM stdin;
1	f	\N	\N			f	\N	\N			1
2	f	\N	\N			f	\N	\N			2
\.


--
-- Data for Name: base_logoentity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_logoentity (id, date, logo1, logo2) FROM stdin;
1	2023-12-08 19:24:51.576606-05	logo/images.jpeg	logo/images.jpeg
\.


--
-- Data for Name: base_position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_position (id, name, active) FROM stdin;
1	aaaa	t
\.


--
-- Data for Name: base_procedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_procedure (id, name, abbreviation, edition, revision, file, active, process_id) FROM stdin;
1	Name	01	00	00		t	1
\.


--
-- Data for Name: base_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_process (id, "order", name, abbreviation, edition, revision, file, active, classifier_id, responsible_id) FROM stdin;
1	0	as	P34	00	00		t	1	1
\.


--
-- Data for Name: base_processclassifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_processclassifier (id, name, active) FROM stdin;
1	ASD	t
\.


--
-- Data for Name: base_scientificcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_scientificcategory (id, name, prefix, active) FROM stdin;
1	Master	Msc	t
\.


--
-- Data for Name: complaints_complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints_complaint (id, number, created_date, reception_date, deadline, client, reason, status, process_id, way_of_reception_id) FROM stdin;
1	2311290001	2023-11-29 19:34:38.718488-05	2023-11-29	2023-12-01	asda	asdad	1	1	1
\.


--
-- Data for Name: complaints_complaintaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints_complaintaction (id, date, action, complaint_id) FROM stdin;
1	2023-11-30	asdad	1
\.


--
-- Data for Name: complaints_wayofreception; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complaints_wayofreception (id, name, active) FROM stdin;
1	As	t
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-11-29 19:09:23.952386-05			4	127.0.0.1	39	1
2	2023-11-29 19:09:48.266325-05	1	Master (Msc )	1	127.0.0.1	50	1
3	2023-11-29 19:29:04.29441-05			4	127.0.0.1	39	1
4	2023-11-29 19:29:35.244989-05	1	ASD	1	127.0.0.1	49	1
5	2023-11-29 19:30:20.694321-05	1	aaaa	1	127.0.0.1	48	1
6	2023-11-29 19:30:30.660689-05	1	Msc as asda	1	127.0.0.1	45	1
7	2023-11-29 19:31:01.465474-05	1	P34 as	1	127.0.0.1	51	1
8	2023-11-29 19:31:37.805198-05	1	P34.01 Name	1	127.0.0.1	52	1
9	2023-11-29 19:32:58.055851-05	1	CUJAE	1	127.0.0.1	46	1
10	2023-11-29 19:33:49.868733-05	1	(2311290001) asas	1	127.0.0.1	59	1
11	2023-11-29 19:34:31.940708-05	1	As	1	127.0.0.1	60	1
12	2023-11-29 19:34:38.897393-05	1	Complaint object (1)	1	127.0.0.1	61	1
13	2023-11-29 19:35:44.982135-05	1	Complaint object (1)	2	127.0.0.1	61	1
14	2023-11-29 19:37:47.265557-05			4	127.0.0.1	39	1
15	2023-11-29 19:39:48.910278-05	1	Msc as asda	2	127.0.0.1	45	1
16	2023-11-29 19:40:26.462067-05	1	Msc as asda	2	127.0.0.1	45	1
17	2023-11-29 19:40:54.441378-05	2	Msc ssss saaa	1	127.0.0.1	45	1
18	2023-12-04 18:57:46.548155-05			4	127.0.0.1	39	1
19	2023-12-04 18:57:55.72946-05	1	aaaaaaaa	1	127.0.0.1	2	1
20	2023-12-04 18:58:07.522548-05	1	bbbbbbbbbbbb	1	127.0.0.1	13	1
21	2023-12-04 18:58:14.889502-05	1	ccccccccccccccc	1	127.0.0.1	6	1
22	2023-12-04 19:02:58.713132-05	1	ddddddd	1	127.0.0.1	12	1
23	2023-12-04 19:05:28.890422-05	1	Video	1	127.0.0.1	11	1
24	2023-12-04 19:05:46.154309-05	1	Cuba	1	127.0.0.1	44	1
25	2023-12-04 19:09:38.532795-05	2	asd	1	127.0.0.1	2	1
26	2023-12-04 19:09:47.656917-05	1	as	1	127.0.0.1	27	1
27	2023-12-04 19:10:54.876039-05	1	Afectaciones object (1)	1	127.0.0.1	33	1
28	2023-12-04 19:11:18.301501-05	2	Afectaciones object (2)	1	127.0.0.1	33	1
29	2023-12-04 19:14:24.07627-05	3	Afectaciones object (3)	1	127.0.0.1	33	1
30	2023-12-04 19:26:07.017783-05	1	auditoria_interna object (1)	1	127.0.0.1	30	1
31	2023-12-04 19:28:16.587478-05	1	zzzzz	1	127.0.0.1	31	1
32	2023-12-04 19:29:55.500455-05	1	ActividadPlan object (1)	1	127.0.0.1	35	1
37	2023-12-06 14:26:13.777333-05			4	127.0.0.1	39	1
38	2023-12-06 14:28:50.739814-05	4	Afectaciones object (4)	1	127.0.0.1	33	1
39	2023-12-06 14:29:06.039713-05	4	Afectaciones object (4)	2	127.0.0.1	33	1
40	2023-12-06 14:39:03.361586-05	1	as	2	127.0.0.1	27	1
41	2023-12-06 14:57:14.033959-05	3	Afectaciones object (3)	2	127.0.0.1	33	1
42	2023-12-06 15:00:08.863527-05	1	1	1	127.0.0.1	66	1
43	2023-12-06 15:00:17.539632-05	1	b	1	127.0.0.1	63	1
44	2023-12-06 15:00:23.408233-05	1	c	1	127.0.0.1	67	1
45	2023-12-06 15:00:38.413214-05	1	0.0.0	1	127.0.0.1	64	1
46	2023-12-06 15:00:45.68254-05	1	f	1	127.0.0.1	65	1
47	2023-12-06 15:08:11.410582-05	2	Afectaciones object (2)	2	127.0.0.1	33	1
48	2023-12-06 15:08:43.833418-05	1	Afectaciones object (1)	2	127.0.0.1	33	1
49	2023-12-06 15:10:38.926348-05	5	Afectaciones object (5)	1	127.0.0.1	33	1
50	2023-12-06 15:11:34.227607-05	5	Afectaciones object (5)	2	127.0.0.1	33	1
51	2023-12-06 15:16:41.647854-05	6	Afectaciones object (6)	1	127.0.0.1	33	1
52	2023-12-06 15:18:23.137814-05	6	Afectaciones object (6)	2	127.0.0.1	33	1
53	2023-12-06 16:09:57.982202-05	2	aaaa	1	127.0.0.1	27	1
54	2023-12-06 16:28:18.690194-05	7	Afectaciones object (7)	1	127.0.0.1	33	1
55	2023-12-06 16:29:57.404-05	8	Afectaciones object (8)	1	127.0.0.1	33	1
56	2023-12-08 16:13:58.586364-05	1	Administrador	1	127.0.0.1	38	1
57	2023-12-08 16:14:58.986447-05	2	abelc	1	127.0.0.1	39	1
58	2023-12-08 16:15:05.548106-05	fee66f80-4d2b-47ed-a474-443241304d5f	abelc	0	127.0.0.1	42	1
59	2023-12-08 16:16:17.341414-05			5	127.0.0.1	39	1
60	2023-12-08 16:16:29.123511-05			4	127.0.0.1	39	2
61	2023-12-08 16:20:53.232503-05			5	127.0.0.1	39	2
62	2023-12-08 16:20:58.986086-05			4	127.0.0.1	39	1
63	2023-12-08 16:21:08.256821-05			5	127.0.0.1	39	1
64	2023-12-08 16:21:36.380492-05			4	127.0.0.1	39	2
65	2023-12-08 16:22:27.233271-05			5	127.0.0.1	39	2
66	2023-12-08 16:22:31.011094-05			4	127.0.0.1	39	1
67	2023-12-08 16:23:24.734475-05			5	127.0.0.1	39	1
68	2023-12-08 16:23:37.071153-05			4	127.0.0.1	39	2
69	2023-12-08 16:38:45.751918-05			5	127.0.0.1	39	2
70	2023-12-08 16:38:50.710131-05			4	127.0.0.1	39	1
71	2023-12-08 17:00:22.473332-05	2	Prop Ind	1	127.0.0.1	38	1
72	2023-12-08 17:01:50.505843-05	3	manolo	1	127.0.0.1	39	1
73	2023-12-08 17:01:54.900945-05			5	127.0.0.1	39	1
74	2023-12-08 17:02:10.388064-05			4	127.0.0.1	39	3
75	2023-12-08 18:20:05.842156-05			5	127.0.0.1	39	3
76	2023-12-08 18:20:22.406378-05			4	127.0.0.1	39	3
77	2023-12-08 19:20:01.925043-05			5	127.0.0.1	39	3
78	2023-12-08 19:20:07.075035-05			4	127.0.0.1	39	1
79	2023-12-08 19:24:51.607856-05	1	LogoEntity object (1)	1	127.0.0.1	47	1
80	2023-12-09 10:59:16.240229-05			4	127.0.0.1	39	1
81	2023-12-11 13:14:13.889076-05			4	127.0.0.1	39	2
82	2023-12-11 13:14:29.008265-05			5	127.0.0.1	39	2
83	2023-12-11 13:14:33.186802-05			4	127.0.0.1	39	1
84	2023-12-11 13:15:31.810991-05			5	127.0.0.1	39	1
85	2023-12-11 13:16:08.335325-05			4	127.0.0.1	39	3
86	2023-12-11 13:42:02.994533-05			5	127.0.0.1	39	3
87	2023-12-11 13:42:08.522593-05			4	127.0.0.1	39	1
88	2023-12-11 14:02:26.979668-05	1	asdsa	1	127.0.0.1	25	1
89	2023-12-11 14:02:34.448031-05	1	asdsa	0	127.0.0.1	25	1
90	2023-12-11 14:03:09.548573-05	1	asdsa	2	127.0.0.1	25	1
91	2023-12-11 14:10:08.128457-05	1	asdsa	0	127.0.0.1	25	1
92	2023-12-11 14:28:56.708899-05	2	Pendientes	1	127.0.0.1	6	1
93	2023-12-11 14:29:14.591802-05	2	Pendiente	2	127.0.0.1	6	1
94	2023-12-11 14:29:16.310186-05	2	Pendiente	2	127.0.0.1	6	1
95	2023-12-11 14:29:18.542432-05	2	Pendiente	2	127.0.0.1	6	1
101	2023-12-11 14:37:13.581161-05	6	1 asda	1	127.0.0.1	34	1
102	2023-12-11 14:37:25.459834-05	6	1 asda	0	127.0.0.1	34	1
103	2023-12-11 14:37:35.565176-05	6	1 asda	2	127.0.0.1	34	1
104	2023-12-11 14:37:39.693603-05	6	1 asda	0	127.0.0.1	34	1
105	2023-12-11 14:44:23.532905-05	1	Se salvó la base de datos 20231211_SISGEPO_dsX.sql	11	127.0.0.1	39	1
106	2023-12-11 14:45:06.888902-05	1	asdsa	3	127.0.0.1	25	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	SISGDDO	accion_indicador_objetivo
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
26	SISGDDO	indicador_objetivos
27	SISGDDO	incidencia
28	SISGDDO	entrada_proyecto
29	SISGDDO	descripcion
30	SISGDDO	auditoria_interna
31	SISGDDO	auditoria_externa
32	SISGDDO	agruparroles
33	SISGDDO	afectaciones
34	SISGDDO	acuerdo
35	SISGDDO	actividadplan
36	admin	logentry
37	auth	permission
38	auth	group
39	auth	user
40	contenttypes	contenttype
41	sessions	session
42	ProyectoBaseApp	userapp
43	notifications	notification
44	base	country
45	base	employee
46	base	entity
47	base	logoentity
48	base	position
49	base	processclassifier
50	base	scientificcategory
51	base	process
52	base	procedure
53	base	infoemployee
54	effectiveness	effectiveness
55	effectiveness	effectivenesssemester
56	effectiveness	indicator
57	effectiveness	indicatormeasurer
58	effectiveness	semestermeasurer
59	licenses	license
60	complaints	wayofreception
61	complaints	complaint
62	complaints	complaintaction
63	iproperty	drawingclassification
64	iproperty	figurativeelementclassification
65	iproperty	patentclassification
66	iproperty	productclassification
67	iproperty	typelegaldocument
68	iproperty	industrialproperty
69	SISGDDO	configuracion
70	SISGDDO	estado_proyecto_dgca
71	SISGDDO	etapa_proyecto
72	SISGDDO	evaluacion
73	SISGDDO	periodo
74	SISGDDO	prioridad
75	SISGDDO	registro_aprobacion
76	SISGDDO	evaluacion_trimestral
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-11-29 19:07:25.268031-05
2	contenttypes	0002_remove_content_type_name	2023-11-29 19:07:25.280025-05
3	auth	0001_initial	2023-11-29 19:07:25.502914-05
4	auth	0002_alter_permission_name_max_length	2023-11-29 19:07:25.512909-05
5	auth	0003_alter_user_email_max_length	2023-11-29 19:07:25.521903-05
6	auth	0004_alter_user_username_opts	2023-11-29 19:07:25.529898-05
7	auth	0005_alter_user_last_login_null	2023-11-29 19:07:25.538893-05
8	auth	0006_require_contenttypes_0002	2023-11-29 19:07:25.540892-05
9	auth	0007_alter_validators_add_error_messages	2023-11-29 19:07:25.549886-05
10	auth	0008_alter_user_username_max_length	2023-11-29 19:07:25.571872-05
11	auth	0009_alter_user_last_name_max_length	2023-11-29 19:07:25.579867-05
12	auth	0010_alter_group_name_max_length	2023-11-29 19:07:25.589862-05
13	auth	0011_update_proxy_permissions	2023-11-29 19:07:25.597856-05
14	auth	0012_alter_user_first_name_max_length	2023-11-29 19:07:25.60785-05
15	ProyectoBaseApp	0001_initial	2023-11-29 19:07:25.630835-05
16	base	0001_initial	2023-11-29 19:07:25.852764-05
17	auth	0013_agruparroles	2023-11-29 19:07:25.912726-05
18	auth	0014_alter_agruparroles_id	2023-11-29 19:07:25.927717-05
19	auth	0015_delete_agruparroles	2023-11-29 19:07:25.93771-05
20	SISGDDO	0001_initial	2023-11-29 19:07:28.04441-05
21	admin	0001_initial	2023-11-29 19:07:28.123362-05
22	admin	0002_logentry_remove_auto_add	2023-11-29 19:07:28.136355-05
23	admin	0003_logentry_add_action_flag_choices	2023-11-29 19:07:28.148348-05
24	captcha	0001_initial	2023-11-29 19:07:28.224302-05
25	captcha	0002_alter_captchastore_id	2023-11-29 19:07:28.231297-05
26	captcha	0003_delete_captchastore	2023-11-29 19:07:28.238293-05
27	complaints	0001_initial	2023-11-29 19:07:28.417181-05
28	effectiveness	0001_initial	2023-11-29 19:07:28.659032-05
29	iproperty	0001_initial	2023-11-29 19:07:28.976836-05
30	licenses	0001_initial	2023-11-29 19:07:29.079773-05
31	notifications	0001_initial	2023-11-29 19:07:29.146731-05
32	notifications	0002_auto_20150224_1134	2023-11-29 19:07:29.176714-05
33	notifications	0003_notification_data	2023-11-29 19:07:29.190705-05
34	notifications	0004_auto_20150826_1508	2023-11-29 19:07:29.207694-05
35	notifications	0005_auto_20160504_1520	2023-11-29 19:07:29.223686-05
36	notifications	0006_indexes	2023-11-29 19:07:29.298638-05
37	notifications	0007_add_timestamp_index	2023-11-29 19:07:29.318625-05
38	notifications	0008_index_together_recipient_unread	2023-11-29 19:07:29.337614-05
39	sessions	0001_initial	2023-11-29 19:07:29.371593-05
40	ProyectoBaseApp	0002_userapp_notificado	2023-12-04 18:57:19.448993-05
41	ProyectoBaseApp	0003_remove_userapp_notificado	2023-12-04 18:57:19.475668-05
42	ProyectoBaseApp	0004_userapp_notificado	2023-12-04 18:57:19.490028-05
43	SISGDDO	0002_alter_cambiarlogotipo_fecha_cambio_alter_sosi_fecha	2023-12-08 15:59:54.53891-05
44	complaints	0002_alter_complaint_status	2023-12-08 15:59:54.621365-05
45	effectiveness	0002_indicator_process	2023-12-08 15:59:54.722211-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
pw2ajeazcqvqv9gamqta3r87mazm7s0o	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1rB1RC:ykw2dLxBVozSPLHCyHYEiwxtQeEsuVffL4d1OJyTDo4	2023-12-06 20:36:18.386436-05
mo0ano2ele2dx13w2h3wh963ofstjx9c	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1r8Ue1:fN1bMFhm07NP5GpCP2ZtTp3nRIrD3_U9Gz-6pmBgYU0	2023-11-29 21:11:05.097398-05
4n81rvalhfhs9h2ww3rn9tnow28cfl23	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1rAJec:NRKrPFASB1NiHC5eRlj2qHmTJZ92Pr_4Pe9RSchcV2s	2023-12-04 21:51:14.627196-05
bbddzidxdky268p8z4h31ak4j23znbnp	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1rBlaW:KYBQq0xuTy3oCpT6ibpgD3n-00sqBUxlJIBQFJnVyLo	2023-12-08 21:53:00.536208-05
wm8us4dq9atevl1m0e9rkj6sxf7fp3iq	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1r8V6z:uwjYg9vxL2gF7jKbENQ0wkK22Px7CsQH9cvg4HGHgQg	2023-11-29 21:41:01.941574-05
7x9qg8ztkjedn5axqg2l16q41281pk44	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1rCmDT:mhFAReWiAHgie6PraeMEvQb6qkSpx7ZWmqyGVUUK0gk	2023-12-11 16:45:23.035582-05
jy20fzs5qsbr6a1hra4ei73j9w5d3upj	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1r8V2d:MhB9Q88D22iqoyGbQvA5Ao23WPVM3TFlMhajXob1fpQ	2023-11-29 21:36:31.471519-05
0huiva9u8ax6oqx9vehka1fbri7e9lw6	.eJxVjMsOwiAQRf-FtSFAgWlduvcbyMwwlaqBpI-V8d-1SRe6veec-1IJt7WkbZE5TVmdlVWn342QH1J3kO9Yb01zq-s8kd4VfdBFX1uW5-Vw_w4KLuVbh-wQMjoP3uDAZA1x6EcPJg9dJBSiIZLp-46sM8zibWTgYCEIwDiq9wfsdzgo:1rC00u:LPT4EnJVzAKp4n6YiyGjZuKUL1b9PD6WmCQWePYIJXs	2023-12-09 13:17:12.85525-05
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

COPY public.effectiveness_indicator (id, name, active, process_id) FROM stdin;
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

COPY public.iproperty_drawingclassification (id, name, active) FROM stdin;
1	b	t
\.


--
-- Data for Name: iproperty_figurativeelementclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_figurativeelementclassification (id, number, name, active) FROM stdin;
1	0.0.0	e	t
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

COPY public.iproperty_patentclassification (id, name, active) FROM stdin;
1	f	t
\.


--
-- Data for Name: iproperty_productclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_productclassification (id, number, name, active) FROM stdin;
1	1	a	t
\.


--
-- Data for Name: iproperty_typelegaldocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_typelegaldocument (id, name, active) FROM stdin;
1	c	t
\.


--
-- Data for Name: licenses_license; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licenses_license (id, number, name, created_date, grant_date, expiration_date, status, observation, file, active, associated_process_id, entity_id, process_id, responsible_id) FROM stdin;
1	2311290001	asas	2023-11-29 19:33:49.860738-05	2023-11-29	2023-11-30	1	saa		t	\N	1	1	1
\.


--
-- Data for Name: notifications_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications_notification (id, level, unread, actor_object_id, verb, description, target_object_id, action_object_object_id, "timestamp", public, action_object_content_type_id, actor_content_type_id, recipient_id, target_content_type_id, deleted, emailed, data) FROM stdin;
5	warning	f	1	Nuevo registro de área: asd	\N	\N	\N	2023-12-04 19:09:38.534794-05	t	\N	39	1	\N	f	f	\N
4	info	f	1	Nueva Fuente de financiamiento: ddddddd	\N	\N	\N	2023-12-04 19:02:58.716434-05	t	\N	39	1	\N	f	f	\N
3	info	f	1	Nuevo estado de Acuerdo CD: <class 'SISGDDO.models.estado_acuerdo'>	\N	\N	\N	2023-12-04 18:58:14.891501-05	t	\N	39	1	\N	f	f	\N
2	info	f	1	Nueva Línea temática: bbbbbbbbbbbb	\N	\N	\N	2023-12-04 18:58:07.525558-05	t	\N	39	1	\N	f	f	\N
1	warning	f	1	Nuevo registro de área: aaaaaaaa	\N	\N	\N	2023-12-04 18:57:55.733457-05	t	\N	39	1	\N	f	f	\N
6	success	t	1	¡Bienvenido a SISGEPO!	\N	\N	\N	2023-12-08 16:14:58.986447-05	t	\N	39	2	\N	f	f	\N
7	success	t	1	¡Bienvenido a SISGEPO!	\N	\N	\N	2023-12-08 17:01:50.505843-05	t	\N	39	3	\N	f	f	\N
8	info	t	1	Actualización de Premio: asdsa	\N	\N	\N	2023-12-11 14:03:09.548573-05	t	\N	39	1	\N	f	f	\N
9	info	t	1	Nuevo estado de Acuerdo CD: <class 'SISGDDO.models.estado_acuerdo'>	\N	\N	\N	2023-12-11 14:28:56.708899-05	t	\N	39	1	\N	f	f	\N
10	warning	t	1	Se salvó la base de datos 20231211_SISGEPO_dsX.sql	\N	\N	\N	2023-12-11 14:44:23.538702-05	t	\N	39	1	\N	f	f	\N
\.


--
-- Name: SISGDDO_accion_indicador_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_accion_indicador_objetivo_id_seq"', 4, true);


--
-- Name: SISGDDO_actividadplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_id_seq"', 1, true);


--
-- Name: SISGDDO_actividadplan_participantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_participantes_id_seq"', 2, true);


--
-- Name: SISGDDO_actividadplan_preside_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_preside_id_seq"', 1, true);


--
-- Name: SISGDDO_acuerdo_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acuerdo_employee_id_seq"', 3, true);


--
-- Name: SISGDDO_acuerdo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acuerdo_id_seq"', 6, true);


--
-- Name: SISGDDO_afectaciones_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_afectaciones_numero_seq"', 8, true);


--
-- Name: SISGDDO_agruparroles_permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_agruparroles_permisos_id_seq"', 1, false);


--
-- Name: SISGDDO_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_area_id_seq"', 2, true);


--
-- Name: SISGDDO_auditoria_externa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_externa_id_seq"', 1, true);


--
-- Name: SISGDDO_auditoria_externa_proceso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_externa_proceso_id_seq"', 1, true);


--
-- Name: SISGDDO_auditoria_interna_equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_interna_equipo_id_seq"', 2, true);


--
-- Name: SISGDDO_auditoria_interna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_auditoria_interna_id_seq"', 1, true);


--
-- Name: SISGDDO_cambiarlogotipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_cambiarlogotipo_id_seq"', 1, false);


--
-- Name: SISGDDO_consecutivo_formato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_consecutivo_formato_id_seq"', 1, false);


--
-- Name: SISGDDO_consecutivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_consecutivo_id_seq"', 1, false);


--
-- Name: SISGDDO_descripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_descripcion_id_seq"', 1, false);


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

SELECT pg_catalog.setval('public."SISGDDO_estado_acuerdo_id_seq"', 2, true);


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
-- Name: SISGDDO_estado_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_proyecto_id_seq"', 1, false);


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

SELECT pg_catalog.setval('public."SISGDDO_incidencia_id_seq"', 2, true);


--
-- Name: SISGDDO_indicador_objetivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_indicador_objetivos_id_seq"', 1, false);


--
-- Name: SISGDDO_linea_tematica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_linea_tematica_id_seq"', 1, true);


--
-- Name: SISGDDO_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_objetivo_id_seq"', 1, false);


--
-- Name: SISGDDO_permisos_personalizados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_permisos_personalizados_id_seq"', 1, false);


--
-- Name: SISGDDO_premio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_premio_id_seq"', 1, true);


--
-- Name: SISGDDO_proyecto_formato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_proyecto_formato_id_seq"', 1, false);


--
-- Name: SISGDDO_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_proyecto_id_seq"', 1, false);


--
-- Name: SISGDDO_sosi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_sosi_id_seq"', 1, false);


--
-- Name: SISGDDO_tipo_codigo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tipo_codigo_id_seq"', 1, false);


--
-- Name: SISGDDO_tipo_de_obra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tipo_de_obra_id_seq"', 1, false);


--
-- Name: SISGDDO_tipo_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_tipo_proyecto_id_seq"', 1, false);


--
-- Name: SISGDDO_trabajador_consecutivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_trabajador_consecutivo_id_seq"', 1, false);


--
-- Name: SISGDDO_trabajador_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_trabajador_proyecto_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 20, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 310, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 20, true);


--
-- Name: base_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_country_id_seq', 1, true);


--
-- Name: base_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_employee_id_seq', 2, true);


--
-- Name: base_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_entity_id_seq', 1, true);


--
-- Name: base_infoemployee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_infoemployee_id_seq', 2, true);


--
-- Name: base_logoentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_logoentity_id_seq', 1, true);


--
-- Name: base_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_position_id_seq', 1, true);


--
-- Name: base_procedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_procedure_id_seq', 1, true);


--
-- Name: base_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_process_id_seq', 1, true);


--
-- Name: base_processclassifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_processclassifier_id_seq', 1, true);


--
-- Name: base_scientificcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_scientificcategory_id_seq', 1, true);


--
-- Name: complaints_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_complaint_id_seq', 1, true);


--
-- Name: complaints_complaintaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_complaintaction_id_seq', 1, true);


--
-- Name: complaints_wayofreception_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.complaints_wayofreception_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 106, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 76, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);


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

SELECT pg_catalog.setval('public.iproperty_drawingclassification_id_seq', 1, true);


--
-- Name: iproperty_figurativeelementclassification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_figurativeelementclassification_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.iproperty_patentclassification_id_seq', 1, true);


--
-- Name: iproperty_productclassification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_productclassification_id_seq', 1, true);


--
-- Name: iproperty_typelegaldocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iproperty_typelegaldocument_id_seq', 1, true);


--
-- Name: licenses_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licenses_license_id_seq', 1, true);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 10, true);


--
-- Name: ProyectoBaseApp_userapp ProyectoBaseApp_userapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProyectoBaseApp_userapp"
    ADD CONSTRAINT "ProyectoBaseApp_userapp_pkey" PRIMARY KEY (user_ptr_id);


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
-- Name: SISGDDO_actividadplan_preside SISGDDO_actividadplan_pr_actividadplan_id_employe_008eafdd_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_preside"
    ADD CONSTRAINT "SISGDDO_actividadplan_pr_actividadplan_id_employe_008eafdd_uniq" UNIQUE (actividadplan_id, employee_id);


--
-- Name: SISGDDO_actividadplan_preside SISGDDO_actividadplan_preside_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_preside"
    ADD CONSTRAINT "SISGDDO_actividadplan_preside_pkey" PRIMARY KEY (id);


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
-- Name: SISGDDO_agruparroles_permisos SISGDDO_agruparroles_per_agruparroles_id_permissi_2653402f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos"
    ADD CONSTRAINT "SISGDDO_agruparroles_per_agruparroles_id_permissi_2653402f_uniq" UNIQUE (agruparroles_id, permission_id);


--
-- Name: SISGDDO_agruparroles_permisos SISGDDO_agruparroles_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos"
    ADD CONSTRAINT "SISGDDO_agruparroles_permisos_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_agruparroles SISGDDO_agruparroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_agruparroles"
    ADD CONSTRAINT "SISGDDO_agruparroles_pkey" PRIMARY KEY (id);


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
-- Name: SISGDDO_descripcion SISGDDO_descripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_descripcion"
    ADD CONSTRAINT "SISGDDO_descripcion_pkey" PRIMARY KEY (id);


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
-- Name: SISGDDO_indicador_objetivos SISGDDO_indicador_objetivos_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_indicador_objetivos"
    ADD CONSTRAINT "SISGDDO_indicador_objetivos_no_key" UNIQUE (no);


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
-- Name: SISGDDO_premio SISGDDO_premio_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_premio"
    ADD CONSTRAINT "SISGDDO_premio_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_premio SISGDDO_premio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_premio"
    ADD CONSTRAINT "SISGDDO_premio_pkey" PRIMARY KEY (id);


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
-- Name: base_employee base_employee_identification_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_employee
    ADD CONSTRAINT base_employee_identification_key UNIQUE (identification);


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
-- Name: base_position base_position_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_position
    ADD CONSTRAINT base_position_name_key UNIQUE (name);


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
-- Name: base_processclassifier base_processclassifier_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_processclassifier
    ADD CONSTRAINT base_processclassifier_name_key UNIQUE (name);


--
-- Name: base_processclassifier base_processclassifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_processclassifier
    ADD CONSTRAINT base_processclassifier_pkey PRIMARY KEY (id);


--
-- Name: base_scientificcategory base_scientificcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_scientificcategory
    ADD CONSTRAINT base_scientificcategory_pkey PRIMARY KEY (id);


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
-- Name: SISGDDO_actividadplan_preside_actividadplan_id_ab13840c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_actividadplan_preside_actividadplan_id_ab13840c" ON public."SISGDDO_actividadplan_preside" USING btree (actividadplan_id);


--
-- Name: SISGDDO_actividadplan_preside_employee_id_bf830be8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_actividadplan_preside_employee_id_bf830be8" ON public."SISGDDO_actividadplan_preside" USING btree (employee_id);


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
-- Name: SISGDDO_afectaciones_formato_id_478fff44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_afectaciones_formato_id_478fff44" ON public."SISGDDO_afectaciones" USING btree (formato_id);


--
-- Name: SISGDDO_afectaciones_propuesto_id_79f10bb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_afectaciones_propuesto_id_79f10bb1" ON public."SISGDDO_afectaciones" USING btree (propuesto_id);


--
-- Name: SISGDDO_afectaciones_responsable_id_44e3f4f1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_afectaciones_responsable_id_44e3f4f1" ON public."SISGDDO_afectaciones" USING btree (responsable_id);


--
-- Name: SISGDDO_agruparroles_permisos_agruparroles_id_3ec66735; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_agruparroles_permisos_agruparroles_id_3ec66735" ON public."SISGDDO_agruparroles_permisos" USING btree (agruparroles_id);


--
-- Name: SISGDDO_agruparroles_permisos_permission_id_0b9aa5f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_agruparroles_permisos_permission_id_0b9aa5f4" ON public."SISGDDO_agruparroles_permisos" USING btree (permission_id);


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
-- Name: SISGDDO_auditoria_interna_responsable_id_84e7e919; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_auditoria_interna_responsable_id_84e7e919" ON public."SISGDDO_auditoria_interna" USING btree (responsable_id);


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
-- Name: SISGDDO_descripcion_accion_id_52f1d318; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_descripcion_accion_id_52f1d318" ON public."SISGDDO_descripcion" USING btree (accion_id);


--
-- Name: SISGDDO_descripcion_area_id_bfa1be01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_descripcion_area_id_bfa1be01" ON public."SISGDDO_descripcion" USING btree (area_id);


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
-- Name: SISGDDO_estado_proyecto_nombre_99d390cd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_proyecto_nombre_99d390cd_like" ON public."SISGDDO_estado_proyecto" USING btree (nombre varchar_pattern_ops);


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
-- Name: SISGDDO_incidencia_proceso_id_a0b6cbe7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_incidencia_proceso_id_a0b6cbe7" ON public."SISGDDO_incidencia" USING btree (proceso_id);


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
-- Name: SISGDDO_premio_nombre_b0593919_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_premio_nombre_b0593919_like" ON public."SISGDDO_premio" USING btree (nombre varchar_pattern_ops);


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
-- Name: base_employee_identification_7db91c93_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_employee_identification_7db91c93_like ON public.base_employee USING btree (identification varchar_pattern_ops);


--
-- Name: base_employee_position_id_79f70088; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_employee_position_id_79f70088 ON public.base_employee USING btree (position_id);


--
-- Name: base_employee_scientific_category_id_011fa789; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_employee_scientific_category_id_011fa789 ON public.base_employee USING btree (scientific_category_id);


--
-- Name: base_position_name_1bda98f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_position_name_1bda98f7_like ON public.base_position USING btree (name varchar_pattern_ops);


--
-- Name: base_procedure_name_b841c895_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_procedure_name_b841c895_like ON public.base_procedure USING btree (name varchar_pattern_ops);


--
-- Name: base_procedure_process_id_14cdad40; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_procedure_process_id_14cdad40 ON public.base_procedure USING btree (process_id);


--
-- Name: base_process_classifier_id_07340843; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_process_classifier_id_07340843 ON public.base_process USING btree (classifier_id);


--
-- Name: base_process_name_681a7114_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_process_name_681a7114_like ON public.base_process USING btree (name varchar_pattern_ops);


--
-- Name: base_process_responsible_id_344e4108; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_process_responsible_id_344e4108 ON public.base_process USING btree (responsible_id);


--
-- Name: base_processclassifier_name_edb1145f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_processclassifier_name_edb1145f_like ON public.base_processclassifier USING btree (name varchar_pattern_ops);


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
-- Name: effectiveness_indicator_process_id_7b2552ec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX effectiveness_indicator_process_id_7b2552ec ON public.effectiveness_indicator USING btree (process_id);


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
-- Name: SISGDDO_accion_indicador_objetivo SISGDDO_accion_indic_indicador_id_fb30c80e_fk_SISGDDO_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_accion_indicador_objetivo"
    ADD CONSTRAINT "SISGDDO_accion_indic_indicador_id_fb30c80e_fk_SISGDDO_i" FOREIGN KEY (indicador_id) REFERENCES public."SISGDDO_indicador_objetivos"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_actividadplan_preside SISGDDO_actividadpla_actividadplan_id_ab13840c_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_preside"
    ADD CONSTRAINT "SISGDDO_actividadpla_actividadplan_id_ab13840c_fk_SISGDDO_a" FOREIGN KEY (actividadplan_id) REFERENCES public."SISGDDO_actividadplan"(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: SISGDDO_actividadplan_preside SISGDDO_actividadpla_employee_id_bf830be8_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_actividadplan_preside"
    ADD CONSTRAINT "SISGDDO_actividadpla_employee_id_bf830be8_fk_base_empl" FOREIGN KEY (employee_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: SISGDDO_afectaciones SISGDDO_afectaciones_formato_id_478fff44_fk_SISGDDO_formato_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_afectaciones"
    ADD CONSTRAINT "SISGDDO_afectaciones_formato_id_478fff44_fk_SISGDDO_formato_id" FOREIGN KEY (formato_id) REFERENCES public."SISGDDO_formato"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_afectaciones SISGDDO_afectaciones_propuesto_id_79f10bb1_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_afectaciones"
    ADD CONSTRAINT "SISGDDO_afectaciones_propuesto_id_79f10bb1_fk_SISGDDO_area_id" FOREIGN KEY (propuesto_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_afectaciones SISGDDO_afectaciones_responsable_id_44e3f4f1_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_afectaciones"
    ADD CONSTRAINT "SISGDDO_afectaciones_responsable_id_44e3f4f1_fk_SISGDDO_area_id" FOREIGN KEY (responsable_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_agruparroles_permisos SISGDDO_agruparroles_agruparroles_id_3ec66735_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos"
    ADD CONSTRAINT "SISGDDO_agruparroles_agruparroles_id_3ec66735_fk_SISGDDO_a" FOREIGN KEY (agruparroles_id) REFERENCES public."SISGDDO_agruparroles"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_agruparroles_permisos SISGDDO_agruparroles_permission_id_0b9aa5f4_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_agruparroles_permisos"
    ADD CONSTRAINT "SISGDDO_agruparroles_permission_id_0b9aa5f4_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: SISGDDO_auditoria_interna SISGDDO_auditoria_in_responsable_id_84e7e919_fk_base_empl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_auditoria_interna"
    ADD CONSTRAINT "SISGDDO_auditoria_in_responsable_id_84e7e919_fk_base_empl" FOREIGN KEY (responsable_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: SISGDDO_descripcion SISGDDO_descripcion_accion_id_52f1d318_fk_SISGDDO_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_descripcion"
    ADD CONSTRAINT "SISGDDO_descripcion_accion_id_52f1d318_fk_SISGDDO_a" FOREIGN KEY (accion_id) REFERENCES public."SISGDDO_accion_indicador_objetivo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_descripcion SISGDDO_descripcion_area_id_bfa1be01_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_descripcion"
    ADD CONSTRAINT "SISGDDO_descripcion_area_id_bfa1be01_fk_SISGDDO_area_id" FOREIGN KEY (area_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: SISGDDO_incidencia SISGDDO_incidencia_ejecutante_id_acf271a3_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencia"
    ADD CONSTRAINT "SISGDDO_incidencia_ejecutante_id_acf271a3_fk_SISGDDO_area_id" FOREIGN KEY (ejecutante_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_incidencia SISGDDO_incidencia_proceso_id_a0b6cbe7_fk_base_process_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencia"
    ADD CONSTRAINT "SISGDDO_incidencia_proceso_id_a0b6cbe7_fk_base_process_id" FOREIGN KEY (proceso_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SISGDDO_incidencia SISGDDO_incidencia_trabajador_id_88ef29b2_fk_SISGDDO_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_incidencia"
    ADD CONSTRAINT "SISGDDO_incidencia_trabajador_id_88ef29b2_fk_SISGDDO_area_id" FOREIGN KEY (trabajador_id) REFERENCES public."SISGDDO_area"(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: base_employee base_employee_scientific_category__011fa789_fk_base_scie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_employee
    ADD CONSTRAINT base_employee_scientific_category__011fa789_fk_base_scie FOREIGN KEY (scientific_category_id) REFERENCES public.base_scientificcategory(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: base_process base_process_classifier_id_07340843_fk_base_proc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_process
    ADD CONSTRAINT base_process_classifier_id_07340843_fk_base_proc FOREIGN KEY (classifier_id) REFERENCES public.base_processclassifier(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: effectiveness_indicator effectiveness_indicator_process_id_7b2552ec_fk_base_process_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.effectiveness_indicator
    ADD CONSTRAINT effectiveness_indicator_process_id_7b2552ec_fk_base_process_id FOREIGN KEY (process_id) REFERENCES public.base_process(id) DEFERRABLE INITIALLY DEFERRED;


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

