import pandas as pd
import oracledb
import getpass

# =========================
# 1. READ EXCEL
# =========================

df = pd.read_excel("customer_shopping_behavior.xlsx")

print("Excel loaded successfully!")
print(df.head())

# =========================
# 2. CLEAN COLUMN NAMES
# =========================

df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(" ", "_")

df = df.rename(
    columns={
        "purchase_amount_(usd)": "purchase_amount"
    }
)

print("\nColumns:")
print(df.columns.tolist())

# =========================
# 3. AGE GROUP
# =========================

labels = [
    "young_adult",
    "adult",
    "middle-aged",
    "senior"
]

df["age_group"] = pd.qcut(
    df["age"],
    q=4,
    labels=labels
)

# =========================
# 4. PURCHASE FREQUENCY
# =========================

frequency_mapping = {
    "fortnightly": 14,
    "weekly": 7,
    "monthly": 30,
    "quarterly": 90,
    "bi_weekly": 14,
    "annually": 365,
    "every_3_months": 90
}

df["frequency_of_purchases"] = (
    df["frequency_of_purchases"]
    .str.lower()
    .str.replace("-", "_")
)

df["purchase_frequency_days"] = (
    df["frequency_of_purchases"].map(frequency_mapping)
)

# =========================
# 5. YES / NO → TRUE / FALSE
# =========================

df[["discount_applied", "promo_code_used"]] = (
    df[["discount_applied", "promo_code_used"]] == "Yes"
)

# =========================
# 6. SAVE CLEANED EXCEL
# =========================

df.to_excel(
    "customer_shopping_behavior_cleaned.xlsx",
    index=False
)

print("\nCleaned Excel saved!")

# =========================
# 7. ORACLE CONNECTION
# =========================

username = input("\nEnter Oracle username: ")
password = getpass.getpass("Enter Oracle password: ")

connection = oracledb.connect(
    user=username,
    password=password,
    dsn="localhost:1521/FREEPDB1"
)

print("Oracle connected successfully!")

# =========================
# 8. CREATE CURSOR
# =========================

cursor = connection.cursor()

# =========================
# 9. INSERT SQL
# =========================

sql = """
INSERT INTO customer_sales (
    customer_id,
    age,
    gender,
    item_purchased,
    category,
    purchase_amount,
    location,
    size_code,
    color,
    season,
    review_rating,
    subscription_status,
    shipping_type,
    discount_applied,
    promo_code_used,
    previous_purchases,
    payment_method,
    frequency_of_purchases
)
VALUES (
    :1,
    :2,
    :3,
    :4,
    :5,
    :6,
    :7,
    :8,
    :9,
    :10,
    :11,
    :12,
    :13,
    :14,
    :15,
    :16,
    :17,
    :18
)
"""

# =========================
# 10. SELECT ONLY 18 COLUMNS
# =========================

data = df[
    [
        "customer_id",
        "age",
        "gender",
        "item_purchased",
        "category",
        "purchase_amount",
        "location",
        "size",
        "color",
        "season",
        "review_rating",
        "subscription_status",
        "shipping_type",
        "discount_applied",
        "promo_code_used",
        "previous_purchases",
        "payment_method",
        "frequency_of_purchases"
    ]
]

# =========================
# 11. CONVERT TO LIST
# =========================

rows = list(
    data.itertuples(
        index=False,
        name=None
    )
)

print("\nRows to insert:", len(rows))
print("Columns to insert:", len(data.columns))

# =========================
# 12. INSERT INTO ORACLE
# =========================

cursor.executemany(
    sql,
    rows
)

# =========================
# 13. COMMIT
# =========================

connection.commit()

print("\nData loaded into Oracle successfully!")

# =========================
# 14. CLOSE
# =========================

cursor.close()
connection.close()

print("Oracle connection closed.")