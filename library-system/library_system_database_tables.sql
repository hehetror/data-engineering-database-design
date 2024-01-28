-- Genres Table
CREATE TABLE Genres (
    Genre_ID SERIAL PRIMARY KEY,
    Genre_Name VARCHAR(100)
);

-- Book Catalog Table
CREATE TABLE Book_Catalog (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre_ID INTEGER REFERENCES Genres(Genre_ID),
    Availability_Status VARCHAR(50),
    ISBN_Number VARCHAR(20) UNIQUE,
    Publication_Year INTEGER
);

-- Member Profiles Table
CREATE TABLE Member_Profiles (
    Member_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Contact_Details VARCHAR(255),
    Address VARCHAR(255),
    Registration_Date DATE,
    Membership_Status VARCHAR(50)
);

-- Loan Records Table
CREATE TABLE Loan_Records (
    Loan_ID SERIAL PRIMARY KEY,
    Book_ID INTEGER REFERENCES Book_Catalog(Book_ID),
    Member_ID INTEGER REFERENCES Member_Profiles(Member_ID),
    Checkout_Date DATE,
    Due_Date DATE,
    Return_Date DATE
);

-- Event Calender Table
CREATE TABLE Event_Calendar (
    Event_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Event_Date DATE,
    Event_Time TIME,
    Location VARCHAR(255),
    Attendee_Limit INTEGER
);

-- Event Attendees Table
CREATE TABLE Event_Attendees (
    Event_ID INTEGER REFERENCES Event_Calendar(Event_ID),
    Member_ID INTEGER REFERENCES Member_Profiles(Member_ID),
    PRIMARY KEY (Event_ID, Member_ID)
);
