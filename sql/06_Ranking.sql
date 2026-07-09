SELECT fiscal_year, secretariat,
       SUM(total_available)                AS budget,
       SUM(total_expenses)                 AS actual,
       SUM(total_available-total_expenses) AS variance,
       RANK() OVER (PARTITION BY fiscal_year ORDER BY SUM(total_expenses) DESC) AS spend_rank
FROM budget
WHERE fiscal_year = 2025 OR fiscal_year = 2024
GROUP BY fiscal_year, secretariat
ORDER BY fiscal_year DESC, spend_rank;