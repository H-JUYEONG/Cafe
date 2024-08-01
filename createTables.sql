###########################################
############## DB 생성 드롭 #################

drop user 'cafe'@'%';

create user 'cafe'@'%' identified by 'cafe';

grant all privileges on cafe_db.* to 'cafe'@'%';

flush privileges;


-- db 생성
drop database cafe_db;

create database cafe_db
default character set utf8mb4
collate utf8mb4_general_ci
default encryption='n'
;

show databases;

use cafe_db;

############## DB 생성 드롭 #################
###########################################


###########################################
############## table 생성  #################

-- DB 사용
use cafe_db;

-- Users 테이블 만들기
create table Users(

    user_id int primary key auto_increment, 		-- 회원 번호
    id varchar(100), 								-- 계정 아이디
    pw varchar(100), 								-- 계정 비밀번호
    user_name varchar(100),							-- 회원 이름
    user_hp varchar(50)								-- 회원 전화번호
    
); 

-- Users 테이블 데이터
insert into Users values(null, 'qwer', 'qwer', '이상혁', '010-1111-1111');
insert into Users values(null, 'mcu', 'mcu', '유재석', '010-2222-2222');
insert into Users values(null, 'leeh', 'leeh', '이효리', '010-3333-3333');
insert into Users values(null, 'ljj', 'ljj', '이정재', '010-4444-4444');
insert into Users values(null, 'nice', 'nice', '차은우', '010-5555-5555');
insert into Users values(null, 'park', 'park', '박정민', '010-6666-6666');
insert into Users values(null, 'jun', 'jun', '이준혁', '010-7777-7777');
insert into Users values(null, 'dnd', 'dnd', '한기웅', '010-8888-8888');
insert into Users values(null, 'yes', 'yes', '장그래', '010-9999-9999');
insert into Users values(null, 'smell', 'smell', '김향기', '010-0000-0000');

-- Drink 테이블 만들기
create table Drink(

    drink_id int primary key auto_increment, 		-- 음료 고유 번호
    drink_name varchar(100), 						-- 음료 이름
    drink_content varchar(100),						-- 음료 설명
    drink_price int 								-- 음료 가격
    
); 

-- Drink 테이블 데이터
insert into Drink values(null, '아메리카노', '시원한 커피', 3500); 
insert into Drink values(null, '카페라떼', '달콤한 커피', 4000);
insert into Drink values(null, '망고스무디', '망고가 듬뿍', 6000);
insert into Drink values(null, '요거트스무디', '유산균이 가득', 6000);
insert into Drink values(null, '딸기스무디', '달콤상콤!', 6000);
insert into Drink values(null, '매실에이드', '난 네가 좋아', 4500); 
insert into Drink values(null, '청포도에이드', '톡쏘는 맛', 5500);
insert into Drink values(null, '애플티', '사과해', 4500);
insert into Drink values(null, '유자차', '달달해~', 4500);
insert into Drink values(null, '오미자차', '다섯가지맛을 한번에', 5000);



-- Receipt 테이블 만들기
create table Receipt(

    receipt_id int primary key auto_increment, 		     -- 영수증 번호
    receipt_date DATETIME DEFAULT CURRENT_TIMESTAMP,	 -- 주문이 들어온 시간(현재시간)
    receipt_finish TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 							 -- 음료제조 완료 시간
    receipt_state varchar(50),							 -- 주문 상태
    user_id int,  										 -- Users 테이블의 회원번호
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
    
); 

insert into Receipt values(null, '2024-08-01 10:00:00', '2024-08-01 10:05:00', '완료',  1); -- 예시...
insert into Receipt values(null, '2024-08-01 11:30:00', '2024-08-01 11:33:00', '완료', 1);
insert into Receipt values(null, '2024-08-01 11:40:00', '2024-08-01 11:44:00', '완료', 1);
insert into Receipt values(null, '2024-08-01 12:00:00', null, '준비', 2);
insert into Receipt values(null, '2024-08-01 12:00:00', null, '준비', 2);
insert into Receipt values(null, '2024-08-01 12:01:00', null, '준비', 2); 
insert into Receipt values(null, '2024-08-01 12:01:00', null, '준비', 2);
insert into Receipt values(null, '2024-08-01 12:05:00', null, '준비', 3);
insert into Receipt values(null, '2024-08-01 12:05:00', null, '준비', 3);
insert into Receipt values(null, '2024-08-01 12:06:00', null, '준비', 3);
truncate table Receipt;

-- UserOrder 테이블 만들기
create table UserOrder (

    userOrder_id int primary key auto_increment, 		-- 회원의 주문번호
    receipt_id int, 									-- 영수증 번호
    drink_id int, 										-- Drink 테이블의 음료 고유 번호
    user_id int, 										-- Users 테이블의 회원번호
    drink_cnt int, 										-- 주문한 음료의 수량
    FOREIGN KEY(receipt_id) REFERENCES Receipt(receipt_id),
    FOREIGN KEY(user_id) REFERENCES Receipt(user_id),
    FOREIGN KEY(drink_id) REFERENCES Drink(drink_id)

);

-- SET FOREIGN_KEY_CHECKS = 0;
insert into UserOrder values(null, 4, 1, 2, 1);
insert into UserOrder values(null, 5, 1, 2, 1);
insert into UserOrder values(null, 6, 1, 2, 2);
insert into UserOrder values(null, 7, 2, 3, 2);
insert into UserOrder values(null, 8, 2, 3, 1);
insert into UserOrder values(null, 9, 2, 3, 3);
insert into UserOrder values(null, 10, 1, 3, 2);
insert into UserOrder values(null, 10, 2, 3, 2);
insert into UserOrder values(null, 10, 3, 3, 2);
insert into UserOrder values(null, 10, 4, 3, 2);
truncate table UserOrder;

-- 테이블 삭제시 삭제 순서(UserOrder -> Receipt)
drop table UserOrder;
drop table Receipt;
drop table Users;
drop table Drink;