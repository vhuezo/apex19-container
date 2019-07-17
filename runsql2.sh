#source oracle environment variables ORACLE_HOME/ORACLE_SID..
source ~/.bashrc
#start db instance and listener
${ORACLE_HOME_ARG}/bin/dbstart ${ORACLE_HOME_ARG}
#sleep for 10 seconds
sleep 10

#create SUDS tablespace and user
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba @/tmp/suds-db-user.sql
#create DDL
${ORACLE_HOME_ARG}/bin/sqlplus suds/suds@${PDB_NAME_ARG} @/tmp/export.sql
#import SUDS WORKSPACE
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/SUDS.sql > /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/f9205.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/css.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/dynamic_action_plugin_com_clarifit_apexplugin_ir_column_grouping.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/f9205_img.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/item_type_plugin_com_af_plugin_jq_fileupload.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/region_type_plugin_com_af_plugin_jq_menu.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/region_type_plugin_com_blogspot_apexnotes_apex_rds_customizable.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/static_file.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/suds_attr_dict.sql >> /tmp/apex_apps.log
sqlplus APEX_190100/changeme123@${PDB_NAME_ARG} @/tmp/suds_uidefaults.sql >> /tmp/apex_apps.log
