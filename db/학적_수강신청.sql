/********************************
	학적과 수강신청 실습 데이터베이스
********************************/
-- 데이터베이스 생성
-- CREATE DATABASE IF NOT EXISTS `enroll2026`;
show databases;
use enroll2026;
select database();

-- [instructor:강사] 테이블 생성
show tables;
create table instructor(
	instructor_no 		int			auto_increment 		primary key,
    instructor_name		varchar(5)	not null,
    age					int,
    gender				char(1)
);
desc instructor;

-- [student : 학생] 테이블 생성
create table student(
	student_id		int			auto_increment		primary key,
    student_name	varchar(5)	not null,
    address			varchar(50)
);
desc student;

-- [subject : 과목] 테이블 생성
create table subject(
	subject_no		int			auto_increment 		primary key,
    subject_name	varchar(30)	not null,
	class_room		varchar(20),
    instructor_no	int			not null,
    constraint fk_subject_instructor_no	foreign key(instructor_no)
		references instructor(instructor_no)
        on delete cascade
        on update cascade
);
desc subject;
select * from information_schema.table_constraints
	where table_name = 'subject';

-- [class_time : 강의시간] 테이블 생성
create table class_time(
	time_id		int			auto_increment		primary key,
    class_time	varchar(10),
    subject_no 	int			not null,
    constraint fk_class_time_subject_no		foreign key(subject_no)
		references	subject(subject_no)
			on delete cascade
            on update cascade
);
desc class_time;
select * from information_schema.table_constraints
	where table_name = 'class_time';
    

-- [enrollment : 등록] 테이블 생성
create table enrollment(
	student_id		int		not null,
    subject_no		int		not null,
    grade			char(1),
    constraint fk_enrollment_student_id		foreign key(student_id)
		references	student(student_id)
			on delete cascade
            on update cascade,
	constraint fk_subject_subject_no		foreign key(subject_no)
		references subject(subject_no)
			on delete cascade
            on update cascade
);
desc enrollment;
select * from information_schema.table_constraints
	where table_name = 'enrollment';

-- [instructor : 강사] 테이블 데이터 입력
desc instructor;
select * from instructor;    
insert into instructor(instructor_name, age, gender)
			values('스미스', 35, 'M');
insert into instructor(instructor_name, age, gender)
			values('김영희', 30, 'F');
insert into instructor(instructor_name, age, gender)
			values('Anne', 25, 'F');            

-- [student : 학생] 테이블 데이터 입력
-- 학생 테이블의 address 컬럼에 default 제약 추가 : '서울시 강남구'
desc student;
alter table student
	modify address	varchar(30)	 default '서울시 강남구';

select * from student;    
insert into student(student_name) values('정효리');
insert into student(student_name) values('오감자');
insert into student(student_name) values('안경태');
insert into student(student_name) values('정주고');
insert into student(student_name) values('고소해');

-- [subject : 과목] 테이블 데이터 입력
desc subject;
select * from instructor;
select * from subject;
insert into subject(subject_name, class_room, instructor_no)
			value('MySQL', '101호', 1);
insert into subject(subject_name, class_room, instructor_no)
			value('HTML', '103호', 2);
insert into subject(subject_name, class_room, instructor_no)
			value('Oracle', '201호', 1);
insert into subject(subject_name, class_room, instructor_no)
			value('React', '301호', 3);
insert into subject(subject_name, class_room, instructor_no)
			value('NodeJS', '303호', 3);
            
-- [class_time : 강의시간] 테이블 데이터 입력
desc class_time;
select * from subject;
select * from class_time;
insert into class_time(class_time, subject_no) values('120분', 1);
insert into class_time(class_time, subject_no) values('160분', 2);
insert into class_time(class_time, subject_no) values('200분', 3);
insert into class_time(class_time, subject_no) values('120분', 4);
insert into class_time(class_time, subject_no) values('100분', 5);

-- [enrollment : 등록] 테이블 데이터 입력
desc enrollment;
select * from student; 
select * from subject;
select * from enrollment;
insert into enrollment(student_id, subject_no, grade)  values(1, 1, 'A');
insert into enrollment(student_id, subject_no, grade)  values(1, 2, 'B');
insert into enrollment(student_id, subject_no, grade)  values(2, 1, 'C');
insert into enrollment(student_id, subject_no, grade)  values(3, 1, 'A');
insert into enrollment(student_id, subject_no, grade)  values(3, 3, 'A');
insert into enrollment(student_id, subject_no, grade)  values(4, 2, 'D');
insert into enrollment(student_id, subject_no, grade)  values(4, 1, 'A');
insert into enrollment(student_id, subject_no, grade)  values(1, 5, 'C');
insert into enrollment(student_id, subject_no, grade)  values(2, 3, 'A');

-- A학점을 받은 학생의 정보를 조회
select  s.student_name as '학생명',
		s.address as '주소',
        e.grade as '학점'
	from student s, enrollment e
    where s.student_id = e.student_id
		and e.grade = 'A';

select  s.student_name as '학생명',
		s.address as '주소',
        e.grade as '학점'
	from student s inner join enrollment e
					on s.student_id = e.student_id
	where e.grade = 'A';

-- C학점을 받은 학생의 정보와 과목명을 조회
select  st.student_name,
		st.address,
        su.subject_name,
        su.class_room,
        e.grade
	from student st, subject su, enrollment e
    where st.student_id = e.student_id
		and su.subject_no = e.subject_no
        and e.grade = 'C';

select  st.student_name,
		st.address,
        su.subject_name,
        su.class_room,
        e.grade
	from student st inner join enrollment e on st.student_id = e.student_id
					inner join subject su   on su.subject_no = e.subject_no
	where e.grade = 'C';

-- 100분 강의하는 과목정보와 강사정보를 조회
select  i.instructor_name,
		i.age,
        i.gender,
        su.subject_name,
        su.class_room,
        ct.class_time
	from instructor i, subject su, class_time ct
    where i.instructor_no = su.instructor_no
		and su.subject_no = ct.subject_no
        and ct.class_time = '100분';
        
-- ANSI SQL        

-- 100분 강의하는 강사정보, 과목명을 조회 => 서브쿼리사용, 과목명(스칼라 서브쿼리)
select  instructor_no,
		instructor_name,
		age,
        gender,
        (select subject_name
							from subject 
							where subject_no = (select subject_no 
													from class_time
														where class_time = '100분'))
		as subject_name
	from instructor
	where instructor_no = (select instructor_no
							from subject 
							where subject_no = (select subject_no 
													from class_time
													where class_time = '100분'));


-- 김영희 강사가 강의하는 모든 과목 조회
select  su.subject_name,
		su.class_room
	from instructor i, subject su
    where i.instructor_no = su.instructor_no
		and i.instructor_name = '김영희';

select  su.subject_name,
		su.class_room
	from subject su
    where su.instructor_no = (select instructor_no 
								from instructor 
                                where instructor_name = '김영희');

-- 홍길동 강사가 강의하는 과목과 과목을 수강한 학생정보와 성적을 조회
select  i.instructor_name,
		su.subject_name, 
        su.class_room,
        st.student_name,
        e.grade
	from instructor i, subject su, student st, enrollment e
    where i.instructor_no = su.instructor_no
		and su.subject_no = e.subject_no
        and e.student_id = st.student_id
        and i.instructor_name = '홍길동';

-- ANSI SQL        

-- 모든 강사가 강의하는 과목과 성적 조회 (모든 강사 포함)
select count(*) from instructor;  -- 4
select count(distinct instructor_no) from subject; -- 3
select * 
	from instructor i left outer join	subject su
					  on i.instructor_no = su.instructor_no;