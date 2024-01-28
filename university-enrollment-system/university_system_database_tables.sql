-- Student Table
CREATE TABLE Student (
    Student_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Enrollment_Date DATE,
    Major VARCHAR(255),
    Contact_Info VARCHAR(255)
);

-- Department Table
CREATE TABLE Department (
    Department_ID SERIAL PRIMARY KEY,
    Department_Name VARCHAR(255),
    --Head_of_Department INTEGER REFERENCES Faculty(Faculty_ID)
);

-- Course Table
CREATE TABLE Course (
    Course_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Department_ID INTEGER REFERENCES Department(Department_ID),
    Credit_Hours INTEGER CHECK (Credit_Hours > 0),
    Prerequisites TEXT
);


CREATE TABLE Faculty (
    Faculty_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Department_ID INTEGER REFERENCES Department(Department_ID),
    Contact_Info VARCHAR(255),
    Office_Hours TEXT
);

CREATE TABLE Classroom_Assignment (
    Room_Number VARCHAR(50),
    Course_ID INTEGER REFERENCES Course(Course_ID),
    Time_Slot TEXT,
    Maximum_Capacity INTEGER
);

CREATE TABLE Enrollment (
    Enrollment_ID SERIAL PRIMARY KEY,
    Student_ID INTEGER REFERENCES Student(Student_ID),
    Course_ID INTEGER REFERENCES Course(Course_ID),
    Enrollment_Date DATE,
    Grade VARCHAR(10)
);


