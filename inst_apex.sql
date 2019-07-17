ALTER PLUGGABLE DATABASE &1 OPEN READ WRITE;
ALTER PLUGGABLE DATABASE &1 SAVE STATE;
alter session set container=&1;
ALTER SYSTEM SET db_create_file_dest = '&2';
CREATE TABLESPACE APEX_TABLESPACE DATAFILE SIZE 100M AUTOEXTEND ON NEXT 100M, SIZE 100M AUTOEXTEND ON NEXT 100M, SIZE 100M AUTOEXTEND ON NEXT 100M;
ALTER TABLESPACE TEMP ADD TEMPFILE SIZE 10G, SIZE 10G, SIZE 10G;
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
exit
