\c food

INSERT INTO Brand values('B001','MTR',320,'2000-12-18',1235000);
INSERT INTO Brand values('B002','Britannia',990,'2005-10-20',8526000);
INSERT INTO Brand values('B003','Kissan',540,'2003-07-01',3465000);
INSERT INTO Brand values('B004','Cadbury',1150,'1998-02-15',32640000);
INSERT INTO Brand values('B005','Heritage',200,'2010-05-09',6755000);

INSERT INTO Investor values('I001','Rakesh',810000,1500,'B003');
INSERT INTO Investor values('I002','Archit',1600000,8000,'B005');
INSERT INTO Investor values('I003','Sagar',1035000,900,'B004');
INSERT INTO Investor values('I004','Amir',1280000,4000,'B001');
INSERT INTO Investor values('I005','Joel',594000,600,'B002');

Alter table Product disable trigger all;
INSERT INTO Product values('RPS001','Cup Noodles',70,'Noodles','Yes','MTR');
INSERT INTO Product values('RPS002','Bread',50,'Dairy','Yes','Britannia');
INSERT INTO Product values('RPS003','Peppar',105,'Masala','Yes','MTR');
INSERT INTO Product values('RPS004','Milk',40,'Dairy','No','Heritage');
INSERT INTO Product values('RPS005','Jam',80,'Sweet','Yes','Kissan');
INSERT INTO Product values('RPS006','Oreo',110,'Biscuit','Yes','Cadbury');
INSERT INTO Product values('RPS007','Chips',60,'Chips','No','Britannia');
INSERT INTO Product values('RPS008','Pepsi',120,'Juice','Yes','Kissan');

Alter table ProductionHouse disable trigger all;
INSERT INTO ProductionHouse values('BA001',1200,8000,'2021-10-21',20,'B004','RPS006','S003');
INSERT INTO ProductionHouse values('BA002',3600,12500,'2021-10-22',50,'B003','RPS005','S002');
INSERT INTO ProductionHouse values('BA003',5400,19000,'2021-10-23',80,'B001','RPS001','S003');
INSERT INTO ProductionHouse values('BA004',300,0,'2021-10-24',10,'B002','RPS007','S001');
INSERT INTO ProductionHouse values('BA005',800,4800,'2021-10-25',15,'B002','RPS002','S002');

Alter table Employee disable trigger all;
INSERT INTO Employee values('E001','Harish','2012-02-03','1978-06-07','D003',65000,'#5','Electronic City','Bangalore');
INSERT INTO Employee values('E002','Rohan','2015-08-12','1977-12-18','D002',85000,'#32,5th cross','Bommasandra','Bangalore');
INSERT INTO Employee values('E003','Vaibhav','2013-10-15','1982-05-19','D001',120000,'#16,9th Block','Jayanagar','Bangalore');
INSERT INTO Employee values('E004','Likith','2012-12-14','1980-08-26','D002',92000,'#12,3rd phase','Koramangala','Bangalore');
INSERT INTO Employee values('E005','Raju','2016-01-25','1985-03-17','D003',58000,'#26/7,Janatha Colony','Marathalli','Bangalore');
INSERT INTO Employee values('E006','Navin','2012-06-19','1979-05-23','D002',73000,'#12/10,Western Gate','Sarjapura','Bangalore');

INSERT INTO Department values('D001','Research','E003','8th Floor');
INSERT INTO Department values('D002','Finance','E004','4th Floor');
INSERT INTO Department values('D003','Production','E001','5,6,7th Floor');

INSERT INTO depthead values('2018-08-22','D001');
INSERT INTO depthead values('2018-02-14','D002');
INSERT INTO depthead values('2018-11-03','D003');

INSERT INTO productionhead values('2018-09-12','E005');

INSERT INTO Stock values('S001','2021-10-21','RPS007');
INSERT INTO Stock values('S002','2021-10-22','RPS002');
INSERT INTO Stock values('S003','2021-10-23','RPS006');

INSERT INTO Distributor values('DI1','AK TRANSPORT','Kolkata','S003');
INSERT INTO Distributor values('DI2','YL CARRIERS','Mumbai','S001');
INSERT INTO Distributor values('DI3','BEST TRANSPORT','Chennai','S002');

INSERT INTO Customer values('C161','rohithkumar7582','rkr@2001','2020-02-08',98575,'#45A','Chandapura','Bangalore');
INSERT INTO Customer values('C162','gagan231','gagz10','2020-01-06',88456,'#3P','Huskur Gate','Bangalore');
INSERT INTO Customer values('C163','keerthi46','keer@123','2019-10-18',98522,'#86','Hebbagodi','Bangalore');
INSERT INTO Customer values('C164','raghavendra7','raghu#23','2021-06-11',76654,'#21-G','Majestic','Bangalore');
INSERT INTO Customer values('C165','madhusudhanbr','madhu*123','2020-03-29',88745,'#7A-B','Jigani','Bangalore');

INSERT INTO FoodOrder values('D2WM8','2021-10-21','C163',12,'RPS005','UPI','Yes');
INSERT INTO FoodOrder values('I46GP','2021-10-21','C161',12,'RPS003','Card','Yes');
INSERT INTO FoodOrder values('DSVW5','2021-10-21','C161',12,'RPS004','Card','Yes');
INSERT INTO FoodOrder values('THRTR','2021-10-21','C161',12,'RPS008','UPI','Yes');
INSERT INTO FoodOrder values('2ECDZ','2021-10-21','C162',12,'RPS006','Cash','No');
INSERT INTO FoodOrder values('32ZCE','2021-10-21','C163',12,'RPS001','UPI','Yes');

INSERT INTO Sales values(541,'2021-10-22','D2WM8',1800,'C163',100,170,1870);
INSERT INTO Sales values(542,'2021-10-22','I46GP',15000,'C161',2000,1300,14300);
INSERT INTO Sales values(543,'2021-10-23','DSVW5',2000,'C161',0,200,2200);
INSERT INTO Sales values(544,'2021-10-23','THRTR',8500,'C161',500,900,8900);
INSERT INTO Sales values(545,'2021-10-23','2ECDZ',4350,'C162',250,550,4650);
INSERT INTO Sales values(546,'2021-10-24','32ZCE',13000,'C163',1000,850,12850);

