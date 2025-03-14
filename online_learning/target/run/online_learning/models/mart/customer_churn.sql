
  
    

        create or replace transient table db_online_learning.mart.customer_churn
         as
        (


with date_range AS (
    SELECT
        MIN(payment_month) AS start_date,
        MAX(payment_month) AS end_date
    FROM
        db_online_learning.staging.stg_Transactions
),
first_payment AS (
    SELECT
        customer_id,
        MIN(payment_month) AS first_payment_date
    FROM
        db_online_learning.staging.stg_Transactions
    GROUP BY
        customer_id
),
new_customers_by_fy AS (
    SELECT
        customer_id,
        year(first_payment_date) AS fiscal_year
    FROM
        first_payment
),
last_payment AS (
    SELECT
        customer_id,
        MAX(payment_month) AS last_payment_date
    FROM
        db_online_learning.staging.stg_Transactions
    GROUP BY
        customer_id
),
churned_customers AS (
    SELECT
        customer_id,
        year(last_payment_date) AS fiscal_year
    FROM
        last_payment,
        date_range
    WHERE
        last_payment_date < end_date
),
fiscal_years AS (
    SELECT DISTINCT
        year(payment_month) AS fiscal_year
    FROM
        db_online_learning.staging.stg_Transactions
)
SELECT
    fy.fiscal_year,
    COUNT(DISTINCT new_customers_by_fy.customer_id) AS new_customers_count,
    COUNT(DISTINCT churned_customers.customer_id) AS churned_customers_count
FROM
    fiscal_years fy
    JOIN new_customers_by_fy ON fy.fiscal_year = new_customers_by_fy.fiscal_year
    JOIN churned_customers ON fy.fiscal_year = churned_customers.fiscal_year
GROUP BY
    fy.fiscal_year
ORDER BY
    fy.fiscal_year
        );
      
  