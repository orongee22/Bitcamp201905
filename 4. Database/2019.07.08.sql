-- 2019-07-08

-----------------------------
-- 부속질의
-----------------------------

-- @ 스칼라 부속질의

-- 고객 이름별로 구매한 총금액을 출력
select (select name from customer where orders.custid = customer.custid), sum(saleprice) from orders group by custid;

select custid, (select name from customer where orders.custid = customer.custid )as "고객 이름",sum(saleprice) as 구매총액
from orders
group by custid;

-- 고객이름과 고객별 판매액을 출력, 


-- @ JOIN으로

select o.custid, c.name, sum(o.saleprice) as "구매총액"
from orders o join customer c
on o.custid = c.custid
group by o.custid, c.name
order by o.custid;


-- @ 인라인뷰
select * from customer where custid <=2;

-- @ 크로스 조인

select * 
from (select * from customer where custid <=2) c, orders o
where c.custid = o.custid
order by c.custid;

-- @ ROWNUM

select rownum, empno from emp order by ename; -- rownum은 자동 생성됨. 인덱스 번호같은 것


select rownum, empno 
from (select * from emp order by ename);




-- 평균 주문금액 이하의 주문에 대해 주문번호 & 금액 출력
select avg(saleprice) 
from orders;

select orderid, saleprice from orders where saleprice<=(select avg(saleprice) from orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대한,
-- 주문번호, 고객번호, 금액을 출력

select orderid, custid, saleprice
from orders od
where saleprice >(select avg(saleprice) from orders so where od.custid = so.custid)
order by custid;


-- @ where 부속질의
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액

select sum(saleprice)
from orders
where custid in (select custid from customer where address like '%대한민국%');

-- JOIN
select sum(saleprice)
from orders o join customer c
on o.custid = c.custid
where address like '%대한민국%';

--3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액
--최댓값보다 큰 값을 찾기

select orderid, saleprice
from orders
where saleprice > all(select saleprice from orders where custid='3');



--EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액

select sum(saleprice) as total
from orders od
where exists(select * from customer cs where cs.address like '%대한민국%' and cs.custid = od.custid);




---------------------------------------
-- DML
---------------------------------------

-- @ INSERT 데이터 입력 : INSERT INTO 테이블명(컬럼, ..., 컬럼...) values( 데이터, 데이터...)

-- @ DROP : 테이블 삭제
-- drop table 테이블명
drop table dept01;

-- 테이블 생성
create table dept01
as select * from dept where 1=0; -- 데이터 엇이 테이블 구조만 가져옴

desc dept01;

-- 데이터 입력 
insert into dept01 (deptno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

insert into dept01
values(20, 'RESEARCH', 'DALLAS');

-- null값의 입력
-- 암시적 방법
insert into dept01 (deptno, dname) 
values(30, 'SALES'); -- loc 삽입 X -> null값 자동 입력

-- 명시적 방법
insert into dept01 
values(40, 'OPERATION', null); -- null 직접 입력

insert into dept01
values(50, '', null); -- 공백 문자열도 null로 입력됨


insert into dept01
select * from dept; -- dept 테이블 정보를 insert



-- @ UPDATE : 데이터 수정
-- UPDATE 테이블명 set 컬럼명=데이터 (where 조건)

drop table emp01;

create table emp01
as select * from emp;


update emp01 set deptno=30;
select * from emp01;

update emp01 set sal = sal *1.1;

update emp01
set hiredate= sysdate
where mgr like '78__';


-- where 절을 이용한 특정 행의 데이터 변경
-- 부서 번호가 10번인 사원의 부서번호를 30번으로 수정하기!

update emp01 set deptno=30
where deptno=10;

-- 급여가 300이상인 사원만 급여 인상 10%
update emp01 set sal= sal* 1.1
where sal>=3000;


-- 1987년에 입사한 사원의 입사일을 오늘로 수정
update emp01
set hiredate = sysdate
where substr(hiredate, 1, 2) ='87';


drop table dept01;

create table dept01
as
select * from dept;

-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브 쿼리문을 사용해 봅시다.

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

-- @ DELETE : 데이터 삭제 
-- DELETE FROM 테이블명 WHERE 조건

select * from dept01;
-- 전체 행 삭제
delete from dept01;

-- 특정 행 삭제하기 where 절에서 특정행 갖는 조건을 기술





create table memberinfo(
    idx number(7) not null,
    mid varchar2(12) not null,
    mpw varchar2(16) not null,
    mname varchar2(20) not null,
    mphoto varchar2(30),
    regdate date default sysdate,
    constraint memberinfo_idx_pk primary key (idx),
    constraint memberinfo_mid_uk unique (mid));
    
insert into memberinfo values(1,'orongee','1234','오롱이', null,'');
delete from memberinfo where idx=5;
insert into memberinfo values(1,'chacha','0630','차학연', null, '20190630');
insert into memberinfo values(2,'jungleo','1110','정택운', null,'');
insert into memberinfo values(3,'keken','0406','이재환', null,'');
insert into memberinfo values(4,'aceravi','0215','김원식', null,'');
insert into memberinfo values(5,'kong2','0929','이홍빈', null,'');
insert into memberinfo values(6,'hyukie','0705','한상혁', null,'');

update memberinfo set mphoto='kong2eyo' where idx=5;
update memberinfo set regdate='20191110' where idx=2;

delete from memberinfo where idx=3;
insert into memberinfo (idx, mid,mpw,mname,mphoto) values(3,'keken','0406','이재환', null);
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
-- @VIEW :  사용자에게 보여주는 가상 테이블 ( 특정 컬럼만 보여주고 싶을 때 or 복잡한 SQL문을 간소화 시킬 수 있음)
--------------------

-- CREATE VIEW 뷰이름 AS 서브쿼리

SELECT empno, ename, deptno from emp where deptno=30;

create view emp_view30 
as 
select empno, ename, deptno 
from emp 
where deptno=30;

select * from emp_view30;


-- 인라인뷰
-- 사원 중, 입사일이 가장 빠른 사람 5명의 정보 출력 (상위 5명의 기준을 잡기 힘들기 때문에 rownum을 사용할 것)

select rownum, empno, ename, hiredate from emp order by hiredate asc; -- rownum의 정렬.. 생성된 순서대로라서 순서대로 안됨 ㅇㅅㅇ'

select rownum, empno, ename, hiredate from (select rownum, empno, ename, hiredate from emp order by hiredate) where rownum < 6; -- mySQL -> (limit 0,5)
-- select * from emp limit 0,5; mySQL에서는 limit이라는 키워드가 있음!

create or replace emp_view_hd
as
select empno, ename, hiredate from emp order by hiredate;


-----------------------------------------
-- SEQUENCE : 자동으로 숫자를 증가처리해주는 객체
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

-- 회원가입 시 
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