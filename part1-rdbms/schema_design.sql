DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS Sales_Reps;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

SELECT * FROM Customers;



CREATE TABLE Products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    unit_price DECIMAL(10, 2)
);


INSERT INTO Products VALUES
('P004', 'Notebook', 'Stationery', 120.00),
('P007', 'Pen Set', 'Stationery', 250.00),
('P005', 'Headphones', 'Electronics', 3200.00),
('P003', 'Desk Chair', 'Furniture', 8500.00),
('P006', 'Standing Desk', 'Furniture', 22000.00);

SELECT * FROM Products;

CREATE TABLE Sales_Reps (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(50),
    sales_rep_email VARCHAR(255),
    office_address TEXT
);

INSERT INTO Sales_Reps (rep_id, rep_name, sales_rep_email, office_address) VALUES 
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

SELECT * FROM Sales_Reps;



CREATE TABLE Orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    sales_rep_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Orders (order_id, customer_id, sales_rep_id, product_id, quantity, order_date) VALUES 
('ORD1027', 'C002', 'SR02', 'P004', 4, '2023-11-02'),
('ORD1114', 'C001', 'SR01', 'P007', 2, '2023-08-06'),
('ORD1153', 'C006', 'SR01', 'P007', 3, '2023-02-14'),
('ORD1002', 'C002', 'SR02', 'P005', 1, '2023-01-17'),
('ORD1075', 'C005', 'SR03', 'P003', 3, '2023-04-18');

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Sales_Reps;
SELECT * FROM Orders;

