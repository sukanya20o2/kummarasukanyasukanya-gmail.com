create database Project ;
use  project ;


-- All Columns
select * from olist_order_items_dataset ;

-- Total Payment group by  payment type
select Payment_type , sum(pay_val) as total_pay 
from olist_order_items_dataset
 group by Payment_type order by total_pay limit 4 offset 1 ;

-- Top 5 Product by Profit
select Products , round(sum(Price)-sum(Pay_Val),2) as Profit
 from olist_order_items_dataset group by Products 
 order by Profit desc limit 5 ;

-- Total orders by review score
select review_score , count(order_id) 
as tot_count from olist_order_items_dataset 
group by review_score order by review_score ;

-- total count for creditcard and reviewscore  5
select review_score , payment_type , count(order_id) 
as sco_tot from olist_order_items_dataset 
where review_score = 5 and Payment_type= 
"credit_card" group by review_score, Payment_type ;

-- avg price & payment value  of  saopaulo city 
SELECT city , round(avg(Price),2) AS avg_price,
round(AVG(Pay_Val),2) AS avg_payment_value
FROM  olist_order_items_dataset 
WHERE city = 'sao paulo';

-- Top 5 Delivery Days with review score 5
 SELECT ROUND(o.order_delivered_customer_date - o.order_purchase_timestamp, 3)
 AS no_of_days,count(ord.review_score )AS review_score_count
FROM olist_order_items_dataset AS ord
JOIN olist_orders_dataset AS o ON ord.order_id = o.order_id
WHERE ord.review_score = 5
GROUP BY ROUND(o.order_delivered_customer_date - o.order_purchase_timestamp, 3) order by
review_score_count desc limit 5 ;


