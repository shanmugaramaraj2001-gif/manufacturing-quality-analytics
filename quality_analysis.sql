USE aerospace_quality;
DESCRIBE inspection_data;

SELECT
    COUNT(*) AS total_records,
    COUNT(Inspection_Date) AS records_with_dates,
    SUM(Qty_Inspected) AS total_inspected,
    SUM(Qty_Rejected) AS total_rejected
FROM inspection_data;

SELECT
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        NULLIF(SUM(Qty_Inspected), 0),
        2
    ) AS Overall_Rejection_Rate
FROM inspection_data;

SELECT
    Year,
    Month_No,
    Month,
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        NULLIF(SUM(Qty_Inspected), 0),
        2
    ) AS Rejection_Rate,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost
FROM inspection_data
GROUP BY
    Year,
    Month_No,
    Month
ORDER BY
    Year,
    Month_No;
    
    SELECT
    SUM(Monthly_Inspected) AS Total_Inspected,
    SUM(Monthly_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Monthly_Rejected) * 100.0 /
        NULLIF(SUM(Monthly_Inspected), 0),
        2
    ) AS Overall_Rejection_Rate
FROM (
    SELECT
        Year,
        Month_No,
        SUM(Qty_Inspected) AS Monthly_Inspected,
        SUM(Qty_Rejected) AS Monthly_Rejected
    FROM inspection_data
    GROUP BY Year, Month_No
) AS monthly_summary;

SELECT
    Supplier_Name,
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        NULLIF(SUM(Qty_Inspected), 0),
        2
    ) AS Rejection_Rate
FROM inspection_data
GROUP BY Supplier_Name
ORDER BY Total_Rejected DESC;

SELECT
    Supplier_Name,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost
FROM inspection_data
GROUP BY Supplier_Name
ORDER BY Total_Rejection_Cost DESC;

SELECT
    Supplier_Name,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost,
    ROUND(
        SUM(Rejection_Cost) /
        NULLIF(SUM(Qty_Rejected), 0),
        2
    ) AS Cost_Per_Rejected_Part
FROM inspection_data
GROUP BY Supplier_Name
ORDER BY Cost_Per_Rejected_Part DESC;

SELECT
    Defect_Type,
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        NULLIF(SUM(Qty_Inspected), 0),
        2
    ) AS Rejection_Rate,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost
FROM inspection_data
GROUP BY Defect_Type
ORDER BY Total_Rejected DESC;

SELECT
    Machine_ID,
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        NULLIF(SUM(Qty_Inspected), 0),
        2
    ) AS Rejection_Rate,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost
FROM inspection_data
GROUP BY Machine_ID
ORDER BY Total_Rejected DESC;

SELECT
    Machine_ID,
    Defect_Type,
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        NULLIF(SUM(Qty_Inspected), 0),
        2
    ) AS Rejection_Rate,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost
FROM inspection_data
GROUP BY
    Machine_ID,
    Defect_Type
ORDER BY
    Machine_ID,
    Total_Rejected DESC;
    
    WITH Machine_Defect_Summary AS (
    SELECT
        Machine_ID,
        Defect_Type,
        SUM(Qty_Inspected) AS Total_Inspected,
        SUM(Qty_Rejected) AS Total_Rejected,
        ROUND(
            SUM(Qty_Rejected) * 100.0 /
            NULLIF(SUM(Qty_Inspected), 0),
            2
        ) AS Rejection_Rate
    FROM inspection_data
    WHERE Defect_Type <> 'No Defect'
    GROUP BY
        Machine_ID,
        Defect_Type
),
Ranked_Defects AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY Machine_ID
            ORDER BY Total_Rejected DESC
        ) AS Defect_Rank
    FROM Machine_Defect_Summary
)
SELECT
    Machine_ID,
    Defect_Type,
    Total_Inspected,
    Total_Rejected,
    Rejection_Rate,
    Defect_Rank
FROM Ranked_Defects
WHERE Defect_Rank <= 3
ORDER BY
    Machine_ID,
    Defect_Rank;
    
SELECT
    Machine_ID,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost,
    ROUND(
        SUM(Rejection_Cost) * 100.0 /
        (SELECT SUM(Rejection_Cost)
         FROM inspection_data),
        2
    ) AS Cost_Contribution_Percentage
FROM inspection_data
GROUP BY Machine_ID
ORDER BY Total_Rejection_Cost DESC;

SELECT
    SUM(Qty_Inspected) AS Total_Inspected,
    SUM(Qty_Rejected) AS Total_Rejected,
    ROUND(
        SUM(Qty_Rejected) * 100.0 /
        NULLIF(SUM(Qty_Inspected), 0),
        2
    ) AS Overall_Rejection_Rate,
    ROUND(SUM(Rejection_Cost), 2) AS Total_Rejection_Cost
FROM inspection_data;
