WITH dept_year AS (
  SELECT fiscal_year, secretariat, SUM(total_expenses) AS actual
  FROM budget
  WHERE fiscal_year <= 2025
  GROUP BY fiscal_year, secretariat
)
SELECT fiscal_year, secretariat, actual,
       LAG(actual) OVER (PARTITION BY secretariat ORDER BY fiscal_year) AS prior_actual,
       ROUND(actual - LAG(actual) OVER (PARTITION BY secretariat ORDER BY fiscal_year),2) AS yoy_change,
       ROUND((actual - LAG(actual) OVER (PARTITION BY secretariat ORDER BY fiscal_year))
             / NULLIF(LAG(actual) OVER (PARTITION BY secretariat ORDER BY fiscal_year),0)*100, 2) AS yoy_pct
FROM dept_year
ORDER BY secretariat,fiscal_year;