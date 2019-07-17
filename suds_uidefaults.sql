set define '^'
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
 
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to sqlplus as the schema associated with the UI defaults or as the product schema.
  wwv_flow_api.set_security_group_id(p_security_group_id=>17994006810700138265);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to install this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'SUDS';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA SUDS - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_040200
-- Exported 10:06 Wednesday May 29, 2019 by: C799590
--
 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'APP_APPLICATION');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'APP_APPLICATION',
  p_report_region_title => 'App Application',
  p_form_region_title => 'App Application');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Application Environment',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952028394944134 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'APPLICATION_ENVIRONMENT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Brm',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952406718944136 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'BRM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Id',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952914917944137 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Name',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952123172944134 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Created By',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952700107944136 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'CREATED_BY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'End Date',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2329952602103944136 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'END_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2329952827272944137 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Updated By',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 20,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329953216443944137 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_UPDATED_BY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Portfolio',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952319737944136 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'PORTFOLIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Service Type',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952206808944136 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICE_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Shared Infrastructure',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 10,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329951923165944134 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'SHARED_INFRASTRUCTURE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Source',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 50,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2329952506761944136 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'SOURCE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Start Date',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2329953005856944137 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'START_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Update Date',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2329953117268944137 + wwv_flow_api.g_id_offset,
  p_table_id => 2329951831631944134 + wwv_flow_api.g_id_offset,
  p_column_name => 'UPDATE_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'AUTH_USERS');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 2802462427062877003 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'AUTH_USERS',
  p_report_region_title => 'Auth Users',
  p_form_region_title => 'Auth Users');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Access Level',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2802462829472877007 + wwv_flow_api.g_id_offset,
  p_table_id => 2802462427062877003 + wwv_flow_api.g_id_offset,
  p_column_name => 'ACCESS_LEVEL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2802462515617877005 + wwv_flow_api.g_id_offset,
  p_table_id => 2802462427062877003 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Name',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2802462703812877007 + wwv_flow_api.g_id_offset,
  p_table_id => 2802462427062877003 + wwv_flow_api.g_id_offset,
  p_column_name => 'NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Userid',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 7,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2802462628430877007 + wwv_flow_api.g_id_offset,
  p_table_id => 2802462427062877003 + wwv_flow_api.g_id_offset,
  p_column_name => 'USERID');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'CUSTOMISED_REPORT_HDR');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 3433774218007622814 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'CUSTOMISED_REPORT_HDR',
  p_report_region_title => 'Customised Report Hdr',
  p_form_region_title => 'Customised Report Hdr');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3433774316284622840 + wwv_flow_api.g_id_offset,
  p_table_id => 3433774218007622814 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Report Name',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3433774404778622845 + wwv_flow_api.g_id_offset,
  p_table_id => 3433774218007622814 + wwv_flow_api.g_id_offset,
  p_column_name => 'REPORT_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Report Ts',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3433774506301622845 + wwv_flow_api.g_id_offset,
  p_table_id => 3433774218007622814 + wwv_flow_api.g_id_offset,
  p_column_name => 'REPORT_TS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Report User',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3433774629964622846 + wwv_flow_api.g_id_offset,
  p_table_id => 3433774218007622814 + wwv_flow_api.g_id_offset,
  p_column_name => 'REPORT_USER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3433774704988622846 + wwv_flow_api.g_id_offset,
  p_table_id => 3433774218007622814 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_ASSET_PLATFORM_DRIVER');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_ASSET_PLATFORM_DRIVER',
  p_report_region_title => 'Sv Asset Platform Driver',
  p_form_region_title => 'Sv Asset Platform Driver');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Alias',
  p_display_seq_form => 40,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 40,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043718707121162778 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALIAS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Asset Src Table',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043722921231162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'ASSET_SRC_TABLE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Capacityplaning Contact',
  p_display_seq_form => 28,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 28,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720118188162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'CAPACITYPLANING_CONTACT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Cloudrightalignment',
  p_display_seq_form => 34,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 34,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720727538162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'CLOUDRIGHTALIGNMENT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Compute Sme',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719914624162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMPUTE_SME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Domain',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720914844162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOMAIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Engine Nbr Id',
  p_display_seq_form => 44,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_SELECT_LIST',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'SELECT_LIST_FROM_LOV',
  p_display_seq_report => 44,
  p_display_in_report => 'Y',
  p_display_as_report => 'TEXT_FROM_LOV',
  p_aggregate_by => 'N',
  p_lov_query => 'select ENGINE_NBR d, ENGINE_NBR_ID v from ENGINE_NBR_LOOKUP order by 1',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 6043719103536162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'ENGINE_NBR_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Execution Notes',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721404522162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'EXECUTION_NOTES');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Execution Order',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 6043721514548162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'EXECUTION_ORDER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Execution Status',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721614081162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'EXECUTION_STATUS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Financial Bid Information',
  p_display_seq_form => 29,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 29,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720315029162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'FINANCIAL_BID_INFORMATION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Gm  Snr Mgr Psr',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720228781162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'GM__SNR_MGR_PSR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 6043722213710162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Infrastructure Grouping',
  p_display_seq_form => 42,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 42,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043718903044162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'INFRASTRUCTURE_GROUPING');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Its Owner Or Constructor',
  p_display_seq_form => 36,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 36,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721707321162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'ITS_OWNER_OR_CONSTRUCTOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Jiraproblemdescriptions',
  p_display_seq_form => 31,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 31,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720506631162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'JIRAPROBLEMDESCRIPTIONS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Jiraproblem Nbr',
  p_display_seq_form => 30,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 30,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720411805162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'JIRAPROBLEM_NBR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lead Or Sub Constructor',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719211213162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'LEAD_OR_SUB_CONSTRUCTOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Lifecyclestage',
  p_display_seq_form => 33,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 33,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719810475162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'LIFECYCLESTAGE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Life Cycle State',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721008310162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'LIFE_CYCLE_STATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Load Ts',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 6043722620394162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'LOAD_TS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Network Sme',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719505325162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'NETWORK_SME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Parent Platform Driver Id',
  p_display_seq_form => 39,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 39,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 6043722102458162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PARENT_PLATFORM_DRIVER_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Class',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721800470162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_CLASS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Class Execution Order',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 6043719723336162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_CLASS_EXECUTION_ORDER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Compute',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721127814162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_COMPUTE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Costs',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043722816930162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_COSTS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Description',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043722722823162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_DESCRIPTION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Gl Class',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719632427162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_GL_CLASS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Name',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043722326073162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Network',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721321240162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_NETWORK');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Storage',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 30,
  p_max_width => 1,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043721207952162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_STORAGE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Tower',
  p_display_seq_form => 41,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 41,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043718831389162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_TOWER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Platform Type',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043722412033162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PLATFORM_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Project Stage',
  p_display_seq_form => 35,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 35,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 2000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720809961162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROJECT_STAGE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Psm Platform Sme Mgr',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719302799162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PSM_PLATFORM_SME_MGR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Pts Platform Technical Sme',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719405391162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'PTS_PLATFORM_TECHNICAL_SME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Risk Table Score',
  p_display_seq_form => 32,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 32,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720606085162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'RISK_TABLE_SCORE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Search Sql',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043722527363162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_SQL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Search Type',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043723020123162784 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Storage Sme',
  p_display_seq_form => 27,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 27,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043720008011162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'STORAGE_SME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Strategicdirection',
  p_display_seq_form => 43,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 43,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043719002778162782 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'STRATEGICDIRECTION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Verified By',
  p_display_seq_form => 38,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 38,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 6043722023290162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'VERIFIED_BY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Verified Date',
  p_display_seq_form => 37,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 37,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 6043721910816162783 + wwv_flow_api.g_id_offset,
  p_table_id => 6043718612454162739 + wwv_flow_api.g_id_offset,
  p_column_name => 'VERIFIED_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_CHIPSET_LKP');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_CHIPSET_LKP',
  p_report_region_title => 'Sv Chipset Lkp',
  p_form_region_title => 'Sv Chipset Lkp');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Arch',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693122604363702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARCH');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Btu',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122715831702045 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'BTU');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Chip Technology Type',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693123304426702045 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHIP_TECHNOLOGY_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Cores',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693121922135702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'CORES');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Cores Per Channel',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122004583702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'CORES_PER_CHANNEL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Cores Per Processor',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122432290702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'CORES_PER_PROCESSOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Frequency Mhz',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693123421137702046 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'FREQUENCY_MHZ');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ft3',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122920569702045 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'FT3');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693121506376702040 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Loadts',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693123218276702045 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'LOADTS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Memory Mb',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122514650702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'MEMORY_MB');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Model',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693121731314702043 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'MODEL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Model Type1',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693123708427702046 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'MODEL_TYPE1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Processors',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122127440702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROCESSORS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Processor Class',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693121810524702043 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROCESSOR_CLASS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Processor Type',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693123621199702046 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROCESSOR_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Racku',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693123012480702045 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'RACKU');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Src',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_form_attribute_04 => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693123523808702046 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'SRC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Suds Model Class',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693123100525702045 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'SUDS_MODEL_CLASS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Threads',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122220703702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'THREADS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Threads Per Core',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122302967702044 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'THREADS_PER_CORE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Vendor',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 300,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3693121626068702043 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'VENDOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Watts',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 3693122812887702045 + wwv_flow_api.g_id_offset,
  p_table_id => 3693121419094702035 + wwv_flow_api.g_id_offset,
  p_column_name => 'WATTS');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_IBM_HAL');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_IBM_HAL',
  p_report_region_title => 'Sv Ibm Hal',
  p_form_region_title => 'Sv Ibm Hal');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Alternateid',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692822952012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'ALTERNATEID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Application',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693131861012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'APPLICATION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Artefact',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756695127678012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'ARTEFACT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Baudate',
  p_display_seq_form => 27,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 27,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692217859012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'BAUDATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Bc Application',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693416525012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'BC_APPLICATION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Business Use',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693504981012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUSINESS_USE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Cluster Name',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693021735012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'CLUSTER_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Dba On Invoice',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693915197012198 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'DBA_ON_INVOICE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'E2e',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756695028228012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'E2E');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'End Date',
  p_display_seq_form => 34,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 34,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2756692100351012196 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'END_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Environment',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693611349012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'ENVIRONMENT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Escalation',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693719134012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'ESCALATION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'File Name',
  p_display_seq_form => 32,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 32,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756691921540012193 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILE_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Fqdn',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694414888012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'FQDN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Frame',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694201304012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'FRAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Global Zone',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692904034012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'GLOBAL_ZONE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Load Ts',
  p_display_seq_form => 33,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 33,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2756692014750012196 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'LOAD_TS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Location',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694107683012199 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'LOCATION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Monitoring',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694013372012199 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'MONITORING');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Oqa',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694719143012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'OQA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Oqadate',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756695219894012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'OQADATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Origin',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694314826012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'ORIGIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Os Name',
  p_display_seq_form => 28,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 28,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692307270012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'OS_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Os Version',
  p_display_seq_form => 29,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 29,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692405935012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'OS_VERSION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Pm',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694907699012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'PM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Pwp',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694806581012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'PWP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Removepwp',
  p_display_seq_form => 30,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 30,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692520361012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'REMOVEPWP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Sa',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694610934012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'SA');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Serverid',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692728741012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVERID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Server Created',
  p_display_seq_form => 31,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 31,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756692615174012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVER_CREATED');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Serviceset',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693810589012198 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICESET');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693325303012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Team',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756693225880012197 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'TEAM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Virtualised',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 255,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2756694518294012200 + wwv_flow_api.g_id_offset,
  p_table_id => 2756691817307012189 + wwv_flow_api.g_id_offset,
  p_column_name => 'VIRTUALISED');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_ITAM_ATTRIBUTES');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_ITAM_ATTRIBUTES',
  p_report_region_title => 'Sv Itam Attributes',
  p_form_region_title => 'Sv Itam Attributes');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Building',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308177129006689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUILDING');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Id',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308175417552689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Name',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308175519642689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comments',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176414200689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMMENTS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Description',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176324672689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPTION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'End Date',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308177408171689461 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'END_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Environment',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176614841689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'ENVIRONMENT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'File Name',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308177508158689461 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILE_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Floor',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308177207852689461 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'FLOOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308175201524689454 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Manufacturer',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176228361689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'MANUFACTURER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Model',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176132589689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'MODEL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Product',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176016565689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRODUCT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Region',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176803804689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'REGION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Room',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308177308100689461 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'ROOM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Search Key',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308175305231689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'SEARCH_KEY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Serial Nbr',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308175630703689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERIAL_NBR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308177014354689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site Group',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176913693689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE_GROUP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176501609689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'System Role',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308176716019689460 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'SYSTEM_ROLE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier1',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308175711623689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier2',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308175816252689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER2');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier3',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308175914599689459 + wwv_flow_api.g_id_offset,
  p_table_id => 308175130992689441 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER3');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_ITAM_ATTRIBUTES_VW');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_ITAM_ATTRIBUTES_VW',
  p_report_region_title => 'Sv Itam Attributes Vw',
  p_form_region_title => 'Sv Itam Attributes Vw');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Building',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552917434168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUILDING');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551107601168862 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Name',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551202348168862 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Comments',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552223060168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMMENTS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Description',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552118432168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPTION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Environment',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552414511168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'ENVIRONMENT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Floor',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224553010976168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'FLOOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Manufacturer',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552027216168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'MANUFACTURER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Model',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551924700168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'MODEL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Product',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551827924168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRODUCT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Physical Server',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551419298168862 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'Physical Server');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Region',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552618246168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'REGION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Room',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224553104517168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'ROOM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552831819168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site Group',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552702150168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE_GROUP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552308303168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'System Role',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224552517931168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'SYSTEM_ROLE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Serial',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551323423168862 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'Serial');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier1',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551513061168862 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier2',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551604872168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER2');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier3',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 3224551709216168863 + wwv_flow_api.g_id_offset,
  p_table_id => 3224551022928168862 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER3');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_ITAM_BUZ_SRVC_CMPTR_SYM');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_ITAM_BUZ_SRVC_CMPTR_SYM',
  p_report_region_title => 'Sv Itam Buz Srvc Cmptr Sym',
  p_form_region_title => 'Sv Itam Buz Srvc Cmptr Sym');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Availability',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308217031559828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'AVAILABILITY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Building',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308219304429828727 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUILDING');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Buz Srvc Ci Id',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308217726628828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUZ_SRVC_CI_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Buz Srvc Ci Name',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 1000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308217811595828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUZ_SRVC_CI_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Buz Srvc Tier',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308217915503828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUZ_SRVC_TIER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Id',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218022169828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Name',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218129395828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'End Date',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308217332479828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'END_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Environment Type',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218924129828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'ENVIRONMENT_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'File Name',
  p_display_seq_form => 27,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 27,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308217518452828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILE_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Floor1',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308219421904828727 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'FLOOR1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308217613748828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Install Date',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308217110383828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'INSTALL_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Model',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218821329828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'MODEL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Primary Service',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308217225851828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRIMARY_SERVICE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Product',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218725164828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRODUCT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Project Nbr',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308216906561828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROJECT_NBR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Region',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308219028241828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'REGION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Room',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308216806859828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'ROOM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Serial Nbr',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218310969828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERIAL_NBR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308219124754828727 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site Group',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308219200863828727 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE_GROUP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 100,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218214625828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier 1',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218406951828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER_1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier 2',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218505364828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER_2');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier 3',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308218616017828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER_3');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Xls Id',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308217402517828726 + wwv_flow_api.g_id_offset,
  p_table_id => 308216714334828724 + wwv_flow_api.g_id_offset,
  p_column_name => 'XLS_ID');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_ITAM_COMPUTER_SYSTEM');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_ITAM_COMPUTER_SYSTEM',
  p_report_region_title => 'Sv Itam Computer System',
  p_form_region_title => 'Sv Itam Computer System');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Availabile Date',
  p_display_seq_form => 41,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 41,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308683201713283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'AVAILABILE_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Budget Code',
  p_display_seq_form => 19,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 19,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681025136283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUDGET_CODE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Building',
  p_display_seq_form => 15,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 15,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680628459283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'BUILDING');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Capability List',
  p_display_seq_form => 20,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 20,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681110419283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'CAPABILITY_LIST');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Change Tool',
  p_display_seq_form => 21,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 21,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681210492283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'CHANGE_TOOL');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Id',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308679320427283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Ci Name',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308679409113283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'CI_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Company',
  p_display_seq_form => 22,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 22,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681326841283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'COMPANY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Create Date',
  p_display_seq_form => 45,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 45,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308683603343283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'CREATE_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Description',
  p_display_seq_form => 23,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 23,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 4000,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681411086283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPTION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Disposal Date',
  p_display_seq_form => 43,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 43,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308683427797283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'DISPOSAL_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Domain',
  p_display_seq_form => 25,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 25,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681616922283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'DOMAIN');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'End Date',
  p_display_seq_form => 55,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 55,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308684601152283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'END_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Environ Spec',
  p_display_seq_form => 27,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 27,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681813612283308 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'ENVIRON_SPEC');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Environ Type',
  p_display_seq_form => 26,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 26,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681722207283308 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'ENVIRON_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'File Name',
  p_display_seq_form => 57,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 57,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 200,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308684811031283310 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'FILE_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Floor1',
  p_display_seq_form => 16,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 16,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680724037283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'FLOOR1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Hostname',
  p_display_seq_form => 24,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 24,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681505158283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'HOSTNAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308679223324283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Install Date',
  p_display_seq_form => 40,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 40,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308683111942283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'INSTALL_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Last Scan Date',
  p_display_seq_form => 46,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 46,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308683707454283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'LAST_SCAN_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Manufacturer',
  p_display_seq_form => 10,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 10,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680130489283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'MANUFACTURER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Max Consumption',
  p_display_seq_form => 29,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 29,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682001057283308 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'MAX_CONSUMPTION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Max Processors',
  p_display_seq_form => 28,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 28,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308681931128283308 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'MAX_PROCESSORS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Os Patch Nbr',
  p_display_seq_form => 31,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 31,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682219908283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'OS_PATCH_NBR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Os System',
  p_display_seq_form => 30,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 30,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682130167283308 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'OS_SYSTEM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Os Versio',
  p_display_seq_form => 32,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 32,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682320967283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'OS_VERSIO');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Owner Contact',
  p_display_seq_form => 33,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 33,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682404496283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'OWNER_CONTACT');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Part Number',
  p_display_seq_form => 34,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 34,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682513675283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PART_NUMBER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Physical Memory',
  p_display_seq_form => 54,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 54,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308684504159283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PHYSICAL_MEMORY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Primary Capability',
  p_display_seq_form => 35,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 35,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682612621283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRIMARY_CAPABILITY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Priority',
  p_display_seq_form => 36,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 36,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682724661283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRIORITY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Processor',
  p_display_seq_form => 38,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 38,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682914029283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROCESSOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Processor Type',
  p_display_seq_form => 37,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 37,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308682812533283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PROCESSOR_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Product Number',
  p_display_seq_form => 8,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 8,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308679931257283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PRODUCT_NUMBER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Purchase Date',
  p_display_seq_form => 44,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 44,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308683505748283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'PURCHASE_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Recieved Date',
  p_display_seq_form => 39,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 39,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308683018795283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'RECIEVED_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Region',
  p_display_seq_form => 12,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 12,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680309297283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'REGION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Reset Capability',
  p_display_seq_form => 47,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 47,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308683810695283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'RESET_CAPABILITY');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Return Date',
  p_display_seq_form => 42,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 42,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308683327798283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'RETURN_DATE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Room',
  p_display_seq_form => 17,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 17,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680821193283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'ROOM');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Serial Nbr',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308679519410283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERIAL_NBR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Service Type',
  p_display_seq_form => 11,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 11,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680226685283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SERVICE_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site',
  p_display_seq_form => 14,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 14,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680514598283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Site Group',
  p_display_seq_form => 13,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 13,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680421685283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SITE_GROUP');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status',
  p_display_seq_form => 18,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 18,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680922250283304 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Status Reason',
  p_display_seq_form => 48,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 48,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308683921461283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'STATUS_REASON');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Supplier Name',
  p_display_seq_form => 49,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 49,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308684030341283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SUPPLIER_NAME');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Supported',
  p_display_seq_form => 50,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 50,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308684125660283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SUPPORTED');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'System Role',
  p_display_seq_form => 51,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 51,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308684227754283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SYSTEM_ROLE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'System Type',
  p_display_seq_form => 52,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 52,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308684323857283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'SYSTEM_TYPE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier1',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308679600445283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER1');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier2',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308679707845283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER2');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Tier3',
  p_display_seq_form => 7,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 7,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308679823967283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'TIER3');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Total Hard Drive',
  p_display_seq_form => 53,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 53,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308684426185283309 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'TOTAL_HARD_DRIVE');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Version Number',
  p_display_seq_form => 9,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 9,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 308680014366283303 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'VERSION_NUMBER');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Xls Id',
  p_display_seq_form => 56,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 56,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 308684731837283310 + wwv_flow_api.g_id_offset,
  p_table_id => 308679113994283302 + wwv_flow_api.g_id_offset,
  p_column_name => 'XLS_ID');
 
end;
/

 
begin
 
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'SV_OPP_ID');
wwv_flow_hint.create_table_hint_priv(
  p_table_id => 2311773028476403336 + wwv_flow_api.g_id_offset,
  p_schema => wwv_flow_hint.g_schema,
  p_table_name  => 'SV_OPP_ID',
  p_report_region_title => 'Sv Opp Id',
  p_form_region_title => 'Sv Opp Id');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Creator',
  p_display_seq_form => 2,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXT_FIELD',
  p_form_attribute_01 => 'N',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 2,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 30,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2311773304285403343 + wwv_flow_api.g_id_offset,
  p_table_id => 2311773028476403336 + wwv_flow_api.g_id_offset,
  p_column_name => 'CREATOR');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Description',
  p_display_seq_form => 4,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_TEXTAREA',
  p_form_attribute_01 => 'Y',
  p_form_attribute_02 => 'N',
  p_form_attribute_03 => 'N',
  p_display_as_tab_form => 'TEXTAREA',
  p_display_seq_report => 4,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'L',
  p_display_width => 60,
  p_max_width => 500,
  p_height => 4,
  p_group_by => 'N',
  p_searchable => 'Y',
  p_column_id => 2311773617627403344 + wwv_flow_api.g_id_offset,
  p_table_id => 2311773028476403336 + wwv_flow_api.g_id_offset,
  p_column_name => 'DESCRIPTION');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Group Raised By Id',
  p_display_seq_form => 6,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_SELECT_LIST',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'SELECT_LIST_FROM_LOV',
  p_display_seq_report => 6,
  p_display_in_report => 'Y',
  p_display_as_report => 'TEXT_FROM_LOV',
  p_aggregate_by => 'N',
  p_lov_query => 'select GROUP_RAISED_BY d, GROUP_RAISED_BY_ID v from SV_GROUP_RAISED_BY_LOOKUP order by 1',
  p_required => 'N',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2311773106868403343 + wwv_flow_api.g_id_offset,
  p_table_id => 2311773028476403336 + wwv_flow_api.g_id_offset,
  p_column_name => 'GROUP_RAISED_BY_ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Id',
  p_display_seq_form => 1,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 1,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2311773223658403343 + wwv_flow_api.g_id_offset,
  p_table_id => 2311773028476403336 + wwv_flow_api.g_id_offset,
  p_column_name => 'ID');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Opp Ts',
  p_display_seq_form => 3,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_DATE_PICKER',
  p_form_attribute_04 => 'button',
  p_form_attribute_05 => 'N',
  p_form_attribute_07 => 'NONE',
  p_display_as_tab_form => 'DATE_PICKER',
  p_display_seq_report => 3,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'N',
  p_alignment => 'L',
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2311773410524403343 + wwv_flow_api.g_id_offset,
  p_table_id => 2311773028476403336 + wwv_flow_api.g_id_offset,
  p_column_name => 'OPP_TS');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_label => 'Opp Type Id',
  p_display_seq_form => 5,
  p_display_in_form => 'Y',
  p_display_as_form => 'NATIVE_NUMBER_FIELD',
  p_form_attribute_03 => 'right',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report => 5,
  p_display_in_report => 'Y',
  p_display_as_report => 'WITHOUT_MODIFICATION',
  p_aggregate_by => 'N',
  p_required => 'Y',
  p_alignment => 'R',
  p_display_width => 30,
  p_max_width => 22,
  p_height => 1,
  p_group_by => 'N',
  p_searchable => 'N',
  p_column_id => 2311773519586403343 + wwv_flow_api.g_id_offset,
  p_table_id => 2311773028476403336 + wwv_flow_api.g_id_offset,
  p_column_name => 'OPP_TYPE_ID');
 
end;
/

commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
