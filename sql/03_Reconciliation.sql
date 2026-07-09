-- SELECT 'enacted = original + supplemental - 9c'              AS check_name,
--        SUM(CASE WHEN ABS(total_enacted-(original_budget+supplemental-cut_9c))>0.5
--                 THEN 1 ELSE 0 END)                            AS fail_rows,
--        COUNT(*)                                               AS total_rows
-- FROM budget
-- UNION ALL
-- SELECT 'available - expenses = balance_forward + unexpended',
--        SUM(CASE WHEN ABS((total_available-total_expenses)-(balance_forward+unexpended))>0.5
--                 THEN 1 ELSE 0 END),
--        COUNT(*)
-- FROM budget;

--CTE
WITH checks AS (
  SELECT fiscal_year, secretariat, department,
         total_enacted - (original_budget + supplemental - cut_9c)        AS enacted_diff,
         (total_available - total_expenses) - (balance_forward + unexpended) AS spend_diff
  FROM budget
)
SELECT * FROM checks
WHERE ABS(enacted_diff) > 0.5 OR ABS(spend_diff) > 0.5
ORDER BY ABS(enacted_diff) DESC;

-- --1637 row failed
-- SELECT fiscal_year, secretariat, department,
--        original_budget, supplemental, cut_9c, total_enacted,
--        total_enacted-(original_budget+supplemental-cut_9c) AS diff
-- FROM budget
-- WHERE ABS(total_enacted-(original_budget+supplemental-cut_9c))>0.5
-- ORDER BY ABS(total_enacted-(original_budget+supplemental-cut_9c)) DESC
-- LIMIT 50;
