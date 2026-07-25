DROP DATABASE IF EXISTS SmartClinic;

CREATE DATABASE SmartClinic;

USE SmartClinic;


-- =========================
-- Patients
-- =========================

CREATE TABLE Patients(
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    DOB DATE NOT NULL
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



-- =========================
-- INSERT DATA
-- =========================


-- Patients (10)

INSERT INTO Patients VALUES
(1,'Sara','Ali','0501234567','2002-03-15'),
(2,'Mohammed','Ahmed','0509876543','1998-08-20'),
(3,'Lama','Khalid','0561112233','2001-12-10'),
(4,'Aisha','Saad','0556666666','2000-11-25'),
(5,'Yousef','Nasser','0557777777','1997-04-18'),
(6,'Noor','Hassan','0558888888','1999-05-20'),
(7,'Reem','Salem','0559999999','2003-02-11'),
(8,'Fahad','Ali','0541111111','1996-09-30'),
(9,'Maha','Omar','0542222222','2001-06-25'),
(10,'Khalid','Sami','0543333333','1995-12-01');



-- Inpatients (5)

INSERT INTO Inpatients VALUES
(2,101,1),
(4,102,2),
(6,103,3),
(8,104,4),
(10,105,5);



-- Outpatients (5)

INSERT INTO Outpatients VALUES
(1,'09:30:00'),
(3,'10:00:00'),
(5,'11:30:00'),
(7,'12:00:00'),
(9,'01:00:00');



-- Doctors (5)

INSERT INTO Doctors VALUES
(1,'Ahmed Hassan','Cardiology','0551234567','ahmed@clinic.com'),
(2,'Fatimah Ali','Neurology','0551111111','fatimah@clinic.com'),
(3,'Mona Ali','Dentistry','0552222222','mona@clinic.com'),
(4,'Omar Khalid','Dermatology','0553333333','omar@clinic.com'),
(5,'Sara Mohammed','Pediatrics','0554444444','sara@clinic.com');



-- Appointments (5)

INSERT INTO Appointments VALUES
(1,'2025-01-10','09:00:00','Completed',1,1),
(2,'2025-01-11','10:00:00','Completed',2,2),
(3,'2025-01-12','11:00:00','Pending',3,3),
(4,'2025-01-13','12:00:00','Completed',4,4),
(5,'2025-01-14','13:00:00','Pending',5,5);



-- Medical Reports (5)

INSERT INTO Medical_Reports VALUES
(1,'Heart Check','2025-01-10','Normal',1),
(2,'Headache','2025-01-11','Medication given',2),
(3,'Dental Pain','2025-01-12','Treatment required',3),
(4,'Skin Allergy','2025-01-13','Cream prescribed',4),
(5,'Child Fever','2025-01-14','Follow up',5);



-- Medicines (5)

INSERT INTO Medicines VALUES
(1,'Aspirin','500mg',20.00),
(2,'Panadol','250mg',10.00),
(3,'Antibiotic','100mg',35.00),
(4,'Cream','50mg',25.00),
(5,'Vitamin','100mg',15.00);



-- Prescriptions

INSERT INTO Prescriptions VALUES
(1,1,'Take once daily',10),
(2,2,'Take twice daily',20),
(3,3,'After meal',15),
(4,4,'Apply daily',5),
(5,5,'Once daily',30);



-- Payments

INSERT INTO Payments VALUES
(1,200,'2025-01-10','Cash',1),
(2,300,'2025-01-11','Card',2),
(3,150,'2025-01-12','Cash',3),
(4,250,'2025-01-13','Card',4),
(5,100,'2025-01-14','Cash',5);



-- =========================
-- CHECK OUTPUTS
-- =========================

SELECT * FROM Patients;
SELECT * FROM Inpatients;
SELECT * FROM Outpatients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Medical_Reports;
SELECT * FROM Medicines;
SELECT * FROM Prescriptions;
SELECT * FROM Payments;