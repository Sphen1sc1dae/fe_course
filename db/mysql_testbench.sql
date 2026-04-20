/*********************
워크밴치 실행시 필수 명령어
show databases; -> 데이터베이스 확인
use 데이터베이스명; -> 사용할 데이터베이스 오픈
select database(); -> 데이터베이스 선택
use tables; -> 데이터베이스의 모든 테이블 조회
*********************/

show databases;
use hrdb2019;
select database();
show tables;

/********************
DESC(DESCRIBE) : 테이블 구조 확인
형식 > desc 테이블명
********************/
show tables;
desc department;
desc employee;
desc vacation;
desc unit;

/********************
SELECT : 테이블 내용 조회
형식 > select [컬럼리스트] from [테이블명]
********************/
show tables;
desc employee;
select emp_id, emp_name, eng_name from employee;
select * from employee;

-- 사원의 사번, 사원명, 성별, 입사일, 급여 조회
desc employee;
select emp_id, emp_name, gender, hire_date, salary from employee;

-- 부서 테이블의 모든 데이터 조회
show tables;
select * from department;

/********************
AS : 컬럼의 별칭 부여
형식 > select [컬럼명 as 별칭, ...] from [테이블명]
	컬럼명에 함수를 적용하여 실행하는 경우 사용.
********************/
-- 사원 테이블의 emp_id 컬럼명 '사번' 별칭으로 조회
select emp_id as 사번 from employee;
select emp_id 사번 from employee;
select emp_id '사원 번호' from employee;

-- 사원 테이블의 별칭을 사번(emp_id), 사원명(emp_name), 입사일(hire_date), 급여(salary)로 조회
select emp_id as 사번, emp_name as 사원명, hire_date as 입사일, salary as 급여 from employee;

-- 사원테이블의 사원명, 폰번호, 급여, 보너스(급여의 10%), 입사일 조회
-- 산술연산식이 가능한 컬럼은 Number 타입 가능
desc employee;
select emp_name, phone, salary, salary*0.1 as 보너스, hire_date from employee;

-- 현재 날짜를 조회 : curdate()
select curdate() as today from dual;

/********************
SELECT ~ FROM ~ WHERE : 테이블 상세 내용 조회
형식 > select [컬럼명 as 별칭, ...] from [테이블명] where [컬럼명] [조건절]
********************/
select * from employee where emp_id = 'S0004';
-- 사원테이블에서 '정주고' 사원의 정보 조회
select * from employee where emp_name = '정주고';
-- SYS 부서에 속한 모든 사원을 조회
desc department;
select * from department where dept_id = 'SYS';
select * from department;

-- 사번이 S0005인 사원의 사원명, 성별, 입사일, 급여를 조회
select emp_name, gender, hire_date, salary from employee where emp_id = 'S0005';

-- SYS 부서에 속한 모든 사원들을 조회(단, 출력되는 EMP_ID 컬럼은 '사원번호' 별칭으로 조회)
desc employee;
select emp_id as '사원번호', emp_name, hire_date, salary from employee where dept_id = 'SYS'; -- -> 소문자 'sys' 도 가능

-- 컬럼 별칭을 통해 조건절을 처리할 수 있을까요??
-- emp_name의 별칭인 '사원명'으로 '홍길동'을 조회
select emp_id, emp_name as '사원명', hire_date, salary
	from employee
	where emp_name = '홍길동'; -- -> 조건절의 컬럼명은 테이블의 원본 컬럼명만 가능
    
-- 입사일이 2014년 8월 1일인 사원들을 조회
-- date 타입 표현은 문자열 처럼, 처리는 숫자 처럼 사용된다
select *
	from employee
    where hire_date = '2014-08-01';

-- 급여가 5000인 사원들 조회
select * 
	from employee
    where salary = 5000;
    
-- 성별이 남자인 사원들 조회
select * from employee where gender = 'M';
-- 성별이 남자인 사원들 조회
select * from employee where gender = 'F';

/********************
NULL : 아직 정의되지 않은 미지수
논리적인 값으로 조건식을 처리 - is null, is not null
********************/
select * from employee where salary is null;
    
-- 영어 이름이 정해지지 않은 사람들을 조회
select * from employee where eng_name is null;

-- 재직중인 사원들 조회 : 퇴사 일자 컬럼 - retire_date
select *
	from employee
    where retire_date is null;
    
-- 재직중인 사원들의 보너스컬럼을 추가하고, 급여의 20%를 설정하여 조회
-- 보너스 컬럼의 컬럼명은 'bonus'
select emp_id, emp_name, hire_date, salary, salary * 0.2 as bonus
	from employ
    where retire_date is null;

/********************
IFNULL : NULL을 다른값으로 대체하는 함수
형식> IFNULL (NULL 포함 컬럼명, 대체값);
********************/
-- STG 부서에 속한 사원들의 정보 조회
-- 단, 급여가 NULL인 사원은 0 값으로 표현
SELECT 
    emp_id,
    emp_name,
    eng_name,
    dept_id,
    IFNULL(salary, 0) AS salary
FROM
    employee
WHERE
    dept_id = 'STG';
    
-- 영어 이름이 정해지지 않은 사원은 'smith' 이름으로 치환
-- 사원번호, 사원명, 영어이름, 입사일, 부서아이디
SELECT 
    EMP_ID,
    EMP_NAME,
    IFNULL(ENG_NAME, 'SMITH') AS eng_name,
    hire_date,
    dept_id
FROM
    EMPLOYEE;

-- MKT 부서의 사원들을 조회, 재직중인 사원들의 RETIRE_DATE 컬럼을 현재 날짜로 치환
SELECT 
    emp_id,
    emp_name,
    dept_id,
    hire_date,
    IFNULL(retire_date, CURDATE()) AS retire_date
FROM
    employee
WHERE
    dept_id = 'MKT';
 
/********************
DISTINCT : 중복된 데이터를 배제하고 조회
형식> SELECT DISTINCT [컬럼 리스트] ~
********************/
-- 사원테이블에서 부서아이디를 조회
-- 사원테이블의 부서아이디는 부서테이블의 부서아이디를 참조하므로 다중 조회
SELECT DISTINCT
    dept_id
FROM
    employee;
    
-- 주의점! unique 한 키와 함께 조회하는 경우 distinct 가 적용되지 않음

/**************************************
	ORDER BY 컬럼 : 데이터 정렬 
    형식> SELECT [컬럼리스트] 
			FROM [테이블]
            WHERE [조건절]
		 ORDER BY [컬럼명, ...] ASC(오름차순)/DESC(내림차순)
***************************************/

-- 급여를 기준으로 오름차순 정렬
SELECT 
    *
FROM
    employee
ORDER BY salary DESC;

-- 모든 사원을 급여, 성별을 기준으로 오름차순 정렬
select * from employee order by salary, gender ASC;

-- ENG_NAME이 널인 사원들을 입사일 기준으로 내림차순 정렬
select * from employee where eng_name is null order by hire_date DESC;

-- 퇴직한 사원들을 급여기준으로 내림차순 정렬
select * from employee where retire_date is not null order by salary DESC;

-- 퇴직한 사원들을 급여기준으로 내림차순 정렬, SALARY 컬럼을 '급여' 별칭으로 치환
-- '급여' 별칭으로 ORDER BY가 가능할까요???  :: 별칭으로 ORDER BY 가능함
--  WHERE 조건절 데이터 탐색 > 컬럼리스트 > 정렬
SELECT 	-- (3)
    emp_id, emp_name, hire_date, retire_date, salary AS '급여'
FROM	-- (1)
    employee
WHERE	-- (2)
    retire_date IS NOT NULL
ORDER BY '급여' DESC;	-- (4) -> (3) Select 문에서 AS 명령을 사용했기 때문에 'Where' 와는 달리 'Order by' 부분에서는 별칭 사용 가능

-- 정보시스템(SYS) 부서 사원들 중 입사일이 빠른 순서, 급여를 많이 받는 순서로 정렬
-- HIRE_DATE, SALARY 컬럼은 '입사일','급여' 별칭으로 컬럼리스트 생성 후 정렬
SELECT 
    emp_id,
    emp_name,
    hire_date AS '입사일',
    salary AS '급여'
FROM
    employee
WHERE
	dept_id = 'SYS'
ORDER BY '입사일' ASC , '급여' DESC;

select * from employee limit 10;

/**************************************
	조건절 + 비교연산자 : 특정 범위 혹은 데이터 검색
    형식> SELECT [컬럼리스트] 
			FROM [테이블]
            WHERE [조건절]
		 ORDER BY [컬럼명, ...] ASC/DESC
***************************************/
-- 급여가 5000 이상인 사원들을 조회, 급여를 오름차순 정렬


-- 2017-01-01 이후 입사한 사원들을 조회


-- 입사일이 2015-01-01 이후이거나, 급여가 6000인 이상인 사원들을 조회  
-- ~이거나, ~또는 : OR - 두 개의 조건중 하나만 만족해도 조회가능


-- 입사일이 2015-01-01 이후이고, 급여가 6000인 이상인 사원들을 조회  
-- ~이고 : AND - 두 개의 조건이 모두 만족해야만 조회 가능


-- 특정 기간 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
-- 부서기준으로 오름차순 정렬


-- 급여가 6000 이상 8000 이하인 사원들을 모두 조회


-- MKT 부서의 사원들의 사번, 사원명, 입사일, 이메일, 급여, 보너스(급여의 20%) 조회
-- 급여가 NULL인 사원의 보너스는 기본 50
-- 보너스가 1000 이상인 사원 조회
-- 보너스가 높은 사원 기준으로 정렬


-- 사원명이 '일지매','오삼식','김삼순' 인 사원들을 조회


/******************************************************
	논리곱(AND) : BETWEEN ~ AND 
    형식> SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] BETWEEN 값1 AND 값2;
	논리합(OR) : IN
    형식> SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] IN (값1, 값2, 값3...);	 
******************************************************/
-- BETWEEN ~ AND
-- 특정 기간 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
-- 부서기준으로 오름차순 정렬


-- 급여가 6000 이상 8000 이하인 사원들을 모두 조회


-- IN
-- 사원명이 '일지매','오삼식','김삼순' 인 사원들을 조회


-- 부서아이디가 MKT, SYS, STG 에 속한 모든 사원 조회


/******************************************************
	특정 문자열 검색 : 와일드 문자(%, _) + LIKE 연산자
					% : 전체, _ : 한글자
    형식> SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] LIKE '와일드 문자 포함 검색어';		 
******************************************************/
-- '한'씨 성을 가진 모든 사원을 조회

-- 영어이름이 'f'로 시작하는 모든 사원을 조회


-- 이메일 이름 중 두번째 자리에 'a'가 들어가는 모든 사원을 조회


-- 이메일 아이디가 4자인 모든 사원을 조회