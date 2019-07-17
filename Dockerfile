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
RUN echo -e "# .bashrc\n\n# Source global definitions\nif [ -f /etc/bashrc ]; then\n        . /etc/bashrc\nfi\n\n# Uncomment the following line if you don't like systemctl's auto-paging feature:\n# export SYSTEMD_PAGER=\n\n# User specific aliases and functions\n\n# Oracle Settings\nexport TMP=/tmp\nexport TMPDIR=\$TMP\n\nexport ORACLE_HOSTNAME=${ORACLE_HOSTNAME_ARG}\nexport ORACLE_UNQNAME=${CDB_NAME_ARG}\nexport ORACLE_BASE=${ORACLE_BASE_ARG}\nexport ORACLE_HOME=${ORACLE_HOME_ARG}\nexport ORA_INVENTORY=${ORA_INVENTORY_ARG}\nexport ORACLE_SID=${CDB_NAME_ARG}\nexport PDB_NAME=${PDB_NAME_ARG}\nexport DATA_DIR=${ORACLE_DATA_ARG}\n\nexport PATH=/usr/sbin:/usr/local/bin:\$PATH\nexport PATH=\$ORACLE_HOME/bin:\$PATH\n\nexport LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib\nexport CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib\n" > ~/.bashrc
WORKDIR ${ORACLE_HOME_ARG}
# RUN time /usr/bin/wget ${DB_URL_ARG} -qO ${DB_ZIP_ARG}
COPY LINUX.X64_180000_db_home.zip ${DB_ZIP_ARG}
RUN /usr/bin/unzip -oq ${DB_ZIP_ARG}
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

USER root
RUN ${ORA_INVENTORY_ARG}/orainstRoot.sh
RUN ${ORACLE_HOME_ARG}/root.sh

USER ${ORACLE_USER_ARG}
WORKDIR ${APEX_HOME_ARG}
# RUN time /usr/bin/wget ${APEX_URL_ARG} -qO ${APEX_ZIP_ARG}
COPY apex_19.1_en.zip ${APEX_ZIP_ARG}
RUN /usr/bin/unzip -oq ${APEX_ZIP_ARG}

RUN ${ORACLE_HOME_ARG}/bin/netca /silent /responsefile ${ORACLE_HOME_ARG}/assistants/netca/netca.rsp
RUN echo -e "LISTENER = \n  (DESCRIPTION_LIST = \n    (DESCRIPTION = \n      (ADDRESS = (PROTOCOL = TCP)(HOST = ${ORACLE_HOSTNAME_ARG})(PORT = ${LISTENER_PORT_ARG}))\n      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))\n    )\n  )\n" > ${ORACLE_HOME_ARG}/network/admin/listener.ora

COPY dbca_silent.sh /tmp/dbca_silent.sh
RUN /bin/bash /tmp/dbca_silent.sh

USER ${ORACLE_USER_ARG}
RUN echo ${CDB_NAME_ARG}:${ORACLE_HOME_ARG}:Y > /etc/oratab
COPY runsql.sh /tmp/runsql.sh
COPY inst_apex.sql /tmp/inst_apex.sql
COPY inst_apex2.sql /tmp/inst_apex2.sql
WORKDIR ${APEX_HOME_ARG}/apex
RUN /bin/bash /tmp/runsql.sh
COPY tnsnames.ora ${ORACLE_HOME_ARG}/network/admin/tnsnames.ora
COPY css.sql /tmp
COPY dynamic_action_plugin_com_clarifit_apexplugin_ir_column_grouping.sql /tmp
COPY export.sql /tmp
COPY f9205_img.sql /tmp
COPY f9205_theme_1.sql /tmp
COPY f9205_theme_11.sql /tmp
COPY f9205_theme_17.sql /tmp
COPY f9205_theme_20.sql /tmp
COPY f9205_theme_21.sql /tmp
COPY f9205_theme_23.sql /tmp
COPY f9205.sql /tmp
COPY item_type_plugin_com_af_plugin_jq_fileupload.sql /tmp
COPY region_type_plugin_com_af_plugin_jq_menu.sql /tmp
COPY region_type_plugin_com_blogspot_apexnotes_apex_rds_customizable.sql /tmp
COPY static_file.sql /tmp
COPY suds_attr_dict.sql /tmp
COPY suds_uidefaults.sql /tmp
COPY suds-db-user.sql /tmp
COPY SUDS.sql /tmp
RUN /bin/bash /tmp/runsql2.sh

EXPOSE ${LISTENER_PORT_ARG}
COPY startupdb /tmp/startupdb
CMD ["/bin/bash","/tmp/startupdb"]
