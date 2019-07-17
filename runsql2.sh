#source oracle environment variables ORACLE_HOME/ORACLE_SID..
source /home/oracle/.bashrc

#create SUDS tablespace and user
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba @/tmp/suds-db-user.sql
#create DDL
export TWO_TASK="(DESCRIPTION=(ADDRESS=(PROTOCOL=BEQ) (PROGRAM=oracle) (ARGS='(DESCRIPTION=(ADDRESS=(PROTOCOL=BEQ)))')) (CONNECT_DATA=(SERVICE_name=pdb1)))"
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn suds/suds
@/tmp/export.sql
EOF

#import SUDS WORKSPACE
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/SUDS.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/f9205.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/css.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/dynamic_action_plugin_com_clarifit_apexplugin_ir_column_grouping.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/f9205_img.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/item_type_plugin_com_af_plugin_jq_fileupload.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/region_type_plugin_com_af_plugin_jq_menu.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/region_type_plugin_com_blogspot_apexnotes_apex_rds_customizable.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/static_file.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/suds_attr_dict.sql
EOF

${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
conn APEX_190100/changeme123
@/tmp/suds_uidefaults.sql
EOF
