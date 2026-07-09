DROP VIEW IF EXISTS v_budget;
CREATE VIEW v_budget AS
SELECT *,
  total_available - total_expenses AS variance_amount,
  ROUND((total_available-total_expenses)/NULLIF(total_available,0)*100,2) AS variance_pct,
  ROUND(total_expenses/NULLIF(total_available,0)*100,2) AS utilization_pct,
  CASE WHEN fiscal_year<=2025 THEN 1 ELSE 0 END AS year_complete,
  CASE WHEN ABS(total_enacted-(original_budget+supplemental-cut_9c)) >0.5
       THEN 1 ELSE 0 END AS recon_budget,
  CASE WHEN ABS((total_available-total_expenses)-(balance_forward+unexpended))>0.5
       THEN 1 ELSE 0 END AS recon_spend
	   
FROM budget;