/***********************
학적과 수강신청 실습 데이터베이스
***********************/
-- DB 생성
create database if not exists `enroll2026`;
show databases;
use enroll2026;
select database();

-- 1. INSTRUCTOR (강사) 테이블
CREATE TABLE INSTRUCTOR (
    instructor_no INT NOT NULL,
    instructor_name VARCHAR(50) NOT NULL,
    age INT,
    gender CHAR(1),
    PRIMARY KEY (instructor_no)
);

-- 2. STUDENT (학생) 테이블
CREATE TABLE STUDENT (
    student_id INT NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    PRIMARY KEY (student_id)
);

-- 3. SUBJECT (과목) 테이블
-- INSTRUCTOR의 PK를 외래키로 참조합니다.
CREATE TABLE SUBJECT (
    subject_no INT NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    class_room VARCHAR(50),
    instructor_no INT,
    PRIMARY KEY (subject_no),
    FOREIGN KEY (instructor_no) REFERENCES INSTRUCTOR(instructor_no)
);

-- 4. CLASS_TIME (강의 시간) 테이블
-- SUBJECT의 PK를 외래키로 참조합니다.
CREATE TABLE CLASS_TIME (
    time_id INT NOT NULL,
    subject_no INT NOT NULL,
    class_time VARCHAR(50),
    PRIMARY KEY (time_id),
    FOREIGN KEY (subject_no) REFERENCES SUBJECT(subject_no)
);

-- 5. ENROLLMENT (수강 신청) 테이블
-- STUDENT와 SUBJECT를 연결하는 다대다(N:M) 해소용 연결 테이블입니다.
CREATE TABLE ENROLLMENT (
    student_id INT NOT NULL,
    subject_no INT NOT NULL,
    grade CHAR(2),
    PRIMARY KEY (student_id, subject_no),
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (subject_no) REFERENCES SUBJECT(subject_no)
);

show tables;
select * from instructor;
desc enrollment;

insert into instructor values(1, '더브라위너', 34, 'M');
insert into instructor values(2, '홀란드', 28, 'M');
insert into instructor values(3, '도쿠', 26, 'M');
insert into instructor values(4, '베르나르두 실바', 36, 'M');
insert into instructor values(5, '알리송', 34, 'M');
insert into instructor values(6, '살라', 34, 'M');
insert into instructor values(7, '렘파드', 44, 'M');
insert into instructor values(8, '드록바', 47, 'M');
insert into instructor values(9, '라이언긱스', 45, 'M');
insert into instructor values(10, '아자르', 34, 'M');