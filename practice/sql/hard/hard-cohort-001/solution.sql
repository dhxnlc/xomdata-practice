-- Xom Data · Retention rate by signup-month cohort
-- Problem: https://xomdata.com/practice/hard-cohort-001
-- Solved: 2026-09-19

select strftime('%Y-%m', signup_date) as signup_month, strftime('%Y-%m', active_date) as active_month, count(distinct a.user_id) as n_active
FROM signups s join activity a on s.user_id = a.user_id
WHERE signup_month <= active_month
GROUP BY signup_month, active_month
