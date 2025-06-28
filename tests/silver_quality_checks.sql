USE DataWarehouse;

-- ** Table: crm_cust_info **
-- Check for duplicate customer IDs or NULLS
-- Expectations: Having No duplicates
SELECT cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(cst_id) > 1 OR cst_id IS NULL

SELECT cst_key, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_key
HAVING COUNT(cst_key) > 1 OR cst_key IS NULL

-- Check for spaces in strings
-- Expectations: Having no spaces
SELECT *
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT *
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- Check data consistency and standardization
SELECT DISTINCT(cst_marital_status) 
FROM silver.crm_cust_info

SELECT DISTINCT(cst_gndr) 
FROM silver.crm_cust_info

SELECT * FROM silver.crm_cust_info


-- ** Table: crm_prd_info **
-- Check for duplicate IDs or NULLS
-- Expectations: Having No duplicates
SELECT prd_id, count(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(prd_id) > 1 OR prd_id IS NULL

-- Check for spaces in strings
SELECT * 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLS or negative numbers
SELECT * 
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0

-- Check data consistency and standardization
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- Check start and end dates reliability
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

SELECT * FROM silver.crm_prd_info


-- ** Table: crm_sales_details **


SELECT * FROM bronze.crm_sales_details WHERE sls_order_dt <=0