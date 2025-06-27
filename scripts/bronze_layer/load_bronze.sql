/*
SCRIPT PURPOSE:
	This script is a stored procedure used to:
	 - Truncate the tables of the bronze layer.
	 - Load the data from csv files into the tables of the bronze layer using 'BULK INSERT'.

	It also includes:
	 - Adding prints to track execution, debug issues, and understand its flow.
	 - Adding 'Try ... Catch' to identify and handle any loading problems.
	 - Tracking ETL durations to identify bottlenecks, optimize performance, and detect issues.

To use the stored procedure in this script use the following command:
	EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	BEGIN TRY
		SET @batch_start_time = GETDATE();

		PRINT '***** Loading Bronze Layer *****';
		PRINT '  *** Loading CRM Tables ***  ';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Table Info Inserted Successfully!';
		PRINT 'Processing Time:' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '---------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Table Info Inserted Successfully!';
		PRINT 'Processing Time:' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '---------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Table Info Inserted Successfully!';
		PRINT 'Processing Time:' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '---------------';

		PRINT '  --- CRM Tables Inserted Successfully ---  ';

		PRINT '  *** Loading ERP Tables ***  ';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12
		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Table Info Inserted Successfully!';
		PRINT 'Processing Time:' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '---------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101
		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Table Info Inserted Successfully!';
		PRINT 'Processing Time:' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '---------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\0.0 Data Engineering\Projects\Data warehouse Project with Baraa\SQL_Data_Warehouse_Project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Table Info Inserted Successfully!';
		PRINT 'Processing Time:' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT '---------------';

		PRINT '  --- ERP Tables Inserted Successfully ---  ';
		PRINT '----- Bronze Layer Info Inserted Successfully -----';

		SET @batch_end_time = GETDATE();
		PRINT 'Batch Processing Time:' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS VARCHAR) + ' seconds'
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING INSERTING BRONZE LAYER INFO';
		PRINT 'Error message:' + ERROR_MESSAGE();
		PRINT 'Error message:' + CAST(ERROR_NUMBER() AS VARCHAR);
		PRINT 'Error message:' + CAST(ERROR_STATE() AS VARCHAR);
	END CATCH
END