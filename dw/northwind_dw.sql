
DROP DATABASE IF EXISTS northwind_dw;
CREATE DATABASE northwind_dw;

USE northwind_dw;

CREATE TABLE dim_customer (
	CUSTOMERID VARCHAR(5),
	CUSTOMERNAME VARCHAR(255),
	CITY VARCHAR(255),
	COUNTRY VARCHAR(255),
	PRIMARY KEY (CUSTOMERID)
);

CREATE TABLE dim_product (
	PRODUCT_CODE INT,
	PRODUCTID INT default '0',
	PRODUCTNAME VARCHAR(255),
	CATEGORYNAME VARCHAR(255),
	VERSION INT,
	DATEFROM DATETIME,
	DATETO DATETIME,
	PRIMARY KEY (PRODUCTID)
);

CREATE TABLE dim_supplier (
	SUPPLIERID INT,
	COMPANYNAME VARCHAR(255),
	CITY VARCHAR(255),
	COUNTRY VARCHAR(255),
	PRIMARY KEY (SUPPLIERID)
);

CREATE TABLE dim_time (
	TIMEID DATETIME,
	YEARID INT,
	MONTHID INT,
    DAYID INT,
	PRIMARY KEY (TIMEID)
);

CREATE TABLE fact_order (
	ORDERID INT default '0',
	CUSTOMERID VARCHAR(5),
	PRODUCTID INT,
	SUPPLIERID INT,
	TIMEID DATETIME,
    SALES DOUBLE,
	QUANTITY INT,
    
	PRIMARY KEY (ORDERID),
	FOREIGN KEY (CUSTOMERID) REFERENCES dim_customer (CUSTOMERID),
    FOREIGN KEY (SUPPLIERID) REFERENCES dim_supplier (SUPPLIERID),
	FOREIGN KEY (PRODUCTID) REFERENCES dim_product (PRODUCTID),
	FOREIGN KEY (TIMEID) REFERENCES dim_time (TIMEID)
);