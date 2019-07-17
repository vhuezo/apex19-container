set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,17994006810700138265));
 
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
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,9205);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
--application/shared_components/plugins/region_type/com_blogspot_apexnotes_apex_rds_customizable
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 2068372387050420560 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'REGION TYPE'
 ,p_name => 'COM.BLOGSPOT.APEXNOTES.APEX.RDS_CUSTOMIZABLE'
 ,p_display_name => 'RDS Customizable'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_plsql_code => 
'-- ------------------------------------------------------------------------------------'||unistr('\000a')||
'-- Function       : render_RDS'||unistr('\000a')||
'-- Author         : Tereska Jagiello'||unistr('\000a')||
'-- Description    : render function for Region Display Selector plugin'||unistr('\000a')||
'-- ------------------------------------------------------------------------------------'||unistr('\000a')||
'-- Created On     : 2011.11.21'||unistr('\000a')||
'-- Curent version : 1.1'||unistr('\000a')||
'-- ---------------------------'||
'---------------------------------------------------------'||unistr('\000a')||
'-- Credits        :'||unistr('\000a')||
'-- Martin Giffy D''Souza for help with the authorization function'||unistr('\000a')||
'-- Jose Murillo for thoroughly testing version 1.1 of the plugin'||unistr('\000a')||
'-- ------------------------------------------------------------------------------------'||unistr('\000a')||
'-- Changed On     : 2012.01.10'||unistr('\000a')||
'-- Version        : 1.1'||unistr('\000a')||
'--'||unistr('\000a')||
'-- exchanged "cursor for loop" (causing ORA-06'||
'502 in XE 10g edition) for "bulk collect"'||unistr('\000a')||
'-- rewritten query for better readability'||unistr('\000a')||
'-- ------------------------------------------------------------------------------------'||unistr('\000a')||
'function render_RDS ('||unistr('\000a')||
'    p_region              in apex_plugin.t_region,'||unistr('\000a')||
'    p_plugin              in apex_plugin.t_plugin,'||unistr('\000a')||
'    p_is_printer_friendly in boolean )'||unistr('\000a')||
'  return apex_plugin.t_region_render_result'||unistr('\000a')||
'as'||unistr('\000a')||
'  /* plugin parame'||
'ters */'||unistr('\000a')||
'  l_group_class     p_region.attribute_01%type;  '||unistr('\000a')||
'  l_display_ALL     number(1);'||unistr('\000a')||
'  l_ALL_label       p_region.attribute_03%type;'||unistr('\000a')||
'  l_ALL_css         p_region.attribute_05%type;'||unistr('\000a')||
'  l_ALL_position    number(1);'||unistr('\000a')||
'  -- id of the plugin region'||unistr('\000a')||
'  l_id p_region.static_id%TYPE;'||unistr('\000a')||
'  '||unistr('\000a')||
'  l_attr_list   sys.odcivarchar2list;'||unistr('\000a')||
'  l_name_list   sys.odcivarchar2list;'||unistr('\000a')||
'  l_id_list   sys.odcivarchar2list;'||unistr('\000a')||
'  l_seq_'||
'list   sys.odcinumberlist;'||unistr('\000a')||
'  '||unistr('\000a')||
'begin'||unistr('\000a')||
'  -- ::debug: metadata'||unistr('\000a')||
'  if apex_application.g_debug'||unistr('\000a')||
'  then'||unistr('\000a')||
'    apex_plugin_util.debug_region(p_plugin               => p_plugin,'||unistr('\000a')||
'                                  p_region               => p_region,'||unistr('\000a')||
'                                  p_is_printer_friendly  => p_is_printer_friendly);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
''||unistr('\000a')||
'  l_group_class := case when p_region.attribute_01 is not null then '''||
' ''||p_region.attribute_01||'' '' end;'||unistr('\000a')||
'  l_display_ALL := case p_region.attribute_02 when ''Y'' then 1 else 0 end;'||unistr('\000a')||
'  l_ALL_label := apex_plugin_util.escape(p_region.attribute_03, case p_region.attribute_04 when ''Y'' then true else false end);   '||unistr('\000a')||
'  l_ALL_css   := p_region.attribute_05;'||unistr('\000a')||
'  l_ALL_position := case p_region.attribute_06 when ''f'' then 0 else null end;'||unistr('\000a')||
'    '||unistr('\000a')||
'  -- get the id of the region into lo'||
'cal variable'||unistr('\000a')||
'  l_id := apex_plugin_util.escape(p_region.static_id, true);'||unistr('\000a')||
''||unistr('\000a')||
'  -- ::debug: variables '||unistr('\000a')||
'  if apex_application.g_debug then'||unistr('\000a')||
'     apex_application.debug(''RDS Variables: l_group_class: ''  || l_group_class ||'||unistr('\000a')||
'                                 '', l_display_ALL: ''  || l_display_ALL ||'||unistr('\000a')||
'                                 '', l_ALL_label: ''    || l_ALL_label ||'||unistr('\000a')||
'                                 '', l'||
'_ALL_css: ''      || l_ALL_css ||'||unistr('\000a')||
'                                 '', l_ALL_position: '' || l_ALL_position );'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'  -- get the values'||unistr('\000a')||
'  with regions as ( '||unistr('\000a')||
'     select  aapr.REGION_NAME  reg_name'||unistr('\000a')||
'     -- if no id (STATIC_ID) is given, then the one from apex (REGION_ID)'||unistr('\000a')||
'            ,decode (aapr.STATIC_ID'||unistr('\000a')||
'                         ,null, ''#R'' || to_char(aapr.REGION_ID)'||unistr('\000a')||
'                           '||
'   , ''#''  || aapr.STATIC_ID)                   reg_id                    '||unistr('\000a')||
'       from  APEX_APPLICATION_PAGE_REGIONS aapr                       '||unistr('\000a')||
'      where  aapr.APPLICATION_ID = wwv_flow.g_flow_id '||unistr('\000a')||
'        and  aapr.PAGE_ID = wwv_flow.g_flow_step_id'||unistr('\000a')||
'        and  aapr.DISPLAY_REGION_SELECTOR = ''Yes'''||unistr('\000a')||
'        -- filter the region with the given class name if available'||unistr('\000a')||
'        and  decode(l_group_cl'||
'ass, null, 1, instr(replace(aapr.REGION_ATTRIBUTES_SUBSTITUTION, ''"'', '' ''), l_group_class)) > 0 '||unistr('\000a')||
'        -- check if the region is displayed e.g. through authorization, conditions...'||unistr('\000a')||
'        and  1 = apex_plugin_util.get_plsql_function_result('||unistr('\000a')||
'                                     ''begin '' ||'||unistr('\000a')||
'                                        ''if ''||'||unistr('\000a')||
'                                           ''apex_plugin_uti'||
'l.is_component_used(''||'||unistr('\000a')||
'                                               ''p_build_option_id => '' || decode(aapr.BUILD_OPTION_ID, null,''null'',aapr.BUILD_OPTION_ID) ||'||unistr('\000a')||
'                                              '',p_authorization_scheme_id =>'''''' || aapr.AUTHORIZATION_SCHEME_ID ||'||unistr('\000a')||
'                                            '''''',p_condition_type          =>'''''' || (select d from apex_standard_condition'||
's where r = aapr.CONDITION_TYPE) ||'||unistr('\000a')||
'                                            '''''',p_condition_expression1   =>'''''' || aapr.CONDITION_EXPRESSION1 ||'||unistr('\000a')||
'                                            '''''',p_condition_expression2   =>'''''' || aapr.CONDITION_EXPRESSION2 ||'||unistr('\000a')||
'                                            '''''',p_component => ''''region'''') '' ||'||unistr('\000a')||
'                                        ''then '' ||'||unistr('\000a')||
'       '||
'                                     ''return 1;'' ||'||unistr('\000a')||
'                                        ''else '' ||'||unistr('\000a')||
'                                            ''return 0;''||'||unistr('\000a')||
'                                        ''end if; '' ||'||unistr('\000a')||
'                                      ''end;'')'||unistr('\000a')||
'      order by aapr.DISPLAY_SEQUENCE'||unistr('\000a')||
'   ) '||unistr('\000a')||
'   , custom_label as ('||unistr('\000a')||
'        select  l_ALL_label, ''#SHOW_ALL'', l_ALL_position'||unistr('\000a')||
'          from  '||
'dual'||unistr('\000a')||
'         where  1=l_display_ALL                             '||unistr('\000a')||
'   )'||unistr('\000a')||
'   , regions_and_label as ('||unistr('\000a')||
'        select  regions.* '||unistr('\000a')||
'               ,rownum     seq '||unistr('\000a')||
'          from  regions'||unistr('\000a')||
'         union all'||unistr('\000a')||
'        select  * '||unistr('\000a')||
'          from  custom_label '||unistr('\000a')||
'   )'||unistr('\000a')||
'   , count_all as ('||unistr('\000a')||
'        select count(*) reg_count from regions_and_label'||unistr('\000a')||
'   )'||unistr('\000a')||
'   select  decode(rownum, 1, '' class="apex-rds-first"'', reg_cou'||
'nt, '' class="apex-rds-last"'') attr'||unistr('\000a')||
'          ,regions_and_label.*'||unistr('\000a')||
'     BULK collect into   l_attr_list, l_name_list , l_id_list,   l_seq_list'||unistr('\000a')||
'     from  regions_and_label'||unistr('\000a')||
'          ,count_all;   '||unistr('\000a')||
'  -- open <div> and <ul>'||unistr('\000a')||
'  htp.p(''<div class="apex-rds-container">'');'||unistr('\000a')||
'  htp.p(''<ul class="apex-rds rds-customizable" id="''|| l_id ||''_RDS">'');'||unistr('\000a')||
'  -- print the list'||unistr('\000a')||
'  for i in 1 .. l_attr_list.count loop'||unistr('\000a')||
'  '||
'  htp.p(''<li'' || l_attr_list(i) || ''>''); '||unistr('\000a')||
'    htp.p(''<a href="'' || l_id_list(i) || ''"><span'' || case when l_seq_list(i) is null or l_seq_list(i) = 0 then '' '' || l_ALL_css end || ''>'' || l_name_list(i) ||'' </span></a></li>'');'||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  -- close the tags'||unistr('\000a')||
'  htp.p(''</ul>'');'||unistr('\000a')||
'  htp.p(''</div>'');'||unistr('\000a')||
'  -- add the click event for the RDS region and trigger click on the first "tab"'||unistr('\000a')||
'  apex_javascript.add_onlo'||
'ad_code ('||unistr('\000a')||
'         ''apex.widget.regionDisplaySelector("''|| l_id ||''");'' ||'||unistr('\000a')||
'         ''$("#''|| l_id ||''_RDS > li:first > a:first").trigger("click");'');'||unistr('\000a')||
''||unistr('\000a')||
'  return null;  '||unistr('\000a')||
'  exception when others then'||unistr('\000a')||
'    apex_application.debug(sqlerrm);'||unistr('\000a')||
'    apex_application.debug(dbms_utility.format_error_stack);'||unistr('\000a')||
'    raise;'||unistr('\000a')||
'end render_RDS;'
 ,p_render_function => 'render_RDS'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<h3 style="color: red;">'||unistr('\000a')||
'	<span style="color: rgb(0, 100, 0);">RDS Customizable Plugin</span></h3>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	This plugin is intended to be a replacement for displaying RDS (Region Display Selector).<br />'||unistr('\000a')||
'	With this plugin it is possible to select regions going into RDS as well as to control the &quot;<em><strong>Show All</strong></em>&quot;-tab behavior (Show/Hide, Position, Label, Css-Attributs).</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	The customizations are listed below:</p>'||unistr('\000a')||
'<ol>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong><span style="color: rgb(0, 100, 0);"><em>Region Grouping Class Name</em></span></strong> - choice of regions going into RDS.<br />'||unistr('\000a')||
'		Regions going into the RDS selector can be restricted by class name - put in the <strong><em>Region Attributes</em></strong>, e.g. class=&quot;rds-example&quot;</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<span style="color: rgb(0, 100, 0);"><em><strong>Display &quot;Show All&quot;</strong></em></span> - option if the <strong><em>&quot;Show All&quot;</em></strong>-tab should be displayed or not</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<span style="color: rgb(0, 100, 0);"><em><strong>Label of &quot;Show All&quot;</strong></em></span> - label of the <strong><em>&quot;Show All&quot;</em></strong> tab can be changed</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<em><strong><span style="color: rgb(0, 100, 0);">Escape &quot;Show All&quot; </span></strong></em>- needed in case your label contains html tags (e.g. &lt;img&gt;)</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<span style="color: rgb(0, 100, 0);"><em><strong>Css Attribute of &quot;Show All&quot;</strong></em></span> - you can set css attributes like title=&quot;your title&quot; or class=&quot;class-name&quot;</li>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<span style="color: rgb(0, 100, 0);"><em><strong>Position of the &quot;Show All&quot;</strong></em></span> - first or last, default is last</li>'||unistr('\000a')||
'</ol>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	<strong>Example:</strong></p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	In the regions going into the RDS, set <strong><em><span style="color: rgb(0, 100, 0);">Region Display Selector</span></em></strong> to &quot;Yes&quot; - as you would with the standard RDS.<br />'||unistr('\000a')||
'	Additionally, in the <strong><span style="color: rgb(0, 100, 0);"><em>Region Attributes</em></span></strong>, set a class of your choice (e.g. class=&quot;rds-example&quot;).<br />'||unistr('\000a')||
'	Repeat this for all regions you want to group in this particular RDS - <strong><span style="color: rgb(255, 0, 0);">important</span></strong><span style="color: rgb(255, 0, 0);">: the class name must be the same</span>.<br />'||unistr('\000a')||
'	In the RDS plugin attributes, set the first parameter<em> <strong><span style="color: rgb(0, 100, 0);">Region Grouping Class Name</span></strong></em><span style="color: rgb(0, 100, 0);"> </span>to the name of the class you previously put in the regions&#39; attribute (e.g. rds-example).</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	You will find more detailed instructions on the demo page (link above).</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	&nbsp;</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	&nbsp;</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	&nbsp;</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	<br />'||unistr('\000a')||
'	&nbsp;</p>'||unistr('\000a')||
''
 ,p_version_identifier => '1.1'
 ,p_about_url => 'http://apex.oracle.com/pls/apex/f?p=TER:RDS_CUSTOMIZABLE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2068379665017423614 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2068372387050420560 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Region Grouping Class Name'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 30
 ,p_max_length => 30
 ,p_is_translatable => false
 ,p_help_text => 'The region can be grouped by class. Once a class is chosen, only those regions with the class go into the RDS. If left empty, all regions will be in the RDS.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2068380061762423615 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2068372387050420560 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Display "Show All"'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
 ,p_help_text => 'Display or hide the tab "Show All".'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2068380462165423619 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2068372387050420560 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Label of "Show All"'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_default_value => 'Show All'
 ,p_display_length => 65
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2068380061762423615 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'Custom label for "Show All" tab. This can also be an html tag. If so, you need to set the next attribute <em><strong><span style="color:#006400;">Escape &quot;Show All&quot; </span></strong></em> to "No".'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2068380858956423620 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2068372387050420560 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'Escape "Show All"'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'Y'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2068380061762423615 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'In case you want to set an html tag instead of simple text (e.g. <img ...>), set this attribute to "No"; otherwise leave the default value.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2068381263507423621 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2068372387050420560 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'Css Attribute of "Show All"'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 65
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2068380061762423615 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'This can be any css attribute, e.g:'||unistr('\000a')||
'<em><pre>class="your-class-name"</pre></em>'||unistr('\000a')||
'or '||unistr('\000a')||
'<em><pre>style="color:red;"</pre></em>'||unistr('\000a')||
'or'||unistr('\000a')||
'<em><pre>title="your title"</pre></em>'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 2068381681942423623 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 2068372387050420560 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Position of "Show All"'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => false
 ,p_default_value => 'l'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 2068380061762423615 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'Y'
 ,p_help_text => 'The position of the "Show All" tab. Unlike in the standard RDS, the default position here is the last one.'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2068382057294423624 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2068381681942423623 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'First'
 ,p_return_value => 'f'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 2068382568162423625 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 2068381681942423623 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Last'
 ,p_return_value => 'l'
  );
null;
 
end;
/

commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
