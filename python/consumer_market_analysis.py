"""Consumer Market Intelligence exploratory analysis.

Run locally with the Excel dataset in ../data/.
"""
import pandas as pd
from pathlib import Path

DATA = Path(__file__).resolve().parents[1] / "data" / "Consumer_Market_Intelligence_Dataset.xlsx"

customers = pd.read_excel(DATA, sheet_name="Customers")
products = pd.read_excel(DATA, sheet_name="Products")
transactions = pd.read_excel(DATA, sheet_name="Transactions")
calendar = pd.read_excel(DATA, sheet_name="Calendar")

transactions["date"] = pd.to_datetime(transactions["date"])
analysis = transactions.merge(customers, on="customer_id", how="left").merge(products, on="product_id", how="left")

print("Shape:", analysis.shape)
print("Missing values:", analysis.isna().sum().sum())
print("Revenue:", round(analysis["revenue"].sum(), 2))
print("Units:", int(analysis["quantity"].sum()))
print("Customers:", analysis["customer_id"].nunique())
print("Average transaction value:", round(analysis["revenue"].sum() / analysis["transaction_id"].nunique(), 2))

segment = analysis.groupby("segment").agg(
    customers=("customer_id", "nunique"),
    transactions=("transaction_id", "nunique"),
    units=("quantity", "sum"),
    revenue=("revenue", "sum"),
).sort_values("revenue", ascending=False)
segment["avg_spend_per_customer"] = segment["revenue"] / segment["customers"]
print("\nSegment performance:\n", segment.round(2))

region = analysis.groupby("region").agg(
    revenue=("revenue", "sum"),
    units=("quantity", "sum"),
    customers=("customer_id", "nunique"),
).sort_values("revenue", ascending=False)
print("\nRegion performance:\n", region.round(2))

category = analysis.groupby("category").agg(
    revenue=("revenue", "sum"),
    units=("quantity", "sum"),
).sort_values("revenue", ascending=False)
print("\nCategory performance:\n", category.round(2))

channel = analysis.groupby("channel").agg(
    revenue=("revenue", "sum"),
    units=("quantity", "sum"),
    transactions=("transaction_id", "nunique"),
).sort_values("revenue", ascending=False)
channel["avg_transaction_value"] = channel["revenue"] / channel["transactions"]
print("\nChannel performance:\n", channel.round(2))

# 2025 vs 2024 category growth
analysis["year"] = analysis["date"].dt.year
category_year = analysis.pivot_table(index="category", columns="year", values="revenue", aggfunc="sum")
category_year["growth_pct"] = (category_year[2025] - category_year[2024]) / category_year[2024] * 100
print("\nCategory growth 2025 vs 2024:\n", category_year.round(2).sort_values("growth_pct", ascending=False))

# Purchase-frequency distribution
frequency = analysis.groupby("customer_id")["transaction_id"].nunique().value_counts().sort_index()
print("\nPurchase frequency distribution:\n", frequency)
