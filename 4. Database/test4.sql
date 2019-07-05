--32. EQUI ������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ� �̸��� ����Ͻÿ�.

select d.deptno, dname 
from emp e, dept d 
where e.deptno= d.deptno and ename='SCOTT';

--33. INNER JOIN�� ON �����ڸ� ����Ͽ� ��� �̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� ���� ���� ����Ͻÿ�.
select * from emp, dept;

select ename, dname, loc
from emp inner join dept 
using (deptno);

--36. ���ΰ� WildCARD�� ����Ͽ� �̸��� ��A���� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
select ename, dname 
from emp inner join dept
using (deptno)
where ename like '%A%';


--37. JOIN�� �̿��Ͽ� NEW YORK�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
select ename, job, e.deptno, dname
from emp e, dept d
where e.deptno=d.deptno and loc='NEW YORK';

--38. SELF JOIN�� ����Ͽ� ����� �̸� �� �����ȣ, ������ �̸��� ����Ͻÿ�.
select e.empno as "��� ��ȣ", e.ename as "��� �̸�", m.ename as "������ �̸�"
from emp e, emp m
where e.mgr = m.empno;

--39. OUTER JOIN, SELF JOIN�� ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
select e.empno as "��� ��ȣ", e.ename as "��� �̸�", m.ename as "������ �̸�"
from emp e, emp m
where e.mgr = m.empno(+)
order by e.empno desc;

select e.empno as "�����ȣ", e.ename as "����̸�", m.ename as "�������̸�"
from emp e left outer join emp m
on e.mgr = m.empno
order by e.empno desc;

--40. SELF JOIN�� ����Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�. ( SCOTT )
select * 
from emp e, emp m;

select e.ename, e.empno, d.ename, d.empno
from emp e join emp d
on e.deptno = d.deptno
where e.ename='SCOTT'; 

--41. SELF JOIN�� ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
select * 
from emp;

--42. SELF JOIN �� ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�.
