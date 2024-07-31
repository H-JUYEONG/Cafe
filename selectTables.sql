-- 영수증 내용 출력
SELECT receipt_id,
	   user_id,
       receipt_date,
       receipt_finish,
       receipt_state
FROM Receipt
WHERE receipt_state = '준비'
ORDER BY receipt_id
;

-- 주문 상세 출력
SELECT r.receipt_id,
	   d.drink_name,
       u.drink_cnt
FROM Receipt r
INNER JOIN UserOrder u
ON r.receipt_id = u.receipt_id
INNER JOIN Drink d
ON u.drink_id = d.drink_id
WHERE r.receipt_id = 3
;

-- 주문 상태를 완료로 변경
update Receipt
set receipt_state = '완료'
where receipt_id = 4
;

-- 판매된 상품명, 수량, 음료의 개당가격
select d.drink_name,        -- 음료 이름
       sum(uo.drink_cnt) AS drink_cnt, -- 총 판매된 수량
       d.drink_price,      -- 개당 가격
       sum(uo.drink_cnt * d.drink_price) AS sum_price, -- 음료마다 가격 총합
       date_format(r.receipt_date, '%Y-%m-%d') AS receipt_date, -- 판매된 시간
       date_format(r.receipt_date, '%H:%i:%s') AS receipt_time
from UserOrder uo
inner join Drink d 
on uo.drink_id = d.drink_id  -- 음료 정보를 가져오기 위해 Drink 테이블과 조인
inner join Receipt r
on uo.receipt_id = r.receipt_id
where date_format(r.receipt_date, '%Y-%m-%d') = '2024-07-31'
group by d.drink_name, d.drink_price, r.receipt_date

;

-- 상품 전체 리스트
SELECT drink_id,
	   drink_name,
       drink_content,
       drink_price
FROM Drink
ORDER BY drink_id
;