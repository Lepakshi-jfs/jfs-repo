create table test2(c1 char(10) primary key, c2 char(10),  c3 char(10));
create table test3(c1 char(10) unique, c2 char(10),  c3 char(10));
insert into test3 (c1,c2, c3) values ('d','null', 'c');
select * from test3;
commit;
select * from test3;
delete from test3;
rollback;

insert into test2 (c1,c2, c3) values ('b','null', 'c');
select * from test2;
insert into test2 (c1,c2, c3) values (null,'null', 'c');
insert into test2 (c1,c2, c3) values ('null','null', 'c');
delete from test2;


create table test(c1 char(10), c2 char(10),  c3 char(10));
insert into test values('a','b','c');
insert into test (c1, c3) values ('a','c');

create table test1(c1 char(10), c2 char(10) not null,  c3 char(10));
insert into test1 (c1,c2, c3) values ('b','null', 'c');

update test1 set c1 = 'changed';
select * from test1;
delete from test1 where c1='b';
update test1 set c2 = 'changed' where c1='b';
select * from test;
SELECT commission_pct FROM EMPLOYEES;

SELECT commission_pct,NVL(commission_pct,1000) FROM EMPLOYEES;
SELECT JOB_ID FROM EMPLOYEES;
DESC EMPLOYEES;

SELECT SALARY, commission_pct, salary*12, salary*12* commission_pct ,
(salary*12*NVL(commission_pct, 0)) AS "COMPUTED" FROM  EMPLOYEES
ORDER BY COMPUTED DESC;

SELECT SALARY, commission_pct, salary*12, salary*12* commission_pct ,
(salary*12*NVL(commission_pct, 0)) AS "COMPUTED" FROM  EMPLOYEES
ORDER BY (salary*12*NVL(commission_pct, 0)) DESC;

SELECT last_name, salary, commission_pct,
NVL2(commission_pct,
'SAL+COMM', 'SAL') income
FROM employees WHERE department_id IN (50, 80);

SELECT last_name, salary, commission_pct,
NVL2(commission_pct,
salary, 0) income
FROM employees WHERE department_id IN (50, 80);

-- TRY IT
SELECT last_name, salary, commission_pct,
NVL2(commission_pct,
SALARY, 'NO SALARY') income
FROM employees WHERE department_id IN (50, 80);

SELECT NULLIF(5+5,5+5) FROM DUAL;
SELECT NULLIF(5+50,5+5) FROM DUAL;

SELECT manager_id,commission_pct,
COALESCE(manager_id,commission_pct, -1)
FROM EMPLOYEES;

SELECT commission_pct,manager_id,
COALESCE(manager_id,commission_pct, -1)
FROM EMPLOYEES;

SELECT last_name, job_id, salary,
CASE job_id WHEN 'IT_PROG' THEN 1.10*salary
WHEN 'ST_CLERK' THEN 1.15*salary
WHEN 'SA_REP' THEN 1.20*salary
ELSE salary END "REVISED_SALARY"
FROM employees;

SELECT last_name, job_id, salary,
CASE job_id  WHEN 'IT_PROG' THEN 1.10*salary
WHEN 'ST_CLERK' THEN 1.15*salary
WHEN 'SA_REP' THEN 1.20*salary
ELSE salary END AS COMPUTED 
FROM employees;

SELECT DECODE(NULL,NULL, 'VALUE') FROM DUAL;

SELECT CASE NULL WHEN NULL THEN 'VALUE'
ELSE
NULL
END FROM DUAL;

SELECT COUNT(JOB_ID) FROM EMPLOYEES;
SELECT JOB_ID FROM EMPLOYEES;
SELECT COUNT (*) , COUNT(commission_pct) FROM EMPLOYEES;
SELECT COUNT(commission_pct) FROM EMPLOYEES WHERE commission_pct IS NULL ;
SELECT COUNT(commission_pct) FROM EMPLOYEES;
SELECT commission_pct FROM EMPLOYEES;
SELECT COUNT(commission_pct) FROM EMPLOYEES WHERE commission_pct IS NOT NULL;

SELECT SUM(SALARY) FROM EMPLOYEES;
SELECT SUM(FIRST_NAME) FROM EMPLOYEES;

SELECT DEPARTMENT_ID,MANAGER_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID,MANAGER_ID
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, SUM(SALARY), MAX(SALARY)  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID,MANAGER_ID
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, SALARY, MAX(SALARY)  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID,MANAGER_ID,SALARY
ORDER BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, SALARY, SALARY  FROM EMPLOYEES;

SELECT department_id, AVG(salary)
FROM employees
WHERE DEPARTMENT_iD = 20
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY DEPARTMENT_ID
;


CREATE TABLE T1 (C1 CHAR(2), C2 CHAR(2));
INSERT INTO T1 VALUES ('A','X1');
INSERT INTO T1 VALUES ('B','X2');
CREATE TABLE T2 (C1 CHAR(2), C2 CHAR(2));
INSERT INTO T2 VALUES ('A','Y1');
INSERT INTO T2 VALUES ('C','Y2');

SELECT * FROM T1;
SELECT * FROM T2;

-- INNER JOIN
SELECT * FROM T1
INNER JOIN T2
ON T1.C1 = T2.C1;
-- LEFT OUTER JOIN
SELECT * FROM T1
LEFT OUTER JOIN T2
ON T1.C1 = T2.C1;
-- RIGHT OUTER JOIN
SELECT * FROM T1
RIGHT OUTER JOIN T2
ON T1.C1 = T2.C1;
-- FULL OUTER JOIN
SELECT * FROM T1
FULL OUTER JOIN T2
ON T1.C1 = T2.C1;
--CARTESIAN PRODUCT (CROSS JOIN)
SELECT * FROM T1 CROSS JOIN T2;

--NATURAL JOIN
SELECT * FROM T1 NATURAL JOIN T2;
SELECT * FROM T1;
SELECT * FROM T2;
SELECT * FROM T1 
INNER JOIN T2 ON
T1.C1= T2.C1 AND T1.C2 = T2.C2;

CREATE TABLE T3 (C1 CHAR(2), C2 CHAR(2));
INSERT INTO T3 VALUES ('A','X1');
INSERT INTO T3 VALUES ('B','X2');
CREATE TABLE T4 (C1 CHAR(2), C3 CHAR(2));
INSERT INTO T4 VALUES ('A','Y1');
INSERT INTO T4 VALUES ('C','Y2');
SELECT * FROM T3 NATURAL JOIN T4;

SELECT T2.C2 FROM T1
INNER JOIN T2 ON  T1.C1 = T2.C1;