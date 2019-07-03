select * from emp;
select * from dept;

-- 1. ���������ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ����� �� ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
--select ename, sal, sal+300 from emp;
select ename as "��� �̸�", sal as "�޿�", sal+300 as "�λ�� �޿�" from emp;

--2. ����� �̸�, �޿�, ���� �� ������ �� ������ ���� �ͺ��� ���� ������ ����Ͻÿ�, ���� �Ѽ����� ���޿� 12�� ���� �� $100�� �󿩱��� ���ؼ� ����Ͻÿ�.
--select ename, sal, sal*12+100 from emp order by sal desc;
select ename as NAME, sal as SAL, sal*12+100 as INCOME
from emp
order by INCOME desc;


--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ǥ��, �޿��� ���� �ͺ��� ���� ������ ����Ͻÿ�.
select ename, sal from emp where sal>2000 order by sal desc;


--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�.
select ename, deptno from emp 
where empno=7788;


--5. �޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ�.
select ename, sal from emp 
where sal not between 2000 and 3000;



--6. 1981�� 2�� 20�� ���� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����Ͻÿ�.
select ename, job, hiredate from emp 
where hiredate between '1981/02/20' and '1981/05/01'
order by hiredate asc;


--7. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ���, �̸��� ����(��������)���� �����ڼ����� ����Ͻÿ�.
select ename, deptno from emp 
where deptno=20 or deptno=30 order by ename desc;


--8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ���, �̸���(��������)���� ����Ͻÿ�.
select ename, sal, deptno from emp 
where (sal>=2000 and sal<=3000) and (deptno=20 or deptno=30) 
order by ename asc;


select ename, sal, deptno from emp 
where sal between 2000 and 3000 and (deptno=20 or deptno=30) 
order by ename asc;


--9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�. (like �����ڿ� ���ϵ�ī�� ���)
select ename, hiredate from emp 
where hiredate like '81/%/%';
-- like '81/%/%';

--10. �����ڰ� ���� ����� �̸��� ��� ������ ����Ͻÿ�.
select ename, job from emp 
where mgr is null ;


--11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select ename, sal, comm from emp 
where comm is not null order by sal desc, comm desc;


select ename, sal, comm from emp 
where comm is not null and comm>0 
order by sal desc, comm desc;


--12. �̸��� ����° ���ڰ� R�� ����� �̸��� ǥ���Ͻÿ�.
select ename from emp 
where ename like '__R%';


--13. �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename from emp 
where ename like '%A%' and ename like '%E%'; -- ������ �ϳ��ϳ� �ܵ����� �������.


--14. �������� CLERK, �Ǵ� SALESMAN�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
select ename, job, sal from emp 
where job='CLERK' or job='SALESMAN' and sal not in(1600,950,1300);


--15. Ŀ�̼��� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.
select ename, comm from emp 
where comm>=500
