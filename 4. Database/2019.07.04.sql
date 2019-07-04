-- 2019.07.04

-----------------------------------------------
-- @ �׷� �Լ�
-----------------------------------------------


-- @ SUM : �׷��� ���� ��ȯ�ϴ� �Լ�.
-- @ SUM �÷���

-- ��� ���̺�ļ� ����� �� �޿� ���� ���ϱ�
select sum(sal) as "���޿�"
from emp;

-- 10�� �μ� �Ҽ� �������� ���޿� �Ѿ� ���ϱ�

select sum(sal) as "���޿�"
from emp
where deptno = 10;

-- @ sum �Լ����� null���� ����
select sum(comm)
from emp;



-- @ AVG(�÷�) : �׷쿡 ���Ե� ������ ��հ� ��ȯ
select avg(sal) from emp; -- �׷��Լ� ����� ������ �ϳ��� �÷���.

select trunc(avg(sal))
from emp -- �����Լ� ��밡��!
where job='MANAGER';

-- avg ���� null�� ����
select avg(comm)
from emp;


-- @ MAX(�÷�) : �ִ� ��ȯ / MIN(�÷�) : �ּڰ� ��ȯ
select MAX(sal) as "�ִ�޿�", MIN(sal) as "�ּұ޿�" 
from emp;


-- @ COUNT(�÷�) : row�� ������ ��ȯ��.
select count(*) as "��ü����Ǽ�" 
from emp;

select count(*) as "10�μ� ����� ��"
from emp
where deptno=10;

select count(comm)
from emp;

-- �μ��� ���� ���ϱ�
select count(*) 
from dept;

select distinct deptno
from emp;

select count(distinct deptno)
from emp;


select count(distinct job) from emp;



-- @ GROUP BY : row�� �׷����ؼ� ó����. �����Լ� (sum, avg, count)�� ���� �����.
-- �÷��̸��� �׷����� ������ ��. ex) �μ���, ������ �׷���.
SELECT JOB, SUM(sal), COUNT(*), COUNT(comm), MIN(sal)
FROM emp
group by job
having avg(sal)>=2000;


-- ������ ��ǥ ����ϱ�
select job, count(*) as "������", 
            sum(sal) as "�޿�����", 
            TO_CHAR(sum(sal),'$999,999') as "�޿��� ����", 
            TO_CHAR(ROUND(avg(sal)), '$999,999') as "�޿����"
from emp
group by job
;



-------------------------------------
-- ���� JOIN : �� �� �̻��� ���̺��� ��ħ. ǥ���ϴ� �÷��� �þ.
-------------------------------------
-- @ CROSS JOIN : ���̺� ���̱�
select *
from emp, dept
 where emp.deptno = dept.deptno;
 
-- EQUI JOIN : ���� �� / ���̺� �� �ߺ��Ǵ� �÷��� ���� ��ġ���� ������.
-- �ߺ��Ǵ� �÷� �̸� �տ� '���̺� �̸�.'�� �ٿ� �����Ѵ�.
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno;


-- �̸��� 'SCOTT'�� ����� �̸��� �μ� �̸��� ���.
select ename, dname, ename( from emp, dept where emp.deptno = dept.deptno ;



--- �ֹ� ���̺��� ȸ���� �̸��� �ֹ� ������ ����غ���.-> ������ ��
select * from orders, customer where orders.custid= customer.custid; 

-- customer, book, orders
select * from customer;
select * from book;
select * from orders;

select * from orders o, customer c, book b where o.bookid=b.bookid and c.custid=o.custid;

-- ���� - ������ ���� �ֹ��� å�� �̸��� ��� / �ֹ��� å�� ���ǻ� ���
select name, orderid, b.bookname, b.publisher                                                                                                                    
from orders o, customer c, book b 
where o.custid=c.custid and o.bookid=b.bookid and c.name='������';


-- @ non-equi join
select * from emp;
select * from salgrade;
select * from emp e, salgrade s where sal between losal and hisal;

select ename, sal, s.grade from emp e, salgrade s where sal between s.losal and s.hisal and ename='SCOTT';


-- @ SELF JOIN : ���� ���̺� ����

select e.ename || '�� �Ŵ����� ' || m.ename || ' �Դϴ�.' from emp e, emp m where e.mgr=m.empno order by m.ename asc; -- KING�� null���̶� ������.

-- @ OUTER JOIN : null������ ������ ����� ���� ��Ŵ
select e.ename || '�� �Ŵ����� ' || m.ename || ' �Դϴ�.' from emp e, emp m where e.mgr=m.empno(+) order by m.ename asc; -- KING�� �࿡ ���Ե�!



----------------------------------------
-- ANSI
----------------------------------------

-- @ ANSI CROSS JOIN
select * from emp cross join dept; --select * from emp, dept;

-- @ ANSI INNER JOIN
select * 
from emp inner join dept
on emp.deptno = dept.deptno; -- select * from emp, dept where emp.deptno = dept.deptno;


select * from emp join dept
on emp.deptno = dept.deptno;

-- @ USING
select * 
from emp join dept
using (deptno);

-- @ natural join


select e.ename, m.ename 
from emp e left outer join emp m
on e.mgr = m.empno;


select * from customer;

select distinct custid from orders;

-- oracle                                       
select * from orders o, customer c 
where o.custid(+)=c.custid;

-- ANSI
select * from orders o right outer join customer c
on o.custid = c.custid;

