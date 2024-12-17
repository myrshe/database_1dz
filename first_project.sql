DROP TABLE IF EXISTS Client;
CREATE TABLE IF NOT EXISTS Client (
    ClientID VARCHAR(20) PRIMARY KEY ,
    Name TEXT,
    Surname TEXT,
    Address TEXT,
    phone VARCHAR(11)
);

DROP TABLE IF EXISTS Product;
CREATE TABLE IF NOT EXISTS Product (
    ProductID VARCHAR(20) PRIMARY KEY,
    Name TEXT,
    Price NUMERIC(10, 2) NOT NULL,
    Weight NUMERIC(5,2)
);

DROP TABLE IF EXISTS Shop;
create table IF NOT EXISTS Shop (
    ShopID VARCHAR(20) PRIMARY KEY ,
    Name TEXT,
    Address TEXT,
    City TEXT
);

DROP TABLE IF EXISTS Delivery;
CREATE TABLE IF NOT EXISTS Delivery (
    DeliveryID VARCHAR(20) PRIMARY KEY,
    Time TIME DEFAULT CURRENT_TIME,
    Price NUMERIC(10,2) NOT NULL
);

DROP TABLE IF EXISTS Shipment;
CREATE TABLE IF NOT EXISTS Shipment (
    ShipmentID VARCHAR(20) PRIMARY KEY,
    Date DATE DEFAULT CURRENT_DATE,
    ClientID VARCHAR(20) NOT NULL REFERENCES Client(ClientID),
    ShopID VARCHAR(20) NOT NULL REFERENCES Shop(ShopID),
    DeliveryID VARCHAR(20) NOT NULL REFERENCES Delivery(DeliveryID)
);

DROP TABLE IF EXISTS OrderProduct;
CREATE TABLE IF NOT EXISTS ShipmentProduct (
    ShipmentID VARCHAR(20) NOT NULL REFERENCES Shipment(ShipmentID),
    ProductID VARCHAR(20) NOT NULL REFERENCES Product(ProductID),
    Count INT,
    PRIMARY KEY (ShipmentID, ProductID)
);