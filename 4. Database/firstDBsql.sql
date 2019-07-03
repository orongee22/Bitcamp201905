-- �̰Ž� �ּ�

-- DESC : ���̺� �Ӽ� / ���� Ÿ�Կ� ���� ���ǵ��� Ȯ�� �� �� ����.
-- ������ �Է� �� or ������ ���� ��, �̰ɷ� Ȯ���ϸ� ��.

DESC dept;

-- ������ �˻� ���
-- select {�÷� �̸�, ...,} from ���̺��

select * from dept;
select deptno from dept;
select dname from dept;

select dname, loc, deptno from dept;

-- emp ���̺� Ȯ��
desc emp;

-- ��ü �÷� ���
select * from emp;

-- ��� ��ȣ , �̸� ����Ʈ ��ȸ
select empno, ename from emp;

-- �÷��� ��Ģ����
select sal from emp;
select sal + comm from emp; -- null���� ������ ������? : null�� �ִ� �͵� ���� �͵� �ƴ� ���� ���Ѵ� ����. �������� �ʾұ� ������ ���� ����� �״�� null��.
-- null���� ���� ġȯ�ؼ� ó�� �����ϴ�. �װŽ� db���� ó���ϱ� ������ jsp���� out ����.. ���� �� �ʿ䰡 ����.

select sal, sal + 100 from emp;
select sal - 100 from emp;
select sal * 12 from emp;


-- nvl �Լ� : Ư�� �÷��� �����Ͱ� null �� ��� Ư�� �����ͷ� ġȯ���ִ� �Լ�
-- nvl(�÷��̸�, ġȯ��)

select ename, sal, comm, sal*12+comm from emp; -- null��
select ename, sal, nvl(comm,0), sal*12+nvl(comm,0), nvl(comm, 0) from emp; -- null���� 0���� ġȯ

-- as ��Ī : ���ο� ��Ī���� ����� �����.
select ename, sal, nvl(comm,0) as ySal, sal*12+nvl(comm,0) as ySal1, nvl(comm, 0) from emp; 

-- �÷��� ���ڿ��� �����ϴ� ��� ���, sql���� ���ڿ� ǥ���� ���� ����ǥ '' �� ����.
select ename || ' is a ' || job from emp; -- ��� : SMITH is a CLERK

-- distinct : �÷����� �ߺ��Ǵ� ���� �����ϰ� �ϳ��� �����͸� �����.
select deptno from emp;
select distinct deptno from emp;


-- select�� ������ : select �÷��� .. from ���̺�� where ���ǽ�( ���ǽ��� ��� : true / false)
select * from emp where deptno = 10;
select empno, ename, job from emp where deptno = 10;



-- ���� ���� ��� ���� ����ǥ�� ǥ��, ��ҹ��� ����
select * from emp where ename='FORD';
select EMPNO, JOB where ename='SCOTT';

-- ��¥ �˻� : ��¥ �����͸� ''�� ������. ��ҹ��� ���� X
select * from emp where hiredate = '80/12/17';
select hiredate, ename, job from emp where hiredate < '81/12/01';




-- �� ���� : AND, OR, NOT
select * from emp where deptno=10 and job='MANAGER';
select * from emp where deptno=10 or deptno=30;
select * from emp where not deptno=10;


-- �÷��� BETWEEN A AND B ���� : A �̻� B ������ ���� ����
select * from emp where sal between 2000 and 3000;

-- ���� ������ ��¥ ���굵 ����!
select * from emp where hiredate between '1987/01/01' and '1987/12/31';


-- IN : or�� ������ ���� ��� �����. 
select * from emp where comm in (300,500,1400); -- 300 or 500 or 1400

