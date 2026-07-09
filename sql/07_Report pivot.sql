SELECT secretariat,
       SUM(CASE WHEN fiscal_year=2023 THEN total_expenses END) AS fy2023,
       SUM(CASE WHEN fiscal_year=2024 THEN total_expenses END) AS fy2024,
       SUM(CASE WHEN fiscal_year=2025 THEN total_expenses END) AS fy2025
FROM budget
GROUP BY secretariat
ORDER BY fy2025 DESC;