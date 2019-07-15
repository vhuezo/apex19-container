# dbserv1-dockerhub

Oracle database 18c/Apex 19.1

How Oracle Apex containers work?  
The whole thing consists of 2 containers:  
henryhhl18/apexdb - Oracle 18c and Apex 19.1  
henryhhl18/ords - Tomcat and pre-built ORDS java web application  

How to use this container?  

Launch from Windows powershell  
Start-BitsTransfer -Source "https://gist.githubusercontent.com/henryliu18/9b9b6ae7361a3d2425ffc702d00f376a/raw/d61191fc9d1af5217ac7b76249a47221bf743ad4/docker-compose" -Destination "docker-compose.yml"  
docker-compose up -d

Launch from Linux  
wget https://gist.githubusercontent.com/henryliu18/9b9b6ae7361a3d2425ffc702d00f376a/raw/d61191fc9d1af5217ac7b76249a47221bf743ad4/docker-compose -O ./docker-compose.yml  
docker-compose up -d

Persistent database storage (Use -v to create/mount persistent volume apexdb_u02 on Docker VM to apexdb container's mount point /u02)  
-v apexdb_u02:/u02 -v apexdb_u01:/u01

Apex 19.1 Login page http://localhost:8080/ords  

Workspace: INTERNAL  
Username: ADMIN  
Password: changeme123  
