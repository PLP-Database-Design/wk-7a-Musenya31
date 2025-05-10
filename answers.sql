-- Question 1: Ensuring First Normal Form (1NF) by eliminating multi-valued attributes

CREATE TABLE ProductDetail_1NF (
    OrderID INT,  -- Unique identifier for each order
    CustomerName VARCHAR(255),  -- Customer's name (not fully normalized, but kept for reference)
    Product VARCHAR(255)  -- Each product must be in a separate row
);

-- Inserting normalized data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');


-- Question 2: Ensuring Second Normal Form (2NF) by removing partial dependencies

-- Creating Customers table to separate data dependent on OrderID
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,  -- Unique identifier for each customer
    CustomerName VARCHAR(255)  -- Fully dependent on CustomerID, removing partial dependency
);

-- Inserting customer data
INSERT INTO Customers (CustomerID, CustomerName)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Emily Clark');

-- Creating OrderDetails_2NF table with a reference to Customers
CREATE TABLE OrderDetails_2NF (
    OrderID INT,  -- Unique identifier for each order
    CustomerID INT,  -- Links to Customers table to avoid redundancy
    Product VARCHAR(255),  -- Each product is separate
    Quantity INT,  -- Product quantity per order
    PRIMARY KEY (OrderID, Product),  -- Composite primary key ensuring uniqueness
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  -- Establishing relationship
);

-- Inserting normalized order details
INSERT INTO OrderDetails_2NF (OrderID, CustomerID, Product, Quantity)
VALUES
    (101, 1, 'Laptop', 2),
    (101, 1, 'Mouse', 1),
    (102, 2, 'Tablet', 3),
    (102, 2, 'Keyboard', 1),
    (102, 2, 'Mouse', 2),
    (103, 3, 'Phone', 1);
