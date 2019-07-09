#source oracle environment variables ORACLE_HOME/ORACLE_SID..
source /home/oracle/.bashrc
#start db instance and listener
${ORACLE_HOME_ARG}/bin/dbstart ${ORACLE_HOME_ARG}
#sleep for 10 seconds
sleep 10
#create Apex tablespace and install Apex, reset password for some default accounts
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba @/tmp/inst_apex.sql ${PDB_NAME_ARG}
#configure Oracle REST Data Service
${ORACLE_HOME_ARG}/bin/sqlplus / as sysdba<<EOF
alter session set container=&1;
$PDB_NAME
@apex_rest_config.sql ApexOrdsPass1 ApexOrdsPass1
exit;
EOF
