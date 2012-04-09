-- ===============================================================================
--   FCC CDBS Database
--   DESCRIPTION:       This is schema DDL script for the publicly released files under CDBS.
--   URL:               http://transition.fcc.gov/ftp/Bureaus/MB/Databases/cdbs/_readme.html
--   DATA URL:          http://transition.fcc.gov/mb/databases/cdbs/
--   DOCUMENTATION:     http://transition.fcc.gov/mb/databases/cdbs/
--                      ftp://ftp.fcc.gov/pub/Bureaus/MB/Databases/cdbs/_Engineering_Data_Description.pdf
--   
-- ================================================================================

-- ================================================================================
--   mysql SQL DDL Script File
-- ================================================================================

-- ===============================================================================
-- 
--   Generated by:      Greg Elin
--                      See https://github.com/gregelin/FCC-CDBS 
-- 
--   Target Database:   mysql
--   Generated at:      November 23, 2011
--     File name:         fcc_cdbs_ddl_mysql.sql
--   Notes:             Not tested yet
-- 
--   Mappings:          float() to float(13,6)
--                      varchar(40) to varchar(40)
--                      char(12) to char(12)
--                      char(12) to char(12)
--                      varchar(20) to varchar(20)
--                      char(2) to char(2)
--                      varchar(30) to varchar(30)
--                      varchar(60) to varchar(60)
--                      varchar(21) to char(21)
--                      varchar(10) to char(10)
--                      varchar(10) to varchar(10)
--                      char(1) to char(1)
--                      varchar(60) to varchar(60)
--                      float(9,6) to float(8)
--                      char(10) to char(10)
--                      char(2) to char(2)
--                      varchar(60) to varchar(60)
--                      varchar(255) to varchar(255)
--
-- ================================================================================

-- ================================================================================
-- 
--   User-defined data types and mappings

-- SQL schema drop statements
-- --------------------------------------------------------------------
drop table if exists  am_ant_sys;
drop table if exists  am_augs;
drop table if exists  am_eng_data;
drop table if exists  am_towers;
drop table if exists  amcmnts;
drop table if exists  ant_make;
drop table if exists  ant_pattern;
drop table if exists  app_party;
drop table if exists  app_tracking;
drop table if exists  application;
drop table if exists  call_sign_history;
drop table if exists  dtv_agreement_group;
drop table if exists  dtv_allotment;
drop table if exists  dtv_channel_assignments;
drop table if exists  dtv_facility;
drop table if exists  dtv_transition;
drop table if exists  elevation_ant_make;
drop table if exists  elevation_pattern;
drop table if exists  elevation_pattern_addl;
drop table if exists  fac_party;
drop table if exists  facility;
drop table if exists  fm_app_indicators;
drop table if exists  fm_eng_data;
drop table if exists  frn_history;
drop table if exists  fmcmnts;
drop table if exists  gen_app_indicators;
drop table if exists  if_notification;
drop table if exists  int_translator;
drop table if exists  intl_tracking;
drop table if exists  lic_app_indicators;
drop table if exists  nce_factors;
drop table if exists  ownership_capitalization;
drop table if exists  ownership_contract;
drop table if exists  ownership_exemptions;
drop table if exists  ownership_group;
drop table if exists  ownership_interests;
drop table if exists  ownership_other_int;
drop table if exists  ownership_other_int_xml_data;
drop table if exists  ownership_relationships;
drop table if exists  ownership_report;
drop table if exists  ownership_structure;
drop table if exists  party;
drop table if exists  positional_int;
drop table if exists  supp_facility;
drop table if exists  tv_app_indicators;
drop table if exists  tv_eng_data;


-- SQL create table statements
-- --------------------------------------------------------------------

-- am_ant_sys
create table am_ant_sys (
ant_mode    char(3),
ant_sys_id    int NOT NULL,
application_id    int NOT NULL,
aug_count    tinyint,
bad_data_switch    char(1),
domestic_pattern    char(1),
dummy_data_switch    char(1),
efficiency_restricted    float(13,6),
efficiency_theoretical    float(13,6),
feed_circ_other    varchar(255),
feed_circ_type    char(2),
hours_operation    char(1) NOT NULL,
lat_deg    int,
lat_dir    char(1),
lat_min    int,
lat_sec    float(13,6),
lon_deg    int,
lon_dir    char(1),
lon_min    int,
lon_sec    float(13,6),
q_factor    float(13,6),
q_factor_custom_ind    char(1),
power    float(13,6),
rms_augmented    float(13,6),
rms_standard    float(13,6),
rms_theoretical    float(13,6),
tower_count    tinyint,
eng_record_type    char(1),
biased_lat    float(13,6),
biased_long    float(13,6),
mainkey    char(16),
am_dom_status    char(1),
lat_whole_secs    int,
lon_whole_secs    int,
ant_dir_ind    char(1),
grandfathered_ind    char(1),
specified_hrs_range    varchar(25),
augmented_ind    char(1),
last_update_date    date
);

-- am_augs
create table am_augs (
ant_sys_id    int NOT NULL,
aug_id    tinyint NOT NULL,
azimuth_deg    float(13,6),
radiation_aug    float(13,6),
span_deg    float(13,6),
last_update_date    date
);

-- am_eng_data
create table am_eng_data (
ant_monitor    varchar(60),
application_id    int NOT NULL,
broadcast_schedule    char(1),
encl_fence_dist    float(13,6),
facility_id    int NOT NULL,
sampl_sys_ind    char(1),
station_class    char(1),
time_zone    char(1),
region_2_class    char(1),
am_dom_status    char(1),
old_station_class    char(2),
specified_hours    varchar(255),
feed_circ_other    varchar(255),
feed_circ_type    varchar(2),
last_update_date    date
);

-- am_towers
create table am_towers (
ant_sys_id    int NOT NULL,
asrn_id    int,
elec_hgt_deg    float(13,6),
field_ratio    float(13,6),
hag_no_obst    float(13,6),
hgt_overall_mtr    float(13,6),
hgt_rad_ab    float(13,6),
hgt_radiator_mtr    float(13,6),
orientation_deg    float(13,6),
phasing_deg    float(13,6),
rad_hgt_deg    float(13,6),
spacing_deg    float(13,6),
top_loaded_switch    char(1),
topload_a    float(13,6),
topload_b    float(13,6),
topload_c    float(13,6),
topload_d    float(13,6),
tower_num    tinyint NOT NULL,
tower_pl_codes    varchar(40),
tower_ref_switch    char(1),
asrn_na_ind    char(1),
topload_apparent_hgt    float(13,6),
faa_notified_ind    char(1),
tower_type    char(1),
last_update_date    date
);

-- amcmnts
create table amcmnts (
application_id    int,
comment_type    char(5),
comment    varchar(250)
);

-- ant_make
create table ant_make (
antenna_id    int NOT NULL,
ant_make    char(3) NOT NULL,
ant_model_num    char(60) NOT NULL,
app_service    char(2) NOT NULL,
standard_ind    char(1),
last_change_date    date
);

-- ant_pattern
create table ant_pattern (
antenna_id    int NOT NULL,
azimuth    float(13,6) NOT NULL,
field_value    float(13,6) NOT NULL,
additional_az_num    smallint,
last_change_date    date
);

-- app_party
create table app_party (
application_id    int NOT NULL,
party_id    int NOT NULL,
party_type    char(5) NOT NULL,
cert_title    varchar(60),
cert_date    date,
other_fcc_id    int,
party_notify_ind    char(1),
party_relationship    varchar(255),
sig_present_ind    char(1),
sig_name    varchar(60),
last_change_date    date
);

-- app_tracking
create table app_tracking (
application_id    int NOT NULL,
app_status_date    date,
cutoff_date    date,
cutoff_type    char(1),
cp_exp_date    date,
app_status    varchar(5),
dtv_checklist    varchar(1),
amendment_stamped_date    date,
accepted_date    date,
tolling_code    char(1),
last_change_date    date
);

-- application
create table application (
app_arn    char(12),
app_service    char(2) NOT NULL,
application_id    int NOT NULL,
facility_id    int NOT NULL,
file_prefix    varchar(10),
comm_city    varchar(20),
comm_state    char(2),
fac_frequency    float(13,6),
station_channel    int,
fac_callsign    char(12),
general_app_service    varchar(2),
app_type    varchar(4),
paper_filed_ind    char(1),
dtv_type    varchar(8),
frn    varchar(10),
shortform_app_arn    varchar(12),
shortform_file_prefix    varchar(10),
corresp_ind    char(1),
assoc_facility_id    int,
network_affil    varchar(100),
sat_tv_ind    char(1),
comm_county    char(20),
comm_zip1    char(5),
comm_zip2    char(4),
last_change_date    date
);

-- call_sign_history
create table call_sign_history (
begin_date    date,
callsign    char(12),
callsign_hist_id    int,
callsign_seq_id    tinyint NOT NULL,
facility_id    int NOT NULL,
record_change_date    date
);

-- dtv_agreement_group
create table dtv_agreement_group (
application_id    int NOT NULL,
fac_callsign    char(12),
facility_id    int,
order_num    int,
dtv_agreement_group_id    int NOT NULL,
name    varchar(60),
last_change_date    date
);

-- dtv_allotment
create table dtv_allotment (
state    char(2) NOT NULL,
city    varchar(20) NOT NULL,
analog_channel    int,
digital_channel    int NOT NULL,
erp    float(13,6),
haat    float(13,6),
lat_deg    int,
lat_dir    char(1),
lat_min    int,
lat_sec    int,
lon_deg    int,
lon_dir    char(1),
lon_min    int,
lon_sec    int,
biased_lat    float(13,6),
biased_long    float(13,6),
last_change_date    date
);

-- dtv_channel_assignments
create table dtv_channel_assignments (
facility_id    int NOT NULL,
state    char(2),
city    char(20),
ntsc_channel    int,
post_dtv_channel    int,
erp    float(13,6),
haat    float(13,6),
antenna_id    int,
latitude    char(7),
longitude    char(8),
rcamsl    int,
ref_azimuth    smallint,
da_ind    char(1),
pre_dtv_channel    int,
callsign    varchar(12)
);

-- dtv_facility
create table dtv_facility (
facility_id    int NOT NULL,
dtv_fac_status    char(5),
dtv_channel    int,
last_change_date    date
);

-- dtv_transition
create table dtv_transition (
dtv_cur_channel    int,
application_id    int NOT NULL,
dtv_cur_na    char(1),
ntsc_cur_channel    int,
ntsc_cur_na    char(1),
rep_max_cert    char(1),
file_prefix_cer_a    char(10),
app_arn_cer_a    char(12),
file_prefix_cer_b    char(10),
app_arn_cer_b    char(12),
file_prefix_cer_d    char(10),
app_arn_cer_d    char(12),
rep_max_cer_type    char(3),
file_prefix_cer_e    char(10),
app_arn_cer_e    char(12),
data_cert_ind    char(1),
election    char(1),
elected_channel_a    int,
elected_channel_b    int,
alt_elected_channel    int,
intl_coord_ind    char(1),
cont_election    char(1),
cont_elected_channel    int,
conflict_decision    char(1),
reference_no    int,
negot_agreemt_ind    char(1),
tech_eng_ind    char(1),
tent_chan_status    char(1),
tentative_channel    int,
post_tran_dtv_channel    int,
pre_tran_dtv_channel    int,
post_tran_auth_file_prefix char(10),
post_tran_auth_app_arn    char(12),
post_tran_auth_not_yet_ind char(1),
construction_deadline_dat    date,
post_tran_operating_ind    char(1),
op_status    char(3),
op_expected_date    date,
op_power_level    float(13,6),
op_population_perc    float(13,6),
construction_complete_ind char(1),
expect_cons_complete_date    date,
const_not_begun    char(1),
const_underway    char(1),
const_addl_needed    char(1),
cp_status_ind    char(1),
cp_mod_needed_ind    char(1),
cp_mod_filed_ind    char(1),
cp_mod_file_prefix    char(10),
cp_mod_app_arn    char(12),
cp_mod_filed_date    date,
cp_mod_expected_date    date,
addl_fcc_action_ind    char(1),
addl_fcc_action_app_arn    char(12),
addl_fcc_action_file_pref char(10),
addl_fcc_action_date    date,
addl_intl_ind    char(1),
addl_faa_approval_ind    char(1),
addl_local_approval_ind    char(1),
addl_equip_ind    char(1),
addl_equip_new_ant_ind    char(1),
addl_equip_adj_ant_ind    char(1),
addl_equip_switch_ant_ind char(1),
addl_equip_new_trans_ind    char(1),
addl_equip_adj_trans_ind    char(1),
addl_equip_gen_install_ind char(1),
addl_equip_other_ind    char(1),
addl_tower_ind    char(1),
addl_coord_ind    char(1),
addl_other_ind    char(1),
analog_service_status    varchar(12),
analog_status_ind    char(1),
dtv_transition_plan_ind    char(1),
addl_steps_ind    char(1),
analog_nightlight_ind    char(1),
analog_turnoff_pn_compl_flg char(1),
binding_termination_flg    varchar(5),
termination_date_not_aff    date,
termination_date_aff    date,
aff_term_cert_flg    varchar(5),
cont_analog_flg    varchar(5),
phone_help_ctr_flg    varchar(5),
walkin_help_ctr_flg    varchar(5),
st_analog_nightlight_ind    char(1),
st_analog_nightlight_end_    date,
inf_analog_nightlight_ind char(1),
inf_analog_nightlight_end    date,
early_term_withdraw_ind    char(1),
termination_time_0612_flg varchar(5),
termination_date_nce    date,
termination_time_nce_flg    varchar(5),
termination_time_notaff_flg varchar(5),
termination_time_aff_flg    varchar(5),
nce_term_cert_flg    char(1),
ref_contact_phone    char(10),
ref_contact_hours    varchar(60),
an_participation_notice_ind char(1),
an_eligibility_showing_ind char(1),
an_objection_to_elig_showg_ind char(1),
an_objection_callsign    char(12),
an_revocation_ind    char(1),
last_update_date    date
);

-- elevation_ant_make
create table elevation_ant_make (
ant_make    char(3) NOT NULL,
ant_model_num    char(60) NOT NULL,
elevation_antenna_id    int NOT NULL,
ant_comment    varchar(255)
);

-- elevation_pattern
create table elevation_pattern (
depression_angle    float(13,6) NOT NULL,
field_value    float(13,6),
field_value0    float(13,6),
field_value10    float(13,6),
field_value20    float(13,6),
field_value30    float(13,6),
field_value40    float(13,6),
field_value50    float(13,6),
field_value60    float(13,6),
field_value70    float(13,6),
field_value80    float(13,6),
field_value90    float(13,6),
field_value100    float(13,6),
field_value110    float(13,6),
field_value120    float(13,6),
field_value130    float(13,6),
field_value140    float(13,6),
field_value150    float(13,6),
field_value160    float(13,6),
field_value170    float(13,6),
field_value180    float(13,6),
field_value190    float(13,6),
field_value200    float(13,6),
field_value210    float(13,6),
field_value220    float(13,6),
field_value230    float(13,6),
field_value240    float(13,6),
field_value250    float(13,6),
field_value260    float(13,6),
field_value270    float(13,6),
field_value280    float(13,6),
field_value290    float(13,6),
field_value300    float(13,6),
field_value310    float(13,6),
field_value320    float(13,6),
field_value330    float(13,6),
field_value340    float(13,6),
field_value350    float(13,6),
elevation_antenna_id    int NOT NULL,
last_update_date    date
);

-- elevation_pattern_addl
create table elevation_pattern_addl (
site_number    tinyint NOT NULL,
depression_angle    float(13,6) NOT NULL,
azimuth    float(13,6) NOT NULL,
field_value    float(13,6) NOT NULL,
additional_az_num    smallint,
elevation_antenna_id    int,
last_update_date    date
);

-- fac_party
create table fac_party (
facility_id    int NOT NULL,
party_id    int NOT NULL,
party_type    char(5) NOT NULL,
last_change_date    date
);

-- facility
create table facility (
comm_city    varchar(20),
comm_state    char(2),
eeo_rpt_ind    char(1),
fac_address1    varchar(40),
fac_address2    varchar(40),
fac_callsign    char(12),
fac_channel    int,
fac_city    varchar(20),
fac_country    char(2),
fac_frequency    float(6,1),
fac_service    char(2),
fac_state    char(2),
fac_status_date    date,
fac_type    varchar(3),
facility_id    int NOT NULL,
lic_expiration_date    date,
fac_status    varchar(5),
fac_zip1    char(5),
fac_zip2    char(4),
station_type    char(1),
assoc_facility_id    int,
callsign_eff_date    date,
tsid_ntsc    int,
tsid_dtv    int,
digital_status    char(1),
sat_tv    char(1),
network_affil    varchar(100),
nielsen_dma    varchar(60),
last_change_date    date
);

-- fm_app_indicators
create table fm_app_indicators (
application_id    int NOT NULL,
bt_ind    char(1),
da_ind    char(1),
no_rotation_ind    varchar(1),
rule_73_215_req_ind    char(1),
last_change_date    date
);

-- fm_eng_data
create table fm_eng_data (
ant_input_pwr    float(13,6),
ant_max_pwr_gain    float(13,6),
ant_polarization    char(1),
ant_rotation    float(13,6),
antenna_id    int,
antenna_type    char(1),
application_id    int NOT NULL,
asd_service    char(2),
asrn_na_ind    char(1),
asrn    int,
avg_horiz_pwr_gain    float(13,6),
biased_lat    float(13,6),
biased_long    float(13,6),
border_code    char(1),
border_dist    float(13,6),
docket_num    varchar(20),
effective_erp    float(13,6),
elev_amsl    float(13,6),
elev_bldg_ag    float(13,6),
eng_record_type    char(1),
facility_id    int NOT NULL,
fm_dom_status    varchar(6),
gain_area    float(13,6),
haat_horiz_rc_mtr    float(13,6),
haat_vert_rc_mtr    float(13,6),
hag_horiz_rc_mtr    float(13,6),
hag_overall_mtr    float(13,6),
hag_vert_rc_mtr    float(13,6),
horiz_bt_erp    float(13,6),
horiz_erp    float(13,6),
lat_deg    int,
lat_dir    char(1),
lat_min    int,
lat_sec    float(13,6),
lon_deg    int,
lon_dir    char(1),
lon_min    int,
lon_sec    float(13,6),
loss_area    float(13,6),
max_ant_pwr_gain    float(13,6),
max_haat    float(13,6),
max_horiz_erp    float(13,6),
max_vert_erp    float(13,6),
multiplexor_loss    float(13,6),
power_output_vis_kw    float(13,6),
predict_coverage_area    float(13,6),
predict_pop    int,
rcamsl_horiz_mtr    float(13,6),
rcamsl_vert_mtr    float(13,6),
station_class    varchar(2),
terrain_data_src    char(1),
vert_bt_erp    float(13,6),
vert_erp    float(13,6),
num_sections    int,
present_area    float(13,6),
percent_change    float(13,6),
spacing    float(13,6),
terrain_data_src_other    varchar(255),
trans_power_output    float(13,6),
mainkey    char(16),
lat_whole_secs    int,
lon_whole_secs    int,
station_channel    int,
lic_ant_make    varchar(3),
lic_ant_model_num    varchar(60),
min_horiz_erp    float(13,6),
haat_horiz_calc_ind    char(1),
erp_w    int,
trans_power_output_w    int,
market_group_num    varchar(7),
last_change_date    date
);

-- frn_history
create table frn_history (
frn_history_id    int NOT NULL,
facility_id    int NOT NULL,
frn    varchar(10) NOT NULL,
application_id    int,
date_inserted    date,
valid_ind    char(1)
);

-- fmcmnts
create table fmcmnts (
application_id    int,
comment_type    char(5),
comment    varchar(250)
);

-- gen_app_indicators
create table gen_app_indicators (
application_id    int NOT NULL,
edu_comm_flg    char(1),
last_change_date    date
);

-- if_notification
create table if_notification (
application_id    int NOT NULL,
broadcast_date    date,
ibiquity_cert    char(1),
tech_name    varchar(60),
tech_phone    varchar(20),
combined_power    float(13,6),
analog_power    float(13,6),
digital_power    float(13,6),
analog_remain_ind    char(1),
env_excluded_ind    char(1),
digital_power_reduced    float(13,6),
digital_power_reduced_na    char(1),
ref_file_prefix    char(10),
ref_app_arn    char(12),
test_date    date,
resolved_date    date,
analog_erp    float(13,6),
digital_erp    float(13,6),
last_change_date    date
);

-- int_translator
create table int_translator (
application_id    int NOT NULL,
delivery_method    char(1),
prim_callsign    char(12),
prim_comm_city    varchar(20),
prim_comm_state    char(2),
prim_sta_out_channel    int,
primary_via    varchar(13),
scnd_comm_city    varchar(20),
scnd_comm_state    char(2),
third_comm_city    varchar(20),
third_comm_state    char(2),
trans_input_channel    int,
prim_facility_id    int,
last_change_date    date
);

-- intl_tracking
create table intl_tracking (
accepted_date    date,
application_id    int NOT NULL,
can_coord_status    char(1),
change_list_date    date,
change_list_num    varchar(5),
hours_operation    char(1),
ifrb_date    date,
ifrb_list_flg    char(1),
ifrb_serial_num    char(9),
intl_class    varchar(2),
itu_coord_status    char(1),
mex_coord_status    char(1),
neg_allot_ind    varchar(4),
notified_pattern    char(1),
notified_status    char(1),
proposed_date    date,
referred_date    date,
region_2_status    char(1),
updating_agency    varchar(4),
notified_date    date,
intl_status    char(6),
last_change_date    date
);

-- lic_app_indicators
create table lic_app_indicators (
application_id    int NOT NULL,
auth_retrans_ind    char(1),
chng_transm_pwr_ind    char(1),
cp_stmt_incorrect_ind    char(1),
cp_terms_met_ind    char(1),
da_inst_compl_ind    char(1),
da_inst_correct_ind    char(1),
decr_c_erp_ind    char(1),
decr_nc_erp_ind    char(1),
del_cntr_prot_ind    char(1),
incr_erp_221_ind    char(1),
incr_erp_dckt_ind    char(1),
incr_erp_ind    char(1),
incr_erp_ownr_ind    char(1),
lic_app_service    char(2),
lic_pta_ind    char(1),
nce_to_comm_ind    char(1),
no_intl_coord_ind    char(1),
orig_cp_file_prefix    varchar(10),
orig_cp_app_arn    char(12),
lic_file_prefix    varchar(10),
lic_app_arn    char(12),
rad_astr_not_ind    char(1),
repl_da_compl_ind    char(1),
repl_da_ind    char(1),
rule_73_1620a1_ind    char(1),
rule_73_1675a3_ind    char(1),
rule_73_1675a_ind    char(1),
rule_73_1690c8i_ind    char(1),
rule_73_1690c_ind    char(1),
rule_73_1692_ind    char(1),
rule_73_207_ind    char(1),
rule_73_315ab_ind    char(1),
rule_73_525a1_ind    char(1),
rule_73_68_ind    char(1),
spec_op_conds_ind    char(1),
sta_id_rules_ind    char(1),
stat_ready_ind    char(1),
trans_auth_erp_ind    char(1),
type_appr_stereo_ind    char(1),
inst_ht_dif_ok_ind    char(1),
rule_73_1590    char(1),
rule_73_1660_ind    char(1),
rule_73_1675c_1_ind    char(1),
rule_73_1675c_ind    char(1),
rule_73_1690c9_ind    char(1),
rule_73_3555_ind    char(1),
rule_73_685f_ind    char(1),
rule_73_68d3_ind    char(1),
sales_type_flg    char(1),
conv_lptv_cp_arn    varchar(12),
conv_lptv_cp_prefix    varchar(10),
conv_lptv_lic_arn    varchar(12),
conv_lptv_lic_prefix    varchar(10),
displaced_cp_filed_date    date,
no_change_lp_cp_ind    char(1),
rule_73_6011_ind    char(1),
rule_73_6012_ind    char(1),
rule_73_6013_ind    char(1),
rule_73_6020_ind    char(1),
no_change_to_classa_cp_in char(1),
pta_type    char(1),
repl_trans_line_ind    char(1),
rule_73_850b_ind    char(1),
rule_73_1675a_nc_ind    char(1),
rule_73_1675a_ax_ind    char(1),
orig_cp_app_expiration_date    date,
record_change_date    date
);

-- nce_factors
create table nce_factors (
application_id    int NOT NULL,
claimed_points    int,
existing_auths    int,
existing_cps    int,
existing_fillin_auths    int,
existing_fillin_cps    int,
fill_in_serv_ind    char(1),
gain_area    int,
population_served    int,
rule_73_313_c_ind    char(1),
rule_73_3555_ind    char(1),
rule_73_7000_ind    char(1),
rule_73_7003_b_c_ind    char(1),
technical_points    int,
total_points    int,
divers_own_ind    char(1),
min_first_service_ind    char(1),
min_sec_service_ind    char(1),
supplement_date    date,
first_aural_service_ind    char(1),
first_tribal_service_ind    char(1),
last_change_date    date
);

-- ownership_capitalization
create table ownership_capitalization (
ownership_capitalization_id int NOT NULL,
application_id    int NOT NULL,
class_of_stock    varchar(60),
voting_ind    char(1),
authorized_shares    float(13,6),
issued_shares    float(13,6),
treasury_shares    float(13,6),
unissued_shares    float(13,6),
order_number    smallint,
class_of_stock_flg    char(1),
class_of_stock_other    varchar(20),
voting_flg    char(1),
last_update_date    date
);

-- ownership_contract
create table ownership_contract (
ownership_contract_id    int NOT NULL,
application_id    int NOT NULL,
contract_description    varchar(255),
contract_person    varchar(255),
execution_date    date,
expiration_date    date,
order_number    smallint,
agreement_type_lma    char(1),
agreement_type_naa    char(1),
agreement_type_oth    char(1),
execution_date_month    char(3),
execution_date_year    smallint,
expiration_date_month    char(3),
expiration_date_year    smallint,
expiration_date_na    char(1),
last_update_date    date
);

-- ownership_exemptions
create table ownership_exemptions (
ownership_exemptions_id    int NOT NULL,
application_id    int NOT NULL,
order_number    smallint NOT NULL,
name    varchar(150),
title    varchar(60),
last_update_date    date
);

-- ownership_group
create table ownership_group (
ownership_group_id    int NOT NULL,
main_application_id    int NOT NULL,
fac_callsign    varchar(12),
facility_id    int NOT NULL,
fac_service    varchar(2),
comm_city    varchar(20),
comm_state    varchar(2),
fac_service_o    varchar(2),
app_arn    varchar(12),
file_prefix    char(10),
order_number    smallint,
last_update_date    date
);

-- ownership_interests
create table ownership_interests (
ownership_interests_id    int NOT NULL,
application_id    int NOT NULL,
order_number    smallint NOT NULL,
frn    varchar(10),
name    varchar(150),
last_update_date    date
);

-- ownership_other_int
create table ownership_other_int (
ownership_other_int_id    int NOT NULL,
application_id    int NOT NULL,
order_number    smallint NOT NULL,
assets_perc    decimal(4,1),
comm_city    varchar(20),
comm_state    char(2),
entity_type    char(1),
equity_perc    decimal(4,1),
fac_callsign    varchar(12),
facility_id    int,
name    varchar(150),
newspaper    varchar(150),
positional_int_off    char(1),
positional_int_dir    char(1),
positional_int_par    char(1),
positional_int_lim    char(1),
positional_int_stk    char(1),
positional_int_own    char(1),
positional_int_ent    char(1),
positional_int_oth    char(1),
positional_int_other_info varchar(20),
votes_perc    decimal(4,1),
last_update_date    date
);

-- ownership_other_int_xml_data
create table ownership_other_int_xml_data (
application_id    int NOT NULL,
file_id    int NOT NULL,
order_number    smallint NOT NULL,
assets_perc    decimal(4,1),
comm_city    varchar(20),
comm_state    char(2),
entity_type    char(1),
equity_perc    decimal(4,1),
fac_callsign    varchar(12),
facility_id    int,
name    varchar(150),
newspaper    varchar(150),
positional_int_off    char(1),
positional_int_dir    char(1),
positional_int_par    char(1),
positional_int_lim    char(1),
positional_int_stk    char(1),
positional_int_own    char(1),
positional_int_ent    char(1),
positional_int_oth    char(1),
positional_int_other_info varchar(20),
votes_perc    decimal(4,1),
last_update_date    date
);

-- ownership_relationships
create table ownership_relationships (
ownership_relationships_i int NOT NULL,
application_id    int NOT NULL,
order_number    smallint NOT NULL,
names    varchar(255),
relationship_flg    char(2),
last_update_date    date
);

-- ownership_report
create table ownership_report (
application_id    int NOT NULL,
accurate_date    date,
non_attributable_ind    char(1),
attributable_ind    char(1),
related_ind    char(1),
exemption_ind    char(1),
owner_type    varchar(5),
entity_control_ind    char(1),
separate_form_ind    char(1),
attrib_exemption_ind    char(1),
capitalization_na    char(1),
contract_info_na    char(1),
individuals_related_ind    char(1),
lic_frn    varchar(10),
lic_name    varchar(60),
org_chart_na    char(1),
respondent_nature_flg    char(3),
resp_interests_na    char(1),
last_update_date    date
);

-- ownership_structure
create table ownership_structure (
ownership_structure_id    int NOT NULL,
application_id    int NOT NULL,
name_address    varchar(255),
gender_flg    char(1),
ethnicity_flg    varchar(5),
race_flg    varchar(5),
citizenship    char(2),
positional_int    varchar(60),
votes_perc    decimal(5,2),
equity_perc    decimal(5,2),
active_ind    char(1),
office_held    varchar(60),
interest_perc    decimal(5,2),
occupation    varchar(60),
appointed_by    varchar(60),
existing_interests    varchar(255),
order_number    smallint,
assets_perc    decimal(5,2),
entity_exemption_ind    char(1),
frn    varchar(10),
listing_type_flg    char(1),
personal_info_na    char(1),
positional_int_crd    char(1),
positional_int_dir    char(1),
positional_int_gen    char(1),
positional_int_inv    char(1),
positional_int_lim    char(1),
positional_int_llc    char(1),
positional_int_off    char(1),
positional_int_oth    char(1),
positional_int_own    char(1),
positional_int_stk    char(1),
positional_int_other_info varchar(20),
relationship_flg    char(1),
name    varchar(150),
city    varchar(20),
country    varchar(20),
state    char(2),
street_address1    varchar(60),
street_address2    varchar(60),
zip1    char(5),
zip2    char(4),
last_update_date    date
);

-- party
create table party (
party_id    int NOT NULL,
party_address1    varchar(40),
party_address2    varchar(40),
party_citizenship    char(2),
party_city    varchar(20),
party_company    varchar(60),
party_country    char(2),
party_email    varchar(60),
party_fax    char(10),
party_legal_name    varchar(255),
party_name    varchar(60),
party_phone    char(10),
party_state    char(2),
party_zip1    char(5),
party_zip2    char(4),
last_change_date    date
);

-- positional_int
create table positional_int (
application_id    int NOT NULL,
citizenship    char(2),
name_address    varchar(250) NOT NULL,
equity_perc    float(9,6),
votes_perc    float(9,6),
title    varchar(60),
boardmember_ind    char(1),
membership_perc    float(13,6),
owner_perc    float(13,6),
assets_perc    float(13,6),
order_number    smallint,
last_update_date    date
);

-- supp_facility
create table supp_facility (
parent_facility_id    int NOT NULL,
supp_type    varchar(5) NOT NULL,
supp_callsign    varchar(12) NOT NULL,
supp_fac_status    varchar(5),
status_date    date,
site_number    tinyint NOT NULL,
fac_channel    int,
comm_city    char(20),
comm_state    char(2),
last_update_date    date
);

-- tv_app_indicators
create table tv_app_indicators (
ant_struc_reqs_ind    char(1),
application_id    int NOT NULL,
bt_used_ind    char(1),
da_ind    char(1),
elec_bt_prop_ind    char(1),
int_compl_ind    char(1),
mech_bt_prop_ind    char(1),
rule_73_1660_ind    char(1),
rule_73_607_ind    char(1),
rule_73_610_ind    char(1),
rule_73_614_ind    char(1),
rule_73_685ab_ind    char(1),
coverage_exhibit_ind    char(1),
rule_73_685dg_ind    char(1),
dummy_tx_flag    char(1),
da_exhibit_ind    char(1),
rule_74_705_ind    char(1),
rule_74_706_ind    char(1),
rule_74_707_ind    char(1),
rule_73_622_ind    char(1),
ant_5km_ind    char(1),
rule_73_62_ind    char(1),
rule_1_1307_ind    char(1),
rule_73_625_ind    char(1),
rad_astr_ind    char(1),
faa_notified_ind    char(1),
rule_73_623a_ind    char(1),
no_rotation_ind    varchar(1),
rel_field_values_na    char(1),
studio_in_comm_ind    char(1),
rule_73_1690c_3_ind    char(1),
rule_74_786d_ind    char(1),
no_suitable_incore_ind    char(1),
rule_74_786e_wirels_ind    char(1),
rule_74_786e_agr_ind    char(1),
rule_74_786e_notif_ind    char(1),
noise_limited_ind    char(1),
population_match_ind    char(1),
maximization_ind    char(1),
site_number    tinyint NOT NULL,
interference_prot_ind    char(1),
dts_covers_all_area_ind    char(1),
dts_coverage_within_area_flg    varchar(2),
dts_coverage_contiguous_ind    char(1),
dts_principal_comm_cover_flg    varchar(2),
dts_combined_interference_ind    char(1),
dts_trans_within_area_ind    char(1),
dts_elev_pattern_varies_ind    char(1),
last_change_date    date
);

-- tv_eng_data
create table tv_eng_data (
ant_input_pwr    float(18),
ant_max_pwr_gain    float(18),
ant_polarization    char(1),
antenna_id    int,
antenna_type    char(1),
application_id    int NOT NULL,
asrn_na_ind    varchar(1),
asrn    int,
aural_freq    float(18),
avg_horiz_pwr_gain    float(18),
biased_lat    float(18),
biased_long    float(18),
border_code    char(1),
carrier_freq    float(18),
docket_num    varchar(20),
effective_erp    float(18),
electrical_deg    float(18),
elev_amsl    float(18),
elev_bldg_ag    float(18),
eng_record_type    char(1),
fac_zone    varchar(3),
facility_id    int NOT NULL,
freq_offset    char(1),
gain_area    float(18),
haat_rc_mtr    float(18),
hag_overall_mtr    float(18),
hag_rc_mtr    float(18),
horiz_bt_erp    float(18),
lat_deg    int,
lat_dir    char(1),
lat_min    int,
lat_sec    float(18),
lon_deg    int,
lon_dir    char(1),
lon_min    int,
lon_sec    float(18),
loss_area    float(18),
max_ant_pwr_gain    float(18),
max_erp_dbk    float(18),
max_erp_kw    float(18),
max_haat    float(18),
mechanical_deg    float(18),
multiplexor_loss    float(18),
power_output_vis_dbk    float(18),
power_output_vis_kw    float(18),
predict_coverage_area    float(18),
predict_pop    int,
terrain_data_src_other    varchar(255),
terrain_data_src    char(3),
tilt_towards_azimuth    float(18),
true_deg    float(18),
tv_dom_status    varchar(6),
upperband_freq    float(18),
vert_bt_erp    float(18),
visual_freq    float(18),
vsd_service    char(2),
rcamsl_horiz_mtr    float(18),
ant_rotation    float(18),
input_trans_line    float(18),
max_erp_to_hor    float(18),
trans_line_loss    float(18),
lottery_group    int,
analog_channel    int,
lat_whole_secs    int,
lon_whole_secs    int,
max_erp_any_angle    float(18),
station_channel    int,
lic_ant_make    varchar(3),
lic_ant_model_num    varchar(60),
dt_emission_mask    char(1),
site_number    tinyint NOT NULL,
elevation_antenna_id    int,
last_change_date    date
);

--
-- Documentation tables
--

drop table if exists  doc_attributes;

-- doc_attributes
create table doc_attributes (
grouping_name    varchar(24),
table_name    varchar(32),
column_name    varchar(32),
entity_name    varchar(60),
entity_attribute_name    varchar(120),
entity_attribute_definition    varchar(255),
key_field    varchar(12),
data_type    varcharhar(12),
source_database    varchar(24),
source_table    varchar(72),
source_column    varchar(72),
notes    varchar(255)
);



-- End SQL