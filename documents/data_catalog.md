# Data Catalog for Gold Layer
The Gold Layer is structured to support analytical and reporting use cases, It consists of **dimension tables** and **fact tables** for specific business metrics.

## **gold.dim_customers**
This table stores all the data related to the customers details.

| Column Name     | Data Type   | Description                                                                  |
|-----------------|-------------|------------------------------------------------------------------------------|
| customer_key    | INT         | Unique Surrogate key to identify each customer record                        |
| customer_id     | INT         | Unique numerical identifier for each customer                                |
| customer_number | VARCHAR(50) | Unique alphanumric identifier for each customer                              |
| first_name      | VARCHAR(50) | The first name of the customer                                               |
| last_name       | VARCHAR(50) | The last name of the customer                                                |
| country         | VARCHAR(50) | The country of residence of the customer                                     |
| gender          | VARCHAR(50) | The gender of the customer ('Male', 'Female', 'n/a')                         |
| marital_status  | VARCHAR(50) | The marital status of the customer ('Married', 'Single', 'n/a')              |
| birthdate       | DATE        | The birthdate of the customer ('YYYY-MM-DD', ex: '1998-08-10')               |
| create_date     | DATE        | The date and time for creation of the customer record in the system          |

## **gold.dim_products**
This table stores all the data related to the products details.

| Column Name     | Data Type   | Description                                                                  |
|-----------------|-------------|------------------------------------------------------------------------------|


## **gold.fact_sales**
This table stores the  transactional sales data ready for analytical purposes.

| Column Name     | Data Type   | Description                                                                  |
|-----------------|-------------|------------------------------------------------------------------------------|


