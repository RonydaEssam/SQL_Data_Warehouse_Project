/* 
SCRIPT PURPOSE:
	This script creates a new database called 'DataWarehouse' and sets up 3 schemas within the database: 'Bronze', 'Silver', 'Gold' 
*/

USE master;

-- Create database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

-- Create schemas
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO