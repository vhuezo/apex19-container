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
--application/shared_components/plugins/item_type/com_af_plugin_jq_fileupload
 
begin
 
wwv_flow_api.create_plugin (
  p_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_name => 'COM.AF.PLUGIN.JQ.FILEUPLOAD'
 ,p_display_name => 'Multiple File Upload'
 ,p_supported_ui_types => 'DESKTOP'
 ,p_image_prefix => '#PLUGIN_PREFIX#'
 ,p_render_function => 'plugin_jquery_file_upload.plugin_render'
 ,p_ajax_function => 'plugin_jquery_file_upload.plugin_ajax_handler'
 ,p_standard_attributes => 'VISIBLE:ELEMENT:WIDTH:HEIGHT:ELEMENT_OPTION'
 ,p_substitute_attributes => true
 ,p_subscribe_plugin_settings => true
 ,p_help_text => '<p>'||unistr('\000a')||
'	This plugin has been developed by Matt Nolan (APEX Freelancer). Please visit the online <a href="http://www.theapexfreelancer.com/apex/f?p=APEXFREELANCER:FILE_UPLOAD::DOCUMENTATION" target="_blank">documentation</a> for a detailed help/instruction guide and license information.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	<strong>Note: </strong>this is a commercial APEX plugin and requires that a suitable license be purchased.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'	<strong>Change Log:</strong></p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v2.1.0 - 06-Jan-2015</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added the option to force upload via the iframe technique for uploading large files in a single HTTP post.</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added chunked file upload support to bypass increasing maxPostSize on the web server</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v2.0.2 - 22-Dec-2015</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: added the ability to strip files from the &quot;files&quot; array which is passed as a parameter within the &quot;Multiple File Upload - Before Starting Upload of All Files&quot; event.</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Bug Fix: incorrect event naming for &quot;Multiple File Upload - Before Start of File Upload&quot; and &quot;Multiple File Upload - Before Starting Upload of All Files&quot;.</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v2.0.1 - 17-Feb-2014</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Removed the package compilation dependency on UTL_FILE. You still need to grant execute privileges on SYS.UTL_FILE if you want to upload files to the file system. This change just allows you to avoid having to grant the privilege if you don&#39;t use the write to File System feature in the plugin.</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v2.0.0 - 10-Feb-2014</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added support for saving files to an APEX Collection</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added support for saving files to BFILE column and File System</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Changed the event labels so they are easier to recognize</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added 2 new events to fire when all files have finished uploading</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added the option to auto close the dialog when all files have been uploaded</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added the option to show/hide previous uploads in the dialog</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Changed foreign key column/item to support up to 4 columns/items</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Bug Fix: File Size column value was always null</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v1.10 - 19-Jun-2012</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Bug Fix: this.data not set correctly for events</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Improvement: Added a &quot;Before Start&quot; event thaat fires before the first file is uploaded</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v1.09 - 13-Apr-2011</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Bug Fix: APEX 4.1.1 page protection issue in non HTML5 browsers</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Bug Fix: APEX 4.1.1 download link blank page issue</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v1.08 - 21-Nov-2011</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				APEX 4.1 IE bug fix in iframe response</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v1.07 - 03-Aug-2011</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				Bug Fix release for translation issues</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'	<li>'||unistr('\000a')||
'		<strong>v1.06 - 29-Jul-2011</strong>'||unistr('\000a')||
'		<ul>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				translation support added</li>'||unistr('\000a')||
'			<li>'||unistr('\000a')||
'				substitution strings supported in plugin attributes</li>'||unistr('\000a')||
'		</ul>'||unistr('\000a')||
'	</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<div>'||unistr('\000a')||
'	<a href="http://www.theapexfreelancer.com/" target="_blank"><img alt="APEX Freelancer" src="http://www.theapexfreelancer.com/c/af-logo.png" style="height: 110px; width: 125px" /></a></div>'||unistr('\000a')||
''
 ,p_version_identifier => '2.1.0'
 ,p_about_url => 'http://www.theapexfreelancer.com/apex/f?p=APEXFREELANCER:FILE_UPLOAD'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3765839428168130013 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'APPLICATION'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Upload Piece Size'
 ,p_attribute_type => 'INTEGER'
 ,p_is_required => false
 ,p_default_value => '1536000'
 ,p_display_length => 10
 ,p_is_translatable => false
 ,p_help_text => '<p>Please enter a size in number of bytes which will be used to transfer the base64 encoded files in pieces/chunks e.g. 1536000. The actual piece size during transmission may be slightly larger than your setting due to base64 encoding. For files that are uploaded via HTML5 File API (enabled by default for browsers which support this) and whose size exceed this "Upload Piece Size" setting they will be uploaded in pieces i.e. multiple AJAX calls and stored in a temporary collection until fully uploaded and stored in your choice of destination.</p>'||unistr('\000a')||
'<p>Piece by piece uploads for each file have been implemented to support large file sizes and avoid the need to increase the web server''s maxPostSize limit. The larger the chunk size the faster the file will be uploaded and less stress is placed on the DB since each chunk must be appended to the previous. We recommend that you set the chunkSize to a value (several hundred KB) below your current maxPostSize setting. The default on most web servers is 2MB.</p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li>1MB = 1048576</li>'||unistr('\000a')||
'<li>1.5MB = 1536000 (Our recommendation)</li>'||unistr('\000a')||
'<li>2MB = 2097152</li>'||unistr('\000a')||
'<li>etc.</li>'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'<p><strong>Note:</strong> this setting is ignored when the "Upload via iFrame" option is selected, since the iframe technique uses a non-HTML5 traditional file upload and uploads the entire file in one form POST. We would suggest using this iframe technique for regular file uploads that are greater than 50MB</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754382364760646277 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 1
 ,p_display_sequence => 10
 ,p_prompt => 'Table/Collection Name'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 32
 ,p_max_length => 100
 ,p_is_translatable => false
 ,p_help_text => '<p>If you have selected the "Save To" destination as Table or File System then please enter the name of the table where the file information will be stored. The file will be uploaded and stored in a BLOB for the Table option. If you have chosen File System then the file will be uploaded to the file system directory and stored in a BFILE reference column.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'<strong>Note:</strong> It is assumed that this will be a specific file table as multiple files can be uploaded. The foreign key column(s) attribute is used to define the link between this table and a parent table which the files are associated with.</p>'||unistr('\000a')||
'<p>If you have selected Collection in the "Save To" option, the files will be uploaded to the collection name provided here. The plugin will check for the existence of this collection and create it if it does not exist. You will be responsible for processing the collection (and clearing) which can be done at page submission. You can query the collection as follows:</p>'||unistr('\000a')||
'<pre>'||unistr('\000a')||
'SELECT'||unistr('\000a')||
'  dbms_lob.getlength(blob001) PLUGIN_CONTENTS,'||unistr('\000a')||
'  c001 FILE_NAME,'||unistr('\000a')||
'  c002 MIME_TYPE,'||unistr('\000a')||
'  n001 FILE_SIZE'||unistr('\000a')||
'FROM'||unistr('\000a')||
'  APEX_COLLECTIONS '||unistr('\000a')||
'WHERE '||unistr('\000a')||
'  COLLECTION_NAME = ''&COLLECTION_NAME'''||unistr('\000a')||
'</pre>'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754382876880649771 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 2
 ,p_display_sequence => 20
 ,p_prompt => 'Filename Column'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 32
 ,p_max_length => 32
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'TABLE,FILE'
 ,p_help_text => 'Specify the name of the column where the filename of the uploaded file should be stored at. The stored filename is also used by the browser in the "Save As" dialog when the file gets downloaded.'||unistr('\000a')||
'<br /><br />'||unistr('\000a')||
'It''s not necessary that the column also exists as page item on the current page.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754383350000651454 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 3
 ,p_display_sequence => 30
 ,p_prompt => 'Mime Type Column'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 32
 ,p_max_length => 32
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'TABLE,FILE'
 ,p_help_text => 'Specify the name of the column where the mime type of the uploaded file should be stored at. If specified, the stored mime type is also used by the browser to identify which application should be used to display the content of the BLOB when the file gets downloaded.'||unistr('\000a')||
'<br /><br />'||unistr('\000a')||
'It''s not necessary that the column also exists as page item on the current page.'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754383855541653059 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 4
 ,p_display_sequence => 40
 ,p_prompt => 'File Size Column'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 32
 ,p_max_length => 32
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'TABLE,FILE'
 ,p_help_text => 'Specify the name of the column where the file size will be stored.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754384375626658847 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 5
 ,p_display_sequence => 50
 ,p_prompt => 'BLOB/BFILE Column'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 32
 ,p_max_length => 32
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'TABLE,FILE'
 ,p_help_text => '<p>Enter the name of the column where the actual uploaded file will be stored. If you have chosen TABLE as the "Save To" destination then this column must be a BLOB data type, whereas if you selected "File System" then this column must be a BFILE data type.</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754384881167660474 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 6
 ,p_display_sequence => 60
 ,p_prompt => 'Primary Key Column'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_display_length => 32
 ,p_max_length => 32
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'TABLE,FILE'
 ,p_help_text => 'Enter the name of the primary key column for the file record. The primary key is used as a locator for downloading the file once uploaded. It is expected that the primary key value is generated by a trigger on the table either populated by an incrementing sequence or using SYS_GUID().'||unistr('\000a')||
'<br /><br />'||unistr('\000a')||
'<strong>Note:</strong> only one primary key column is currently supported due to the limited number of custom attributes available in APEX 4.0. However this may change in future releases of the plugin.'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754385356018662652 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 7
 ,p_display_sequence => 70
 ,p_prompt => 'Foreign Key Column(s)'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 32
 ,p_max_length => 200
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'IN_LIST'
 ,p_depending_on_expression => 'TABLE,FILE'
 ,p_help_text => '<p>This column is optional. Leave it blank if you intend to just upload files that have no association with any tables/records in your application. '||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Enter the name of the foreign key column(s) for the file record. If you are using more than one foreign key column then please separate the column names using a comma "," and ensure that they appear in the same order as the "Foreign Key Item(s)" plugin setting. A maximum of 5 columns can be entered.'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>The foreign key is used to associate the file record with a parent record e.g. employee_id. It is expected that the foreign key value will be sourced from an item on the page or available in session state.'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'<strong>Note:</strong> Only 5 foreign key column are supported, if you require support for more foreign key items you will need to do this within a Database Trigger.'||unistr('\000a')||
'</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3746127430905806799 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 8
 ,p_display_sequence => 80
 ,p_prompt => 'Foreign Key Page Item(s)'
 ,p_attribute_type => 'PAGE ITEMS'
 ,p_is_required => true
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3754385356018662652 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'NOT_NULL'
 ,p_help_text => '<p>This setting is dependent upon the foreign key column(s) attribute having a value. Leave it blank if you intend to just upload files that have no association with any tables/records in your application. '||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'Enter the name of the page item(s) or application item set in session state that will be referenced/used for obtaining the foreign key value(s) that will form part of the insert statement for the uploaded file record(s). If you are using more than one foreign key column then please separate the column names using a comma "," and ensure that they appear in the same order as the "Foreign Key Column(s)" plugin setting'||unistr('\000a')||
'</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'<strong>Note:</strong> Only 5 foreign key columns are supported, if you require support for more foreign key items you will need to do this within a Database Trigger.'||unistr('\000a')||
'</p>'||unistr('\000a')||
''
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754386381991670192 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 9
 ,p_display_sequence => 90
 ,p_prompt => '(HTML5 Only) File Size Limit (KB)'
 ,p_attribute_type => 'NUMBER'
 ,p_is_required => false
 ,p_default_value => '1024'
 ,p_display_length => 32
 ,p_max_length => 32
 ,p_is_translatable => false
 ,p_help_text => '<p><strong>Note:</strong> this attribute is only enforced in browsers that support the HTML5 file capability. The value required is in Kilobytes (KB).</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3754539059003564722 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 10
 ,p_display_sequence => 100
 ,p_prompt => '(HTML5 Only) Allowed File Extensions'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => false
 ,p_display_length => 32
 ,p_max_length => 500
 ,p_is_translatable => false
 ,p_help_text => '<p><strong>Note:</strong> this attribute is only enforced in browsers that support the HTML5 file capability. Do NOT include the dot "." when defining the file extension(s).'||unistr('\000a')||
'<br /><br />'||unistr('\000a')||
'Enter one or more file extensions separated by a comma'||unistr('\000a')||
'<br /><br />'||unistr('\000a')||
'e.g. Restrict uploaded files to only images'||unistr('\000a')||
'<br /><br />'||unistr('\000a')||
'png,jpg,jepg,gif'||unistr('\000a')||
'<br /><br />'||unistr('\000a')||
'Leaving this attribute blank will mean that all file types are allowed.'||unistr('\000a')||
'</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 11
 ,p_display_sequence => 1
 ,p_prompt => 'Save To'
 ,p_attribute_type => 'SELECT LIST'
 ,p_is_required => true
 ,p_default_value => 'TABLE'
 ,p_is_translatable => false
 ,p_help_text => '<p>Choose the destination of where the file will be uploaded to:</p>'||unistr('\000a')||
'<ul style="margin-left:25px;">'||unistr('\000a')||
'<li><b>TABLE</b> - the file will be uploaded to a database table</li>'||unistr('\000a')||
'<li><b>COLLECTION</b> - the file will be uploaded to a collection of your choice using the table/collection name attribute</li>'||unistr('\000a')||
'<li><b>FILE SYSTEM</b> - the file will be uploaded to a named directory which your application parsing schema has read/write access to</li>'||unistr('\000a')||
'</ul>'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 3744460825369653563 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Table'
 ,p_return_value => 'TABLE'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 3744465128832654578 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Collection'
 ,p_return_value => 'COLLECTION'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 3744469432642655623 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 30
 ,p_display_value => 'File System'
 ,p_return_value => 'FILE'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3744524520437671019 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 12
 ,p_display_sequence => 85
 ,p_prompt => 'Show Previously Uploaded FIles'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3754385356018662652 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'NOT_NULL'
 ,p_help_text => '<p>a Yes/No option to show a maximum of 25 previously uploaded files within the file upload dialog that are located using the foreign key values.'||unistr('\000a')||
'</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3745291026482677742 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 13
 ,p_display_sequence => 3
 ,p_prompt => 'Overwrite Existing Files'
 ,p_attribute_type => 'CHECKBOX'
 ,p_is_required => false
 ,p_default_value => 'N'
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'FILE'
 ,p_help_text => '<p>Choose the action to perform when uploading files with the same name. If you choose not to overwrite files with the same name the primary key value will be appended to the filename so that it has a unique reference.</p>'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3765817535740103815 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 14
 ,p_display_sequence => 140
 ,p_prompt => 'Options'
 ,p_attribute_type => 'CHECKBOXES'
 ,p_is_required => false
 ,p_is_translatable => false
 ,p_help_text => '<p>Options:</p>'||unistr('\000a')||
'<ul>'||unistr('\000a')||
'<li><strong>Close Dialog on Upload Completion<p> - check this option to close the uploaded files dialog when all files have been successfully uploaded. <strong>Note: </strong> if an error occurs during upload for one or more of the files the dialog will not be closed.</li>'||unistr('\000a')||
'<li><strong>Upload via iFrame<p> - check this option upload files via the iframe upload technique. With this option you can only upload 1 file at a time. This is for situations where you are uploading large files and do not want to increase the maxPostSize on your webserver which the default AJAX method uses. The downside to this approach is that it does not use the HTML5 File API functionality therefore you cannot track the progress of the file upload and you cannot select multiple files.</li>'||unistr('\000a')||
'</ul>'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 3765822442666105879 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 3765817535740103815 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 10
 ,p_display_value => 'Close Dialog on Upload Completion'
 ,p_return_value => 'CLOSE_DIALOG'
  );
wwv_flow_api.create_plugin_attr_value (
  p_id => 3765826748554107522 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_attribute_id => 3765817535740103815 + wwv_flow_api.g_id_offset
 ,p_display_sequence => 20
 ,p_display_value => 'Upload via iFrame (for large file support)'
 ,p_return_value => 'FORCE_IFRAME_UPLOAD'
  );
wwv_flow_api.create_plugin_attribute (
  p_id => 3744700448946887474 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_attribute_scope => 'COMPONENT'
 ,p_attribute_sequence => 15
 ,p_display_sequence => 2
 ,p_prompt => 'Directory Name'
 ,p_attribute_type => 'TEXT'
 ,p_is_required => true
 ,p_is_translatable => false
 ,p_depending_on_attribute_id => 3744456321906652541 + wwv_flow_api.g_id_offset
 ,p_depending_on_condition_type => 'EQUALS'
 ,p_depending_on_expression => 'FILE'
 ,p_help_text => '<p>this attribute applies only when the FILE SYSTEM is selected for the "Save To" option. Please provide the name of a directory which your application parsing schema has read/write access to. See the <a href="http://docs.oracle.com/cd/E11882_01/server.112/e41084/statements_5007.htm#SQLRF01207" target="_blank">Oracle Documentation</a> for more information.</p>'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3771871575512520524 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'beforestart'
 ,p_display_name => 'Multiple File Upload - Before Starting Upload of All Files'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3754496856435782731 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'oncancel'
 ,p_display_name => 'Multiple File Upload - After File Upload Cancelled'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3754497466825785666 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'oncomplete'
 ,p_display_name => 'Multiple File Upload - After File Upload Completed'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3744564021307709177 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'oncompleteall'
 ,p_display_name => 'Multiple File Upload - After All Files Uploaded'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3745404729561076065 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'onerror'
 ,p_display_name => 'Multiple File Upload - After File Upload Error'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3745487321961225271 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'onerrorall'
 ,p_display_name => 'Multiple File Upload - After All Files Uploaded with 1 or More Failures'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3754496581585780450 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'onprogress'
 ,p_display_name => 'Multiple File Upload - File Upload Progress'
  );
wwv_flow_api.create_plugin_event (
  p_id => 3754497160591783871 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_name => 'onsubmit'
 ,p_display_name => 'Multiple File Upload - Before Start of File Upload'
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000050000002308030000006B4430FC0000001974455874536F6674776172650041646F626520496D616765526561647971C9653C00000069504C5445F1F1F2F7F7F7EEEEEFEDEDEDF0F1F1F8F8F9E8E8E9C6';
wwv_flow_api.g_varchar2_table(2) := 'C7C7E7E7E7D5D5D6D8D8D9F4F4F4E1E2E2EAEBEBFBFBFCDDDEDEFAFAFAE4E4E5F6F6F6EFEFF0DFDFE0F9F9FAFBFBFBDCDCDDE5E6E6E9E9EAF2F3F3D9D9DAF5F5F5E3E3E4DADBDCE0E0E1ECECECD6D7D7F7F7F8819F1BC7000000504944415478DA24C109';
wwv_flow_api.g_varchar2_table(3) := '1242000040D19F2CD929640971FF439A3FDEA3128368442F22718A87788B9FC8C52C6EA1F888403CC55F946212B1788951B4621585D845276AF1159B5844260E918A44970003008BD90BA0B806EB800000000049454E44AE426082';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3754511670703185702 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'bg-btn.png'
 ,p_mime_type => 'image/png'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '47494638396106001D00D500004646464848482F2F2F3131313030304040403636363C3C3C2929292A2A2A3838382525254949493333333737373232322D2D2D2C2C2C3535354C4C4C3D3D3D4E4E4E3F3F3F4444444242423A3A3A4343434A4A4A272727';
wwv_flow_api.g_varchar2_table(2) := '3B3B3B4545454747473434344141413E3E3E4B4B4B2E2E2E2B2B2B3939392626262828284D4D4D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(3) := '000000000021F90400000000002C0000000006001D00000672C04A6A98AA4C86C7D468C9DC389D8C40201AFD58AF000F609BF55C2E1E8F4683196B42E874C1B22E1444F038E5303F1C329D7CDEC4EF2B140E810A120685061220898A0F0F0D0D8D039104';
wwv_flow_api.g_varchar2_table(4) := '030402969504249A9B1110119D1025A2A3080809A70928AAA5281CAAAE1CB127B3270BB5B30B41003B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3754512368546186750 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'bg-submit.gif'
 ,p_mime_type => 'image/gif'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '47494638396110001000D52500B7B7B720201FCBCBCBF1F1F1707070F9F9F9888989F9F9FAF4F4F4383838888889D6D6D6C6C6C6F7F7F7201F1F1F1F1FFBFBFB373838FDFEFDEBEBEBF6F6F71F2020202020D0CFCFFBFBFCFDFDFDFEFEFEFCFBFBFDFEFE';
wwv_flow_api.g_varchar2_table(2) := '898888A8A8A8F1F1F25454540F0F0F666666FFFFFF999999FFFEFE00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(3) := '000000000021F90401000025002C0000000010001000000672C09270482C1249C82449642C9146D0E848443292344AD2825A3D660C064547711199994312842068131893C3A12B7C82EEF8FB88EE1C2500808011097B47120F010E16010115011C7C2418';
wwv_flow_api.g_varchar2_table(4) := '211E9596211B9105219C9D9C05910D9E9E149108A39D08911F03AC1FAFAF037C4E594A4DB74441003B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3754513065958187909 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'icon-generic.gif'
 ,p_mime_type => 'image/gif'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '47494638396110001000D53600DDDDDE383838FBFCFCFBFBFBDCDDDED7D7D7AAAAAAE5E5E5FBFCFB888889202020C0C0C0F4F3F3B6B6B6F3F4F537383888898989888880808020201FDDDDDDF8F7F7E8E7E8E4E4E4DFDFE0DCDDDDE3E3E4DFDFDFADADAD';
wwv_flow_api.g_varchar2_table(2) := 'EAEAEA383738F7F7F8373738ECEDECEFF0F0FCFBFBFCFCFBE0E0E01F1F1FEBEBECDDDCDE707071898889E7E7E8EFEFEFDBDBDBFAFBFAFAFBFB1F2020707070545454D4D4D40F0F0F999999FFFEFE00000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(3) := '000000000021F90401000036002C0000000010001000000680409B70482C0E6BC8A4127944200683116920A822043561CDB55CBEB2B6DA07024944CC8BCE425501D71CB1B8FC404F31DC0E997EDF283564775A220101202D011E0F840F2C6E2126130592';
wwv_flow_api.g_varchar2_table(4) := '13301C0A0A276E1634339D9D120606342B6E179C9E9FA21A6E1834AEAFB01B6E00190000140004BA00281460615D4B46C3C4C54441003B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3754513763586189015 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'icon-image.gif'
 ,p_mime_type => 'image/gif'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '47494638396110001000D53B00DDDDDEFBFCFC8A8A8AF7F7F7DCDDDEFBFBFBFBFCFB9F9F9F3F3F3F5A5A5AA4A4A4AAAAAAF4F3F33E3F3FF8F8F8F5F5F5F3F4F5DDDDDD3131315A5B5ADFDFDFDFDFE0F8F7F7888888F7F7F85F5E5FB5B5B5EFEFEF898A8A';
wwv_flow_api.g_varchar2_table(2) := '3D3D3DECEDEC939393919191FAFBFA3F3E3F4849490F1010EBEBECFCFCFBF9F9F9EFF0F0838383E7E7E8636363DCDDDDFCFBFBE8E7E8FAFBFBF4F4F4252526DDDCDE5A5A5BE4E4E4E3E3E47F7F7F7474742525250F0F0F999999FFFEFE00000000000000';
wwv_flow_api.g_varchar2_table(3) := '000000000021F9040100003B002C0000000010001000000684C09D70482C0E75C8A4127934180A8596A910A81A023AA12EB45CBEB23B1D2679501C9416B00E925C9C346724430D1108380A876301B2CFB52837821F038529821B6A1E093313360F0F172B';
wwv_flow_api.g_varchar2_table(4) := '0909256A2E0899193037230D0D222A6A34313838121D12A6A6356A1539B024B0B339146A002C0000110004BE00321160615D4B46C7C8C94441003B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3754514460567190393 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'icon-media.gif'
 ,p_mime_type => 'image/gif'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '47494638396110001000D52A008A8A8ADDDDDEFBFCFC3F3F3FFBFCFBDCDDDE3E3F3F3F3E3FF3F4F5F4F3F3DDDDDDE8E7E8E3E3E4EFF0F0FCFBFBEBEBECFAFBFBDFDFDF5A5A5BEFEFEFECEDECDCDDDDFCFCFB898A8ADFDFE0E4E4E45A5B5AF8F7F7DDDCDE';
wwv_flow_api.g_varchar2_table(2) := 'F7F7F82525260F1010FAFBFAE7E7E85A5A5A747474E0E0E07F7F7F2525250F0F0FFBFBFB999999FFFEFE00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(3) := '000000000021F9040100002A002C0000000010001000000680409570482C0E53C8A4127924105028870525A8120429610A94229552D0548994826455A90EB204857E539B730A916CA39209390200B8DCC17C00795A0D238676862313721422121A226422';
wwv_flow_api.g_varchar2_table(4) := '93220F720B03990763069D072172191E26A45EA4A40C721827AC1F63ACAC1172011501010A0105BA011C0A67684BC146C3C4C54441003B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3754515156901192062 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'icon-zip.gif'
 ,p_mime_type => 'image/gif'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '4749463839610F000F00A50000443E3CA4A6A47C7A7CD4D6D45C5A5CECEEEC4C4E4C8C8E8C646664C4C2C4FCFAFC444644E4E2E4FCF6F49C9A9C6C6E6CCCCACC8C8A8C645E5CF4F6F45C56546C66644C4644ECEAEC444244BCBABC848284DCDEDC5C5E5C';
wwv_flow_api.g_varchar2_table(2) := 'F4F2F4544E4C949294C4C6C4FCFEFCE4E6E49C9E9CD4CECC6C6A6C4C4A4C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(3) := '000000000021FF0B4E45545343415045322E30030100000021F90409060021002C000000000F000F00000677C09070482C0A1B9364C3480C582C0B5367F461300F00C0A2A3015840C58B0780D98A2265EBF003D0640C05215B4324003621884258C098F6';
wwv_flow_api.g_varchar2_table(4) := '4216064C1C00134314186A79211D7E4411001143150E0E0002440C26181F17210859180345200B0012A0590F87450C1A0821150BB4744C42131DB9ADB74C410021F90409060026002C000000000F000F0085443E3CA4A6A4747274D4D6D45C5654ECEEEC';
wwv_flow_api.g_varchar2_table(5) := 'C4C2C48C8A8C4C4A4CE4E2E4B4B2B47C7E7CFCFAFC444644E4DEDC6C6A6CD4D2D49C9694545254ACA6A4DCDEDC5C5E5CF4F6F4CCCACC544E4CECEAEC8486844442447C7A7CDCDADC5C5A5CF4F2F4C4C6C49492944C4E4CE4E6E4B4B6B4848284FCFEFC4C';
wwv_flow_api.g_varchar2_table(6) := '46449C9E9CACAAAC000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000067A40935078891486C8E4A7E1213192C84CA8010068A04208A2';
wwv_flow_api.g_varchar2_table(7) := '0AD88028976406035880360B8660E34086CAC207C5F42E213D80B929232C6C104827225815001643041B23427C261F270D48070007260C0F8B28001C4809081216130001281B1B1D49200A23225C1B245826241B551C03B1590F5EB8430C240149410021';
wwv_flow_api.g_varchar2_table(8) := 'F90409060010002C000000000F000F0085443E3CA4A2A4747674D4D2D45C5A5CECEAEC4C4E4C949294F4F6F4DCDEDC444644C4C6C48482846C6A6C5C5654545654FCFEFCB4B6B47C7E7CDCDADC646264F4F2F4544E4C9C9E9CFCF6F4E4E6E44C46444442';
wwv_flow_api.g_varchar2_table(9) := '44ACAAAC7C7A7CD4D6D45C5E5CECEEEC949694E4E2E4CCCACC8C8684746E6C545254FCFAFC4C4A4C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(10) := '0000000000000000000677408870380C808848222594141642048D63A34924072800C0B0D17690050B40623D00360704D12C1996049ED38848D8588503210545D4189A1F006A420E2618101E1542150A1A440B151924168A1017005F441C590D1015171B';
wwv_flow_api.g_varchar2_table(11) := '1B13481C5A1B1F5D1B114918A80A000A1213274D230A05834D4317BA10410021F90409060018002C000000000F000F0085443E3CA4A2A4747274D4D2D45452548C8A8CECEAEC4C4A4C7C7E7CDCDEDC5C5E5C949694F4F6F45C5A5C4C4644B4B6B47C7A7C';
wwv_flow_api.g_varchar2_table(12) := 'DCDADC5C5654949294544E4C8C8684E4E6E49C9E9CFCFEFC4442447C7674D4D6D45456548C8E8CF4F2F44C4E4C848284E4E2E46462649C9694FCFAFCBCBABC00000000000000000000000000000000000000000000000000000000000000000000000000';
wwv_flow_api.g_varchar2_table(13) := '00000000000000000000000000000000000000000000000000000000000000000000000000000000000673408C70482C1A8F46C3A2E1907442988085383800009F0CE050C94C85060A0091C0840A57EF70322696B4802F46A3800A230AC2E72327314824';
wwv_flow_api.g_varchar2_table(14) := '437E8044221C041C25431E05138204570B441700104490001D06181E1719191B821C029F19225A190F45130C09201F001908A148420CB5B843410021F90409060019002C000000000F000F0085443E3CA4A2A4747274D4D2D4ECEAEC5C56548C8A8CBCBA';
wwv_flow_api.g_varchar2_table(15) := 'BC4C4A4CDCDEDCF4F6F4949694C4C6C4ACAEAC7C7E7C6C6A6C5452544C4644DCDADCF4F2F45C5E5C949294C4C2C4544E4CE4E6E4FCFEFC9C9E9CB4B6B4848684444244D4D6D4ECEEEC5C5A5C8C8E8CBCBEBC4C4E4CE4E2E4FCFAFC9C9A9CCCCECCB4B2B4';
wwv_flow_api.g_varchar2_table(16) := '8482840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000673C08C70482C1A8F46C20214298448C7010200187500088BD1F348253224';
wwv_flow_api.g_varchar2_table(17) := '43A7031D0606A512B10270605019C938851996448071A524A002401219130257551F2263000D13431301530D1922121C00214525180B6A422453211F821A1007460C631D14571D1B47092923580E8148420A9CB5B941003B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3754515854528193227 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'loading.gif'
 ,p_mime_type => 'image/gif'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0D0A202A20687474703A2F2F6769746875622E636F6D2F76616C756D732F66696C652D75706C6F616465720D0A202A0D0A202A204D756C7469706C652066696C652075706C6F616420636F6D706F6E656E7420776974682070726F67726573732D';
wwv_flow_api.g_varchar2_table(2) := '6261722C20647261672D616E642D64726F702E0D0A202A20C2A9203230313020416E647265772056616C756D73202820616E647265772861742976616C756D732E636F6D20290D0A202A0D0A202A204C6963656E73656420756E646572204D49542E0D0A';
wwv_flow_api.g_varchar2_table(3) := '202A2F0D0A2F2A2A0D0A202A2044656D6F3A20687474703A2F2F7777772E74686561706578667265656C616E6365722E636F6D2F617065782F663F703D41504558465245454C414E4345523A46494C455F55504C4F41440D0A202A0D0A202A20466F726B';
wwv_flow_api.g_varchar2_table(4) := '65642076657273696F6E206F66207468652061626F7665207363726970742070726F766964656420627920416E647265772056616C756D730D0A202A20C2A92032303136204D617474204E6F6C616E2028206D6174742E6E6F6C616E2861742974686561';
wwv_flow_api.g_varchar2_table(5) := '706578667265656C616E6365722E636F6D20290D0A202A0D0A202A20412076616C696420636F6D6D65726369616C206C6963656E736520697320726571756972656420746F207573652074686973204150455820506C7567696E0D0A202A207669736974';
wwv_flow_api.g_varchar2_table(6) := '20687474703A2F2F7777772E74686561706578667265656C616E6365722E636F6D2F20746F2070757263686173652061206C6963656E73650D0A202A0D0A202A204E6F74653A2070617274206F6620746865206C6963656E73652070726F636565647320';
wwv_flow_api.g_varchar2_table(7) := '77696C6C20626520646F6E6174656420746F20416E647265772056616C756D730D0A202A202020202020206173207468697320706C7567696E20776F756C64206E6F7420657869737420776974686F7574206869732062617365206C6576656C20636F64';
wwv_flow_api.g_varchar2_table(8) := '650D0A202A2F0D0A0D0A2F2F0D0A2F2F2048656C7065722066756E6374696F6E730D0A2F2F0D0A0D0A766172207171203D207171207C7C207B7D3B0D0A0D0A2F2A2A0D0A202A204164647320616C6C206D697373696E672070726F706572746965732066';
wwv_flow_api.g_varchar2_table(9) := '726F6D207365636F6E64206F626A20746F206669727374206F626A0D0A202A2F0D0A71712E657874656E64203D2066756E6374696F6E2866697273742C207365636F6E6429207B0D0A202020666F7220287661722070726F7020696E207365636F6E6429';
wwv_flow_api.g_varchar2_table(10) := '207B0D0A20202020202066697273745B70726F705D203D207365636F6E645B70726F705D3B0D0A2020207D0D0A7D3B0D0A0D0A2F2A2A0D0A202A20536561726368657320666F72206120676976656E20656C656D656E7420696E20746865206172726179';
wwv_flow_api.g_varchar2_table(11) := '2C2072657475726E73202D31206966206974206973206E6F742070726573656E742E0D0A202A2040706172616D207B4E756D6265727D205B66726F6D5D2054686520696E64657820617420776869636820746F20626567696E2074686520736561726368';
wwv_flow_api.g_varchar2_table(12) := '0D0A202A2F0D0A71712E696E6465784F66203D2066756E6374696F6E286172722C20656C742C2066726F6D29207B0D0A202020696620286172722E696E6465784F66292072657475726E206172722E696E6465784F6628656C742C2066726F6D293B0D0A';
wwv_flow_api.g_varchar2_table(13) := '0D0A20202066726F6D203D2066726F6D207C7C20303B0D0A202020766172206C656E203D206172722E6C656E6774683B0D0A0D0A2020206966202866726F6D203C2030292066726F6D202B3D206C656E3B0D0A0D0A202020666F7220283B2066726F6D20';
wwv_flow_api.g_varchar2_table(14) := '3C206C656E3B2066726F6D2B2B29207B0D0A2020202020206966202866726F6D20696E20617272202626206172725B66726F6D5D203D3D3D20656C7429207B0D0A20202020202020202072657475726E2066726F6D3B0D0A2020202020207D0D0A202020';
wwv_flow_api.g_varchar2_table(15) := '7D0D0A20202072657475726E202D313B0D0A7D3B0D0A0D0A71712E676574556E697175654964203D202866756E6374696F6E2829207B0D0A202020766172206964203D20303B0D0A20202072657475726E2066756E6374696F6E2829207B0D0A20202020';
wwv_flow_api.g_varchar2_table(16) := '202072657475726E2069642B2B3B0D0A2020207D3B0D0A7D2928293B0D0A0D0A2F2F0D0A2F2F204576656E74730D0A0D0A71712E617474616368203D2066756E6374696F6E28656C656D656E742C20747970652C20666E29207B0D0A2020206966202865';
wwv_flow_api.g_varchar2_table(17) := '6C656D656E742E6164644576656E744C697374656E657229207B0D0A202020202020656C656D656E742E6164644576656E744C697374656E657228747970652C20666E2C2066616C7365293B0D0A2020207D20656C73652069662028656C656D656E742E';
wwv_flow_api.g_varchar2_table(18) := '6174746163684576656E7429207B0D0A202020202020656C656D656E742E6174746163684576656E7428276F6E27202B20747970652C20666E293B0D0A2020207D0D0A7D3B0D0A71712E646574616368203D2066756E6374696F6E28656C656D656E742C';
wwv_flow_api.g_varchar2_table(19) := '20747970652C20666E29207B0D0A20202069662028656C656D656E742E72656D6F76654576656E744C697374656E657229207B0D0A202020202020656C656D656E742E72656D6F76654576656E744C697374656E657228747970652C20666E2C2066616C';
wwv_flow_api.g_varchar2_table(20) := '7365293B0D0A2020207D20656C73652069662028656C656D656E742E6174746163684576656E7429207B0D0A202020202020656C656D656E742E6465746163684576656E7428276F6E27202B20747970652C20666E293B0D0A2020207D0D0A7D3B0D0A0D';
wwv_flow_api.g_varchar2_table(21) := '0A71712E70726576656E7444656661756C74203D2066756E6374696F6E286529207B0D0A20202069662028652E70726576656E7444656661756C7429207B0D0A202020202020652E70726576656E7444656661756C7428293B0D0A2020207D20656C7365';
wwv_flow_api.g_varchar2_table(22) := '207B0D0A202020202020652E72657475726E56616C7565203D2066616C73653B0D0A2020207D0D0A7D3B0D0A0D0A2F2F0D0A2F2F204E6F6465206D616E6970756C6174696F6E730D0A0D0A2F2A2A0D0A202A20496E73657274206E6F6465206120626566';
wwv_flow_api.g_varchar2_table(23) := '6F7265206E6F646520622E0D0A202A2F0D0A71712E696E736572744265666F7265203D2066756E6374696F6E28612C206229207B0D0A202020622E706172656E744E6F64652E696E736572744265666F726528612C2062293B0D0A7D3B0D0A71712E7265';
wwv_flow_api.g_varchar2_table(24) := '6D6F7665203D2066756E6374696F6E28656C656D656E7429207B0D0A202020656C656D656E742E706172656E744E6F64652E72656D6F76654368696C6428656C656D656E74293B0D0A7D3B0D0A0D0A71712E636F6E7461696E73203D2066756E6374696F';
wwv_flow_api.g_varchar2_table(25) := '6E28706172656E742C2064657363656E64616E7429207B0D0A2020202F2F20636F6D70617265706F736974696F6E2072657475726E732066616C736520696E207468697320636173650D0A20202069662028706172656E74203D3D2064657363656E6461';
wwv_flow_api.g_varchar2_table(26) := '6E74292072657475726E20747275653B0D0A0D0A20202069662028706172656E742E636F6E7461696E7329207B0D0A20202020202072657475726E20706172656E742E636F6E7461696E732864657363656E64616E74293B0D0A2020207D20656C736520';
wwv_flow_api.g_varchar2_table(27) := '7B0D0A20202020202072657475726E2021212864657363656E64616E742E636F6D70617265446F63756D656E74506F736974696F6E28706172656E742920262038293B0D0A2020207D0D0A7D3B0D0A0D0A2F2A2A0D0A202A204372656174657320616E64';
wwv_flow_api.g_varchar2_table(28) := '2072657475726E7320656C656D656E742066726F6D2068746D6C20737472696E670D0A202A205573657320696E6E657248544D4C20746F2063726561746520616E20656C656D656E740D0A202A2F0D0A71712E746F456C656D656E74203D202866756E63';
wwv_flow_api.g_varchar2_table(29) := '74696F6E2829207B0D0A20202076617220646976203D20646F63756D656E742E637265617465456C656D656E74282764697627293B0D0A20202072657475726E2066756E6374696F6E2868746D6C29207B0D0A2020202020206469762E696E6E65724854';
wwv_flow_api.g_varchar2_table(30) := '4D4C203D2068746D6C3B0D0A20202020202076617220656C656D656E74203D206469762E66697273744368696C643B0D0A2020202020206469762E72656D6F76654368696C6428656C656D656E74293B0D0A20202020202072657475726E20656C656D65';
wwv_flow_api.g_varchar2_table(31) := '6E743B0D0A2020207D3B0D0A7D2928293B0D0A0D0A2F2F0D0A2F2F204E6F64652070726F7065727469657320616E6420617474726962757465730D0A0D0A2F2A2A0D0A202A2053657473207374796C657320666F7220616E20656C656D656E742E0D0A20';
wwv_flow_api.g_varchar2_table(32) := '2A204669786573206F70616369747920696E204945362D382E0D0A202A2F0D0A71712E637373203D2066756E6374696F6E28656C656D656E742C207374796C657329207B0D0A202020696620287374796C65732E6F70616369747920213D206E756C6C29';
wwv_flow_api.g_varchar2_table(33) := '207B0D0A20202020202069662028747970656F6620656C656D656E742E7374796C652E6F70616369747920213D2027737472696E672720262620747970656F6628656C656D656E742E66696C746572732920213D2027756E646566696E65642729207B0D';
wwv_flow_api.g_varchar2_table(34) := '0A2020202020202020207374796C65732E66696C746572203D2027616C706861286F7061636974793D27202B204D6174682E726F756E6428313030202A207374796C65732E6F70616369747929202B202729273B0D0A2020202020207D0D0A2020207D0D';
wwv_flow_api.g_varchar2_table(35) := '0A20202071712E657874656E6428656C656D656E742E7374796C652C207374796C6573293B0D0A7D3B0D0A71712E686173436C617373203D2066756E6374696F6E28656C656D656E742C206E616D6529207B0D0A202020766172207265203D206E657720';
wwv_flow_api.g_varchar2_table(36) := '5265674578702827285E7C202927202B206E616D65202B202728207C242927293B0D0A20202072657475726E2072652E7465737428656C656D656E742E636C6173734E616D65293B0D0A7D3B0D0A71712E616464436C617373203D2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(37) := '28656C656D656E742C206E616D6529207B0D0A202020696620282171712E686173436C61737328656C656D656E742C206E616D652929207B0D0A202020202020656C656D656E742E636C6173734E616D65202B3D20272027202B206E616D653B0D0A2020';
wwv_flow_api.g_varchar2_table(38) := '207D0D0A7D3B0D0A71712E72656D6F7665436C617373203D2066756E6374696F6E28656C656D656E742C206E616D6529207B0D0A202020766172207265203D206E6577205265674578702827285E7C202927202B206E616D65202B202728207C24292729';
wwv_flow_api.g_varchar2_table(39) := '3B0D0A202020656C656D656E742E636C6173734E616D65203D20656C656D656E742E636C6173734E616D652E7265706C6163652872652C20272027292E7265706C616365282F5E5C732B7C5C732B242F672C202222293B0D0A7D3B0D0A71712E73657454';
wwv_flow_api.g_varchar2_table(40) := '657874203D2066756E6374696F6E28656C656D656E742C207465787429207B0D0A202020656C656D656E742E696E6E657254657874203D20746578743B0D0A202020656C656D656E742E74657874436F6E74656E74203D20746578743B0D0A7D3B0D0A0D';
wwv_flow_api.g_varchar2_table(41) := '0A2F2F0D0A2F2F2053656C656374696E6720656C656D656E74730D0A0D0A71712E6368696C6472656E203D2066756E6374696F6E28656C656D656E7429207B0D0A202020766172206368696C6472656E203D205B5D2C0D0A2020202020206368696C6420';
wwv_flow_api.g_varchar2_table(42) := '3D20656C656D656E742E66697273744368696C643B0D0A0D0A2020207768696C6520286368696C6429207B0D0A202020202020696620286368696C642E6E6F646554797065203D3D203129207B0D0A2020202020202020206368696C6472656E2E707573';
wwv_flow_api.g_varchar2_table(43) := '68286368696C64293B0D0A2020202020207D0D0A2020202020206368696C64203D206368696C642E6E6578745369626C696E673B0D0A2020207D0D0A0D0A20202072657475726E206368696C6472656E3B0D0A7D3B0D0A0D0A71712E6765744279436C61';
wwv_flow_api.g_varchar2_table(44) := '7373203D2066756E6374696F6E28656C656D656E742C20636C6173734E616D6529207B0D0A20202069662028656C656D656E742E717565727953656C6563746F72416C6C29207B0D0A20202020202072657475726E20656C656D656E742E717565727953';
wwv_flow_api.g_varchar2_table(45) := '656C6563746F72416C6C28272E27202B20636C6173734E616D65293B0D0A2020207D0D0A0D0A20202076617220726573756C74203D205B5D3B0D0A2020207661722063616E64696461746573203D20656C656D656E742E676574456C656D656E74734279';
wwv_flow_api.g_varchar2_table(46) := '5461674E616D6528222A22293B0D0A202020766172206C656E203D2063616E646964617465732E6C656E6774683B0D0A0D0A202020666F7220287661722069203D20303B2069203C206C656E3B20692B2B29207B0D0A2020202020206966202871712E68';
wwv_flow_api.g_varchar2_table(47) := '6173436C6173732863616E646964617465735B695D2C20636C6173734E616D652929207B0D0A202020202020202020726573756C742E707573682863616E646964617465735B695D293B0D0A2020202020207D0D0A2020207D0D0A20202072657475726E';
wwv_flow_api.g_varchar2_table(48) := '20726573756C743B0D0A7D3B0D0A0D0A2F2A2A0D0A202A206F626A3275726C28292074616B65732061206A736F6E2D6F626A65637420617320617267756D656E7420616E642067656E6572617465730D0A202A2061207175657279737472696E672E2070';
wwv_flow_api.g_varchar2_table(49) := '7265747479206D756368206C696B65206A51756572792E706172616D28290D0A202A0D0A202A20686F7720746F207573653A0D0A202A0D0A202A202020206071712E6F626A3275726C287B613A2762272C633A2764277D2C27687474703A2F2F616E792E';
wwv_flow_api.g_varchar2_table(50) := '75726C2F75706C6F61643F6F74686572506172616D3D76616C756527293B600D0A202A0D0A202A2077696C6C20726573756C7420696E3A0D0A202A0D0A202A2020202060687474703A2F2F616E792E75726C2F75706C6F61643F6F74686572506172616D';
wwv_flow_api.g_varchar2_table(51) := '3D76616C756526613D6226633D64600D0A202A0D0A202A2040706172616D20204F626A656374204A534F4E2D4F626A6563740D0A202A2040706172616D2020537472696E672063757272656E74207175657279737472696E672D706172740D0A202A2040';
wwv_flow_api.g_varchar2_table(52) := '72657475726E20537472696E6720656E636F646564207175657279737472696E670D0A202A2F0D0A71712E6F626A3275726C203D2066756E6374696F6E286F626A2C2074656D702C20707265666978446F6E6529207B0D0A202020766172207572697374';
wwv_flow_api.g_varchar2_table(53) := '72696E6773203D205B5D2C0D0A202020202020707265666978203D202726272C0D0A202020202020616464203D2066756E6374696F6E286E6578744F626A2C206929207B0D0A202020202020202020766172206E65787454656D70203D2074656D70203F';
wwv_flow_api.g_varchar2_table(54) := '20282F5C5B5C5D242F2E746573742874656D702929202F2F2070726576656E7420646F75626C652D656E636F64696E670D0A2020202020202020203F2074656D70203A2074656D70202B20275B27202B2069202B20275D27203A20693B0D0A2020202020';
wwv_flow_api.g_varchar2_table(55) := '2020202069662028286E65787454656D7020213D2027756E646566696E6564272920262620286920213D2027756E646566696E6564272929207B0D0A202020202020202020202020757269737472696E67732E70757368280D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(56) := '202020202028747970656F66206E6578744F626A203D3D3D20276F626A6563742729203F2071712E6F626A3275726C286E6578744F626A2C206E65787454656D702C207472756529203A20284F626A6563742E70726F746F747970652E746F537472696E';
wwv_flow_api.g_varchar2_table(57) := '672E63616C6C286E6578744F626A29203D3D3D20275B6F626A6563742046756E6374696F6E5D2729203F20656E636F6465555249436F6D706F6E656E74286E65787454656D7029202B20273D27202B20656E636F6465555249436F6D706F6E656E74286E';
wwv_flow_api.g_varchar2_table(58) := '6578744F626A282929203A20656E636F6465555249436F6D706F6E656E74286E65787454656D7029202B20273D27202B20656E636F6465555249436F6D706F6E656E74286E6578744F626A290D0A202020202020202020202020293B0D0A202020202020';
wwv_flow_api.g_varchar2_table(59) := '2020207D0D0A2020202020207D3B0D0A0D0A2020206966202821707265666978446F6E652026262074656D7029207B0D0A202020202020707265666978203D20282F5C3F2F2E746573742874656D702929203F20282F5C3F242F2E746573742874656D70';
wwv_flow_api.g_varchar2_table(60) := '2929203F202727203A20272627203A20273F273B0D0A202020202020757269737472696E67732E707573682874656D70293B0D0A202020202020757269737472696E67732E707573682871712E6F626A3275726C286F626A29293B0D0A2020207D20656C';
wwv_flow_api.g_varchar2_table(61) := '73652069662028284F626A6563742E70726F746F747970652E746F537472696E672E63616C6C286F626A29203D3D3D20275B6F626A6563742041727261795D27292026262028747970656F66206F626A20213D2027756E646566696E6564272929207B0D';
wwv_flow_api.g_varchar2_table(62) := '0A2020202020202F2F20776520776F6E7420757365206120666F722D696E2D6C6F6F70206F6E20616E2061727261792028706572666F726D616E6365290D0A202020202020666F7220287661722069203D20302C206C656E203D206F626A2E6C656E6774';
wwv_flow_api.g_varchar2_table(63) := '683B2069203C206C656E3B202B2B6929207B0D0A202020202020202020616464286F626A5B695D2C2069293B0D0A2020202020207D0D0A2020207D20656C7365206966202828747970656F66206F626A20213D2027756E646566696E6564272920262620';
wwv_flow_api.g_varchar2_table(64) := '286F626A20213D3D206E756C6C292026262028747970656F66206F626A203D3D3D20226F626A656374222929207B0D0A2020202020202F2F20666F7220616E797468696E6720656C7365206275742061207363616C61722C2077652077696C6C20757365';
wwv_flow_api.g_varchar2_table(65) := '20666F722D696E2D6C6F6F700D0A202020202020666F722028766172206920696E206F626A29207B0D0A202020202020202020616464286F626A5B695D2C2069293B0D0A2020202020207D0D0A2020207D20656C7365207B0D0A20202020202075726973';
wwv_flow_api.g_varchar2_table(66) := '7472696E67732E7075736828656E636F6465555249436F6D706F6E656E742874656D7029202B20273D27202B20656E636F6465555249436F6D706F6E656E74286F626A29293B0D0A2020207D0D0A0D0A20202072657475726E20757269737472696E6773';
wwv_flow_api.g_varchar2_table(67) := '2E6A6F696E28707265666978290D0A2020202020202E7265706C616365282F5E262F2C202727290D0A2020202020202E7265706C616365282F2532302F672C20272B27293B0D0A7D3B0D0A0D0A2F2F0D0A2F2F0D0A2F2F2055706C6F6164657220436C61';
wwv_flow_api.g_varchar2_table(68) := '737365730D0A2F2F0D0A2F2F0D0A0D0A766172207171203D207171207C7C207B7D3B0D0A0D0A2F2A2A0D0A202A20437265617465732075706C6F616420627574746F6E2C2076616C6964617465732075706C6F61642C2062757420646F65736E27742063';
wwv_flow_api.g_varchar2_table(69) := '72656174652066696C65206C697374206F722064642E0D0A202A2F0D0A71712E46696C6555706C6F616465724261736963203D2066756E6374696F6E286F29207B0D0A202020746869732E5F6F7074696F6E73203D207B0D0A2020202020202F2F207365';
wwv_flow_api.g_varchar2_table(70) := '7420746F207472756520746F20736565207468652073657276657220726573706F6E73650D0A20202020202069643A2022717175706C6F61646572222C0D0A20202020202064656275673A2066616C73652C0D0A202020202020616374696F6E3A20272F';
wwv_flow_api.g_varchar2_table(71) := '7365727665722F75706C6F6164272C0D0A202020202020706172616D733A207B7D2C0D0A202020202020627574746F6E3A206E756C6C2C0D0A2020202020206D756C7469706C653A20747275652C0D0A2020202020206D6178436F6E6E656374696F6E73';
wwv_flow_api.g_varchar2_table(72) := '3A20332C0D0A2020202020206368756E6B53697A653A20313034383537362C202F2F20314D420D0A2020202020202F2F6368756E6B53697A653A2035313230302C202F2F2035304B0D0A2020202020202F2F2076616C69646174696F6E20202020202020';
wwv_flow_api.g_varchar2_table(73) := '200D0A202020202020616C6C6F776564457874656E73696F6E733A205B5D2C0D0A20202020202073697A654C696D69743A20302C0D0A2020202020206D696E53697A654C696D69743A20302C0D0A2020202020202F2F206576656E74730D0A2020202020';
wwv_flow_api.g_varchar2_table(74) := '202F2F2072657475726E2066616C736520746F2063616E63656C207375626D69740D0A2020202020206F6E5375626D69743A2066756E6374696F6E2869642C2066696C654E616D6529207B7D2C0D0A2020202020206F6E50726F67726573733A2066756E';
wwv_flow_api.g_varchar2_table(75) := '6374696F6E2869642C2066696C654E616D652C206C6F616465642C20746F74616C29207B7D2C0D0A2020202020206F6E436F6D706C6574653A2066756E6374696F6E2869642C2066696C654E616D652C20726573706F6E73654A534F4E29207B7D2C0D0A';
wwv_flow_api.g_varchar2_table(76) := '2020202020206F6E43616E63656C3A2066756E6374696F6E2869642C2066696C654E616D6529207B7D2C0D0A2020202020202F2F206D657373616765732026206C6162656C732020202020202020202020202020200D0A2020202020207472616E736C61';
wwv_flow_api.g_varchar2_table(77) := '74696F6E4C6162656C733A207B7D2C0D0A2020202020206D657373616765733A207B0D0A202020202020202020747970654572726F723A20227B66696C657D2068617320696E76616C696420657874656E73696F6E2E204F6E6C79207B657874656E7369';
wwv_flow_api.g_varchar2_table(78) := '6F6E737D2061726520616C6C6F7765642E222C0D0A20202020202020202073697A654572726F723A20227B66696C657D20697320746F6F206C617267652C206D6178696D756D2066696C652073697A65206973207B73697A654C696D69747D2E222C0D0A';
wwv_flow_api.g_varchar2_table(79) := '2020202020202020206D696E53697A654572726F723A20227B66696C657D20697320746F6F20736D616C6C2C206D696E696D756D2066696C652073697A65206973207B6D696E53697A654C696D69747D2E222C0D0A202020202020202020656D70747945';
wwv_flow_api.g_varchar2_table(80) := '72726F723A20227B66696C657D20697320656D7074792C20706C656173652073656C6563742066696C657320616761696E20776974686F75742069742E222C0D0A2020202020202020206F6E4C656176653A20225468652066696C657320617265206265';
wwv_flow_api.g_varchar2_table(81) := '696E672075706C6F616465642C20696620796F75206C65617665206E6F77207468652075706C6F61642077696C6C2062652063616E63656C6C65642E222C0D0A2020202020202020207069656365733A20227069656365207B6368756E6B4E756D626572';
wwv_flow_api.g_varchar2_table(82) := '7D206F66207B6368756E6B546F74616C7D220D0A2020202020207D2C0D0A20202020202075706C6F6164656446696C65733A2022222C0D0A20202020202073686F774D6573736167653A2066756E6374696F6E286D65737361676529207B0D0A20202020';
wwv_flow_api.g_varchar2_table(83) := '2020202020616C657274286D657373616765293B0D0A2020202020207D0D0A2020207D3B0D0A20202071712E657874656E6428746869732E5F6F7074696F6E732C206F293B0D0A0D0A2020202F2F206E756D626572206F662066696C6573206265696E67';
wwv_flow_api.g_varchar2_table(84) := '2075706C6F616465640D0A202020746869732E5F66696C6573496E50726F6772657373203D20303B0D0A202020746869732E5F66696C6555706C6F61644572726F72436F756E74203D20303B0D0A202020746869732E5F66696C6555706C6F6164457272';
wwv_flow_api.g_varchar2_table(85) := '6F7273203D205B5D3B0D0A202020746869732E5F68616E646C6572203D20746869732E5F63726561746555706C6F616448616E646C657228293B0D0A0D0A20202069662028746869732E5F6F7074696F6E732E627574746F6E29207B0D0A202020202020';
wwv_flow_api.g_varchar2_table(86) := '746869732E5F627574746F6E203D20746869732E5F63726561746555706C6F6164427574746F6E28746869732E5F6F7074696F6E732E627574746F6E293B0D0A2020207D0D0A0D0A202020746869732E5F70726576656E744C65617665496E50726F6772';
wwv_flow_api.g_varchar2_table(87) := '65737328293B0D0A7D3B0D0A0D0A71712E46696C6555706C6F6164657242617369632E70726F746F74797065203D207B0D0A202020736574506172616D733A2066756E6374696F6E28706172616D7329207B0D0A202020202020746869732E5F6F707469';
wwv_flow_api.g_varchar2_table(88) := '6F6E732E706172616D73203D20706172616D733B0D0A2020207D2C0D0A202020676574496E50726F67726573733A2066756E6374696F6E2829207B0D0A20202020202072657475726E20746869732E5F66696C6573496E50726F67726573733B0D0A2020';
wwv_flow_api.g_varchar2_table(89) := '207D2C0D0A2020205F63726561746555706C6F6164427574746F6E3A2066756E6374696F6E28656C656D656E7429207B0D0A2020202020207661722073656C66203D20746869733B0D0A2020202020202F2F20416464656420696E207468652049442074';
wwv_flow_api.g_varchar2_table(90) := '6F2073656172636820666F7220666565646261636B20646976207768656E207570646174696E672066696C65206E616D65730D0A2020202020202F2F2077686963682068617665206265656E2075706C6F616465642E0D0A20202020202072657475726E';
wwv_flow_api.g_varchar2_table(91) := '206E65772071712E55706C6F6164427574746F6E287B0D0A20202020202020202069643A20746869732E5F6F7074696F6E732E69642C0D0A20202020202020202062726F77736542746E4C6162656C3A20746869732E5F6F7074696F6E732E7472616E73';
wwv_flow_api.g_varchar2_table(92) := '6C6174696F6E4C6162656C732E62726F77736542746E4C6162656C2C0D0A2020202020202020206E6F66696C654C6162656C3A20746869732E5F6F7074696F6E732E7472616E736C6174696F6E4C6162656C732E6E6F66696C654C6162656C2C0D0A2020';
wwv_flow_api.g_varchar2_table(93) := '20202020202020656C656D656E743A20656C656D656E742C0D0A2020202020202020206D756C7469706C653A20746869732E5F6F7074696F6E732E6D756C7469706C652026262071712E55706C6F616448616E646C65725868722E6973537570706F7274';
wwv_flow_api.g_varchar2_table(94) := '6564282920262620212121746869732E5F6F7074696F6E732E666F726365496672616D6555706C6F61642C0D0A2020202020202020206F6E4368616E67653A2066756E6374696F6E28696E70757429207B0D0A20202020202020202020202073656C662E';
wwv_flow_api.g_varchar2_table(95) := '5F6F6E496E7075744368616E676528696E707574293B0D0A2020202020202020207D0D0A2020202020207D293B0D0A2020207D2C0D0A2020205F63726561746555706C6F616448616E646C65723A2066756E6374696F6E2829207B0D0A20202020202076';
wwv_flow_api.g_varchar2_table(96) := '61722073656C66203D20746869732C0D0A20202020202020202068616E646C6572436C6173733B0D0A0D0A2020202020206966202871712E55706C6F616448616E646C65725868722E6973537570706F72746564282920262620212121746869732E5F6F';
wwv_flow_api.g_varchar2_table(97) := '7074696F6E732E666F726365496672616D6555706C6F616429207B0D0A20202020202020202068616E646C6572436C617373203D202755706C6F616448616E646C6572586872273B0D0A2020202020207D20656C7365207B0D0A20202020202020202068';
wwv_flow_api.g_varchar2_table(98) := '616E646C6572436C617373203D202755706C6F616448616E646C6572466F726D273B0D0A2020202020207D0D0A0D0A2020202020207661722068616E646C6572203D206E65772071715B68616E646C6572436C6173735D287B0D0A202020202020202020';
wwv_flow_api.g_varchar2_table(99) := '696672616D65466F726D3A20746869732E5F6F7074696F6E732E696672616D65466F726D2C0D0A202020202020202020696672616D65506167653A20746869732E5F6F7074696F6E732E696672616D65506167652C0D0A20202020202020202064656275';
wwv_flow_api.g_varchar2_table(100) := '673A20746869732E5F6F7074696F6E732E64656275672C0D0A202020202020202020616374696F6E3A20746869732E5F6F7074696F6E732E616374696F6E2C0D0A2020202020202020206D6178436F6E6E656374696F6E733A20746869732E5F6F707469';
wwv_flow_api.g_varchar2_table(101) := '6F6E732E6D6178436F6E6E656374696F6E732C0D0A2020202020202020206368756E6B53697A653A20746869732E5F6F7074696F6E732E6368756E6B53697A652C0D0A2020202020202020206F6E50726F67726573733A2066756E6374696F6E2869642C';
wwv_flow_api.g_varchar2_table(102) := '2066696C654E616D652C206C6F616465642C20746F74616C2C206368756E6B4E756D6265722C206368756E6B546F74616C29207B0D0A20202020202020202020202073656C662E5F6F6E50726F67726573732869642C2066696C654E616D652C206C6F61';
wwv_flow_api.g_varchar2_table(103) := '6465642C20746F74616C2C206368756E6B4E756D6265722C206368756E6B546F74616C293B0D0A20202020202020202020202073656C662E5F6F7074696F6E732E6F6E50726F67726573732869642C2066696C654E616D652C206C6F616465642C20746F';
wwv_flow_api.g_varchar2_table(104) := '74616C2C206368756E6B4E756D6265722C206368756E6B546F74616C293B0D0A2020202020202020207D2C0D0A2020202020202020206F6E436F6D706C6574653A2066756E6374696F6E2869642C2066696C654E616D652C20726573756C7429207B0D0A';
wwv_flow_api.g_varchar2_table(105) := '20202020202020202020202073656C662E5F6F6E436F6D706C6574652869642C2066696C654E616D652C20726573756C74293B0D0A20202020202020202020202073656C662E5F6F7074696F6E732E6F6E436F6D706C6574652869642C2066696C654E61';
wwv_flow_api.g_varchar2_table(106) := '6D652C20726573756C74293B0D0A2020202020202020207D2C0D0A2020202020202020206F6E43616E63656C3A2066756E6374696F6E2869642C2066696C654E616D6529207B0D0A20202020202020202020202073656C662E5F6F6E43616E63656C2869';
wwv_flow_api.g_varchar2_table(107) := '642C2066696C654E616D65293B0D0A20202020202020202020202073656C662E5F6F7074696F6E732E6F6E43616E63656C2869642C2066696C654E616D65293B0D0A2020202020202020207D0D0A2020202020207D293B0D0A0D0A202020202020726574';
wwv_flow_api.g_varchar2_table(108) := '75726E2068616E646C65723B0D0A2020207D2C0D0A2020205F70726576656E744C65617665496E50726F67726573733A2066756E6374696F6E2829207B0D0A2020202020207661722073656C66203D20746869733B0D0A0D0A20202020202071712E6174';
wwv_flow_api.g_varchar2_table(109) := '746163682877696E646F772C20276265666F7265756E6C6F6164272C2066756E6374696F6E286529207B0D0A202020202020202020696620282173656C662E5F66696C6573496E50726F677265737329207B0D0A20202020202020202020202072657475';
wwv_flow_api.g_varchar2_table(110) := '726E3B0D0A2020202020202020207D0D0A0D0A2020202020202020207661722065203D2065207C7C2077696E646F772E6576656E743B0D0A2020202020202020202F2F20666F722069652C2066660D0A202020202020202020652E72657475726E56616C';
wwv_flow_api.g_varchar2_table(111) := '7565203D2073656C662E5F6F7074696F6E732E6D657373616765732E6F6E4C656176653B0D0A2020202020202020202F2F20666F72207765626B69740D0A20202020202020202072657475726E2073656C662E5F6F7074696F6E732E6D65737361676573';
wwv_flow_api.g_varchar2_table(112) := '2E6F6E4C656176653B0D0A2020202020207D293B0D0A2020207D2C0D0A2020205F6F6E5375626D69743A2066756E6374696F6E2869642C2066696C654E616D6529207B0D0A202020202020746869732E5F66696C6573496E50726F67726573732B2B3B0D';
wwv_flow_api.g_varchar2_table(113) := '0A2020207D2C0D0A2020205F6F6E50726F67726573733A2066756E6374696F6E2869642C2066696C654E616D652C206C6F616465642C20746F74616C29207B7D2C0D0A2020205F6F6E436F6D706C6574653A2066756E6374696F6E2869642C2066696C65';
wwv_flow_api.g_varchar2_table(114) := '4E616D652C20726573756C7429207B0D0A202020202020746869732E5F66696C6573496E50726F67726573732D2D3B0D0A20202020202069662028726573756C742E6572726F7229207B0D0A202020202020202020746869732E5F6F7074696F6E732E73';
wwv_flow_api.g_varchar2_table(115) := '686F774D65737361676528726573756C742E6572726F72293B0D0A2020202020207D0D0A2020207D2C0D0A2020205F6F6E43616E63656C3A2066756E6374696F6E2869642C2066696C654E616D6529207B0D0A202020202020746869732E5F66696C6573';
wwv_flow_api.g_varchar2_table(116) := '496E50726F67726573732D2D3B0D0A2020207D2C0D0A2020205F6F6E496E7075744368616E67653A2066756E6374696F6E28696E70757429207B0D0A2020202020207661722073656C66203D20746869733B0D0A20202020202069662028746869732E5F';
wwv_flow_api.g_varchar2_table(117) := '68616E646C657220696E7374616E63656F662071712E55706C6F616448616E646C657258687229207B0D0A202020202020202020746869732E5F75706C6F616446696C654C69737428696E7075742E66696C6573293B0D0A2020202020207D20656C7365';
wwv_flow_api.g_varchar2_table(118) := '207B0D0A20202020202020202069662028746869732E5F76616C696461746546696C6528696E7075742929207B0D0A2020202020202020202020202F2F2074726967676572206265666F7265207374617274206576656E7420666F7220726567756C6172';
wwv_flow_api.g_varchar2_table(119) := '20696672616D652066696C652075706C6F61640D0A2020202020202020202020202428222322202B20746869732E5F6F7074696F6E732E6964292E7472696767657228276265666F726573746172742E434F4D5F41465F504C5547494E5F4A515F46494C';
wwv_flow_api.g_varchar2_table(120) := '4555504C4F4144272C205B7B0D0A2020202020202020202020202020207769646765743A2073656C662C0D0A20202020202020202020202020202066696C65733A205B696E7075745D0D0A2020202020202020202020207D5D293B0D0A20202020202020';
wwv_flow_api.g_varchar2_table(121) := '2020202020746869732E5F75706C6F616446696C6528696E707574293B0D0A2020202020202020207D0D0A2020202020207D0D0A202020202020746869732E5F627574746F6E2E726573657428293B0D0A2020207D2C0D0A2020205F75706C6F61644669';
wwv_flow_api.g_varchar2_table(122) := '6C654C6973743A2066756E6374696F6E2866696C657329207B0D0A2020202020207661722073656C66203D20746869732C2066696C654172726179203D205B5D3B0D0A202020202020666F7220287661722069203D20303B2069203C2066696C65732E6C';
wwv_flow_api.g_varchar2_table(123) := '656E6774683B20692B2B29207B0D0A20202020202020202066696C6541727261792E707573682866696C65735B695D293B0D0A2020202020202020206966202821746869732E5F76616C696461746546696C652866696C65735B695D2929207B0D0A2020';
wwv_flow_api.g_varchar2_table(124) := '2020202020202020202072657475726E3B0D0A2020202020202020207D0D0A2020202020207D0D0A2020202020202428222322202B20746869732E5F6F7074696F6E732E6964292E7472696767657228276265666F726573746172742E434F4D5F41465F';
wwv_flow_api.g_varchar2_table(125) := '504C5547494E5F4A515F46494C4555504C4F4144272C205B7B0D0A2020202020202020207769646765743A20746869732C0D0A20202020202020202066696C65733A2066696C6541727261790D0A2020202020207D5D293B0D0A202020202020666F7220';
wwv_flow_api.g_varchar2_table(126) := '287661722069203D20303B2069203C2066696C6541727261792E6C656E6774683B20692B2B29207B0D0A202020202020202020746869732E5F75706C6F616446696C652866696C6541727261795B695D293B0D0A2020202020207D0D0A2020207D2C0D0A';
wwv_flow_api.g_varchar2_table(127) := '2020205F75706C6F616446696C653A2066756E6374696F6E2866696C65436F6E7461696E657229207B0D0A202020202020766172206964203D20746869732E5F68616E646C65722E6164642866696C65436F6E7461696E6572293B0D0A20202020202076';
wwv_flow_api.g_varchar2_table(128) := '61722066696C654E616D65203D20746869732E5F68616E646C65722E6765744E616D65286964293B0D0A0D0A20202020202069662028746869732E5F6F7074696F6E732E6F6E5375626D69742869642C2066696C654E616D652920213D3D2066616C7365';
wwv_flow_api.g_varchar2_table(129) := '29207B0D0A202020202020202020746869732E5F6F6E5375626D69742869642C2066696C654E616D65293B0D0A202020202020202020746869732E5F68616E646C65722E75706C6F61642869642C20746869732E5F6F7074696F6E732E706172616D7329';
wwv_flow_api.g_varchar2_table(130) := '3B0D0A2020202020207D0D0A2020207D2C0D0A2020205F76616C696461746546696C653A2066756E6374696F6E2866696C6529207B0D0A202020202020766172206E616D652C2073697A653B0D0A0D0A2020202020206966202866696C652E76616C7565';
wwv_flow_api.g_varchar2_table(131) := '29207B0D0A2020202020202020202F2F20697420697320612066696C6520696E7075742020202020202020202020200D0A2020202020202020202F2F2067657420696E7075742076616C756520616E642072656D6F7665207061746820746F206E6F726D';
wwv_flow_api.g_varchar2_table(132) := '616C697A650D0A2020202020202020206E616D65203D2066696C652E76616C75652E7265706C616365282F2E2A285C2F7C5C5C292F2C202222293B0D0A2020202020207D20656C7365207B0D0A2020202020202020202F2F20666978206D697373696E67';
wwv_flow_api.g_varchar2_table(133) := '2070726F7065727469657320696E205361666172690D0A2020202020202020206E616D65203D2066696C652E66696C654E616D6520213D206E756C6C203F2066696C652E66696C654E616D65203A2066696C652E6E616D653B0D0A202020202020202020';
wwv_flow_api.g_varchar2_table(134) := '73697A65203D2066696C652E66696C6553697A6520213D206E756C6C203F2066696C652E66696C6553697A65203A2066696C652E73697A653B0D0A2020202020207D0D0A0D0A2020202020206966202821746869732E5F6973416C6C6F77656445787465';
wwv_flow_api.g_varchar2_table(135) := '6E73696F6E286E616D652929207B0D0A202020202020202020746869732E5F6572726F722827747970654572726F72272C206E616D65293B0D0A20202020202020202072657475726E2066616C73653B0D0A0D0A2020202020207D20656C736520696620';
wwv_flow_api.g_varchar2_table(136) := '2873697A65203D3D3D203029207B0D0A202020202020202020746869732E5F6572726F722827656D7074794572726F72272C206E616D65293B0D0A20202020202020202072657475726E2066616C73653B0D0A0D0A2020202020207D20656C7365206966';
wwv_flow_api.g_varchar2_table(137) := '202873697A6520262620746869732E5F6F7074696F6E732E73697A654C696D69742026262073697A65203E20746869732E5F6F7074696F6E732E73697A654C696D697429207B0D0A202020202020202020746869732E5F6572726F72282773697A654572';
wwv_flow_api.g_varchar2_table(138) := '726F72272C206E616D65293B0D0A20202020202020202072657475726E2066616C73653B0D0A0D0A2020202020207D20656C7365206966202873697A652026262073697A65203C20746869732E5F6F7074696F6E732E6D696E53697A654C696D69742920';
wwv_flow_api.g_varchar2_table(139) := '7B0D0A202020202020202020746869732E5F6572726F7228276D696E53697A654572726F72272C206E616D65293B0D0A20202020202020202072657475726E2066616C73653B0D0A2020202020207D0D0A0D0A20202020202072657475726E2074727565';
wwv_flow_api.g_varchar2_table(140) := '3B0D0A2020207D2C0D0A2020205F6572726F723A2066756E6374696F6E28636F64652C2066696C654E616D6529207B0D0A202020202020766172206D657373616765203D20746869732E5F6F7074696F6E732E6D657373616765735B636F64655D3B0D0A';
wwv_flow_api.g_varchar2_table(141) := '0D0A20202020202066756E6374696F6E2072286E616D652C207265706C6163656D656E7429207B0D0A2020202020202020206D657373616765203D206D6573736167652E7265706C616365286E616D652C207265706C6163656D656E74293B0D0A202020';
wwv_flow_api.g_varchar2_table(142) := '2020207D0D0A0D0A2020202020207228277B66696C657D272C20746869732E5F666F726D617446696C654E616D652866696C654E616D6529293B0D0A2020202020207228277B657874656E73696F6E737D272C20746869732E5F6F7074696F6E732E616C';
wwv_flow_api.g_varchar2_table(143) := '6C6F776564457874656E73696F6E732E6A6F696E28272C202729293B0D0A2020202020207228277B73697A654C696D69747D272C20746869732E5F666F726D617453697A6528746869732E5F6F7074696F6E732E73697A654C696D697429293B0D0A2020';
wwv_flow_api.g_varchar2_table(144) := '202020207228277B6D696E53697A654C696D69747D272C20746869732E5F666F726D617453697A6528746869732E5F6F7074696F6E732E6D696E53697A654C696D697429293B0D0A0D0A202020202020746869732E5F6F7074696F6E732E73686F774D65';
wwv_flow_api.g_varchar2_table(145) := '7373616765286D657373616765293B0D0A2020207D2C0D0A2020205F666F726D617446696C654E616D653A2066756E6374696F6E286E616D6529207B0D0A202020202020696620286E616D652E6C656E677468203E20333329207B0D0A20202020202020';
wwv_flow_api.g_varchar2_table(146) := '20206E616D65203D206E616D652E736C69636528302C20313929202B20272E2E2E27202B206E616D652E736C696365282D3133293B0D0A2020202020207D0D0A20202020202072657475726E206E616D653B0D0A2020207D2C0D0A2020205F6973416C6C';
wwv_flow_api.g_varchar2_table(147) := '6F776564457874656E73696F6E3A2066756E6374696F6E2866696C654E616D6529207B0D0A20202020202076617220657874203D20282D3120213D3D2066696C654E616D652E696E6465784F6628272E272929203F2066696C654E616D652E7265706C61';
wwv_flow_api.g_varchar2_table(148) := '6365282F2E2A5B2E5D2F2C202727292E746F4C6F776572436173652829203A2027273B0D0A20202020202076617220616C6C6F776564203D20746869732E5F6F7074696F6E732E616C6C6F776564457874656E73696F6E733B0D0A0D0A20202020202069';
wwv_flow_api.g_varchar2_table(149) := '66202821616C6C6F7765642E6C656E67746829207B0D0A20202020202020202072657475726E20747275653B0D0A2020202020207D0D0A0D0A202020202020666F7220287661722069203D20303B2069203C20616C6C6F7765642E6C656E6774683B2069';
wwv_flow_api.g_varchar2_table(150) := '2B2B29207B0D0A20202020202020202069662028616C6C6F7765645B695D2E746F4C6F776572436173652829203D3D2065787429207B0D0A20202020202020202020202072657475726E20747275653B0D0A2020202020202020207D0D0A202020202020';
wwv_flow_api.g_varchar2_table(151) := '7D0D0A0D0A20202020202072657475726E2066616C73653B0D0A2020207D2C0D0A2020205F666F726D617453697A653A2066756E6374696F6E28627974657329207B0D0A2020202020207661722069203D202D313B0D0A202020202020646F207B0D0A20';
wwv_flow_api.g_varchar2_table(152) := '20202020202020206279746573203D206279746573202F20313032343B0D0A202020202020202020692B2B3B0D0A2020202020207D207768696C6520286279746573203E203939293B0D0A0D0A20202020202072657475726E204D6174682E6D61782862';
wwv_flow_api.g_varchar2_table(153) := '797465732C20302E31292E746F4669786564283129202B205B276B42272C20274D42272C20274742272C20275442272C20275042272C20274542275D5B695D3B0D0A2020207D2C0D0A2020205F756E656E636F64656453697A653A2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(154) := '28627974657329207B0D0A20202020202072657475726E204D6174682E6365696C286279746573202F203429202A20333B0D0A2020207D0D0A7D3B0D0A0D0A0D0A2F2A2A0D0A202A20436C617373207468617420637265617465732075706C6F61642077';
wwv_flow_api.g_varchar2_table(155) := '6964676574207769746820647261672D616E642D64726F7020616E642066696C65206C6973740D0A202A2040696E6865726974732071712E46696C6555706C6F6164657242617369630D0A202A2F0D0A71712E46696C6555706C6F61646572203D206675';
wwv_flow_api.g_varchar2_table(156) := '6E6374696F6E286F29207B0D0A2020202F2F2063616C6C20706172656E7420636F6E7374727563746F720D0A20202071712E46696C6555706C6F6164657242617369632E6170706C7928746869732C20617267756D656E7473293B0D0A0D0A2020202F2F';
wwv_flow_api.g_varchar2_table(157) := '206164646974696F6E616C206F7074696F6E73202020200D0A20202071712E657874656E6428746869732E5F6F7074696F6E732C207B0D0A202020202020656C656D656E743A206E756C6C2C0D0A2020202020202F2F206966207365742C2077696C6C20';
wwv_flow_api.g_varchar2_table(158) := '6265207573656420696E7374656164206F662071712D75706C6F61642D6C69737420696E2074656D706C6174650D0A2020202020206C697374456C656D656E743A206E756C6C2C0D0A0D0A20202020202074656D706C6174653A20273C64697620636C61';
wwv_flow_api.g_varchar2_table(159) := '73733D2271712D75706C6F61646572223E27202B0D0A202020202020202020273C64697620636C6173733D2271712D75706C6F61642D64726F702D61726561223E3C7370616E3E27202B20746869732E5F6F7074696F6E732E7472616E736C6174696F6E';
wwv_flow_api.g_varchar2_table(160) := '4C6162656C732E64726F70417265614D7367202B20273C2F7370616E3E3C2F6469763E27202B0D0A202020202020202020273C64697620636C6173733D2271712D75706C6F61642D627574746F6E223E3C2F6469763E27202B0D0A202020202020202020';
wwv_flow_api.g_varchar2_table(161) := '273C756C2069643D2227202B20746869732E5F6F7074696F6E732E6964202B20275F75706C6F6164732220636C6173733D2271712D75706C6F61642D6C69737422207374796C653D22646973706C61793A6E6F6E653B223E27202B20746869732E5F6F70';
wwv_flow_api.g_varchar2_table(162) := '74696F6E732E75706C6F6164656446696C6573202B20273C2F756C3E27202B0D0A202020202020202020273C2F6469763E272C0D0A0D0A2020202020202F2F2074656D706C61746520666F72206F6E65206974656D20696E2066696C65206C6973740D0A';
wwv_flow_api.g_varchar2_table(163) := '20202020202066696C6554656D706C6174653A20273C6C693E27202B0D0A202020202020202020273C7370616E20636C6173733D2271712D75706C6F61642D66696C65223E3C2F7370616E3E27202B0D0A202020202020202020273C7370616E20636C61';
wwv_flow_api.g_varchar2_table(164) := '73733D2271712D75706C6F61642D7370696E6E6572223E3C2F7370616E3E27202B0D0A202020202020202020273C7370616E20636C6173733D2271712D75706C6F61642D73697A65223E3C2F7370616E3E27202B0D0A202020202020202020273C612063';
wwv_flow_api.g_varchar2_table(165) := '6C6173733D2271712D75706C6F61642D63616E63656C2220687265663D2223223E43616E63656C3C2F613E27202B0D0A202020202020202020273C7370616E20636C6173733D2271712D75706C6F61642D6661696C65642D74657874223E4661696C6564';
wwv_flow_api.g_varchar2_table(166) := '3C2F7370616E3E27202B0D0A202020202020202020273C2F6C693E272C0D0A0D0A202020202020636C61737365733A207B0D0A2020202020202020202F2F207573656420746F2067657420656C656D656E74732066726F6D2074656D706C617465730D0A';
wwv_flow_api.g_varchar2_table(167) := '202020202020202020627574746F6E3A202771712D75706C6F61642D627574746F6E272C0D0A20202020202020202064726F703A202771712D75706C6F61642D64726F702D61726561272C0D0A20202020202020202064726F704163746976653A202771';
wwv_flow_api.g_varchar2_table(168) := '712D75706C6F61642D64726F702D617265612D616374697665272C0D0A2020202020202020206C6973743A202771712D75706C6F61642D6C697374272C0D0A0D0A20202020202020202066696C653A202771712D75706C6F61642D66696C65272C0D0A20';
wwv_flow_api.g_varchar2_table(169) := '20202020202020207370696E6E65723A202771712D75706C6F61642D7370696E6E6572272C0D0A20202020202020202073697A653A202771712D75706C6F61642D73697A65272C0D0A20202020202020202063616E63656C3A202771712D75706C6F6164';
wwv_flow_api.g_varchar2_table(170) := '2D63616E63656C272C0D0A0D0A2020202020202020202F2F20616464656420746F206C697374206974656D207768656E2075706C6F616420636F6D706C657465730D0A2020202020202020202F2F207573656420696E2063737320746F20686964652070';
wwv_flow_api.g_varchar2_table(171) := '726F6772657373207370696E6E65720D0A202020202020202020737563636573733A202771712D75706C6F61642D73756363657373272C0D0A2020202020202020206661696C3A202771712D75706C6F61642D6661696C270D0A2020202020207D0D0A20';
wwv_flow_api.g_varchar2_table(172) := '20207D293B0D0A2020202F2F206F7665727772697465206F7074696F6E732077697468207573657220737570706C696564202020200D0A20202071712E657874656E6428746869732E5F6F7074696F6E732C206F293B0D0A0D0A202020746869732E5F65';
wwv_flow_api.g_varchar2_table(173) := '6C656D656E74203D20746869732E5F6F7074696F6E732E656C656D656E743B0D0A202020746869732E5F656C656D656E742E696E6E657248544D4C203D20746869732E5F6F7074696F6E732E74656D706C6174653B0D0A202020746869732E5F6C697374';
wwv_flow_api.g_varchar2_table(174) := '456C656D656E74203D20746869732E5F6F7074696F6E732E6C697374456C656D656E74207C7C20746869732E5F66696E6428746869732E5F656C656D656E742C20276C69737427293B0D0A0D0A202020746869732E5F636C6173736573203D2074686973';
wwv_flow_api.g_varchar2_table(175) := '2E5F6F7074696F6E732E636C61737365733B0D0A0D0A202020746869732E5F627574746F6E203D20746869732E5F63726561746555706C6F6164427574746F6E28746869732E5F66696E6428746869732E5F656C656D656E742C2027627574746F6E2729';
wwv_flow_api.g_varchar2_table(176) := '293B0D0A0D0A202020746869732E5F62696E6443616E63656C4576656E7428293B0D0A202020746869732E5F73657475704472616744726F7028293B0D0A7D3B0D0A0D0A2F2F20696E68657269742066726F6D2042617369632055706C6F616465720D0A';
wwv_flow_api.g_varchar2_table(177) := '71712E657874656E642871712E46696C6555706C6F616465722E70726F746F747970652C2071712E46696C6555706C6F6164657242617369632E70726F746F74797065293B0D0A0D0A71712E657874656E642871712E46696C6555706C6F616465722E70';
wwv_flow_api.g_varchar2_table(178) := '726F746F747970652C207B0D0A2020202F2A2A0D0A202020202A2047657473206F6E65206F662074686520656C656D656E7473206C697374656420696E20746869732E5F6F7074696F6E732E636C61737365730D0A202020202A2A2F0D0A2020205F6669';
wwv_flow_api.g_varchar2_table(179) := '6E643A2066756E6374696F6E28706172656E742C207479706529207B0D0A20202020202076617220656C656D656E74203D2071712E6765744279436C61737328706172656E742C20746869732E5F6F7074696F6E732E636C61737365735B747970655D29';
wwv_flow_api.g_varchar2_table(180) := '5B305D3B0D0A2020202020206966202821656C656D656E7429207B0D0A2020202020202020207468726F77206E6577204572726F722827656C656D656E74206E6F7420666F756E642027202B2074797065293B0D0A2020202020207D0D0A0D0A20202020';
wwv_flow_api.g_varchar2_table(181) := '202072657475726E20656C656D656E743B0D0A2020207D2C0D0A2020205F73657475704472616744726F703A2066756E6374696F6E2829207B0D0A2020202020207661722073656C66203D20746869732C0D0A20202020202020202064726F7041726561';
wwv_flow_api.g_varchar2_table(182) := '203D20746869732E5F66696E6428746869732E5F656C656D656E742C202764726F7027293B0D0A0D0A20202020202064726F70417265612E7374796C652E7769647468203D20746869732E5F6F7074696F6E732E7769647468202B20277078273B0D0A0D';
wwv_flow_api.g_varchar2_table(183) := '0A20202020202076617220647A203D206E65772071712E55706C6F616444726F705A6F6E65287B0D0A202020202020202020656C656D656E743A2064726F70417265612C0D0A2020202020202020206F6E456E7465723A2066756E6374696F6E28652920';
wwv_flow_api.g_varchar2_table(184) := '7B0D0A20202020202020202020202071712E616464436C6173732864726F70417265612C2073656C662E5F636C61737365732E64726F70416374697665293B0D0A202020202020202020202020652E73746F7050726F7061676174696F6E28293B0D0A20';
wwv_flow_api.g_varchar2_table(185) := '20202020202020207D2C0D0A2020202020202020206F6E4C656176653A2066756E6374696F6E286529207B0D0A202020202020202020202020652E73746F7050726F7061676174696F6E28293B0D0A2020202020202020207D2C0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(186) := '206F6E4C656176654E6F7444657363656E64616E74733A2066756E6374696F6E286529207B0D0A20202020202020202020202071712E72656D6F7665436C6173732864726F70417265612C2073656C662E5F636C61737365732E64726F70416374697665';
wwv_flow_api.g_varchar2_table(187) := '293B0D0A2020202020202020207D2C0D0A2020202020202020206F6E44726F703A2066756E6374696F6E286529207B0D0A20202020202020202020202064726F70417265612E7374796C652E646973706C6179203D20276E6F6E65273B0D0A2020202020';
wwv_flow_api.g_varchar2_table(188) := '2020202020202071712E72656D6F7665436C6173732864726F70417265612C2073656C662E5F636C61737365732E64726F70416374697665293B0D0A20202020202020202020202073656C662E5F75706C6F616446696C654C69737428652E6461746154';
wwv_flow_api.g_varchar2_table(189) := '72616E736665722E66696C6573293B0D0A2020202020202020207D0D0A2020202020207D293B0D0A0D0A20202020202064726F70417265612E7374796C652E646973706C6179203D20276E6F6E65273B0D0A0D0A20202020202071712E61747461636828';
wwv_flow_api.g_varchar2_table(190) := '646F63756D656E742C202764726167656E746572272C2066756E6374696F6E286529207B0D0A2020202020202020206966202821647A2E5F697356616C696446696C6544726167286529292072657475726E3B0D0A0D0A20202020202020202064726F70';
wwv_flow_api.g_varchar2_table(191) := '417265612E7374796C652E646973706C6179203D2027626C6F636B273B0D0A2020202020207D293B0D0A20202020202071712E61747461636828646F63756D656E742C2027647261676C65617665272C2066756E6374696F6E286529207B0D0A20202020';
wwv_flow_api.g_varchar2_table(192) := '20202020206966202821647A2E5F697356616C696446696C6544726167286529292072657475726E3B0D0A0D0A2020202020202020207661722072656C61746564546172676574203D20646F63756D656E742E656C656D656E7446726F6D506F696E7428';
wwv_flow_api.g_varchar2_table(193) := '652E636C69656E74582C20652E636C69656E7459293B0D0A2020202020202020202F2F206F6E6C792066697265207768656E206C656176696E6720646F63756D656E74206F75740D0A202020202020202020696620282172656C61746564546172676574';
wwv_flow_api.g_varchar2_table(194) := '207C7C2072656C617465645461726765742E6E6F64654E616D65203D3D202248544D4C22207C7C2072656C617465645461726765742E6E6F64654E616D65203D3D2022424F44592229207B202F2F20544F444F0D0A20202020202020202020202064726F';
wwv_flow_api.g_varchar2_table(195) := '70417265612E7374796C652E646973706C6179203D20276E6F6E65273B0D0A2020202020202020207D0D0A2020202020207D293B0D0A2020207D2C0D0A2020205F6F6E5375626D69743A2066756E6374696F6E2869642C2066696C654E616D6529207B0D';
wwv_flow_api.g_varchar2_table(196) := '0A202020202020746869732E5F66696C6555706C6F61644572726F7273203D205B5D3B0D0A20202020202071712E46696C6555706C6F6164657242617369632E70726F746F747970652E5F6F6E5375626D69742E6170706C7928746869732C2061726775';
wwv_flow_api.g_varchar2_table(197) := '6D656E7473293B0D0A202020202020746869732E5F616464546F4C6973742869642C2066696C654E616D65293B0D0A2020207D2C0D0A2020205F6F6E50726F67726573733A2066756E6374696F6E2869642C2066696C654E616D652C206C6F616465642C';
wwv_flow_api.g_varchar2_table(198) := '20746F74616C2C206368756E6B4E756D6265722C206368756E6B546F74616C29207B0D0A0D0A2020202020207661722070696563654D7367203D20746869732E5F6F7074696F6E732E6D657373616765735B27706965636573275D2C0D0A202020202020';
wwv_flow_api.g_varchar2_table(199) := '2020206C6F6164436F6D706C65746564203D20286C6F61646564203D3D3D20746F74616C293B0D0A0D0A2020202020202F2F2073686F7720746865206368756E6B65642075706C6F61642070726F67726573730D0A20202020202066756E6374696F6E20';
wwv_flow_api.g_varchar2_table(200) := '72286E616D652C207265706C6163656D656E7429207B0D0A20202020202020202070696563654D7367203D2070696563654D73672E7265706C616365286E616D652C207265706C6163656D656E74293B0D0A2020202020207D0D0A202020202020696620';
wwv_flow_api.g_varchar2_table(201) := '286368756E6B4E756D626572202626206368756E6B546F74616C29207B0D0A2020202020202020202F2F2073686F7720756E656E636F6465642073697A696E6720746F2061766F696420636F6E667573696F6E20666F722074686520656E642075736572';
wwv_flow_api.g_varchar2_table(202) := '0D0A2020202020202020206C6F61646564203D20746869732E5F756E656E636F64656453697A65286C6F61646564293B0D0A202020202020202020746F74616C203D20746869732E5F756E656E636F64656453697A6528746F74616C293B0D0A20202020';
wwv_flow_api.g_varchar2_table(203) := '20202020207228277B6368756E6B4E756D6265727D272C204D6174682E6D696E286368756E6B4E756D626572207C7C20312C206368756E6B546F74616C207C7C203129293B0D0A2020202020202020207228277B6368756E6B546F74616C7D272C206368';
wwv_flow_api.g_varchar2_table(204) := '756E6B546F74616C207C7C2031293B0D0A20202020202020202070696563654D7367202B3D2027292027202B20746869732E5F666F726D617453697A6528286368756E6B4E756D626572202D203129202A20746869732E5F6F7074696F6E732E6368756E';
wwv_flow_api.g_varchar2_table(205) := '6B53697A65293B0D0A2020202020207D20656C7365207B0D0A20202020202020202070696563654D7367203D2027273B0D0A2020202020207D0D0A0D0A20202020202071712E46696C6555706C6F6164657242617369632E70726F746F747970652E5F6F';
wwv_flow_api.g_varchar2_table(206) := '6E50726F67726573732E6170706C7928746869732C20617267756D656E7473293B0D0A0D0A202020202020766172206974656D203D20746869732E5F6765744974656D427946696C654964286964293B0D0A2020202020207661722073697A65203D2074';
wwv_flow_api.g_varchar2_table(207) := '6869732E5F66696E64286974656D2C202773697A6527293B0D0A20202020202073697A652E7374796C652E646973706C6179203D2027696E6C696E65273B0D0A0D0A20202020202076617220746578743B0D0A20202020202069662028216C6F6164436F';
wwv_flow_api.g_varchar2_table(208) := '6D706C6574656429207B0D0A20202020202020202074657874203D20272827202B204D6174682E726F756E64286C6F61646564202F20746F74616C202A2031303029202B2027252066726F6D2027202B20746869732E5F666F726D617453697A6528746F';
wwv_flow_api.g_varchar2_table(209) := '74616C29202B20272027202B2070696563654D73673B0D0A2020202020207D20656C7365207B0D0A20202020202020202074657874203D202870696563654D736729203F20272827202B20746869732E5F666F726D617453697A6528746F74616C29202B';
wwv_flow_api.g_varchar2_table(210) := '20272027202B2070696563654D7367203A20746869732E5F666F726D617453697A6528746F74616C293B0D0A2020202020207D0D0A0D0A20202020202071712E736574546578742873697A652C2074657874293B0D0A2020207D2C0D0A2020205F6F6E43';
wwv_flow_api.g_varchar2_table(211) := '6F6D706C6574653A2066756E6374696F6E2869642C2066696C654E616D652C20726573756C7429207B0D0A20202020202071712E46696C6555706C6F6164657242617369632E70726F746F747970652E5F6F6E436F6D706C6574652E6170706C79287468';
wwv_flow_api.g_varchar2_table(212) := '69732C20617267756D656E7473293B0D0A0D0A2020202020202F2F206D61726B20636F6D706C657465640D0A202020202020766172206974656D203D20746869732E5F6765744974656D427946696C654964286964292C0D0A2020202020202020202464';
wwv_flow_api.g_varchar2_table(213) := '69616C6F67203D20617065782E6A517565727928222322202B20746869732E5F6F7074696F6E732E6964202B20225F75706C6F61647322293B0D0A20202020202071712E72656D6F766528746869732E5F66696E64286974656D2C202763616E63656C27';
wwv_flow_api.g_varchar2_table(214) := '29293B0D0A20202020202071712E72656D6F766528746869732E5F66696E64286974656D2C20277370696E6E65722729293B0D0A0D0A20202020202069662028726573756C742E7375636365737329207B0D0A20202020202020202071712E616464436C';
wwv_flow_api.g_varchar2_table(215) := '617373286974656D2C20746869732E5F636C61737365732E73756363657373293B0D0A202020202020202020617065782E6A517565727928746869732E5F66696E64286974656D2C202766696C652729292E7772617028273C6120687265663D2227202B';
wwv_flow_api.g_varchar2_table(216) := '20726573756C742E6C696E6B202B202722202F3E27293B0D0A20202020202020202069662028746869732E5F66696C6573496E50726F6772657373203D3D3D203020262620746869732E5F6F7074696F6E732E686964654469616C6F674F6E436F6D706C';
wwv_flow_api.g_varchar2_table(217) := '65746529207B0D0A202020202020202020202020246469616C6F672E6469616C6F672822636C6F736522293B0D0A2020202020202020207D0D0A2020202020207D20656C7365207B0D0A20202020202020202071712E616464436C617373286974656D2C';
wwv_flow_api.g_varchar2_table(218) := '20746869732E5F636C61737365732E6661696C293B0D0A202020202020202020746869732E5F66696C6555706C6F61644572726F72436F756E742B2B3B0D0A202020202020202020746869732E5F66696C6555706C6F61644572726F72732E7075736828';
wwv_flow_api.g_varchar2_table(219) := '7B0D0A20202020202020202020202069643A2069642C0D0A20202020202020202020202066696C654E616D653A2066696C654E616D652C0D0A202020202020202020202020726573756C743A20726573756C740D0A2020202020202020207D293B0D0A20';
wwv_flow_api.g_varchar2_table(220) := '202020202020202069662028726573756C742E6D6573736167652920616C65727428726573756C742E6D657373616765293B0D0A202020202020202020617065782E6A517565727928222322202B20746869732E5F6F7074696F6E732E6964292E747269';
wwv_flow_api.g_varchar2_table(221) := '6767657228276F6E6572726F722E434F4D5F41465F504C5547494E5F4A515F46494C4555504C4F4144272C205B7B0D0A2020202020202020202020207769646765743A20746869732C0D0A2020202020202020202020206469616C6F673A20246469616C';
wwv_flow_api.g_varchar2_table(222) := '6F672C0D0A20202020202020202020202069643A2069642C0D0A20202020202020202020202066696C654E616D653A2066696C654E616D652C0D0A202020202020202020202020726573756C743A20726573756C740D0A2020202020202020207D5D293B';
wwv_flow_api.g_varchar2_table(223) := '0D0A2020202020207D0D0A20202020202069662028746869732E5F66696C6573496E50726F6772657373203D3D3D203029207B0D0A202020202020202020746869732E5F6F6E436F6D706C657465416C6C28246469616C6F67293B0D0A2020202020207D';
wwv_flow_api.g_varchar2_table(224) := '0D0A2020207D2C0D0A2020205F6F6E436F6D706C657465416C6C3A2066756E6374696F6E286469616C6F6729207B0D0A202020202020617065782E6A517565727928222322202B20746869732E5F6F7074696F6E732E6964292E7472696767657228276F';
wwv_flow_api.g_varchar2_table(225) := '6E636F6D706C657465616C6C2E434F4D5F41465F504C5547494E5F4A515F46494C4555504C4F4144272C205B7B0D0A2020202020202020207769646765743A20746869732C0D0A2020202020202020206469616C6F673A206469616C6F670D0A20202020';
wwv_flow_api.g_varchar2_table(226) := '20207D5D293B0D0A20202020202069662028746869732E5F66696C6573496E50726F6772657373203D3D3D203020262620746869732E5F66696C6555706C6F61644572726F72436F756E74203E203029207B0D0A202020202020202020617065782E6A51';
wwv_flow_api.g_varchar2_table(227) := '7565727928222322202B20746869732E5F6F7074696F6E732E6964292E7472696767657228276F6E6572726F72616C6C2E434F4D5F41465F504C5547494E5F4A515F46494C4555504C4F4144272C205B7B0D0A2020202020202020202020207769646765';
wwv_flow_api.g_varchar2_table(228) := '743A20746869732C0D0A2020202020202020202020206469616C6F673A206469616C6F672C0D0A2020202020202020202020206572726F72733A20746869732E5F66696C6555706C6F61644572726F72730D0A2020202020202020207D5D293B0D0A2020';
wwv_flow_api.g_varchar2_table(229) := '202020207D0D0A2020207D2C0D0A2020205F616464546F4C6973743A2066756E6374696F6E2869642C2066696C654E616D6529207B0D0A202020202020766172206974656D203D2071712E746F456C656D656E7428746869732E5F6F7074696F6E732E66';
wwv_flow_api.g_varchar2_table(230) := '696C6554656D706C617465293B0D0A2020202020206974656D2E717146696C654964203D2069643B0D0A0D0A2020202020207661722066696C65456C656D656E74203D20746869732E5F66696E64286974656D2C202766696C6527293B0D0A2020202020';
wwv_flow_api.g_varchar2_table(231) := '2071712E736574546578742866696C65456C656D656E742C20746869732E5F666F726D617446696C654E616D652866696C654E616D6529293B0D0A202020202020746869732E5F66696E64286974656D2C202773697A6527292E7374796C652E64697370';
wwv_flow_api.g_varchar2_table(232) := '6C6179203D20276E6F6E65273B0D0A0D0A202020202020746869732E5F6C697374456C656D656E742E617070656E644368696C64286974656D293B0D0A0D0A2020202020202F2F204E6577206164646969746F6E73204D4A4E0D0A0D0A20202020202076';
wwv_flow_api.g_varchar2_table(233) := '617220704944203D20746869732E5F6F7074696F6E732E69643B0D0A2020202020202F2F63726561746520637573746F6D20636F6E74726F6C20636F6E7461696E65720D0A2020202020207661722075706C6F6164203D20617065782E6A517565727928';
wwv_flow_api.g_varchar2_table(234) := '222322202B20704944202B2022202E637573746F6D66696C6522293B0D0A2020202020202F2F63726561746520637573746F6D20636F6E74726F6C20627574746F6E0D0A2020202020207661722075706C6F6164427574746F6E203D20617065782E6A51';
wwv_flow_api.g_varchar2_table(235) := '7565727928222322202B20704944202B2022202E637573746F6D66696C652D627574746F6E22293B0D0A2020202020202F2F63726561746520637573746F6D20636F6E74726F6C20666565646261636B0D0A2020202020207661722075706C6F61644665';
wwv_flow_api.g_varchar2_table(236) := '65646261636B203D20617065782E6A517565727928222322202B20704944202B2022202E637573746F6D66696C652D666565646261636B22293B0D0A0D0A2020202020207661722066696C65457874203D2027637573746F6D66696C652D6578742D2720';
wwv_flow_api.g_varchar2_table(237) := '2B2066696C654E616D652E73706C697428272E27292E706F7028292E746F4C6F7765724361736528293B0D0A0D0A20202020202075706C6F6164466565646261636B0D0A2020202020202020202E746578742866696C654E616D6529202F2F7365742066';
wwv_flow_api.g_varchar2_table(238) := '6565646261636B207465787420746F2066696C656E616D650D0A2020202020202020202E72656D6F7665436C6173732875706C6F6164466565646261636B2E64617461282766696C654578742729207C7C20272729202F2F72656D6F766520616E792065';
wwv_flow_api.g_varchar2_table(239) := '78697374696E672066696C6520657874656E73696F6E20636C6173730D0A2020202020202020202E616464436C6173732866696C6545787429202F2F6164642066696C6520657874656E73696F6E20636C6173730D0A2020202020202020202E64617461';
wwv_flow_api.g_varchar2_table(240) := '282766696C65457874272C2066696C6545787429202F2F73746F72652066696C6520657874656E73696F6E20666F7220636C6173732072656D6F76616C206F6E206E657874206368616E67650D0A2020202020202020202E616464436C61737328276375';
wwv_flow_api.g_varchar2_table(241) := '73746F6D66696C652D666565646261636B2D706F70756C6174656427293B202F2F61646420636C61737320746F2073686F7720706F70756C617465642073746174650D0A2020202020202F2F6368616E67652074657874206F6620627574746F6E090D0A';
wwv_flow_api.g_varchar2_table(242) := '20202020202075706C6F6164427574746F6E2E7465787428746869732E5F6F7074696F6E732E7472616E736C6174696F6E4C6162656C732E6D6F726542746E4C6162656C293B0D0A0D0A2020207D2C0D0A2020205F6765744974656D427946696C654964';
wwv_flow_api.g_varchar2_table(243) := '3A2066756E6374696F6E28696429207B0D0A202020202020766172206974656D203D20746869732E5F6C697374456C656D656E742E66697273744368696C643B0D0A0D0A2020202020202F2F2074686572652063616E277420626520747874206E6F6465';
wwv_flow_api.g_varchar2_table(244) := '7320696E2064796E616D6963616C6C792063726561746564206C6973740D0A2020202020202F2F20616E642077652063616E2020757365206E6578745369626C696E670D0A2020202020207768696C6520286974656D29207B0D0A202020202020202020';
wwv_flow_api.g_varchar2_table(245) := '696620286974656D2E717146696C654964203D3D206964292072657475726E206974656D3B0D0A2020202020202020206974656D203D206974656D2E6E6578745369626C696E673B0D0A2020202020207D0D0A2020207D2C0D0A2020202F2A2A0D0A2020';
wwv_flow_api.g_varchar2_table(246) := '20202A2064656C656761746520636C69636B206576656E7420666F722063616E63656C206C696E6B0D0A202020202A2A2F0D0A2020205F62696E6443616E63656C4576656E743A2066756E6374696F6E2829207B0D0A2020202020207661722073656C66';
wwv_flow_api.g_varchar2_table(247) := '203D20746869732C0D0A2020202020202020206C697374203D20746869732E5F6C697374456C656D656E743B0D0A0D0A20202020202071712E617474616368286C6973742C2027636C69636B272C2066756E6374696F6E286529207B0D0A202020202020';
wwv_flow_api.g_varchar2_table(248) := '20202065203D2065207C7C2077696E646F772E6576656E743B0D0A20202020202020202076617220746172676574203D20652E746172676574207C7C20652E737263456C656D656E743B0D0A0D0A2020202020202020206966202871712E686173436C61';
wwv_flow_api.g_varchar2_table(249) := '7373287461726765742C2073656C662E5F636C61737365732E63616E63656C2929207B0D0A20202020202020202020202071712E70726576656E7444656661756C742865293B0D0A0D0A202020202020202020202020766172206974656D203D20746172';
wwv_flow_api.g_varchar2_table(250) := '6765742E706172656E744E6F64653B0D0A20202020202020202020202073656C662E5F68616E646C65722E63616E63656C286974656D2E717146696C654964293B0D0A20202020202020202020202071712E72656D6F7665286974656D293B0D0A202020';
wwv_flow_api.g_varchar2_table(251) := '2020202020207D0D0A2020202020207D293B0D0A2020207D0D0A7D293B0D0A0D0A71712E55706C6F616444726F705A6F6E65203D2066756E6374696F6E286F29207B0D0A202020746869732E5F6F7074696F6E73203D207B0D0A202020202020656C656D';
wwv_flow_api.g_varchar2_table(252) := '656E743A206E756C6C2C0D0A2020202020206F6E456E7465723A2066756E6374696F6E286529207B7D2C0D0A2020202020206F6E4C656176653A2066756E6374696F6E286529207B7D2C0D0A2020202020202F2F206973206E6F74206669726564207768';
wwv_flow_api.g_varchar2_table(253) := '656E206C656176696E6720656C656D656E7420627920686F766572696E672064657363656E64616E74732020200D0A2020202020206F6E4C656176654E6F7444657363656E64616E74733A2066756E6374696F6E286529207B7D2C0D0A2020202020206F';
wwv_flow_api.g_varchar2_table(254) := '6E44726F703A2066756E6374696F6E286529207B7D0D0A2020207D3B0D0A20202071712E657874656E6428746869732E5F6F7074696F6E732C206F293B0D0A0D0A202020746869732E5F656C656D656E74203D20746869732E5F6F7074696F6E732E656C';
wwv_flow_api.g_varchar2_table(255) := '656D656E743B0D0A0D0A202020746869732E5F64697361626C6544726F704F75747369646528293B0D0A202020746869732E5F6174746163684576656E747328293B0D0A7D3B0D0A0D0A71712E55706C6F616444726F705A6F6E652E70726F746F747970';
wwv_flow_api.g_varchar2_table(256) := '65203D207B0D0A2020205F64697361626C6544726F704F7574736964653A2066756E6374696F6E286529207B0D0A2020202020202F2F2072756E206F6E6C79206F6E636520666F7220616C6C20696E7374616E6365730D0A202020202020696620282171';
wwv_flow_api.g_varchar2_table(257) := '712E55706C6F616444726F705A6F6E652E64726F704F75747369646544697361626C656429207B0D0A0D0A20202020202020202071712E61747461636828646F63756D656E742C2027647261676F766572272C2066756E6374696F6E286529207B0D0A20';
wwv_flow_api.g_varchar2_table(258) := '202020202020202020202069662028652E646174615472616E7366657229207B0D0A202020202020202020202020202020652E646174615472616E736665722E64726F70456666656374203D20276E6F6E65273B0D0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(259) := '20652E70726576656E7444656661756C7428293B0D0A2020202020202020202020207D0D0A2020202020202020207D293B0D0A0D0A20202020202020202071712E55706C6F616444726F705A6F6E652E64726F704F75747369646544697361626C656420';
wwv_flow_api.g_varchar2_table(260) := '3D20747275653B0D0A2020202020207D0D0A2020207D2C0D0A2020205F6174746163684576656E74733A2066756E6374696F6E2829207B0D0A2020202020207661722073656C66203D20746869733B0D0A0D0A20202020202071712E6174746163682873';
wwv_flow_api.g_varchar2_table(261) := '656C662E5F656C656D656E742C2027647261676F766572272C2066756E6374696F6E286529207B0D0A202020202020202020696620282173656C662E5F697356616C696446696C6544726167286529292072657475726E3B0D0A0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(262) := '2076617220656666656374203D20652E646174615472616E736665722E656666656374416C6C6F7765643B0D0A20202020202020202069662028656666656374203D3D20276D6F766527207C7C20656666656374203D3D20276C696E6B4D6F7665272920';
wwv_flow_api.g_varchar2_table(263) := '7B0D0A202020202020202020202020652E646174615472616E736665722E64726F70456666656374203D20276D6F7665273B202F2F20666F7220464620286F6E6C79206D6F766520616C6C6F77656429202020200D0A2020202020202020207D20656C73';
wwv_flow_api.g_varchar2_table(264) := '65207B0D0A202020202020202020202020652E646174615472616E736665722E64726F70456666656374203D2027636F7079273B202F2F20666F72204368726F6D650D0A2020202020202020207D0D0A0D0A202020202020202020652E73746F7050726F';
wwv_flow_api.g_varchar2_table(265) := '7061676174696F6E28293B0D0A202020202020202020652E70726576656E7444656661756C7428293B0D0A2020202020207D293B0D0A0D0A20202020202071712E6174746163682873656C662E5F656C656D656E742C202764726167656E746572272C20';
wwv_flow_api.g_varchar2_table(266) := '66756E6374696F6E286529207B0D0A202020202020202020696620282173656C662E5F697356616C696446696C6544726167286529292072657475726E3B0D0A0D0A20202020202020202073656C662E5F6F7074696F6E732E6F6E456E7465722865293B';
wwv_flow_api.g_varchar2_table(267) := '0D0A2020202020207D293B0D0A0D0A20202020202071712E6174746163682873656C662E5F656C656D656E742C2027647261676C65617665272C2066756E6374696F6E286529207B0D0A202020202020202020696620282173656C662E5F697356616C69';
wwv_flow_api.g_varchar2_table(268) := '6446696C6544726167286529292072657475726E3B0D0A0D0A20202020202020202073656C662E5F6F7074696F6E732E6F6E4C656176652865293B0D0A0D0A2020202020202020207661722072656C61746564546172676574203D20646F63756D656E74';
wwv_flow_api.g_varchar2_table(269) := '2E656C656D656E7446726F6D506F696E7428652E636C69656E74582C20652E636C69656E7459293B0D0A2020202020202020202F2F20646F206E6F742066697265207768656E206D6F76696E672061206D6F757365206F76657220612064657363656E64';
wwv_flow_api.g_varchar2_table(270) := '616E740D0A2020202020202020206966202871712E636F6E7461696E7328746869732C2072656C6174656454617267657429292072657475726E3B0D0A0D0A20202020202020202073656C662E5F6F7074696F6E732E6F6E4C656176654E6F7444657363';
wwv_flow_api.g_varchar2_table(271) := '656E64616E74732865293B0D0A2020202020207D293B0D0A0D0A20202020202071712E6174746163682873656C662E5F656C656D656E742C202764726F70272C2066756E6374696F6E286529207B0D0A202020202020202020696620282173656C662E5F';
wwv_flow_api.g_varchar2_table(272) := '697356616C696446696C6544726167286529292072657475726E3B0D0A0D0A202020202020202020652E70726576656E7444656661756C7428293B0D0A20202020202020202073656C662E5F6F7074696F6E732E6F6E44726F702865293B0D0A20202020';
wwv_flow_api.g_varchar2_table(273) := '20207D293B0D0A2020207D2C0D0A2020205F697356616C696446696C65447261673A2066756E6374696F6E286529207B0D0A202020202020766172206474203D20652E646174615472616E736665722C0D0A2020202020202020202F2F20646F206E6F74';
wwv_flow_api.g_varchar2_table(274) := '20636865636B2064742E74797065732E636F6E7461696E7320696E207765626B69742C206265636175736520697420637261736865732073616661726920342020202020202020202020200D0A20202020202020202069735765626B6974203D206E6176';
wwv_flow_api.g_varchar2_table(275) := '696761746F722E757365724167656E742E696E6465784F6628224170706C655765624B69742229203E202D313B0D0A0D0A2020202020202F2F2064742E656666656374416C6C6F776564206973206E6F6E6520696E2053616661726920350D0A20202020';
wwv_flow_api.g_varchar2_table(276) := '20202F2F2064742E74797065732E636F6E7461696E7320636865636B20697320666F722066697265666F782020202020202020202020200D0A20202020202072657475726E2064742026262064742E656666656374416C6C6F77656420213D20276E6F6E';
wwv_flow_api.g_varchar2_table(277) := '65272026260D0A2020202020202020202864742E66696C6573207C7C20282169735765626B69742026262064742E74797065732E636F6E7461696E732026262064742E74797065732E636F6E7461696E73282746696C6573272929293B0D0A0D0A202020';
wwv_flow_api.g_varchar2_table(278) := '7D0D0A7D3B0D0A0D0A71712E55706C6F6164427574746F6E203D2066756E6374696F6E286F29207B0D0A202020746869732E5F6F7074696F6E73203D207B0D0A202020202020656C656D656E743A206E756C6C2C0D0A2020202020202F2F206966207365';
wwv_flow_api.g_varchar2_table(279) := '7420746F20747275652061646473206D756C7469706C652061747472696275746520746F2066696C6520696E7075742020202020200D0A2020202020206D756C7469706C653A2066616C73652C0D0A2020202020202F2F206E616D652061747472696275';
wwv_flow_api.g_varchar2_table(280) := '7465206F662066696C6520696E7075740D0A2020202020206E616D653A202766696C65272C0D0A2020202020206F6E4368616E67653A2066756E6374696F6E28696E70757429207B7D2C0D0A202020202020686F766572436C6173733A202771712D7570';
wwv_flow_api.g_varchar2_table(281) := '6C6F61642D627574746F6E2D686F766572272C0D0A202020202020666F637573436C6173733A202771712D75706C6F61642D627574746F6E2D666F637573270D0A2020207D3B0D0A0D0A20202071712E657874656E6428746869732E5F6F7074696F6E73';
wwv_flow_api.g_varchar2_table(282) := '2C206F293B0D0A0D0A202020746869732E5F656C656D656E74203D20746869732E5F6F7074696F6E732E656C656D656E743B0D0A0D0A2020202F2F206D616B6520627574746F6E207375697461626C6520636F6E7461696E657220666F7220696E707574';
wwv_flow_api.g_varchar2_table(283) := '0D0A20202071712E63737328746869732E5F656C656D656E742C207B0D0A202020202020706F736974696F6E3A202772656C6174697665272C0D0A2020202020206F766572666C6F773A202768696464656E272C0D0A2020202020202F2F204D616B6520';
wwv_flow_api.g_varchar2_table(284) := '737572652062726F77736520627574746F6E20697320696E2074686520726967687420736964650D0A2020202020202F2F20696E20496E7465726E6574204578706C6F7265720D0A202020202020646972656374696F6E3A20276C7472270D0A2020207D';
wwv_flow_api.g_varchar2_table(285) := '293B0D0A0D0A202020746869732E5F696E707574203D20746869732E5F637265617465496E70757428293B0D0A7D3B0D0A0D0A71712E55706C6F6164427574746F6E2E70726F746F74797065203D207B0D0A2020202F2A2072657475726E732066696C65';
wwv_flow_api.g_varchar2_table(286) := '20696E70757420656C656D656E74202A2F0D0A202020676574496E7075743A2066756E6374696F6E2829207B0D0A20202020202072657475726E20746869732E5F696E7075743B0D0A2020207D2C0D0A2020202F2A20636C65616E732F72656372656174';
wwv_flow_api.g_varchar2_table(287) := '6573207468652066696C6520696E707574202A2F0D0A20202072657365743A2066756E6374696F6E2829207B0D0A20202020202069662028746869732E5F696E7075742E706172656E744E6F646529207B0D0A20202020202020202071712E72656D6F76';
wwv_flow_api.g_varchar2_table(288) := '6528746869732E5F696E707574293B0D0A2020202020207D0D0A0D0A20202020202071712E72656D6F7665436C61737328746869732E5F656C656D656E742C20746869732E5F6F7074696F6E732E666F637573436C617373293B0D0A2020202020207468';
wwv_flow_api.g_varchar2_table(289) := '69732E5F696E707574203D20746869732E5F637265617465496E70757428293B0D0A2020207D2C0D0A2020205F637265617465496E7075743A2066756E6374696F6E2829207B0D0A20202020202076617220696E707574203D20646F63756D656E742E63';
wwv_flow_api.g_varchar2_table(290) := '7265617465456C656D656E742822696E70757422293B0D0A0D0A20202020202069662028746869732E5F6F7074696F6E732E6D756C7469706C6529207B0D0A202020202020202020696E7075742E73657441747472696275746528226D756C7469706C65';
wwv_flow_api.g_varchar2_table(291) := '222C20226D756C7469706C6522293B0D0A2020202020207D0D0A0D0A202020202020696E7075742E736574417474726962757465282274797065222C202266696C6522293B0D0A202020202020696E7075742E73657441747472696275746528226E616D';
wwv_flow_api.g_varchar2_table(292) := '65222C20746869732E5F6F7074696F6E732E6E616D65293B0D0A0D0A20202020202071712E63737328696E7075742C207B0D0A202020202020202020706F736974696F6E3A20276162736F6C757465272C0D0A2020202020202020202F2F20696E204F70';
wwv_flow_api.g_varchar2_table(293) := '657261206F6E6C79202762726F7773652720627574746F6E0D0A2020202020202020202F2F20697320636C69636B61626C6520616E64206974206973206C6F63617465642061740D0A2020202020202020202F2F20746865207269676874207369646520';
wwv_flow_api.g_varchar2_table(294) := '6F662074686520696E7075740D0A20202020202020202072696768743A20302C0D0A202020202020202020746F703A20302C0D0A202020202020202020666F6E7446616D696C793A2027417269616C272C0D0A2020202020202020202F2F203420706572';
wwv_flow_api.g_varchar2_table(295) := '736F6E73207265706F7274656420746869732C20746865206D61782076616C756573207468617420776F726B656420666F72207468656D2077657265203234332C203233362C203233362C203131380D0A202020202020202020666F6E7453697A653A20';
wwv_flow_api.g_varchar2_table(296) := '273131387078272C0D0A2020202020202020206D617267696E3A20302C0D0A20202020202020202070616464696E673A20302C0D0A202020202020202020637572736F723A2027706F696E746572272C0D0A2020202020202020206F7061636974793A20';
wwv_flow_api.g_varchar2_table(297) := '300D0A2020202020207D293B0D0A0D0A202020202020746869732E5F656C656D656E742E617070656E644368696C6428696E707574293B0D0A0D0A2020202020207661722073656C66203D20746869733B0D0A20202020202071712E6174746163682869';
wwv_flow_api.g_varchar2_table(298) := '6E7075742C20276368616E6765272C2066756E6374696F6E2829207B0D0A20202020202020202073656C662E5F6F7074696F6E732E6F6E4368616E676528696E707574293B0D0A2020202020207D293B0D0A0D0A20202020202071712E61747461636828';
wwv_flow_api.g_varchar2_table(299) := '696E7075742C20276D6F7573656F766572272C2066756E6374696F6E2829207B0D0A20202020202020202071712E616464436C6173732873656C662E5F656C656D656E742C2073656C662E5F6F7074696F6E732E686F766572436C617373293B0D0A2020';
wwv_flow_api.g_varchar2_table(300) := '202020207D293B0D0A20202020202071712E61747461636828696E7075742C20276D6F7573656F7574272C2066756E6374696F6E2829207B0D0A20202020202020202071712E72656D6F7665436C6173732873656C662E5F656C656D656E742C2073656C';
wwv_flow_api.g_varchar2_table(301) := '662E5F6F7074696F6E732E686F766572436C617373293B0D0A2020202020207D293B0D0A20202020202071712E61747461636828696E7075742C2027666F637573272C2066756E6374696F6E2829207B0D0A20202020202020202071712E616464436C61';
wwv_flow_api.g_varchar2_table(302) := '73732873656C662E5F656C656D656E742C2073656C662E5F6F7074696F6E732E666F637573436C617373293B0D0A2020202020207D293B0D0A20202020202071712E61747461636828696E7075742C2027626C7572272C2066756E6374696F6E2829207B';
wwv_flow_api.g_varchar2_table(303) := '0D0A20202020202020202071712E72656D6F7665436C6173732873656C662E5F656C656D656E742C2073656C662E5F6F7074696F6E732E666F637573436C617373293B0D0A2020202020207D293B0D0A0D0A2020202020202F2F20494520616E64204F70';
wwv_flow_api.g_varchar2_table(304) := '6572612C20756E666F7274756E6174656C7920686176652032207461622073746F7073206F6E2066696C6520696E7075740D0A2020202020202F2F20776869636820697320756E61636365707461626C6520696E206F757220636173652C206469736162';
wwv_flow_api.g_varchar2_table(305) := '6C65206B6579626F617264206163636573730D0A2020202020206966202877696E646F772E6174746163684576656E7429207B0D0A2020202020202020202F2F206974206973204945206F72204F706572610D0A202020202020202020696E7075742E73';
wwv_flow_api.g_varchar2_table(306) := '65744174747269627574652827746162496E646578272C20222D3122293B0D0A2020202020207D0D0A2020202020202F2F2074686520696E707574206974656D20697320616464656420616E642072656D6F76656420666F7220656163682066696C6520';
wwv_flow_api.g_varchar2_table(307) := '75706C6F6164206F7065726174696F6E0D0A2020202020202F2F20736F207765206E65656420746F20617474616368206F7572206576656E747320656163682074696D652069742773207265637265617465642E0D0A202020202020617065782E6A5175';
wwv_flow_api.g_varchar2_table(308) := '65727928696E707574292E637573746F6D46696C65496E70757428746869732E5F6F7074696F6E73293B0D0A20202020202072657475726E20696E7075743B0D0A2020207D0D0A7D3B0D0A0D0A2F2A2A0D0A202A20436C61737320666F722075706C6F61';
wwv_flow_api.g_varchar2_table(309) := '64696E672066696C65732C2075706C6F6164696E6720697473656C662069732068616E646C6564206279206368696C6420636C61737365730D0A202A2F0D0A71712E55706C6F616448616E646C65724162737472616374203D2066756E6374696F6E286F';
wwv_flow_api.g_varchar2_table(310) := '29207B0D0A202020746869732E5F6F7074696F6E73203D207B0D0A20202020202064656275673A2066616C73652C0D0A202020202020616374696F6E3A20272F75706C6F61642E706870272C0D0A2020202020202F2F206D6178696D756D206E756D6265';
wwv_flow_api.g_varchar2_table(311) := '72206F6620636F6E63757272656E742075706C6F61647320202020202020200D0A2020202020206D6178436F6E6E656374696F6E733A203939392C0D0A2020202020206F6E50726F67726573733A2066756E6374696F6E2869642C2066696C654E616D65';
wwv_flow_api.g_varchar2_table(312) := '2C206C6F616465642C20746F74616C29207B7D2C0D0A2020202020206F6E436F6D706C6574653A2066756E6374696F6E2869642C2066696C654E616D652C20726573706F6E736529207B7D2C0D0A2020202020206F6E43616E63656C3A2066756E637469';
wwv_flow_api.g_varchar2_table(313) := '6F6E2869642C2066696C654E616D6529207B7D0D0A2020207D3B0D0A20202071712E657874656E6428746869732E5F6F7074696F6E732C206F293B0D0A0D0A202020746869732E5F7175657565203D205B5D3B0D0A2020202F2F20706172616D7320666F';
wwv_flow_api.g_varchar2_table(314) := '722066696C657320696E2071756575650D0A202020746869732E5F706172616D73203D205B5D3B0D0A7D3B0D0A71712E55706C6F616448616E646C657241627374726163742E70726F746F74797065203D207B0D0A2020206C6F673A2066756E6374696F';
wwv_flow_api.g_varchar2_table(315) := '6E2873747229207B0D0A20202020202069662028746869732E5F6F7074696F6E732E64656275672026262077696E646F772E636F6E736F6C652920636F6E736F6C652E6C6F6728275B75706C6F616465725D2027202B20737472293B0D0A2020207D2C0D';
wwv_flow_api.g_varchar2_table(316) := '0A2020202F2A2A0D0A202020202A20416464732066696C65206F722066696C6520696E70757420746F207468652071756575650D0A202020202A204072657475726E732069640D0A202020202A2A2F0D0A2020206164643A2066756E6374696F6E286669';
wwv_flow_api.g_varchar2_table(317) := '6C6529207B7D2C0D0A2020202F2A2A0D0A202020202A2053656E6473207468652066696C65206964656E74696669656420627920696420616E64206164646974696F6E616C20717565727920706172616D7320746F20746865207365727665720D0A2020';
wwv_flow_api.g_varchar2_table(318) := '20202A2F0D0A20202075706C6F61643A2066756E6374696F6E2869642C20706172616D7329207B0D0A202020202020766172206C656E203D20746869732E5F71756575652E70757368286964293B0D0A0D0A20202020202076617220636F7079203D207B';
wwv_flow_api.g_varchar2_table(319) := '7D3B0D0A20202020202071712E657874656E6428636F70792C20706172616D73293B0D0A202020202020746869732E5F706172616D735B69645D203D20636F70793B0D0A0D0A2020202020202F2F20696620746F6F206D616E7920616374697665207570';
wwv_flow_api.g_varchar2_table(320) := '6C6F6164732C20776169742E2E2E0D0A202020202020696620286C656E203C3D20746869732E5F6F7074696F6E732E6D6178436F6E6E656374696F6E7329207B0D0A202020202020202020746869732E5F75706C6F61642869642C20746869732E5F7061';
wwv_flow_api.g_varchar2_table(321) := '72616D735B69645D293B0D0A2020202020207D0D0A2020207D2C0D0A2020202F2A2A0D0A202020202A2043616E63656C732066696C652075706C6F61642062792069640D0A202020202A2F0D0A20202063616E63656C3A2066756E6374696F6E28696429';
wwv_flow_api.g_varchar2_table(322) := '207B0D0A202020202020746869732E5F63616E63656C286964293B0D0A202020202020746869732E5F64657175657565286964293B0D0A2020207D2C0D0A2020202F2A2A0D0A202020202A2043616E63656C6C7320616C6C2075706C6F6164730D0A2020';
wwv_flow_api.g_varchar2_table(323) := '20202A2F0D0A20202063616E63656C416C6C3A2066756E6374696F6E2829207B0D0A202020202020666F7220287661722069203D20303B2069203C20746869732E5F71756575652E6C656E6774683B20692B2B29207B0D0A202020202020202020746869';
wwv_flow_api.g_varchar2_table(324) := '732E5F63616E63656C28746869732E5F71756575655B695D293B0D0A2020202020207D0D0A202020202020746869732E5F7175657565203D205B5D3B0D0A2020207D2C0D0A2020202F2A2A0D0A202020202A2052657475726E73206E616D65206F662074';
wwv_flow_api.g_varchar2_table(325) := '68652066696C65206964656E7469666965642062792069640D0A202020202A2F0D0A2020206765744E616D653A2066756E6374696F6E28696429207B7D2C0D0A2020202F2A2A0D0A202020202A2052657475726E732073697A65206F6620746865206669';
wwv_flow_api.g_varchar2_table(326) := '6C65206964656E7469666965642062792069640D0A202020202A2F0D0A20202067657453697A653A2066756E6374696F6E28696429207B7D2C0D0A2020202F2A2A0D0A202020202A2052657475726E73206964206F662066696C6573206265696E672075';
wwv_flow_api.g_varchar2_table(327) := '706C6F61646564206F720D0A202020202A2077616974696E6720666F72207468656972207475726E0D0A202020202A2F0D0A20202067657451756575653A2066756E6374696F6E2829207B0D0A20202020202072657475726E20746869732E5F71756575';
wwv_flow_api.g_varchar2_table(328) := '653B0D0A2020207D2C0D0A2020202F2A2A0D0A202020202A2041637475616C2075706C6F6164206D6574686F640D0A202020202A2F0D0A2020205F75706C6F61643A2066756E6374696F6E28696429207B7D2C0D0A2020202F2A2A0D0A202020202A2041';
wwv_flow_api.g_varchar2_table(329) := '637475616C2063616E63656C206D6574686F640D0A202020202A2F0D0A2020205F63616E63656C3A2066756E6374696F6E28696429207B7D2C0D0A2020202F2A2A0D0A202020202A2052656D6F76657320656C656D656E742066726F6D2071756575652C';
wwv_flow_api.g_varchar2_table(330) := '207374617274732075706C6F6164206F66206E6578740D0A202020202A2F0D0A2020205F646571756575653A2066756E6374696F6E28696429207B0D0A2020202020207661722069203D2071712E696E6465784F6628746869732E5F71756575652C2069';
wwv_flow_api.g_varchar2_table(331) := '64293B0D0A202020202020746869732E5F71756575652E73706C69636528692C2031293B0D0A0D0A202020202020766172206D6178203D20746869732E5F6F7074696F6E732E6D6178436F6E6E656374696F6E733B0D0A0D0A2020202020206966202874';
wwv_flow_api.g_varchar2_table(332) := '6869732E5F71756575652E6C656E677468203E3D206D617829207B0D0A202020202020202020766172206E6578744964203D20746869732E5F71756575655B6D6178202D20315D3B0D0A202020202020202020746869732E5F75706C6F6164286E657874';
wwv_flow_api.g_varchar2_table(333) := '49642C20746869732E5F706172616D735B6E65787449645D293B0D0A2020202020207D0D0A2020207D0D0A7D3B0D0A0D0A2F2A2A0D0A202A20436C61737320666F722075706C6F6164696E672066696C6573207573696E6720666F726D20616E64206966';
wwv_flow_api.g_varchar2_table(334) := '72616D650D0A202A2040696E6865726974732071712E55706C6F616448616E646C657241627374726163740D0A202A2F0D0A71712E55706C6F616448616E646C6572466F726D203D2066756E6374696F6E286F29207B0D0A20202071712E55706C6F6164';
wwv_flow_api.g_varchar2_table(335) := '48616E646C657241627374726163742E6170706C7928746869732C20617267756D656E7473293B0D0A0D0A202020746869732E5F696E70757473203D207B7D3B0D0A7D3B0D0A2F2F2040696E6865726974732071712E55706C6F616448616E646C657241';
wwv_flow_api.g_varchar2_table(336) := '627374726163740D0A71712E657874656E642871712E55706C6F616448616E646C6572466F726D2E70726F746F747970652C2071712E55706C6F616448616E646C657241627374726163742E70726F746F74797065293B0D0A0D0A71712E657874656E64';
wwv_flow_api.g_varchar2_table(337) := '2871712E55706C6F616448616E646C6572466F726D2E70726F746F747970652C207B0D0A2020206164643A2066756E6374696F6E2866696C65496E70757429207B0D0A20202020202066696C65496E7075742E73657441747472696275746528276E616D';
wwv_flow_api.g_varchar2_table(338) := '65272C2027705F74303327293B0D0A202020202020766172206964203D202771712D75706C6F61642D68616E646C65722D696672616D6527202B2071712E676574556E69717565496428293B0D0A0D0A202020202020746869732E5F696E707574735B69';
wwv_flow_api.g_varchar2_table(339) := '645D203D2066696C65496E7075743B0D0A0D0A2020202020202F2F2072656D6F76652066696C6520696E7075742066726F6D20444F4D0D0A2020202020206966202866696C65496E7075742E706172656E744E6F646529207B0D0A202020202020202020';
wwv_flow_api.g_varchar2_table(340) := '71712E72656D6F76652866696C65496E707574293B0D0A2020202020207D0D0A0D0A20202020202072657475726E2069643B0D0A2020207D2C0D0A2020206765744E616D653A2066756E6374696F6E28696429207B0D0A2020202020202F2F2067657420';
wwv_flow_api.g_varchar2_table(341) := '696E7075742076616C756520616E642072656D6F7665207061746820746F206E6F726D616C697A650D0A20202020202072657475726E20746869732E5F696E707574735B69645D2E76616C75652E7265706C616365282F2E2A285C2F7C5C5C292F2C2022';
wwv_flow_api.g_varchar2_table(342) := '22293B0D0A2020207D2C0D0A2020205F63616E63656C3A2066756E6374696F6E28696429207B0D0A202020202020746869732E5F6F7074696F6E732E6F6E43616E63656C2869642C20746869732E6765744E616D6528696429293B0D0A0D0A2020202020';
wwv_flow_api.g_varchar2_table(343) := '2064656C65746520746869732E5F696E707574735B69645D3B0D0A0D0A20202020202076617220696672616D65203D20646F63756D656E742E676574456C656D656E7442794964286964293B0D0A20202020202069662028696672616D6529207B0D0A20';
wwv_flow_api.g_varchar2_table(344) := '20202020202020202F2F20746F2063616E63656C2072657175657374207365742073726320746F20736F6D657468696E6720656C73650D0A2020202020202020202F2F20776520757365207372633D226A6176617363726970743A66616C73653B222062';
wwv_flow_api.g_varchar2_table(345) := '65636175736520697420646F65736E27740D0A2020202020202020202F2F2074726967676572206965362070726F6D7074206F6E2068747470730D0A202020202020202020696672616D652E7365744174747269627574652827737263272C20276A6176';
wwv_flow_api.g_varchar2_table(346) := '617363726970743A66616C73653B27293B0D0A0D0A20202020202020202071712E72656D6F766528696672616D65293B0D0A2020202020207D0D0A2020207D2C0D0A2020205F75706C6F61643A2066756E6374696F6E2869642C20706172616D7329207B';
wwv_flow_api.g_varchar2_table(347) := '0D0A20202020202076617220696E707574203D20746869732E5F696E707574735B69645D3B0D0A0D0A2020202020206966202821696E70757429207B0D0A2020202020202020207468726F77206E6577204572726F72282766696C652077697468207061';
wwv_flow_api.g_varchar2_table(348) := '7373656420696420776173206E6F742061646465642C206F7220616C72656164792075706C6F61646564206F722063616E63656C6C656427293B0D0A2020202020207D0D0A0D0A2020202020207661722066696C654E616D65203D20746869732E676574';
wwv_flow_api.g_varchar2_table(349) := '4E616D65286964293B0D0A0D0A20202020202076617220696672616D65203D20746869732E5F637265617465496672616D65286964293B0D0A20202020202076617220666F726D203D20746869732E5F637265617465466F726D28696672616D652C2066';
wwv_flow_api.g_varchar2_table(350) := '696C654E616D652C20706172616D73293B0D0A202020202020666F726D2E617070656E644368696C6428696E707574293B0D0A0D0A2020202020207661722073656C66203D20746869733B0D0A202020202020746869732E5F6174746163684C6F616445';
wwv_flow_api.g_varchar2_table(351) := '76656E7428696672616D652C2066756E6374696F6E2829207B0D0A20202020202020202073656C662E6C6F672827696672616D65206C6F6164656427293B0D0A0D0A20202020202020202076617220726573706F6E7365203D2073656C662E5F67657449';
wwv_flow_api.g_varchar2_table(352) := '6672616D65436F6E74656E744A534F4E28696672616D65293B0D0A0D0A20202020202020202073656C662E5F6F7074696F6E732E6F6E436F6D706C6574652869642C2066696C654E616D652C20726573706F6E7365293B0D0A2020202020202020207365';
wwv_flow_api.g_varchar2_table(353) := '6C662E5F64657175657565286964293B0D0A0D0A20202020202020202064656C6574652073656C662E5F696E707574735B69645D3B0D0A2020202020202020202F2F2074696D656F757420616464656420746F2066697820627573792073746174652069';
wwv_flow_api.g_varchar2_table(354) := '6E204646332E360D0A20202020202020202073657454696D656F75742866756E6374696F6E2829207B0D0A20202020202020202020202071712E72656D6F766528696672616D65293B0D0A2020202020202020207D2C2031293B0D0A2020202020207D29';
wwv_flow_api.g_varchar2_table(355) := '3B0D0A0D0A202020202020666F726D2E7375626D697428293B0D0A20202020202071712E72656D6F766528666F726D293B0D0A0D0A20202020202072657475726E2069643B0D0A2020207D2C0D0A2020205F6174746163684C6F61644576656E743A2066';
wwv_flow_api.g_varchar2_table(356) := '756E6374696F6E28696672616D652C2063616C6C6261636B29207B0D0A20202020202071712E61747461636828696672616D652C20276C6F6164272C2066756E6374696F6E2829207B0D0A2020202020202020202F2F207768656E2077652072656D6F76';
wwv_flow_api.g_varchar2_table(357) := '6520696672616D652066726F6D20646F6D0D0A2020202020202020202F2F2074686520726571756573742073746F70732C2062757420696E204945206C6F61640D0A2020202020202020202F2F206576656E742066697265730D0A202020202020202020';
wwv_flow_api.g_varchar2_table(358) := '6966202821696672616D652E706172656E744E6F646529207B0D0A20202020202020202020202072657475726E3B0D0A2020202020202020207D0D0A0D0A2020202020202020202F2F20666978696E67204F706572612031302E35330D0A202020202020';
wwv_flow_api.g_varchar2_table(359) := '20202069662028696672616D652E636F6E74656E74446F63756D656E7420262620696672616D652E636F6E74656E74446F63756D656E742E626F647920262620696672616D652E636F6E74656E74446F63756D656E742E626F64792E696E6E657248544D';
wwv_flow_api.g_varchar2_table(360) := '4C203D3D202266616C73652229207B0D0A2020202020202020202020202F2F20496E204F70657261206576656E74206973206669726564207365636F6E642074696D650D0A2020202020202020202020202F2F207768656E20626F64792E696E6E657248';
wwv_flow_api.g_varchar2_table(361) := '544D4C206368616E6765642066726F6D2066616C73650D0A2020202020202020202020202F2F20746F2073657276657220726573706F6E736520617070726F782E2061667465722031207365630D0A2020202020202020202020202F2F207768656E2077';
wwv_flow_api.g_varchar2_table(362) := '652075706C6F61642066696C65207769746820696672616D650D0A20202020202020202020202072657475726E3B0D0A2020202020202020207D0D0A0D0A20202020202020202063616C6C6261636B28293B0D0A2020202020207D293B0D0A2020207D2C';
wwv_flow_api.g_varchar2_table(363) := '0D0A2020202F2A2A0D0A202020202A2046726F6D204150455820342E312E31206F6E7761726473207765206E6565642074776F2065787472612068696464656E206669656C64732077697468696E2074686520666F726D0D0A202020202A206275742074';
wwv_flow_api.g_varchar2_table(364) := '6865206F6E6C79207761792077652063616E20676574207468656D2069732062792072657175657374696E6720746865206170657820696672616D652075706C6F616420706167650D0A202020202A20616E64207265706C6163696E67207468656D2077';
wwv_flow_api.g_varchar2_table(365) := '697468696E206F75722073746174696320666F726D2067656E6572617465642077697468696E2074686520706C7567696E20504C53514C0D0A202020202A2F0D0A2020205F6765745365637572697479496E707574733A2066756E6374696F6E2829207B';
wwv_flow_api.g_varchar2_table(366) := '0D0A20202020202076617220756977203D20746869733B0D0A202020202020766172206F7074696F6E73203D207B0D0A20202020202020202022705F666C6F775F6964223A202428222370466C6F77496422292E76616C28292C0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(367) := '2022705F666C6F775F737465705F6964223A207569772E5F6F7074696F6E732E696672616D6550616765207C7C20223537353635222C0D0A20202020202020202022705F696E7374616E6365223A202428222370496E7374616E636522292E76616C2829';
wwv_flow_api.g_varchar2_table(368) := '2C0D0A20202020202020202022783031223A204D6174682E72616E646F6D28290D0A2020202020207D3B0D0A202020202020242E616A6178287B0D0A202020202020202020747970653A2022474554222C0D0A20202020202020202075726C3A20227777';
wwv_flow_api.g_varchar2_table(369) := '765F666C6F772E73686F77222C0D0A2020202020202020206173796E633A2066616C73652C0D0A202020202020202020646174613A206F7074696F6E732C0D0A202020202020202020737563636573733A2066756E6374696F6E286F626A29207B0D0A20';
wwv_flow_api.g_varchar2_table(370) := '202020202020202020202076617220696E70757448544D4C2C202470616765203D2024286F626A293B0D0A20202020202020202020202076617220696E70757473203D2024706167652E66696E6428275B6E616D653D22705F706167655F7375626D6973';
wwv_flow_api.g_varchar2_table(371) := '73696F6E5F6964225D2C5B6E616D653D22705F706167655F636865636B73756D225D2729207C7C205B5D3B0D0A202020202020202020202020666F7220287661722069203D20303B2069203C20696E707574732E6C656E6774683B20692B2B29207B0D0A';
wwv_flow_api.g_varchar2_table(372) := '202020202020202020202020202020696E70757448544D4C202B3D20696E707574735B695D2E6F7574657248544D4C3B0D0A2020202020202020202020207D0D0A2020202020202020202020207569772E5F6F7074696F6E732E696672616D65466F726D';
wwv_flow_api.g_varchar2_table(373) := '203D207569772E5F6F7074696F6E732E696672616D65466F726D2E7265706C616365282F235345435552495459232F2C20696E70757448544D4C293B0D0A2020202020202020207D0D0A2020202020207D293B0D0A0D0A2020207D2C0D0A2020202F2A2A';
wwv_flow_api.g_varchar2_table(374) := '0D0A202020202A2052657475726E73206A736F6E206F626A65637420726563656976656420627920696672616D652066726F6D207365727665722E0D0A202020202A2F0D0A2020205F676574496672616D65436F6E74656E744A534F4E3A2066756E6374';
wwv_flow_api.g_varchar2_table(375) := '696F6E28696672616D6529207B0D0A2020202020202F2F20696672616D652E636F6E74656E7457696E646F772E646F63756D656E74202D20666F722049453C370D0A20202020202076617220646F63203D20696672616D652E636F6E74656E74446F6375';
wwv_flow_api.g_varchar2_table(376) := '6D656E74203F20696672616D652E636F6E74656E74446F63756D656E74203A20696672616D652E636F6E74656E7457696E646F772E646F63756D656E742C0D0A202020202020202020726573706F6E73653B0D0A0D0A202020202020746869732E6C6F67';
wwv_flow_api.g_varchar2_table(377) := '2822636F6E76657274696E6720696672616D65277320696E6E657248544D4C20746F204A534F4E22293B0D0A202020202020746869732E6C6F672822696E6E657248544D4C203D2022202B20646F632E626F64792E696E6E657248544D4C2E7265706C61';
wwv_flow_api.g_varchar2_table(378) := '6365282F4C6F636174696F6E2E2A242F2C20272729293B0D0A0D0A202020202020747279207B0D0A202020202020202020726573706F6E7365203D206576616C28222822202B20646F632E626F64792E696E6E657248544D4C2E7265706C616365282F4C';
wwv_flow_api.g_varchar2_table(379) := '6F636174696F6E2E2A242F2C20272729202B20222922293B0D0A2020202020207D206361746368202865727229207B0D0A202020202020202020726573706F6E7365203D207B7D3B0D0A2020202020207D0D0A0D0A20202020202072657475726E207265';
wwv_flow_api.g_varchar2_table(380) := '73706F6E73653B0D0A2020207D2C0D0A2020202F2A2A0D0A202020202A204372656174657320696672616D65207769746820756E69717565206E616D650D0A202020202A2F0D0A2020205F637265617465496672616D653A2066756E6374696F6E286964';
wwv_flow_api.g_varchar2_table(381) := '29207B0D0A2020202020202F2F2057652063616E27742075736520666F6C6C6F77696E6720636F646520617320746865206E616D65206174747269627574650D0A2020202020202F2F20776F6E27742062652070726F7065726C79207265676973746572';
wwv_flow_api.g_varchar2_table(382) := '656420696E204945362C20616E64206E65772077696E646F770D0A2020202020202F2F206F6E20666F726D207375626D69742077696C6C206F70656E0D0A2020202020202F2F2076617220696672616D65203D20646F63756D656E742E63726561746545';
wwv_flow_api.g_varchar2_table(383) := '6C656D656E742827696672616D6527293B0D0A2020202020202F2F20696672616D652E73657441747472696275746528276E616D65272C206964293B0D0A20202020202076617220696672616D65203D2071712E746F456C656D656E7428273C69667261';
wwv_flow_api.g_varchar2_table(384) := '6D65207372633D226A6176617363726970743A66616C73653B22206E616D653D2227202B206964202B202722202F3E27293B0D0A2020202020202F2F207372633D226A6176617363726970743A66616C73653B222072656D6F766573206965362070726F';
wwv_flow_api.g_varchar2_table(385) := '6D7074206F6E2068747470730D0A202020202020696672616D652E73657441747472696275746528276964272C206964293B0D0A0D0A202020202020696672616D652E7374796C652E646973706C6179203D20276E6F6E65273B0D0A202020202020646F';
wwv_flow_api.g_varchar2_table(386) := '63756D656E742E626F64792E617070656E644368696C6428696672616D65293B0D0A0D0A20202020202072657475726E20696672616D653B0D0A2020207D2C0D0A2020202F2A2A0D0A202020202A204372656174657320666F726D2C2074686174207769';
wwv_flow_api.g_varchar2_table(387) := '6C6C206265207375626D697474656420746F20696672616D650D0A202020202A2F0D0A2020205F637265617465466F726D3A2066756E6374696F6E28696672616D652C2066696C654E616D652C20706172616D7329207B0D0A2020202020202F2F206672';
wwv_flow_api.g_varchar2_table(388) := '6F6D204150455820342E312E31206F6E7761726473207765206E656564206E657720736563757269747920696E666F726D6174696F6E2077697468696E2074686520666F726D0D0A202020202020746869732E5F6765745365637572697479496E707574';
wwv_flow_api.g_varchar2_table(389) := '7328293B0D0A2020202020202F2F20576520706173732074686520666F726D20617320616E206F7074696F6E207768656E20696E6974696C61697A696E672074686520706C7567696E0D0A2020202020202F2F207765206E65656420746F207265706C61';
wwv_flow_api.g_varchar2_table(390) := '6365207468652066696C656E616D652077697468696E2074686520666F726D20646566696E6974696F6E0D0A2020202020202F2F207768656E20776520706F73742069742C20696E206F7264657220746F20776F726B206F757420776861742066696C65';
wwv_flow_api.g_varchar2_table(391) := '6E616D65207765206E6565640D0A2020202020202F2F20746F206D6F7665206F7574206F66207777765F666C6F775F66696C65730D0A20202020202076617220666F726D203D2071712E746F456C656D656E7428746869732E5F6F7074696F6E732E6966';
wwv_flow_api.g_varchar2_table(392) := '72616D65466F726D2E7265706C616365282F2346494C454E414D45232F2C2066696C654E616D6529293B0D0A0D0A202020202020766172207175657279537472696E67203D2071712E6F626A3275726C28706172616D732C20746869732E5F6F7074696F';
wwv_flow_api.g_varchar2_table(393) := '6E732E616374696F6E293B0D0A0D0A202020202020666F726D2E7365744174747269627574652827616374696F6E272C207175657279537472696E67293B0D0A202020202020666F726D2E7365744174747269627574652827746172676574272C206966';
wwv_flow_api.g_varchar2_table(394) := '72616D652E6E616D65293B0D0A202020202020666F726D2E7374796C652E646973706C6179203D20276E6F6E65273B0D0A202020202020646F63756D656E742E626F64792E617070656E644368696C6428666F726D293B0D0A0D0A202020202020726574';
wwv_flow_api.g_varchar2_table(395) := '75726E20666F726D3B0D0A2020207D0D0A7D293B0D0A0D0A2F2A2A0D0A202A20436C61737320666F722075706C6F6164696E672066696C6573207573696E67207868720D0A202A2040696E6865726974732071712E55706C6F616448616E646C65724162';
wwv_flow_api.g_varchar2_table(396) := '7374726163740D0A202A2F0D0A71712E55706C6F616448616E646C6572586872203D2066756E6374696F6E286F29207B0D0A20202071712E55706C6F616448616E646C657241627374726163742E6170706C7928746869732C20617267756D656E747329';
wwv_flow_api.g_varchar2_table(397) := '3B0D0A0D0A202020746869732E5F66696C6573203D205B5D3B0D0A202020746869732E5F78687273203D205B5D3B0D0A202020746869732E5F61706578506172616D73203D2022223B0D0A202020746869732E5F7175657279537472696E67203D202222';
wwv_flow_api.g_varchar2_table(398) := '3B0D0A202020746869732E5F74657874203D2022223B0D0A202020746869732E5F61706578506172616D4172726179203D205B5D3B0D0A0D0A2020202F2F2063757272656E74206C6F616465642073697A6520696E20627974657320666F722065616368';
wwv_flow_api.g_varchar2_table(399) := '2066696C65200D0A202020746869732E5F6C6F61646564203D205B5D3B0D0A7D3B0D0A0D0A2F2F20737461746963206D6574686F640D0A71712E55706C6F616448616E646C65725868722E6973537570706F72746564203D2066756E6374696F6E282920';
wwv_flow_api.g_varchar2_table(400) := '7B0D0A20202076617220696E707574203D20646F63756D656E742E637265617465456C656D656E742827696E70757427293B0D0A202020696E7075742E74797065203D202766696C65273B0D0A0D0A20202072657475726E20280D0A202020202020276D';
wwv_flow_api.g_varchar2_table(401) := '756C7469706C652720696E20696E7075742026260D0A202020202020747970656F662077696E646F772E46696C6552656164657220213D2022756E646566696E6564222026260D0A202020202020747970656F662046696C6520213D2022756E64656669';
wwv_flow_api.g_varchar2_table(402) := '6E6564222026260D0A202020202020747970656F66286E657720584D4C48747470526571756573742829292E75706C6F616420213D2022756E646566696E656422293B0D0A7D3B0D0A0D0A2F2F2040696E6865726974732071712E55706C6F616448616E';
wwv_flow_api.g_varchar2_table(403) := '646C657241627374726163740D0A71712E657874656E642871712E55706C6F616448616E646C65725868722E70726F746F747970652C2071712E55706C6F616448616E646C657241627374726163742E70726F746F74797065290D0A0D0A71712E657874';
wwv_flow_api.g_varchar2_table(404) := '656E642871712E55706C6F616448616E646C65725868722E70726F746F747970652C207B0D0A2020202F2A2A0D0A202020202A20416464732066696C6520746F207468652071756575650D0A202020202A2052657475726E7320696420746F2075736520';
wwv_flow_api.g_varchar2_table(405) := '776974682075706C6F61642C2063616E63656C0D0A202020202A2A2F0D0A2020206164643A2066756E6374696F6E2866696C6529207B0D0A20202020202069662028212866696C6520696E7374616E63656F662046696C652929207B0D0A202020202020';
wwv_flow_api.g_varchar2_table(406) := '2020207468726F77206E6577204572726F722827506173736564206F626A20696E206E6F7420612046696C652028696E2071712E55706C6F616448616E646C65725868722927293B0D0A2020202020207D0D0A0D0A20202020202072657475726E207468';
wwv_flow_api.g_varchar2_table(407) := '69732E5F66696C65732E707573682866696C6529202D20313B0D0A2020207D2C0D0A2020206765744E616D653A2066756E6374696F6E28696429207B0D0A2020202020207661722066696C65203D20746869732E5F66696C65735B69645D3B0D0A202020';
wwv_flow_api.g_varchar2_table(408) := '2020202F2F20666978206D697373696E67206E616D6520696E2053616661726920340D0A20202020202072657475726E2066696C652E66696C654E616D6520213D206E756C6C203F2066696C652E66696C654E616D65203A2066696C652E6E616D653B0D';
wwv_flow_api.g_varchar2_table(409) := '0A2020207D2C0D0A202020676574547970653A2066756E6374696F6E28696429207B0D0A2020202020207661722066696C65203D20746869732E5F66696C65735B69645D3B0D0A2020202020202F2F20666978206D697373696E67206E616D6520696E20';
wwv_flow_api.g_varchar2_table(410) := '53616661726920340D0A20202020202072657475726E2066696C652E7479706520213D206E756C6C203F2066696C652E74797065203A2027746578742F68746D6C273B0D0A2020207D2C0D0A20202067657453697A653A2066756E6374696F6E28696429';
wwv_flow_api.g_varchar2_table(411) := '207B0D0A2020202020207661722066696C65203D20746869732E5F66696C65735B69645D3B0D0A20202020202072657475726E2066696C652E66696C6553697A6520213D206E756C6C203F2066696C652E66696C6553697A65203A2066696C652E73697A';
wwv_flow_api.g_varchar2_table(412) := '653B0D0A2020207D2C0D0A2020202F2A2A0D0A202020202A2052657475726E732075706C6F6164656420627974657320666F722066696C65206964656E7469666965642062792069640D0A202020202A2F0D0A2020206765744C6F616465643A2066756E';
wwv_flow_api.g_varchar2_table(413) := '6374696F6E28696429207B0D0A20202020202072657475726E20746869732E5F6C6F616465645B69645D207C7C20303B0D0A2020207D2C0D0A202020617065784573636170653A2066756E6374696F6E2876616C29207B0D0A2020202020202F2F20666F';
wwv_flow_api.g_varchar2_table(414) := '72636520746F206265206120737472696E670D0A20202020202076616C203D2076616C202B2022223B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C252F672C202225323522293B0D0A20202020202076616C203D2076616C2E72';
wwv_flow_api.g_varchar2_table(415) := '65706C616365282F5C2B2F672C202225324222293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C202F672C202225323022293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C2E2F672C20222532452229';
wwv_flow_api.g_varchar2_table(416) := '3B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C2A2F672C202225324122293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C3F2F672C202225334622293B0D0A20202020202076616C203D2076616C2E72';
wwv_flow_api.g_varchar2_table(417) := '65706C616365282F5C5C2F672C202225354322293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C2F2F672C202225324622293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C3E2F672C20222533452229';
wwv_flow_api.g_varchar2_table(418) := '3B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C3C2F672C202225334322293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C7B2F672C202225374222293B0D0A20202020202076616C203D2076616C2E72';
wwv_flow_api.g_varchar2_table(419) := '65706C616365282F5C7D2F672C202225374422293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C7E2F672C202225374522293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C5B2F672C20222535422229';
wwv_flow_api.g_varchar2_table(420) := '3B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C5D2F672C202225354422293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C602F672C202225363022293B0D0A20202020202076616C203D2076616C2E72';
wwv_flow_api.g_varchar2_table(421) := '65706C616365282F5C3B2F672C202225334222293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C3F2F672C202225334622293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C402F672C20222534302229';
wwv_flow_api.g_varchar2_table(422) := '3B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C262F672C202225323622293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C232F672C202225323322293B0D0A20202020202076616C203D2076616C2E72';
wwv_flow_api.g_varchar2_table(423) := '65706C616365282F5C7C2F672C202225374322293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C5E2F672C202225354522293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C3A2F672C20222533412229';
wwv_flow_api.g_varchar2_table(424) := '3B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C3D2F672C202225334422293B0D0A20202020202076616C203D2076616C2E7265706C616365282F5C242F672C202225323422293B0D0A2020202020202F2F76616C203D2076616C';
wwv_flow_api.g_varchar2_table(425) := '2E7265706C616365282F5C222F672C202225323222293B0D0A20202020202072657475726E2076616C3B0D0A2020207D2C0D0A20202073706C6974537472696E673A2066756E6374696F6E286F626A2C20704C656E67746829207B0D0A2020202020206C';
wwv_flow_api.g_varchar2_table(426) := '4172726179203D206F626A2E61706578506172616D41727261793B0D0A202020202020766172206368756E6B73203D204D6174682E6365696C286F626A2E746578742E6C656E677468202F20704C656E677468293B0D0A202020202020696620286F626A';
wwv_flow_api.g_varchar2_table(427) := '2E746578742E6C656E677468203C3D20704C656E67746829207B0D0A2020202020202020206C41727261795B6C41727261792E6C656E6774685D203D206F626A2E746578743B0D0A2020202020207D20656C7365207B0D0A202020202020202020666F72';
wwv_flow_api.g_varchar2_table(428) := '20287661722069203D20303B2069203C206368756E6B73202D20313B20692B2B29207B0D0A2020202020202020202020206C41727261795B6C41727261792E6C656E6774685D203D206F626A2E746578742E7375627374722869202A20704C656E677468';
wwv_flow_api.g_varchar2_table(429) := '2C20704C656E677468293B0D0A2020202020202020207D0D0A2020202020202020206C41727261795B6C41727261792E6C656E6774685D203D206F626A2E746578742E73756273747228286368756E6B73202D203129202A20704C656E6774682C206F62';
wwv_flow_api.g_varchar2_table(430) := '6A2E746578742E6C656E677468293B0D0A2020202020207D0D0A2020207D2C0D0A20202061706578416464506172616D3A2066756E6374696F6E286F626A2C206E616D652C2076616C29207B0D0A202020202020696620286F626A2E6170657850617261';
wwv_flow_api.g_varchar2_table(431) := '6D73203D3D20272729206F626A2E61706578506172616D73203D206E616D65202B20273D27202B202876616C20213D206E756C6C203F20746869732E617065784573636170652876616C29203A202727293B0D0A202020202020656C73650D0A20202020';
wwv_flow_api.g_varchar2_table(432) := '20202020206F626A2E61706578506172616D73203D206F626A2E61706578506172616D73202B20272627202B206E616D65202B20273D27202B202876616C20213D206E756C6C203F20746869732E617065784573636170652876616C29203A202727293B';
wwv_flow_api.g_varchar2_table(433) := '0D0A20202020202072657475726E3B0D0A2020207D2C0D0A2020206170657841646441727261793A2066756E6374696F6E286F626A2C2070466E756D62657229207B0D0A202020202020766172206C464E616D65203D202766273B0D0A20202020202070';
wwv_flow_api.g_varchar2_table(434) := '466E756D626572203D20246E766C2870466E756D6265722C2031293B0D0A2020202020206966202870466E756D626572203C20313029207B0D0A2020202020202020206C464E616D65202B3D20273027202B2070466E756D6265720D0A2020202020207D';
wwv_flow_api.g_varchar2_table(435) := '20656C7365207B0D0A2020202020202020206C464E616D65202B3D2070466E756D6265720D0A2020202020207D3B0D0A202020202020666F7220287661722069203D20302C206C656E203D206F626A2E61706578506172616D41727261792E6C656E6774';
wwv_flow_api.g_varchar2_table(436) := '683B2069203C206C656E3B20692B2B29207B0D0A202020202020202020746869732E61706578416464506172616D286F626A2C206C464E616D652C206F626A2E61706578506172616D41727261795B695D293B0D0A2020202020207D0D0A2020207D2C0D';
wwv_flow_api.g_varchar2_table(437) := '0A20202061706578416464417272617946696C653A2066756E6374696F6E28706172616D732C2066696C652C2070466E756D6265722C2078687229207B0D0A202020202020746869732E5F61706578506172616D73203D2022223B202F2F207265736574';
wwv_flow_api.g_varchar2_table(438) := '206F757220706172616D7320666F722065766572792066696C652075706C6F61640D0A2020202020202F2F206D6F64696669656420746F2073746F70207573696E6720676574417342696E61727920776869636820697320646570726563617465642069';
wwv_flow_api.g_varchar2_table(439) := '6E2046697265666F780D0A2020202020207661722073656C66203D20746869733B0D0A20202020202076617220726561646572203D206E65772046696C6552656164657228293B0D0A2020202020207265616465722E6F6E6C6F6164203D2066756E6374';
wwv_flow_api.g_varchar2_table(440) := '696F6E286529207B0D0A202020202020202020766172206F626A203D207B0D0A202020202020202020202020746578743A2022222C0D0A20202020202020202020202061706578506172616D41727261793A205B5D2C0D0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(441) := '61706578506172616D733A2022222C0D0A2020202020202020202020207175657279537472696E673A2022220D0A2020202020202020207D3B0D0A2020202020202020202F2F6F626A2E74657874203D2073656C662E626173653634456E636F64652865';
wwv_flow_api.g_varchar2_table(442) := '2E7461726765742E726573756C74293B0D0A2020202020202020206F626A2E74657874203D20652E7461726765742E726573756C743B0D0A2020202020202020202F2F207765206E65656420746F207374726970206F666620746865206C656164696E67';
wwv_flow_api.g_varchar2_table(443) := '206D696D6520696E666F0D0A2020202020202020206F626A2E74657874203D206F626A2E746578742E7265706C616365282F5E2E2A6261736536342C2F2C202222293B0D0A20202020202020202073656C662E73706C6974537472696E67286F626A2C20';
wwv_flow_api.g_varchar2_table(444) := '34303030293B0D0A20202020202020202073656C662E617065784164644172726179286F626A2C2070466E756D626572293B0D0A2020202020202020206F626A2E7175657279537472696E67203D2071712E6F626A3275726C28706172616D732C207365';
wwv_flow_api.g_varchar2_table(445) := '6C662E5F6F7074696F6E732E616374696F6E293B0D0A2020202020202020207868722E6F70656E2822504F5354222C206F626A2E7175657279537472696E672C2074727565293B0D0A2020202020202020207868722E7365745265717565737448656164';
wwv_flow_api.g_varchar2_table(446) := '65722822436F6E74656E742D54797065222C20226170706C69636174696F6E2F782D7777772D666F726D2D75726C656E636F64656422293B0D0A2020202020202020207868722E73656E64286F626A2E61706578506172616D73293B0D0A202020202020';
wwv_flow_api.g_varchar2_table(447) := '2020206F626A203D207B7D3B0D0A2020202020207D3B0D0A2020202020202F2F7265616465722E72656164417342696E617279537472696E672866696C65293B0D0A2020202020207265616465722E7265616441734461746155524C2866696C65293B0D';
wwv_flow_api.g_varchar2_table(448) := '0A2020207D2C0D0A2020205F73656E644368756E6B3A2066756E6374696F6E28706172616D732C2066696C652C2070466E756D6265722C2078687229207B0D0A2020202020207661722073656C66203D20746869732C0D0A202020202020202020726561';
wwv_flow_api.g_varchar2_table(449) := '646572203D206E65772046696C6552656164657228292C0D0A2020202020202020206368756E6B53697A65203D2073656C662E5F6F7074696F6E732E6368756E6B53697A652C0D0A2020202020202020207374617274203D206368756E6B53697A65202A';
wwv_flow_api.g_varchar2_table(450) := '20287868722E5F6368756E6B4E756D626572202D2031292C0D0A202020202020202020656E64203D207374617274202B206368756E6B53697A652C0D0A20202020202020202066696C65436F6E74656E74203D2066696C652E736C696365287374617274';
wwv_flow_api.g_varchar2_table(451) := '2C20656E64292C0D0A2020202020202020206C656E677468203D2066696C65436F6E74656E742E73697A653B0D0A0D0A2020202020207265616465722E6F6E6C6F6164203D2066756E6374696F6E286529207B0D0A202020202020202020766172206F62';
wwv_flow_api.g_varchar2_table(452) := '6A203D207B0D0A202020202020202020202020746578743A2022222C0D0A20202020202020202020202061706578506172616D41727261793A205B5D2C0D0A20202020202020202020202061706578506172616D733A2022222C0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(453) := '202020207175657279537472696E673A2022220D0A2020202020202020207D3B0D0A2020202020202020206F626A2E74657874203D20652E7461726765742E726573756C743B0D0A0D0A202020202020202020706172616D735B27783034275D203D2078';
wwv_flow_api.g_varchar2_table(454) := '68722E5F6368756E6B4E756D6265723B0D0A202020202020202020706172616D735B27783035275D203D207868722E5F6368756E6B546F74616C3B0D0A0D0A2020202020202020202F2F207765206E65656420746F207374726970206F66662074686520';
wwv_flow_api.g_varchar2_table(455) := '6C656164696E67206D696D6520696E666F0D0A2020202020202020206F626A2E74657874203D206F626A2E746578742E7265706C616365282F5E2E2A6261736536342C2F2C202222293B0D0A20202020202020202073656C662E73706C6974537472696E';
wwv_flow_api.g_varchar2_table(456) := '67286F626A2C2034303030293B0D0A20202020202020202073656C662E617065784164644172726179286F626A2C2070466E756D626572293B0D0A2020202020202020206F626A2E7175657279537472696E67203D2071712E6F626A3275726C28706172';
wwv_flow_api.g_varchar2_table(457) := '616D732C2073656C662E5F6F7074696F6E732E616374696F6E293B0D0A2020202020202020207868722E6F70656E2822504F5354222C206F626A2E7175657279537472696E672C2074727565293B0D0A2020202020202020207868722E73657452657175';
wwv_flow_api.g_varchar2_table(458) := '6573744865616465722822436F6E74656E742D54797065222C20226170706C69636174696F6E2F782D7777772D666F726D2D75726C656E636F64656422293B0D0A2020202020202020207868722E73656E64286F626A2E61706578506172616D73293B0D';
wwv_flow_api.g_varchar2_table(459) := '0A2020202020202020206F626A203D207B7D3B0D0A2020202020207D3B0D0A0D0A2020202020202F2F20726561642074686520736C696365206F66207468652066696C650D0A2020202020207265616465722E7265616441734461746155524C2866696C';
wwv_flow_api.g_varchar2_table(460) := '65436F6E74656E74293B0D0A2020207D2C0D0A2020202F2A0D0A202020202A2053656E6473207468652066696C65206964656E74696669656420627920696420616E64206164646974696F6E616C20717565727920706172616D7320746F207468652073';
wwv_flow_api.g_varchar2_table(461) := '65727665720D0A202020202A2040706172616D207B4F626A6563747D20706172616D73206E616D652D76616C756520737472696E672070616972730D0A202020202A2F0D0A2020205F75706C6F61644368756E6B656446696C653A2066756E6374696F6E';
wwv_flow_api.g_varchar2_table(462) := '2869642C20706172616D7329207B0D0A2020202020207661722073656C66203D20746869732C0D0A20202020202020202066696C65203D20746869732E5F66696C65735B69645D2C0D0A2020202020202020206E616D65203D20746869732E6765744E61';
wwv_flow_api.g_varchar2_table(463) := '6D65286964292C0D0A20202020202020202073697A65203D20746869732E67657453697A65286964292C0D0A20202020202020202074797065203D20746869732E67657454797065286964293B0D0A0D0A202020202020746869732E5F6C6F616465645B';
wwv_flow_api.g_varchar2_table(464) := '69645D203D20303B0D0A0D0A20202020202076617220786872203D20746869732E5F786872735B69645D203D206E657720584D4C487474705265717565737428293B0D0A2020202020207661722073656C66203D20746869733B0D0A0D0A202020202020';
wwv_flow_api.g_varchar2_table(465) := '7868722E5F6368756E6B546F74616C203D204D6174682E6365696C2873697A65202F2073656C662E5F6F7074696F6E732E6368756E6B53697A65293B0D0A2020202020207868722E5F6368756E6B4E756D626572203D20313B0D0A0D0A20202020202078';
wwv_flow_api.g_varchar2_table(466) := '68722E75706C6F61642E6F6E70726F6772657373203D2066756E6374696F6E286529207B0D0A20202020202020202069662028652E6C656E677468436F6D70757461626C6529207B0D0A20202020202020202020202073656C662E5F6C6F616465645B69';
wwv_flow_api.g_varchar2_table(467) := '645D203D20652E6C6F616465643B0D0A20202020202020202020202073656C662E5F6F7074696F6E732E6F6E50726F67726573732869642C206E616D652C20652E6C6F616465642C20652E746F74616C2C207868722E5F6368756E6B4E756D6265722C20';
wwv_flow_api.g_varchar2_table(468) := '7868722E5F6368756E6B546F74616C293B0D0A2020202020202020207D0D0A2020202020207D3B0D0A0D0A2020202020207868722E6F6E726561647973746174656368616E6765203D2066756E6374696F6E2829207B0D0A202020202020202020696620';
wwv_flow_api.g_varchar2_table(469) := '287868722E72656164795374617465203D3D203429207B0D0A2020202020202020202020207868722E5F6368756E6B4E756D626572202B3D20313B0D0A202020202020202020202020696620287868722E5F6368756E6B4E756D626572203E207868722E';
wwv_flow_api.g_varchar2_table(470) := '5F6368756E6B546F74616C29207B0D0A20202020202020202020202020202073656C662E5F6F6E436F6D706C6574652869642C20786872293B0D0A2020202020202020202020207D20656C7365207B0D0A20202020202020202020202020202073656C66';
wwv_flow_api.g_varchar2_table(471) := '2E5F73656E644368756E6B28706172616D732C2066696C652C20312C20786872293B0D0A2020202020202020202020207D0D0A2020202020202020207D0D0A2020202020207D3B0D0A0D0A2020202020202F2F206275696C642071756572792073747269';
wwv_flow_api.g_varchar2_table(472) := '6E670D0A202020202020706172616D73203D20706172616D73207C7C207B7D3B0D0A202020202020706172616D735B27783031275D203D206E616D653B0D0A202020202020706172616D735B27783032275D203D2073697A653B0D0A2020202020207061';
wwv_flow_api.g_varchar2_table(473) := '72616D735B27783033275D203D20747970653B0D0A0D0A202020202020746869732E5F73656E644368756E6B28706172616D732C2066696C652C20312C20786872293B0D0A0D0A2020207D2C0D0A2020202F2A0D0A202020202A2053656E647320746865';
wwv_flow_api.g_varchar2_table(474) := '2066696C65206964656E74696669656420627920696420616E64206164646974696F6E616C20717565727920706172616D7320746F20746865207365727665720D0A202020202A2040706172616D207B4F626A6563747D20706172616D73206E616D652D';
wwv_flow_api.g_varchar2_table(475) := '76616C756520737472696E672070616972730D0A202020202A2F0D0A2020205F75706C6F6164456E7469726546696C653A2066756E6374696F6E2869642C20706172616D7329207B0D0A2020202020207661722066696C65203D20746869732E5F66696C';
wwv_flow_api.g_varchar2_table(476) := '65735B69645D2C0D0A2020202020202020206E616D65203D20746869732E6765744E616D65286964292C0D0A20202020202020202073697A65203D20746869732E67657453697A65286964292C0D0A20202020202020202074797065203D20746869732E';
wwv_flow_api.g_varchar2_table(477) := '67657454797065286964293B0D0A0D0A202020202020746869732E5F6C6F616465645B69645D203D20303B0D0A0D0A20202020202076617220786872203D20746869732E5F786872735B69645D203D206E657720584D4C48747470526571756573742829';
wwv_flow_api.g_varchar2_table(478) := '3B0D0A2020202020207661722073656C66203D20746869733B0D0A0D0A2020202020207868722E75706C6F61642E6F6E70726F6772657373203D2066756E6374696F6E286529207B0D0A20202020202020202069662028652E6C656E677468436F6D7075';
wwv_flow_api.g_varchar2_table(479) := '7461626C6529207B0D0A20202020202020202020202073656C662E5F6C6F616465645B69645D203D20652E6C6F616465643B0D0A20202020202020202020202073656C662E5F6F7074696F6E732E6F6E50726F67726573732869642C206E616D652C2065';
wwv_flow_api.g_varchar2_table(480) := '2E6C6F616465642C20652E746F74616C293B0D0A2020202020202020207D0D0A2020202020207D3B0D0A0D0A2020202020207868722E6F6E726561647973746174656368616E6765203D2066756E6374696F6E2829207B0D0A2020202020202020206966';
wwv_flow_api.g_varchar2_table(481) := '20287868722E72656164795374617465203D3D203429207B0D0A20202020202020202020202073656C662E5F6F6E436F6D706C6574652869642C20786872293B0D0A2020202020202020207D0D0A2020202020207D3B0D0A0D0A2020202020202F2F2062';
wwv_flow_api.g_varchar2_table(482) := '75696C6420717565727920737472696E670D0A202020202020706172616D73203D20706172616D73207C7C207B7D3B0D0A202020202020706172616D735B27783031275D203D206E616D653B0D0A202020202020706172616D735B27783032275D203D20';
wwv_flow_api.g_varchar2_table(483) := '73697A653B0D0A202020202020706172616D735B27783033275D203D20747970653B0D0A0D0A202020202020746869732E61706578416464417272617946696C6528706172616D732C2066696C652C20312C20786872293B0D0A0D0A2020207D2C0D0A20';
wwv_flow_api.g_varchar2_table(484) := '20202F2A0D0A202020202A2053656E6473207468652066696C65206964656E74696669656420627920696420616E64206164646974696F6E616C20717565727920706172616D7320746F20746865207365727665720D0A202020202A2040706172616D20';
wwv_flow_api.g_varchar2_table(485) := '7B4F626A6563747D20706172616D73206E616D652D76616C756520737472696E672070616972730D0A202020202A2F0D0A2020205F75706C6F61643A2066756E6374696F6E2869642C20706172616D7329207B0D0A2020202020207661722073656C6620';
wwv_flow_api.g_varchar2_table(486) := '3D20746869732C0D0A20202020202020202073697A65203D20746869732E67657453697A65286964293B0D0A0D0A2020202020202F2F20636865636B206966207765206E65656420746F20706572666F726D2061206368756E6B65642075706C6F61640D';
wwv_flow_api.g_varchar2_table(487) := '0A2020202020206966202873697A65203C3D2073656C662E5F6F7074696F6E732E6368756E6B53697A6529207B0D0A202020202020202020746869732E5F75706C6F6164456E7469726546696C652869642C20706172616D73293B0D0A2020202020207D';
wwv_flow_api.g_varchar2_table(488) := '20656C7365207B0D0A202020202020202020746869732E5F75706C6F61644368756E6B656446696C652869642C20706172616D73293B0D0A2020202020207D0D0A0D0A2020207D2C0D0A2020205F6F6E436F6D706C6574653A2066756E6374696F6E2869';
wwv_flow_api.g_varchar2_table(489) := '642C2078687229207B0D0A2020202020202F2F207468652072657175657374207761732061626F727465642F63616E63656C6C65640D0A2020202020206966202821746869732E5F66696C65735B69645D292072657475726E3B0D0A0D0A202020202020';
wwv_flow_api.g_varchar2_table(490) := '766172206E616D65203D20746869732E6765744E616D65286964293B0D0A2020202020207661722073697A65203D20746869732E67657453697A65286964293B0D0A0D0A202020202020746869732E5F6F7074696F6E732E6F6E50726F67726573732869';
wwv_flow_api.g_varchar2_table(491) := '642C206E616D652C2073697A652C2073697A65293B0D0A0D0A202020202020696620287868722E737461747573203D3D2032303029207B0D0A202020202020202020746869732E6C6F672822786872202D2073657276657220726573706F6E7365207265';
wwv_flow_api.g_varchar2_table(492) := '63656976656422293B0D0A202020202020202020746869732E6C6F672822726573706F6E736554657874203D2022202B207868722E726573706F6E736554657874293B0D0A0D0A20202020202020202076617220726573706F6E73653B0D0A0D0A202020';
wwv_flow_api.g_varchar2_table(493) := '202020202020747279207B0D0A202020202020202020202020726573706F6E7365203D206576616C28222822202B207868722E726573706F6E736554657874202B20222922293B0D0A2020202020202020207D206361746368202865727229207B0D0A20';
wwv_flow_api.g_varchar2_table(494) := '2020202020202020202020726573706F6E7365203D207B7D3B0D0A2020202020202020207D0D0A0D0A202020202020202020746869732E5F6F7074696F6E732E6F6E436F6D706C6574652869642C206E616D652C20726573706F6E7365293B0D0A0D0A20';
wwv_flow_api.g_varchar2_table(495) := '20202020207D20656C7365207B0D0A202020202020202020746869732E5F6F7074696F6E732E6F6E436F6D706C6574652869642C206E616D652C207B7D293B0D0A2020202020207D0D0A0D0A202020202020746869732E5F66696C65735B69645D203D20';
wwv_flow_api.g_varchar2_table(496) := '6E756C6C3B0D0A202020202020746869732E5F786872735B69645D203D206E756C6C3B0D0A202020202020746869732E5F64657175657565286964293B0D0A2020207D2C0D0A2020205F63616E63656C3A2066756E6374696F6E28696429207B0D0A2020';
wwv_flow_api.g_varchar2_table(497) := '20202020746869732E5F6F7074696F6E732E6F6E43616E63656C2869642C20746869732E6765744E616D6528696429293B0D0A0D0A202020202020746869732E5F66696C65735B69645D203D206E756C6C3B0D0A0D0A2020202020206966202874686973';
wwv_flow_api.g_varchar2_table(498) := '2E5F786872735B69645D29207B0D0A202020202020202020746869732E5F786872735B69645D2E61626F727428293B0D0A202020202020202020746869732E5F786872735B69645D203D206E756C6C3B0D0A2020202020207D0D0A2020207D0D0A7D293B';
wwv_flow_api.g_varchar2_table(499) := '0D0A2F2A2A0D0A202A202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A202A206A517565727920637573746F6D66696C65';
wwv_flow_api.g_varchar2_table(500) := '696E70757420706C7567696E0D0A202A20417574686F723A2053636F7474204A65686C2C2073636F74744066696C616D656E7467726F75702E636F6D0D0A202A20436F707972696768742028632920323030392046696C616D656E742047726F75700D0A';
wwv_flow_api.g_varchar2_table(501) := '202A206C6963656E73656420756E646572204D4954202866696C616D656E7467726F75702E636F6D2F6578616D706C65732F6D69742D6C6963656E73652E747874290D0A202A202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(502) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A202A2F0D0A2866756E6374696F6E282429207B0D0A202020242E666E2E637573746F6D46696C65496E707574203D2066756E6374696F6E286F7074';
wwv_flow_api.g_varchar2_table(503) := '696F6E7329207B0D0A20202020202072657475726E20242874686973292E656163682866756E6374696F6E2829207B0D0A2020202020202020202F2F6170706C79206576656E747320616E64207374796C657320666F722066696C6520696E7075742065';
wwv_flow_api.g_varchar2_table(504) := '6C656D656E740D0A2020202020202020207661722066696C65496E707574203D20242874686973290D0A2020202020202020202020202E616464436C6173732827637573746F6D66696C652D696E7075742729202F2F61646420636C61737320666F7220';
wwv_flow_api.g_varchar2_table(505) := '4353530D0A2020202020202020202E6D6F7573656F7665722866756E6374696F6E2829207B0D0A20202020202020202020202075706C6F61642E616464436C6173732827637573746F6D66696C652D686F76657227293B0D0A2020202020202020207D29';
wwv_flow_api.g_varchar2_table(506) := '0D0A2020202020202020202020202E6D6F7573656F75742866756E6374696F6E2829207B0D0A20202020202020202020202020202075706C6F61642E72656D6F7665436C6173732827637573746F6D66696C652D686F76657227293B0D0A202020202020';
wwv_flow_api.g_varchar2_table(507) := '2020202020207D290D0A2020202020202020202020202E666F6375732866756E6374696F6E2829207B0D0A20202020202020202020202020202075706C6F61642E616464436C6173732827637573746F6D66696C652D666F63757327293B0D0A20202020';
wwv_flow_api.g_varchar2_table(508) := '202020202020202020202066696C65496E7075742E64617461282776616C272C2066696C65496E7075742E76616C2829293B0D0A2020202020202020202020207D290D0A2020202020202020202020202E626C75722866756E6374696F6E2829207B0D0A';
wwv_flow_api.g_varchar2_table(509) := '20202020202020202020202020202075706C6F61642E72656D6F7665436C6173732827637573746F6D66696C652D666F63757327293B0D0A202020202020202020202020202020242874686973292E747269676765722827636865636B4368616E676527';
wwv_flow_api.g_varchar2_table(510) := '293B0D0A2020202020202020202020207D290D0A2020202020202020202020202E62696E64282764697361626C65272C2066756E6374696F6E2829207B0D0A20202020202020202020202020202066696C65496E7075742E61747472282764697361626C';
wwv_flow_api.g_varchar2_table(511) := '6564272C2074727565293B0D0A20202020202020202020202020202075706C6F61642E616464436C6173732827637573746F6D66696C652D64697361626C656427293B0D0A2020202020202020202020207D290D0A2020202020202020202020202E6269';
wwv_flow_api.g_varchar2_table(512) := '6E642827656E61626C65272C2066756E6374696F6E2829207B0D0A20202020202020202020202020202066696C65496E7075742E72656D6F766541747472282764697361626C656427293B0D0A20202020202020202020202020202075706C6F61642E72';
wwv_flow_api.g_varchar2_table(513) := '656D6F7665436C6173732827637573746F6D66696C652D64697361626C656427293B0D0A2020202020202020202020207D293B0D0A202020202020202020696620282428222322202B206F7074696F6E732E6964202B2022202E637573746F6D66696C65';
wwv_flow_api.g_varchar2_table(514) := '22292E6C656E677468203E203029207B0D0A2020202020202020202020202F2F63726561746520637573746F6D20636F6E74726F6C20636F6E7461696E65720D0A2020202020202020202020207661722075706C6F6164203D202428222322202B206F70';
wwv_flow_api.g_varchar2_table(515) := '74696F6E732E6964202B2022202E637573746F6D66696C6522293B0D0A2020202020202020202020202F2F63726561746520637573746F6D20636F6E74726F6C20627574746F6E0D0A2020202020202020202020207661722075706C6F6164427574746F';
wwv_flow_api.g_varchar2_table(516) := '6E203D202428222322202B206F7074696F6E732E6964202B2022202E637573746F6D66696C652D627574746F6E22293B0D0A2020202020202020202020202F2F63726561746520637573746F6D20636F6E74726F6C20666565646261636B0D0A20202020';
wwv_flow_api.g_varchar2_table(517) := '20202020202020207661722075706C6F6164466565646261636B203D202428222322202B206F7074696F6E732E6964202B2022202E637573746F6D66696C652D666565646261636B22293B0D0A2020202020202020207D20656C7365207B0D0A20202020';
wwv_flow_api.g_varchar2_table(518) := '20202020202020202F2F63726561746520637573746F6D20636F6E74726F6C20636F6E7461696E65720D0A2020202020202020202020207661722075706C6F6164203D202428273C64697620636C6173733D22637573746F6D66696C65223E3C2F646976';
wwv_flow_api.g_varchar2_table(519) := '3E27293B0D0A2020202020202020202020202F2F63726561746520637573746F6D20636F6E74726F6C20627574746F6E0D0A2020202020202020202020207661722075706C6F6164427574746F6E203D202428273C7370616E20636C6173733D22637573';
wwv_flow_api.g_varchar2_table(520) := '746F6D66696C652D627574746F6E2220617269612D68696464656E3D2274727565223E27202B206F7074696F6E732E62726F77736542746E4C6162656C202B20273C2F7370616E3E27292E617070656E64546F2875706C6F6164293B0D0A202020202020';
wwv_flow_api.g_varchar2_table(521) := '2020202020202F2F63726561746520637573746F6D20636F6E74726F6C20666565646261636B0D0A2020202020202020202020207661722075706C6F6164466565646261636B203D202428273C7370616E20636C6173733D22637573746F6D66696C652D';
wwv_flow_api.g_varchar2_table(522) := '666565646261636B2220617269612D68696464656E3D2274727565223E27202B206F7074696F6E732E6E6F66696C654C6162656C202B20273C2F7370616E3E27292E617070656E64546F2875706C6F6164293B0D0A2020202020202020207D0D0A0D0A20';
wwv_flow_api.g_varchar2_table(523) := '20202020202020202F2F6D617463682064697361626C65642073746174650D0A2020202020202020206966202866696C65496E7075742E697328275B64697361626C65645D272929207B0D0A20202020202020202020202066696C65496E7075742E7472';
wwv_flow_api.g_varchar2_table(524) := '6967676572282764697361626C6527293B0D0A2020202020202020207D0D0A2020202020202020202F2F2052656D6F7665642074686520746F702073657474696E67206173206974207761732063617573696E6720612070726F626C656D207769746820';
wwv_flow_api.g_varchar2_table(525) := '7468652066696C6520696E707574206D6F76696E672075702074686520646F6375656D6E74206F6E207363726F6C6C0D0A20202020202020202075706C6F61640D0A2020202020202020202020202E6D6F7573656D6F76652866756E6374696F6E286529';
wwv_flow_api.g_varchar2_table(526) := '207B0D0A20202020202020202020202020202066696C65496E7075742E637373287B0D0A202020202020202020202020202020202020276C656674273A20652E7061676558202D2075706C6F61642E6F666673657428292E6C656674202D2066696C6549';
wwv_flow_api.g_varchar2_table(527) := '6E7075742E6F7574657257696474682829202B203230202F2F706F736974696F6E20726967687420736964652032307078207269676874206F6620637572736F722058290D0A2020202020202020202020202020207D293B0D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(528) := '20207D290D0A2020202020202020202020202E696E7365727441667465722866696C65496E707574293B202F2F696E736572742061667465722074686520696E7075740D0A0D0A20202020202020202066696C65496E7075742E617070656E64546F2875';
wwv_flow_api.g_varchar2_table(529) := '706C6F6164293B0D0A0D0A2020202020207D293B0D0A2020207D0D0A7D2928617065782E6A5175657279293B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3766066817446922636 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'fileuploader.js'
 ,p_mime_type => 'text/javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0A202A20436F7079726967687428632920323031362C204150455820467265656C616E6365720A202A204C6963656E736520496E666F3A20687474703A2F2F7777772E74686561706578667265656C616E6365722E636F6D2F617065782F663F703D';
wwv_flow_api.g_varchar2_table(2) := '41504558465245454C414E4345523A46494C455F55504C4F41440A202A0A202A2F0A7661722071713D71717C7C7B7D3B71712E657874656E643D66756E6374696F6E28622C61297B666F7228766172206320696E2061297B625B635D3D615B635D7D7D3B';
wwv_flow_api.g_varchar2_table(3) := '71712E696E6465784F663D66756E6374696F6E28622C632C64297B696628622E696E6465784F66297B72657475726E20622E696E6465784F6628632C64297D643D647C7C303B76617220613D622E6C656E6774683B696628643C30297B642B3D617D666F';
wwv_flow_api.g_varchar2_table(4) := '72283B643C613B642B2B297B6966286420696E20622626625B645D3D3D3D63297B72657475726E20647D7D72657475726E202D317D3B71712E676574556E6971756549643D2866756E6374696F6E28297B76617220613D303B72657475726E2066756E63';
wwv_flow_api.g_varchar2_table(5) := '74696F6E28297B72657475726E20612B2B7D7D2928293B71712E6174746163683D66756E6374696F6E28612C632C62297B696628612E6164644576656E744C697374656E6572297B612E6164644576656E744C697374656E657228632C622C66616C7365';
wwv_flow_api.g_varchar2_table(6) := '297D656C73657B696628612E6174746163684576656E74297B612E6174746163684576656E7428226F6E222B632C62297D7D7D3B71712E6465746163683D66756E6374696F6E28612C632C62297B696628612E72656D6F76654576656E744C697374656E';
wwv_flow_api.g_varchar2_table(7) := '6572297B612E72656D6F76654576656E744C697374656E657228632C622C66616C7365297D656C73657B696628612E6174746163684576656E74297B612E6465746163684576656E7428226F6E222B632C62297D7D7D3B71712E70726576656E74446566';
wwv_flow_api.g_varchar2_table(8) := '61756C743D66756E6374696F6E2861297B696628612E70726576656E7444656661756C74297B612E70726576656E7444656661756C7428297D656C73657B612E72657475726E56616C75653D66616C73657D7D3B71712E696E736572744265666F72653D';
wwv_flow_api.g_varchar2_table(9) := '66756E6374696F6E28642C63297B632E706172656E744E6F64652E696E736572744265666F726528642C63297D3B71712E72656D6F76653D66756E6374696F6E2861297B612E706172656E744E6F64652E72656D6F76654368696C642861297D3B71712E';
wwv_flow_api.g_varchar2_table(10) := '636F6E7461696E733D66756E6374696F6E28622C61297B696628623D3D61297B72657475726E20747275657D696628622E636F6E7461696E73297B72657475726E20622E636F6E7461696E732861297D656C73657B72657475726E20212128612E636F6D';
wwv_flow_api.g_varchar2_table(11) := '70617265446F63756D656E74506F736974696F6E2862292638297D7D3B71712E746F456C656D656E743D2866756E6374696F6E28297B76617220613D646F63756D656E742E637265617465456C656D656E74282264697622293B72657475726E2066756E';
wwv_flow_api.g_varchar2_table(12) := '6374696F6E2863297B612E696E6E657248544D4C3D633B76617220623D612E66697273744368696C643B612E72656D6F76654368696C642862293B72657475726E20627D7D2928293B71712E6373733D66756E6374696F6E28612C62297B696628622E6F';
wwv_flow_api.g_varchar2_table(13) := '706163697479213D6E756C6C297B696628747970656F6620612E7374796C652E6F706163697479213D22737472696E67222626747970656F6628612E66696C7465727329213D22756E646566696E656422297B622E66696C7465723D22616C706861286F';
wwv_flow_api.g_varchar2_table(14) := '7061636974793D222B4D6174682E726F756E64283130302A622E6F706163697479292B2229227D7D71712E657874656E6428612E7374796C652C62297D3B71712E686173436C6173733D66756E6374696F6E28622C61297B76617220633D6E6577205265';
wwv_flow_api.g_varchar2_table(15) := '674578702822285E7C2029222B612B2228207C242922293B72657475726E20632E7465737428622E636C6173734E616D65297D3B71712E616464436C6173733D66756E6374696F6E28622C61297B6966282171712E686173436C61737328622C6129297B';
wwv_flow_api.g_varchar2_table(16) := '622E636C6173734E616D652B3D2220222B617D7D3B71712E72656D6F7665436C6173733D66756E6374696F6E28622C61297B76617220633D6E6577205265674578702822285E7C2029222B612B2228207C242922293B622E636C6173734E616D653D622E';
wwv_flow_api.g_varchar2_table(17) := '636C6173734E616D652E7265706C61636528632C222022292E7265706C616365282F5E5C732B7C5C732B242F672C2222297D3B71712E736574546578743D66756E6374696F6E28612C62297B612E696E6E6572546578743D623B612E74657874436F6E74';
wwv_flow_api.g_varchar2_table(18) := '656E743D627D3B71712E6368696C6472656E3D66756E6374696F6E2862297B76617220613D5B5D2C633D622E66697273744368696C643B7768696C652863297B696628632E6E6F6465547970653D3D31297B612E707573682863297D633D632E6E657874';
wwv_flow_api.g_varchar2_table(19) := '5369626C696E677D72657475726E20617D3B71712E6765744279436C6173733D66756E6374696F6E28642C65297B696628642E717565727953656C6563746F72416C6C297B72657475726E20642E717565727953656C6563746F72416C6C28222E222B65';
wwv_flow_api.g_varchar2_table(20) := '297D76617220623D5B5D3B76617220663D642E676574456C656D656E747342795461674E616D6528222A22293B76617220613D662E6C656E6774683B666F722876617220633D303B633C613B632B2B297B69662871712E686173436C61737328665B635D';
wwv_flow_api.g_varchar2_table(21) := '2C6529297B622E7075736828665B635D297D7D72657475726E20627D3B71712E6F626A3275726C3D66756E6374696F6E28662C622C68297B76617220673D5B5D2C643D2226222C653D66756E6374696F6E286B2C6A297B766172206C3D623F282F5C5B5C';
wwv_flow_api.g_varchar2_table(22) := '5D242F2E74657374286229293F623A622B225B222B6A2B225D223A6A3B696628286C213D22756E646566696E656422292626286A213D22756E646566696E65642229297B672E707573682828747970656F66206B3D3D3D226F626A65637422293F71712E';
wwv_flow_api.g_varchar2_table(23) := '6F626A3275726C286B2C6C2C74727565293A284F626A6563742E70726F746F747970652E746F537472696E672E63616C6C286B293D3D3D225B6F626A6563742046756E6374696F6E5D22293F656E636F6465555249436F6D706F6E656E74286C292B223D';
wwv_flow_api.g_varchar2_table(24) := '222B656E636F6465555249436F6D706F6E656E74286B2829293A656E636F6465555249436F6D706F6E656E74286C292B223D222B656E636F6465555249436F6D706F6E656E74286B29297D7D3B6966282168262662297B643D282F5C3F2F2E7465737428';
wwv_flow_api.g_varchar2_table(25) := '6229293F282F5C3F242F2E74657374286229293F22223A2226223A223F223B672E707573682862293B672E707573682871712E6F626A3275726C286629297D656C73657B696628284F626A6563742E70726F746F747970652E746F537472696E672E6361';
wwv_flow_api.g_varchar2_table(26) := '6C6C2866293D3D3D225B6F626A6563742041727261795D2229262628747970656F662066213D22756E646566696E65642229297B666F722876617220633D302C613D662E6C656E6774683B633C613B2B2B63297B6528665B635D2C63297D7D656C73657B';
wwv_flow_api.g_varchar2_table(27) := '69662828747970656F662066213D22756E646566696E6564222926262866213D3D6E756C6C29262628747970656F6620663D3D3D226F626A6563742229297B666F7228766172206320696E2066297B6528665B635D2C63297D7D656C73657B672E707573';
wwv_flow_api.g_varchar2_table(28) := '6828656E636F6465555249436F6D706F6E656E742862292B223D222B656E636F6465555249436F6D706F6E656E74286629297D7D7D72657475726E20672E6A6F696E2864292E7265706C616365282F5E262F2C2222292E7265706C616365282F2532302F';
wwv_flow_api.g_varchar2_table(29) := '672C222B22297D3B7661722071713D71717C7C7B7D3B71712E46696C6555706C6F6164657242617369633D66756E6374696F6E2861297B746869732E5F6F7074696F6E733D7B69643A22717175706C6F61646572222C64656275673A66616C73652C6163';
wwv_flow_api.g_varchar2_table(30) := '74696F6E3A222F7365727665722F75706C6F6164222C706172616D733A7B7D2C627574746F6E3A6E756C6C2C6D756C7469706C653A747275652C6D6178436F6E6E656374696F6E733A332C6368756E6B53697A653A313034383537362C616C6C6F776564';
wwv_flow_api.g_varchar2_table(31) := '457874656E73696F6E733A5B5D2C73697A654C696D69743A302C6D696E53697A654C696D69743A302C6F6E5375626D69743A66756E6374696F6E28632C62297B7D2C6F6E50726F67726573733A66756E6374696F6E28652C642C622C63297B7D2C6F6E43';
wwv_flow_api.g_varchar2_table(32) := '6F6D706C6574653A66756E6374696F6E28642C632C62297B7D2C6F6E43616E63656C3A66756E6374696F6E28632C62297B7D2C7472616E736C6174696F6E4C6162656C733A7B7D2C6D657373616765733A7B747970654572726F723A227B66696C657D20';
wwv_flow_api.g_varchar2_table(33) := '68617320696E76616C696420657874656E73696F6E2E204F6E6C79207B657874656E73696F6E737D2061726520616C6C6F7765642E222C73697A654572726F723A227B66696C657D20697320746F6F206C617267652C206D6178696D756D2066696C6520';
wwv_flow_api.g_varchar2_table(34) := '73697A65206973207B73697A654C696D69747D2E222C6D696E53697A654572726F723A227B66696C657D20697320746F6F20736D616C6C2C206D696E696D756D2066696C652073697A65206973207B6D696E53697A654C696D69747D2E222C656D707479';
wwv_flow_api.g_varchar2_table(35) := '4572726F723A227B66696C657D20697320656D7074792C20706C656173652073656C6563742066696C657320616761696E20776974686F75742069742E222C6F6E4C656176653A225468652066696C657320617265206265696E672075706C6F61646564';
wwv_flow_api.g_varchar2_table(36) := '2C20696620796F75206C65617665206E6F77207468652075706C6F61642077696C6C2062652063616E63656C6C65642E222C7069656365733A227069656365207B6368756E6B4E756D6265727D206F66207B6368756E6B546F74616C7D227D2C75706C6F';
wwv_flow_api.g_varchar2_table(37) := '6164656446696C65733A22222C73686F774D6573736167653A66756E6374696F6E2862297B616C6572742862297D7D3B71712E657874656E6428746869732E5F6F7074696F6E732C61293B746869732E5F66696C6573496E50726F67726573733D303B74';
wwv_flow_api.g_varchar2_table(38) := '6869732E5F66696C6555706C6F61644572726F72436F756E743D303B746869732E5F66696C6555706C6F61644572726F72733D5B5D3B746869732E5F68616E646C65723D746869732E5F63726561746555706C6F616448616E646C657228293B69662874';
wwv_flow_api.g_varchar2_table(39) := '6869732E5F6F7074696F6E732E627574746F6E297B746869732E5F627574746F6E3D746869732E5F63726561746555706C6F6164427574746F6E28746869732E5F6F7074696F6E732E627574746F6E297D746869732E5F70726576656E744C6561766549';
wwv_flow_api.g_varchar2_table(40) := '6E50726F677265737328297D3B71712E46696C6555706C6F6164657242617369632E70726F746F747970653D7B736574506172616D733A66756E6374696F6E2861297B746869732E5F6F7074696F6E732E706172616D733D617D2C676574496E50726F67';
wwv_flow_api.g_varchar2_table(41) := '726573733A66756E6374696F6E28297B72657475726E20746869732E5F66696C6573496E50726F67726573737D2C5F63726561746555706C6F6164427574746F6E3A66756E6374696F6E2862297B76617220613D746869733B72657475726E206E657720';
wwv_flow_api.g_varchar2_table(42) := '71712E55706C6F6164427574746F6E287B69643A746869732E5F6F7074696F6E732E69642C62726F77736542746E4C6162656C3A746869732E5F6F7074696F6E732E7472616E736C6174696F6E4C6162656C732E62726F77736542746E4C6162656C2C6E';
wwv_flow_api.g_varchar2_table(43) := '6F66696C654C6162656C3A746869732E5F6F7074696F6E732E7472616E736C6174696F6E4C6162656C732E6E6F66696C654C6162656C2C656C656D656E743A622C6D756C7469706C653A746869732E5F6F7074696F6E732E6D756C7469706C6526267171';
wwv_flow_api.g_varchar2_table(44) := '2E55706C6F616448616E646C65725868722E6973537570706F7274656428292626212121746869732E5F6F7074696F6E732E666F726365496672616D6555706C6F61642C6F6E4368616E67653A66756E6374696F6E2863297B612E5F6F6E496E70757443';
wwv_flow_api.g_varchar2_table(45) := '68616E67652863297D7D297D2C5F63726561746555706C6F616448616E646C65723A66756E6374696F6E28297B76617220613D746869732C633B69662871712E55706C6F616448616E646C65725868722E6973537570706F727465642829262621212174';
wwv_flow_api.g_varchar2_table(46) := '6869732E5F6F7074696F6E732E666F726365496672616D6555706C6F6164297B633D2255706C6F616448616E646C6572586872227D656C73657B633D2255706C6F616448616E646C6572466F726D227D76617220623D6E65772071715B635D287B696672';
wwv_flow_api.g_varchar2_table(47) := '616D65466F726D3A746869732E5F6F7074696F6E732E696672616D65466F726D2C696672616D65506167653A746869732E5F6F7074696F6E732E696672616D65506167652C64656275673A746869732E5F6F7074696F6E732E64656275672C616374696F';
wwv_flow_api.g_varchar2_table(48) := '6E3A746869732E5F6F7074696F6E732E616374696F6E2C6D6178436F6E6E656374696F6E733A746869732E5F6F7074696F6E732E6D6178436F6E6E656374696F6E732C6368756E6B53697A653A746869732E5F6F7074696F6E732E6368756E6B53697A65';
wwv_flow_api.g_varchar2_table(49) := '2C6F6E50726F67726573733A66756E6374696F6E28692C682C642C662C652C67297B612E5F6F6E50726F677265737328692C682C642C662C652C67293B612E5F6F7074696F6E732E6F6E50726F677265737328692C682C642C662C652C67297D2C6F6E43';
wwv_flow_api.g_varchar2_table(50) := '6F6D706C6574653A66756E6374696F6E28662C652C64297B612E5F6F6E436F6D706C65746528662C652C64293B612E5F6F7074696F6E732E6F6E436F6D706C65746528662C652C64297D2C6F6E43616E63656C3A66756E6374696F6E28652C64297B612E';
wwv_flow_api.g_varchar2_table(51) := '5F6F6E43616E63656C28652C64293B612E5F6F7074696F6E732E6F6E43616E63656C28652C64297D7D293B72657475726E20627D2C5F70726576656E744C65617665496E50726F67726573733A66756E6374696F6E28297B76617220613D746869733B71';
wwv_flow_api.g_varchar2_table(52) := '712E6174746163682877696E646F772C226265666F7265756E6C6F6164222C66756E6374696F6E2862297B69662821612E5F66696C6573496E50726F6772657373297B72657475726E7D76617220623D627C7C77696E646F772E6576656E743B622E7265';
wwv_flow_api.g_varchar2_table(53) := '7475726E56616C75653D612E5F6F7074696F6E732E6D657373616765732E6F6E4C656176653B72657475726E20612E5F6F7074696F6E732E6D657373616765732E6F6E4C656176657D297D2C5F6F6E5375626D69743A66756E6374696F6E28622C61297B';
wwv_flow_api.g_varchar2_table(54) := '746869732E5F66696C6573496E50726F67726573732B2B7D2C5F6F6E50726F67726573733A66756E6374696F6E28642C632C612C62297B7D2C5F6F6E436F6D706C6574653A66756E6374696F6E28632C622C61297B746869732E5F66696C6573496E5072';
wwv_flow_api.g_varchar2_table(55) := '6F67726573732D2D3B696628612E6572726F72297B746869732E5F6F7074696F6E732E73686F774D65737361676528612E6572726F72297D7D2C5F6F6E43616E63656C3A66756E6374696F6E28622C61297B746869732E5F66696C6573496E50726F6772';
wwv_flow_api.g_varchar2_table(56) := '6573732D2D7D2C5F6F6E496E7075744368616E67653A66756E6374696F6E2862297B76617220613D746869733B696628746869732E5F68616E646C657220696E7374616E63656F662071712E55706C6F616448616E646C6572586872297B746869732E5F';
wwv_flow_api.g_varchar2_table(57) := '75706C6F616446696C654C69737428622E66696C6573297D656C73657B696628746869732E5F76616C696461746546696C65286229297B24282223222B746869732E5F6F7074696F6E732E6964292E7472696767657228226265666F726573746172742E';
wwv_flow_api.g_varchar2_table(58) := '434F4D5F41465F504C5547494E5F4A515F46494C4555504C4F4144222C5B7B7769646765743A612C66696C65733A5B625D7D5D293B746869732E5F75706C6F616446696C652862297D7D746869732E5F627574746F6E2E726573657428297D2C5F75706C';
wwv_flow_api.g_varchar2_table(59) := '6F616446696C654C6973743A66756E6374696F6E2864297B76617220613D746869732C623D5B5D3B666F722876617220633D303B633C642E6C656E6774683B632B2B297B622E7075736828645B635D293B69662821746869732E5F76616C696461746546';
wwv_flow_api.g_varchar2_table(60) := '696C6528645B635D29297B72657475726E7D7D24282223222B746869732E5F6F7074696F6E732E6964292E7472696767657228226265666F726573746172742E434F4D5F41465F504C5547494E5F4A515F46494C4555504C4F4144222C5B7B7769646765';
wwv_flow_api.g_varchar2_table(61) := '743A746869732C66696C65733A627D5D293B666F722876617220633D303B633C622E6C656E6774683B632B2B297B746869732E5F75706C6F616446696C6528625B635D297D7D2C5F75706C6F616446696C653A66756E6374696F6E2861297B7661722063';
wwv_flow_api.g_varchar2_table(62) := '3D746869732E5F68616E646C65722E6164642861293B76617220623D746869732E5F68616E646C65722E6765744E616D652863293B696628746869732E5F6F7074696F6E732E6F6E5375626D697428632C6229213D3D66616C7365297B746869732E5F6F';
wwv_flow_api.g_varchar2_table(63) := '6E5375626D697428632C62293B746869732E5F68616E646C65722E75706C6F616428632C746869732E5F6F7074696F6E732E706172616D73297D7D2C5F76616C696461746546696C653A66756E6374696F6E2863297B76617220612C623B696628632E76';
wwv_flow_api.g_varchar2_table(64) := '616C7565297B613D632E76616C75652E7265706C616365282F2E2A285C2F7C5C5C292F2C2222297D656C73657B613D632E66696C654E616D65213D6E756C6C3F632E66696C654E616D653A632E6E616D653B623D632E66696C6553697A65213D6E756C6C';
wwv_flow_api.g_varchar2_table(65) := '3F632E66696C6553697A653A632E73697A657D69662821746869732E5F6973416C6C6F776564457874656E73696F6E286129297B746869732E5F6572726F722822747970654572726F72222C61293B72657475726E2066616C73657D656C73657B696628';
wwv_flow_api.g_varchar2_table(66) := '623D3D3D30297B746869732E5F6572726F722822656D7074794572726F72222C61293B72657475726E2066616C73657D656C73657B696628622626746869732E5F6F7074696F6E732E73697A654C696D69742626623E746869732E5F6F7074696F6E732E';
wwv_flow_api.g_varchar2_table(67) := '73697A654C696D6974297B746869732E5F6572726F72282273697A654572726F72222C61293B72657475726E2066616C73657D656C73657B696628622626623C746869732E5F6F7074696F6E732E6D696E53697A654C696D6974297B746869732E5F6572';
wwv_flow_api.g_varchar2_table(68) := '726F7228226D696E53697A654572726F72222C61293B72657475726E2066616C73657D7D7D7D72657475726E20747275657D2C5F6572726F723A66756E6374696F6E28632C64297B76617220623D746869732E5F6F7074696F6E732E6D65737361676573';
wwv_flow_api.g_varchar2_table(69) := '5B635D3B66756E6374696F6E206128652C66297B623D622E7265706C61636528652C66297D6128227B66696C657D222C746869732E5F666F726D617446696C654E616D65286429293B6128227B657874656E73696F6E737D222C746869732E5F6F707469';
wwv_flow_api.g_varchar2_table(70) := '6F6E732E616C6C6F776564457874656E73696F6E732E6A6F696E28222C202229293B6128227B73697A654C696D69747D222C746869732E5F666F726D617453697A6528746869732E5F6F7074696F6E732E73697A654C696D697429293B6128227B6D696E';
wwv_flow_api.g_varchar2_table(71) := '53697A654C696D69747D222C746869732E5F666F726D617453697A6528746869732E5F6F7074696F6E732E6D696E53697A654C696D697429293B746869732E5F6F7074696F6E732E73686F774D6573736167652862297D2C5F666F726D617446696C654E';
wwv_flow_api.g_varchar2_table(72) := '616D653A66756E6374696F6E2861297B696628612E6C656E6774683E3333297B613D612E736C69636528302C3139292B222E2E2E222B612E736C696365282D3133297D72657475726E20617D2C5F6973416C6C6F776564457874656E73696F6E3A66756E';
wwv_flow_api.g_varchar2_table(73) := '6374696F6E2864297B76617220623D282D31213D3D642E696E6465784F6628222E2229293F642E7265706C616365282F2E2A5B2E5D2F2C2222292E746F4C6F7765724361736528293A22223B76617220633D746869732E5F6F7074696F6E732E616C6C6F';
wwv_flow_api.g_varchar2_table(74) := '776564457874656E73696F6E733B69662821632E6C656E677468297B72657475726E20747275657D666F722876617220613D303B613C632E6C656E6774683B612B2B297B696628635B615D2E746F4C6F7765724361736528293D3D62297B72657475726E';
wwv_flow_api.g_varchar2_table(75) := '20747275657D7D72657475726E2066616C73657D2C5F666F726D617453697A653A66756E6374696F6E2861297B76617220623D2D313B646F7B613D612F313032343B622B2B7D7768696C6528613E3939293B72657475726E204D6174682E6D617828612C';
wwv_flow_api.g_varchar2_table(76) := '302E31292E746F46697865642831292B5B226B42222C224D42222C224742222C225442222C225042222C224542225D5B625D7D2C5F756E656E636F64656453697A653A66756E6374696F6E2861297B72657475726E204D6174682E6365696C28612F3429';
wwv_flow_api.g_varchar2_table(77) := '2A337D7D3B71712E46696C6555706C6F616465723D66756E6374696F6E2861297B71712E46696C6555706C6F6164657242617369632E6170706C7928746869732C617267756D656E7473293B71712E657874656E6428746869732E5F6F7074696F6E732C';
wwv_flow_api.g_varchar2_table(78) := '7B656C656D656E743A6E756C6C2C6C697374456C656D656E743A6E756C6C2C74656D706C6174653A273C64697620636C6173733D2271712D75706C6F61646572223E3C64697620636C6173733D2271712D75706C6F61642D64726F702D61726561223E3C';
wwv_flow_api.g_varchar2_table(79) := '7370616E3E272B746869732E5F6F7074696F6E732E7472616E736C6174696F6E4C6162656C732E64726F70417265614D73672B273C2F7370616E3E3C2F6469763E3C64697620636C6173733D2271712D75706C6F61642D627574746F6E223E3C2F646976';
wwv_flow_api.g_varchar2_table(80) := '3E3C756C2069643D22272B746869732E5F6F7074696F6E732E69642B275F75706C6F6164732220636C6173733D2271712D75706C6F61642D6C69737422207374796C653D22646973706C61793A6E6F6E653B223E272B746869732E5F6F7074696F6E732E';
wwv_flow_api.g_varchar2_table(81) := '75706C6F6164656446696C65732B223C2F756C3E3C2F6469763E222C66696C6554656D706C6174653A273C6C693E3C7370616E20636C6173733D2271712D75706C6F61642D66696C65223E3C2F7370616E3E3C7370616E20636C6173733D2271712D7570';
wwv_flow_api.g_varchar2_table(82) := '6C6F61642D7370696E6E6572223E3C2F7370616E3E3C7370616E20636C6173733D2271712D75706C6F61642D73697A65223E3C2F7370616E3E3C6120636C6173733D2271712D75706C6F61642D63616E63656C2220687265663D2223223E43616E63656C';
wwv_flow_api.g_varchar2_table(83) := '3C2F613E3C7370616E20636C6173733D2271712D75706C6F61642D6661696C65642D74657874223E4661696C65643C2F7370616E3E3C2F6C693E272C636C61737365733A7B627574746F6E3A2271712D75706C6F61642D627574746F6E222C64726F703A';
wwv_flow_api.g_varchar2_table(84) := '2271712D75706C6F61642D64726F702D61726561222C64726F704163746976653A2271712D75706C6F61642D64726F702D617265612D616374697665222C6C6973743A2271712D75706C6F61642D6C697374222C66696C653A2271712D75706C6F61642D';
wwv_flow_api.g_varchar2_table(85) := '66696C65222C7370696E6E65723A2271712D75706C6F61642D7370696E6E6572222C73697A653A2271712D75706C6F61642D73697A65222C63616E63656C3A2271712D75706C6F61642D63616E63656C222C737563636573733A2271712D75706C6F6164';
wwv_flow_api.g_varchar2_table(86) := '2D73756363657373222C6661696C3A2271712D75706C6F61642D6661696C227D7D293B71712E657874656E6428746869732E5F6F7074696F6E732C61293B746869732E5F656C656D656E743D746869732E5F6F7074696F6E732E656C656D656E743B7468';
wwv_flow_api.g_varchar2_table(87) := '69732E5F656C656D656E742E696E6E657248544D4C3D746869732E5F6F7074696F6E732E74656D706C6174653B746869732E5F6C697374456C656D656E743D746869732E5F6F7074696F6E732E6C697374456C656D656E747C7C746869732E5F66696E64';
wwv_flow_api.g_varchar2_table(88) := '28746869732E5F656C656D656E742C226C69737422293B746869732E5F636C61737365733D746869732E5F6F7074696F6E732E636C61737365733B746869732E5F627574746F6E3D746869732E5F63726561746555706C6F6164427574746F6E28746869';
wwv_flow_api.g_varchar2_table(89) := '732E5F66696E6428746869732E5F656C656D656E742C22627574746F6E2229293B746869732E5F62696E6443616E63656C4576656E7428293B746869732E5F73657475704472616744726F7028297D3B71712E657874656E642871712E46696C6555706C';
wwv_flow_api.g_varchar2_table(90) := '6F616465722E70726F746F747970652C71712E46696C6555706C6F6164657242617369632E70726F746F74797065293B71712E657874656E642871712E46696C6555706C6F616465722E70726F746F747970652C7B5F66696E643A66756E6374696F6E28';
wwv_flow_api.g_varchar2_table(91) := '632C62297B76617220613D71712E6765744279436C61737328632C746869732E5F6F7074696F6E732E636C61737365735B625D295B305D3B6966282161297B7468726F77206E6577204572726F722822656C656D656E74206E6F7420666F756E6420222B';
wwv_flow_api.g_varchar2_table(92) := '62297D72657475726E20617D2C5F73657475704472616744726F703A66756E6374696F6E28297B76617220623D746869732C633D746869732E5F66696E6428746869732E5F656C656D656E742C2264726F7022293B632E7374796C652E77696474683D74';
wwv_flow_api.g_varchar2_table(93) := '6869732E5F6F7074696F6E732E77696474682B227078223B76617220613D6E65772071712E55706C6F616444726F705A6F6E65287B656C656D656E743A632C6F6E456E7465723A66756E6374696F6E2864297B71712E616464436C61737328632C622E5F';
wwv_flow_api.g_varchar2_table(94) := '636C61737365732E64726F70416374697665293B642E73746F7050726F7061676174696F6E28297D2C6F6E4C656176653A66756E6374696F6E2864297B642E73746F7050726F7061676174696F6E28297D2C6F6E4C656176654E6F7444657363656E6461';
wwv_flow_api.g_varchar2_table(95) := '6E74733A66756E6374696F6E2864297B71712E72656D6F7665436C61737328632C622E5F636C61737365732E64726F70416374697665297D2C6F6E44726F703A66756E6374696F6E2864297B632E7374796C652E646973706C61793D226E6F6E65223B71';
wwv_flow_api.g_varchar2_table(96) := '712E72656D6F7665436C61737328632C622E5F636C61737365732E64726F70416374697665293B622E5F75706C6F616446696C654C69737428642E646174615472616E736665722E66696C6573297D7D293B632E7374796C652E646973706C61793D226E';
wwv_flow_api.g_varchar2_table(97) := '6F6E65223B71712E61747461636828646F63756D656E742C2264726167656E746572222C66756E6374696F6E2864297B69662821612E5F697356616C696446696C6544726167286429297B72657475726E7D632E7374796C652E646973706C61793D2262';
wwv_flow_api.g_varchar2_table(98) := '6C6F636B227D293B71712E61747461636828646F63756D656E742C22647261676C65617665222C66756E6374696F6E2866297B69662821612E5F697356616C696446696C6544726167286629297B72657475726E7D76617220643D646F63756D656E742E';
wwv_flow_api.g_varchar2_table(99) := '656C656D656E7446726F6D506F696E7428662E636C69656E74582C662E636C69656E7459293B69662821647C7C642E6E6F64654E616D653D3D2248544D4C227C7C642E6E6F64654E616D653D3D22424F445922297B632E7374796C652E646973706C6179';
wwv_flow_api.g_varchar2_table(100) := '3D226E6F6E65227D7D297D2C5F6F6E5375626D69743A66756E6374696F6E28622C61297B746869732E5F66696C6555706C6F61644572726F72733D5B5D3B71712E46696C6555706C6F6164657242617369632E70726F746F747970652E5F6F6E5375626D';
wwv_flow_api.g_varchar2_table(101) := '69742E6170706C7928746869732C617267756D656E7473293B746869732E5F616464546F4C69737428622C61297D2C5F6F6E50726F67726573733A66756E6374696F6E28632C662C672C692C642C68297B76617220623D746869732E5F6F7074696F6E73';
wwv_flow_api.g_varchar2_table(102) := '2E6D657373616765732E7069656365732C653D28673D3D3D69293B66756E6374696F6E2061286D2C6E297B623D622E7265706C616365286D2C6E297D69662864262668297B673D746869732E5F756E656E636F64656453697A652867293B693D74686973';
wwv_flow_api.g_varchar2_table(103) := '2E5F756E656E636F64656453697A652869293B6128227B6368756E6B4E756D6265727D222C4D6174682E6D696E28647C7C312C687C7C3129293B6128227B6368756E6B546F74616C7D222C687C7C31293B622B3D222920222B746869732E5F666F726D61';
wwv_flow_api.g_varchar2_table(104) := '7453697A652828642D31292A746869732E5F6F7074696F6E732E6368756E6B53697A65297D656C73657B623D22227D71712E46696C6555706C6F6164657242617369632E70726F746F747970652E5F6F6E50726F67726573732E6170706C792874686973';
wwv_flow_api.g_varchar2_table(105) := '2C617267756D656E7473293B766172206B3D746869732E5F6765744974656D427946696C6549642863293B766172206C3D746869732E5F66696E64286B2C2273697A6522293B6C2E7374796C652E646973706C61793D22696E6C696E65223B766172206A';
wwv_flow_api.g_varchar2_table(106) := '3B6966282165297B6A3D2228222B4D6174682E726F756E6428672F692A313030292B22252066726F6D20222B746869732E5F666F726D617453697A652869292B2220222B627D656C73657B6A3D2862293F2228222B746869732E5F666F726D617453697A';
wwv_flow_api.g_varchar2_table(107) := '652869292B2220222B623A746869732E5F666F726D617453697A652869297D71712E73657454657874286C2C6A297D2C5F6F6E436F6D706C6574653A66756E6374696F6E28652C642C61297B71712E46696C6555706C6F6164657242617369632E70726F';
wwv_flow_api.g_varchar2_table(108) := '746F747970652E5F6F6E436F6D706C6574652E6170706C7928746869732C617267756D656E7473293B76617220623D746869732E5F6765744974656D427946696C6549642865292C633D617065782E6A5175657279282223222B746869732E5F6F707469';
wwv_flow_api.g_varchar2_table(109) := '6F6E732E69642B225F75706C6F61647322293B71712E72656D6F766528746869732E5F66696E6428622C2263616E63656C2229293B71712E72656D6F766528746869732E5F66696E6428622C227370696E6E65722229293B696628612E73756363657373';
wwv_flow_api.g_varchar2_table(110) := '297B71712E616464436C61737328622C746869732E5F636C61737365732E73756363657373293B617065782E6A517565727928746869732E5F66696E6428622C2266696C652229292E7772617028273C6120687265663D22272B612E6C696E6B2B272220';
wwv_flow_api.g_varchar2_table(111) := '2F3E27293B696628746869732E5F66696C6573496E50726F67726573733D3D3D302626746869732E5F6F7074696F6E732E686964654469616C6F674F6E436F6D706C657465297B632E6469616C6F672822636C6F736522297D7D656C73657B71712E6164';
wwv_flow_api.g_varchar2_table(112) := '64436C61737328622C746869732E5F636C61737365732E6661696C293B746869732E5F66696C6555706C6F61644572726F72436F756E742B2B3B746869732E5F66696C6555706C6F61644572726F72732E70757368287B69643A652C66696C654E616D65';
wwv_flow_api.g_varchar2_table(113) := '3A642C726573756C743A617D293B696628612E6D657373616765297B616C65727428612E6D657373616765297D617065782E6A5175657279282223222B746869732E5F6F7074696F6E732E6964292E7472696767657228226F6E6572726F722E434F4D5F';
wwv_flow_api.g_varchar2_table(114) := '41465F504C5547494E5F4A515F46494C4555504C4F4144222C5B7B7769646765743A746869732C6469616C6F673A632C69643A652C66696C654E616D653A642C726573756C743A617D5D297D696628746869732E5F66696C6573496E50726F6772657373';
wwv_flow_api.g_varchar2_table(115) := '3D3D3D30297B746869732E5F6F6E436F6D706C657465416C6C2863297D7D2C5F6F6E436F6D706C657465416C6C3A66756E6374696F6E2861297B617065782E6A5175657279282223222B746869732E5F6F7074696F6E732E6964292E7472696767657228';
wwv_flow_api.g_varchar2_table(116) := '226F6E636F6D706C657465616C6C2E434F4D5F41465F504C5547494E5F4A515F46494C4555504C4F4144222C5B7B7769646765743A746869732C6469616C6F673A617D5D293B696628746869732E5F66696C6573496E50726F67726573733D3D3D302626';
wwv_flow_api.g_varchar2_table(117) := '746869732E5F66696C6555706C6F61644572726F72436F756E743E30297B617065782E6A5175657279282223222B746869732E5F6F7074696F6E732E6964292E7472696767657228226F6E6572726F72616C6C2E434F4D5F41465F504C5547494E5F4A51';
wwv_flow_api.g_varchar2_table(118) := '5F46494C4555504C4F4144222C5B7B7769646765743A746869732C6469616C6F673A612C6572726F72733A746869732E5F66696C6555706C6F61644572726F72737D5D297D7D2C5F616464546F4C6973743A66756E6374696F6E28612C63297B76617220';
wwv_flow_api.g_varchar2_table(119) := '653D71712E746F456C656D656E7428746869732E5F6F7074696F6E732E66696C6554656D706C617465293B652E717146696C6549643D613B76617220623D746869732E5F66696E6428652C2266696C6522293B71712E7365745465787428622C74686973';
wwv_flow_api.g_varchar2_table(120) := '2E5F666F726D617446696C654E616D65286329293B746869732E5F66696E6428652C2273697A6522292E7374796C652E646973706C61793D226E6F6E65223B746869732E5F6C697374456C656D656E742E617070656E644368696C642865293B76617220';
wwv_flow_api.g_varchar2_table(121) := '683D746869732E5F6F7074696F6E732E69643B76617220693D617065782E6A5175657279282223222B682B22202E637573746F6D66696C6522293B76617220663D617065782E6A5175657279282223222B682B22202E637573746F6D66696C652D627574';
wwv_flow_api.g_varchar2_table(122) := '746F6E22293B76617220643D617065782E6A5175657279282223222B682B22202E637573746F6D66696C652D666565646261636B22293B76617220673D22637573746F6D66696C652D6578742D222B632E73706C697428222E22292E706F7028292E746F';
wwv_flow_api.g_varchar2_table(123) := '4C6F7765724361736528293B642E746578742863292E72656D6F7665436C61737328642E64617461282266696C6545787422297C7C2222292E616464436C6173732867292E64617461282266696C65457874222C67292E616464436C6173732822637573';
wwv_flow_api.g_varchar2_table(124) := '746F6D66696C652D666565646261636B2D706F70756C6174656422293B662E7465787428746869732E5F6F7074696F6E732E7472616E736C6174696F6E4C6162656C732E6D6F726542746E4C6162656C297D2C5F6765744974656D427946696C6549643A';
wwv_flow_api.g_varchar2_table(125) := '66756E6374696F6E2862297B76617220613D746869732E5F6C697374456C656D656E742E66697273744368696C643B7768696C652861297B696628612E717146696C6549643D3D62297B72657475726E20617D613D612E6E6578745369626C696E677D7D';
wwv_flow_api.g_varchar2_table(126) := '2C5F62696E6443616E63656C4576656E743A66756E6374696F6E28297B76617220613D746869732C623D746869732E5F6C697374456C656D656E743B71712E61747461636828622C22636C69636B222C66756E6374696F6E2866297B663D667C7C77696E';
wwv_flow_api.g_varchar2_table(127) := '646F772E6576656E743B76617220643D662E7461726765747C7C662E737263456C656D656E743B69662871712E686173436C61737328642C612E5F636C61737365732E63616E63656C29297B71712E70726576656E7444656661756C742866293B766172';
wwv_flow_api.g_varchar2_table(128) := '20633D642E706172656E744E6F64653B612E5F68616E646C65722E63616E63656C28632E717146696C654964293B71712E72656D6F76652863297D7D297D7D293B71712E55706C6F616444726F705A6F6E653D66756E6374696F6E2861297B746869732E';
wwv_flow_api.g_varchar2_table(129) := '5F6F7074696F6E733D7B656C656D656E743A6E756C6C2C6F6E456E7465723A66756E6374696F6E2862297B7D2C6F6E4C656176653A66756E6374696F6E2862297B7D2C6F6E4C656176654E6F7444657363656E64616E74733A66756E6374696F6E286229';
wwv_flow_api.g_varchar2_table(130) := '7B7D2C6F6E44726F703A66756E6374696F6E2862297B7D7D3B71712E657874656E6428746869732E5F6F7074696F6E732C61293B746869732E5F656C656D656E743D746869732E5F6F7074696F6E732E656C656D656E743B746869732E5F64697361626C';
wwv_flow_api.g_varchar2_table(131) := '6544726F704F75747369646528293B746869732E5F6174746163684576656E747328297D3B71712E55706C6F616444726F705A6F6E652E70726F746F747970653D7B5F64697361626C6544726F704F7574736964653A66756E6374696F6E2861297B6966';
wwv_flow_api.g_varchar2_table(132) := '282171712E55706C6F616444726F705A6F6E652E64726F704F75747369646544697361626C6564297B71712E61747461636828646F63756D656E742C22647261676F766572222C66756E6374696F6E2862297B696628622E646174615472616E73666572';
wwv_flow_api.g_varchar2_table(133) := '297B622E646174615472616E736665722E64726F704566666563743D226E6F6E65223B622E70726576656E7444656661756C7428297D7D293B71712E55706C6F616444726F705A6F6E652E64726F704F75747369646544697361626C65643D747275657D';
wwv_flow_api.g_varchar2_table(134) := '7D2C5F6174746163684576656E74733A66756E6374696F6E28297B76617220613D746869733B71712E61747461636828612E5F656C656D656E742C22647261676F766572222C66756E6374696F6E2863297B69662821612E5F697356616C696446696C65';
wwv_flow_api.g_varchar2_table(135) := '44726167286329297B72657475726E7D76617220623D632E646174615472616E736665722E656666656374416C6C6F7765643B696628623D3D226D6F7665227C7C623D3D226C696E6B4D6F766522297B632E646174615472616E736665722E64726F7045';
wwv_flow_api.g_varchar2_table(136) := '66666563743D226D6F7665227D656C73657B632E646174615472616E736665722E64726F704566666563743D22636F7079227D632E73746F7050726F7061676174696F6E28293B632E70726576656E7444656661756C7428297D293B71712E6174746163';
wwv_flow_api.g_varchar2_table(137) := '6828612E5F656C656D656E742C2264726167656E746572222C66756E6374696F6E2862297B69662821612E5F697356616C696446696C6544726167286229297B72657475726E7D612E5F6F7074696F6E732E6F6E456E7465722862297D293B71712E6174';
wwv_flow_api.g_varchar2_table(138) := '7461636828612E5F656C656D656E742C22647261676C65617665222C66756E6374696F6E2863297B69662821612E5F697356616C696446696C6544726167286329297B72657475726E7D612E5F6F7074696F6E732E6F6E4C656176652863293B76617220';
wwv_flow_api.g_varchar2_table(139) := '623D646F63756D656E742E656C656D656E7446726F6D506F696E7428632E636C69656E74582C632E636C69656E7459293B69662871712E636F6E7461696E7328746869732C6229297B72657475726E7D612E5F6F7074696F6E732E6F6E4C656176654E6F';
wwv_flow_api.g_varchar2_table(140) := '7444657363656E64616E74732863297D293B71712E61747461636828612E5F656C656D656E742C2264726F70222C66756E6374696F6E2862297B69662821612E5F697356616C696446696C6544726167286229297B72657475726E7D622E70726576656E';
wwv_flow_api.g_varchar2_table(141) := '7444656661756C7428293B612E5F6F7074696F6E732E6F6E44726F702862297D297D2C5F697356616C696446696C65447261673A66756E6374696F6E2863297B76617220623D632E646174615472616E736665722C613D6E6176696761746F722E757365';
wwv_flow_api.g_varchar2_table(142) := '724167656E742E696E6465784F6628224170706C655765624B697422293E2D313B72657475726E20622626622E656666656374416C6C6F776564213D226E6F6E6522262628622E66696C65737C7C2821612626622E74797065732E636F6E7461696E7326';
wwv_flow_api.g_varchar2_table(143) := '26622E74797065732E636F6E7461696E73282246696C6573222929297D7D3B71712E55706C6F6164427574746F6E3D66756E6374696F6E2861297B746869732E5F6F7074696F6E733D7B656C656D656E743A6E756C6C2C6D756C7469706C653A66616C73';
wwv_flow_api.g_varchar2_table(144) := '652C6E616D653A2266696C65222C6F6E4368616E67653A66756E6374696F6E2862297B7D2C686F766572436C6173733A2271712D75706C6F61642D627574746F6E2D686F766572222C666F637573436C6173733A2271712D75706C6F61642D627574746F';
wwv_flow_api.g_varchar2_table(145) := '6E2D666F637573227D3B71712E657874656E6428746869732E5F6F7074696F6E732C61293B746869732E5F656C656D656E743D746869732E5F6F7074696F6E732E656C656D656E743B71712E63737328746869732E5F656C656D656E742C7B706F736974';
wwv_flow_api.g_varchar2_table(146) := '696F6E3A2272656C6174697665222C6F766572666C6F773A2268696464656E222C646972656374696F6E3A226C7472227D293B746869732E5F696E7075743D746869732E5F637265617465496E70757428297D3B71712E55706C6F6164427574746F6E2E';
wwv_flow_api.g_varchar2_table(147) := '70726F746F747970653D7B676574496E7075743A66756E6374696F6E28297B72657475726E20746869732E5F696E7075747D2C72657365743A66756E6374696F6E28297B696628746869732E5F696E7075742E706172656E744E6F6465297B71712E7265';
wwv_flow_api.g_varchar2_table(148) := '6D6F766528746869732E5F696E707574297D71712E72656D6F7665436C61737328746869732E5F656C656D656E742C746869732E5F6F7074696F6E732E666F637573436C617373293B746869732E5F696E7075743D746869732E5F637265617465496E70';
wwv_flow_api.g_varchar2_table(149) := '757428297D2C5F637265617465496E7075743A66756E6374696F6E28297B76617220623D646F63756D656E742E637265617465456C656D656E742822696E70757422293B696628746869732E5F6F7074696F6E732E6D756C7469706C65297B622E736574';
wwv_flow_api.g_varchar2_table(150) := '41747472696275746528226D756C7469706C65222C226D756C7469706C6522297D622E736574417474726962757465282274797065222C2266696C6522293B622E73657441747472696275746528226E616D65222C746869732E5F6F7074696F6E732E6E';
wwv_flow_api.g_varchar2_table(151) := '616D65293B71712E63737328622C7B706F736974696F6E3A226162736F6C757465222C72696768743A302C746F703A302C666F6E7446616D696C793A22417269616C222C666F6E7453697A653A223131387078222C6D617267696E3A302C70616464696E';
wwv_flow_api.g_varchar2_table(152) := '673A302C637572736F723A22706F696E746572222C6F7061636974793A307D293B746869732E5F656C656D656E742E617070656E644368696C642862293B76617220613D746869733B71712E61747461636828622C226368616E6765222C66756E637469';
wwv_flow_api.g_varchar2_table(153) := '6F6E28297B612E5F6F7074696F6E732E6F6E4368616E67652862297D293B71712E61747461636828622C226D6F7573656F766572222C66756E6374696F6E28297B71712E616464436C61737328612E5F656C656D656E742C612E5F6F7074696F6E732E68';
wwv_flow_api.g_varchar2_table(154) := '6F766572436C617373297D293B71712E61747461636828622C226D6F7573656F7574222C66756E6374696F6E28297B71712E72656D6F7665436C61737328612E5F656C656D656E742C612E5F6F7074696F6E732E686F766572436C617373297D293B7171';
wwv_flow_api.g_varchar2_table(155) := '2E61747461636828622C22666F637573222C66756E6374696F6E28297B71712E616464436C61737328612E5F656C656D656E742C612E5F6F7074696F6E732E666F637573436C617373297D293B71712E61747461636828622C22626C7572222C66756E63';
wwv_flow_api.g_varchar2_table(156) := '74696F6E28297B71712E72656D6F7665436C61737328612E5F656C656D656E742C612E5F6F7074696F6E732E666F637573436C617373297D293B69662877696E646F772E6174746163684576656E74297B622E7365744174747269627574652822746162';
wwv_flow_api.g_varchar2_table(157) := '496E646578222C222D3122297D617065782E6A51756572792862292E637573746F6D46696C65496E70757428746869732E5F6F7074696F6E73293B72657475726E20627D7D3B71712E55706C6F616448616E646C657241627374726163743D66756E6374';
wwv_flow_api.g_varchar2_table(158) := '696F6E2861297B746869732E5F6F7074696F6E733D7B64656275673A66616C73652C616374696F6E3A222F75706C6F61642E706870222C6D6178436F6E6E656374696F6E733A3939392C6F6E50726F67726573733A66756E6374696F6E28652C642C622C';
wwv_flow_api.g_varchar2_table(159) := '63297B7D2C6F6E436F6D706C6574653A66756E6374696F6E28642C632C62297B7D2C6F6E43616E63656C3A66756E6374696F6E28632C62297B7D7D3B71712E657874656E6428746869732E5F6F7074696F6E732C61293B746869732E5F71756575653D5B';
wwv_flow_api.g_varchar2_table(160) := '5D3B746869732E5F706172616D733D5B5D7D3B71712E55706C6F616448616E646C657241627374726163742E70726F746F747970653D7B6C6F673A66756E6374696F6E2861297B696628746869732E5F6F7074696F6E732E6465627567262677696E646F';
wwv_flow_api.g_varchar2_table(161) := '772E636F6E736F6C65297B636F6E736F6C652E6C6F6728225B75706C6F616465725D20222B61297D7D2C6164643A66756E6374696F6E2861297B7D2C75706C6F61643A66756E6374696F6E28642C62297B76617220613D746869732E5F71756575652E70';
wwv_flow_api.g_varchar2_table(162) := '7573682864293B76617220633D7B7D3B71712E657874656E6428632C62293B746869732E5F706172616D735B645D3D633B696628613C3D746869732E5F6F7074696F6E732E6D6178436F6E6E656374696F6E73297B746869732E5F75706C6F616428642C';
wwv_flow_api.g_varchar2_table(163) := '746869732E5F706172616D735B645D297D7D2C63616E63656C3A66756E6374696F6E2861297B746869732E5F63616E63656C2861293B746869732E5F646571756575652861297D2C63616E63656C416C6C3A66756E6374696F6E28297B666F7228766172';
wwv_flow_api.g_varchar2_table(164) := '20613D303B613C746869732E5F71756575652E6C656E6774683B612B2B297B746869732E5F63616E63656C28746869732E5F71756575655B615D297D746869732E5F71756575653D5B5D7D2C6765744E616D653A66756E6374696F6E2861297B7D2C6765';
wwv_flow_api.g_varchar2_table(165) := '7453697A653A66756E6374696F6E2861297B7D2C67657451756575653A66756E6374696F6E28297B72657475726E20746869732E5F71756575657D2C5F75706C6F61643A66756E6374696F6E2861297B7D2C5F63616E63656C3A66756E6374696F6E2861';
wwv_flow_api.g_varchar2_table(166) := '297B7D2C5F646571756575653A66756E6374696F6E2864297B76617220623D71712E696E6465784F6628746869732E5F71756575652C64293B746869732E5F71756575652E73706C69636528622C31293B76617220613D746869732E5F6F7074696F6E73';
wwv_flow_api.g_varchar2_table(167) := '2E6D6178436F6E6E656374696F6E733B696628746869732E5F71756575652E6C656E6774683E3D61297B76617220633D746869732E5F71756575655B612D315D3B746869732E5F75706C6F616428632C746869732E5F706172616D735B635D297D7D7D3B';
wwv_flow_api.g_varchar2_table(168) := '71712E55706C6F616448616E646C6572466F726D3D66756E6374696F6E2861297B71712E55706C6F616448616E646C657241627374726163742E6170706C7928746869732C617267756D656E7473293B746869732E5F696E707574733D7B7D7D3B71712E';
wwv_flow_api.g_varchar2_table(169) := '657874656E642871712E55706C6F616448616E646C6572466F726D2E70726F746F747970652C71712E55706C6F616448616E646C657241627374726163742E70726F746F74797065293B71712E657874656E642871712E55706C6F616448616E646C6572';
wwv_flow_api.g_varchar2_table(170) := '466F726D2E70726F746F747970652C7B6164643A66756E6374696F6E2861297B612E73657441747472696275746528226E616D65222C22705F74303322293B76617220623D2271712D75706C6F61642D68616E646C65722D696672616D65222B71712E67';
wwv_flow_api.g_varchar2_table(171) := '6574556E69717565496428293B746869732E5F696E707574735B625D3D613B696628612E706172656E744E6F6465297B71712E72656D6F76652861297D72657475726E20627D2C6765744E616D653A66756E6374696F6E2861297B72657475726E207468';
wwv_flow_api.g_varchar2_table(172) := '69732E5F696E707574735B615D2E76616C75652E7265706C616365282F2E2A285C2F7C5C5C292F2C2222297D2C5F63616E63656C3A66756E6374696F6E2862297B746869732E5F6F7074696F6E732E6F6E43616E63656C28622C746869732E6765744E61';
wwv_flow_api.g_varchar2_table(173) := '6D65286229293B64656C65746520746869732E5F696E707574735B625D3B76617220613D646F63756D656E742E676574456C656D656E74427949642862293B69662861297B612E7365744174747269627574652822737263222C226A6176617363726970';
wwv_flow_api.g_varchar2_table(174) := '743A66616C73653B22293B71712E72656D6F76652861297D7D2C5F75706C6F61643A66756E6374696F6E28672C65297B76617220623D746869732E5F696E707574735B675D3B6966282162297B7468726F77206E6577204572726F72282266696C652077';
wwv_flow_api.g_varchar2_table(175) := '6974682070617373656420696420776173206E6F742061646465642C206F7220616C72656164792075706C6F61646564206F722063616E63656C6C656422297D76617220663D746869732E6765744E616D652867293B76617220633D746869732E5F6372';
wwv_flow_api.g_varchar2_table(176) := '65617465496672616D652867293B76617220643D746869732E5F637265617465466F726D28632C662C65293B642E617070656E644368696C642862293B76617220613D746869733B746869732E5F6174746163684C6F61644576656E7428632C66756E63';
wwv_flow_api.g_varchar2_table(177) := '74696F6E28297B612E6C6F672822696672616D65206C6F6164656422293B76617220683D612E5F676574496672616D65436F6E74656E744A534F4E2863293B612E5F6F7074696F6E732E6F6E436F6D706C65746528672C662C68293B612E5F6465717565';
wwv_flow_api.g_varchar2_table(178) := '75652867293B64656C65746520612E5F696E707574735B675D3B73657454696D656F75742866756E6374696F6E28297B71712E72656D6F76652863297D2C31297D293B642E7375626D697428293B71712E72656D6F76652864293B72657475726E20677D';
wwv_flow_api.g_varchar2_table(179) := '2C5F6174746163684C6F61644576656E743A66756E6374696F6E28612C62297B71712E61747461636828612C226C6F6164222C66756E6374696F6E28297B69662821612E706172656E744E6F6465297B72657475726E7D696628612E636F6E74656E7444';
wwv_flow_api.g_varchar2_table(180) := '6F63756D656E742626612E636F6E74656E74446F63756D656E742E626F64792626612E636F6E74656E74446F63756D656E742E626F64792E696E6E657248544D4C3D3D2266616C736522297B72657475726E7D6228297D297D2C5F676574536563757269';
wwv_flow_api.g_varchar2_table(181) := '7479496E707574733A66756E6374696F6E28297B76617220623D746869733B76617220613D7B705F666C6F775F69643A2428222370466C6F77496422292E76616C28292C705F666C6F775F737465705F69643A622E5F6F7074696F6E732E696672616D65';
wwv_flow_api.g_varchar2_table(182) := '506167657C7C223537353635222C705F696E7374616E63653A2428222370496E7374616E636522292E76616C28292C7830313A4D6174682E72616E646F6D28297D3B242E616A6178287B747970653A22474554222C75726C3A227777765F666C6F772E73';
wwv_flow_api.g_varchar2_table(183) := '686F77222C6173796E633A66616C73652C646174613A612C737563636573733A66756E6374696F6E2867297B76617220642C653D242867293B76617220633D652E66696E6428275B6E616D653D22705F706167655F7375626D697373696F6E5F6964225D';
wwv_flow_api.g_varchar2_table(184) := '2C5B6E616D653D22705F706167655F636865636B73756D225D27297C7C5B5D3B666F722876617220663D303B663C632E6C656E6774683B662B2B297B642B3D635B665D2E6F7574657248544D4C7D622E5F6F7074696F6E732E696672616D65466F726D3D';
wwv_flow_api.g_varchar2_table(185) := '622E5F6F7074696F6E732E696672616D65466F726D2E7265706C616365282F235345435552495459232F2C64297D7D297D2C5F676574496672616D65436F6E74656E744A534F4E3A66756E6374696F6E28696672616D65297B76617220646F633D696672';
wwv_flow_api.g_varchar2_table(186) := '616D652E636F6E74656E74446F63756D656E743F696672616D652E636F6E74656E74446F63756D656E743A696672616D652E636F6E74656E7457696E646F772E646F63756D656E742C726573706F6E73653B746869732E6C6F672822636F6E7665727469';
wwv_flow_api.g_varchar2_table(187) := '6E6720696672616D65277320696E6E657248544D4C20746F204A534F4E22293B746869732E6C6F672822696E6E657248544D4C203D20222B646F632E626F64792E696E6E657248544D4C2E7265706C616365282F4C6F636174696F6E2E2A242F2C222229';
wwv_flow_api.g_varchar2_table(188) := '293B7472797B726573706F6E73653D6576616C282228222B646F632E626F64792E696E6E657248544D4C2E7265706C616365282F4C6F636174696F6E2E2A242F2C2222292B222922297D636174636828657272297B726573706F6E73653D7B7D7D726574';
wwv_flow_api.g_varchar2_table(189) := '75726E20726573706F6E73657D2C5F637265617465496672616D653A66756E6374696F6E2862297B76617220613D71712E746F456C656D656E7428273C696672616D65207372633D226A6176617363726970743A66616C73653B22206E616D653D22272B';
wwv_flow_api.g_varchar2_table(190) := '622B2722202F3E27293B612E73657441747472696275746528226964222C62293B612E7374796C652E646973706C61793D226E6F6E65223B646F63756D656E742E626F64792E617070656E644368696C642861293B72657475726E20617D2C5F63726561';
wwv_flow_api.g_varchar2_table(191) := '7465466F726D3A66756E6374696F6E28612C652C63297B746869732E5F6765745365637572697479496E7075747328293B76617220623D71712E746F456C656D656E7428746869732E5F6F7074696F6E732E696672616D65466F726D2E7265706C616365';
wwv_flow_api.g_varchar2_table(192) := '282F2346494C454E414D45232F2C6529293B76617220643D71712E6F626A3275726C28632C746869732E5F6F7074696F6E732E616374696F6E293B622E7365744174747269627574652822616374696F6E222C64293B622E736574417474726962757465';
wwv_flow_api.g_varchar2_table(193) := '2822746172676574222C612E6E616D65293B622E7374796C652E646973706C61793D226E6F6E65223B646F63756D656E742E626F64792E617070656E644368696C642862293B72657475726E20627D7D293B71712E55706C6F616448616E646C65725868';
wwv_flow_api.g_varchar2_table(194) := '723D66756E6374696F6E2861297B71712E55706C6F616448616E646C657241627374726163742E6170706C7928746869732C617267756D656E7473293B746869732E5F66696C65733D5B5D3B746869732E5F786872733D5B5D3B746869732E5F61706578';
wwv_flow_api.g_varchar2_table(195) := '506172616D733D22223B746869732E5F7175657279537472696E673D22223B746869732E5F746578743D22223B746869732E5F61706578506172616D41727261793D5B5D3B746869732E5F6C6F616465643D5B5D7D3B71712E55706C6F616448616E646C';
wwv_flow_api.g_varchar2_table(196) := '65725868722E6973537570706F727465643D66756E6374696F6E28297B76617220613D646F63756D656E742E637265617465456C656D656E742822696E70757422293B612E747970653D2266696C65223B72657475726E28226D756C7469706C65222069';
wwv_flow_api.g_varchar2_table(197) := '6E20612626747970656F662077696E646F772E46696C65526561646572213D22756E646566696E6564222626747970656F662046696C65213D22756E646566696E6564222626747970656F66286E657720584D4C48747470526571756573742829292E75';
wwv_flow_api.g_varchar2_table(198) := '706C6F6164213D22756E646566696E656422297D3B71712E657874656E642871712E55706C6F616448616E646C65725868722E70726F746F747970652C71712E55706C6F616448616E646C657241627374726163742E70726F746F74797065293B71712E';
wwv_flow_api.g_varchar2_table(199) := '657874656E642871712E55706C6F616448616E646C65725868722E70726F746F747970652C7B6164643A66756E6374696F6E2861297B69662821286120696E7374616E63656F662046696C6529297B7468726F77206E6577204572726F72282250617373';
wwv_flow_api.g_varchar2_table(200) := '6564206F626A20696E206E6F7420612046696C652028696E2071712E55706C6F616448616E646C65725868722922297D72657475726E20746869732E5F66696C65732E707573682861292D317D2C6765744E616D653A66756E6374696F6E2862297B7661';
wwv_flow_api.g_varchar2_table(201) := '7220613D746869732E5F66696C65735B625D3B72657475726E20612E66696C654E616D65213D6E756C6C3F612E66696C654E616D653A612E6E616D657D2C676574547970653A66756E6374696F6E2862297B76617220613D746869732E5F66696C65735B';
wwv_flow_api.g_varchar2_table(202) := '625D3B72657475726E20612E74797065213D6E756C6C3F612E747970653A22746578742F68746D6C227D2C67657453697A653A66756E6374696F6E2862297B76617220613D746869732E5F66696C65735B625D3B72657475726E20612E66696C6553697A';
wwv_flow_api.g_varchar2_table(203) := '65213D6E756C6C3F612E66696C6553697A653A612E73697A657D2C6765744C6F616465643A66756E6374696F6E2861297B72657475726E20746869732E5F6C6F616465645B615D7C7C307D2C617065784573636170653A66756E6374696F6E2861297B61';
wwv_flow_api.g_varchar2_table(204) := '3D612B22223B613D612E7265706C616365282F5C252F672C2225323522293B613D612E7265706C616365282F5C2B2F672C2225324222293B613D612E7265706C616365282F5C202F672C2225323022293B613D612E7265706C616365282F5C2E2F672C22';
wwv_flow_api.g_varchar2_table(205) := '25324522293B613D612E7265706C616365282F5C2A2F672C2225324122293B613D612E7265706C616365282F5C3F2F672C2225334622293B613D612E7265706C616365282F5C5C2F672C2225354322293B613D612E7265706C616365282F5C2F2F672C22';
wwv_flow_api.g_varchar2_table(206) := '25324622293B613D612E7265706C616365282F5C3E2F672C2225334522293B613D612E7265706C616365282F5C3C2F672C2225334322293B613D612E7265706C616365282F5C7B2F672C2225374222293B613D612E7265706C616365282F5C7D2F672C22';
wwv_flow_api.g_varchar2_table(207) := '25374422293B613D612E7265706C616365282F5C7E2F672C2225374522293B613D612E7265706C616365282F5C5B2F672C2225354222293B613D612E7265706C616365282F5C5D2F672C2225354422293B613D612E7265706C616365282F5C602F672C22';
wwv_flow_api.g_varchar2_table(208) := '25363022293B613D612E7265706C616365282F5C3B2F672C2225334222293B613D612E7265706C616365282F5C3F2F672C2225334622293B613D612E7265706C616365282F5C402F672C2225343022293B613D612E7265706C616365282F5C262F672C22';
wwv_flow_api.g_varchar2_table(209) := '25323622293B613D612E7265706C616365282F5C232F672C2225323322293B613D612E7265706C616365282F5C7C2F672C2225374322293B613D612E7265706C616365282F5C5E2F672C2225354522293B613D612E7265706C616365282F5C3A2F672C22';
wwv_flow_api.g_varchar2_table(210) := '25334122293B613D612E7265706C616365282F5C3D2F672C2225334422293B613D612E7265706C616365282F5C242F672C2225323422293B72657475726E20617D2C73706C6974537472696E673A66756E6374696F6E28632C61297B6C41727261793D63';
wwv_flow_api.g_varchar2_table(211) := '2E61706578506172616D41727261793B76617220643D4D6174682E6365696C28632E746578742E6C656E6774682F61293B696628632E746578742E6C656E6774683C3D61297B6C41727261795B6C41727261792E6C656E6774685D3D632E746578747D65';
wwv_flow_api.g_varchar2_table(212) := '6C73657B666F722876617220623D303B623C642D313B622B2B297B6C41727261795B6C41727261792E6C656E6774685D3D632E746578742E73756273747228622A612C61297D6C41727261795B6C41727261792E6C656E6774685D3D632E746578742E73';
wwv_flow_api.g_varchar2_table(213) := '75627374722828642D31292A612C632E746578742E6C656E677468297D7D2C61706578416464506172616D3A66756E6374696F6E28622C612C63297B696628622E61706578506172616D733D3D2222297B622E61706578506172616D733D612B223D222B';
wwv_flow_api.g_varchar2_table(214) := '2863213D6E756C6C3F746869732E617065784573636170652863293A2222297D656C73657B622E61706578506172616D733D622E61706578506172616D732B2226222B612B223D222B2863213D6E756C6C3F746869732E61706578457363617065286329';
wwv_flow_api.g_varchar2_table(215) := '3A2222297D72657475726E7D2C6170657841646441727261793A66756E6374696F6E28652C64297B76617220633D2266223B643D246E766C28642C31293B696628643C3130297B632B3D2230222B647D656C73657B632B3D647D666F722876617220623D';
wwv_flow_api.g_varchar2_table(216) := '302C613D652E61706578506172616D41727261792E6C656E6774683B623C613B622B2B297B746869732E61706578416464506172616D28652C632C652E61706578506172616D41727261795B625D297D7D2C61706578416464417272617946696C653A66';
wwv_flow_api.g_varchar2_table(217) := '756E6374696F6E28662C632C642C65297B746869732E5F61706578506172616D733D22223B76617220623D746869733B76617220613D6E65772046696C6552656164657228293B612E6F6E6C6F61643D66756E6374696F6E2868297B76617220673D7B74';
wwv_flow_api.g_varchar2_table(218) := '6578743A22222C61706578506172616D41727261793A5B5D2C61706578506172616D733A22222C7175657279537472696E673A22227D3B672E746578743D682E7461726765742E726573756C743B672E746578743D672E746578742E7265706C61636528';
wwv_flow_api.g_varchar2_table(219) := '2F5E2E2A6261736536342C2F2C2222293B622E73706C6974537472696E6728672C34303030293B622E61706578416464417272617928672C64293B672E7175657279537472696E673D71712E6F626A3275726C28662C622E5F6F7074696F6E732E616374';
wwv_flow_api.g_varchar2_table(220) := '696F6E293B652E6F70656E2822504F5354222C672E7175657279537472696E672C74727565293B652E736574526571756573744865616465722822436F6E74656E742D54797065222C226170706C69636174696F6E2F782D7777772D666F726D2D75726C';
wwv_flow_api.g_varchar2_table(221) := '656E636F64656422293B652E73656E6428672E61706578506172616D73293B673D7B7D7D3B612E7265616441734461746155524C2863297D2C5F73656E644368756E6B3A66756E6374696F6E28682C642C632C6A297B766172206B3D746869732C693D6E';
wwv_flow_api.g_varchar2_table(222) := '65772046696C6552656164657228292C663D6B2E5F6F7074696F6E732E6368756E6B53697A652C613D662A286A2E5F6368756E6B4E756D6265722D31292C673D612B662C653D642E736C69636528612C67292C623D652E73697A653B692E6F6E6C6F6164';
wwv_flow_api.g_varchar2_table(223) := '3D66756E6374696F6E286D297B766172206C3D7B746578743A22222C61706578506172616D41727261793A5B5D2C61706578506172616D733A22222C7175657279537472696E673A22227D3B6C2E746578743D6D2E7461726765742E726573756C743B68';
wwv_flow_api.g_varchar2_table(224) := '2E7830343D6A2E5F6368756E6B4E756D6265723B682E7830353D6A2E5F6368756E6B546F74616C3B6C2E746578743D6C2E746578742E7265706C616365282F5E2E2A6261736536342C2F2C2222293B6B2E73706C6974537472696E67286C2C3430303029';
wwv_flow_api.g_varchar2_table(225) := '3B6B2E617065784164644172726179286C2C63293B6C2E7175657279537472696E673D71712E6F626A3275726C28682C6B2E5F6F7074696F6E732E616374696F6E293B6A2E6F70656E2822504F5354222C6C2E7175657279537472696E672C7472756529';
wwv_flow_api.g_varchar2_table(226) := '3B6A2E736574526571756573744865616465722822436F6E74656E742D54797065222C226170706C69636174696F6E2F782D7777772D666F726D2D75726C656E636F64656422293B6A2E73656E64286C2E61706578506172616D73293B6C3D7B7D7D3B69';
wwv_flow_api.g_varchar2_table(227) := '2E7265616441734461746155524C2865297D2C5F75706C6F61644368756E6B656446696C653A66756E6374696F6E28682C67297B76617220613D746869732C643D746869732E5F66696C65735B685D2C623D746869732E6765744E616D652868292C633D';
wwv_flow_api.g_varchar2_table(228) := '746869732E67657453697A652868292C653D746869732E676574547970652868293B746869732E5F6C6F616465645B685D3D303B76617220663D746869732E5F786872735B685D3D6E657720584D4C487474705265717565737428293B76617220613D74';
wwv_flow_api.g_varchar2_table(229) := '6869733B662E5F6368756E6B546F74616C3D4D6174682E6365696C28632F612E5F6F7074696F6E732E6368756E6B53697A65293B662E5F6368756E6B4E756D6265723D313B662E75706C6F61642E6F6E70726F67726573733D66756E6374696F6E286929';
wwv_flow_api.g_varchar2_table(230) := '7B696628692E6C656E677468436F6D70757461626C65297B612E5F6C6F616465645B685D3D692E6C6F616465643B612E5F6F7074696F6E732E6F6E50726F677265737328682C622C692E6C6F616465642C692E746F74616C2C662E5F6368756E6B4E756D';
wwv_flow_api.g_varchar2_table(231) := '6265722C662E5F6368756E6B546F74616C297D7D3B662E6F6E726561647973746174656368616E67653D66756E6374696F6E28297B696628662E726561647953746174653D3D34297B662E5F6368756E6B4E756D6265722B3D313B696628662E5F636875';
wwv_flow_api.g_varchar2_table(232) := '6E6B4E756D6265723E662E5F6368756E6B546F74616C297B612E5F6F6E436F6D706C65746528682C66297D656C73657B612E5F73656E644368756E6B28672C642C312C66297D7D7D3B673D677C7C7B7D3B672E7830313D623B672E7830323D633B672E78';
wwv_flow_api.g_varchar2_table(233) := '30333D653B746869732E5F73656E644368756E6B28672C642C312C66297D2C5F75706C6F6164456E7469726546696C653A66756E6374696F6E28682C67297B76617220643D746869732E5F66696C65735B685D2C623D746869732E6765744E616D652868';
wwv_flow_api.g_varchar2_table(234) := '292C633D746869732E67657453697A652868292C653D746869732E676574547970652868293B746869732E5F6C6F616465645B685D3D303B76617220663D746869732E5F786872735B685D3D6E657720584D4C487474705265717565737428293B766172';
wwv_flow_api.g_varchar2_table(235) := '20613D746869733B662E75706C6F61642E6F6E70726F67726573733D66756E6374696F6E2869297B696628692E6C656E677468436F6D70757461626C65297B612E5F6C6F616465645B685D3D692E6C6F616465643B612E5F6F7074696F6E732E6F6E5072';
wwv_flow_api.g_varchar2_table(236) := '6F677265737328682C622C692E6C6F616465642C692E746F74616C297D7D3B662E6F6E726561647973746174656368616E67653D66756E6374696F6E28297B696628662E726561647953746174653D3D34297B612E5F6F6E436F6D706C65746528682C66';
wwv_flow_api.g_varchar2_table(237) := '297D7D3B673D677C7C7B7D3B672E7830313D623B672E7830323D633B672E7830333D653B746869732E61706578416464417272617946696C6528672C642C312C66297D2C5F75706C6F61643A66756E6374696F6E28642C63297B76617220613D74686973';
wwv_flow_api.g_varchar2_table(238) := '2C623D746869732E67657453697A652864293B696628623C3D612E5F6F7074696F6E732E6368756E6B53697A65297B746869732E5F75706C6F6164456E7469726546696C6528642C63297D656C73657B746869732E5F75706C6F61644368756E6B656446';
wwv_flow_api.g_varchar2_table(239) := '696C6528642C63297D7D2C5F6F6E436F6D706C6574653A66756E6374696F6E2869642C786872297B69662821746869732E5F66696C65735B69645D297B72657475726E7D766172206E616D653D746869732E6765744E616D65286964293B766172207369';
wwv_flow_api.g_varchar2_table(240) := '7A653D746869732E67657453697A65286964293B746869732E5F6F7074696F6E732E6F6E50726F67726573732869642C6E616D652C73697A652C73697A65293B6966287868722E7374617475733D3D323030297B746869732E6C6F672822786872202D20';
wwv_flow_api.g_varchar2_table(241) := '73657276657220726573706F6E736520726563656976656422293B746869732E6C6F672822726573706F6E736554657874203D20222B7868722E726573706F6E736554657874293B76617220726573706F6E73653B7472797B726573706F6E73653D6576';
wwv_flow_api.g_varchar2_table(242) := '616C282228222B7868722E726573706F6E7365546578742B222922297D636174636828657272297B726573706F6E73653D7B7D7D746869732E5F6F7074696F6E732E6F6E436F6D706C6574652869642C6E616D652C726573706F6E7365297D656C73657B';
wwv_flow_api.g_varchar2_table(243) := '746869732E5F6F7074696F6E732E6F6E436F6D706C6574652869642C6E616D652C7B7D297D746869732E5F66696C65735B69645D3D6E756C6C3B746869732E5F786872735B69645D3D6E756C6C3B746869732E5F64657175657565286964297D2C5F6361';
wwv_flow_api.g_varchar2_table(244) := '6E63656C3A66756E6374696F6E2861297B746869732E5F6F7074696F6E732E6F6E43616E63656C28612C746869732E6765744E616D65286129293B746869732E5F66696C65735B615D3D6E756C6C3B696628746869732E5F786872735B615D297B746869';
wwv_flow_api.g_varchar2_table(245) := '732E5F786872735B615D2E61626F727428293B746869732E5F786872735B615D3D6E756C6C7D7D7D293B2866756E6374696F6E2861297B612E666E2E637573746F6D46696C65496E7075743D66756E6374696F6E2862297B72657475726E206128746869';
wwv_flow_api.g_varchar2_table(246) := '73292E656163682866756E6374696F6E28297B76617220653D612874686973292E616464436C6173732822637573746F6D66696C652D696E70757422292E6D6F7573656F7665722866756E6374696F6E28297B642E616464436C6173732822637573746F';
wwv_flow_api.g_varchar2_table(247) := '6D66696C652D686F76657222297D292E6D6F7573656F75742866756E6374696F6E28297B642E72656D6F7665436C6173732822637573746F6D66696C652D686F76657222297D292E666F6375732866756E6374696F6E28297B642E616464436C61737328';
wwv_flow_api.g_varchar2_table(248) := '22637573746F6D66696C652D666F63757322293B652E64617461282276616C222C652E76616C2829297D292E626C75722866756E6374696F6E28297B642E72656D6F7665436C6173732822637573746F6D66696C652D666F63757322293B612874686973';
wwv_flow_api.g_varchar2_table(249) := '292E747269676765722822636865636B4368616E676522297D292E62696E64282264697361626C65222C66756E6374696F6E28297B652E61747472282264697361626C6564222C74727565293B642E616464436C6173732822637573746F6D66696C652D';
wwv_flow_api.g_varchar2_table(250) := '64697361626C656422297D292E62696E642822656E61626C65222C66756E6374696F6E28297B652E72656D6F766541747472282264697361626C656422293B642E72656D6F7665436C6173732822637573746F6D66696C652D64697361626C656422297D';
wwv_flow_api.g_varchar2_table(251) := '293B69662861282223222B622E69642B22202E637573746F6D66696C6522292E6C656E6774683E30297B76617220643D61282223222B622E69642B22202E637573746F6D66696C6522293B76617220633D61282223222B622E69642B22202E637573746F';
wwv_flow_api.g_varchar2_table(252) := '6D66696C652D627574746F6E22293B76617220663D61282223222B622E69642B22202E637573746F6D66696C652D666565646261636B22297D656C73657B76617220643D6128273C64697620636C6173733D22637573746F6D66696C65223E3C2F646976';
wwv_flow_api.g_varchar2_table(253) := '3E27293B76617220633D6128273C7370616E20636C6173733D22637573746F6D66696C652D627574746F6E2220617269612D68696464656E3D2274727565223E272B622E62726F77736542746E4C6162656C2B223C2F7370616E3E22292E617070656E64';
wwv_flow_api.g_varchar2_table(254) := '546F2864293B76617220663D6128273C7370616E20636C6173733D22637573746F6D66696C652D666565646261636B2220617269612D68696464656E3D2274727565223E272B622E6E6F66696C654C6162656C2B223C2F7370616E3E22292E617070656E';
wwv_flow_api.g_varchar2_table(255) := '64546F2864297D696628652E697328225B64697361626C65645D2229297B652E74726967676572282264697361626C6522297D642E6D6F7573656D6F76652866756E6374696F6E2867297B652E637373287B6C6566743A672E70616765582D642E6F6666';
wwv_flow_api.g_varchar2_table(256) := '73657428292E6C6566742D652E6F75746572576964746828292B32307D297D292E696E7365727441667465722865293B652E617070656E64546F2864297D297D7D2928617065782E6A5175657279293B';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3766083739862927413 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'fileuploader.min.js'
 ,p_mime_type => 'text/javascript'
 ,p_file_content => wwv_flow_api.g_varchar2_table
  );
null;
 
end;
/

 
begin
 
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E71712D75706C6F61642D64726F702D61726561207B0D0A20202020706F736974696F6E3A6162736F6C7574653B20746F703A303B206C6566743A303B2077696474683A313030253B206865696768743A313030253B206D696E2D6865696768743A2037';
wwv_flow_api.g_varchar2_table(2) := '3070783B207A2D696E6465783A323B0D0A202020206261636B67726F756E643A234646393739373B20746578742D616C69676E3A63656E7465723B200D0A7D0D0A2E71712D75706C6F61642D64726F702D61726561207370616E207B0D0A202020206469';
wwv_flow_api.g_varchar2_table(3) := '73706C61793A626C6F636B3B20706F736974696F6E3A6162736F6C7574653B20746F703A203530253B2077696474683A313030253B206D617267696E2D746F703A2D3870783B20666F6E742D73697A653A313670783B636F6C6F723A236666663B0D0A7D';
wwv_flow_api.g_varchar2_table(4) := '0D0A2E71712D75706C6F61642D64726F702D617265612D616374697665207B6261636B67726F756E643A234646373137313B7D0D0A0D0A2E71712D75706C6F61642D6C697374207B70616464696E673A357078203020303B206C6973742D7374796C653A';
wwv_flow_api.g_varchar2_table(5) := '646973633B7D0D0A2E71712D75706C6F61642D6C697374206C69207B206D617267696E2D6C6566743A323570783B2070616464696E673A303B206C696E652D6865696768743A313570783B20666F6E742D73697A653A313270783B7D0D0A2E71712D7570';
wwv_flow_api.g_varchar2_table(6) := '6C6F61642D66696C652C202E71712D75706C6F61642D7370696E6E65722C202E71712D75706C6F61642D73697A652C202E71712D75706C6F61642D63616E63656C2C202E71712D75706C6F61642D6661696C65642D74657874207B0D0A202020206D6172';
wwv_flow_api.g_varchar2_table(7) := '67696E2D72696768743A203770783B0D0A7D0D0A0D0A2E71712D75706C6F61642D7370696E6E6572207B646973706C61793A696E6C696E652D626C6F636B3B206261636B67726F756E643A2075726C2823504C5547494E5F505245464958236C6F616469';
wwv_flow_api.g_varchar2_table(8) := '6E672E676966293B2077696474683A313570783B206865696768743A313570783B20766572746963616C2D616C69676E3A746578742D626F74746F6D3B7D0D0A2E71712D75706C6F61642D73697A652C2E71712D75706C6F61642D63616E63656C207B66';
wwv_flow_api.g_varchar2_table(9) := '6F6E742D73697A653A313170783B7D0D0A0D0A2E71712D75706C6F61642D6661696C65642D74657874207B646973706C61793A6E6F6E653B7D0D0A2E71712D75706C6F61642D6661696C202E71712D75706C6F61642D6661696C65642D74657874207B64';
wwv_flow_api.g_varchar2_table(10) := '6973706C61793A696E6C696E653B7D0D0A0D0A2F2A2046696C6520496E707574202620427574746F6E205374796C696E67202A2F0D0A696E7075742E66696C65207B206261636B67726F756E643A20236161612075726C2862672D62746E2E706E672920';
wwv_flow_api.g_varchar2_table(11) := '626F74746F6D207265706561742D783B2070616464696E673A202E34656D20312E32656D3B626F726465723A2031707820736F6C696420236161613B20636F6C6F723A20233232323B20666F6E742D73697A653A20312E32656D3B20666F6E742D776569';
wwv_flow_api.g_varchar2_table(12) := '6768743A20626F6C643B202D6D6F7A2D626F726465722D7261646975733A203370783B202D7765626B69742D626F726465722D7261646975733A203370783B20626F726465722D7261646975733A203370783B20637572736F723A20706F696E7465723B';
wwv_flow_api.g_varchar2_table(13) := '206D617267696E3A2032656D20303B207D0D0A696E7075742E66696C653A686F766572207B206261636B67726F756E643A20236565653B20636F6C6F723A20233131313B20626F726465722D636F6C6F723A233737373B207D0D0A0D0A0D0A2F2A637573';
wwv_flow_api.g_varchar2_table(14) := '746F6D2075706C6F616420656C656D656E74732A2F0D0A2E637573746F6D66696C652D696E707574207B20706F736974696F6E3A206162736F6C7574653B206865696768743A2031303070783B20637572736F723A20706F696E7465723B206261636B67';
wwv_flow_api.g_varchar2_table(15) := '726F756E643A207472616E73706172656E743B20626F726465723A20303B206F7061636974793A20303B202D6D6F7A2D6F7061636974793A20303B2066696C7465723A70726F6769643A4458496D6167655472616E73666F726D2E4D6963726F736F6674';
wwv_flow_api.g_varchar2_table(16) := '2E416C706861286F7061636974793D30293B207A2D696E6465783A203939393B20207D0D0A2E637573746F6D66696C652C2E71712D75706C6F61642D64726F702D61726561207B2077696474683A2034303070783B206261636B67726F756E643A202336';
wwv_flow_api.g_varchar2_table(17) := '36363B20637572736F723A20706F696E7465723B206F766572666C6F773A2068696464656E3B2070616464696E673A203270783B20626F726465723A2031707820736F6C696420233434343B202D6D6F7A2D626F726465722D7261646975733A3370783B';
wwv_flow_api.g_varchar2_table(18) := '202D7765626B69742D626F726465722D7261646975733A3370783B20626F726465722D7261646975733A3370783B2020706F736974696F6E3A2072656C61746976653B207D0D0A2E637573746F6D66696C652D64697361626C6564207B206F7061636974';
wwv_flow_api.g_varchar2_table(19) := '793A202E353B2066696C7465723A70726F6769643A4458496D6167655472616E73666F726D2E4D6963726F736F66742E416C706861286F7061636974793D30293B20637572736F723A2064656661756C743B20207D0D0A2E637573746F6D66696C652D66';
wwv_flow_api.g_varchar2_table(20) := '6565646261636B207B20646973706C61793A20626C6F636B3B206D617267696E3A203170782031707820317078203570783B20666F6E742D73697A653A20312E32656D3B20636F6C6F723A20236666663B20666F6E742D7374796C653A206974616C6963';
wwv_flow_api.g_varchar2_table(21) := '3B2070616464696E673A202E33656D202E36656D3B207D0D0A2E637573746F6D66696C652D666565646261636B2D706F70756C61746564207B20636F6C6F723A20236666663B20666F6E742D7374796C653A206E6F726D616C3B20666F6E742D77656967';
wwv_flow_api.g_varchar2_table(22) := '68743A20626F6C643B2070616464696E672D6C6566743A20323070783B206261636B67726F756E643A2075726C2823504C5547494E5F5052454649582369636F6E2D67656E657269632E67696629206C65667420347078206E6F2D7265706561743B207D';
wwv_flow_api.g_varchar2_table(23) := '0D0A2E637573746F6D66696C652D627574746F6E207B20626F726465723A2031707820736F6C696420233939393B206261636B67726F756E643A20233333332075726C2823504C5547494E5F5052454649582362672D7375626D69742E6769662920626F';
wwv_flow_api.g_varchar2_table(24) := '74746F6D207265706561742D783B2020636F6C6F723A20236666663B20666F6E742D7765696768743A20626F6C643B20666C6F61743A2072696768743B2070616464696E673A202E33656D202E36656D3B2020746578742D616C69676E3A2063656E7465';
wwv_flow_api.g_varchar2_table(25) := '723B20746578742D6465636F726174696F6E3A206E6F6E653B2020666F6E742D73697A653A20312E32656D3B202D6D6F7A2D626F726465722D7261646975733A3370783B202D7765626B69742D626F726465722D7261646975733A3370783B20626F7264';
wwv_flow_api.g_varchar2_table(26) := '65722D7261646975733A3370783B2077686974652D73706163653A6E6F777261703B207D0D0A2E637573746F6D66696C652D686F766572202E637573746F6D66696C652D627574746F6E2C202E637573746F6D66696C652D666F637573202E637573746F';
wwv_flow_api.g_varchar2_table(27) := '6D66696C652D627574746F6E20207B20636F6C6F723A233131313B206261636B67726F756E643A20236161612075726C2823504C5547494E5F5052454649582362672D62746E2E706E672920626F74746F6D207265706561742D783B20626F726465722D';
wwv_flow_api.g_varchar2_table(28) := '636F6C6F723A236161613B202070616464696E673A202E33656D202E36656D3B20207D0D0A2E637573746F6D66696C652D666F637573202E637573746F6D66696C652D627574746F6E207B206F75746C696E653A2031707820646F747465642023636363';
wwv_flow_api.g_varchar2_table(29) := '3B20207D0D0A0D0A2F2A66696C6520747970652069636F6E732A2F0D0A2E637573746F6D66696C652D6578742D6A70672C202E637573746F6D66696C652D6578742D6769662C202E637573746F6D66696C652D6578742D706E672C202E637573746F6D66';
wwv_flow_api.g_varchar2_table(30) := '696C652D6578742D6A7065672C202E637573746F6D66696C652D6578742D626D70207B206261636B67726F756E642D696D6167653A2075726C2823504C5547494E5F5052454649582369636F6E2D696D6167652E676966293B7D0D0A2E637573746F6D66';
wwv_flow_api.g_varchar2_table(31) := '696C652D6578742D6D70332C202E637573746F6D66696C652D6578742D6D70342C202E637573746F6D66696C652D6578742D6D6F762C202E637573746F6D66696C652D6578742D7377662C202E637573746F6D66696C652D6578742D7761762C202E6375';
wwv_flow_api.g_varchar2_table(32) := '73746F6D66696C652D6578742D6D3476207B206261636B67726F756E642D696D6167653A2075726C2823504C5547494E5F5052454649582369636F6E2D6D656469612E676966293B7D0D0A2E637573746F6D66696C652D6578742D7A69702C202E637573';
wwv_flow_api.g_varchar2_table(33) := '746F6D66696C652D6578742D7461722C202E637573746F6D66696C652D6578742D736974207B206261636B67726F756E642D696D6167653A2075726C2823504C5547494E5F5052454649582369636F6E2D7A69702E676966293B7D0D0A0D0A2F2A616464';
wwv_flow_api.g_varchar2_table(34) := '6974696F6E732A2F0D0A2E637573746F6D66696C652D666C656674207B20666C6F61743A206C6566743B207D0D0A2E637573746F6D66696C652D75706C6F616473207B206D617267696E2D746F703A3370783B207D';
null;
 
end;
/

 
begin
 
wwv_flow_api.create_plugin_file (
  p_id => 3766123138495019211 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_id => 3753088765961028424 + wwv_flow_api.g_id_offset
 ,p_file_name => 'fileuploader.css'
 ,p_mime_type => 'text/css'
 ,p_file_content => wwv_flow_api.g_varchar2_table
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
