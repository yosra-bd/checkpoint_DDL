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

