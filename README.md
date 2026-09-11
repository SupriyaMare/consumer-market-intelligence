# Consumer Market Intelligence & Sales Analytics Dashboard

An end-to-end data analytics project that analyzes consumer purchasing behavior, product performance, regional trends, customer segments, and sales channels for a simulated beverage/CPG company operating across India.

The project follows a complete analytics workflow:

**Data → SQL Analysis → Python Analysis → Tableau Visualization → Business Insights & Recommendations**

---

## 📌 Project Overview

Consumer-facing businesses generate large amounts of transaction and customer data, but raw data alone does not provide actionable business insights.

This project was developed to answer key business questions around:

- Who are the highest-value customers?
- Which products and categories generate the most revenue?
- Which regions perform best?
- Which sales channels contribute the most revenue?
- How frequently do customers purchase?
- Which customer segments show stronger spending behavior?
- Which categories are growing or declining?
- Where are potential regional and category opportunities?

The goal is to transform transactional data into **clear, decision-oriented business insights** that can support marketing, sales, category management, and business strategy.

---

## 🎯 Business Objective

> **Analyze consumer purchasing behavior, product performance, regional trends, and sales channels to identify market opportunities and provide actionable business recommendations.**

---

## 🧩 Business Questions

### Consumer Intelligence

1. Who are the highest-value consumer segments?
2. Which age and income groups purchase the most?
3. Which customer segments have the highest average spending?
4. How frequently do customers purchase?
5. Which customer groups contribute the most revenue?
6. How does purchasing behavior differ across channels?

### Product Intelligence

1. Which products generate the highest revenue?
2. Which categories contribute the most revenue?
3. Which categories are growing or declining?
4. Which products have high sales volume?
5. Which products contribute significantly to total sales?

### Market Intelligence

1. Which regions generate the most revenue?
2. Which regions have stronger sales performance?
3. How does category performance differ by region?
4. Which region-category combinations perform best?
5. Where can localized product or marketing strategies be considered?

### Channel Intelligence

1. Which sales channel generates the most revenue?
2. How does consumer behavior differ between online and offline channels?
3. Which channels have higher average transaction values?
4. Which customer segments prefer specific channels?

---

# 📊 Dataset

The project uses a **synthetic consumer market dataset** created for portfolio and analytical demonstration purposes.

### Dataset Size

| Dataset | Records |
|---|---:|
| Customers | 8,000 |
| Transactions | 60,000 |
| Products | 45 |
| Calendar | 731 |
| Market Benchmark | 3,600 |

### Time Period

**January 2024 – December 2025**

### Geographic Coverage

The dataset represents six regions of India:

- North
- South
- East
- West
- Central
- Northeast

### Sales Channels

- Supermarket
- Convenience
- E-commerce
- Direct

### Product Categories

- Juices
- Energy Drinks
- Carbonated Drinks
- Sports Drinks
- Packaged Water

---

# 🗂️ Data Model

The analytical data model consists of:

```text
                    ┌───────────────┐
                    │   Customers   │
                    │ customer_id   │
                    └───────┬───────┘
                            │
                            │
┌───────────────┐     ┌─────▼──────────┐     ┌───────────────┐
│   Products    │────►│  Transactions  │◄────│    Calendar   │
│  product_id   │     │ transaction_id │     │     date      │
└───────────────┘     └────────────────┘     └───────────────┘
