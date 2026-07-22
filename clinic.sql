CREATE DATABASE IF NOT EXISTS SmartClinic;
USE SmartClinic;

-- Patients
CREATE TABLE Patients(
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(15),
    DOB DATE,
    Patient_Type VARCHAR(20)
);

-- Inpatients
CREATE TABLE Inpatients(
    Patient_ID INT PRIMARY KEY,
    Room_Number INT,
    Bed_Number INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Outpatients
CREATE TABLE Outpatients(
    Patient_ID INT PRIMARY KEY,
    Arrival_Time TIME,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Doctors
CREATE TABLE Doctors(
    Doctor_ID INT PRIMARY KEY,
    Doctor_Name VARCHAR(100),
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

-- Appointments
CREATE TABLE Appointments(
    Appointment_ID INT PRIMARY KEY,
    Appointment_Date DATE,
    Appointment_Time TIME,
    Status VARCHAR(30),
    Patient_ID INT,
    Doctor_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

-- Medical Reports
CREATE TABLE Medical_Reports(
    Report_ID INT PRIMARY KEY,
    Diagnosis VARCHAR(255),
    Report_Date DATE,
    Note TEXT,
    Appointment_ID INT,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);

-- Medicines
CREATE TABLE Medicines(
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(100),
    Dosage VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Prescriptions
CREATE TABLE Prescriptions(
    Appointment_ID INT,
    Medicine_ID INT,
    Dosage_Instructions VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (Appointment_ID, Medicine_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicines(Medicine_ID)
);

-- Payments
CREATE TABLE Payments(
    Payment_ID INT PRIMARY KEY,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    Appointment_ID INT,
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);







