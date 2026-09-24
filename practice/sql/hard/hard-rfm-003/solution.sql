-- Xom Data · Điểm tươi mới cộng điểm chuyên cần
-- Problem: https://xomdata.com/practice/hard-rfm-003
-- Solved: 2026-09-24

WITH
  cte AS (
    SELECT
      customer_id,
      CASE
        WHEN (select count(distinct customer_id) from orders) >= 5 THEN NTILE(5) OVER (
          ORDER BY
            max(order_date) ASC
        )
        ELSE 6 - NTILE(5) OVER (
          ORDER BY
            max(order_date) desc, customer_id asc
        )
      END AS r_score,
      CASE
        WHEN count(order_id) >= 8 THEN 3
        WHEN count(order_id) BETWEEN 4 AND 7  THEN 2
        ELSE 1
      END AS f_score
    FROM
      orders
    GROUP BY
      customer_id
    ORDER BY
      customer_id
  )
SELECT
  customer_id,
  r_score,
  f_score,
  f_score + r_score AS total_score,
  CASE
    WHEN f_score + r_score >= 7 THEN 'Gold'
    WHEN f_score + r_score BETWEEN 5 AND 6  THEN 'Silver'
    ELSE 'Bronze'
  END AS label
FROM
  cte
