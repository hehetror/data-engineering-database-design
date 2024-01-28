This README details the e-commerce database design, emphasizing product catalogs,
customer profiles, and order processing. The main challenge was scaling the database for a large number of 
transactions, addressed by optimizing table indices and relationships.

# Database Schema and Relationships

### Product Catalog Table
Attributes: Product ID, Name, Category ID, Price, Stock Level, Description.
Relationships: Products can belong to multiple Categories.

### Customer Profiles Table
Attributes: Customer ID, Name, Address, Email, Phone Number, Registration Date.
Relationships: Customers can place multiple Orders.

### Order Details Table
Attributes: Order ID, Customer ID, Order Date, Total Amount, Order Status.
Relationships: Each Order is linked to one Customer.

### Order Items Table
Attributes: Order Item ID, Order ID, Product ID, Quantity, Price per Unit.
Relationships: Each Order can include multiple Products.

### Shipping Information Table
Attributes: Shipping ID, Order ID, Shipping Method, Tracking Number, Delivery Status, Estimated Delivery Date.
Relationships: Each Order has one Shipping Information entry.

### Product Categories Table
Attributes: Category ID, Category Name, Parent Category ID.
Relationships: Categories can have subcategories (hierarchical).

# Instructions
To set up and run the database, ensure Docker is installed. Navigate to the project directory where docker-compose.yml
is located. Run "docker-compose up" to start the PostgreSQL container.
The database, along with the initial schema and data, will be set up automatically. For detailed setup,
refer to the provided docker-compose.yml file.