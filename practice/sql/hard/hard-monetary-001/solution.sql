-- Xom Data · Chia khách thành năm hạng chi tiêu
-- Problem: https://xomdata.com/practice/hard-monetary-001
-- Solved: 2026-09-14

with spend_by_customer as (select customer_id, sum(amount) as total_spent
from orders
group by customer_id)
select customer_id, total_spent, NTILE(5) OVER (ORDER BY total_spent DESC, customer_id) AS spend_rank
from spend_by_customer
