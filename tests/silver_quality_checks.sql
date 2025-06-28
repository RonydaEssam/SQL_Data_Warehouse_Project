USE DataWarehouse;

-- Test for having NULLS or duplicate customer IDs
-- Expectations: Having No duplicates
SELECT cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(cst_id) > 1 OR cst_id IS NULL

SELECT cst_key, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_key
HAVING COUNT(cst_key) > 1 OR cst_key IS NULL

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

-- Test for duplicate IDs
-- Expectations: Having No duplicates
SELECT prd_id, count(*) 
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(prd_id) > 1 OR prd_id IS NULL

-- Test for spaces in strings
SELECT * 
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLS or negative numbers
SELECT * 
FROM bronze.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0

-- Check for data consistency and standardization
SELECT DISTINCT prd_line
FROM bronze.crm_prd_info

-- Check for start and end dates reliability
SELECT *
FROM bronze.crm_prd_info
WHERE prd_end_dt IS NOT NULL

SELECT 
	prd_id,
	prd_key,
	REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_id,
	SUBSTRING(prd_key, 7, len(prd_key)) AS prd_key,
	TRIM(prd_nm) AS prd_nm,
	ISNULL(prd_cost, 0) AS prd_cost,
	CASE UPPER(TRIM(prd_line))
		WHEN 'M' THEN 'Mountain'
		WHEN 'R' THEN 'Road'
		WHEN 'S' THEN 'Other Sales'
		WHEN 'T' THEN 'Touring'
		ELSE 'n/a'
	END AS prd_line,
	prd_start_dt,
	DATEADD(day, -1,LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)) AS prd_end_date_test,
	prd_end_dt
FROM bronze.crm_prd_info

SELECT * FROM bronze.crm_prd_info