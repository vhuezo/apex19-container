ALTER PLUGGABLE DATABASE &1 OPEN READ WRITE;
ALTER PLUGGABLE DATABASE &1 SAVE STATE;
alter session set container=&1;
ALTER SYSTEM SET db_create_file_dest = '/u02/oradata';
CREATE TABLESPACE APEX_TABLESPACE DATAFILE SIZE 100M AUTOEXTEND ON NEXT 100M;
-- @apexins.sql tablespace_apex tablespace_files tablespace_temp images
@apexins.sql APEX_TABLESPACE APEX_TABLESPACE TEMP /i/
BEGIN
    APEX_UTIL.set_security_group_id( 10 );
    
    APEX_UTIL.create_user(
        p_user_name       => 'ADMIN',
        p_email_address   => 'me@example.com',
        p_web_password    => 'changeme123',
        p_developer_privs => 'ADMIN' );
        
    APEX_UTIL.set_security_group_id( null );
    COMMIT;
END;
/
@apex_epg_config.sql /u01/app/oracle/apex19
conn / as sysdba
DECLARE
  l_passwd VARCHAR2(40);
BEGIN
  l_passwd := DBMS_RANDOM.string('a',10) || DBMS_RANDOM.string('x',10) || '1#';
  -- Remove CONTAINER=ALL for non-CDB environments.
  EXECUTE IMMEDIATE 'ALTER USER anonymous IDENTIFIED BY ' || l_passwd || ' ACCOUNT UNLOCK CONTAINER=ALL';
END;
/
alter session set container=&1;
ALTER USER APEX_PUBLIC_USER ACCOUNT UNLOCK;
ALTER USER APEX_PUBLIC_USER IDENTIFIED BY ApexOrdsPass1;
BEGIN
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
host => '*',
ace => xs$ace_type(privilege_list => xs$name_list('connect'),
principal_name => 'APEX_190100',
principal_type => xs_acl.ptype_db));
END;
/
BEGIN
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
host => 'localhost',
ace => xs$ace_type(privilege_list => xs$name_list('connect'),
principal_name => 'APEX_190100',
principal_type => xs_acl.ptype_db));
END;
/
exit
