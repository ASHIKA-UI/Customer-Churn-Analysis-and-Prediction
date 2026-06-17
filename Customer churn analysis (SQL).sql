SELECT * FROM churn_clean
LIMIT 10;

SELECT COUNT(*) FROM churn_clean;

# Churn rate by contract type

SELECT Churn, COUNT(*) 
FROM churn_clean 
GROUP BY Churn;

SELECT contract,
COUNT(*) AS Total_customers,
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Total_Churned,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Churn_rate_percent
FROM churn_clean
GROUP BY Contract
ORDER BY Churn_rate_percent DESC;

SELECT DISTINCT Churn FROM churn_clean;


# Churn by tenure bands

SELECT 
    CASE 
        WHEN tenure <= 12 THEN '1. New (0-12 months)'
        WHEN tenure <= 24 THEN '2. Mid (13-24 months)'
        WHEN tenure <= 48 THEN '3. Established (25-48 months)'
        ELSE '4. Loyal (49-72 months)'
    END AS tenure_band,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS churn_rate_percent
FROM churn_clean
GROUP BY tenure_band
ORDER BY tenure_band;


# Churn by payment method
SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS churn_rate_percent
FROM churn_clean
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;















