This README describes the database design for a university system managing enrollments and courses.
Key challenges were handling many-to-many relationships and maintaining referential integrity, 
solved with associative tables and appropriate foreign keys.


# Database Schema and Relationships

### Student Table
Attributes: Student ID, Name, Enrollment Date, Major, Contact Information.
Relationships: Students enroll in multiple Courses.

### Course Table
Attributes: Course ID, Name, Department ID, Credit Hours, Prerequisites.
Relationships: Each Course taught by one Faculty, enrolled in by multiple Students.

### Faculty Table
Attributes: Faculty ID, Name, Department ID, Contact Information, Office Hours.
Relationships: Faculty can teach multiple Courses.

### Classroom Assignment Table
Attributes: Room Number, Course ID, Time Slot, Maximum Capacity.
Constraints: No overlapping class times for the same room.

### Enrollment Table
Attributes: Enrollment ID, Student ID, Course ID, Enrollment Date, Grade.
Constraints: Respecting classroom capacity.

### Department Table
Attributes: Department ID, Department Name, Head of Department (Faculty ID).

## Constraints and Business Rules
Enforce unique identifiers for each table.
Check for valid dates in Enrollment.
Enforce capacity constraints in the Classroom Assignment table, which may require application-level logic.
Ensure the correct linking of foreign keys to maintain relationships.

## Relationship Representation
### Students to Courses (Enrollment)
Relationship: Many-to-Many (students can enroll in multiple courses, and each course can have multiple students).
Notation: Connect the Student table to the Enrollment table, and then connect the Enrollment table to the Course table.
Use crow's feet near the Enrollment table to indicate many students per enrollment and many courses per enrollment.

### Courses to Faculty
Relationship: Many-to-One (each course is taught by one faculty member, but a faculty member can teach multiple courses).
Notation: Connect the Course table to the Faculty table with a line. Place a crow's foot on the Course side.

### Faculty to Departments
Relationship: Many-to-One (faculty members belong to one department, but a department can have multiple faculty members).
Notation: Connect the Faculty table to the Department table with a line. Place a crow's foot on the Faculty side.

### Courses to Classroom Assignments
Relationship: One-to-One (each course is assigned one classroom, assuming no time overlaps).
Notation: Connect the Course table to the Classroom Assignment table with a simple line.

### Courses to Departments:
Relationship: Many-to-One (courses belong to a department, but a department can offer multiple courses).
Notation: Connect the Course table to the Department table with a line. Place a crow's foot on the Course side.

# Instructions
#### Run Docker file
To set up and run the database, ensure Docker is installed. Navigate to the project directory where docker-compose.yml
is located. Run "docker-compose up" to start the PostgreSQL container.
The database, along with the initial schema and data, will be set up automatically. For detailed setup,
refer to the provided docker-compose.yml file.

#### Database Setup Process
For the Department and Faculty tables, first create the Department table without the Head_of_Department column.
Then, create the Faculty table with a Department_ID foreign key. Finally,
alter the Department table to add the Head_of_Department column as a foreign key referencing Faculty. 
This avoids circular dependencies during creation.