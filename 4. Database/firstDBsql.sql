-- 이거슨 주석

-- DESC : 테이블 속성 / 저장 타입에 대한 정의등을 확인 할 수 있음.
-- 데이터 입력 시 or 데이터 수정 시, 이걸로 확인하면 됨.

DESC dept;

-- 데이터 검색 명령
-- select {컬럼 이름, ...,} from 테이블명

select * from dept;
select deptno from dept;
select dname from dept;

select dname, loc, deptno from dept;

-- emp 테이블 확인
desc emp;

-- 전체 컬럼 출력
select * from emp;

-- 사원 번호 , 이름 리스트 조회
select empno, ename from emp;

-- 컬럼의 사칙연산
select sal from emp;
select sal + comm from emp; -- null값이 나오는 이유는? : null은 있는 것도 없는 것도 아닌 값인 무한대 값임. 정해지지 않았기 때문에 연산 결과는 그대로 null값.
-- null값은 따로 치환해서 처리 가능하다. 그거슨 db에서 처리하기 때문에 jsp에서 out 웅앵.. 따로 할 필요가 없음.

select sal, sal + 100 from emp;
select sal - 100 from emp;
select sal * 12 from emp;


-- nvl 함수 : 특정 컬럼의 데이터가 null 인 경우 특정 데이터로 치환해주는 함수
-- nvl(컬럼이름, 치환값)

select ename, sal, comm, sal*12+comm from emp; -- null값
select ename, sal, nvl(comm,0), sal*12+nvl(comm,0), nvl(comm, 0) from emp; -- null값을 0으로 치환

-- as 별칭 : 새로운 별칭으로 결과를 출력함.
select ename, sal, nvl(comm,0) as ySal, sal*12+nvl(comm,0) as ySal1, nvl(comm, 0) from emp; 

-- 컬럼과 문자열을 연결하는 결과 출력, sql에서 문자열 표현은 작은 따옴표 '' 로 묶기.
select ename || ' is a ' || job from emp; -- 출력 : SMITH is a CLERK

-- distinct : 컬럼에서 중복되는 값을 제거하고 하나의 데이터만 출력함.
select deptno from emp;
select distinct deptno from emp;


-- select의 조건절 : select 컬럼명 .. from 테이블명 where 조건식( 조건식의 결과 : true / false)
select * from emp where deptno = 10;
select empno, ename, job from emp where deptno = 10;



-- 문자 비교의 경우 작은 따옴표로 표현, 대소문자 구분
select * from emp where ename='FORD';
select EMPNO, JOB where ename='SCOTT';

-- 날짜 검색 : 날짜 데이터를 ''로 묶어줌. 대소문자 구분 X
select * from emp where hiredate = '80/12/17';
select hiredate, ename, job from emp where hiredate < '81/12/01';




-- 논리 연산 : AND, OR, NOT
select * from emp where deptno=10 and job='MANAGER';
select * from emp where deptno=10 or deptno=30;
select * from emp where not deptno=10;


-- 컬럼명 BETWEEN A AND B 연산 : A 이상 B 이하의 범위 연산
select * from emp where sal between 2000 and 3000;

-- 범위 연산은 날짜 연산도 가능!
select * from emp where hiredate between '1987/01/01' and '1987/12/31';


-- IN : or의 조건이 많을 경우 사용함. 
select * from emp where comm in (300,500,1400); -- 300 or 500 or 1400

