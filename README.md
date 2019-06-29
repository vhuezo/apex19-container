# dbserv1-dockerhub

Oracle database 18c with Apex 19.1 configured  

How to run container  

LOCAL XDB MODE  
docker container run -d --hostname dbserv1 --name dbserv1 -p 8080:8080 --env LOCAL=Y henryhhl18/apexdb  

2 TIER MODE (Tomcat as web tier)  
docker container run -d --hostname dbserv1 --name dbserv1 henryhhl18/apexdb  
