
CREATE TABLE Tbl_Products (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(100), 
    category VARCHAR(50),
    price INT,
    stock_qty INT
);

CREATE TABLE Tbl_Suppliers (
    sup_id INT PRIMARY KEY,
    sup_name VARCHAR(100),
    city VARCHAR(50),
    rating INT
);

CREATE TABLE Tbl_Orders (
    order_id INT PRIMARY KEY,
    prod_id INT,
    cust_id INT,
    order_date DATE,
    qty INT,
    FOREIGN KEY (prod_id) REFERENCES Tbl_Products(prod_id)
);

CREATE TABLE Tbl_Supply_logs (
    log_id INT PRIMARY KEY,
    action_type VARCHAR(20),
    prod_id INT,
    old_qty INT,
    new_qty INT,
    log_time TIMESTAMP,
    FOREIGN KEY (prod_id) REFERENCES Tbl_Products(prod_id)
);

-- =========================
-- INSERT DATA
-- =========================

-- Products
INSERT INTO Tbl_Products VALUES
(501, 'Laptop Pro', 'Electronics', 75000, 15),
(502, 'Ergo Chair', 'Furniture', 15000, 8);

-- Suppliers
INSERT INTO Tbl_Suppliers VALUES
(701, 'NextGen Tech', 'Bangalore', 5),
(702, 'Comfort Hub', 'Mumbai', 4);

-- Orders
INSERT INTO Tbl_Orders VALUES
(9001, 501, 101, '2026-04-20', 1),
(9002, 502, 102, '2026-04-21', 2);

-- Supply Logs
INSERT INTO Tbl_Supply_logs VALUES
(1, 'UPDATE', 501, 20, 15, '2026-04-20 10:00:00');

-- =========================
-- VERIFY
-- =========================

SELECT * FROM Tbl_Products;
SELECT * FROM Tbl_Suppliers;
SELECT * FROM Tbl_Orders;
SELECT * FROM Tbl_Supply_logs;


SELECT 
    P.prod_name, 
    COUNT(O.order_id) AS total_orders
FROM Tbl_Products P
LEFT JOIN Tbl_Orders O ON P.prod_id = O.prod_id
GROUP BY P.prod_id, P.prod_name;


CREATE OR REPLACE PROCEDURE Swap_Supplier_Cities(id1 INT, id2 INT)
LANGUAGE plpgsql
AS $$
DECLARE
    city1 TEXT;
    city2 TEXT;
BEGIN
    SELECT city INTO city1 FROM Tbl_Suppliers WHERE sup_id = id1;
    SELECT city INTO city2 FROM Tbl_Suppliers WHERE sup_id = id2;

    UPDATE Tbl_Suppliers SET city = city2 WHERE sup_id = id1;

    UPDATE Tbl_Suppliers SET city = city1 WHERE sup_id = id2;
    
    COMMIT;
END;
$$;

CALL Swap_Supplier_Cities(701, 702);

SELECT * FROM Tbl_Suppliers;

