-- Create database
CREATE DATABASE IF NOT EXISTS SupplyChainDashboard;
USE SupplyChainDashboard;

-- Create table for storing sales data
CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    StoreID INT,
    RegionID INT,
    State VARCHAR(50),
    SaleDate DATE,
    Quantity INT,
    SaleAmount DECIMAL(10, 2),
    PurchaseMethod VARCHAR(50) -- e.g., Online, Cash, Credit Card
);

-- Create table for storing product data
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

-- Create table for inventory data
CREATE TABLE Inventory (
    ProductID INT,
    WarehouseID INT,
    StockQuantity INT,
    StockValue DECIMAL(10, 2),
    PRIMARY KEY (ProductID, WarehouseID)
);

-- Create table for store data
CREATE TABLE Stores (
    StoreID INT AUTO_INCREMENT PRIMARY KEY,
    StoreName VARCHAR(100),
    RegionID INT
);

-- Create table for regions
CREATE TABLE Regions (
    RegionID INT AUTO_INCREMENT PRIMARY KEY,
    RegionName VARCHAR(100)
);


-- MTD (Month-to-Date) Sales
SELECT SUM(SaleAmount) AS MTD_Sales 
FROM Sales 
WHERE MONTH(SaleDate) = MONTH(CURDATE()) AND YEAR(SaleDate) = YEAR(CURDATE());

-- QTD (Quarter-to-Date) Sales
SELECT SUM(SaleAmount) AS QTD_Sales 
FROM Sales 
WHERE QUARTER(SaleDate) = QUARTER(CURDATE()) AND YEAR(SaleDate) = YEAR(CURDATE());

-- YTD (Year-to-Date) Sales
SELECT SUM(SaleAmount) AS YTD_Sales 
FROM Sales 
WHERE YEAR(SaleDate) = YEAR(CURDATE());

