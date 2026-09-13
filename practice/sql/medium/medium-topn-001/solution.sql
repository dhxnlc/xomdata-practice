-- Xom Data · Sales champion of each region
-- Problem: https://xomdata.com/practice/medium-topn-001
-- Solved: 2026-09-13

-- Write your SQL here
WITH RankedItems AS (
    SELECT region, rep_name, sales_amount,
        ROW_NUMBER() OVER (
            PARTITION BY region 
            ORDER BY sales_amount DESC, rep_name ASC
        ) as rn
    FROM reps
)
SELECT region, rep_name, sales_amount
FROM RankedItems
WHERE rn = 1;
