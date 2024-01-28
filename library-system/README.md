This README outlines the database design for managing books, 
member information, and event scheduling. The challenge of linking books to multiple genres and 
members to multiple loans was solved with associative tables and composite keys.

# Database Schema and Relationships

### Book Catalog Table
Attributes: Book ID, Title, Author(s), Genre ID, Availability Status, ISBN Number, Publication Year.
Relationships: Books are categorized into Genres.

### Member Profiles Table
Attributes: Member ID, Name, Contact Details, Address, Registration Date, Membership Status.
Relationships: Members can have multiple Loans.

### Loan Records Table
Attributes: Loan ID, Book ID, Member ID, Checkout Date, Due Date, Return Date.
Relationships: Each Loan is linked to one Book and one Member.

### Event Calendar Table
Attributes: Event ID, Name, Description, Date, Time, Location, Attendee Limit.
Relationships: Events may be attended by multiple Members.

### Genres Table
Attributes: Genre ID, Genre Name.
Relationships: Multiple Books can belong to one Genre.

# ERD Representation

### Books to Genres
Relationship: Many-to-One (many books can belong to one genre).
Notation: Connect the Book Catalog to the Genres table with a line.
Place a crow's foot at the Book Catalog end.

### Members to Loans
Relationship: One-to-Many (a member can have multiple loans).
Notation: Connect the Member Profiles table to the Loan Records table with a line.
Place a crow's foot at the Loan Records end.

### Loans to Books:
Relationship: Many-to-One (each loan is for one book, but a book can have multiple loans over time, not concurrently).
Notation: Connect the Loan Records table to the Book Catalog table with a line.
Place a crow's foot at the Loan Records end, but ensure business logic prevents more than one active loan for a book.

### Events to Members (if managing attendees within the database)
Relationship: Many-to-Many (an event can have multiple attendees, and a member can attend multiple events).
Notation: This would typically require an associative table (e.g., Event_Attendees) 
with Member ID and Event ID as foreign keys. 
Connect Member Profiles and Event Calendar to this associative table,
placing crow's feet at both ends of the lines connecting to the associative table.

# Instructions
To set up and run the database, ensure Docker is installed. Navigate to the project directory where docker-compose.yml
is located. Run "docker-compose up" to start the PostgreSQL container. 
The database, along with the initial schema and data, will be set up automatically. 
For detailed setup, refer to the provided docker-compose.yml file.