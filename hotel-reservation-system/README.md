This README explains the database schema for a hotel reservation system,
including room bookings and service requests. Challenges such as ensuring unique bookings
per room were addressed with unique constraints and careful relationship mapping.

# Database Schema and Relationships

### Guest Profiles Table
Attributes: Guest ID, Name, Contact Information, Loyalty Program Membership.
Relationships: Guests make multiple Bookings.

### Room Details Table
Attributes: Room ID, Room Type, Status, Cleaning Schedule, Room Features.
Constraints: Each room can have only one active booking.

### Staff Information Table
Attributes: Employee ID, Name, Role, Contact Information, Assigned Tasks.
Relationships: Staff can be assigned to multiple roles and tasks.

### Booking Details Table
Attributes: Booking ID, Guest ID, Room ID, Check-in Date, Check-out Date, Payment Status.
Constraints: A room can have only one active booking.

### Service Requests Table
Attributes: Request ID, Booking ID, Description, Assigned Staff ID, Fulfillment Status.
Constraints: Must be linked to a booking.

### Room Rate Table:
Attributes: Room Type, Rate Per Night, Seasonal Adjustments.

# Relationships and Connections
Guests to Bookings: One-to-Many (a guest can have multiple bookings).
Bookings to Rooms: Many-to-One (each booking is for one room).
Staff to Service Requests: One-to-Many (a staff member can handle multiple service requests).
Bookings to Service Requests: One-to-Many (a booking can have multiple service requests).

# Instructions

To set up and run the database, ensure Docker is installed. Navigate to the project directory 
where docker-compose.yml is located. Run docker-compose up to start the PostgreSQL container. The database,
along with the initial schema and data, will be set up automatically. For detailed setup, refer to the provided 
docker-compose.yml file.