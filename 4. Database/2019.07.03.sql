-- 2019.07.03

-- LIKE : 문자 패턴 검색 연산자 키워드
-- 컬럼이름 LIKE 패턴 % / _

-- & : 0개 이상의 아무 값이나 허용
-- 사원 테이블에서 'S'로 시작하는 사원의 이름 검색하기
select * from emp where ename like 'S%';

-- 사원 테이블에서 'S'로 끝나는 사원의 이름 검색하기
select * from emp where ename like '%S';

-- 사원 테이블에서 'S'를 포함하는 사원 이름을 검색.
select * from emp where ename like '%S%';

-- _ : 하나의 자리를 차지함. 어떤 값이 들어와도 상관 X
-- _A :  두번째 문자가 반드시 A여야함. 첫번째 문자는 어떤 값이든 ok
select * from emp where ename like '__A%';



-- NOT LIKE : 논리 부정. 
select * from emp where ename not like '%A%'; -- 'A'들어가는 사원 빼고 전부 검색.




-- 컬럼의 데이터 값이 null인지 여부 확인
-- IS NULL : 값이 null이라면 true

select * from emp where (comm is null or comm = 0);

-- IS NOT NULL : 값이 null이 아니라면 true
select ename from emp where comm is not null and comm > 0;

-- 결과 테이블의 로우(행) 정렬
-- order by 컬럼명 ASC / DESC (, 컬럼명 ASC / DESC ...)

-- 급여가 적은 사원부터 급여가 많은 사원 순으로 정렬
select * from emp order by sal asc, ename asc;

-- 급여가 많은 사원부터 급여가 적은 사원 순으로 정렬
select * from emp order by sal desc;
select * from emp where deptno = 30 order by sal desc; -- 부서 번호가 30인 사람들 중 급여가 높은 사람부터 내림차순 정렬
select * from emp order by hiredate asc;


-- 급여가 많은 사람 순으로 정렬, 급여가 같은 사원의 경우 이름 순으로 정렬함.
select ename, sal,hiredate from emp order by sal desc, ename asc, hiredate asc;


--------------------------------------------
--함수
--------------------------------------------

-- TO_CHAR

-- 날짜->문자 변환
select sysdate as 날짜, TO_CHAR(sysdate, 'yyyy/mon/dd')
from dual; -- dual : 더미 테이블

-- 날짜 / 시간 표현
select sysdate as 날짜, TO_CHAR(sysdate, 'yyyy/mm/dd pm hh12:mi:ss') from dual;


select TO_CHAR(hiredate,'yyyy/mm/dd dy') as "Date" 
from emp
where hiredate>'1981/01/01';

-- 숫자->문자 변환
select TO_CHAR(1011000, 'L000,000,000') from dual;
select TO_CHAR(125011000, 'L999,999,999') from dual;
select TO_CHAR(sal+nvl(comm,0), '$999,999,999') as "월 급여", TO_CHAR(sal*12, 'L999,999') as "연봉" from emp;



-- TO_DATE (원본, '패턴') : 숫자 -> date 형식으로 바뀜
select ename,to_date(19810220,'yyyy-mm-dd') from emp where hiredate = to_date(19810220,'yyyy-mm-dd');
select ename, hiredate, to_date('19810220', 'yyyymmdd') from emp where hiredate = to_date(19810220,'yyyy.mm.dd');

select sysdate, to_date('1994/04/29', 'yyyy/mm/dd'), trunc(sysdate-to_date('1994/04/29', 'yyyy/mm/dd')) 
from dual;

select sysdate, to_number('20,000', '20000') from dual;



-- DECODE 함수 : switch ~ case 형식과 유사함.
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

