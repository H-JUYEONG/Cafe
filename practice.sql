select * from Users;
select * from Drink;
select * from Receipt;
select * from UserOrder;

update User
set id = 'qwer',
	pw = 'qwer',
    user_name = '이상혁',
    user_hp = '010-1111-1111'
where user_id = 1
;

update Receipt
set receipt_state = '완료',
	receipt_finish = now()
where receipt_id = 2;
;

update Receipt
set receipt_state = '준비'
where receipt_id = 1
;

update Receipt
set receipt_date = '2024-08-01 10:00:00'
where receipt_id = 1;
;

update userorder
set receipt_id = 2
where drink_id = 5;
;

update Drink
set drink_content = '홍차와우유를 블렌딩'
where drink_id = 5;
;

update Receipt
set receipt_finish = null
where receipt_id = 5;
;