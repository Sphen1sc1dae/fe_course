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
SELECT 
    *
FROM
    employee
WHERE
    salary >= 5000
ORDER BY salary;

-- 2017-01-01 이후 입사한 사원들을 조회
select * from employee where hire_date > '2017-01-01';

-- 입사일이 2015-01-01 이후이거나, 급여가 6000인 이상인 사원들을 조회  
-- ~이거나, ~또는 : OR - 두 개의 조건중 하나만 만족해도 조회가능
select * from employee where hire_date > '2015-01-01' or salary >= 6000;

-- 입사일이 2015-01-01 이후이고, 급여가 6000인 이상인 사원들을 조회  
-- ~이고 : AND - 두 개의 조건이 모두 만족해야만 조회 가능
select * from employee where hire_date > '2015-01-01' and salary >= 6000 order by hire_date;

-- 특정 기간 : 2015-01-01 ~ 2017-12-31 사이에 입사한 모든 사원 조회
-- 부서기준으로 오름차순 정렬
select * from employee where hire_date > '2015-01-01' and hire_date < '2017-12-31';

-- 급여가 6000 이상 8000 이하인 사원들을 모두 조회
select * from employee where salary >= 6000 and salary <= 8000;

-- MKT 부서의 사원들의 사번, 사원명, 입사일, 이메일, 급여, 보너스(급여의 20%) 조회
-- 급여가 NULL인 사원의 보너스는 기본 50
-- 보너스가 1000 이상인 사원 조회
-- 보너스가 높은 사원 기준으로 정렬


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
select * from employee where hire_date between '2015-01-01' and '2017-12-13';

-- 급여가 6000 이상 8000 이하인 사원들을 모두 조회
select * from employee where salary between 6000 and 8000;

-- IN
-- 사원명이 '일지매','오삼식','김삼순' 인 사원들을 조회
select * from employee where emp_name in ('일지매', '오삼식', '김삼순');
select * from employee where emp_name = '오삼식' or emp_name = '김삼순' or emp_name = '일지매';

-- 부서아이디가 MKT, SYS, STG 에 속한 모든 사원 조회
select * from employee where dept_id in ('MKT', 'SYS', 'STG') order by dept_id;

/******************************************************
	특정 문자열 검색 : 와일드 문자(%, _) + LIKE 연산자
					% : 전체, _ : 한글자
    형식> SELECT [컬럼리스트] FROM [테이블]
            WHERE [컬럼명] LIKE '와일드 문자 포함 검색어';		 
******************************************************/
-- '한'씨 성을 가진 모든 사원을 조회
select * from employee where emp_name like '한%';

-- 영어이름이 'f'로 시작하는 모든 사원을 조회
select * from employee where eng_name like 'f%';

-- 이메일 이름 중 두번째 자리에 'a'가 들어가는 모든 사원을 조회
select * from employee where email like '_a%';

-- 이메일 아이디가 4자인 모든 사원을 조회
select * from employee where email like '____@%';

-- 부서아이디에 'A'가 포함되어 있는 모든 사원 조회
select * from employee where dept_id like '%A%';

/******************************************************
	내장함수 : 숫자함수, 문자함수, 날짜함수
    호출되는 위치 - [컬럼리스트], [조건절의 컬럼명]	 
******************************************************/
-- [숫자함수]
-- 함수 실습을 위한 테이블 : DUAL
-- (1) 절대값 : abs(숫자)
show tables;
select abs(100), abs(-100), 100, -100 from dual;

-- (2) 소수점 절삭 : floor(숫자), truncate(숫자, 자릿수)
select floor(123.456), truncate(123.456), truncate(123.456, 2)
	from dual;
    
-- 사원테이블의 sys 부서 사원들의 사번, 사원명, 부서아이디, 폰번호, 급여, 보너스(급여의 25%)컬럼을 추가하여 조회
SELECT 
    emp_id,
    emp_name,
    dept_id,
    phone,
    salary,
    TRUNCATE(salary * 0.25, 1) AS bonus
FROM
    employee
WHERE
    dept_id = 'SYS';
    
-- (3) rand() : 임의의 난수를 생성 (범위 0 ~ 1)
select rand() from dual;

-- 정수 3자리(0~999) 사이의 난수 발생
select floor(rand() * 1000) as number from dual;

-- 정수 4자리(0~9999) 사이의 난수 발생, 소수점 2자리
select truncate(rand() * 10000, 2) as number from dual;

-- (4) mod(숫자, 나누는 숫자) : 나머지 함수
select mod(123, 2) as odd, mod(124, 2) as even from dual;

-- 3자리 수를 랜덤으로 발생시켜, 2로 나누어 홀수, 짝수를 검출
select mod(floor((rand() * 1000)+1), 2) as numb from dual;

-- [문자함수]
-- (1) concat(문자열1, 문자열2) : 문자열 결합 함수
select concat('안녕하세요~', 'MySQL', ' 공부중입니다') as str from dual;

-- 사원테이블의 사원번호, 사원명, 사원명2 컬럼을 생성하여 초기화
-- 사원명2 컬럼을 데이터 형식 : 예) S0001(홍길동)
select emp_id, emp_name, concat(emp_id, '(', emp_name, ')') as emp_id2 from employee;

-- 사번, 사원명, 영어이름, 입사일, 폰번호, 급여를 조회
-- 영어이름의 출력형식을 '홍길동/hong' 타입으로 출력
-- 영어이름이 null인 경우에는 'smith'를 기본으로 조회
SELECT 
    emp_id,
    emp_name,
    CONCAT(emp_name, '/', IFNULL(eng_name, 'smith')) AS eng_name,
    hire_date,
    phone,
    salary
FROM
    employee
ORDER BY emp_id;
    
-- (2) substring(문자열, 위치, 갯수) : 문자열 추출, 공백도 문자열 포함
select substring('대한민국 홍길동', 1, 4) as str1, substring('대한민국 홍길동', 6, 3) as str2 from dual;

-- 사원테이블의 사원번호, 사원명, 입사년도, 입사월, 입사일, 급여를 조회
SELECT 
    emp_id,
    emp_name,
    SUBSTRING(hire_date, 1, 4) AS hire_yeer,
    SUBSTRING(hire_date, 6, 2) AS hire_month,
    SUBSTRING(hire_date, 9, 2) AS hire_day,
    salary
FROM
    employee;
    
-- 2015년도 입사한 모든 사원 조회
SELECT 
	*
FROM
    employee
WHERE
	substring(hire_date, 1, 4) = '2015';
    
-- 2018년도에 입사한 정보시스템(sys) 부서 사원 조회
SELECT 
    *
FROM
    employee
WHERE
    SUBSTRING(hire_date, 1, 4) = '2018'
        AND dept_id = 'sys';
        
-- (3) left(문자열, 갯수), right(문자열, 갯수) : 왼쪽, 오른쪽 기준으로 문자열 추출
SELECT 
	left(curdate(), 4) as year,
    substring(curdate(), 6, 2) as month,
    right(curdate(), 2) as day
FROM
    dual;

-- 2018년 입사한 모든 사원 조회
select * from employee where left(hire_date, 4) = '2018';

-- 2015년 부터 2017년 사이에 입사한 모든 사원 조회
select * from employee where left(hire_date, 4) between '2015' and '2017';

-- 사원번호, 사원명, 입사일, 폰번호, 급여를 조회
-- 폰번호는 마지막 4자리만 출력
select emp_id, emp_name, hire_date, right(phone, 4), salary from employee;

-- (4) upper(문자열), lower(문자열) : 대, 소문자로 치환
SELECT 
    UPPER('welcomeToMysql!!') AS upper,
    LOWER('WelcomeToMYSQL!!') AS lower
FROM DUAL;

-- 사번, 사원명, 영어이름, 부서아이디, 이메일, 급여를 조회
-- 영어이름은 대문자, 부서아이디는 소문자, 이메일은 대문자
SELECT 
    emp_id,
    emp_name,
    UPPER(ifnull(eng_name, '')) as eng_name,
    LOWER(dept_id),
    UPPER(email),
    salary
FROM
    employee;
    
-- (5) trim(문자열) : 앞, 뒤 공백제거
select trim('            대한민국') as t1, trim('대한민국           ') as t2, trim('   대한민국      ') as t3, trim('    대한  민국    ') as t4 from dual;

-- (6) format(문자열, 소수점자리) : 문자열 포맷 - 3자리 콤마 구분
select format(123456, 0) as format1, format('123456', 0) as format2 from dual;

-- 사번, 사원명, 입사일, 폰번호, 급여, 보너스(급여의 20%)를 조회
-- 급여, 보너스는 소수점 없이 3자리 콤마(,)로 구분하여 출력
-- 급여가 null인 경우에는 기본값 0 
-- 2016년부터 2017년 사이에 입사한 사원
-- 사번 기준으로  내림차순 정렬 
SELECT 
    emp_id,
    emp_name,
    hire_date,
    phone,
    CONCAT(FORMAT(IFNULL(salary, 0), 0), '원') AS salary,
    CONCAT(FORMAT(salary * 0.2, 0), '원') AS bonus
FROM
    employee
WHERE
    LEFT(hire_date, 4) BETWEEN '2016' AND '2017'
ORDER BY emp_id;

-- [날짜 함수]
-- curdate() : 년-원-일
-- sysdate(), now() : 년-월-일-시-분-초 형식으로 현재날짜 출력
SELECT CURDATE() AS today1, SYSDATE() AS today2, NOW() AS today3 FROM DUAL;

-- [형변환 함수]
-- cast(변환값 as 데이터타입)
-- convert(변환값 as 데이터타입) :: MySQL OLD
SELECT 123 AS number, CAST(123 AS CHAR) FROM DUAL;
SELECT '1234' AS str, CAST('1234' AS SIGNED INTEGER) AS number FROM DUAL;
SELECT '20260421' AS str, CAST('20260421' AS DATE) AS date1 FROM DUAL;

-- now()
SELECT 
    NOW() AS date,
    CAST(NOW() AS CHAR) AS string,
    CAST(CAST(NOW() AS CHAR) AS DATE) AS datetime
FROM DUAL;

-- signed integer, unsigned integer
SELECT 
    '1234' AS string,
    CAST('1234' AS SIGNED INTEGER) AS cast_int,
    CAST('1234' AS UNSIGNED INTEGER) AS cast_int,
    CAST('1234' AS DECIMAL(10, 2)) AS cast_decimal
FROM DUAL;

-- [문자열 치환 함수]
-- replace(문자열, old, new)
SELECT '홍-길-동' AS old, REPLACE('홍-길-동', '-', '/') AS new FROM DUAL;

-- 사원테이블의 사번, 사원명, 입사일, 퇴사일, 부서아이디, 폰번호, 급여를 조회
-- 입사일, 퇴사일 출력은 '-'을 '/'로 치환하여 출력
-- 재직중인 사원은 현재날짜를 출력
-- 급여 출력시 3자리 콤마(,) 구분 
SELECT 
    emp_id,
    emp_name,
    REPLACE(hire_date, '-', '/') AS hire_date,
    REPLACE(IFNULL(retire_date, CURDATE()),
        '-',
        '/') AS retire_date,
    dept_id,
    phone,
    FORMAT(salary, 0) AS salary
FROM
    employee;
    
-- '20150101' 입력된 날짜를 기준으로 해당 날짜 이후에 입사한 사원들을 모두 조회
-- 모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
SELECT 
    *
FROM
    employee
WHERE
    hire_date >= CAST('20150101' AS DATE);
    
-- '20150101' ~ '20171231' 사이에 입사한 사원들을 모두 조회
-- 모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
SELECT 
    *
FROM
    employee
WHERE
    hire_date BETWEEN CAST('20150101' AS DATE) AND CAST('20171231' AS DATE);
    
/******************************************************
	집계(그룹) 함수 : sum(), avg(), count(), min(), max() ..
    group by - 그룹함수를 적용하기 위한 그룹핑 컬럼 정의
    having - 그룹함수에서 사용하는 조건절
	** 그룹함수는 그룹핑이 가능한 컬럼에 적용하는것이 Good!!
******************************************************/
select * from employee;
-- (1) sum(숫자) : 전체 총 합을 구하는 함수
-- 사원테이블의 총 급여를 조회, 2026-04-21 기준 급여가 null 이면 0 으로 기본값 정의
SELECT 
    CONCAT(FORMAT(SUM(IFNULL(salary, 0)), 0), '원') AS 총급여
FROM
    employee;

-- (2) avg(숫자) : 전체 평균을 구하는 함수
-- 사원들의 전체 급여 평균을 조회, 3자리씩 ','로 구분하고 앞에 '$' 표시
-- 2026-04-21 기준 급여가 null이면 0으로 기본값 정의, 소수점은 절삭
SELECT 
    CONCAT('$', FORMAT(FLOOR(avg(IFNULL(salary, 0))), 0)) AS avg
FROM
    employee;
    
-- 정보시스템(sys) 부서 전체의 급여 총액과 평균을 조회
-- 3자리 구분, 마지막 '만원' 표시
SELECT 
    CONCAT(FORMAT(SUM(salary), 0), '만원') AS sum,
    FORMAT(AVG(salary), 0) AS avg
FROM
    employee
WHERE
    dept_id = 'sys';
    
-- (3) max(숫자) : 최대값을 구하는 함수
-- 사원테이블에서 가장 높은 급여를 받는 사원 조회
use hrdb2019;
select database();
select concat(format(max(salary), 0), '만원') as 최고급여 from employee;

-- (4) mix(숫자) : 최소값을 구하는 함수
-- 사원테이블에서 가장 낮은 급여를 받는 사원 조회
select concat(format(min(salary), 0), '만원') as 최소급여 from employee;
    
-- 사원들의 총급여, 평균급여, 최대급여, 최소급여를 조회
-- 3자리 구분, 화폐단위 '만원' 추가
-- 현재날짜 기준 급여컬럼이 null인 경우에는 0으로 치환
select  concat(format(sum(ifnull(salary, 0)), 0), '만원') as 총급여,
		concat(format(avg(ifnull(salary, 0)), 0), '만원') as 평균급여,
		concat(format(max(ifnull(salary, 0)), 0), '만원') as 최대급여,
		concat(format(min(ifnull(salary, 0)), 0), '만원') as 최소급여
	from employee;

-- (5) count(컬럼) : 조건에 맞는 데이터의 row 수를 조회, null은 제외
-- 사원테이블의 전체 로우수
select count(*) from employee; 		-- 20
select count(salary) from employee; -- 19
select count(emp_id) from employee; -- 20

-- 재직중인 사원수 조회 : 16
select count(*)
	from employee
    where retire_date is null;

select  count(*) - count(retire_date) as '재직자',
		count(retire_date) as '퇴사자'
		from employee;

-- 퇴사한 사원수 조회	
select count(retire_date) from employee;
    
-- '2015년'에 입사한 사원수 조회
select count(*)
	from employee
    where left(hire_date, 4) = '2015';

-- 정보시스템(SYS) 부서의 사원수 조회
select count(*)
	from employee
    where dept_id = 'sys';
    
-- 가장 빠른 입사자, 가장 늦은 입사자의 입사일을 조회    
select  min(hire_date), 
		max(hire_date)
	from employee;

-- 가장 빠른 입사자의 정보 조회
select *
	from employee
    where hire_date  = '2013-01-01';

select *
	from employee
    where hire_date  = (select min(hire_date) from employee);

-- [group by] : ~별, 부서별 사원수, 입사날짜별 총급여.. 
-- 그룹함수와 일반컬럼은 함께 사용 불가, 사용을 하려면 일반컬럼을 group by로 그룹핑 진행
-- 단, group by 대상인 일반 컬럼은 그룹핑이 가능해야함
select count(salary), salary  
	from employee
    group by salary;  -- salary 데이터를 그룹핑한 후 count(salary) 적용
    
-- 부서별 사원수, 총급여, 평균급여 조회
-- null은 0으로 치환
-- 3자리 구분, 소수점 절삭
select 	dept_id as 부서ID, 
		count(*) as 사원수, 
        format(sum(ifnull(salary,0)), 0) as 총급여, 
        format(floor(avg(ifnull(salary,0))), 0) as 평균급여,
        format(max(ifnull(salary,0)), 0) as 최대급여,
        format(min(ifnull(salary,0)), 0) as 최소급여
	from employee
    group by dept_id;

-- 입사년도별, 사원수, 총급여, 평균급여, 최대급여, 최소급여 조회
-- 소수점 X, 3자리 구분
select 	left(hire_date, 4) as '입사년도', 
		count(*) as '사원수',
        format(sum(salary), 0) as '총급여',
        format(truncate(avg(salary), 0), 0) as '평균급여',
        format(max(salary), 0) as '최대급여',
        format(min(salary), 0) as '최소급여'
	from employee
    group by left(hire_date, 4);

-- [having 조건절] 그룹함수 또는 group by 결과에 대한 조건을 정의 
-- 부서별 총급여 조회
-- 총급여가 30000 이상인 부서만 출력
select 	dept_id, 
		sum(ifnull(salary, 0)) as '총급여'
	from employee    
    group by dept_id
    having sum(ifnull(salary, 0)) >= 30000;
    -- having '총급여' >= 30000;  

-- 연도별, 사원수, 총급여, 평균급여, 최대급여, 최소급여 조회
-- 소수점 X, 3자리 구분
-- 총급여가 30000 이상인 년도 출력
-- 급여 협상이 안된 사원은 제외
select 	left(hire_date, 4) as '입사년도', 
		count(*) as '사원수',
        format(sum(salary), 0) as '총급여',
        format(truncate(avg(salary), 0), 0) as '평균급여',
        format(max(salary), 0) as '최대급여',
        format(min(salary), 0) as '최소급여'
from employee
where salary is not null
group by left(hire_date, 4)
having sum(salary) > 30000;

-- [rollup 함수] 리포팅을 위한 함수
-- 부서별 사원수, 총급여, 평균급여 조회
select  dept_id as '부서ID',
		count(*) as '사원수',
		sum(ifnull(salary, 0)) as '총급여',
        floor(avg(ifnull(salary, 0))) as '평균급여'
from employee
group by dept_id with rollup;

-- rollup한 결과의 부서아이디를 추가
select  if(grouping(dept_id), '총합계', ifnull(dept_id, '-')) as dept_id,
		count(*) as '사원수',
		sum(ifnull(salary, 0)) as '총급여',
        floor(avg(ifnull(salary, 0))) as '평균급여'
from employee
group by dept_id with rollup;

-- 연도별, 사원수, 총급여, 평균급여, 최대급여, 최소급여 조회, rollup 함수 적용
-- 💥‼ grouping 함수안에는 함수를 넣을수 없음,
-- 💥if(grouping(left(hire_date, 4)), '총합계', ifnull(left(hire_date, 4), '-')) as hire_date,
select 	if(grouping(year), '총합계', ifnull(year, '-')) as hire_date,
		count(*) as '사원수',
        format(sum(salary), 0) as '총급여',
        format(truncate(avg(salary), 0), 0) as '평균급여',
        format(max(salary), 0) as '최대급여',
        format(min(salary), 0) as '최소급여'
from employee,
	 (select emp_id, left(hire_date, 4) year
		from employee) T1
where employee.emp_id = T1.emp_id and salary is not null
group by year with rollup;

-- [limit 함수] 출력갯수를 제한하여 조회
-- 오라클의 rownum 함수와 동일

-- 전체 사원 리스트 중 상위 5개만 출력
select * from employee limit 5;

-- 최대 급여를 받는 사원을 순서대로 3명 조회
SELECT 
    *
FROM
    employee
ORDER BY salary DESC
LIMIT 3;

/******************************************************
	조인(JOIN) : 두 개이상의 테이블을 연동하여 하나의 데이셋 구성
    ERD(Entity Relationship Diagram): 데이터베이스 설계도(구조도)
    
    ** ANSI SQL : 데이터베이스 시스템들의 표준 SQL **
    ** 조인(JOIN) 종류 **
    (1) CROSS JOIN(CATEISIAN:카테이션) - 합집합
        : 테이블의 데이터 전체를 조인 
        예) 테이블1(10개) * 테이블2(10개) = 100개
	(2) INNER JOIN(EQUI) - 교집합
		: 두 개이상의 테이블들이 조인연결고리를 통해 조인 실행
	(3) OUTER JOIN - INNER JOIN + 조인에서 제외한 ROW 포함
		LEFT OUTER JOIN - 왼쪽의 테이블의 ROW 포함
        RIGHT OUTER JOIN - 오른쪽 테이블의 ROW 포함
	(4) SELF JOIN - 한(자신) 테이블을 두 개(자신, 사본)의 테이블처럼 조인 
🍿 형식2 = ORACLE 형식
******************************************************/
-- [cross join]
-- 형식1 > SELECT [컬럼리스트]
-- 	FROM [테이블1] CROSS JOIN [테이블2]
-- 	WHERE [조건절] 
-- 형식2 (Oracle 형식) > SELECT [컬럼리스트]
-- 	FROM [테이블1], [테이블2]
-- 	WHERE [조건절] 

-- employee, department cross join
select count(*) from employee;
select count(*) from department;
select count(*) from unit;
select count(*) from employee cross join department;
select count(*) from employee cross join department cross join unit;
select * from employee cross join department cross join unit;
select count(*) from employee, department;

-- 사원, 휴가, 부서 테이블을 cross join
select count(*) from employee cross join vacation cross join department;

-- [INNER JOIN(EQUI JOIN)]
-- 형식1 > SELECT [컬럼리스트]
-- 	FROM [테이블1] INNER JOIN [테이블2]
-- 		ON [테이블1.조인컬럼] = [테이블2.조인컬럼]
-- 형식2 > SELECT [컬럼리스트]
-- 	FROM [테이블1], [테이블2]
-- 	WHERE [테이블1.조인컬럼] = [테이블2.조인컬럼]

SELECT 
    COUNT(*)
FROM
    employee
        INNER JOIN
    department ON employee.dept_id = department.dept_id;
-- Oracle 형식    
select count(*) from employee, department where employee.dept_id = department.dept_id;

-- 사원테이블, 부서테이블, 본부테이블 inner join
select * from employee inner join department on employee.dept_id = department.dept_id inner join unit on department.unit_id = unit.unit_id;
select * from employee e inner join department d on e.dept_id = d.dept_id inner join unit u on d.unit_id = u.unit_id;
-- -> 오라클 형식도 유사한 방법

-- 모든 사원들의 사원번호, 사원명, 부서아이디, 부서명, 입사일, 급여를 조회
SELECT 
    emp_id, emp_name, e.dept_id, dept_name, hire_date, salary
FROM
    employee e
        INNER JOIN
    department d ON e.dept_id = d.dept_id;

-- 영업부에 속한 사원들의 사원명, 입사일, 퇴사일, 급여, 부서아이디, 부서명을 조회
-- 재직중인 사원은 현재 날짜로 출력
SELECT 
    emp_name,
    hire_date,
    IFNULL(retire_date, CURDATE()) AS retire_date,
    salary,
    d.dept_id,
    dept_name
FROM
    employee e,
    department d
WHERE
    e.dept_id = d.dept_id
        AND d.dept_name = '영업';
        
-- '2015'년도에 입사자들의 사번, 사원명, 입사일, 부서명, 본부아이디, 본부명을 조회
SELECT 
    emp_id, emp_name, hire_date, dept_name, u.unit_id, unit_name
FROM
    employee e,
    department d,
    unit u
WHERE
    e.dept_id = d.dept_id
        AND d.unit_id = u.unit_id
        AND LEFT(e.hire_date, 4) = '2015';
        
-- 인사과에 속한 사원들 중에 휴가를 사용한 사원의 내역 조회
-- 부서명은 '인사'
SELECT 
    *
FROM
    employee e,
    department d,
    vacation v
WHERE
    e.dept_id = d.dept_id
        AND e.emp_id = v.emp_id
        AND d.dept_name = '인사';
-- 위 (오라클) , 아래 (ANSI SQL)
SELECT 
    *
FROM
    employee e
        INNER JOIN
    department d ON e.dept_id = d.dept_id
        INNER JOIN
    vacation v ON e.emp_id = v.emp_id
WHERE
    d.dept_name = '인사';

-- 사원별 휴가사용 일수를 조회, 사원아이디, 사원명, 휴가일수 출력
-- 사용일수 기준 내림차순 정렬, 상위 5명 출력
SELECT 
    e.emp_id, emp_name, COUNT(*) as count
FROM
    employee e,
    vacation v
WHERE
    e.emp_id = v.emp_id
GROUP BY e.emp_id
ORDER BY e.emp_id
LIMIT 5;

-- 영업사원의 사원명, 폰번호, 부서명, 휴가사용 이유 조회
-- 휴가 사용 이유가 '두통'인 사원, 소속본부 조회
SELECT 
    emp_name, phone, dept_name, reason, unit_name
FROM
    employee e,
    department d,
    vacation v,
    unit u
WHERE
    e.dept_id = d.dept_id
        AND e.emp_id = v.emp_id
        AND d.unit_id = u.unit_id
        AND reason = '두통';

-- 2014년부터 2016년까지 입사한 사원들 중에서 퇴사하지 않은 사원들의
-- 사원아이디, 사원명, 부서명, 입사일, 소속본부를 조회 
-- 소속본부 기준으로 오름차순 정렬  
SELECT 
    emp_id,
    emp_name,
    dept_name,
    LEFT(hire_date, 4) AS hire_date,
    unit_name
FROM
    employee e,
    department d,
    unit u
WHERE
    e.dept_id = d.dept_id
        AND d.unit_id = u.unit_id
        AND LEFT(hire_date, 4) BETWEEN '2014' AND '2016'
        AND retire_date IS NULL
ORDER BY unit_name;

-- 부서별 총급여, 평균급여, 총휴가사용일수 조회
-- 부서명, 부서아이디, 총급여, 평균급여, 휴가사용일수
SELECT 
    d.dept_name,
    d.dept_id,
    concat(format(sum(e.salary), 0), '원') as sum_salary,
    concat(format(truncate(avg(salary), 2), 0), '원') AS avg_salary,
    count(v.emp_id) as vacation
FROM
    employee e,
    department d,
    vacation v
WHERE
    e.dept_id = d.dept_id
        AND e.emp_id = v.emp_id
GROUP BY d.dept_id;
-- , d.dept_name;

-- 본부별 > 부서별 > 사원별로 그룹핑 한 후, 부서의 휴가사용 일수를 조회
SELECT 
    u.unit_name, dept_name, e.emp_name, sum(v.duration) as '휴가사용 일수'
FROM
    employee e,
    department d,
    vacation v,
    unit u
WHERE
    e.dept_id = d.dept_id
        AND e.emp_id = v.emp_id
        AND d.unit_id = u.unit_id
GROUP BY u.unit_id, d.dept_id, e.emp_id;

-- [OUTER JOIN]
-- 오라클 : INNER JOIN(EQUI JOIN) 문법에 (+) 코드를 추가하여 사용
-- 현재 오라클 문법은 MySQL에서는 사용 불가 
-- 형식1> SELECT [컬럼리스트]
-- 		 FROM [테이블1] LEFT/RIGHT OUTER JOIN [테이블2]   
-- 					   ON [테이블1.조인컬럼] = [테이블2.조인컬럼]  

select count(distinct dept_id) from employee;
select count(dept_id) from department;

-- LEFT OUTER JOIN : LEFT에 부서테이블 위치
SELECT
    d.dept_id, d.dept_name, COUNT(emp_id) as '사원수'
FROM
	department d left outer join employee e on d.dept_id = e.dept_id
GROUP BY d.dept_id;

-- RIGHT OUTER JOIN : RIGHT에 부서테이블 위치
-- 부서별 사원수 조회, 전체 부서 출력 !!
SELECT
    d.dept_id, d.dept_name, COUNT(emp_id) as '사원수'
FROM
	employee e right outer join department d on d.dept_id = e.dept_id
GROUP BY d.dept_id;

-- 모든 부서의 아이디, 부서명, 본부명을 조회
-- 본부에 속하지 않는 부서는 '준비중'으로 출력
SELECT 
    d.dept_id,
    d.dept_name,
    IFNULL(u.unit_name, '준비중') AS unit_name
FROM
    department d
        LEFT OUTER JOIN
    unit u ON d.unit_id = u.unit_id;
-- OUTER JOIN 은 누락된 컬럼 까지 전부 고려함.

-- 본부별, 부서의 휴가 사용일수를 조회
-- 부서의 누락없이 모두 출력

SELECT 
    u.unit_id,
    d.dept_id,
    d.dept_name,
    SUM(IFNULL(v.duration, 0)) AS '휴가사용일수'
FROM
    employee e
        RIGHT OUTER JOIN
    department d ON e.dept_id = d.dept_id
        LEFT OUTER JOIN
    unit u ON d.unit_id = u.unit_id
        LEFT OUTER JOIN
    vacation v ON e.emp_id = v.emp_id
GROUP BY u.unit_id , d.dept_id
ORDER BY SUM(IFNULL(v.duration, 0)) DESC; -- u.unit_id

-- 2017년부터 2018년도까지 입사한 사원들의 사원명, 입사일, 연봉, 부서명, 본부명 조회
-- 단, 퇴사한 사원들 제외
explain
SELECT 
    emp_name, hire_date, salary, dept_name, unit_name
FROM
    employee e
        RIGHT OUTER JOIN
    department d ON e.dept_id = d.dept_id
        LEFT OUTER JOIN
    unit u ON d.unit_id = u.unit_id
where e.retire_date is null; -- left(hire_date, 4) between '2017' and '2018';

-- 서브 쿼리 방법으로 표현한 구조
SELECT 
    e.emp_name, e.hire_date, e.salary, d.dept_name, u.unit_name
FROM
    (SELECT 
        emp_name, hire_date, salary, dept_id
    FROM
        employee
    WHERE
        retire_date IS NULL) e
        RIGHT OUTER JOIN
    department d ON e.dept_id = d.dept_id
        LEFT OUTER JOIN
    unit u ON d.unit_id = u.unit_id;
    
-- [SELF JOIN] 자신의 테이블을 조인
-- SELF 조인은 서브쿼리 형식으로 변환하여 사용됨!
-- 형식1> SELECT [컬럼리스트]
-- 	    FROM [테이블원본] LEFT/RIGHT JOIN [테이블사본]
--      				ON [테이블원본.조인컬럼] = [테이블사본.조인컬럼]
-- 형식2> SELECT [컬럼리스트]
-- 	    FROM [테이블원본], [테이블사본]
--      WHERE [테이블원본.조인컬럼] = [테이블사본.조인컬럼]

select * from employee e1, employee e2 where e1.emp_id = e2.emp_id;
-- == 같은 의미. 예전에는 self join 이 쓰였었지만 이제는 left(또는, outer) join 으로 쓰인다.
select * from employee e1 left join employee e2 on e1.emp_id = e2.emp_id;

/******************************************************
	서브쿼리(SubQuery) : 메인 쿼리에 다른 쿼리를 추가하여 실행 방식
    -> (쿼리작성) 괄호안에 쿼리를 작성하여 메인쿼리에 추가
    형식> SELECT [컬럼리스트 추가 -> (스칼라 서브쿼리)] 🍿 오라클 사용 X
		FROM [테이블 추가 -> (인라인뷰)]
        WHERE [조건절 -> (서브쿼리)]
******************************************************/
-- [서브쿼리 : 단일행 - '='로 비교함]
-- '정보시스템' 부서의 사원들의 사번, 사원명, 입사일, 부서아이디, 급여 조회
SELECT 
    emp_id, emp_name, hire_date, dept_id, salary
FROM
    employee
WHERE
    dept_id = (SELECT 
            dept_id
        FROM
            department
        WHERE
            dept_name = '정보시스템');
-- -> 서브쿼리 구문이 단일행인지 확인해 볼 것.        
-- 서브쿼리 구조와 INNER JOIN 을 사용한 구조. 서로 같은 결과.
SELECT 
    emp_id, emp_name, hire_date, e.dept_id, salary
FROM
    employee e,
    department d
WHERE
    e.dept_id = d.dept_id
        AND d.dept_name = '정보시스템';
-- [서브쿼리 : 단일행], 서브쿼리 내부 select 로 불러오는 컬럼 PK 로 맞추는거 잊지말기        
-- 홍길동 사원이 속한 부서아이디, 부서명, 부서 오픈일 조회
SELECT 
    dept_id, dept_name, start_date
FROM
    department
WHERE
    dept_id = (SELECT 
            dept_id
        FROM
            employee
        WHERE
            emp_name = '홍길동');
            
-- 홍길동 사원의 휴가사용 내역 조회
SELECT 
    vacation_id,
    emp_id,
    (SELECT 
            emp_name
        FROM
            employee
        WHERE
            emp_name = '홍길동') AS emp_name, -- 권장 X (서브쿼리 중첩 가능)
    begin_date,
    end_date,
    reason,
    duration
FROM
    vacation
WHERE
    emp_id = (SELECT 
            emp_id
        FROM
            employee
        WHERE
            emp_name = '홍길동');

-- [서브쿼리 : 단일행]
-- '제3본부'에 속한 모든 부서를 조회
select * from department where unit_id = (select unit_id from unit where unit_name = '제3본부');

-- [서브쿼리 : 단일행, 아래 전부 단일행]
-- 최고 연봉을 받는 사원 정보 조회
select * from employee where salary = (select max(salary) from employee);

-- 가장 최근에 입사한 사원 정보 조회
select * from employee where hire_date = (select max(hire_date) from employee);

-- 가장 먼저 퇴사한 사원 정보 조회
select * from employee where retire_date = (select min(retire_date) from employee);

-- [서브쿼리 : 단일행]
-- 가장 많은 휴가를 사용한 사원이 속한 부서의 모든 사원들을 조회
SELECT 
    *
FROM
    employee
WHERE
    dept_id = (SELECT 
            dept_id
        FROM
            employee
        WHERE
            emp_id = (SELECT 
                    emp_id
                FROM
                    vacation
                ORDER BY duration DESC
                LIMIT 1));

-- 이렇게도 표현
select * from employee where dept_id = (select distinct e.dept_id from employee e, vacation v where e.emp_id = v.emp_id and e.emp_id = (select v.emp_id from vacation order by duration desc limit 1));

-- [서브쿼리 : 다중행 - IN, EXITST ..]
-- '제3본부'에 속한 모든 사원 정보 조회
-- dept_id 가 2개인데(ADV, MKT) 그 중 하나인 ADV 에 사원 정보가 없어서 결과는 MKT 에 대한 컬럼만 출력
SELECT 
    *
FROM
    employee
WHERE
    dept_id IN (SELECT 
            dept_id
        FROM
            department
        WHERE
            unit_id IN (SELECT 
                    unit_id
                FROM
                    unit
                WHERE
                    unit_name = '제3본부'));
                    
SELECT dept_id FROM department WHERE unit_id IN (SELECT unit_id FROM unit WHERE unit_name = '제3본부');

-- '제3본부'에 속한 모든 사원의 휴가 사용 정보 조회
SELECT 
    *
FROM
    vacation
WHERE
    emp_id IN (SELECT 
            emp_id
        FROM
            employee
        WHERE
            dept_id IN (SELECT 
                    dept_id
                FROM
                    department
                WHERE
                    unit_id = (SELECT 
                            unit_id
                        FROM
                            unit
                        WHERE
                            unit_name = '제3본부')));
                            
-- 휴가를 한 번이라도 사용한 모든 사원 조회
select * from employee e where exists (select 1 from vacation v where e.emp_id = v.emp_id);

-- [인라인뷰 : 메인쿼리의 테이블 자리에 들어가는 쿼리 형식]
-- 사원별 휴가사용 일수를 그룹핑하여, 사원번호, 사원명, 입사일, 급여, 휴가사용일수를 조회
select emp_id, sum(duration) as count from vacation group by emp_id;
select
 e.emp_id, emp_name, hire_date, salary, vac.count as '휴가사용일수' 
	from employee e, (select emp_id, sum(duration) as count from vacation group by emp_id) vac 
	where e.emp_id = vac.emp_id;
    
-- ANSI SQL
select
 e.emp_id, emp_name, hire_date, salary, vac.count as '휴가사용일수' 
	from employee e inner join (select emp_id, sum(duration) as count from vacation group by emp_id) vac 
	on e.emp_id = vac.emp_id;
    
-- [휴가를 사용한 사원 + 사용하지 않은 사원 포함]
-- 사원별 휴가사용 일수를 그룹핑하여, 사원번호, 사원명, 입사일, 급여, 휴가사용일수를 조회
-- 휴가를 사용하지 않은 사원의 휴가사용일수는 0
-- 휴가사용일수는 내림차순 정렬
SELECT 
    e.emp_id,
    e.emp_name,
    e.hire_date,
    e.salary,
    IFNULL(v.count, 0) AS count
FROM
    employee e
        LEFT OUTER JOIN
    (SELECT 
        emp_id, SUM(duration) AS count
    FROM
        vacation
    GROUP BY emp_id
    ORDER BY SUM(duration) DESC) v ON e.emp_id = v.emp_id;
    
-- '2015' ~ '2017'년도 입사한 사원들의 휴가사용 일수 조회
select emp_id, sum(duration) as count from vacation group by emp_id;
select * from employee where left(hire_date, 4) between '2015' and '2017';

SELECT 
    t2.emp_id,
    t2.emp_name,
    t2.hire_date,
    IFNULL(t1.count, 0) AS count
FROM
    (SELECT 
        emp_id, SUM(duration) as count
    FROM
        vacation
    GROUP BY emp_id) t1
        RIGHT OUTER JOIN
    (SELECT 
        *
    FROM
        employee
    WHERE
        LEFT(hire_date, 4) BETWEEN '2015' AND '2017') t2 ON t1.emp_id = t2.emp_id
ORDER BY count DESC;

-- 1) 부서별 총급여, 평균급여를 조회
select dept_id, sum(ifnull(salary, 0)) sum, floor(avg(ifnull(salary, 0))) avg from employee group by emp_id;

-- 2) 부서테이블과 조인하여 모든 부서의 총급여, 평균급여 출력
SELECT 
    d.dept_id,
    d.dept_name,
    IFNULL(d.unit_id, 0) AS unit_id,
    d.start_date,
    IFNULL(t1.sum, 0) AS sum,
    IFNULL(t1.avg, 0) AS avg
FROM
    department d
        LEFT OUTER JOIN
    (SELECT 
        dept_id,
            SUM(IFNULL(salary, 0)) sum,
            FLOOR(AVG(IFNULL(salary, 0))) avg
    FROM
        employee
    GROUP BY emp_id) t1 ON d.dept_id = t1.dept_id;
    
-- 3) 사원테이블을 조인하여 사원명, 급여, 부서아이디, 부서명, 총급여, 평균급여 조회
SELECT 
    e.emp_name, e.salary, e.dept_id, dd.dept_name, dd.sum, dd.avg
FROM
    employee e
        INNER JOIN
    (SELECT 
        d.dept_id,
            d.dept_name,
            IFNULL(d.unit_id, 0) AS unit_id,
            d.start_date,
            IFNULL(t1.sum, 0) AS sum,
            IFNULL(t1.avg, 0) AS avg
    FROM
        department d
    LEFT OUTER JOIN (SELECT 
        dept_id,
            SUM(IFNULL(salary, 0)) sum,
            FLOOR(AVG(IFNULL(salary, 0))) avg
    FROM
        employee
    GROUP BY emp_id) t1 ON d.dept_id = t1.dept_id) dd ON e.dept_id = dd.dept_id;
    
-- [스칼라서브쿼리 : 컬럼리스트에 사용하는 서브쿼리 형식] -> 권장 X 매우 비효율
-- 정보시스템(SYS) 부서의 사원정보 출력
-- 정보시스템 부서의 총급여, 평균급여 함께 출력
SELECT 
    emp_id,
    emp_name,
    dept_id,
    salary,
    (SELECT 
            FLOOR(SUM(salary))
        FROM
            employee
        WHERE
            dept_id = 'SYS') AS '총급여',
    (SELECT 
            FLOOR(AVG(salary))
        FROM
            employee
        WHERE
            dept_id = 'SYS') AS '평균급여'
FROM
    employee
WHERE
    dept_id = 'SYS';
select floor(sum(salary)) from employee where dept_id = 'SYS';
select floor(avg(salary)) from employee where dept_id = 'SYS';

/******************************************************
	테이블 결고 합치기 : union, union all
    형식> 쿼리1 실행 결과
		UNION => 중복 제거
        쿼리2 실행 결과
	형식> 쿼리1 실행 결과
		UNION ALL => 중복 허용
        쿼리2 실행 결과
	😎 쿼리1, 쿼리2의 실행 컬럼의 타입과 이름이 같아야 한다.
******************************************************/
-- 영업(MKT), 정보시스템(SYS) 부서의 사원아이디, 사원명, 급여, 부서아이디 조회
-- union을 사용하여 실행결과 합치기
select emp_id, emp_name, salary, dept_id from employee where dept_id = 'MKT'
union
select emp_id, emp_name, salary, dept_id from employee where dept_id = 'SYS'
union
select emp_id, emp_name, salary, dept_id from employee where dept_id = 'MKT';

-- 영업(MKT), 정보시스템(SYS) 부서의 사원아이디, 사원명, 급여, 부서아이디 조회
-- union all을 사용하여 실행결과 합치기
select emp_id, emp_name, salary, dept_id from employee where dept_id = 'MKT'
union all
select emp_id, emp_name, salary, dept_id from employee where dept_id = 'SYS'
union all
select emp_id, emp_name, salary, dept_id from employee where dept_id = 'MKT';