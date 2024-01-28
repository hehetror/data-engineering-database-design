-- Guest Profiles
CREATE TABLE Guest_Profiles (
    Guest_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Contact_Info VARCHAR(255),
    Loyalty_Membership BOOLEAN
);

-- Room Rate
CREATE TABLE Room_Rate (
    Room_Type VARCHAR(50) PRIMARY KEY,
    Rate_Per_Night DECIMAL,
    Seasonal_Adjustments TEXT
);

-- Room Details
CREATE TABLE Room_Details (
    Room_ID SERIAL PRIMARY KEY,
    Room_Type VARCHAR(50) REFERENCES Room_Rate(Room_Type),
    Status VARCHAR(50),
    Cleaning_Schedule DATE,
    Room_Features TEXT
);

-- Staff Information
CREATE TABLE Staff_Information (
    Employee_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Role VARCHAR(100),
    Contact_Info VARCHAR(255)
);

-- Booking Details
CREATE TABLE Booking_Details (
    Booking_ID SERIAL PRIMARY KEY,
    Guest_ID INTEGER REFERENCES Guest_Profiles(Guest_ID),
    Room_ID INTEGER REFERENCES Room_Details(Room_ID),
    Check_in_Date DATE,
    Check_out_Date DATE,
    Payment_Status VARCHAR(100)
);

-- Service Requests
CREATE TABLE Service_Requests (
    Request_ID SERIAL PRIMARY KEY,
    Booking_ID INTEGER REFERENCES Booking_Details(Booking_ID),
    Description TEXT,
    Assigned_Staff_ID INTEGER REFERENCES Staff_Information(Employee_ID),
    Fulfillment_Status VARCHAR(100)
);

