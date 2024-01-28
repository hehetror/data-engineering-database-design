-- Product Catalogs Table
CREATE TABLE Product_Catalog (
    Product_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Category_ID INTEGER,
    Price DECIMAL,
    Stock_Level INTEGER CHECK (Stock_Level >= 0),
    Description TEXT
);

-- Customers Profile Table
CREATE TABLE Customer_Profiles (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Address TEXT,
    Email VARCHAR(255),
    Phone_Number VARCHAR(20),
    Registration_Date DATE
);

-- Order Details Table
CREATE TABLE Order_Details (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INTEGER REFERENCES Customer_Profiles(Customer_ID),
    Order_Date DATE,
    Total_Amount DECIMAL,
    Order_Status VARCHAR(50)
);

-- Order Items Table
CREATE TABLE Order_Items (
    Order_Item_ID SERIAL PRIMARY KEY,
    Order_ID INTEGER REFERENCES Order_Details(Order_ID),
    Product_ID INTEGER REFERENCES Product_Catalog(Product_ID),
    Quantity INTEGER,
    Price_per_Unit DECIMAL
);

-- Shipping Information Table
CREATE TABLE Shipping_Information (
    Shipping_ID SERIAL PRIMARY KEY,
    Order_ID INTEGER REFERENCES Order_Details(Order_ID),
    Shipping_Method VARCHAR(255),
    Tracking_Number VARCHAR(255),
    Delivery_Status VARCHAR(50),
    Estimated_Delivery_Date DATE
);

-- Product Categories Table
CREATE TABLE Product_Categories (
    Category_ID SERIAL PRIMARY KEY,
    Category_Name VARCHAR(255),
    Parent_Category_ID INTEGER
);

-- Product Category Link Table
CREATE TABLE Product_Category_Link (
    Product_ID INTEGER REFERENCES Product_Catalog(Product_ID),
    Category_ID INTEGER REFERENCES Product_Categories(Category_ID),
    PRIMARY KEY (Product_ID, Category_ID)
);
