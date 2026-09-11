-- Consumer intelligence: segment, age and purchase frequency

-- Revenue and spend by customer segment
SELECT
    c.segment,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT t.transaction_id) AS transactions,
    SUM(t.quantity) AS units,
    ROUND(SUM(t.revenue), 2) AS revenue,
    ROUND(SUM(t.revenue) / COUNT(DISTINCT c.customer_id), 2) AS avg_spend_per_customer
FROM customers c
JOIN transactions t ON t.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY revenue DESC;

-- Purchase frequency distribution
SELECT
    customer_id,
    COUNT(DISTINCT transaction_id) AS transaction_count,
    ROUND(SUM(revenue), 2) AS total_spend
FROM transactions
GROUP BY customer_id
ORDER BY transaction_count, customer_id;

-- Channel performance by customer segment
SELECT
    c.segment,
    t.channel,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT t.transaction_id) AS transactions,
    ROUND(SUM(t.revenue), 2) AS revenue
FROM customers c
JOIN transactions t ON t.customer_id = c.customer_id
GROUP BY c.segment, t.channel
ORDER BY c.segment, revenue DESC;
