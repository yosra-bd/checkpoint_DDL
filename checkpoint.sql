CREATE TABLE Product (
    Product_id VARCHAR2 (20)  PRIMARY KEY,
    Product_name VARCHAR2 (20) NOT NULL,
    Price NUMBER CHECK (Price > 0)
);

CREATE TABLE Customer (
    Customer_id VARCHAR2 (20) PRIMARY KEY,
    Customer_Name VARCHAR2 (20) NOT NULL,
    Customer_Tel NUMBER
);

CREATE TABLE Orders (
    Customer_id VARCHAR2 (20),
    Product_id VARCHAR2 (20),
    Quantity NUMBER ,
    Total_Amount NUMBER,
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    CONSTRAINT FK_ProductOrder FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

ALTER TABLE Orders ADD CONSTRAINT Order_id PRIMARY KEY (Customer_id,Product_id);
ALTER TABLE Product ADD Category VARCHAR2(20);
ALTER TABLE Orders ADD Order_date DATE DEFAULT = SYSDATE;

INSERT INTO Product (Product_id, Product_name, Category, Price) VALUES ('P01','Samsung Galaxy S20', 'Smartphone', 3299);
INSERT INTO Product (Product_id, Product_name, Category, Price) VALUES ('P02','ASUS Notebook', 'PC', 4599);

INSERT INTO Customer (Customer_id, Customer_Name, Customer_Tel) VALUES ('C01', 'ALI', 71321009);
INSERT INTO Customer (Customer_id, Customer_Name, Customer_Tel) VALUES ('C02', 'ASMA', 77345823);

INSERT INTO Orders (Customer_id, Product_id, Order_date, Quantity, Total_Amount) VALUES ('C01','P02',NULL,2,9198);
INSERT INTO Orders (Customer_id, Product_id, Order_date, Quantity, Total_Amount) VALUES ('C02','P01',05-20-2020,1,3299);

