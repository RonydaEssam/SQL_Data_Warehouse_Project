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
| product_key     | INT         | Unique Surrogate key to identify each product record                         |
| product_id      | INT         | Unique numerical identifier for each product                                 |
| product_number  | VARCHAR(50) | Unique alphanumric identifier for each product                               |
| category_id     | VARCHAR(50) | Unique numerical identifier for each category of products                    |
| category        | VARCHAR(50) | The category of each product                                                 |
| subcategory     | VARCHAR(50) | The subcategory of each product                                              |
| maintenance     | VARCHAR(50) | Identifies whether the product needs maintenance or not ('Yes', 'No')        |
| cost            | INT         | The cost of production of each product                                       |
| product_line    | VARCHAR(50) | The production line for each product                                         |
| start_date      | DATE        | The date and time for the start of selling the product                       |

## **gold.fact_sales**
This table stores the  transactional sales data ready for analytical purposes.

| Column Name     | Data Type   | Description                                                                  |
|-----------------|-------------|------------------------------------------------------------------------------|
| order_number    | VARCHAR(50) | A unique alphanumeric identifier for each sales order                        |
| product_key     | INT         | Unique Surrogate key linking the order to the dimensional products table     |
| customer_key    | INT         | Unique Surrogate key linking the order to the dimensional customers table    |
| order_date      | Date        | The date when the order was placed                                           |
| shipping_date   | Date        | The date when the order was shipped to the customer                          |
| due_date        | Date        | The date when the order was delieverd to the customer                        |
| price           | INT         | The price per unit of the product                                            |
| quantity        | INT         | The number of units ordered of the product                                   |
| total_sales     | INT         | The total price of the order (price * quantity)                              |

