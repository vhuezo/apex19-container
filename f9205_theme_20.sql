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

--application/themes/20
 
begin
 
    wwv_flow.g_flow_theme_id := 20;
null;
 
end;
/

 
--
prompt  ...theme : 20
--
prompt  ...remove existing theme ...
 
begin
 
 wwv_flow_api.delete_theme(p_flow_id=> wwv_flow.g_flow_id , p_theme_id=>wwv_flow.g_flow_theme_id ,p_import=>'Y');
null;
 
end;
/

prompt  ...page templates for application: 9205
--
--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 2213308149283081100
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213308149283081100 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'Login'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<div id="t20PageHeader">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="t20BreadCrumbsLeft">#REGION_POSITION_01#</div'||
'>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageBody" height="70%" align="center" width="400">'||unistr('\000a')||
'<td width="100%" valign="top" height="100%" id="t20ContentBody" align="center">'||unistr('\000a')||
'<div id="t20Messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div id="t20ContentMiddle">#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td valign="top" wid'||
'th="200" id="t20ContentRight">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td><td class="tM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavBar">#TEXT#</a> |'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 6
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs
prompt  ......Page template 2213308351071081108
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213308351071081108 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'No Tabs'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<div id="t20PageHeader">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="t20BreadCrumbsLeft">#REGION_POSITION_01#</div'||
'>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageBody"  width="100%" height="70%">'||unistr('\000a')||
'<td width="100%" valign="top" height="100%" id="t20ContentBody">'||unistr('\000a')||
'<div id="t20Messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div id="t20ContentMiddle">#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentRight'||
'">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td><td class="tM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavBar">#TEXT#</a> |'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0"'
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 3
 ,p_error_page_template => '<table class="t20Region t20RegionwithoutTitle" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">'||unistr('\000a')||
'<a href="#BACK_LINK#" class="t20Button2">#OK#</a>'||unistr('\000a')||
'</td></tr>'||unistr('\000a')||
'<tr><td class="t20RegionBody">'||unistr('\000a')||
'  <p>#MESSAGE#</p>'||unistr('\000a')||
'  <strong>#ADDITIONAL_INFO#</strong>'||unistr('\000a')||
'  <br />'||unistr('\000a')||
'  <br />'||unistr('\000a')||
'  <div class="error_technical_info">#TECHNICAL_INFO#</div>'||unistr('\000a')||
'</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_with_sidebar
prompt  ......Page template 2213308630625081110
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213308630625081110 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'No Tabs with Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<div id="t20PageHeader">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="t20BreadCrumbsLeft">#REGION_POSITION_01#</div'||
'>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageBody"  width="100%" height="70%">'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentLeft">#REGION_POSITION_02#<br /></td>'||unistr('\000a')||
'<td width="100%" valign="top" height="100%" id="t20ContentBody">'||unistr('\000a')||
'<div id="t20Messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div id="t20ContentMiddle">#BOX_BODY##REGION_POSITION_04#'||
'</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentRight">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td><td class="tM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavBar">#TEXT#</a> |'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" '
 ,p_sidebar_def_reg_pos => 'REGION_POSITION_02'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 17
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 2213308932387081110
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213308932387081110 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'One Level Tabs'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<div id="t20PageHeader">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div id="t20Tabs" class="tablight">#TAB_CELLS#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<'||
'div id="t20BreadCrumbsLeft">#REGION_POSITION_01#</div>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageBody"  width="100%" height="70%">'||unistr('\000a')||
'<td width="100%" valign="top" id="t20ContentBody">'||unistr('\000a')||
'<div id="t20Messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div id="t20ContentMiddle">#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td valig'||
'n="top" width="200" id="t20ContentRight">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_current_tab => '<a href="#TAB_LINK#" class="t20CurrentTab">#TAB_LABEL#</a>'
 ,p_non_current_tab => '<a href="#TAB_LINK#">#TAB_LABEL#</a>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavBar">#TEXT#</a> |'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="5"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 1
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_sidebar
prompt  ......Page template 2213309248210081115
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213309248210081115 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'One Level Tabs Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<div id="t20PageHeader">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div id="t20Tabs" class="tablight">#TAB_CELLS#</div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<'||
'div id="t20BreadCrumbsLeft">#REGION_POSITION_01#</div>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageBody"  width="100%" height="70%">'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentLeft">#REGION_POSITION_02#<br /></td>'||unistr('\000a')||
'<td width="100%" valign="top" id="t20ContentBody">'||unistr('\000a')||
'<div id="t20Messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div id="t20Conten'||
'tMiddle">#BOX_BODY##REGION_POSITION_04#</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentRight">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td><td class="tM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_current_tab => '<a href="#TAB_LINK#" class="t20CurrentTab">#TAB_LABEL#</a>'||unistr('\000a')||
''
 ,p_non_current_tab => '<a href="#TAB_LINK#">#TAB_LABEL#</a>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavBar">#TEXT#</a> |'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="5"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 16
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 2213309540952081115
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213309540952081115 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top">'||unistr('\000a')||
'<div style="border:1px solid black;">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
''
 ,p_footer_template => 
'#FORM_CLOSE##DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td><td class="tM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '<div class="t20NavigationBar">#BAR_BODY#</div>'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavigationBar">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 4
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 2213309843227081115
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213309843227081115 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'Printer Friendly'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<t'||
'd width="100%" valign="top"><div class="t20messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td><td class="tM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '<div class="t20NavigationBar">#BAR_BODY#</div>'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavigationBar">#TEXT#</a>'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
 ,p_theme_class_id => 5
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
 ,p_template_comment => '3'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 2213310145949081116
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213310145949081116 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'Two Level Tabs'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<div id="t20PageHeader">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div id="t20Tabs" class="tablight">#PARENT_TAB_CELLS#</div>'||unistr('\000a')||
'<'||
'/div>'||unistr('\000a')||
'<div id="t20tablist">#TAB_CELLS#</div>'||unistr('\000a')||
'<div id="t20BreadCrumbsLeft">#REGION_POSITION_01#</div>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageBody"  width="100%" height="70%">'||unistr('\000a')||
'<td width="100%" valign="top" id="t20ContentBody">'||unistr('\000a')||
'<div id="t20Messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div id="t20ContentMiddle">#BOX_BODY##REGION_POSITION'||
'_02##REGION_POSITION_04#</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentRight">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_current_tab => '<a href="#TAB_LINK#" class="current">#TAB_LABEL#</a>'
 ,p_non_current_tab => '<a href="#TAB_LINK#">#TAB_LABEL#</a>'
 ,p_top_current_tab => '<a href="#TAB_LINK#" class="t20CurrentTab">#TAB_LABEL#</a>'
 ,p_top_non_curr_tab => '<a href="#TAB_LINK#">#TAB_LABEL#</a>'
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavBar">#TEXT#</a> |'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="5" '
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 2
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_with_sidebar
prompt  ......Page template 2213310428649081116
 
begin
 
wwv_flow_api.create_template (
  p_id => 2213310428649081116 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
, p_theme_id => wwv_flow.g_flow_theme_id
 ,p_name => 'Two Level Tabs with Sidebar'
 ,p_is_popup => false
 ,p_header_template => '<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#APEX_CSS#'||unistr('\000a')||
'#TEMPLATE_CSS#'||unistr('\000a')||
'#THEME_CSS#'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#APEX_JAVASCRIPT#'||unistr('\000a')||
'#TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'#APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#'
 ,p_box => 
'<div id="t20PageHeader">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Logo" valign="top">#LOGO#<br />#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td id="t20HeaderMiddle"  valign="top" width="100%">#REGION_POSITION_07#<br /></td>'||unistr('\000a')||
'<td id="t20NavBar" valign="top">#NAVIGATION_BAR#<br />#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div id="t20Tabs" class="tablight">#PARENT_TAB_CELLS#</div>'||unistr('\000a')||
'<'||
'/div>'||unistr('\000a')||
'<div id="t20tablist">#TAB_CELLS#</div>'||unistr('\000a')||
'<div id="t20BreadCrumbsLeft">#REGION_POSITION_01#</div>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageBody"  width="100%" height="70%">'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentLeft">#REGION_POSITION_02#<br /></td>'||unistr('\000a')||
'<td width="100%" valign="top" id="t20ContentBody">'||unistr('\000a')||
'<div id="t20Messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##'||
'NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div id="t20ContentMiddle">#BOX_BODY##REGION_POSITION_04#</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td valign="top" width="200" id="t20ContentRight">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_footer_template => 
'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t20PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td id="t20Left" valign="top"><span id="t20UserPrompt">&APP_USER.</span><br /></td>'||unistr('\000a')||
'<td id="t20Center" valign="top">#REGION_POSITION_05#</td>'||unistr('\000a')||
'<td id="t20Right" valign="top"><span id="t20Customize">#CUSTOMIZE#</span><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t20Break"/>'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'#DEVELOPER_TOOLBAR#'||unistr('\000a')||
'#G'||
'ENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td><td class="tM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_current_tab => '<a href="#TAB_LINK#" class="current">#TAB_LABEL#</a>'||unistr('\000a')||
''
 ,p_non_current_tab => '<a href="#TAB_LINK#">#TAB_LABEL#</a>'
 ,p_top_current_tab => '<a href="#TAB_LINK#" class="t20CurrentTab">#TAB_LABEL#</a>'||unistr('\000a')||
''
 ,p_top_non_curr_tab => '<a href="#TAB_LINK#">#TAB_LABEL#</a>'||unistr('\000a')||
''
 ,p_notification_message => '<table summary="" border="0" cellpadding="0" cellspacing="0" id="t20Notification">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-L.gif" alt="" /></td>'||unistr('\000a')||
'<td class="tM"></td>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxTop-R.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="L"></td><td width="100%"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''t20Notification'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</td><td class="R"></td></tr>'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-L.gif" alt="" /></td><td class="bM"></td><td><img src="#IMAGE_PREFIX#themes/theme_20/msgBoxBtm-R.gif" alt="" /></td></tr>'||unistr('\000a')||
'</table>'
 ,p_navigation_bar => '#BAR_BODY#'
 ,p_navbar_entry => '<a href="#LINK#" class="t20NavBar">#TEXT#</a> |'
 ,p_region_table_cattributes => ' summary="" cellpadding="0" border="0" cellspacing="5"'
 ,p_breadcrumb_def_reg_pos => 'REGION_POSITION_01'
 ,p_theme_class_id => 18
 ,p_grid_type => 'TABLE'
 ,p_has_edit_links => true
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 2213310728649081116
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2213310728649081116 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<a href="#LINK#" class="t20Button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_template_comment => 'Standard Button'
,p_theme_id => wwv_flow.g_flow_theme_id
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_1
prompt  ......Button Template 2213310927176081125
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2213310927176081125 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 1'
 ,p_template => 
'<a href="#LINK#" class="t20Button2" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 4
 ,p_template_comment => 'XP Square FFFFFF'
,p_theme_id => wwv_flow.g_flow_theme_id
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_2
prompt  ......Button Template 2213311141914081125
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2213311141914081125 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 2'
 ,p_template => 
'<a href="#LINK#" class="t20Button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'Standard Button'
,p_theme_id => wwv_flow.g_flow_theme_id
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_3
prompt  ......Button Template 2213311333961081125
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 2213311333961081125 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 3'
 ,p_template => 
'<a href="#LINK#" class="t20Button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 2
 ,p_template_comment => 'Standard Button'
,p_theme_id => wwv_flow.g_flow_theme_id
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 2213311544102081125
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213311544102081125 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20Borderless" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<tr>'||
'<td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Borderless Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 7
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 2213311931961081128
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213311931961081128 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20Bracketed" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<tr><'||
'td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Bracketed Region'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 18
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 2213312254383081128
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213312254383081128 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="t20Breadcrumbs" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'Breadcrumb Region'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 6
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 2213312555354081128
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213312555354081128 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ButtonRegionwithTitle" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td'||
'></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>#BODY#'
 ,p_page_plug_template_name => 'Button Region with Title'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 4
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 2213312846550081128
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213312846550081128 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ButtonRegionwithoutTitle" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>#BODY#'
 ,p_page_plug_template_name => 'Button Region without Title'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 17
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 2213313148412081128
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213313148412081128 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ChartRegion" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<tr'||
'><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Chart Region'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 30
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 2213313442932081129
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213313442932081129 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20FormRegion" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<tr>'||
'<td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Form Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 8
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 2213313736613081131
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213313736613081131 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20HideShow" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header"><img src="#IMAGE_PREFIX#themes/theme_20/collapse_plus.gif" onclick="htmldb_ToggleWithImage(this,''#REGION_STATIC_ID#_body'')" class="pb" alt="" />#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATI'||
'C_ID#_body" style="display:none;">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Hide and Show Region'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 1
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/list_region_with_icon_chart
prompt  ......region template 2213314029925081131
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213314029925081131 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ListRegionwithIcon" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></'||
'tr>'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'List Region with Icon (Chart)'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 2213314350324081131
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213314350324081131 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="t20Region t20NavRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<div class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</div>'||unistr('\000a')||
'<div id="#REGION_STATIC_ID#_body" class="t20RegionBody">#BODY#</div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Navigation Region'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 5
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 2213314636560081131
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213314636560081131 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="t20Region t20NavRegionAlt" id="#REGION_STATIC_ID#"#REGION_ATTRIBUTES#><div class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</div><div id="#REGION_STATIC_ID#_body" class="t20RegionBody">#BODY#</div></div>'
 ,p_page_plug_template_name => 'Navigation Region, Alternative 1'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 16
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_title
prompt  ......region template 2213314942482081131
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213314942482081131 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20RegionwithoutButtonsandTitle" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Region without Buttons and Title'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 19
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 2213315252523081132
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213315252523081132 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20RegionwithoutTitle" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Region without Title'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 11
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row
prompt  ......region template 2213315553818081132
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213315553818081132 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_f'||
'ind.png" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>'||unistr('\000a')||
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>'||unistr('\000a')||
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="'||
'apex_finderbar_left_middle"><br /></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Report Filter - Single Row'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 31
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 2213315837578081132
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213315837578081132 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ReportList" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<tr>'||
'<td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Report List'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 2213316157183081133
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213316157183081133 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ReportRegion" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<t'||
'r><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Reports Region'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 2213316430204081133
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213316430204081133 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ReportsRegion100" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr'||
'>'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Reports Region 100% Width'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 2213316729555081134
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213316729555081134 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20ReportsRegionAlt" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr'||
'>'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Reports Region, Alternative 1'
 ,p_plug_table_bgcolor => '#ffffff'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 2213317057132081135
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213317057132081135 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20SidebarRegion" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Sidebar Region'
 ,p_plug_table_bgcolor => '#f7f7e7'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 2
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 2213317342849081136
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213317342849081136 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20SidebarRegionAlt" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Sidebar Region, Alternative 1'
 ,p_plug_table_bgcolor => '#f7f7e7'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 3
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/top_bar
prompt  ......region template 2213317633458081136
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213317633458081136 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div class="rounded-corner-region-blank" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top">'||unistr('\000a')||
'    <div class="rc-gray-top-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-body">'||unistr('\000a')||
'    <div class="rc-body-r">'||unistr('\000a')||
'      <div class="rc-content-main">'||unistr('\000a')||
'        <div class="rc-left">'||unistr('\000a')||
'          #BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="rc-right">'||unistr('\000a')||
'          #CLOSE##COPY##DELETE##CHANGE##EDIT##PREVIOUS##NE'||
'XT##CREATE##EXPAND#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="clear"></div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-bottom">'||unistr('\000a')||
'    <div class="rc-bottom-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Top Bar'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 2213317943634081136
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213317943634081136 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20WizardRegion" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>'||unistr('\000a')||
'<t'||
'r><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Wizard Region'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 12
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 2213318247898081136
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 2213318247898081136 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<table class="t20Region t20WizardRegionIcon" id="#REGION_STATIC_ID#" border="0" cellpadding="0" cellspacing="0" summary="" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<thead><tr><th class="t20RegionHeader" id="#REGION_STATIC_ID#_header">#TITLE#</th></tr></thead>'||unistr('\000a')||
'<tbody id="#REGION_STATIC_ID#_body">'||unistr('\000a')||
'<tr><td class="t20ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr'||
'>'||unistr('\000a')||
'<tr><td class="t20RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Wizard Region with Icon'
,p_theme_id => wwv_flow.g_flow_theme_id
 ,p_theme_class_id => 20
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 2213318552030081136
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t20Button t20current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t20Button">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213318552030081136 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t20ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanded
prompt  ......list template 2213318842840081151
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>2213318842840081151 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanded',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="htmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanding
prompt  ......list template 2213319136305081154
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>2213319136305081154 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanding',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 2213319440084081155
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t20current"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213319440084081155 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table class="t20HorizontalImageswithLabelList" cellpadding="0" border="0" cellspacing="0" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 2213319741003081155
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t20current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213319741003081155 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t20HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu
prompt  ......list template 2213320034200081160
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>2213320034200081160 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 2213320340299081160
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>2213320340299081160 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 2213320649672081162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td><img src="#IMAGE_PREFIX#themes/theme_20/topTabL.gif" /></td>'||unistr('\000a')||
'<td class="t20CurrentTab"><a href="#LINK#">#TEXT#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/topTabR.gif" /></td>'||unistr('\000a')||
'<td>&nbsp;</td>';

t2:=t2||'<td><img src="#IMAGE_PREFIX#themes/theme_20/topDimTabL.gif" /></td>'||unistr('\000a')||
'<td class="t20Tab"><a href="#LINK#">#TEXT#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_20/topDimTabR.gif" /></td>'||unistr('\000a')||
'<td>&nbsp;</td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213320649672081162 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<table class="t20Tabs t20TabbedNavigationList" border="0" cellpadding="0" cellspacing="0" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 2213320930018081162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t20current"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213320930018081162 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t20VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 2213321236327081162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t20current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213321236327081162 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t20VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 2213321551325081162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213321551325081162 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t20VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_links_without_bullets
prompt  ......list template 2213321832284081162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t20current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213321832284081162 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered Links without Bullets',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t20VerticalUnorderedLinkswithoutBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 2213322127847081162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t20current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213322127847081162 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t20VerticalUnorderedListwithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 2213322449391081162
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="t20current">#TEXT#</div>';

t2:=t2||'<div>#TEXT#</div>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>2213322449391081162 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="t20WizardProgressList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/apex_4_0_value_attribute_pairs
prompt  ......report template 2213322757596081163
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="report-row">'||unistr('\000a')||
'  <div class="report-col-hdr">#COLUMN_HEADER#</div>'||unistr('\000a')||
'  <div class="report-col-val">#COLUMN_VALUE#</div>'||unistr('\000a')||
'</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213322757596081163 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'APEX 4.0 - Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="two-col-report-portlet">',
  p_row_template_after_rows =>'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/borderless
prompt  ......report template 2213323041401081167
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t20data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213323041401081167 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t20Report" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table class="t20Borderless t20Report" cellpadding="0" border="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'||unistr('\000a')||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t20ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t20pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t20pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2213323041401081167 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 2213323539068081167
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t20data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213323539068081167 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t20Report" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table class="t20HorizontalBorder t20Report" border="0" cellpadding="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t20ReportHeader"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t20pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t20pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2213323539068081167 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 2213324056636081167
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'#COLUMN_VALUE#';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213324056636081167 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'#TOP_PAGINATION#<tr><td><ul class="t20OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t20CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t20pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t20pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2213324056636081167 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<li>',
  p_row_template_after_last =>'</li>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 2213324530777081169
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER#" class="t20data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213324530777081169 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t20Report" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t20Report t20Standard">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t20ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t20pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t20pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2213324530777081169 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_ppr
prompt  ......report template 2213325045147081169
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER#" class="t20data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213325045147081169 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="" class="t20Report" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t20Standard t20Report">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table><script language=JavaScript type=text/javascript>'||unistr('\000a')||
'<!--'||unistr('\000a')||
'init_htmlPPRReport(''#REGION_ID#'');'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'||unistr('\000a')||
'</htmldb:#REGION_ID#>'||unistr('\000a')||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t20ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t20pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t20pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t20pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t20pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2213325045147081169 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 2213325530210081169
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t20data">#COLUMN_VALUE#</td>';

c2:=c2||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t20dataalt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213325530210081169 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t20Report" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table border="0" cellpadding="0" cellspacing="0" summary="" class="t20StandardAlternatingRowColors t20Report">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t20ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t20pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t20pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2213325530210081169 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/two_column_portlet
prompt  ......report template 2213326050475081169
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="report-row">'||unistr('\000a')||
'  <div class="report-col-hdr">#1#</div>'||unistr('\000a')||
'  <div class="report-col-val">#2#</div>'||unistr('\000a')||
'</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213326050475081169 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Two Column Portlet',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="two-col-report-portlet" #REPORT_ATTRIBUTES# id="#REGION_ID#">',
  p_row_template_after_rows =>'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 2213326357523081169
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr>'||unistr('\000a')||
'<th class="t20ReportHeader">#COLUMN_HEADER#</th>'||unistr('\000a')||
'<td class="t20data">#COLUMN_VALUE#</td>'||unistr('\000a')||
'</tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 2213326357523081169 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary=""#REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t20ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t20CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t20pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t20pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t20pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 2213326357523081169 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'',
  p_row_template_after_last =>'<tr><td colspan="2" class="t20seperate"><br /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 2213326851864081170
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2213326851864081170 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t20NoLabel">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t20InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label
prompt  ......label template 2213326942130081174
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2213326942130081174 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t20OptionalLabel">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t20InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 2213327043280081174
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2213327043280081174 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t20OptionalLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t20InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label
prompt  ......label template 2213327153565081174
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2213327153565081174 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t20Req">*</span><span class="t20RequiredLabel">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t20InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 2213327231471081174
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 2213327231471081174 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t20Req">*</span><a class="t20RequiredLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t20InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 2213327329819081174
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 2213327329819081174 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'',
  p_current_page_option=>'<a href="#LINK#" class="t20Current">#NAME#</a>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'<b>&gt;</b>',
  p_after_last=>'',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 2213327449575081178
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 2213327449575081178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t20HierarchicalMenu">',
  p_current_page_option=>'<li class="t20current"><a href="#LINK#">#NAME#</a></li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 2213328133830081187
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 2213328133830081187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#lov_16x16.gif',
  p_popup_icon_attr=>'width="16" height="16" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon"><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_20/theme_3_1.css" type="text/css">'||unistr('\000a')||
''||unistr('\000a')||
'#THEME_CSS#',
  p_page_body_attr=>'onload="first_field()" style="background-color:#FFFFFF;margin:0;"',
  p_before_field_text=>'<div class="t20PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t20PopupBody">',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 2213327525937081178
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2213327525937081178 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t20DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t20CalendarAlternative1Holder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t20MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td class="t20MonthBody">',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t20CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t20DayTitle">#DD#</div><br />',
  p_day_open_format=> '<td class="t20Day" valign="top">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t20Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="t20WeekendDayTitle">#DD#</div><br />',
  p_weekend_open_format => '<td valign="top" class="t20WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t20NonDayTitle">#DD#</div><br />',
  p_nonday_open_format => '<td class="t20NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '',
  p_weekly_day_of_week_format => '',
  p_weekly_month_open_format => '',
  p_weekly_month_close_format => '',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '',
  p_weekly_day_close_format => '',
  p_weekly_today_open_format => '',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '',
  p_weekly_weekend_close_format => '',
  p_weekly_time_open_format => '',
  p_weekly_time_close_format => '',
  p_weekly_time_title_format => '',
  p_weekly_hour_open_format => '',
  p_weekly_hour_close_format => '',
  p_daily_day_of_week_format => '',
  p_daily_month_title_format => '',
  p_daily_month_open_format => '',
  p_daily_month_close_format => '',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '',
  p_daily_day_close_format => '',
  p_daily_today_open_format => '',
  p_daily_time_open_format => '',
  p_daily_time_close_format => '',
  p_daily_time_title_format => '',
  p_daily_hour_open_format => '',
  p_daily_hour_close_format => '',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '',
  p_agenda_past_day_format => '',
  p_agenda_today_day_format => '',
  p_agenda_future_day_format => '',
  p_agenda_past_entry_format => '',
  p_agenda_today_entry_format => '',
  p_agenda_future_entry_format => '',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 2213327743005081186
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2213327743005081186 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t20DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t20CalendarHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t20MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td class="t20MonthBody">',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t20Calendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t20DayTitle">#DD#</div><br />',
  p_day_open_format=> '<td class="t20Day" valign="top">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t20Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="t20WeekendDayTitle">#DD#</div><br />',
  p_weekend_open_format => '<td valign="top" class="t20WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t20NonDayTitle">#DD#</div><br />',
  p_nonday_open_format => '<td class="t20NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '',
  p_weekly_day_of_week_format => '',
  p_weekly_month_open_format => '',
  p_weekly_month_close_format => '',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '',
  p_weekly_day_close_format => '',
  p_weekly_today_open_format => '',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '',
  p_weekly_weekend_close_format => '',
  p_weekly_time_open_format => '',
  p_weekly_time_close_format => '',
  p_weekly_time_title_format => '',
  p_weekly_hour_open_format => '',
  p_weekly_hour_close_format => '',
  p_daily_day_of_week_format => '',
  p_daily_month_title_format => '',
  p_daily_month_open_format => '',
  p_daily_month_close_format => '',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '',
  p_daily_day_close_format => '',
  p_daily_today_open_format => '',
  p_daily_time_open_format => '',
  p_daily_time_close_format => '',
  p_daily_time_title_format => '',
  p_daily_hour_open_format => '',
  p_daily_hour_close_format => '',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '',
  p_agenda_past_day_format => '',
  p_agenda_today_day_format => '',
  p_agenda_future_day_format => '',
  p_agenda_past_entry_format => '',
  p_agenda_today_entry_format => '',
  p_agenda_future_entry_format => '',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calender
prompt  ......template 2213327930387081187
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 2213327930387081187 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calender',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t20SmallCalenderHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t20MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td class="t20MonthBody">',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t20SmallCalender">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t20DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t20Day" valign="top">#TITLE_FORMAT##DATA#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t20Today">#TITLE_FORMAT##DATA#',
  p_weekend_title_format=> '<div class="t20WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t20WeekendDay">#TITLE_FORMAT##DATA#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t20NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t20NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '',
  p_weekly_day_of_week_format => '',
  p_weekly_month_open_format => '',
  p_weekly_month_close_format => '',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '',
  p_weekly_day_close_format => '',
  p_weekly_today_open_format => '',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '',
  p_weekly_weekend_close_format => '',
  p_weekly_time_open_format => '',
  p_weekly_time_close_format => '',
  p_weekly_time_title_format => '',
  p_weekly_hour_open_format => '',
  p_weekly_hour_close_format => '',
  p_daily_day_of_week_format => '',
  p_daily_month_title_format => '',
  p_daily_month_open_format => '',
  p_daily_month_close_format => '',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '',
  p_daily_day_close_format => '',
  p_daily_today_open_format => '',
  p_daily_time_open_format => '',
  p_daily_time_close_format => '',
  p_daily_time_title_format => '',
  p_daily_hour_open_format => '',
  p_daily_hour_close_format => '',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '',
  p_agenda_past_day_format => '',
  p_agenda_today_day_format => '',
  p_agenda_future_day_format => '',
  p_agenda_past_entry_format => '',
  p_agenda_today_entry_format => '',
  p_agenda_future_entry_format => '',
  p_month_data_format => '#DAYS#',
  p_month_data_entry_format => '#DATA#',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/traditional_blue
prompt  ......theme 2213328336383081198
begin
wwv_flow_api.create_theme (
  p_id =>2213328336383081198 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_name=>'Traditional Blue',
  p_ui_type_name=>'DESKTOP',
  p_is_locked=>false,
  p_default_page_template=>2213308932387081110 + wwv_flow_api.g_id_offset,
  p_error_template=>2213308351071081108 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>2213309843227081115 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'',
  p_login_template=>2213308149283081100 + wwv_flow_api.g_id_offset,
  p_default_button_template=>2213310728649081116 + wwv_flow_api.g_id_offset,
  p_default_region_template=>2213316157183081133 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>2213313148412081128 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>2213313442932081129 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>2213316157183081133 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>2213316157183081133 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>2213317943634081136 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>2213312254383081128 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>2213316157183081133 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>null + wwv_flow_api.g_id_offset,
  p_default_report_template   =>2213324530777081169 + wwv_flow_api.g_id_offset,
  p_default_label_template=>2213327043280081174 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>2213327329819081174 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>2213327525937081178 + wwv_flow_api.g_id_offset,
  p_default_list_template=>2213322127847081162 + wwv_flow_api.g_id_offset,
  p_default_option_label=>2213327043280081174 + wwv_flow_api.g_id_offset,
  p_default_header_template=>null + wwv_flow_api.g_id_offset,
  p_default_footer_template=>null + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'NONE',
  p_default_popup_transition=>'NONE',
  p_default_required_label=>2213327231471081174 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
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
