#source oracle environment variables ORACLE_HOME/ORACLE_SID..
source ~/.bashrc

#create Apex tablespace and install Apex, reset password for some default accounts.  3 parameters passed to inst_apex.sql
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba @/tmp/inst_apex.sql ${PDB_NAME_ARG} ${ORACLE_DATA_ARG}
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba @/tmp/inst_apex2.sql ${PDB_NAME_ARG} ${APEX_HOME_ARG}
#configure Oracle REST Data Service
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
alter session set container=&1;
$PDB_NAME
@apex_rest_config.sql ApexOrdsPass1 ApexOrdsPass1
exit;
EOF

#reset password and unlock APEX_190100
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
alter session set container=&1;
$PDB_NAME
alter user APEX_190100 identified by changeme123 account unlock;
exit;
EOF
