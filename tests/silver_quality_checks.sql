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
-- -- Check for spaces in strings
SELECT * 
FROM silver.crm_sales_details
WHERE sls_ord_num != TRIM(sls_ord_num)

SELECT * 
FROM silver.crm_sales_details
WHERE sls_ord_num != TRIM(sls_ord_num)

-- Check for invalid dates
SELECT sls_order_dt
FROM silver.crm_sales_details
WHERE sls_order_dt <= 0
OR LEN(sls_order_dt) != 8
OR sls_order_dt > 20500101
OR sls_order_dt < 20000101

SELECT sls_ship_dt
FROM silver.crm_sales_details
WHERE sls_ship_dt <= 0
OR LEN(sls_ship_dt) != 8
OR sls_ship_dt > 20500101
OR sls_ship_dt < 20000101

SELECT sls_due_dt
FROM silver.crm_sales_details
WHERE sls_due_dt <= 0
OR LEN(sls_due_dt) != 8
OR sls_due_dt > 20500101
OR sls_due_dt < 20000101

SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
OR sls_ship_dt > sls_due_dt

SELECT *
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales <= 0 OR sls_price <= 0 OR sls_quantity <= 0
OR sls_sales IS NULL OR sls_price IS NULL OR sls_quantity IS NULL
ORDER BY sls_sales, sls_quantity, sls_price

SELECT 
	CASE
		WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != sls_quantity * ABS(sls_price) THEN sls_quantity * ABS(sls_price)
		ELSE sls_sales
	END AS sls_sales,
	sls_quantity,
	CASE
		WHEN sls_price IS NULL OR sls_price <= 0 THEN ABS(sls_sales) / NULLIF(sls_quantity, 0)
		ELSE sls_price
	END AS sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales <= 0 OR sls_price <= 0 OR sls_quantity <= 0
OR sls_sales IS NULL OR sls_price IS NULL OR sls_quantity IS NULL
ORDER BY sls_sales, sls_quantity, sls_price

SELECT * FROM silver.crm_sales_details


-- ** Table: crm_cust_info **


SELECT * FROM bronze.erp_cust_az12