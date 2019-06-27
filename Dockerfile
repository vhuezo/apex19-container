FROM centos
RUN ["/usr/bin/yum","update","-y"]
RUN ["/usr/bin/yum","install","https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm","-y"]
RUN ["/usr/bin/yum","install","gcc-c++","-y"]
RUN ["/usr/bin/yum","install","wget","-y"]
COPY cr_directories /tmp/cr_directories
RUN ["/bin/bash","/tmp/cr_directories"]
COPY .bashrc /home/oracle/.bashrc

USER oracle
COPY LINUX.X64_180000_db_home.zip /tmp/LINUX.X64_180000_db_home.zip
WORKDIR /u01/app/oracle/product/18.0.0/dbhome_1
RUN ["/usr/bin/unzip","-oq","/tmp/LINUX.X64_180000_db_home.zip"]
COPY runInstaller_silent /tmp/runInstaller_silent
RUN ["/bin/bash","/tmp/runInstaller_silent"]

USER root
RUN ["/u01/app/oraInventory/orainstRoot.sh"]
RUN ["/u01/app/oracle/product/18.0.0/dbhome_1/root.sh"]

USER oracle
COPY apex_19.1_en.zip /tmp/apex_19.1_en.zip
RUN ["mkdir","/u01/app/oracle/apex19"]
WORKDIR /u01/app/oracle/apex19
RUN ["/usr/bin/unzip","/tmp/apex_19.1_en.zip"]
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
