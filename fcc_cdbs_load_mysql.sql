-- ===============================================================================
--   FCC CDBS Database
--   DESCRIPTION:       This is schema is for loading MYSQL publicly released files under CDBS.
--   URL:               http://transition.fcc.gov/ftp/Bureaus/MB/Databases/cdbs/_readme.html
--   DATA URL:          http://transition.fcc.gov/mb/databases/cdbs/
--   DOCUMENTATION:     http://transition.fcc.gov/mb/databases/cdbs/
--                      ftp://ftp.fcc.gov/pub/Bureaus/MB/Databases/cdbs/_Engineering_Data_Description.pdf
--   
-- ================================================================================

-- ================================================================================
--   mysql Load Script File
-- ================================================================================

-- ===============================================================================
-- 
--   Generated by:      Greg Elin
--                      See https://github.com/gregelin/FCC-CDBS 
-- 
--   Target Database:   mysql
--   Generated at:      November 24, 2011
--   File name:         fcc_cdbs_load_mysql.sql
--   Notes:             All files loading except for marked ERROR
--                      Quality of data load not tested yet.
-- 
-- ================================================================================

-- ================================================================================
--
--   IMPORTANT!!
--   MODIFY:            PATH TO DOWNLOADED DATA FILES
--
-- ================================================================================

-- SQL Load statements
-- Assumes tables are empty
-- --------------------------------------------------------------------

-- am_ant_sys
-- load am_ant_sys
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/am_ant_sys.dat'
INTO TABLE am_ant_sys
FIELDS TERMINATED BY '|'
(ant_mode, ant_sys_id, application_id, aug_count, bad_data_switch, domestic_pattern, dummy_data_switch, efficiency_restricted, efficiency_theoretical, feed_circ_other, feed_circ_type, hours_operation, lat_deg, lat_dir, lat_min, lat_sec, lon_deg, lon_dir, lon_min, lon_sec, q_factor, q_factor_custom_ind, power, rms_augmented, rms_standard, rms_theoretical, tower_count, eng_record_type, biased_lat, biased_long, mainkey, am_dom_status, lat_whole_secs, lon_whole_secs, ant_dir_ind, grandfathered_ind, specified_hrs_range, augmented_ind, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- load am_augs
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/am_augs.dat'
INTO TABLE am_augs
FIELDS TERMINATED BY '|'
(ant_sys_id, aug_id, azimuth_deg, radiation_aug, span_deg, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- am_eng_data
-- load am_eng_data
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/am_eng_data.dat'
INTO TABLE am_eng_data
FIELDS TERMINATED BY '|'
(ant_monitor, application_id, broadcast_schedule, encl_fence_dist, facility_id, sampl_sys_ind, station_class, time_zone, region_2_class, am_dom_status, old_station_class, specified_hours, feed_circ_other, feed_circ_type, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- am_towers
-- load am_towers
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/am_towers.dat'
INTO TABLE am_towers
FIELDS TERMINATED BY '|'
(ant_sys_id, asrn_id, elec_hgt_deg, field_ratio, hag_no_obst, hgt_overall_mtr, hgt_rad_ab, hgt_radiator_mtr, orientation_deg, phasing_deg, rad_hgt_deg, spacing_deg, top_loaded_switch, topload_a, topload_b, topload_c, topload_d, tower_num, tower_pl_codes, tower_ref_switch, asrn_na_ind, topload_apparent_hgt, faa_notified_ind, tower_type, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- amcmnts
-- load amcmnts
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/amcmnts.dat'
INTO TABLE amcmnts
FIELDS TERMINATED BY '|'
(application_id, comment_type, comment);

-- ant_make
-- load ant_make
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ant_make.dat'
INTO TABLE ant_make
FIELDS TERMINATED BY '|'
(antenna_id, ant_make, ant_model_num, app_service, standard_ind, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- ant_pattern
-- load ant_pattern
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ant_pattern.dat'
INTO TABLE ant_pattern
FIELDS TERMINATED BY '|'
(antenna_id, azimuth, field_value, additional_az_num, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- app_party
-- load app_party
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/app_party.dat'
INTO TABLE app_party
FIELDS TERMINATED BY '|'
(application_id, party_id, party_type, cert_title, @cert_date, other_fcc_id, party_notify_ind, party_relationship, sig_present_ind, sig_name, @last_change_date)
set
cert_date = str_to_date(@cert_date, '%m/%d/%Y'),
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- app_tracking
-- load app_tracking
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/app_tracking.dat'
INTO TABLE app_tracking
FIELDS TERMINATED BY '|'
(application_id, @app_status_date, @cutoff_date, cutoff_type, @cp_exp_date, app_status, dtv_checklist, @amendment_stamped_date, @accepted_date, tolling_code, @last_change_date)
set
app_status_date = str_to_date(@app_status_date, '%m/%d/%Y'),
cutoff_date = str_to_date(@cutoff_date, '%m/%d/%Y'),
cp_exp_date = str_to_date(@cp_exp_date, '%m/%d/%Y'),
amendment_stamped_date = str_to_date(@amendment_stamped_date, '%m/%d/%Y'),
accepted_date = str_to_date(@accepted_date, '%m/%d/%Y'),
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- application
-- load application
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/application.dat'
INTO TABLE application
FIELDS TERMINATED BY '|'
(app_arn, app_service, application_id, facility_id, file_prefix, comm_city, comm_state, fac_frequency, station_channel, fac_callsign, general_app_service, app_type, paper_filed_ind, dtv_type, frn, shortform_app_arn, shortform_file_prefix, corresp_ind, assoc_facility_id, network_affil, sat_tv_ind, comm_county, comm_zip1, comm_zip2, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- call_sign_history
-- load call_sign_history
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/call_sign_history.dat'
INTO TABLE call_sign_history
FIELDS TERMINATED BY '|'
(@begin_date, callsign, callsign_hist_id, callsign_seq_id, facility_id, @record_change_date)
set
begin_date = str_to_date(@begin_date, '%m/%d/%Y'),
record_change_date = str_to_date(@record_change_date, '%m/%d/%Y');

-- dtv_agreement_group
-- load dtv_agreement_group
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/dtv_agreement_group.dat'
INTO TABLE dtv_agreement_group
FIELDS TERMINATED BY '|'
(application_id, fac_callsign, facility_id, order_num, dtv_agreement_group_id, name, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- dtv_allotment
-- load dtv_allotment
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/dtv_allotment.dat'
INTO TABLE dtv_allotment
FIELDS TERMINATED BY '|'
(state, city, analog_channel, digital_channel, erp, haat, lat_deg, lat_dir, lat_min, lat_sec, lon_deg, lon_dir, lon_min, lon_sec, biased_lat, biased_long, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- dtv_channel_assignments
-- load dtv_channel_assignments
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/dtv_channel_assignments.dat'
INTO TABLE dtv_channel_assignments
FIELDS TERMINATED BY '|'
(facility_id, state, city, ntsc_channel, post_dtv_channel, erp, haat, antenna_id, latitude, longitude, rcamsl, ref_azimuth, da_ind, pre_dtv_channel, callsign);

-- dtv_facility
-- load dtv_facility
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/dtv_facility.dat'
INTO TABLE dtv_facility
FIELDS TERMINATED BY '|'
(facility_id, dtv_fac_status, dtv_channel, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- dtv_transition
-- load dtv_transition
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/dtv_transition.dat'
INTO TABLE dtv_transition
FIELDS TERMINATED BY '|'
(dtv_cur_channel, application_id, dtv_cur_na, ntsc_cur_channel, ntsc_cur_na, rep_max_cert, file_prefix_cer_a, app_arn_cer_a, file_prefix_cer_b, app_arn_cer_b, file_prefix_cer_d, app_arn_cer_d, rep_max_cer_type, file_prefix_cer_e, app_arn_cer_e, data_cert_ind, election, elected_channel_a, elected_channel_b, alt_elected_channel, intl_coord_ind, cont_election, cont_elected_channel, conflict_decision, reference_no, negot_agreemt_ind, tech_eng_ind, tent_chan_status, tentative_channel, post_tran_dtv_channel, pre_tran_dtv_channel, post_tran_auth_file_prefix, post_tran_auth_app_arn, post_tran_auth_not_yet_ind, @construction_deadline_dat, post_tran_operating_ind, op_status, @op_expected_date, op_power_level, op_population_perc, construction_complete_ind, @expect_cons_complete_date, const_not_begun, const_underway, const_addl_needed, cp_status_ind, cp_mod_needed_ind, cp_mod_filed_ind, cp_mod_file_prefix, cp_mod_app_arn, @cp_mod_filed_date, @cp_mod_expected_date, addl_fcc_action_ind, addl_fcc_action_app_arn, addl_fcc_action_file_pref, @addl_fcc_action_date, addl_intl_ind, addl_faa_approval_ind, addl_local_approval_ind, addl_equip_ind, addl_equip_new_ant_ind, addl_equip_adj_ant_ind, addl_equip_switch_ant_ind, addl_equip_new_trans_ind, addl_equip_adj_trans_ind, addl_equip_gen_install_ind, addl_equip_other_ind, addl_tower_ind, addl_coord_ind, addl_other_ind, analog_service_status, analog_status_ind, dtv_transition_plan_ind, addl_steps_ind, analog_nightlight_ind, analog_turnoff_pn_compl_flg, binding_termination_flg, @termination_date_not_aff, @termination_date_aff, aff_term_cert_flg, cont_analog_flg, phone_help_ctr_flg, walkin_help_ctr_flg, st_analog_nightlight_ind, @st_analog_nightlight_end_, inf_analog_nightlight_ind, inf_analog_nightlight_end, early_term_withdraw_ind, termination_time_0612_flg, @termination_date_nce, termination_time_nce_flg, termination_time_notaff_flg, termination_time_aff_flg, nce_term_cert_flg, ref_contact_phone, ref_contact_hours, an_participation_notice_ind, an_eligibility_showing_ind, an_objection_to_elig_showg_ind, an_objection_callsign, an_revocation_ind, @last_update_date)
set
construction_deadline_dat = str_to_date(@construction_deadline_dat, '%m/%d/%Y'),
op_expected_date = str_to_date(@op_expected_date, '%m/%d/%Y'),
expect_cons_complete_date = str_to_date(@expect_cons_complete_date, '%m/%d/%Y'),
cp_mod_filed_date = str_to_date(@cp_mod_filed_date, '%m/%d/%Y'),
cp_mod_expected_date = str_to_date(@cp_mod_expected_date, '%m/%d/%Y'),
addl_fcc_action_date = str_to_date(@addl_fcc_action_date, '%m/%d/%Y'),
termination_date_not_aff = str_to_date(@termination_date_not_aff, '%m/%d/%Y'),
termination_date_aff = str_to_date(@termination_date_aff, '%m/%d/%Y'),
st_analog_nightlight_end_ = str_to_date(@st_analog_nightlight_end_, '%m/%d/%Y'),
termination_date_nce = str_to_date(@termination_date_nce, '%m/%d/%Y'),
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- elevation_ant_make
-- load elevation_ant_make
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/elevation_ant_make.dat'
INTO TABLE elevation_ant_make
FIELDS TERMINATED BY '|'
(ant_make, ant_model_num, elevation_antenna_id, ant_comment);

-- elevation_pattern
-- load elevation_pattern
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/elevation_pattern.dat'
INTO TABLE elevation_pattern
FIELDS TERMINATED BY '|'
(depression_angle, field_value, field_value0, field_value10, field_value20, field_value30, field_value40, field_value50, field_value60, field_value70, field_value80, field_value90, field_value100, field_value110, field_value120, field_value130, field_value140, field_value150, field_value160, field_value170, field_value180, field_value190, field_value200, field_value210, field_value220, field_value230, field_value240, field_value250, field_value260, field_value270, field_value280, field_value290, field_value300, field_value310, field_value320, field_value330, field_value340, field_value350, elevation_antenna_id, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- elevation_pattern_addl
-- load elevation_pattern_addl
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/elevation_pattern_addl.dat'
INTO TABLE elevation_pattern_addl
FIELDS TERMINATED BY '|'
(site_number, depression_angle, azimuth, field_value, additional_az_num, elevation_antenna_id, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- fac_party
-- load fac_party
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/fac_party.dat'
INTO TABLE fac_party
FIELDS TERMINATED BY '|'
(facility_id, party_id, party_type, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- facility
-- load facility
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/facility.dat'
INTO TABLE facility
FIELDS TERMINATED BY '|'
(comm_city, comm_state, eeo_rpt_ind, fac_address1, fac_address2, fac_callsign, fac_channel, fac_city, fac_country, fac_frequency, fac_service, fac_state, @fac_status_date, fac_type, facility_id, @lic_expiration_date, fac_status, fac_zip1, fac_zip2, station_type, assoc_facility_id, @callsign_eff_date, tsid_ntsc, tsid_dtv, digital_status, sat_tv, network_affil, nielsen_dma, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y'),
lic_expiration_date = str_to_date(@lic_expiration_date, '%m/%d/%Y'),
callsign_eff_date = str_to_date(@callsign_eff_date, '%m/%d/%Y'),
fac_status_date = str_to_date(@fac_status_date, '%m/%d/%Y');

-- fm_app_indicators
-- load fm_app_indicators
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/fm_app_indicators.dat'
INTO TABLE fm_app_indicators
FIELDS TERMINATED BY '|'
(application_id, bt_ind, da_ind, no_rotation_ind, rule_73_215_req_ind, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- fm_eng_data
-- load fm_eng_data
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/fm_eng_data.dat'
INTO TABLE fm_eng_data
FIELDS TERMINATED BY '|'
(ant_input_pwr, ant_max_pwr_gain, ant_polarization, ant_rotation, antenna_id, antenna_type, application_id, asd_service, asrn_na_ind, asrn, avg_horiz_pwr_gain, biased_lat, biased_long, border_code, border_dist, docket_num, effective_erp, elev_amsl, elev_bldg_ag, eng_record_type, facility_id, fm_dom_status, gain_area, haat_horiz_rc_mtr, haat_vert_rc_mtr, hag_horiz_rc_mtr, hag_overall_mtr, hag_vert_rc_mtr, horiz_bt_erp, horiz_erp, lat_deg, lat_dir, lat_min, lat_sec, lon_deg, lon_dir, lon_min, lon_sec, loss_area, max_ant_pwr_gain, max_haat, max_horiz_erp, max_vert_erp, multiplexor_loss, power_output_vis_kw, predict_coverage_area, predict_pop, rcamsl_horiz_mtr, rcamsl_vert_mtr, station_class, terrain_data_src, vert_bt_erp, vert_erp, num_sections, present_area, percent_change, spacing, terrain_data_src_other, trans_power_output, mainkey, lat_whole_secs, lon_whole_secs, station_channel, lic_ant_make, lic_ant_model_num, min_horiz_erp, haat_horiz_calc_ind, erp_w, trans_power_output_w, market_group_num, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- frn_history
-- load frn_history
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/frn_history.dat'
INTO TABLE frn_history
FIELDS TERMINATED BY '|'
(frn_history_id, facility_id, frn, application_id, date_inserted, valid_ind);

-- fmcmnts
-- load fmcmnts
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/fmcmnts.dat'
INTO TABLE fmcmnts
FIELDS TERMINATED BY '|'
(application_id, comment_type, comment);

-- gen_app_indicators
-- load gen_app_indicators
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/gen_app_indicators.dat'
INTO TABLE gen_app_indicators
FIELDS TERMINATED BY '|'
(application_id, edu_comm_flg, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- if_notification
-- load if_notification
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/if_notification.dat'
INTO TABLE if_notification
FIELDS TERMINATED BY '|'
(application_id, @broadcast_date, ibiquity_cert, tech_name, tech_phone, combined_power, analog_power, digital_power, analog_remain_ind, env_excluded_ind, digital_power_reduced, digital_power_reduced_na, ref_file_prefix, ref_app_arn, @test_date, @resolved_date, analog_erp, digital_erp, @last_change_date)
set
broadcast_date = str_to_date(@broadcast_date, '%m/%d/%Y'),
test_date = str_to_date(@test_date, '%m/%d/%Y'),
resolved_date = str_to_date(@resolved_date, '%m/%d/%Y'),
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- int_translator
-- load int_translator
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/int_translator.dat'
INTO TABLE int_translator
FIELDS TERMINATED BY '|'
(application_id, delivery_method, prim_callsign, prim_comm_city, prim_comm_state, prim_sta_out_channel, primary_via, scnd_comm_city, scnd_comm_state, third_comm_city, third_comm_state, trans_input_channel, prim_facility_id, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- intl_tracking
-- load intl_tracking
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/intl_tracking.dat'
INTO TABLE intl_tracking
FIELDS TERMINATED BY '|'
(@accepted_date, application_id, can_coord_status, @change_list_date, change_list_num, hours_operation, @ifrb_date, ifrb_list_flg, ifrb_serial_num, intl_class, itu_coord_status, mex_coord_status, neg_allot_ind, notified_pattern, notified_status, @proposed_date, @referred_date, region_2_status, updating_agency, @notified_date, intl_status, @last_change_date)
set
accepted_date = str_to_date(@accepted_date, '%m/%d/%Y'),
change_list_date = str_to_date(@change_list_date, '%m/%d/%Y'),
ifrb_date = str_to_date(@ifrb_date, '%m/%d/%Y'),
proposed_date = str_to_date(@proposed_date, '%m/%d/%Y'),
referred_date = str_to_date(@referred_date, '%m/%d/%Y'),
notified_date = str_to_date(@notified_date, '%m/%d/%Y'),
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- lic_app_indicators
-- load lic_app_indicators
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/lic_app_indicators.dat'
INTO TABLE lic_app_indicators
FIELDS TERMINATED BY '|'
(application_id, auth_retrans_ind, chng_transm_pwr_ind, cp_stmt_incorrect_ind, cp_terms_met_ind, da_inst_compl_ind, da_inst_correct_ind, decr_c_erp_ind, decr_nc_erp_ind, del_cntr_prot_ind, incr_erp_221_ind, incr_erp_dckt_ind, incr_erp_ind, incr_erp_ownr_ind, lic_app_service, lic_pta_ind, nce_to_comm_ind, no_intl_coord_ind, orig_cp_file_prefix, orig_cp_app_arn, lic_file_prefix, lic_app_arn, rad_astr_not_ind, repl_da_compl_ind, repl_da_ind, rule_73_1620a1_ind, rule_73_1675a3_ind, rule_73_1675a_ind, rule_73_1690c8i_ind, rule_73_1690c_ind, rule_73_1692_ind, rule_73_207_ind, rule_73_315ab_ind, rule_73_525a1_ind, rule_73_68_ind, spec_op_conds_ind, sta_id_rules_ind, stat_ready_ind, trans_auth_erp_ind, type_appr_stereo_ind, inst_ht_dif_ok_ind, rule_73_1590, rule_73_1660_ind, rule_73_1675c_1_ind, rule_73_1675c_ind, rule_73_1690c9_ind, rule_73_3555_ind, rule_73_685f_ind, rule_73_68d3_ind, sales_type_flg, conv_lptv_cp_arn, conv_lptv_cp_prefix, conv_lptv_lic_arn, conv_lptv_lic_prefix, @displaced_cp_filed_date, no_change_lp_cp_ind, rule_73_6011_ind, rule_73_6012_ind, rule_73_6013_ind, rule_73_6020_ind, no_change_to_classa_cp_in, pta_type, repl_trans_line_ind, rule_73_850b_ind, rule_73_1675a_nc_ind, rule_73_1675a_ax_ind, @orig_cp_app_expiration_date, @record_change_date)
set
displaced_cp_filed_date = str_to_date(@displaced_cp_filed_date, '%m/%d/%Y'),
orig_cp_app_expiration_date = str_to_date(@orig_cp_app_expiration_date, '%m/%d/%Y'),
record_change_date = str_to_date(@record_change_date, '%m/%d/%Y');


-- nce_factors
-- load nce_factors
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/nce_factors.dat'
INTO TABLE nce_factors
FIELDS TERMINATED BY '|'
(application_id, claimed_points, existing_auths, existing_cps, existing_fillin_auths, existing_fillin_cps, fill_in_serv_ind, gain_area, population_served, rule_73_313_c_ind, rule_73_3555_ind, rule_73_7000_ind, rule_73_7003_b_c_ind, technical_points, total_points, divers_own_ind, min_first_service_ind, min_sec_service_ind, @supplement_date, first_aural_service_ind, first_tribal_service_ind, @last_change_date)
set
supplement_date = str_to_date(@supplement_date, '%m/%d/%Y'),
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- ownership_capitalization
-- load ownership_capitalization
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_capitalization.dat'
INTO TABLE ownership_capitalization
FIELDS TERMINATED BY '|'
(ownership_capitalization_id, application_id, class_of_stock, voting_ind, authorized_shares, issued_shares, treasury_shares, unissued_shares, order_number, class_of_stock_flg, class_of_stock_other, voting_flg, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_contract
-- load ownership_contract
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_contract.dat'
INTO TABLE ownership_contract
FIELDS TERMINATED BY '|'
(ownership_contract_id, application_id, contract_description, contract_person, @execution_date, @expiration_date, order_number, agreement_type_lma, agreement_type_naa, agreement_type_oth, execution_date_month, execution_date_year, expiration_date_month, expiration_date_year, expiration_date_na, @last_update_date)
set
execution_date = str_to_date(@execution_date, '%m/%d/%Y'),
expiration_date = str_to_date(@expiration_date, '%m/%d/%Y'),
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_exemptions
-- load ownership_exemptions
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_exemptions.dat'
INTO TABLE ownership_exemptions
FIELDS TERMINATED BY '|'
(ownership_exemptions_id, application_id, order_number, name, title, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_group
-- load ownership_group
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_group.dat'
INTO TABLE ownership_group
FIELDS TERMINATED BY '|'
(ownership_group_id, main_application_id, fac_callsign, facility_id, fac_service, comm_city, comm_state, fac_service_o, app_arn, file_prefix, order_number, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_interests
-- load ownership_interests
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_interests.dat'
INTO TABLE ownership_interests
FIELDS TERMINATED BY '|'
(ownership_interests_id, application_id, order_number, frn, name, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_other_int
-- load ownership_other_int
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_other_int.dat'
INTO TABLE ownership_other_int
FIELDS TERMINATED BY '|'
(ownership_other_int_id, application_id, order_number, assets_perc, comm_city, comm_state, entity_type, equity_perc, fac_callsign, facility_id, name, newspaper, positional_int_off, positional_int_dir, positional_int_par, positional_int_lim, positional_int_stk, positional_int_own, positional_int_ent, positional_int_oth, positional_int_other_info, votes_perc, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ERROR 2 (HY000): File '/codedata/FCC/data/public/cdbs/ownership_other_int_xml_data.dat' not found (Errcode: 2)
-- ownership_other_int_xml_data
-- load ownership_other_int_xml_data
-- LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_other_int_xml_data.dat'
-- INTO TABLE ownership_other_int_xml_data
-- FIELDS TERMINATED BY '|'
-- (application_id, file_id, order_number, assets_perc, comm_city, comm_state, entity_type, equity_perc, fac_callsign, facility_id, name, newspaper, positional_int_off, positional_int_dir, positional_int_par, positional_int_lim, positional_int_stk, positional_int_own, positional_int_ent, positional_int_oth, positional_int_other_info, votes_perc, @last_update_date)
-- set
-- last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_relationships
-- load ownership_relationships
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_relationships.dat'
INTO TABLE ownership_relationships
FIELDS TERMINATED BY '|'
(ownership_relationships_i, application_id, order_number, names, relationship_flg, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_report
-- load ownership_report
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_report.dat'
INTO TABLE ownership_report
FIELDS TERMINATED BY '|'
(application_id, @accurate_date, non_attributable_ind, attributable_ind, related_ind, exemption_ind, owner_type, entity_control_ind, separate_form_ind, attrib_exemption_ind, capitalization_na, contract_info_na, individuals_related_ind, lic_frn, lic_name, org_chart_na, respondent_nature_flg, resp_interests_na, @last_update_date)
set
accurate_date = str_to_date(@accurate_date, '%m/%d/%Y'),
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- ownership_structure
-- load ownership_structure
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/ownership_structure.dat'
INTO TABLE ownership_structure
FIELDS TERMINATED BY '|'
(ownership_structure_id, application_id, name_address, gender_flg, ethnicity_flg, race_flg, citizenship, positional_int, votes_perc, equity_perc, active_ind, office_held, interest_perc, occupation, appointed_by, existing_interests, order_number, assets_perc, entity_exemption_ind, frn, listing_type_flg, personal_info_na, positional_int_crd, positional_int_dir, positional_int_gen, positional_int_inv, positional_int_lim, positional_int_llc, positional_int_off, positional_int_oth, positional_int_own, positional_int_stk, positional_int_other_info, relationship_flg, name, city, country, state, street_address1, street_address2, zip1, zip2, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- party
-- load party
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/party.dat'
INTO TABLE party
FIELDS TERMINATED BY '|'
(party_id, party_address1, party_address2, party_citizenship, party_city, party_company, party_country, party_email, party_fax, party_legal_name, party_name, party_phone, party_state, party_zip1, party_zip2, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- positional_int
-- load positional_int
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/positional_int.dat'
INTO TABLE positional_int
FIELDS TERMINATED BY '|'
(application_id, citizenship, name_address, equity_perc, votes_perc, title, boardmember_ind, membership_perc, owner_perc, assets_perc, order_number, @last_update_date)
set
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- supp_facility
-- load supp_facility
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/supp_facility.dat'
INTO TABLE supp_facility
FIELDS TERMINATED BY '|'
(parent_facility_id, supp_type, supp_callsign, supp_fac_status, @status_date, site_number, fac_channel, comm_city, comm_state, @last_update_date)
set
status_date = str_to_date(@status_date, '%m/%d/%Y'),
last_update_date = str_to_date(@last_update_date, '%m/%d/%Y');

-- tv_app_indicators
-- load tv_app_indicators
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/tv_app_indicators.dat'
INTO TABLE tv_app_indicators
FIELDS TERMINATED BY '|'
(ant_struc_reqs_ind, application_id, bt_used_ind, da_ind, elec_bt_prop_ind, int_compl_ind, mech_bt_prop_ind, rule_73_1660_ind, rule_73_607_ind, rule_73_610_ind, rule_73_614_ind, rule_73_685ab_ind, coverage_exhibit_ind, rule_73_685dg_ind, dummy_tx_flag, da_exhibit_ind, rule_74_705_ind, rule_74_706_ind, rule_74_707_ind, rule_73_622_ind, ant_5km_ind, rule_73_62_ind, rule_1_1307_ind, rule_73_625_ind, rad_astr_ind, faa_notified_ind, rule_73_623a_ind, no_rotation_ind, rel_field_values_na, studio_in_comm_ind, rule_73_1690c_3_ind, rule_74_786d_ind, no_suitable_incore_ind, rule_74_786e_wirels_ind, rule_74_786e_agr_ind, rule_74_786e_notif_ind, noise_limited_ind, population_match_ind, maximization_ind, site_number, interference_prot_ind, dts_covers_all_area_ind, dts_coverage_within_area_flg, dts_coverage_contiguous_ind, dts_principal_comm_cover_flg, dts_combined_interference_ind, dts_trans_within_area_ind, dts_elev_pattern_varies_ind, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');

-- tv_eng_data
-- load tv_eng_data
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/tv_eng_data.dat'
INTO TABLE tv_eng_data
FIELDS TERMINATED BY '|'
(ant_input_pwr, ant_max_pwr_gain, ant_polarization, antenna_id, antenna_type, application_id, asrn_na_ind, asrn, aural_freq, avg_horiz_pwr_gain, biased_lat, biased_long, border_code, carrier_freq, docket_num, effective_erp, electrical_deg, elev_amsl, elev_bldg_ag, eng_record_type, fac_zone, facility_id, freq_offset, gain_area, haat_rc_mtr, hag_overall_mtr, hag_rc_mtr, horiz_bt_erp, lat_deg, lat_dir, lat_min, lat_sec, lon_deg, lon_dir, lon_min, lon_sec, loss_area, max_ant_pwr_gain, max_erp_dbk, max_erp_kw, max_haat, mechanical_deg, multiplexor_loss, power_output_vis_dbk, power_output_vis_kw, predict_coverage_area, predict_pop, terrain_data_src_other, terrain_data_src, tilt_towards_azimuth, true_deg, tv_dom_status, upperband_freq, vert_bt_erp, visual_freq, vsd_service, rcamsl_horiz_mtr, ant_rotation, input_trans_line, max_erp_to_hor, trans_line_loss, lottery_group, analog_channel, lat_whole_secs, lon_whole_secs, max_erp_any_angle, station_channel, lic_ant_make, lic_ant_model_num, dt_emission_mask, site_number, elevation_antenna_id, @last_change_date)
set
last_change_date = str_to_date(@last_change_date, '%m/%d/%Y');


-- create indices
CREATE INDEX facility_id2 ON facility (facility_id);
CREATE INDEX facility_id3 ON call_sign_history (facility_id);
CREATE INDEX callsign2 ON call_sign_history (callsign);


--
-- Documentation tables
--

-- doc_attributes
-- load doc_attributes
LOAD DATA LOCAL INFILE '/codedata/FCC/data/public/cdbs/Attributes_tab.txt'
INTO TABLE doc_attributes
FIELDS TERMINATED BY '\t'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r'
(grouping_name, table_name, column_name, entity_name, entity_attribute_name, entity_attribute_definition, key_field, data_type, source_database, source_table, source_column, notes);


-- End SQL