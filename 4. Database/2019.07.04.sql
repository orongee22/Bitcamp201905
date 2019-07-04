-- 2019.07.04

-----------------------------------------------
-- @ 그룹 함수
-----------------------------------------------


-- @ SUM : 그룹의 합을 반환하는 함수.
-- @ SUM 컬럼명

-- 사원 테이블ㅔ서 사원의 월 급여 총합 구하기
select sum(sal) as "월급여"
from emp;

-- 10번 부서 소속 직원들의 월급여 총액 구하기

select sum(sal) as "월급여"
from emp
where deptno = 10;

-- @ sum 함수에서 null값은 무시
select sum(comm)
from emp;



-- @ AVG(컬럼) : 그룹에 포함된 값들의 평균값 반환
select avg(sal) from emp; -- 그룹함수 결과는 단일행 하나의 컬럼임.

select trunc(avg(sal))
from emp -- 단일함수 사용가능!
where job='MANAGER';

-- avg 또한 null값 무시
select avg(comm)
from emp;


-- @ MAX(컬럼) : 최댓값 반환 / MIN(컬럼) : 최솟값 반환
select MAX(sal) as "최대급여", MIN(sal) as "최소급여" 
from emp;


-- @ COUNT(컬럼) : row의 갯수를 반환함.
select count(*) as "전체사원의수" 
from emp;

select count(*) as "10부서 사원의 수"
from emp
where deptno=10;

select count(comm)
from emp;

-- 부서의 수를 구하기
select count(*) 
from dept;

select distinct deptno
from emp;

select count(distinct deptno)
from emp;


select count(distinct job) from emp;



-- @ GROUP BY : row를 그룹핑해서 처리함. 집합함수 (sum, avg, count)랑 같이 사용함.
-- 컬럼이름이 그룹핑의 기준이 됨. ex) 부서별, 직무별 그룹핑.
SELECT JOB, SUM(sal), COUNT(*), COUNT(comm), MIN(sal)
FROM emp
group by job
having avg(sal)>=2000;


-- 직무별 지표 출력하기
select job, count(*) as "직원수", 
            sum(sal) as "급여총합", 
            TO_CHAR(sum(sal),'$999,999') as "급여의 총합", 
            TO_CHAR(ROUND(avg(sal)), '$999,999') as "급여평균"
from emp
group by job
;



-------------------------------------
-- 조인 JOIN : 두 개 이상의 테이블을 합침. 표현하는 컬럼이 늘어남.
-------------------------------------
-- @ CROSS JOIN : 테이블 붙이기
select *
from emp, dept
 where emp.deptno = dept.deptno;
 
-- EQUI JOIN : 동등 비교 / 테이블 내 중복되는 컬럼을 서로 일치시켜 연결함.
-- 중복되는 컬럼 이름 앞에 '테이블 이름.'을 붙여 구별한다.
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno;


-- 이름이 'SCOTT'인 사원의 이름과 부서 이름을 출력.
select ename, dname, ename( from emp, dept where emp.deptno = dept.deptno ;



--- 주문 테이블에서 회원의 이름과 주문 정보를 출력해보자.-> 박지성 고객
select * from orders, customer where orders.custid= customer.custid; 

-- customer, book, orders
select * from customer;
select * from book;
select * from orders;

select * from orders o, customer c, book b where o.bookid=b.bookid and c.custid=o.custid;

-- 조건 - 박지성 고객이 주문한 책의 이름을 출력 / 주문한 책의 출판사 출력
select name, orderid, b.bookname, b.publisher                                                                                                                    
from orders o, customer c, book b 
where o.custid=c.custid and o.bookid=b.bookid and c.name='박지성';


-- @ non-equi join
select * from emp;
select * from salgrade;
select * from emp e, salgrade s where sal between losal and hisal;

select ename, sal, s.grade from emp e, salgrade s where sal between s.losal and s.hisal and ename='SCOTT';


-- @ SELF JOIN : 같은 테이블 엮기

select e.ename || '의 매니저는 ' || m.ename || ' 입니다.' from emp e, emp m where e.mgr=m.empno order by m.ename asc; -- KING은 null값이라 배제됨.

-- @ OUTER JOIN : null값으로 배제된 행까지 포함 시킴
select e.ename || '의 매니저는 ' || m.ename || ' 입니다.' from emp e, emp m where e.mgr=m.empno(+) order by m.ename asc; -- KING이 행에 포함됨!



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

