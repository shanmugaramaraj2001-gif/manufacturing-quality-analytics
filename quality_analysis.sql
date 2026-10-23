CREATE DATABASE aerospace_quality;
USE aerospace_quality;

SELECT * FROM inspection_data
LIMIT 10;

SELECT COUNT(*)
FROM inspection_data;

-- 1. Which suppliers contribute the most rejected quantity?
SELECT supplier_name,
SUM(qty_rejected) AS total_rejected
FROM inspection_data
GROUP BY supplier_name
ORDER BY total_rejected DESC;

-- 2. Which suppliers contribute the highest rejection cost?
SELECT supplier_name,
SUM(rejection_cost) AS total_cost
FROM inspection_data
GROUP BY supplier_name
ORDER BY total_cost DESC;
-- solving the "floating-point precision issues"
SELECT supplier_name,
       FORMAT(SUM(rejection_cost), 2) AS total_cost
FROM inspection_data
GROUP BY supplier_name
ORDER BY SUM(rejection_cost) DESC;

-- 3. Which defect types occur most frequently?
SELECT defect_type,
       COUNT(*) AS defect_count
FROM inspection_data
WHERE defect_type <> 'No Defect'
GROUP BY defect_type
ORDER BY defect_count DESC;

-- 4. Which machine generates the highest rejected quantity?
SELECT machine_id,
SUM(qty_rejected) AS total_rejected
FROM inspection_data
GROUP BY machine_id
ORDER BY total_rejected DESC;

-- 5. Which inspector is associated with the highest rejected quantity?
SELECT inspector,
SUM(qty_rejected) AS total_rejected
FROM inspection_data
Group BY inspector
ORDER BY total_rejected DESC;

-- Total Inspected
SELECT
SUM(qty_inspected) AS total_inspected
FROM inspection_data;

-- Total Rejected
SELECT
SUM(qty_rejected) AS total_rejected
FROM inspection_data;

-- COPQ
SELECT
ROUND(SUM(rejection_cost),2) AS copq
FROM inspection_data;

-- Overall Rejection %
SELECT
    ROUND(
		SUM(Qty_Rejected) * 100.0 / 
        NULLIF(SUM(Qty_Inspected), 0),
        2) AS rejection_rate
FROM inspection_data;

-- Monthly Rejection Trend
SELECT Year, Month,
       ROUND(
           SUM(Qty_Rejected) * 100.0 /
           SUM(Qty_Inspected),
           2
       ) AS Rejection_Rate
FROM inspection_data
GROUP BY Year, Month_No, Month
ORDER BY Year, Month_No;
-- for power_bi
SELECT Year, Month_No, Month,
       ROUND(
           SUM(Qty_Rejected) * 100.0 /
           SUM(Qty_Inspected),
           2
       ) AS Rejection_Rate
FROM inspection_data
GROUP BY Year, Month_No, Month
ORDER BY year, Month_No;

-- Improvement for Power BI
SELECT
    Year,
    Month_No,
    Month,
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        SUM(Qty_Inspected),
        2
    ) AS Rejection_Rate,
    ROUND(
        SUM(Rejection_Cost),
        2
    ) AS COPQ
FROM inspection_data
GROUP BY Year, Month_No, Month
ORDER BY Year, Month_No;