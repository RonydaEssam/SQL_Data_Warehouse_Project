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


