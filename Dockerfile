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
RUN /usr/bin/yum update -y -q && \
/usr/bin/yum install https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm -y -q && \
/usr/bin/yum install gcc-c++ -y -q && \
/usr/bin/yum install wget -y -q

RUN mkdir -p ${ORACLE_HOME_ARG} && \
mkdir -p ${APEX_HOME_ARG} && \
mkdir -p ${ORACLE_DATA_ARG} && \
chown -R oracle:oinstall $(echo ${ORACLE_HOME_ARG} | cut -d/ -f1-2) && \
chown -R oracle:oinstall $(echo ${ORACLE_DATA_ARG} | cut -d/ -f1-2) && \
chmod -R 775 $(echo ${ORACLE_HOME_ARG} | cut -d/ -f1-2) && \
chmod -R 775 $(echo ${ORACLE_DATA_ARG} | cut -d/ -f1-2)

USER oracle
COPY .bashrc /home/oracle/.bashrc
WORKDIR ${ORACLE_HOME_ARG}
RUN /usr/bin/wget ${DB_URL_ARG} -qO ${DB_ZIP_ARG}
# COPY LINUX.X64_180000_db_home.zip ${DB_ZIP_ARG}
RUN /usr/bin/unzip -oq ${DB_ZIP_ARG}
RUN ${ORACLE_HOME_ARG}/runInstaller -ignorePrereq -waitforcompletion -silent \
    oracle.install.option=INSTALL_DB_SWONLY                                    \
    ORACLE_HOSTNAME=${ORACLE_HOSTNAME_ARG}                                     \
    UNIX_GROUP_NAME=oinstall                                                   \
    INVENTORY_LOCATION=${ORA_INVENTORY_ARG}                                    \
    SELECTED_LANGUAGES=en,en_GB                                                \
    ORACLE_HOME=${ORACLE_HOME_ARG}                                             \
    ORACLE_BASE=${ORACLE_BASE_ARG}                                             \
    oracle.install.db.InstallEdition=EE                                        \
    oracle.install.db.OSDBA_GROUP=dba                                          \
    oracle.install.db.OSBACKUPDBA_GROUP=dba                                    \
    oracle.install.db.OSDGDBA_GROUP=dba                                        \
    oracle.install.db.OSKMDBA_GROUP=dba                                        \
    oracle.install.db.OSRACDBA_GROUP=dba                                       \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false                                 \
    DECLINE_SECURITY_UPDATES=true ||                                           \
    sleep 1

USER root
RUN ${ORA_INVENTORY_ARG}/orainstRoot.sh
RUN ${ORACLE_HOME_ARG}/root.sh

USER oracle
WORKDIR ${APEX_HOME_ARG}
RUN /usr/bin/wget ${APEX_URL_ARG} -qO ${APEX_ZIP_ARG}
# COPY apex_19.1_en.zip ${APEX_ZIP_ARG}
RUN /usr/bin/unzip -oq ${APEX_ZIP_ARG}

RUN ${ORACLE_HOME_ARG}/bin/netca /silent /responsefile ${ORACLE_HOME_ARG}/assistants/netca/netca.rsp
RUN echo "LISTENER = \
  (DESCRIPTION_LIST = \
    (DESCRIPTION = \
      (ADDRESS = (PROTOCOL = TCP)(HOST = ${ORACLE_HOSTNAME_ARG})(PORT = ${LISTENER_PORT_ARG})) \
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521)) \
    ) \
  )" > ${ORACLE_HOME_ARG}/network/admin/listener.ora

COPY dbca_silent.sh /tmp/dbca_silent.sh
RUN /bin/bash /tmp/dbca_silent.sh

USER oracle
RUN echo ${CDB_NAME_ARG}:${ORACLE_HOME_ARG}:Y > /etc/oratab
COPY runsql.sh /tmp/runsql.sh
COPY inst_apex.sql /tmp/inst_apex.sql
COPY inst_apex2.sql /tmp/inst_apex2.sql
WORKDIR ${APEX_HOME_ARG}/apex
RUN /bin/bash /tmp/runsql.sh
EXPOSE ${LISTENER_PORT_ARG}
COPY startupdb /tmp/startupdb
CMD ["/bin/bash","/tmp/startupdb"]
