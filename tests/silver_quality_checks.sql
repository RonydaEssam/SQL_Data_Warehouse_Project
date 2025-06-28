USE DataWarehouse;

-- Test for having duplicate customer IDs
-- Expectations: Having No duplicates
SELECT cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(cst_id) >1

SELECT cst_key, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_key
HAVING COUNT(cst_key) >1

-- Test for spaces in strings
-- Expectations: Having no spaces
SELECT *
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT *
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- Test for data consistency and standardization
SELECT DISTINCT(cst_marital_status) 
FROM silver.crm_cust_info

SELECT DISTINCT(cst_gndr) 
FROM silver.crm_cust_info

SELECT * FROM silver.crm_cust_info