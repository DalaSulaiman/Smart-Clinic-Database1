DROP DATABASE IF EXISTS SmartClinic;
CREATE DATABASE IF NOT EXISTS SmartClinic;
USE SmartClinic;


-- =========================
-- Patients
-- =========================

CREATE TABLE Patients(
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    DOB DATE NOT NULL,
    Patient_Type VARCHAR(20) NOT NULL
);



-- =========================
-- Inpatients
-- =========================

CREATE TABLE Inpatients(
    Patient_ID INT PRIMARY KEY,
    Room_Number INT NOT NULL,
    Bed_Number INT NOT NULL,

    FOREIGN KEY (Patient_ID) 
    REFERENCES Patients(Patient_ID)
);



-- =========================
-- Outpatients
-- =========================

CREATE TABLE Outpatients(
    Patient_ID INT PRIMARY KEY,
    Arrival_Time TIME NOT NULL,

    FOREIGN KEY (Patient_ID) 
    REFERENCES Patients(Patient_ID)
);



-- =========================
-- Doctors
-- =========================

CREATE TABLE Doctors(
    Doctor_ID INT PRIMARY KEY,
    Doctor_Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);



-- =========================
-- Appointments
-- =========================

CREATE TABLE Appointments(
    Appointment_ID INT PRIMARY KEY,
    Appointment_Date DATE NOT NULL,
    Appointment_Time TIME NOT NULL,
    Status VARCHAR(30) NOT NULL,

    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,

    FOREIGN KEY (Patient_ID)
    REFERENCES Patients(Patient_ID),

    FOREIGN KEY (Doctor_ID)
    REFERENCES Doctors(Doctor_ID)
);



-- =========================
-- Medical Reports
-- =========================

CREATE TABLE Medical_Reports(
    Report_ID INT PRIMARY KEY,
    Diagnosis VARCHAR(255) NOT NULL,
    Report_Date DATE NOT NULL,
    Note TEXT,

    Appointment_ID INT UNIQUE NOT NULL,

    FOREIGN KEY (Appointment_ID)
    REFERENCES Appointments(Appointment_ID)
);



-- =========================
-- Medicines
-- =========================

CREATE TABLE Medicines(
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);



-- =========================
-- Prescriptions
-- =========================

CREATE TABLE Prescriptions(
    Appointment_ID INT,
    Medicine_ID INT,

    Dosage_Instructions VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,

    PRIMARY KEY(Appointment_ID, Medicine_ID),

    FOREIGN KEY(Appointment_ID)
    REFERENCES Appointments(Appointment_ID),

    FOREIGN KEY(Medicine_ID)
    REFERENCES Medicines(Medicine_ID)
);



-- =========================
-- Payments
-- =========================

CREATE TABLE Payments(
    Payment_ID INT PRIMARY KEY,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Method VARCHAR(50) NOT NULL,

    Appointment_ID INT UNIQUE NOT NULL,

    FOREIGN KEY(Appointment_ID)
    REFERENCES Appointments(Appointment_ID)
);
USE SmartClinic;


-- =========================
-- Insert Patients (5 Records)
-- =========================

INSERT INTO Patients
VALUES
(1,'Sara','Ali','0501234567','2002-03-15','Outpatient'),
(2,'Mohammed','Ahmed','0509876543','1998-08-20','Inpatient'),
(3,'Lama','Khalid','0561112233','2001-12-10','Outpatient'),
(4,'Aisha','Saad','0556666666','2000-11-25','Inpatient'),
(5,'Yousef','Nasser','0557777777','1997-04-18','Outpatient');



-- =========================
-- Insert Inpatients
-- =========================

INSERT INTO Inpatients
VALUES
(2,101,1),
(4,102,2);



-- =========================
-- Insert Outpatients
-- =========================

INSERT INTO Outpatients
VALUES
(1,'09:30:00'),
(3,'10:00:00'),
(5,'11:30:00');



-- =========================
-- Insert Doctors (5 Records)
-- =========================

INSERT INTO Doctors
VALUES
(1,'Ahmed Hassan','Cardiology','0551234567','ahmed@clinic.com'),
(2,'Fatimah Ali','Neurology','0551111111','fatimah@clinic.com'),
(3,'Mona Ali','Dentistry','0552222222','mona@clinic.com'),
(4,'Omar Salem','Dermatology','0553333333','omar@clinic.com'),
(5,'Nora Ahmed','Pediatrics','0554444444','nora@clinic.com');



-- =========================
-- Insert Appointments (5 Records)
-- =========================

INSERT INTO Appointments
VALUES
(1,'2025-09-15','10:00:00','Completed',1,1),
(2,'2025-09-16','09:00:00','Completed',2,2),
(3,'2025-09-17','11:00:00','Scheduled',3,3),
(4,'2025-09-18','01:00:00','Completed',4,4),
(5,'2025-09-19','03:00:00','Scheduled',5,5);



-- =========================
-- Insert Medical Reports (5 Records)
-- =========================

INSERT INTO Medical_Reports
VALUES
(1,'Flu','2025-09-15','Patient recovering well',1),
(2,'Headache','2025-09-16','Patient is stable',2),
(3,'Allergy','2025-09-17','Medication prescribed',3),
(4,'Fever','2025-09-18','Need rest and follow up',4),
(5,'Routine Checkup','2025-09-19','Normal examination',5);



-- =========================
-- Insert Medicines (5 Records)
-- =========================

INSERT INTO Medicines
VALUES
(1,'Paracetamol','500mg',15.00),
(2,'Antibiotic','250mg',25.00),
(3,'Vitamin C','1000mg',20.00),
(4,'Pain Killer','50mg',30.00),
(5,'Skin Cream','20g',18.00);



-- =========================
-- Insert Prescriptions (5 Records)
-- =========================

INSERT INTO Prescriptions
VALUES
(1,1,'Take twice daily after meals',10),
(2,2,'Take one tablet daily',5),
(3,3,'Take once daily',7),
(4,4,'Use when needed',3),
(5,5,'Apply twice daily',2);



-- =========================
-- Insert Payments (5 Records)
-- =========================

INSERT INTO Payments
VALUES
(1,150.00,'2025-09-15','Cash',1),
(2,250.00,'2025-09-16','Card',2),
(3,100.00,'2025-09-17','Online',3),
(4,300.00,'2025-09-18','Card',4),
(5,200.00,'2025-09-19','Cash',5);
SELECT * FROM Patients;

SELECT * FROM Doctors;

SELECT * FROM Appointments;

SELECT * FROM Medical_Reports;

SELECT * FROM Medicines;

SELECT * FROM Prescriptions;

SELECT * FROM Payments;
