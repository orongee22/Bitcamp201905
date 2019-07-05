--16. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����Ͻÿ�.

select ename, substr(hiredate,1,5) as "�Ի���" -- 'yy/mm' 
from emp;


--17. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����Ͻÿ�.
select ename 
from emp 
where substr(hiredate,4,2) = '04';



--18. MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�.
--select ename, empno from emp;
select ename 
from emp 
where mod(empno,2)=0;


--19. �Ի����� �⵵�� 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ����Ͻÿ�.
select to_char(hiredate, 'yy mon dy') as "�Ի���" 
from emp;


--20. ���� �� ĥ�� �������� ����Ͻÿ�. ���糯¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ���� ��ġ ��Ű�ÿ�.
select trunc(sysdate - to_date('2019/01/01','yyyy/mm/dd')) as "����" 
from dual;



--21. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL �� ��� 0���� ����Ͻÿ�.
select nvl(mgr,0) 
from emp;

select empno, ename, nvl(mgr,0)
from emp;

--22. DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�. ������ ��ANALIST���� ����� 200, ��SALESMAN���� ����� 180, ��MANAGER���� ����� 150, ��CLERK���� ����� 100�� �λ��Ͻÿ�.
select empno, ename,sal,DECODE
            (job, 
            'ANALYST', sal+200,
            'SALESMAN', sal+180,
            'MANAGER', sal+150,
            'CLERK', sal+100
            )as "upSal" 
from emp;



--23. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����Ͻÿ�. ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.

select max(sal) as "�޿� �ְ��", 
        min(sal) as "�޿� ������", 
        round(avg(sal)) as "��� �޿�" 
from emp;


--24. �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��� ���� ����Ͻÿ�. ��տ� ���ؼ��� ������ �ݿø� �Ͻÿ�.

select job, max(sal) as "�޿� �ְ��",
            min(sal) as "�޿� ������",
            round(avg(sal)) as "��� �޿�"
from emp
group by job;




--25. COUNT(*) �Լ��� �̿��Ͽ� �������� ������ ��� ���� ����Ͻÿ�.

select job,count(job) as "�ο���" 
from emp
group by job;


--26. ������ ���� �����Ͻÿ�.
select count(mgr) as "������ ��" from emp; -- null�� ����
select count(distinct mgr) as "������ ��" from emp;



--27. �޿� �ְ��, �޿� �������� ������ ����Ͻÿ�.

select max(sal)-min(sal) as "�޿� �ְ�� - �޿� ������" from emp;



--28. ���޺� ����� ���� �޿��� ����Ͻÿ�. �����ڸ� �� �� ���� ����� ���� �޿��� 2000 �̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ���� ������������ �����Ͽ� ����Ͻÿ�.
select job,min(sal) as "�����޿�"
from emp
group by job
having min(sal)>=2000
order by min(sal) desc;

select job, min(sal) as minsal
from emp
where mgr is not null
having min(sal)>=2000
group by job
order by minsal desc;



--29. �� �μ��� ���� �μ���ȣ, ��� ��, �μ� ���� ��� ����� ��� �޿��� ����Ͻÿ�. ��� �޿��� �Ҽ��� ��° �ڸ��� �ݿø� �Ͻÿ�.
select deptno, count(*) as "�����", round(avg(sal),2) as "��� �޿�"
from emp
group by deptno;



--30. �� �μ��� ���� �μ���ȣ �̸�, ���� ��, ��� ��, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�. ��� �޿��� ������ �ݿø� �Ͻÿ�. DECODE ���.

select deptno,
            decode(deptno,
            10, 'ACCOUNTING',
            20, 'RESEARCH',
            30, 'SALES',
            40, 'OPERATIONS'
            ) as "DNAME",
            decode(deptno,
            10, 'NEW YORK',
            20, 'DALLAS',
            30, 'CHICAGO',
            40, 'BOSTON'
            ) as "LOC",
            count(*) as "�����",
            round(avg(sal)) as "��� �޿�"
from emp
group by deptno
order by deptno asc;


select e.deptno, d.dname, d.loc, count(*), round(avg(sal))
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname, d.loc;


--31. ������ ǥ���� ���� �ش� ������ ���� �μ� ��ȣ�� �޿� �� �μ� 10, 20, 30�� �޿� �Ѿ��� ���� ����Ͻÿ�. ��Ī�� �� job, dno, �μ� 10, �μ� 20, �μ� 30, �Ѿ����� �����Ͻÿ�. ( hint. Decode, group by )

select job, deptno as dno, 
                            decode(
                                deptno, 
                                10, sum(sal),0
                                ) as "�μ� 10",
                            decode(deptno, 
                                20, sum(sal),0
                                ) as "�μ� 20",
                            decode(deptno, 
                                30, sum(sal),0
                                ) as "�μ� 30", 
                            sum(sal) as "�Ѿ�" 
from emp 
group by job, deptno 
order by job, deptno;


select job, deptno,
    decode(deptno, 10, sum(sal)) as "�μ� 10",
    decode(deptno, 20, sum(sal)) as "�μ� 20",
    decode(deptno, 30, sum(sal)) as "�μ� 30",
    sum(sal) as "�Ѿ�"
from emp
group by job, deptno
order by deptno;



