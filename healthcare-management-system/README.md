This README outlines the design of a database for a healthcare management system, 
focusing on patient records, appointments, and inventory. Challenges included modeling complex relationships
and ensuring data integrity, addressed through careful schema design and SQL constraints.

# Entities and Attributes

### Patients
Attributes: Patient ID (Primary Key), Name, Date of Birth, Contact Details, Medical History.
Relationships: Have multiple Appointments.

### Appointments
Attributes: Appointment ID (Primary Key), Patient ID (Reference Key), Doctor ID (Reference Key), Date and Time, Purpose.
Relationships: Linked to one Patient and one Doctor.

### Doctors
Attributes: Doctor ID (Primary Key), Name, Specialty, Contact Details, Working Hours.
Relationships: Linked to multiple Appointments.

### Staff (Including non-doctor staff)
Attributes: Staff ID (Primary Key), Name, Position, Contact Details, Working Hours.
Relationships: Assigned to Departments.

### Departments
Attributes: Department ID (Primary Key), Name, Head (Reference Key to Staff ID).
Relationships: Have multiple Staff.

## Inventory
Attributes: Item ID (Primary Key), Name, Quantity, Reorder Level, Department ID (Reference Key).
Relationships: Linked to Departments.

# Relationships Overview
Patients to Appointments: One-to-Many (Each patient can have multiple appointments).
Doctors to Appointments: One-to-Many (A doctor can have multiple appointments).
Staff to Departments: Many-to-One (Multiple staff members can belong to a department).
Inventory to Departments: Many-to-One (Multiple inventory items can belong to a department).

# Instructions
To set up and run the database, ensure Docker is installed. Navigate to the project directory where docker-compose.yml
is located. Run docker-compose up to start the PostgreSQL container. The database, along with the initial schema and 
data, will be set up automatically. For detailed setup, refer to the provided docker-compose.yml file.