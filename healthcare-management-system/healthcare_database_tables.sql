-- Patients Table
CREATE TABLE Patients (
    Patient_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Date_of_Birth DATE CHECK (Date_of_Birth < CURRENT_DATE),
    Contact_Details VARCHAR(255) NOT NULL,
    Medical_History TEXT,
    Current_Treatments TEXT
);

-- Staff Table
CREATE TABLE Staff (
    Staff_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Specialty TEXT,
    Contact_Information VARCHAR(255) NOT NULL,
    Working_Hours TEXT,
    Role VARCHAR(50) NOT NULL
);

-- Doctors Table
CREATE TABLE Doctors (
    Doctor_ID INTEGER PRIMARY KEY REFERENCES Staff(Staff_ID),
    Name VARCHAR(255) NOT NULL,
    Specialty TEXT,
    Contact_Information VARCHAR(255) NOT NULL,
    Working_Hours TEXT,
);

-- Appointments Table
CREATE TABLE Appointments (
    Appointment_ID SERIAL PRIMARY KEY,
    Patient_ID INTEGER REFERENCES Patients(Patient_ID) NOT NULL,
    Doctor_ID INTEGER REFERENCES Staff(Staff_ID) NOT NULL,
    Appointment_Date_Time TIMESTAMP CHECK (Appointment_Date_Time > CURRENT_TIMESTAMP),
    Purpose_of_Visit TEXT
);

-- Departments Table
CREATE TABLE Departments (
    Department_ID SERIAL PRIMARY KEY,
    Department_Name VARCHAR(255) NOT NULL,
    Department_Head INTEGER REFERENCES Staff(Staff_ID)
);

-- Inventory Table
CREATE TABLE Inventory (
    Item_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Quantity_Available INTEGER CHECK (Quantity_Available >= 0),
    Reorder_Level INTEGER CHECK (Reorder_Level > 0),
    Department_ID INTEGER REFERENCES Departments(Department_ID)
);

-- Doctor-Patient-Relationships Table
CREATE TABLE Doctor_Patient_Relationship (
    Relationship_ID SERIAL PRIMARY KEY,
    Doctor_ID INTEGER REFERENCES Staff(Staff_ID),
    Patient_ID INTEGER REFERENCES Patients(Patient_ID)
);
