DROP DATABASE food;
CREATE DATABASE food;

\c food

CREATE TABLE Product
(
productid VARCHAR(10) NOT NULL,
productname VARCHAR(20),
price INT, --in rupees
category VARCHAR(20),
availability VARCHAR(5),
brandid VARCHAR(10),
PRIMARY KEY (productid),
FOREIGN KEY (brandid) REFERENCES Brand(brandid)
);

CREATE TABLE Brand
(
brandid VARCHAR(10) NOT NULL,
brandname VARCHAR(20),
shareprice INT, --in rupees
startdate DATE,
marketcap INT, --in rupees
PRIMARY KEY (brandid)
);

CREATE TABLE Investor
(
investorid VARCHAR(10) NOT NULL,
investorname VARCHAR(20) NOT NULL,
totalshareprice INT,
nshares INT,
brandid VARCHAR(10),
PRIMARY KEY (investorid),
FOREIGN KEY (brandid) REFERENCES Brand(brandid)
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
PRIMARY KEY (batchid),
FOREIGN KEY (brandid) REFERENCES Brand(brandid),
FOREIGN KEY (productid) REFERENCES Product(productid)
FOREIGN KEY (stockid) REFERENCES Stock(stockid)
);

CREATE TABLE Employee
(
empid VARCHAR(10) NOT NULL,
empname VARCHAR(20) NOT NULL,
empdoj DATE,
empdob DATE,
deptid INT,
salary INT,
line1 VARCHAR(30),
line2 VARCHAR(30),
line3 VARCHAR(30),
PRIMARY KEY (empid),
FOREIGN KEY (deptid) REFERENCES Department(deptid)
);

CREATE TABLE Department
(
deptid VARCHAR(10) NOT NULL,
deptname VARCHAR(15) NOT NULL,
deptheadid VARCHAR(10),
deptlocation VARCHAR(20),
PRIMARY KEY (deptid),
FOREIGN KEY (deptheadid) REFERENCES Employee(deptheadid)
);

CREATE TABLE depthead
(
dsince DATE,
deptid VARCHAR(10),
FOREIGN KEY (deptid) REFERENCES Department(deptid)
);

CREATE TABLE productionhead
(
psince DATE,
prodheadid VARCHAR(10),
FOREIGN KEY (prodheadid) REFERENCES Employee(deptheadid)
);

CREATE TABLE Stock
(
stockid VARCHAR(10) NOT NULL,
stockdate DATE,
productid VARCHAR(10) NOT NULL,
PRIMARY KEY (deptid),
FOREIGN KEY (productid) REFERENCES Product(productid)
);

CREATE TABLE Distributor
(
distid VARCHAR(5) NOT NULL,
distname VARCHAR(15) NOT NULL,
distarea VARCHAR(15) NOT NULL,
stockid VARCHAR(10),
PRIMARY KEY (distid),
FOREIGN KEY (stockid) REFERENCES Stock(stockid)
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
PRIMARY KEY (saleid),
FOREIGN KEY (orderid) REFERENCES Order(orderid),
FOREIGN KEY (customerid) REFERENCES Customer(customerid)
);

CREATE TABLE Order
(
orderid VARCHAR(20) NOT NULL,
orderdate DATE,
customerid VARCHAR(10),
orderqty INT,
productid VARCHAR(10),
paymentmode VARCHAR(10),
confirmed VARCHAR(3),
PRIMARY KEY (orderid),
FOREIGN KEY (customerid) REFERENCES Customer(customerid),
FOREIGN KEY (productid) REFERENCES Product(productid)
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
