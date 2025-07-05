# **Naming Conventions**
This document identifies the naming conventions used for the different objects in the data warehouse (schemas, tables, views...)

## **General principles**
 - Naming Conventions: Use snake_case, with lowercase letters and underscores (_) seperating words.
 - Language: English Language.

## **Tables Naming Conventions for Data Layers**

### **Bronze & Silver Layer Rules**
 - All table names must start with source file name + original table name
 - `<sourcefile>_<entity>`: name of the table, ex: crm_customer_info
   - `<sourcefile>`: name of the source file, ex: crm
   - `<entity>`: name of the original table, ex: customer_info

### **Gold Layer Rules**
 - All table names must start with the category prefix followed by the table name
 - `<category>_<entity>`: name of the table, ex: dim_customers
   - `<category>`: prefix of the category, ex: dim, fact
   - `<entity>`: name of the table, ex: customers, sales


## **Stored Procedures**
 - All stored procedures created should be named as follow:
 - `load_<layer>`: ex: 'load_bronze'
   - `<layer>`: identifies the layer of the created stored procedure (bronze, silver, gold)


## **Technical Columns**
 - Any columns added for the data engineering purposes must start with 'dwh_' followed by the column name
  - `dwh_<column_name>`: ex: 'dwh_create_date'
   - `dwh_`: prefix used for specifically metadata columns
   - `<column_name>`: must be descriptive for the column purpose

## **Surrogate Keys**
 - The columns added as primary keys in the dimensional tables must end with '_key'
  - `<table_name>_key`: ex: 'customers_key'
   - `<table_name>`: refers to the table name that the key belongs to
   - `_key`: suffix used for indicating columns as surrogate keys
