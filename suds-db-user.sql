alter session set container=pdb1;
create tablespace SUDS datafile size 100M AUTOEXTEND ON NEXT 10G, size 100M AUTOEXTEND ON NEXT 10G, size 100M AUTOEXTEND ON NEXT 10G, size 100M AUTOEXTEND ON NEXT 10G, size 100M AUTOEXTEND ON NEXT 10G, size 100M AUTOEXTEND ON NEXT 10G, size 100M AUTOEXTEND ON NEXT 10G;
create user suds identified by suds default tablespace SUDS;
grant unlimited tablespace to suds;
grant dba to suds;
exit;
