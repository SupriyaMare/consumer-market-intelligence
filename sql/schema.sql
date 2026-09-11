-- PostgreSQL schema used for the Consumer Market Intelligence project

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    age INTEGER NOT NULL,
    gender VARCHAR(20) NOT NULL,
    annual_income NUMERIC(12,2) NOT NULL,
    region VARCHAR(50) NOT NULL,
    segment VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    pack_size VARCHAR(50),
    base_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE calendar (
    date DATE PRIMARY KEY,
    year INTEGER,
    month INTEGER,
    month_name VARCHAR(20),
    quarter INTEGER,
    week INTEGER,
    day_of_week VARCHAR(20)
);

CREATE TABLE transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    date DATE NOT NULL REFERENCES calendar(date),
    customer_id VARCHAR(50) NOT NULL REFERENCES customers(customer_id),
    product_id VARCHAR(50) NOT NULL REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    discount_pct NUMERIC(5,4) NOT NULL,
    revenue NUMERIC(12,2) NOT NULL,
    channel VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

CREATE TABLE market_benchmark (
    date DATE NOT NULL,
    region VARCHAR(50) NOT NULL,
    company_revenue NUMERIC(14,2),
    total_market_revenue NUMERIC(14,2),
    market_share_pct NUMERIC(8,4)
);

-- Recommended analytical indexes
CREATE INDEX idx_transactions_customer ON transactions(customer_id);
CREATE INDEX idx_transactions_product ON transactions(product_id);
CREATE INDEX idx_transactions_date ON transactions(date);
