DROP TABLE IF EXISTS budget;

CREATE TABLE budget AS
SELECT
  CAST("Fiscal Year" AS INTEGER)                                                    AS fiscal_year,
  CAST("Fund Number" AS INTEGER)                                                    AS fund_number,
  "Fund Name"                                                                       AS fund_name,
  "Cabinet/Secretariat Name"                                                        AS secretariat,
  "Department Name"                                                                 AS department,
  "Department Code"                                                                 AS dept_code,
  "Appropriation/Account Number"                                                    AS account_number,
  "Appropriation/Account Name"                                                      AS account_name,
  CAST(REPLACE(NULLIF(TRIM("Beginning Balance/Prior Appropriation Continued"),''),',','') AS REAL) AS beginning_balance,
  CAST(REPLACE(NULLIF(TRIM("Original Enacted Budget"),''),',','') AS REAL)          AS original_budget,
  CAST(REPLACE(NULLIF(TRIM("Supplemental Budget Appropriations"),''),',','') AS REAL) AS supplemental,
  CAST(REPLACE(NULLIF(TRIM("Transfer_In"),''),',','') AS REAL)                      AS transfer_in,
  CAST(REPLACE(NULLIF(TRIM("Transfer_Out"),''),',','') AS REAL)                     AS transfer_out,
  CAST(REPLACE(NULLIF(TRIM("Authorized Retained Revenue Floor"),''),',','') AS REAL) AS rr_floor,
  CAST(REPLACE(NULLIF(TRIM("Authorized Retained Revenue Ceiling"),''),',','') AS REAL) AS rr_ceiling,
  CAST(REPLACE(NULLIF(TRIM("Retained Revenue Estimate"),''),',','') AS REAL)        AS rr_estimate,
  CAST(REPLACE(NULLIF(TRIM("Retained Revenue Collected"),''),',','') AS REAL)       AS rr_collected,
  CAST(REPLACE(NULLIF(TRIM("Planned Saving (9C Cuts)"),''),',','') AS REAL)         AS cut_9c,
  CAST(REPLACE(NULLIF(TRIM("Total Enacted Budget Appropriation"),''),',','') AS REAL) AS total_enacted,
  CAST(REPLACE(NULLIF(TRIM("Other Statutorily Authorized Spending"),''),',','') AS REAL) AS other_authorized,
  CAST(REPLACE(NULLIF(TRIM("Total Available for Spending"),''),',','') AS REAL)     AS total_available,
  CAST(REPLACE(NULLIF(TRIM("Total_Expenses"),''),',','') AS REAL)                   AS total_expenses,
  CAST(REPLACE(NULLIF(TRIM("Balance Forward/Prior Appropriation Continued"),''),',','') AS REAL) AS balance_forward,
  CAST(REPLACE(NULLIF(TRIM("Unexpended/Reverted"),''),',','') AS REAL)              AS unexpended,
  "Appropriation Class"                                                             AS approp_class,
  "Appropriation Class Name"                                                        AS approp_class_name,
  "Appropriation Class Description"                                                 AS approp_class_desc
FROM "Budget_Actual_With_Other_Spending_Authorizationv3_Gen2_20260704_CTHRU";