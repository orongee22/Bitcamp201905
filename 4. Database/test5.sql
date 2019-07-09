--43. ��� ��ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ��(��� �̸��� ������)�Ͻÿ�.
select ename, job
from emp
where job = (select job 
            from emp 
            where empno='7788');

--44. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ���Ͻÿ�. ����̸��� ���� ����

select ename, job 
from emp 
where sal > (select sal 
            from emp 
            where empno='7499');

--45. �ּұ޿��� �޴� ����� �̸�, ������ �� �޿��� ǥ���Ͻÿ�. (�׷��Լ� ���)

select ename, job, sal 
from emp
where sal = (select min(sal) 
            from emp);


--46. ��ձ޿��� ���� ���� ������ ���� �̸��� ������ ����� ���Ͻÿ�.


select job, avg(sal) 
from emp 
having avg(sal) <= (select round(min(avg(sal))) 
                    from emp 
                    group by job) 
group by job; 



--47. �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.

select ename, sal, deptno 
from emp 
where sal in (select min(sal) 
            from emp 
            group by deptno) 
order by deptno;


--48. �������� ANALYST �� ������� �޿��� �����鼭 ������ ANALYST�� �ƴ� ������� ǥ��(�����ȣ, �̸�, ��� ����, �޿�)�Ͻÿ�.
select empno, ename, job, sal 
from emp 
where sal < all(select sal 
                from emp 
                where job = 'ANALYST');



--49. ���������� ���� ����� �̸��� ǥ���Ͻÿ�.

select ename 
from emp e 
where not exists(select m.ename from emp m where e.empno = m.mgr);


--50. ���������� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename 
from emp e 
where exists(select m.ename from emp m where e.empno = m.mgr);


--51. BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�. ( �� BLAKE�� ���� )


select ename, hiredate 
from emp 
where deptno = (select deptno 
                from emp 
                where ename='BLAKE') 
                and not ename='BLAKE';


--52. �޿��� ��� �޿����� ���� ������� ��� ��ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ������������ �����Ͻÿ�.

select ename, empno, sal 
from emp 
where sal > (select avg(sal) 
            from emp) 
order by sal;

--53. �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� ��� ��ȣ�� �̸��� ǥ���Ͻÿ�.

select deptno, ename 
from emp 
where deptno in(select deptno 
                from emp 
                where ename like '%K%');



--54. �μ���ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� �������� ǥ���Ͻÿ�.
select ename, deptno, job 
from emp 
where deptno = (select deptno 
                from dept 
                where loc='DALLAS'); 

--55. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.

select ename, sal 
from emp 
where mgr = (select empno 
            from emp 
            where ename='KING');

--56. RESEARCH �μ��� ����� ���� �μ���ȣ, ����̸� �� ��� ������ ǥ���Ͻÿ�.


select deptno, ename, job 
from emp 
where deptno = (select deptno 
                from dept 
                where dname ='RESEARCH');



--57. ��� ���޺��� ���� �޿��� �ް� �̸��� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� ��� ��ȣ, �̸�, �޿��� ǥ���Ͻÿ�.

select empno, deptno, ename, sal
from emp
where deptno = (select deptno 
                    from emp 
                    where ename like '%M%' and sal > (select avg(sal) 
                                                        from emp))
order by empno, deptno;

--58. ��ձ޿��� ���� ���� ������ ã���ÿ�.

select job 
from emp 
having avg(sal) <= all(select avg(sal)
                        from emp 
                        group by job) 
group by job;

--59. �������� MANAGER �� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.
select ename, deptno
from emp
where deptno = any(select deptno 
                    from emp 
                    where job='MANAGER');

