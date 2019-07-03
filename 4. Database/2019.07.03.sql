-- 2019.07.03

-- LIKE : ���� ���� �˻� ������ Ű����
-- �÷��̸� LIKE ���� % / _

-- & : 0�� �̻��� �ƹ� ���̳� ���
-- ��� ���̺��� 'S'�� �����ϴ� ����� �̸� �˻��ϱ�
select * from emp where ename like 'S%';

-- ��� ���̺��� 'S'�� ������ ����� �̸� �˻��ϱ�
select * from emp where ename like '%S';

-- ��� ���̺��� 'S'�� �����ϴ� ��� �̸��� �˻�.
select * from emp where ename like '%S%';

-- _ : �ϳ��� �ڸ��� ������. � ���� ���͵� ��� X
-- _A :  �ι�° ���ڰ� �ݵ�� A������. ù��° ���ڴ� � ���̵� ok
select * from emp where ename like '__A%';



-- NOT LIKE : �� ����. 
select * from emp where ename not like '%A%'; -- 'A'���� ��� ���� ���� �˻�.




-- �÷��� ������ ���� null���� ���� Ȯ��
-- IS NULL : ���� null�̶�� true

select * from emp where (comm is null or comm = 0);

-- IS NOT NULL : ���� null�� �ƴ϶�� true
select ename from emp where comm is not null and comm > 0;

-- ��� ���̺��� �ο�(��) ����
-- order by �÷��� ASC / DESC (, �÷��� ASC / DESC ...)

-- �޿��� ���� ������� �޿��� ���� ��� ������ ����
select * from emp order by sal asc, ename asc;

-- �޿��� ���� ������� �޿��� ���� ��� ������ ����
select * from emp order by sal desc;
select * from emp where deptno = 30 order by sal desc; -- �μ� ��ȣ�� 30�� ����� �� �޿��� ���� ������� �������� ����
select * from emp order by hiredate asc;


-- �޿��� ���� ��� ������ ����, �޿��� ���� ����� ��� �̸� ������ ������.
select ename, sal,hiredate from emp order by sal desc, ename asc, hiredate asc;


--------------------------------------------
--�Լ�
--------------------------------------------

-- TO_CHAR

-- ��¥->���� ��ȯ
select sysdate as ��¥, TO_CHAR(sysdate, 'yyyy/mon/dd')
from dual; -- dual : ���� ���̺�

-- ��¥ / �ð� ǥ��
select sysdate as ��¥, TO_CHAR(sysdate, 'yyyy/mm/dd pm hh12:mi:ss') from dual;


select TO_CHAR(hiredate,'yyyy/mm/dd dy') as "Date" 
from emp
where hiredate>'1981/01/01';

-- ����->���� ��ȯ
select TO_CHAR(1011000, 'L000,000,000') from dual;
select TO_CHAR(125011000, 'L999,999,999') from dual;
select TO_CHAR(sal+nvl(comm,0), '$999,999,999') as "�� �޿�", TO_CHAR(sal*12, 'L999,999') as "����" from emp;



-- TO_DATE (����, '����') : ���� -> date �������� �ٲ�
select ename,to_date(19810220,'yyyy-mm-dd') from emp where hiredate = to_date(19810220,'yyyy-mm-dd');
select ename, hiredate, to_date('19810220', 'yyyymmdd') from emp where hiredate = to_date(19810220,'yyyy.mm.dd');

select sysdate, to_date('1994/04/29', 'yyyy/mm/dd'), trunc(sysdate-to_date('1994/04/29', 'yyyy/mm/dd')) 
from dual;

select sysdate, to_number('20,000', '20000') from dual;



-- DECODE �Լ� : switch ~ case ���İ� ������.
select ename, deptno, 
        DECODE(deptno, 
                    10, 'ACCOUNTING',
                    20, 'RESEARCH',
                    30, 'SALES',
                    40, 'OPERATION'                    
                    ) as DNAME
from emp;

select distinct job from emp;

select ename, job, sal, 
                ROUND(DECODE(job,
                        'ANALYST', sal*1.05,
                        'SALESMAN', sal*1.1,
                        'MANAGER', sal*1.15,
                        'CLERK', sal*1.2
                        )) as "upSal"     
from emp;


select ename, deptno, 
        case 
            when deptno=10 then 'ACCOUNTING'
            when deptno=20 then 'RESEARCH'
            when deptno=30 then 'SALES'
            when deptno=40 then 'OPERATIONS'
            else 'no NAME' 
        end as DNAME

from emp;

