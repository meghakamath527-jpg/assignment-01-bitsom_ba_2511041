## ETL Decisions

### 1. Fixing Different Date Formats
Problem:
The dataset had dates written in different formats like:
29/08/2023, 12-12-2023, and 2023-02-05.

Solution:
All dates were converted into a single standard format: YYYY-MM-DD.
A separate date dimension table (dim_date) was created to store date information like day, month, and year.



### 2. Fixing Category Name Differences
Problem:
The product categories were written in different ways such as:
electronics, Electronics, grocery, Groceries.

Solution:
All category names were standardised to:
Electronics, Clothing, and Groceries.
This makes reporting and grouping easier.



### 3. Calculating Total Sales
Problem:
The raw data had units_sold and unit_price but did not have  total sales.

Solution:
During the ETL process, total sales were calculated using:

total_sales = units_sold × unit_price

This value was stored in the fact_sales table to make analysis faster.
