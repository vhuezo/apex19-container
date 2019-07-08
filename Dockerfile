FROM centos
ARG ORACLE_HOME_BUILD="/u01/app/oracle/product/18.0.0/dbhome_1"
ARG APEX_HOME_BUILD="/u01/app/oracle/apex19"
ARG ORACLE_DATA_BUILD="/u02/oradata"
ARG ORA_INVENTORY_BUILD="/u01/app/oraInventory"
ARG DB_URL="https://www.dropbox.com/s/wg5wtn2ldnu5jyd/LINUX.X64_180000_db_home.zip?dl=0"
ARG DB_ZIP="/tmp/LINUX.X64_180000_db_home.zip"
ARG APEX_URL="https://www.dropbox.com/s/0pegveyvlimafym/apex_19.1_en.zip?dl=0"
ARG APEX_ZIP="/tmp/apex_19.1_en.zip"
RUN /usr/bin/yum update -y -q && \
  /usr/bin/yum install https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm -y -q && \
  /usr/bin/yum install gcc-c++ -y -q && \
  /usr/bin/yum install wget -y -q

RUN mkdir -p ${ORACLE_HOME_BUILD} && \
mkdir -p ${APEX_HOME_BUILD} && \
mkdir -p ${ORACLE_DATA_BUILD} && \
chown -R oracle:oinstall /u01 /u02 && \
chmod -R 775 /u01 /u02
COPY .bashrc /home/oracle/.bashrc

USER oracle

RUN /usr/bin/wget ${DB_URL} -qO ${DB_ZIP}
WORKDIR ${ORACLE_HOME_BUILD}
RUN /usr/bin/unzip -oq ${DB_ZIP}
#COPY runInstaller_silent /tmp/runInstaller_silent
#RUN ["/bin/bash","/tmp/runInstaller_silent"]
RUN ${ORACLE_HOME_BUILD}/runInstaller -ignorePrereq -waitforcompletion -silent \
    oracle.install.option=INSTALL_DB_SWONLY                                    \
    ORACLE_HOSTNAME=dbserv1                                                    \
    UNIX_GROUP_NAME=oinstall                                                   \
    INVENTORY_LOCATION=${ORA_INVENTORY_BUILD}                                  \
    SELECTED_LANGUAGES=en,en_GB                                                \
    ORACLE_HOME=${ORACLE_HOME_BUILD}                                           \
    ORACLE_BASE=/u01/app/oracle                                                \
    oracle.install.db.InstallEdition=EE                                        \
    oracle.install.db.OSDBA_GROUP=dba                                          \
    oracle.install.db.OSBACKUPDBA_GROUP=dba                                    \
    oracle.install.db.OSDGDBA_GROUP=dba                                        \
    oracle.install.db.OSKMDBA_GROUP=dba                                        \
    oracle.install.db.OSRACDBA_GROUP=dba                                       \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false                                 \
    DECLINE_SECURITY_UPDATES=true || \
    sleep 1

USER root
RUN ${ORA_INVENTORY_BUILD}/orainstRoot.sh
RUN ${ORACLE_HOME_BUILD}/root.sh

USER oracle
RUN /usr/bin/wget ${APEX_URL} -qO ${APEX_ZIP}
WORKDIR ${APEX_HOME_BUILD}
RUN /usr/bin/unzip -oq ${APEX_ZIP}

# COPY netca_silent /tmp/netca_silent
# RUN ["/bin/bash","/tmp/netca_silent"]
RUN ${ORACLE_HOME_BUILD}/bin/netca /silent /responsefile ${ORACLE_HOME_BUILD}/assistants/netca/netca.rsp

COPY listener.ora ${ORACLE_HOME_BUILD}/network/admin/listener.ora

# COPY dbca_silent /tmp/dbca_silent
# RUN ["/bin/bash","/tmp/dbca_silent"]
RUN ${ORACLE_HOME_BUILD}/bin/dbca -silent -createDatabase \
-templateName General_Purpose.dbc \
-gdbname cdb1 \
-sid cdb1 \
-responseFile NO_VALUE \
-characterSet AL32UTF8 \
-sysPassword SysPassword1 \
-systemPassword SysPassword1 \
-createAsContainerDatabase true \
-numberOfPDBs 1 \
-pdbName pdb1 \
-pdbAdminPassword PdbPassword1 \
-databaseType MULTIPURPOSE \
-automaticMemoryManagement false \
-totalMemory 1500 \
-storageType FS \
-datafileDestination ${ORACLE_DATA_BUILD} \
-redoLogFileSize 50 \
-emConfiguration NONE \
-ignorePreReqs

COPY oratab /etc/oratab
COPY runsql /tmp/runsql
COPY inst_apex.sql /tmp/inst_apex.sql
WORKDIR ${APEX_HOME_BUILD}/apex
RUN /bin/bash /tmp/runsql
EXPOSE 1521
COPY startupdb /tmp/startupdb
CMD ["/bin/bash","/tmp/startupdb"]
