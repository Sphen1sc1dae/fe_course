/********************************
	쇼핑몰 주문 시스템 DB
********************************/
-- 데이터베이스 생성
-- CREATE DATABASE IF NOT EXISTS `shoppy2026`;
show databases;
use shoppy2026;
select database();
/********************************************************
	Member 		- mid 		- trg_member_mid
    Order 		- orid 		- trg_order_orid
    OrderItem 	- ord_id 	- trg_order_orderitem_ord_id
    Product 	- pid 		- trg_product_pid
********************************************************/
