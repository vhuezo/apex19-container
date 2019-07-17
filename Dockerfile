FROM centos AS stage1
ARG ORACLE_HOME_ARG="/u01/app/oracle/product/18.0.0/dbhome_1"
ARG APEX_HOME_ARG="/u01/app/oracle/apex19"
ARG ORACLE_DATA_ARG="/u02/oradata"
ARG ORA_INVENTORY_ARG="/u01/app/oraInventory"
ARG DB_URL_ARG="https://www.dropbox.com/s/ltp2qo4vwycur3s/LINUX.X64_180000_db_home.zip?dl=0"
ARG DB_ZIP_ARG="/tmp/LINUX.X64_180000_db_home.zip"
ARG APEX_URL_ARG="https://www.dropbox.com/s/q998t8oiu6uxfjw/apex_19.1_en.zip?dl=0"
ARG APEX_ZIP_ARG="/tmp/apex_19.1_en.zip"
ARG CDB_NAME_ARG="cdb1"
ARG PDB_NAME_ARG="pdb1"
ARG ORACLE_HOSTNAME_ARG="dbserv1"
ARG ORACLE_BASE_ARG="/u01/app/oracle"
ARG LISTENER_PORT_ARG="1521"
ARG ORACLE_USER_ARG="oracle"
ARG ORACLE_GROUP_ARG="oinstall"

#Copy required files to /tmp/
COPY LINUX.X64_180000_db_home.zip apex_19.1_en.zip dbca_silent.sh runsql.sh inst_apex.sql inst_apex2.sql css.sql dynamic_action_plugin_com_clarifit_apexplugin_ir_column_grouping.sql export.sql f9205_img.sql f9205_theme_1.sql f9205_theme_11.sql f9205_theme_17.sql f9205_theme_20.sql f9205_theme_21.sql f9205_theme_23.sql f9205.sql item_type_plugin_com_af_plugin_jq_fileupload.sql region_type_plugin_com_af_plugin_jq_menu.sql region_type_plugin_com_blogspot_apexnotes_apex_rds_customizable.sql static_file.sql suds_attr_dict.sql suds_uidefaults.sql suds-db-user.sql SUDS.sql runsql2.sh startupdb /tmp/

#Install required packages and tools
RUN /usr/bin/yum update -y -q && \
/usr/bin/yum install https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm -y -q && \
/usr/bin/yum install gcc-c++ -y -q && \
/usr/bin/yum install wget -y -q

#Create/chown/chmod directories for Oracle and Apex software and Oracle database files
RUN mkdir -p ${ORACLE_HOME_ARG} && \
mkdir -p ${APEX_HOME_ARG} && \
mkdir -p ${ORACLE_DATA_ARG} && \
chown -R ${ORACLE_USER_ARG}:${ORACLE_GROUP_ARG} $(echo ${ORACLE_HOME_ARG} | cut -d/ -f1-2) && \
chown -R ${ORACLE_USER_ARG}:${ORACLE_GROUP_ARG} $(echo ${ORACLE_DATA_ARG} | cut -d/ -f1-2) && \
chmod -R 775 $(echo ${ORACLE_HOME_ARG} | cut -d/ -f1-2) && \
chmod -R 775 $(echo ${ORACLE_DATA_ARG} | cut -d/ -f1-2)

USER ${ORACLE_USER_ARG}

#Create oracle .bashrc
RUN echo -e "# .bashrc\n\n# Source global definitions\nif [ -f /etc/bashrc ]; then\n        . /etc/bashrc\nfi\n\n# Uncomment the following line if you don't like systemctl's auto-paging feature:\n# export SYSTEMD_PAGER=\n\n# User specific aliases and functions\n\n# Oracle Settings\nexport TMP=/tmp\nexport TMPDIR=\$TMP\n\nexport ORACLE_HOSTNAME=${ORACLE_HOSTNAME_ARG}\nexport ORACLE_UNQNAME=${CDB_NAME_ARG}\nexport ORACLE_BASE=${ORACLE_BASE_ARG}\nexport ORACLE_HOME=${ORACLE_HOME_ARG}\nexport ORA_INVENTORY=${ORA_INVENTORY_ARG}\nexport ORACLE_SID=${CDB_NAME_ARG}\nexport PDB_NAME=${PDB_NAME_ARG}\nexport DATA_DIR=${ORACLE_DATA_ARG}\n\nexport PATH=/usr/sbin:/usr/local/bin:\$PATH\nexport PATH=\$ORACLE_HOME/bin:\$PATH\n\nexport LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib\nexport CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib\n" > ~/.bashrc

#Unzip DB software
RUN /usr/bin/unzip ${DB_ZIP_ARG} -d ${ORACLE_HOME_ARG} > /dev/null

#Install DB software
RUN ${ORACLE_HOME_ARG}/runInstaller -ignorePrereq -waitforcompletion -silent \
    oracle.install.option=INSTALL_DB_SWONLY                                  \
    ORACLE_HOSTNAME=${ORACLE_HOSTNAME_ARG}                                   \
    UNIX_GROUP_NAME=${ORACLE_GROUP_ARG}                                      \
    INVENTORY_LOCATION=${ORA_INVENTORY_ARG}                                  \
    SELECTED_LANGUAGES=en,en_GB                                              \
    ORACLE_HOME=${ORACLE_HOME_ARG}                                           \
    ORACLE_BASE=${ORACLE_BASE_ARG}                                           \
    oracle.install.db.InstallEdition=EE                                      \
    oracle.install.db.OSDBA_GROUP=dba                                        \
    oracle.install.db.OSBACKUPDBA_GROUP=dba                                  \
    oracle.install.db.OSDGDBA_GROUP=dba                                      \
    oracle.install.db.OSKMDBA_GROUP=dba                                      \
    oracle.install.db.OSRACDBA_GROUP=dba                                     \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false                               \
    DECLINE_SECURITY_UPDATES=true ||                                         \
    sleep 1

#Execute post scripts by root
USER root
RUN ${ORA_INVENTORY_ARG}/orainstRoot.sh
RUN ${ORACLE_HOME_ARG}/root.sh

USER ${ORACLE_USER_ARG}
#Unzip Apex
RUN /usr/bin/unzip ${APEX_ZIP_ARG} -d ${APEX_HOME_ARG} > /dev/null

#Create and start Listener
RUN ${ORACLE_HOME_ARG}/bin/netca /silent /responsefile ${ORACLE_HOME_ARG}/assistants/netca/netca.rsp

#Create DB -> install Apex -> import SUDS schema and workspace
WORKDIR ${APEX_HOME_ARG}/apex
RUN /bin/bash /tmp/dbca_silent.sh && /bin/bash /tmp/runsql.sh && /bin/bash /tmp/runsql2.sh

#Create listener.ora
RUN echo -e "LISTENER = \n  (DESCRIPTION_LIST = \n    (DESCRIPTION = \n      (ADDRESS = (PROTOCOL = TCP)(HOST = ${ORACLE_HOSTNAME_ARG})(PORT = ${LISTENER_PORT_ARG}))\n      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))\n    )\n  )\n" > ${ORACLE_HOME_ARG}/network/admin/listener.ora

#Create oratab
RUN echo ${CDB_NAME_ARG}:${ORACLE_HOME_ARG}:Y > /etc/oratab

#Create tnsnames.ora
COPY --chown=oracle:oinstall tnsnames.ora ${ORACLE_HOME_ARG}/network/admin/tnsnames.ora
EXPOSE ${LISTENER_PORT_ARG}
CMD ["/bin/bash","/tmp/startupdb"]

#FINAL IMAGE BUILD STARTS HERE
FROM centos
ARG ORACLE_HOME_ARG="/u01/app/oracle/product/18.0.0/dbhome_1"
ARG APEX_HOME_ARG="/u01/app/oracle/apex19"
ARG ORACLE_DATA_ARG="/u02/oradata"
ARG ORA_INVENTORY_ARG="/u01/app/oraInventory"
ARG DB_URL_ARG="https://www.dropbox.com/s/ltp2qo4vwycur3s/LINUX.X64_180000_db_home.zip?dl=0"
ARG DB_ZIP_ARG="/tmp/LINUX.X64_180000_db_home.zip"
ARG APEX_URL_ARG="https://www.dropbox.com/s/q998t8oiu6uxfjw/apex_19.1_en.zip?dl=0"
ARG APEX_ZIP_ARG="/tmp/apex_19.1_en.zip"
ARG CDB_NAME_ARG="cdb1"
ARG PDB_NAME_ARG="pdb1"
ARG ORACLE_HOSTNAME_ARG="dbserv1"
ARG ORACLE_BASE_ARG="/u01/app/oracle"
ARG LISTENER_PORT_ARG="1521"
ARG ORACLE_USER_ARG="oracle"
ARG ORACLE_GROUP_ARG="oinstall"
RUN /usr/bin/yum update -y -q && \
/usr/bin/yum install https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm -y -q && \
/usr/bin/yum install gcc-c++ -y -q && \
/usr/bin/yum install wget -y -q

RUN mkdir -p ${ORACLE_HOME_ARG} && \
mkdir -p ${APEX_HOME_ARG} && \
mkdir -p ${ORACLE_DATA_ARG} && \
chown -R ${ORACLE_USER_ARG}:${ORACLE_GROUP_ARG} $(echo ${ORACLE_HOME_ARG} | cut -d/ -f1-2) && \
chown -R ${ORACLE_USER_ARG}:${ORACLE_GROUP_ARG} $(echo ${ORACLE_DATA_ARG} | cut -d/ -f1-2) && \
chmod -R 775 $(echo ${ORACLE_HOME_ARG} | cut -d/ -f1-2) && \
chmod -R 775 $(echo ${ORACLE_DATA_ARG} | cut -d/ -f1-2)

USER ${ORACLE_USER_ARG}
COPY --from=stage1 --chown=oracle:oinstall /home/oracle/.bashrc /home/oracle/.bashrc
COPY --from=stage1 --chown=oracle:oinstall /u01/ /u01/

USER root
RUN ${ORA_INVENTORY_ARG}/orainstRoot.sh
RUN ${ORACLE_HOME_ARG}/root.sh

USER ${ORACLE_USER_ARG}
COPY --from=stage1 --chown=oracle:oinstall /u02/ /u02/
COPY --from=stage1 --chown=oracle:oinstall /etc/oratab /etc/oratab
RUN echo -e "LISTENER = \n  (DESCRIPTION_LIST = \n    (DESCRIPTION = \n      (ADDRESS = (PROTOCOL = TCP)(HOST = ${ORACLE_HOSTNAME_ARG})(PORT = ${LISTENER_PORT_ARG}))\n      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))\n    )\n  )\n" > ${ORACLE_HOME_ARG}/network/admin/listener.ora
EXPOSE ${LISTENER_PORT_ARG}
COPY startupdb /tmp/startupdb
CMD ["/bin/bash","/tmp/startupdb"]
