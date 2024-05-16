DROP TABLE IF EXISTS rakshapipes.customer_lookup;

CREATE TABLE rakshapipes.customer_lookup (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    country VARCHAR(100),
    zip_code VARCHAR(20),
    age INT,
    gender ENUM('Male', 'Female'),
    industry VARCHAR(255));
    
    
DROP TABLE IF EXISTS rakshapipes.product_lookup;

CREATE TABLE rakshapipes.product_lookup (
    ProductKey INT AUTO_INCREMENT PRIMARY KEY,
    ProductSubcategory VARCHAR(255),
    ProductSKU VARCHAR(50),
    ProductDescription TEXT,
    ProductColor VARCHAR(50),
    ProductCost DECIMAL(10, 2),
    ProductPrice DECIMAL(10, 2)
);

CREATE TABLE rakshapipes.productcategory_lookup (
    ProductCategoryKey INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE rakshapipes.productsubcategory_lookup (
    ProductSubcategoryKey INT PRIMARY KEY AUTO_INCREMENT,
    SubcategoryName VARCHAR(255),
    ProductCategoryKey INT,
FOREIGN KEY (ProductCategoryKey) REFERENCES rakshapipes.productcategory_lookup(ProductCategoryKey)
);

CREATE TABLE rakshapipes.calendar_lookup (
    Date text
);

CREATE TABLE rakshapipes.territory_lookup (
    SalesTerritoryKey INT PRIMARY KEY,
    Country VARCHAR(255),
    Continent VARCHAR(255)
);

CREATE TABLE rakshapipes.sales_data (
    OrderNumber INT PRIMARY KEY,
    OrderDate text,
    ProductKey INT,
    customer_id INT,
    TerritoryKey INT,
    OrderQuantity INT,
    FOREIGN KEY (ProductKey) REFERENCES rakshapipes.product_lookup(ProductKey),
    FOREIGN KEY (customer_id) REFERENCES rakshapipes.customer_lookup(customer_id),
    FOREIGN KEY (TerritoryKey) REFERENCES rakshapipes.territory_lookup(SalesTerritoryKey)
);


CREATE TABLE rakshapipes.returns_data (
    ReturnDate TEXT,
    TerritoryKey INT,
    ProductKey INT,
    ReturnQuantity INT,
    FOREIGN KEY (TerritoryKey) REFERENCES rakshapipes.territory_lookup(SalesTerritoryKey),
    FOREIGN KEY (ProductKey) REFERENCES rakshapipes.product_lookup(ProductKey)
);









