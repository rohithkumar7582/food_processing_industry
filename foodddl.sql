DROP DATABASE food;
CREATE DATABASE food;

\c food

CREATE TABLE Brand
(
brandid VARCHAR(10) NOT NULL,
brandname VARCHAR(20),
shareprice INT, --in rupees
startdate DATE,
marketcap INT, --in rupees
PRIMARY KEY (brandid)
);

CREATE TABLE Product
(
productid VARCHAR(10) NOT NULL,
productname VARCHAR(20),
price INT, --in rupees
category VARCHAR(20),
availability VARCHAR(5),
brandid VARCHAR(10),
PRIMARY KEY (productid)
);

CREATE TABLE Investor
(
investorid VARCHAR(10) NOT NULL,
investorname VARCHAR(20) NOT NULL,
totalshareprice INT,
nshares INT,
brandid VARCHAR(10),
PRIMARY KEY (investorid)
);

CREATE TABLE ProductionHouse
(
batchid VARCHAR(20) NOT NULL,
target INT,
rawqty INT,
dom DATE,
producerate INT,
brandid VARCHAR(10),
productid VARCHAR(10),
stockid VARCHAR(10),
PRIMARY KEY (batchid)
);

CREATE TABLE Employee
(
empid VARCHAR(10) NOT NULL,
empname VARCHAR(20) NOT NULL,
empdoj DATE,
empdob DATE,
deptid VARCHAR(10),
salary INT,
line1 VARCHAR(30),
line2 VARCHAR(30),
line3 VARCHAR(30),
PRIMARY KEY (empid)
);

CREATE TABLE Department
(
deptid VARCHAR(10) NOT NULL,
deptname VARCHAR(15) NOT NULL,
deptheadid VARCHAR(10),
deptlocation VARCHAR(20),
PRIMARY KEY (deptid)
);

CREATE TABLE depthead
(
dsince DATE,
deptid VARCHAR(10)
);

CREATE TABLE productionhead
(
psince DATE,
prodheadid VARCHAR(10)
);

CREATE TABLE Stock
(
stockid VARCHAR(10) NOT NULL,
stockdate DATE,
productid VARCHAR(10) NOT NULL,
PRIMARY KEY (stockid)
);

CREATE TABLE Distributor
(
distid VARCHAR(5) NOT NULL,
distname VARCHAR(15) NOT NULL,
distarea VARCHAR(15) NOT NULL,
stockid VARCHAR(10),
PRIMARY KEY (distid)
);

CREATE TABLE Sales
(
saleid INT NOT NULL,
saledate DATE,
orderid VARCHAR(20),
netamt INT,
customerid VARCHAR(10),
discount INT,
gst INT,
grossamt INT,
PRIMARY KEY (saleid)
);

CREATE TABLE Customer
(
customerid VARCHAR(10) NOT NULL,
username VARCHAR(15) UNIQUE NOT NULL,
password VARCHAR(10) NOT NULL,
regdate DATE,
phoneno INT,
line1 VARCHAR(30),
line2 VARCHAR(30),
line3 VARCHAR(30),
PRIMARY KEY (customerid)
);

CREATE TABLE FoodOrder
(
orderid VARCHAR(20) NOT NULL,
orderdate DATE,
customerid VARCHAR(10),
orderqty INT,
productid VARCHAR(10),
paymentmode VARCHAR(10),
confirmed VARCHAR(3),
PRIMARY KEY (orderid)
);

ALTER TABLE Product ADD FOREIGN KEY (brandid) REFERENCES Brand(brandid);

ALTER TABLE Investor ADD FOREIGN KEY (brandid) REFERENCES Brand(brandid);

ALTER TABLE ProductionHouse ADD FOREIGN KEY (brandid) REFERENCES Brand(brandid);
ALTER TABLE ProductionHouse ADD FOREIGN KEY (productid) REFERENCES Product(productid);
ALTER TABLE ProductionHouse ADD FOREIGN KEY (stockid) REFERENCES Stock(stockid);

ALTER TABLE Department ADD FOREIGN KEY (deptheadid) REFERENCES Employee(empid);

ALTER TABLE Employee ADD FOREIGN KEY (deptid) REFERENCES Department(deptid);

ALTER TABLE productionhead ADD FOREIGN KEY (prodheadid) REFERENCES Employee(empid);

ALTER TABLE depthead ADD FOREIGN KEY (deptid) REFERENCES Department(deptid);

ALTER TABLE Stock ADD FOREIGN KEY (productid) REFERENCES Product(productid);

ALTER TABLE Distributor ADD FOREIGN KEY (stockid) REFERENCES Stock(stockid);

ALTER TABLE FoodOrder ADD FOREIGN KEY (customerid) REFERENCES Customer(customerid);
ALTER TABLE FoodOrder ADD FOREIGN KEY (productid) REFERENCES Product(productid);

ALTER TABLE Sales ADD FOREIGN KEY (orderid) REFERENCES FoodOrder(orderid);
ALTER TABLE Sales ADD FOREIGN KEY (customerid) REFERENCES Customer(customerid);
