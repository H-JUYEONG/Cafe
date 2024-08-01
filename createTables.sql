-- DB 사용
use cafe_db;

-- Users 테이블 만들기
create table Users(

    user_id int primary key auto_increment,       -- 회원 번호
    id varchar(100),                         -- 계정 아이디
    pw varchar(100),                         -- 계정 비밀번호
    user_name varchar(100),                     -- 회원 이름
    user_hp varchar(50)                        -- 회원 전화번호
    
); 

-- Users 테이블 데이터
insert into Users values(null, 'qwer', 'qwer', '이상혁', '010-1111-1111');
insert into Users values(null, 'mcu', 'mcu', '유재석', '010-2222-2222');
insert into Users values(null, 'leeh', 'leeh', '이효리', '010-3333-3333');
insert into Users values(null, 'ljj', 'ljj', '이정재', '010-4444-4444');
insert into Users values(null, 'nice', 'nice', '차은우', '010-5555-5555');


-- Drink 테이블 만들기
create table Drink(

    drink_id int primary key auto_increment,       -- 음료 고유 번호
    drink_name varchar(100),                   -- 음료 이름
    drink_content varchar(100),                  -- 음료 설명
    drink_price int                         -- 음료 가격
    
); 

-- Drink 테이블 데이터
insert into Drink values(null, '아메리카노(ICE)', '시원한 커피', 3500); -- 예시...
insert into Drink values(null, '카페라떼', '달달한 커피', 4000);
insert into Drink values(null, '망고스무디', '망고가 듬뿍', 6000);
insert into Drink values(null, '청포도에이드', '톡쏘는 맛', 5500);
insert into Drink values(null, '소금빵', '존맛탱', 3500);

-- Receipt 테이블 만들기
create table Receipt(

    receipt_id int primary key auto_increment,            -- 영수증 번호
    receipt_date DATETIME DEFAULT CURRENT_TIMESTAMP,    -- 주문이 들어온 시간(현재시간)
    receipt_finish TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,                       -- 음료제조 완료 시간
    receipt_state varchar(50),                      -- 주문 상태
    user_id int,                                 -- Users 테이블의 회원번호
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
    
); 

insert into Receipt values(null, '2024-07-24 10:00:00', null, '준비', 1); -- 예시...
insert into Receipt values(null, '2024-07-24 11:00:00', null, '준비', 3);
insert into Receipt values(null, '2024-07-25 12:00:00', null, '준비', 3);
insert into Receipt values(null, '2024-07-25 13:00:00', null, '준비', 4);
insert into Receipt values(null, '2024-07-31 14:00:00', null, '준비', 5);
truncate table Receipt;

-- UserOrder 테이블 만들기
create table UserOrder (

    userOrder_id int primary key auto_increment,       -- 회원의 주문번호
    receipt_id int,                            -- 영수증 번호
    drink_id int,                               -- Drink 테이블의 음료 고유 번호
    user_id int,                               -- Users 테이블의 회원번호
    drink_cnt int,                               -- 주문한 음료의 수량
    FOREIGN KEY(receipt_id) REFERENCES Receipt(receipt_id),
    FOREIGN KEY(user_id) REFERENCES Receipt(user_id),
    FOREIGN KEY(drink_id) REFERENCES Drink(drink_id)

);

SET FOREIGN_KEY_CHECKS = 0;
insert into UserOrder values(null, 1, 1, 1, 3); -- 예시...
insert into UserOrder values(null, 2, 2, 2, 5);
insert into UserOrder values(null, 3, 3, 3, 2);
insert into UserOrder values(null, 4, 4, 4, 2);
insert into UserOrder values(null, 5, 5, 4, 4);
insert into UserOrder values(null, 5, 5, 5, 4);
insert into UserOrder values(null, 5, 5, 5, 4);
truncate table UserOrder;

-- 테이블 삭제시 삭제 순서(UserOrder -> Receipt)
drop table UserOrder;
drop table Receipt;
drop table Users;
drop table Drink;