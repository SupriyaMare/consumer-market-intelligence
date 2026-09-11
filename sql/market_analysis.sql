-- Product, region, channel and category-growth analysis

-- Product revenue ranking
SELECT
    p.product_name,
    p.category,
    ROUND(SUM(t.revenue), 2) AS revenue,
    SUM(t.quantity) AS units
FROM transactions t
JOIN products p ON p.product_id = t.product_id
GROUP BY p.product_name, p.category
ORDER BY revenue DESC
LIMIT 10;

-- Revenue by region and category
SELECT
    t.region,
    p.category,
    ROUND(SUM(t.revenue), 2) AS revenue,
    SUM(t.quantity) AS units,
    COUNT(DISTINCT t.transaction_id) AS transactions
FROM transactions t
JOIN products p ON p.product_id = t.product_id
GROUP BY t.region, p.category
ORDER BY t.region, revenue DESC;

-- Category year-over-year growth
SELECT
    p.category,
    ROUND(SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2024 THEN t.revenue ELSE 0 END), 2) AS revenue_2024,
    ROUND(SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2025 THEN t.revenue ELSE 0 END), 2) AS revenue_2025,
    ROUND(
        100.0 * (
            SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2025 THEN t.revenue ELSE 0 END)
            - SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2024 THEN t.revenue ELSE 0 END)
        ) / NULLIF(SUM(CASE WHEN EXTRACT(YEAR FROM t.date) = 2024 THEN t.revenue ELSE 0 END), 0),
        2
    ) AS growth_pct
FROM transactions t
JOIN products p ON p.product_id = t.product_id
GROUP BY p.category
ORDER BY growth_pct DESC;

-- Revenue by channel
SELECT
    channel,
    COUNT(DISTINCT transaction_id) AS transactions,
    SUM(quantity) AS units,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT transaction_id), 2) AS avg_transaction_value
FROM transactions
GROUP BY channel
ORDER BY revenue DESC;
