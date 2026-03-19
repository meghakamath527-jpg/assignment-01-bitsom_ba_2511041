
-- DIMENSION TABLES


-- Date Dimension
CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    day INTEGER,
    month INTEGER,
    month_name VARCHAR(20),
    year INTEGER
);

-- Date Data
INSERT INTO dim_date VALUES
(1,'2023-01-15',15,1,'January',2023),
(2,'2023-02-05',5,2,'February',2023),
(3,'2023-02-20',20,2,'February',2023),
(4,'2023-03-31',31,3,'March',2023),
(5,'2023-08-09',9,8,'August',2023),
(6,'2023-08-15',15,8,'August',2023),
(7,'2023-08-29',29,8,'August',2023),
(8,'2023-10-26',26,10,'October',2023),
(9,'2023-12-08',8,12,'December',2023),
(10,'2023-12-12',12,12,'December',2023);

-- Store Dimension
CREATE TABLE dim_store (
    store_id INTEGER PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

-- Store Data
INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Delhi South','Delhi'),
(3,'Mumbai Central','Mumbai');

-- Product Dimension
CREATE TABLE dim_product (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Product Data
INSERT INTO dim_product VALUES
(1,'Laptop','Electronics'),
(2,'T-Shirt','Clothing'),
(3,'Rice','Groceries'),
(4,'Headphones','Electronics'),
(5,'Jeans','Clothing');

-- ===============================
-- FACT TABLE


CREATE TABLE fact_sales (
    sales_id INTEGER PRIMARY KEY,
    date_id INTEGER,
    store_id INTEGER,
    product_id INTEGER,
    units_sold INTEGER,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);




-- Fact Table Data (Sales Transactions)
INSERT INTO fact_sales VALUES
(1,7,1,1,3,49262.78,147788.34),
(2,10,1,2,11,23226.12,255487.32),
(3,2,1,1,20,48703.39,974067.80),
(4,3,2,2,14,23226.12,325165.68),
(5,1,1,5,10,58851.01,588510.10),
(6,5,2,3,7,850.00,5950.00),
(7,6,3,4,4,12500.00,50000.00),
(8,8,2,1,5,47000.00,235000.00),
(9,9,3,2,6,21000.00,126000.00),
(10,4,1,3,9,900.00,8100.00);

select * from dim_date;
SELECT * FROM dim_store;
SELECT * FROM dim_product;
SELECT * FROM fact_sales;