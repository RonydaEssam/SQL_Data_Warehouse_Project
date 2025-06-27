TRUNCATE TABLE bronze.crm_cust_info
BULK INSERT bronze.crm_cust_info
FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.crm_prd_info
BULK INSERT bronze.crm_prd_info
FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.crm_sales_details
BULK INSERT bronze.crm_sales_details
FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.erp_cust_az12
BULK INSERT bronze.erp_cust_az12
FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_erp\cust_az12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.erp_loc_a101
BULK INSERT bronze.erp_loc_a101
FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_erp\loc_a101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE bronze.erp_px_cat_g1v2
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_erp\px_cat_g1v2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
