-- Core business KPIs
SELECT
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(quantity) AS total_units,
    ROUND(SUM(revenue), 2) AS total_revenue,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(revenue) / COUNT(DISTINCT transaction_id), 2) AS avg_transaction_value,
    ROUND(SUM(revenue) / COUNT(DISTINCT customer_id), 2) AS revenue_per_customer
FROM transactions;
