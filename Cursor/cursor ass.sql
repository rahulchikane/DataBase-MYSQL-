Q1

DELIMITER $$
CREATE PROCEDURE SP_EANALYS()
BEGIN
DECLARE V_ENAME VARCHAR(50) ;
DECLARE V_SAL INT;
declare v_finish int default 0;
DECLARE C1 CURSOR FOR SELECT ENAME,SAL FROM EMP WHERE JOB='ANALYST';
declare continue handler for NOT FOUND  SET v_finish = 1;
open c1;
get_emp : LOOP
fetch c1 into V_ENAME,V_SAL;
if v_finish=1 then
leave get_emp;
end if;
select CONCAT(V_ENAME,V_SAL);
end loop get_emp; 
close c1;
END $$
DELIMITER ;

CALL SP_EANALYS()

Q2
DELIMITER $$
CREATE PROCEDURE SP_TOP55()
BEGIN
DECLARE V_ENAME VARCHAR(50) ;
DECLARE V_SAL INT;
declare v_finish int default 0;
DECLARE C1 CURSOR FOR SELECT ENAME,SAL FROM EMP ORDER BY SAL DESC LIMIT 5;
declare continue handler for NOT FOUND  SET v_finish = 1;
open c1;
get_emp : LOOP
fetch c1 into V_ENAME,V_SAL;
if v_finish=1 then
leave get_emp;
end if;
select CONCAT(V_ENAME,V_SAL);
end loop get_emp; 
close c1;
END $$

CALL SP_TOP55()

Q3
delimiter $$
create procedure namelastname2()
begin
declare v_ename varchar(50);
declare v_Lastname varchar(50);
declare v_finish int default  0;
declare c1 cursor for select ename,last_name from emp;
declare continue handler for not found set v_finish=1;
open c1;
get_ena : LOOP
fetch c1 into v_ename,v_lastname;
if v_finish=1 then
leave get_ena;
end if;
select CONCAT(v_ename,v_lastname);
end loop get_ena; 
close c1;
END $$
DELIMITER ;

call namelastname2();

Q4
DELIMITER $$
CREATE PROCEDURE SP_TOP55()
BEGIN
DECLARE V_ENAME VARCHAR(50) ;
DECLARE V_SAL INT;
declare v_finish int default 0;
DECLARE C1 CURSOR FOR SELECT * FROM EMP WHERE ENAME = 'MANISH';
declare continue handler for NOT FOUND  SET v_finish = 1;
open c1;
get_emp : LOOP
fetch c1 into V_ENAME,V_SAL;
if v_finish=1 then
leave get_emp;
end if;
select CONCAT(V_ENAME,V_SAL);
end loop get_emp; 
close c1;
END $$

call SP_TOP55();

Q5
 DELIMITER $$
CREATE PROCEDURE DELEMP()
BEGIN
DECLARE LLEMPNO numeric(4) DEFAULT 0;
DECLARE ERR INT  DEFAULT 0;

DECLARE DELEMPNO CURSOR FOR SELECT EMPNO FROM EMP WHERE SAL<10000;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET ERR=1;

OPEN DELEMPNO;
     TEST:LOOP
        FETCH DELEMPNO  INTO LLEMPNO;
        IF ERR=1 THEN 
           LEAVE TEST;
		END IF;
       DELETE FROM EMP WHERE EMPNO=LLEMPNO;
    END LOOP TEST;
CLOSE DELEMPNO;
END $$
CALL DELEMP();






