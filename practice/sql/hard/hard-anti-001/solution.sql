-- Xom Data · Customers silent for 90 days
-- Problem: https://xomdata.com/practice/hard-anti-001
-- Solved: 2026-09-22

with cte as (select user_id, max(order_date) over (PARTITION BY user_id) as last_order_date, julianday((select max(order_date) from orders)) - julianday(max(order_date) over (PARTITION BY user_id)) as days_since_last
from orders)

select distinct user_id, last_order_date, days_since_last
from cte
where days_since_last >= 90
order by days_since_last DESC, user_id asc;
