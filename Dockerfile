FROM centos
RUN ["/usr/bin/yum","update","-y","-q"]
RUN ["/usr/bin/yum","install","https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm","-y","-q"]
RUN ["/usr/bin/yum","install","gcc-c++","-y","-q"]
RUN ["/usr/bin/yum","install","wget","-y","-q"]
COPY cr_directories /tmp/cr_directories
RUN ["/bin/bash","/tmp/cr_directories"]
COPY .bashrc /home/oracle/.bashrc

USER oracle
ARG DB_ZIP="https://www.dropbox.com/s/wg5wtn2ldnu5jyd/LINUX.X64_180000_db_home.zip?dl=0"
ARG APEX_ZIP="https://www.dropbox.com/s/0pegveyvlimafym/apex_19.1_en.zip?dl=0"
RUN /usr/bin/wget ${DB_ZIP} -qO /tmp/LINUX.X64_180000_db_home.zip
WORKDIR /u01/app/oracle/product/18.0.0/dbhome_1
RUN ["/usr/bin/unzip","-oq","/tmp/LINUX.X64_180000_db_home.zip"]
COPY runInstaller_silent /tmp/runInstaller_silent
RUN ["/bin/bash","/tmp/runInstaller_silent"]

USER root
RUN ["/u01/app/oraInventory/orainstRoot.sh"]
RUN ["/u01/app/oracle/product/18.0.0/dbhome_1/root.sh"]

USER oracle
RUN /usr/bin/wget ${APEX_ZIP} -qO /tmp/apex_19.1_en.zip
RUN ["mkdir","/u01/app/oracle/apex19"]
WORKDIR /u01/app/oracle/apex19
RUN ["/usr/bin/unzip","-oq","/tmp/apex_19.1_en.zip"]
COPY netca_silent /tmp/netca_silent
RUN ["/bin/bash","/tmp/netca_silent"]
COPY listener.ora /u01/app/oracle/product/18.0.0/dbhome_1/network/admin/listener.ora
COPY dbca_silent /tmp/dbca_silent
RUN ["/bin/bash","/tmp/dbca_silent"]
COPY oratab /etc/oratab
COPY runsql /tmp/runsql
COPY inst_apex.sql /tmp/inst_apex.sql
WORKDIR /u01/app/oracle/apex19/apex
RUN ["/bin/bash","/tmp/runsql"]
EXPOSE 1521
COPY startupdb /tmp/startupdb
CMD ["/bin/bash","/tmp/startupdb"]
