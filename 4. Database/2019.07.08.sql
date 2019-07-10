-- 2019-07-08

-----------------------------
-- �μ�����
-----------------------------

-- @ ��Į�� �μ�����

-- �� �̸����� ������ �ѱݾ��� ���
select (select name from customer where orders.custid = customer.custid), sum(saleprice) from orders group by custid;

select custid, (select name from customer where orders.custid = customer.custid )as "�� �̸�",sum(saleprice) as �����Ѿ�
from orders
group by custid;

-- ���̸��� ���� �Ǹž��� ���, 


-- @ JOIN����

select o.custid, c.name, sum(o.saleprice) as "�����Ѿ�"
from orders o join customer c
on o.custid = c.custid
group by o.custid, c.name
order by o.custid;


-- @ �ζ��κ�
select * from customer where custid <=2;

-- @ ũ�ν� ����

select * 
from (select * from customer where custid <=2) c, orders o
where c.custid = o.custid
order by c.custid;

-- @ ROWNUM

select rownum, empno from emp order by ename; -- rownum�� �ڵ� ������. �ε��� ��ȣ���� ��


select rownum, empno 
from (select * from emp order by ename);




-- ��� �ֹ��ݾ� ������ �ֹ��� ���� �ֹ���ȣ & �ݾ� ���
select avg(saleprice) 
from orders;

select orderid, saleprice from orders where saleprice<=(select avg(saleprice) from orders);

-- �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ����,
-- �ֹ���ȣ, ����ȣ, �ݾ��� ���

select orderid, custid, saleprice
from orders od
where saleprice >(select avg(saleprice) from orders so where od.custid = so.custid)
order by custid;


-- @ where �μ�����
-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ ���Ǹž�

select sum(saleprice)
from orders
where custid in (select custid from customer where address like '%���ѹα�%');

-- JOIN
select sum(saleprice)
from orders o join customer c
on o.custid = c.custid
where address like '%���ѹα�%';

--3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ�
--�ִ񰪺��� ū ���� ã��

select orderid, saleprice
from orders
where saleprice > all(select saleprice from orders where custid='3');



--EXISTS �����ڷ� ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž�

select sum(saleprice) as total
from orders od
where exists(select * from customer cs where cs.address like '%���ѹα�%' and cs.custid = od.custid);




---------------------------------------
-- DML
---------------------------------------

-- @ INSERT ������ �Է� : INSERT INTO ���̺��(�÷�, ..., �÷�...) values( ������, ������...)

-- @ DROP : ���̺� ����
-- drop table ���̺��
drop table dept01;

-- ���̺� ����
create table dept01
as select * from dept where 1=0; -- ������ ���� ���̺� ������ ������

desc dept01;

-- ������ �Է� 
insert into dept01 (deptno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

insert into dept01
values(20, 'RESEARCH', 'DALLAS');

-- null���� �Է�
-- �Ͻ��� ���
insert into dept01 (deptno, dname) 
values(30, 'SALES'); -- loc ���� X -> null�� �ڵ� �Է�

-- ����� ���
insert into dept01 
values(40, 'OPERATION', null); -- null ���� �Է�

insert into dept01
values(50, '', null); -- ���� ���ڿ��� null�� �Էµ�


insert into dept01
select * from dept; -- dept ���̺� ������ insert



-- @ UPDATE : ������ ����
-- UPDATE ���̺�� set �÷���=������ (where ����)

drop table emp01;

create table emp01
as select * from emp;


update emp01 set deptno=30;
select * from emp01;

update emp01 set sal = sal *1.1;

update emp01
set hiredate= sysdate
where mgr like '78__';


-- where ���� �̿��� Ư�� ���� ������ ����
-- �μ� ��ȣ�� 10���� ����� �μ���ȣ�� 30������ �����ϱ�!

update emp01 set deptno=30
where deptno=10;

-- �޿��� 300�̻��� ����� �޿� �λ� 10%
update emp01 set sal= sal* 1.1
where sal>=3000;


-- 1987�⿡ �Ի��� ����� �Ի����� ���÷� ����
update emp01
set hiredate = sysdate
where substr(hiredate, 1, 2) ='87';


drop table dept01;

create table dept01
as
select * from dept;

-- 20�� �μ��� �������� 40�� �μ��� ���������� �����ϱ� ���ؼ� ���� �������� ����� ���ô�.

update dept01
set loc=(
        select loc
        from dept01
        where deptno=40
    )


update dept01
set (dname, loc) = (
                    select dname, loc from dept where deptno=40
                    )
where deptno=20;

-- @ DELETE : ������ ���� 
-- DELETE FROM ���̺�� WHERE ����

select * from dept01;
-- ��ü �� ����
delete from dept01;

-- Ư�� �� �����ϱ� where ������ Ư���� ���� ������ ���





create table memberinfo(
    idx number(7) not null,
    mid varchar2(12) not null,
    mpw varchar2(16) not null,
    mname varchar2(20) not null,
    mphoto varchar2(30),
    regdate date default sysdate,
    constraint memberinfo_idx_pk primary key (idx),
    constraint memberinfo_mid_uk unique (mid));
    
insert into memberinfo values(1,'orongee','1234','������', null,'');
delete from memberinfo where idx=5;
insert into memberinfo values(1,'chacha','0630','���п�', null, '20190630');
insert into memberinfo values(2,'jungleo','1110','���ÿ�', null,'');
insert into memberinfo values(3,'keken','0406','����ȯ', null,'');
insert into memberinfo values(4,'aceravi','0215','�����', null,'');
insert into memberinfo values(5,'kong2','0929','��ȫ��', null,'');
insert into memberinfo values(6,'hyukie','0705','�ѻ���', null,'');

update memberinfo set mphoto='kong2eyo' where idx=5;
update memberinfo set regdate='20191110' where idx=2;

delete from memberinfo where idx=3;
insert into memberinfo (idx, mid,mpw,mname,mphoto) values(3,'keken','0406','����ȯ', null);
select * from memberinfo order by idx;

commit;
rollback;

select * from dept11;
drop table dept01;
create table dept11
as
select * from dept;

rollback;


--------------------
-- @VIEW :  ����ڿ��� �����ִ� ���� ���̺� ( Ư�� �÷��� �����ְ� ���� �� or ������ SQL���� ����ȭ ��ų �� ����)
--------------------

-- CREATE VIEW ���̸� AS ��������

SELECT empno, ename, deptno from emp where deptno=30;

create view emp_view30 
as 
select empno, ename, deptno 
from emp 
where deptno=30;

select * from emp_view30;


-- �ζ��κ�
-- ��� ��, �Ի����� ���� ���� ��� 5���� ���� ��� (���� 5���� ������ ��� ����� ������ rownum�� ����� ��)

select rownum, empno, ename, hiredate from emp order by hiredate asc; -- rownum�� ����.. ������ ������ζ� ������� �ȵ� ������'

select rownum, empno, ename, hiredate from (select rownum, empno, ename, hiredate from emp order by hiredate) where rownum < 6; -- mySQL -> (limit 0,5)
-- select * from emp limit 0,5; mySQL������ limit�̶�� Ű���尡 ����!

create or replace emp_view_hd
as
select empno, ename, hiredate from emp order by hiredate;


-----------------------------------------
-- SEQUENCE : �ڵ����� ���ڸ� ����ó�����ִ� ��ü
-----------------------------------------

create sequence test_seq
start with 10
increment by 10
;

s
drop sequence test_seq;



select * from dept01;

select test_seq.currval from dual;
select test_seq.nextval from dual;

insert into dept01 values (test_seq.nextval, 'DESIGN', 'SEOUL');
insert into dept01 values (test_seq.nextval, 'aa', 'SEOUL');

-- ȸ������ �� 
\

insert into dept values(60,'DESIGN','SEOUL');

select * from emp;

commit;
delete dept where deptno=60;

insert into emp values(8000,DESIGNER,null,2500,null,60);


select * from emp order by deptno, sal;
delete emp where ename='yerina';

update emp set sal=1000 where ename='SCOTT';

commit;

select emp.*, dname, loc
from emp inner join dept 
on emp.deptno = dept.deptno;

select * (select dname from dept where emp.deptno=dept.deptno) from emp;

select * from (select dname, loc from dept where emp.deptno = dept.deptno);

select dname
from emp e, dept d
where e.deptno = d.deptno;
rollback;