/********************************
	쇼핑몰 주문 시스템 DB 생성
********************************/
-- 데이터베이스 생성
-- CREATE DATABASE IF NOT EXISTS `shoppy2026`; > 백틱 연산자임(`)
show databases;
use shoppy2026;
select database();
/******************************************************
	Member 		- mid 		- trg_member_mid
    Order 		- orid 		- trg_order_orid
    OrderItem 	- ord_id 	- trg_orderitem_ord_id
    Product 	- pid 		- trg_product_pid
*******************************************************/
-- member 테이블 생성
create table member(
	mid		char(5)		primary key,
    name	varchar(5)	not null,
    email	varchar(30) not null,
    created_at datetime	not null
);

-- order 테이블 생성, order 라는 키워드가 내장되어 있기 때문에 백틱으로 묶음.
create table `order`(
	orid	char(5)		primary key,
    mid		char(5)		not null,
    odate	date		not null,
    constraint fk_order_mid	foreign key(mid)
		references member(mid)
			on delete cascade
			on update cascade
);

-- product 테이블 생성
create table product(
	pid		char(5)		primary key,
    name	varchar(20)	not null,
    price 	int
);

-- order_item 테이블 생성
create table order_item(
	ord_id		char(7)		primary key,
    orid		char(5)		not null,
    pid			char(5) 	not null,
    quantity	int,
    unit_price 	int,
    constraint fk_order_item_orid  foreign key(orid)
		references `order`(orid)
			on delete cascade
            on update cascade,
	constraint fk_product_pid  foreign key(pid)
		references product(pid)
			on delete cascade
            on update cascade	
);

show tables;

/******************************************************
	Member 		- mid 		- trg_member_mid
    Order 		- orid 		- trg_order_orid
    Order_Item 	- ord_id 	- trg_orderitem_ord_id
    Product 	- pid 		- trg_product_pid
*******************************************************/
/************************************************
	mid에 들어가는 'M0001' 타입의 회원아이디 트리거
/************************************************/
delimiter $$
create trigger trg_member_mid
before insert on member -- > MEMBER 삭제시, 트리거도 삭제.
for each row
begin
declare max_code int;  --  'M0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(mid, 4) AS UNSIGNED)), 0)
INTO max_code
FROM member; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.mid = concat('M', LPAD((max_code+1), 4, '0')); 

end $$
delimiter ;
/************************************************/

/************************************************
	orid에 들어가는 'OR001' 타입의 회원아이디 트리거
/************************************************/
delimiter $$
create trigger trg_order_orid
before insert on `order`
for each row
begin
declare max_code int;  --  'OR0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(orid, 3) AS UNSIGNED)), 0)
INTO max_code
FROM `order`; 

SET NEW.orid = concat('OR', LPAD((max_code+1), 3, '0')); 

end $$
delimiter ;
/************************************************/
/************************************************
	ord_id 들어가는 'ORD0001' 타입의 회원아이디 트리거
/************************************************/
delimiter $$
create trigger trg_orderitem_ord_id
before insert on `order_item`
for each row
begin
declare max_code int;  

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(ord_id, 4) AS UNSIGNED)), 0)
INTO max_code
FROM `order_item`; 

SET NEW.ord_id = concat('ORD', LPAD((max_code+1), 4, '0')); 

end $$
delimiter ;
/************************************************/
/************************************************
	pid 들어가는 'P0001' 타입의 상품아이디 트리거
/************************************************/
delimiter $$
create trigger trg_product_pid
before insert on `product`
for each row
begin
declare max_code int; 

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(pid, 4) AS UNSIGNED)), 0)
INTO max_code
FROM `product`; 

SET NEW.pid = concat('P', LPAD((max_code+1), 4, '0')); 

end $$
delimiter ;
/************************************************/

select * from information_schema.triggers
	where trigger_schema = 'shoppy2026';
    
-- member 테이블 데이터 입력
desc member;
insert into member(name, email, created_at) 
	values 
		('홍길동1', 'hong@a.com', now()),
		('홍길동2', 'hong@a.com', now()),
		('홍길동3', 'hong@a.com', now()),
		('홍길동4', 'hong@a.com', now()),
		('홍길동5', 'hong@a.com', now());
select * from member;

-- product 테이블 데이터 입력
insert into product(name, price) 
values  ('모니터', 1000),
		('책상', 20000),
		('노트북', 12000),
		('키보드', 2000),
		('마우스',2500);
select * from product;

-- order 테이블 데이터 입력
insert into `order`(mid, odate) 
values  ('M0001', curdate()),
		('M0004', curdate()),
		('M0001', curdate()),
		('M0004', curdate()),
		('M0005',curdate());
select * from `order`;

-- order_item 테이블 데이터 입력
insert into order_item(orid, pid, quantity, unit_price) 
values  ('OR002', 'P0003', 10, 2000),
		('OR001', 'P0003', 12, 12000),
		('OR003', 'P0001', 15, 20000),
		('OR002', 'P0004', 20, 15000),
		('OR005', 'P0001', 35, 2500);
select * from order_item;

-- 홍길동1 고객의 고객명, 이메일, 가입날짜, 주문날짜를 조회
-- 주문날짜는 년, 월, 일로만 출력
desc member;
select 	m.name, 
		m.email, 
        m.created_at, 
        left(o.odate, 10) as odate 
from member m, `order` o
where m.mid = o.mid
	and m.name = '홍길동1';


-- 상품별 주문 건수, 상품명, 주문건수 출력
select 	p.name, 
		count(quantity) as count
from product p left outer join order_item oi
				on p.pid = oi.pid
group by p.name;      


-- 회원이 주문한 내역과 제품명 조회
-- 회원명, 가입날짜, 주문날짜, 주문수량, 제품명, 가격
select 	m.name, 
		m.created_at, 
        o.odate, 
        oi.quantity, 
        p.name, 
        p.price
from member m, `order` o, order_item oi, product p
where m.mid = o.mid 
	and o.orid = oi.orid
    and oi.pid = p.pid;

-- 회원이 주문한 내역과 제품명 조회
-- 회원명, 가입날짜, 주문날짜, 주문수량, 제품명, 가격
-- 주문되지 않은 모든 제품 출력 
select  t1.name, 
		t1.created_at, 
        t1.odate, 
        t1.quantity, 
        p.name, 
        p.price
from (select distinct m.name, 
			 m.created_at, 
             o.odate, 
             oi.quantity, 
             oi.pid
		from member m, `order` o, order_item oi
		where m.mid = o.mid 
		and o.orid = oi.orid) t1 right outer join product p
										on t1.pid = p.pid;