/*1. Create a tablespace with name 'quiz3' and two datafiles. Each datafile of 50Mb.
2. Create a profile with 5 attempts to lock the password, the name of the profile should be 'estudiante_quiz'
3. Create an user named "carlos_1" with password "carlos_1". 
	- The user should be able to connect
	- The user should has the profile "estudiante_quiz"
	- The user should be associated to the tablespace "quiz3"
	- The user should be able to create tables WITHOUT USING THE DBA ROLE. 
4. Create an user named "user2" with password "user2"
	- The user should be able to connect
	- The user should has the profile "estudiante_quiz"
	- The user should be associated to the tablespace "quiz3"
	- The user shouldn't be able to create tables.*/


CREATE TABLESPACE quiz3
datafile 'quiz3One.dbf' SIZE 50M,
'quiz3Two.dbf' SIZE 50M
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO
ONLINE;

-- select * from dba_data_files

CREATE PROFILE estudiante_quiz LIMIT
CPU_PER_SESSION UNLIMITED
CPU_PER_CALL UNLIMITED
CONNECT_TIME 240
IDLE_TIME 25
PASSWORD_LOCK_TIME 5;


CREATE USER carlos_1
IDENTIFIED BY carlos_1
DEFAULT TABLESPACE quiz3
QUOTA 50m ON quiz3
PROFILE estudiante_quiz;
GRANT  create table TO carlos_1;

GRANT CONNECT TO carlos_1;

CREATE USER user2
IDENTIFIED BY user2
DEFAULT TABLESPACE quiz3
QUOTA 50m ON quiz3
PROFILE estudiante_quiz;
GRANT  SELECT table TO user2;









