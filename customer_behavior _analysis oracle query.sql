select * from customer_sales;
-- 1. First 20 Rows
SELECT *
FROM customer_sales
FETCH FIRST 20 ROWS ONLY;


-- 2. Revenue by Gender
SELECT gender,
       SUM(purchase_amount) AS revenue
FROM customer_sales
GROUP BY gender;


-- 3. Discount Applied + Above Average Purchase
SELECT customer_id,
       purchase_amount
FROM customer_sales
WHERE discount_applied = 'TRUE'
  AND purchase_amount > (
      SELECT AVG(purchase_amount)
      FROM customer_sales
  );


-- 4. Top 5 Products by Average Review Rating
SELECT item_purchased,
       ROUND(AVG(review_rating), 2) AS avg_review_rating
FROM customer_sales
GROUP BY item_purchased
ORDER BY avg_review_rating DESC
FETCH FIRST 5 ROWS ONLY;


-- 5. Standard vs Express Average Purchase
SELECT shipping_type,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount
FROM customer_sales
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type
ORDER BY avg_purchase_amount DESC;


-- 6. Subscription: Average Spend & Total Revenue
SELECT subscription_status,
       ROUND(AVG(purchase_amount), 2) AS avg_spend,
       ROUND(SUM(purchase_amount), 2) AS total_revenue
FROM customer_sales
GROUP BY subscription_status
ORDER BY avg_spend DESC;


-- 7. Top 5 Products by Discount Purchase Percentage
SELECT item_purchased,
       ROUND(
           100 * SUM(
               CASE
                   WHEN discount_applied = 'TRUE' THEN 1
                   ELSE 0
               END
           ) / COUNT(*),
           2
       ) AS discount_purchase_percentage
FROM customer_sales
GROUP BY item_purchased
ORDER BY discount_purchase_percentage DESC
FETCH FIRST 5 ROWS ONLY;


-- 8. New vs Loyal Customers
SELECT
    CASE
        WHEN previous_purchases <= 5 THEN 'New'
        ELSE 'Loyal'
    END AS customer_segment,
    COUNT(*) AS customer_count
FROM customer_sales
GROUP BY
    CASE
        WHEN previous_purchases <= 5 THEN 'New'
        ELSE 'Loyal'
    END
ORDER BY customer_count DESC;


-- 9. Top 3 Products Within Each Category
SELECT category,
       item_purchased,
       purchase_count
FROM (
    SELECT category,
           item_purchased,
           COUNT(*) AS purchase_count,
           ROW_NUMBER() OVER (
               PARTITION BY category
               ORDER BY COUNT(*) DESC
           ) AS rn
    FROM customer_sales
    GROUP BY category, item_purchased
)
WHERE rn <= 3
ORDER BY category, purchase_count DESC;


-- 10. Repeat Buyers & Subscription
SELECT subscription_status,
       COUNT(*) AS customer_count,
       ROUND(
           100 * COUNT(*) /
           SUM(COUNT(*)) OVER (),
           2
       ) AS percentage
FROM customer_sales
WHERE previous_purchases > 5
GROUP BY subscription_status
ORDER BY percentage DESC;


-- 11. Revenue Contribution by Age Group
SELECT age_group,
       ROUND(SUM(purchase_amount), 2) AS total_revenue,
       ROUND(
           100 * SUM(purchase_amount) /
           SUM(SUM(purchase_amount)) OVER (),
           2
       ) AS revenue_contribution_percentage
FROM (
    SELECT
        CASE
            WHEN age < 25 THEN 'Young Adult'
            WHEN age BETWEEN 25 AND 34 THEN 'Adult'
            WHEN age BETWEEN 35 AND 44 THEN 'Middle-Aged'
            ELSE 'Senior'
        END AS age_group,
        purchase_amount
    FROM customer_sales
)
GROUP BY age_group
ORDER BY revenue_contribution_percentage DESC;


-- 12. Total Customers
SELECT COUNT(*) AS customer_count
FROM customer_sales;


-- 13. Unique Customers
SELECT COUNT(DISTINCT customer_id) AS number_of_customers
FROM customer_sales;


-- 14. Average Purchase Amount
SELECT ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer_sales;