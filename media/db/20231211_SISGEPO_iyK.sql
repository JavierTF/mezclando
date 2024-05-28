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
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_c_rol_id_1daa1fc0_fk_base_posi";
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_c_employee_id_53d7c9a3_fk_base_empl";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_especialista_id_24d6da69_fk_base_employee_id";
ALTER TABLE ONLY public."SISGDDO_premio" DROP CONSTRAINT "SISGDDO_premio_entidad_id_32643785_fk_base_entity_id";
ALTER TABLE ONLY public."SISGDDO_indicador_objetivos" DROP CONSTRAINT "SISGDDO_indicador_ob_objetivo_id_c1883a69_fk_SISGDDO_o";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_trabajador_id_88ef29b2_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_proceso_id_a0b6cbe7_fk_base_process_id";
ALTER TABLE ONLY public."SISGDDO_incidencia" DROP CONSTRAINT "SISGDDO_incidencia_ejecutante_id_acf271a3_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral" DROP CONSTRAINT "SISGDDO_evaluacion_t_periodo_id_6aba39a9_fk_SISGDDO_p";
ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral" DROP CONSTRAINT "SISGDDO_evaluacion_t_objetivo_id_b0eea8d6_fk_SISGDDO_o";
ALTER TABLE ONLY public."SISGDDO_evaluacion_trimestral" DROP CONSTRAINT "SISGDDO_evaluacion_t_evaluacion_id_644fc73e_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_estado_proyecto" DROP CONSTRAINT "SISGDDO_estado_proye_etapa_id_434b07a4_fk_SISGDDO_e";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_descripcion_area_id_bfa1be01_fk_SISGDDO_area_id";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_descripcion_accion_id_52f1d318_fk_SISGDDO_a";
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
DROP INDEX public."SISGDDO_trabajador_consecutivo_rol_id_1daa1fc0";
DROP INDEX public."SISGDDO_trabajador_consecutivo_employee_id_53d7c9a3";
DROP INDEX public."SISGDDO_tipo_proyecto_nombre_6c46c070_like";
DROP INDEX public."SISGDDO_tipo_de_obra_nombre_c085e828_like";
DROP INDEX public."SISGDDO_tipo_codigo_siglas_5bd8c683_like";
DROP INDEX public."SISGDDO_tipo_codigo_nombre_da4b866e_like";
DROP INDEX public."SISGDDO_sosi_especialista_id_24d6da69";
DROP INDEX public."SISGDDO_prioridad_nombre_c4a4e387_like";
DROP INDEX public."SISGDDO_premio_entidad_id_32643785";
DROP INDEX public."SISGDDO_periodo_nombre_b9d2eacc_like";
DROP INDEX public."SISGDDO_linea_tematica_nombre_9f7df45b_like";
DROP INDEX public."SISGDDO_indicador_objetivos_objetivo_id_c1883a69";
DROP INDEX public."SISGDDO_indicador_objetivos_nombre_0a1844bf_like";
DROP INDEX public."SISGDDO_indicador_objetivos_no_c3d38afe_like";
DROP INDEX public."SISGDDO_incidencia_trabajador_id_88ef29b2";
DROP INDEX public."SISGDDO_incidencia_proceso_id_a0b6cbe7";
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
DROP INDEX public."SISGDDO_estado_proyecto_etapa_id_434b07a4";
DROP INDEX public."SISGDDO_estado_proyecto_dgca_nombre_130ef725_like";
DROP INDEX public."SISGDDO_estado_indicador_objetivos_nombre_fba308f5_like";
DROP INDEX public."SISGDDO_estado_cenda_nombre_abeefaae_like";
DROP INDEX public."SISGDDO_estado_acuerdo_nombre_0ae91081_like";
DROP INDEX public."SISGDDO_entidad_nombre_f6a9ebad_like";
DROP INDEX public."SISGDDO_descripcion_area_id_bfa1be01";
DROP INDEX public."SISGDDO_descripcion_accion_id_52f1d318";
DROP INDEX public."SISGDDO_configuracion_nombre_69a10587_like";
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
ALTER TABLE ONLY public."SISGDDO_trabajador_consecutivo" DROP CONSTRAINT "SISGDDO_trabajador_consecutivo_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_proyecto" DROP CONSTRAINT "SISGDDO_tipo_proyecto_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_proyecto" DROP CONSTRAINT "SISGDDO_tipo_proyecto_nombre_key";
ALTER TABLE ONLY public."SISGDDO_tipo_de_obra" DROP CONSTRAINT "SISGDDO_tipo_de_obra_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_de_obra" DROP CONSTRAINT "SISGDDO_tipo_de_obra_nombre_key";
ALTER TABLE ONLY public."SISGDDO_tipo_codigo" DROP CONSTRAINT "SISGDDO_tipo_codigo_siglas_key";
ALTER TABLE ONLY public."SISGDDO_tipo_codigo" DROP CONSTRAINT "SISGDDO_tipo_codigo_pkey";
ALTER TABLE ONLY public."SISGDDO_tipo_codigo" DROP CONSTRAINT "SISGDDO_tipo_codigo_nombre_key";
ALTER TABLE ONLY public."SISGDDO_sosi" DROP CONSTRAINT "SISGDDO_sosi_pkey";
ALTER TABLE ONLY public."SISGDDO_registro_aprobacion" DROP CONSTRAINT "SISGDDO_registro_aprobacion_pkey";
ALTER TABLE ONLY public."SISGDDO_prioridad" DROP CONSTRAINT "SISGDDO_prioridad_pkey";
ALTER TABLE ONLY public."SISGDDO_prioridad" DROP CONSTRAINT "SISGDDO_prioridad_nombre_key";
ALTER TABLE ONLY public."SISGDDO_premio" DROP CONSTRAINT "SISGDDO_premio_pkey";
ALTER TABLE ONLY public."SISGDDO_permisos_personalizados" DROP CONSTRAINT "SISGDDO_permisos_personalizados_pkey";
ALTER TABLE ONLY public."SISGDDO_periodo" DROP CONSTRAINT "SISGDDO_periodo_pkey";
ALTER TABLE ONLY public."SISGDDO_periodo" DROP CONSTRAINT "SISGDDO_periodo_nombre_key";
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
ALTER TABLE ONLY public."SISGDDO_entidad" DROP CONSTRAINT "SISGDDO_entidad_pkey";
ALTER TABLE ONLY public."SISGDDO_entidad" DROP CONSTRAINT "SISGDDO_entidad_nombre_key";
ALTER TABLE ONLY public."SISGDDO_descripcion" DROP CONSTRAINT "SISGDDO_descripcion_pkey";
ALTER TABLE ONLY public."SISGDDO_configuracion" DROP CONSTRAINT "SISGDDO_configuracion_pkey";
ALTER TABLE ONLY public."SISGDDO_configuracion" DROP CONSTRAINT "SISGDDO_configuracion_nombre_key";
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
DROP TABLE public."SISGDDO_trabajador_consecutivo";
DROP TABLE public."SISGDDO_tipo_proyecto";
DROP TABLE public."SISGDDO_tipo_de_obra";
DROP TABLE public."SISGDDO_tipo_codigo";
DROP TABLE public."SISGDDO_sosi";
DROP TABLE public."SISGDDO_registro_aprobacion";
DROP TABLE public."SISGDDO_prioridad";
DROP TABLE public."SISGDDO_premio";
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
DROP TABLE public."SISGDDO_entidad";
DROP TABLE public."SISGDDO_descripcion";
DROP TABLE public."SISGDDO_configuracion";
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
    notificado boolean NOT NULL,
    fecha_frase timestamp with time zone,
    frase character varying(255)
);


ALTER TABLE public."ProyectoBaseApp_userapp" OWNER TO postgres;

--
-- Name: SISGDDO_accion_indicador_objetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_accion_indicador_objetivo" (
    id integer NOT NULL,
    no character varying(10),
    codigo character varying(10),
    nombre character varying(150) NOT NULL,
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
-- Name: SISGDDO_descripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_descripcion" (
    id integer NOT NULL,
    descripcion character varying(500),
    activo boolean NOT NULL,
    fecha_creacion timestamp with time zone NOT NULL,
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
    activo boolean NOT NULL,
    evaluacion_id integer NOT NULL,
    objetivo_id integer NOT NULL,
    periodo_id integer NOT NULL
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
-- Name: SISGDDO_periodo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_periodo" (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    orden character varying(3) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_periodo" OWNER TO postgres;

--
-- Name: SISGDDO_periodo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_periodo" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_periodo_id_seq"
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
    nombre character varying(150) NOT NULL,
    descripcion character varying(500),
    fecha date NOT NULL,
    archivo character varying(100),
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
-- Name: SISGDDO_registro_aprobacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SISGDDO_registro_aprobacion" (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public."SISGDDO_registro_aprobacion" OWNER TO postgres;

--
-- Name: SISGDDO_registro_aprobacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."SISGDDO_registro_aprobacion" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."SISGDDO_registro_aprobacion_id_seq"
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
    siglas character varying(6) NOT NULL,
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

COPY public."ProyectoBaseApp_userapp" (user_ptr_id, uui, image, "referUser", fa2, notificado, fecha_frase, frase) FROM stdin;
1	37eb87a3-f3ba-4908-ba38-3b8a227f25ba	foto/userDefault1.png	18d080ed-2e61-4244-afd3-a597990ec95b	f	f	\N	\N
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
\.


--
-- Data for Name: SISGDDO_actividadplan_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_actividadplan_participantes" (id, actividadplan_id, employee_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_actividadplan_preside; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_actividadplan_preside" (id, actividadplan_id, employee_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_acuerdo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdo" (id, numero, nombre, fecha, fecha_limite, fecha_cumplimiento, observaciones, activo, estado_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_acuerdo_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_acuerdo_employee" (id, acuerdo_id, employee_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_afectaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_afectaciones" (activo, numero, fecha_recepcion, fecha_cierre, afectacion, observacionesactual, estado, formato_id, propuesto_id, responsable_id) FROM stdin;
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

COPY public."SISGDDO_auditoria_interna" (id, fechainicio, fechafin, titulo, resultados, objetivos, alcance, criterios, observaciones, informe, activo, proceso_id, responsable_id) FROM stdin;
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
-- Data for Name: SISGDDO_configuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_configuracion" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_descripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_descripcion" (id, descripcion, activo, fecha_creacion, accion_id, area_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_entidad" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_estado_acuerdo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_acuerdo" (id, nombre, activo) FROM stdin;
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
\.


--
-- Data for Name: SISGDDO_estado_proyecto_dgca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_estado_proyecto_dgca" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_etapa_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_etapa_proyecto" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_evaluacion" (id, valor, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_evaluacion_trimestral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_evaluacion_trimestral" (id, activo, evaluacion_id, objetivo_id, periodo_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_formato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_formato" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_fuente_financiamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_fuente_financiamiento" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_incidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_incidencia" (id, titulo, fecha_recepcion, fecha_cierre, hora, descripcion, respuesta, estado, activo, ejecutante_id, proceso_id, trabajador_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_indicador_objetivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_indicador_objetivos" (id, no, nombre, activo, objetivo_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_linea_tematica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_linea_tematica" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_objetivo" (id, no, nombre, fecha_definicion, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_periodo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_periodo" (id, nombre, orden, activo) FROM stdin;
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
\.


--
-- Data for Name: SISGDDO_prioridad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_prioridad" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_registro_aprobacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_registro_aprobacion" (id, nombre, activo) FROM stdin;
\.


--
-- Data for Name: SISGDDO_sosi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_sosi" (id, numero_salva, fecha, anno, autor, ubicacion_salva, observaciones, archivo, activo, especialista_id) FROM stdin;
\.


--
-- Data for Name: SISGDDO_tipo_codigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SISGDDO_tipo_codigo" (id, nombre, siglas, activo) FROM stdin;
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

COPY public."SISGDDO_trabajador_consecutivo" (id, employee_id, rol_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
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
13	Can add configuracion	4	add_configuracion
14	Can change configuracion	4	change_configuracion
15	Can delete configuracion	4	delete_configuracion
16	Can view configuracion	4	view_configuracion
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
37	Can add estado_proyecto_dgca	10	add_estado_proyecto_dgca
38	Can change estado_proyecto_dgca	10	change_estado_proyecto_dgca
39	Can delete estado_proyecto_dgca	10	delete_estado_proyecto_dgca
40	Can view estado_proyecto_dgca	10	view_estado_proyecto_dgca
41	Can add etapa_proyecto	11	add_etapa_proyecto
42	Can change etapa_proyecto	11	change_etapa_proyecto
43	Can delete etapa_proyecto	11	delete_etapa_proyecto
44	Can view etapa_proyecto	11	view_etapa_proyecto
45	Can add evaluacion	12	add_evaluacion
46	Can change evaluacion	12	change_evaluacion
47	Can delete evaluacion	12	delete_evaluacion
48	Can view evaluacion	12	view_evaluacion
49	Can add formato	13	add_formato
50	Can change formato	13	change_formato
51	Can delete formato	13	delete_formato
52	Can view formato	13	view_formato
53	Can add fuente_financiamiento	14	add_fuente_financiamiento
54	Can change fuente_financiamiento	14	change_fuente_financiamiento
55	Can delete fuente_financiamiento	14	delete_fuente_financiamiento
56	Can view fuente_financiamiento	14	view_fuente_financiamiento
57	Can add linea_tematica	15	add_linea_tematica
58	Can change linea_tematica	15	change_linea_tematica
59	Can delete linea_tematica	15	delete_linea_tematica
60	Can view linea_tematica	15	view_linea_tematica
61	Can add objetivo	16	add_objetivo
62	Can change objetivo	16	change_objetivo
63	Can delete objetivo	16	delete_objetivo
64	Can view objetivo	16	view_objetivo
65	Can add periodo	17	add_periodo
66	Can change periodo	17	change_periodo
67	Can delete periodo	17	delete_periodo
68	Can view periodo	17	view_periodo
69	Can add permisos_personalizados	18	add_permisos_personalizados
70	Can change permisos_personalizados	18	change_permisos_personalizados
71	Can delete permisos_personalizados	18	delete_permisos_personalizados
72	Can view permisos_personalizados	18	view_permisos_personalizados
73	Ver grafico de RRHH	18	grafico_RH
74	Ver grafico de CAP	18	grafico_Cap
75	Ver grafico de C y A	18	grafico_CA
76	Ver grafico de Direccion	18	grafico_D
77	Ver grafico de Inform	18	grafico_I
78	Ver grafico de Admin	18	grafico_Admin
79	Can add prioridad	19	add_prioridad
80	Can change prioridad	19	change_prioridad
81	Can delete prioridad	19	delete_prioridad
82	Can view prioridad	19	view_prioridad
83	Can add registro_aprobacion	20	add_registro_aprobacion
84	Can change registro_aprobacion	20	change_registro_aprobacion
85	Can delete registro_aprobacion	20	delete_registro_aprobacion
86	Can view registro_aprobacion	20	view_registro_aprobacion
87	Can add tipo_codigo	21	add_tipo_codigo
88	Can change tipo_codigo	21	change_tipo_codigo
89	Can delete tipo_codigo	21	delete_tipo_codigo
90	Can view tipo_codigo	21	view_tipo_codigo
91	Can add tipo_de_obra	22	add_tipo_de_obra
92	Can change tipo_de_obra	22	change_tipo_de_obra
93	Can delete tipo_de_obra	22	delete_tipo_de_obra
94	Can view tipo_de_obra	22	view_tipo_de_obra
95	Can add tipo_proyecto	23	add_tipo_proyecto
96	Can change tipo_proyecto	23	change_tipo_proyecto
97	Can delete tipo_proyecto	23	delete_tipo_proyecto
98	Can view tipo_proyecto	23	view_tipo_proyecto
99	Can add trabajador_consecutivo	24	add_trabajador_consecutivo
100	Can change trabajador_consecutivo	24	change_trabajador_consecutivo
101	Can delete trabajador_consecutivo	24	delete_trabajador_consecutivo
102	Can view trabajador_consecutivo	24	view_trabajador_consecutivo
103	Can add sosi	25	add_sosi
104	Can change sosi	25	change_sosi
105	Can delete sosi	25	delete_sosi
106	Can view sosi	25	view_sosi
107	Can add premio	26	add_premio
108	Can change premio	26	change_premio
109	Can delete premio	26	delete_premio
110	Can view premio	26	view_premio
111	Can add indicador_objetivos	27	add_indicador_objetivos
112	Can change indicador_objetivos	27	change_indicador_objetivos
113	Can delete indicador_objetivos	27	delete_indicador_objetivos
114	Can view indicador_objetivos	27	view_indicador_objetivos
115	Can add incidencia	28	add_incidencia
116	Can change incidencia	28	change_incidencia
117	Can delete incidencia	28	delete_incidencia
118	Can view incidencia	28	view_incidencia
119	Can add evaluacion_trimestral	29	add_evaluacion_trimestral
120	Can change evaluacion_trimestral	29	change_evaluacion_trimestral
121	Can delete evaluacion_trimestral	29	delete_evaluacion_trimestral
122	Can view evaluacion_trimestral	29	view_evaluacion_trimestral
123	Can add estado_proyecto	30	add_estado_proyecto
124	Can change estado_proyecto	30	change_estado_proyecto
125	Can delete estado_proyecto	30	delete_estado_proyecto
126	Can view estado_proyecto	30	view_estado_proyecto
127	Can add descripcion	31	add_descripcion
128	Can change descripcion	31	change_descripcion
129	Can delete descripcion	31	delete_descripcion
130	Can view descripcion	31	view_descripcion
131	Can add auditoria_interna	32	add_auditoria_interna
132	Can change auditoria_interna	32	change_auditoria_interna
133	Can delete auditoria_interna	32	delete_auditoria_interna
134	Can view auditoria_interna	32	view_auditoria_interna
135	Can add auditoria_externa	33	add_auditoria_externa
136	Can change auditoria_externa	33	change_auditoria_externa
137	Can delete auditoria_externa	33	delete_auditoria_externa
138	Can view auditoria_externa	33	view_auditoria_externa
139	Can add agrupar roles	34	add_agruparroles
140	Can change agrupar roles	34	change_agruparroles
141	Can delete agrupar roles	34	delete_agruparroles
142	Can view agrupar roles	34	view_agruparroles
143	Can add afectaciones	35	add_afectaciones
144	Can change afectaciones	35	change_afectaciones
145	Can delete afectaciones	35	delete_afectaciones
146	Can view afectaciones	35	view_afectaciones
147	Can add acuerdo	36	add_acuerdo
148	Can change acuerdo	36	change_acuerdo
149	Can delete acuerdo	36	delete_acuerdo
150	Can view acuerdo	36	view_acuerdo
151	Can add actividad plan	37	add_actividadplan
152	Can change actividad plan	37	change_actividadplan
153	Can delete actividad plan	37	delete_actividadplan
154	Can view actividad plan	37	view_actividadplan
155	Can add log entry	38	add_logentry
156	Can change log entry	38	change_logentry
157	Can delete log entry	38	delete_logentry
158	Can view log entry	38	view_logentry
159	Can add permission	39	add_permission
160	Can change permission	39	change_permission
161	Can delete permission	39	delete_permission
162	Can view permission	39	view_permission
163	Can add group	40	add_group
164	Can change group	40	change_group
165	Can delete group	40	delete_group
166	Can view group	40	view_group
167	Can add user	41	add_user
168	Can change user	41	change_user
169	Can delete user	41	delete_user
170	Can view user	41	view_user
171	Can add content type	42	add_contenttype
172	Can change content type	42	change_contenttype
173	Can delete content type	42	delete_contenttype
174	Can view content type	42	view_contenttype
175	Can add session	43	add_session
176	Can change session	43	change_session
177	Can delete session	43	delete_session
178	Can view session	43	view_session
179	Can add user app	44	add_userapp
180	Can change user app	44	change_userapp
181	Can delete user app	44	delete_userapp
182	Can view user app	44	view_userapp
183	Can add notification	45	add_notification
184	Can change notification	45	change_notification
185	Can delete notification	45	delete_notification
186	Can view notification	45	view_notification
187	Can add Country	46	add_country
188	Can change Country	46	change_country
189	Can delete Country	46	delete_country
190	Can view Country	46	view_country
191	Can add employee	47	add_employee
192	Can change employee	47	change_employee
193	Can delete employee	47	delete_employee
194	Can view employee	47	view_employee
195	Can add entity	48	add_entity
196	Can change entity	48	change_entity
197	Can delete entity	48	delete_entity
198	Can view entity	48	view_entity
199	Can add logo entity	49	add_logoentity
200	Can change logo entity	49	change_logoentity
201	Can delete logo entity	49	delete_logoentity
202	Can view logo entity	49	view_logoentity
203	Can add position	50	add_position
204	Can change position	50	change_position
205	Can delete position	50	delete_position
206	Can view position	50	view_position
207	Can add process classifier	51	add_processclassifier
208	Can change process classifier	51	change_processclassifier
209	Can delete process classifier	51	delete_processclassifier
210	Can view process classifier	51	view_processclassifier
211	Can add scientific category	52	add_scientificcategory
212	Can change scientific category	52	change_scientificcategory
213	Can delete scientific category	52	delete_scientificcategory
214	Can view scientific category	52	view_scientificcategory
215	Can add process	53	add_process
216	Can change process	53	change_process
217	Can delete process	53	delete_process
218	Can view process	53	view_process
219	Can add procedure	54	add_procedure
220	Can change procedure	54	change_procedure
221	Can delete procedure	54	delete_procedure
222	Can view procedure	54	view_procedure
223	Can add info employee	55	add_infoemployee
224	Can change info employee	55	change_infoemployee
225	Can delete info employee	55	delete_infoemployee
226	Can view info employee	55	view_infoemployee
227	Can add effectiveness	56	add_effectiveness
228	Can change effectiveness	56	change_effectiveness
229	Can delete effectiveness	56	delete_effectiveness
230	Can view effectiveness	56	view_effectiveness
231	Can add effectiveness semester	57	add_effectivenesssemester
232	Can change effectiveness semester	57	change_effectivenesssemester
233	Can delete effectiveness semester	57	delete_effectivenesssemester
234	Can view effectiveness semester	57	view_effectivenesssemester
235	Can add indicator	58	add_indicator
236	Can change indicator	58	change_indicator
237	Can delete indicator	58	delete_indicator
238	Can view indicator	58	view_indicator
239	Can add indicator measurer	59	add_indicatormeasurer
240	Can change indicator measurer	59	change_indicatormeasurer
241	Can delete indicator measurer	59	delete_indicatormeasurer
242	Can view indicator measurer	59	view_indicatormeasurer
243	Can add semester measurer	60	add_semestermeasurer
244	Can change semester measurer	60	change_semestermeasurer
245	Can delete semester measurer	60	delete_semestermeasurer
246	Can view semester measurer	60	view_semestermeasurer
247	Can add license	61	add_license
248	Can change license	61	change_license
249	Can delete license	61	delete_license
250	Can view license	61	view_license
251	Can add way of reception	62	add_wayofreception
252	Can change way of reception	62	change_wayofreception
253	Can delete way of reception	62	delete_wayofreception
254	Can view way of reception	62	view_wayofreception
255	Can add complaint	63	add_complaint
256	Can change complaint	63	change_complaint
257	Can delete complaint	63	delete_complaint
258	Can view complaint	63	view_complaint
259	Can add complaint action	64	add_complaintaction
260	Can change complaint action	64	change_complaintaction
261	Can delete complaint action	64	delete_complaintaction
262	Can view complaint action	64	view_complaintaction
263	Can add drawing classification	65	add_drawingclassification
264	Can change drawing classification	65	change_drawingclassification
265	Can delete drawing classification	65	delete_drawingclassification
266	Can view drawing classification	65	view_drawingclassification
267	Can add figurative element classification	66	add_figurativeelementclassification
268	Can change figurative element classification	66	change_figurativeelementclassification
269	Can delete figurative element classification	66	delete_figurativeelementclassification
270	Can view figurative element classification	66	view_figurativeelementclassification
271	Can add patent classification	67	add_patentclassification
272	Can change patent classification	67	change_patentclassification
273	Can delete patent classification	67	delete_patentclassification
274	Can view patent classification	67	view_patentclassification
275	Can add product classification	68	add_productclassification
276	Can change product classification	68	change_productclassification
277	Can delete product classification	68	delete_productclassification
278	Can view product classification	68	view_productclassification
279	Can add type legal document	69	add_typelegaldocument
280	Can change type legal document	69	change_typelegaldocument
281	Can delete type legal document	69	delete_typelegaldocument
282	Can view type legal document	69	view_typelegaldocument
283	Can add industrial property	70	add_industrialproperty
284	Can change industrial property	70	change_industrialproperty
285	Can delete industrial property	70	delete_industrialproperty
286	Can view industrial property	70	view_industrialproperty
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$390000$l7U5mVRRDgU9EjhJUPJWoy$hngmBJubVJHZ8d44gaH6y3EiiEM9QA7Pb2QvGWjHsLQ=	2023-12-11 15:26:51.161408-05	t	hermes	Administrador	del Sistema	hermes22vl@gmail.com	t	t	2023-12-11 15:26:35.983296-05
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
\.


--
-- Data for Name: base_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_country (id, name, acronym, active) FROM stdin;
\.


--
-- Data for Name: base_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_employee (id, first_name, last_name, identification, image, active, position_id, scientific_category_id) FROM stdin;
\.


--
-- Data for Name: base_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_entity (id, name, active) FROM stdin;
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
\.


--
-- Data for Name: base_position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_position (id, name, active) FROM stdin;
\.


--
-- Data for Name: base_procedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_procedure (id, name, abbreviation, edition, revision, file, active, process_id) FROM stdin;
\.


--
-- Data for Name: base_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_process (id, "order", name, abbreviation, edition, revision, file, active, classifier_id, responsible_id) FROM stdin;
\.


--
-- Data for Name: base_processclassifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_processclassifier (id, name, active) FROM stdin;
\.


--
-- Data for Name: base_scientificcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_scientificcategory (id, name, prefix, active) FROM stdin;
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

COPY public.complaints_wayofreception (id, name, active) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-12-11 15:26:51.161408-05			4	127.0.0.1	41	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	SISGDDO	accion_indicador_objetivo
2	SISGDDO	area
3	SISGDDO	cambiarlogotipo
4	SISGDDO	configuracion
5	SISGDDO	entidad
6	SISGDDO	estado_acuerdo
7	SISGDDO	estado_cenda
8	SISGDDO	estado_entradas_proyecto
9	SISGDDO	estado_indicador_objetivos
10	SISGDDO	estado_proyecto_dgca
11	SISGDDO	etapa_proyecto
12	SISGDDO	evaluacion
13	SISGDDO	formato
14	SISGDDO	fuente_financiamiento
15	SISGDDO	linea_tematica
16	SISGDDO	objetivo
17	SISGDDO	periodo
18	SISGDDO	permisos_personalizados
19	SISGDDO	prioridad
20	SISGDDO	registro_aprobacion
21	SISGDDO	tipo_codigo
22	SISGDDO	tipo_de_obra
23	SISGDDO	tipo_proyecto
24	SISGDDO	trabajador_consecutivo
25	SISGDDO	sosi
26	SISGDDO	premio
27	SISGDDO	indicador_objetivos
28	SISGDDO	incidencia
29	SISGDDO	evaluacion_trimestral
30	SISGDDO	estado_proyecto
31	SISGDDO	descripcion
32	SISGDDO	auditoria_interna
33	SISGDDO	auditoria_externa
34	SISGDDO	agruparroles
35	SISGDDO	afectaciones
36	SISGDDO	acuerdo
37	SISGDDO	actividadplan
38	admin	logentry
39	auth	permission
40	auth	group
41	auth	user
42	contenttypes	contenttype
43	sessions	session
44	ProyectoBaseApp	userapp
45	notifications	notification
46	base	country
47	base	employee
48	base	entity
49	base	logoentity
50	base	position
51	base	processclassifier
52	base	scientificcategory
53	base	process
54	base	procedure
55	base	infoemployee
56	effectiveness	effectiveness
57	effectiveness	effectivenesssemester
58	effectiveness	indicator
59	effectiveness	indicatormeasurer
60	effectiveness	semestermeasurer
61	licenses	license
62	complaints	wayofreception
63	complaints	complaint
64	complaints	complaintaction
65	iproperty	drawingclassification
66	iproperty	figurativeelementclassification
67	iproperty	patentclassification
68	iproperty	productclassification
69	iproperty	typelegaldocument
70	iproperty	industrialproperty
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-12-11 15:25:39.815545-05
2	contenttypes	0002_remove_content_type_name	2023-12-11 15:25:39.838031-05
3	auth	0001_initial	2023-12-11 15:25:39.995859-05
4	auth	0002_alter_permission_name_max_length	2023-12-11 15:25:40.01149-05
5	auth	0003_alter_user_email_max_length	2023-12-11 15:25:40.024969-05
6	auth	0004_alter_user_username_opts	2023-12-11 15:25:40.034794-05
7	auth	0005_alter_user_last_login_null	2023-12-11 15:25:40.034794-05
8	auth	0006_require_contenttypes_0002	2023-12-11 15:25:40.034794-05
9	auth	0007_alter_validators_add_error_messages	2023-12-11 15:25:40.050038-05
10	auth	0008_alter_user_username_max_length	2023-12-11 15:25:40.070693-05
11	auth	0009_alter_user_last_name_max_length	2023-12-11 15:25:40.082467-05
12	auth	0010_alter_group_name_max_length	2023-12-11 15:25:40.088178-05
13	auth	0011_update_proxy_permissions	2023-12-11 15:25:40.103138-05
14	auth	0012_alter_user_first_name_max_length	2023-12-11 15:25:40.103888-05
15	ProyectoBaseApp	0001_initial	2023-12-11 15:25:40.132289-05
16	ProyectoBaseApp	0002_userapp_notificado	2023-12-11 15:25:40.133201-05
17	ProyectoBaseApp	0003_remove_userapp_notificado	2023-12-11 15:25:40.149414-05
18	ProyectoBaseApp	0004_userapp_notificado	2023-12-11 15:25:40.149414-05
19	ProyectoBaseApp	0005_userapp_fecha_frase	2023-12-11 15:25:40.170748-05
20	ProyectoBaseApp	0006_alter_userapp_fecha_frase	2023-12-11 15:25:40.178743-05
21	ProyectoBaseApp	0007_alter_userapp_fecha_frase	2023-12-11 15:25:40.188737-05
22	ProyectoBaseApp	0008_userapp_frase	2023-12-11 15:25:40.199989-05
23	base	0001_initial	2023-12-11 15:25:40.433145-05
24	auth	0013_agruparroles	2023-12-11 15:25:40.481561-05
25	auth	0014_alter_agruparroles_id	2023-12-11 15:25:40.497944-05
26	auth	0015_delete_agruparroles	2023-12-11 15:25:40.516795-05
27	SISGDDO	0001_initial	2023-12-11 15:25:41.777205-05
28	admin	0001_initial	2023-12-11 15:25:41.831455-05
29	admin	0002_logentry_remove_auto_add	2023-12-11 15:25:41.848608-05
30	admin	0003_logentry_add_action_flag_choices	2023-12-11 15:25:41.865544-05
31	captcha	0001_initial	2023-12-11 15:25:41.882889-05
32	captcha	0002_alter_captchastore_id	2023-12-11 15:25:41.882889-05
33	captcha	0003_delete_captchastore	2023-12-11 15:25:41.90093-05
34	complaints	0001_initial	2023-12-11 15:25:42.030336-05
35	effectiveness	0001_initial	2023-12-11 15:25:42.293733-05
36	iproperty	0001_initial	2023-12-11 15:25:42.590761-05
37	licenses	0001_initial	2023-12-11 15:25:42.684644-05
38	notifications	0001_initial	2023-12-11 15:25:42.746979-05
39	notifications	0002_auto_20150224_1134	2023-12-11 15:25:42.772961-05
40	notifications	0003_notification_data	2023-12-11 15:25:42.786465-05
41	notifications	0004_auto_20150826_1508	2023-12-11 15:25:42.803373-05
42	notifications	0005_auto_20160504_1520	2023-12-11 15:25:42.817495-05
43	notifications	0006_indexes	2023-12-11 15:25:42.882332-05
44	notifications	0007_add_timestamp_index	2023-12-11 15:25:42.904783-05
45	notifications	0008_index_together_recipient_unread	2023-12-11 15:25:42.920871-05
46	sessions	0001_initial	2023-12-11 15:25:42.949402-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
gvhifewqht92gicoc2sanpzx1vpzq8n9	.eJxVjMsOwiAQRf-FtSEwvDou3fsNBAaQqoGktCvjv2uTLnR7zzn3xXzY1uq3kRc_J3Zmkp1-txjokdsO0j20W-fU27rMke8KP-jg157y83K4fwc1jPqtMWvlMBshdLFlUgqMlKUQEDpjAmmhITgg0tYmiakAFnQOkQDjlIm9P8SPN2c:1rCmrg:2y6eoqgHwxfaQ-BJU2bef5ox4OZKRdlQw_YxHrse-Fc	2023-12-11 17:26:56.110134-05
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
\.


--
-- Data for Name: iproperty_figurativeelementclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_figurativeelementclassification (id, number, name, active) FROM stdin;
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
\.


--
-- Data for Name: iproperty_productclassification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iproperty_productclassification (id, number, name, active) FROM stdin;
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
\.


--
-- Name: SISGDDO_accion_indicador_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_accion_indicador_objetivo_id_seq"', 1, false);


--
-- Name: SISGDDO_actividadplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_id_seq"', 1, false);


--
-- Name: SISGDDO_actividadplan_participantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_participantes_id_seq"', 1, false);


--
-- Name: SISGDDO_actividadplan_preside_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_actividadplan_preside_id_seq"', 1, false);


--
-- Name: SISGDDO_acuerdo_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acuerdo_employee_id_seq"', 1, false);


--
-- Name: SISGDDO_acuerdo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_acuerdo_id_seq"', 1, false);


--
-- Name: SISGDDO_afectaciones_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_afectaciones_numero_seq"', 1, false);


--
-- Name: SISGDDO_agruparroles_permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_agruparroles_permisos_id_seq"', 1, false);


--
-- Name: SISGDDO_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_area_id_seq"', 1, false);


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
-- Name: SISGDDO_descripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_descripcion_id_seq"', 1, false);


--
-- Name: SISGDDO_entidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_entidad_id_seq"', 1, false);


--
-- Name: SISGDDO_estado_acuerdo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_estado_acuerdo_id_seq"', 1, false);


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

SELECT pg_catalog.setval('public."SISGDDO_estado_proyecto_id_seq"', 1, false);


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

SELECT pg_catalog.setval('public."SISGDDO_evaluacion_trimestral_id_seq"', 1, false);


--
-- Name: SISGDDO_formato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_formato_id_seq"', 1, false);


--
-- Name: SISGDDO_fuente_financiamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_fuente_financiamiento_id_seq"', 1, false);


--
-- Name: SISGDDO_incidencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_incidencia_id_seq"', 1, false);


--
-- Name: SISGDDO_indicador_objetivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_indicador_objetivos_id_seq"', 1, false);


--
-- Name: SISGDDO_linea_tematica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_linea_tematica_id_seq"', 1, false);


--
-- Name: SISGDDO_objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_objetivo_id_seq"', 1, false);


--
-- Name: SISGDDO_periodo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_periodo_id_seq"', 1, false);


--
-- Name: SISGDDO_permisos_personalizados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_permisos_personalizados_id_seq"', 1, false);


--
-- Name: SISGDDO_premio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_premio_id_seq"', 1, false);


--
-- Name: SISGDDO_prioridad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_prioridad_id_seq"', 1, false);


--
-- Name: SISGDDO_registro_aprobacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SISGDDO_registro_aprobacion_id_seq"', 1, false);


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
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 286, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.base_entity_id_seq', 1, false);


--
-- Name: base_infoemployee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_infoemployee_id_seq', 1, false);


--
-- Name: base_logoentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_logoentity_id_seq', 1, false);


--
-- Name: base_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_position_id_seq', 1, false);


--
-- Name: base_procedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_procedure_id_seq', 1, false);


--
-- Name: base_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_process_id_seq', 1, false);


--
-- Name: base_processclassifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_processclassifier_id_seq', 1, false);


--
-- Name: base_scientificcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_scientificcategory_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 70, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 46, true);


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

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 1, false);


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
-- Name: SISGDDO_periodo SISGDDO_periodo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_periodo"
    ADD CONSTRAINT "SISGDDO_periodo_nombre_key" UNIQUE (nombre);


--
-- Name: SISGDDO_periodo SISGDDO_periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_periodo"
    ADD CONSTRAINT "SISGDDO_periodo_pkey" PRIMARY KEY (id);


--
-- Name: SISGDDO_permisos_personalizados SISGDDO_permisos_personalizados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_permisos_personalizados"
    ADD CONSTRAINT "SISGDDO_permisos_personalizados_pkey" PRIMARY KEY (id);


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
-- Name: SISGDDO_registro_aprobacion SISGDDO_registro_aprobacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_registro_aprobacion"
    ADD CONSTRAINT "SISGDDO_registro_aprobacion_pkey" PRIMARY KEY (id);


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
-- Name: SISGDDO_configuracion_nombre_69a10587_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_configuracion_nombre_69a10587_like" ON public."SISGDDO_configuracion" USING btree (nombre varchar_pattern_ops);


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
-- Name: SISGDDO_estado_proyecto_etapa_id_434b07a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_estado_proyecto_etapa_id_434b07a4" ON public."SISGDDO_estado_proyecto" USING btree (etapa_id);


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
-- Name: SISGDDO_periodo_nombre_b9d2eacc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_periodo_nombre_b9d2eacc_like" ON public."SISGDDO_periodo" USING btree (nombre varchar_pattern_ops);


--
-- Name: SISGDDO_premio_entidad_id_32643785; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_premio_entidad_id_32643785" ON public."SISGDDO_premio" USING btree (entidad_id);


--
-- Name: SISGDDO_prioridad_nombre_c4a4e387_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_prioridad_nombre_c4a4e387_like" ON public."SISGDDO_prioridad" USING btree (nombre varchar_pattern_ops);


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
-- Name: SISGDDO_trabajador_consecutivo_employee_id_53d7c9a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_consecutivo_employee_id_53d7c9a3" ON public."SISGDDO_trabajador_consecutivo" USING btree (employee_id);


--
-- Name: SISGDDO_trabajador_consecutivo_rol_id_1daa1fc0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SISGDDO_trabajador_consecutivo_rol_id_1daa1fc0" ON public."SISGDDO_trabajador_consecutivo" USING btree (rol_id);


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
-- Name: SISGDDO_sosi SISGDDO_sosi_especialista_id_24d6da69_fk_base_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SISGDDO_sosi"
    ADD CONSTRAINT "SISGDDO_sosi_especialista_id_24d6da69_fk_base_employee_id" FOREIGN KEY (especialista_id) REFERENCES public.base_employee(id) DEFERRABLE INITIALLY DEFERRED;


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

