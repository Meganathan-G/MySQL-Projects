CREATE DATABASE Healthcare;
USE Healthcare;
drop database healthcare;

CREATE TABLE Patients (
    Patient_ID VARCHAR(15) PRIMARY KEY,
    Patient_Name VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    DOB DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
	Email VARCHAR(100),
    Address TEXT
);

CREATE TABLE Doctors (
    Doctor_ID VARCHAR(15) PRIMARY KEY,
    Doctor_Name VARCHAR(50) NOT NULL,
    Contact_Number VARCHAR(15),
    Email VARCHAR(100),
    Specialization VARCHAR(100) NOT NULL,
    Consultation_Fee DECIMAL(10, 2) NOT NULL
);

CREATE TABLE AppointmentSlots (
    Slot_ID VARCHAR(15) PRIMARY KEY,
    Doctor_ID INT NOT NULL,
    Slot_Date DATE NOT NULL,
    Slot_Time TIME NOT NULL,
    Is_Available BOOLEAN DEFAULT TRUE,
	Appointment_ID VARCHAR(15) NOT NULL
    -- FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
    -- FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID )
);

Alter table Doctors add constraint fk_Doctors foreign key (Doctor_ID) references Doctors(Doctor_ID);
Alter table Appointments add constraint fk_Appointments foreign key(Appointment_ID) references Appointments(Appointment_ID);

CREATE TABLE Appointments (
    Appointment_ID VARCHAR(15) PRIMARY KEY,
	Patient_ID VARCHAR(15) NOT NULL,
    Doctor_ID VARCHAR(15) NOT NULL,
    Slot_ID VARCHAR(15) NOT NULL,
    Appointment_Date DATE NOT NULL,
    History_ID Varchar(15) NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID),
    FOREIGN KEY (Slot_ID) REFERENCES AppointmentSlots(Slot_ID),
    FOREIGN KEY (History_ID) REFERENCES MedicalHistories(History_ID)
);

CREATE TABLE MedicalHistories (
    History_ID Varchar(15) PRIMARY KEY,
    Patient_ID Varchar(15) NOT NULL,
    Doctor_ID Varchar(15),
    Visit_Date DATE NOT NULL,
    Diagnosis TEXT NOT NULL,
    Prescription TEXT,
    Notes TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

Show Tables;
Describe Patients;
Describe Doctors;
Describe Appointments;
Describe AppointmentSLots;
Describe MedicalHistories;

INSERT INTO Patients(Patient_ID, Patient_Name, Contact_Number, DOB, Gender, Email, Address) 
VALUES ('P001', 'Arun Kumar', '9876543210', '1985-02-14', 'Male', 'arun.kumar@example.com', 'No.10, Gandhi Nagar, Chennai, Tamil Nadu'),
('P002', 'Meera Devi', '9845678912', '1990-05-22', 'Female', 'meera.devi@example.com', 'Plot 15, Anna Nagar, Coimbatore, Tamil Nadu'),
('P003', 'Karthik Raja', '9876234510', '1992-07-19', 'Male', 'karthik.raja@example.com', 'No.45, Valluvar Street, Madurai, Tamil Nadu'),
('P004', 'Sanjana Reddy', '9845671123', '1996-09-10', 'Female', 'sanjana.reddy@example.com', 'Flat 101, OMR, Chennai, Tamil Nadu'),
('P005', 'Vijay Anand', '9956234580', '1988-11-25', 'Male', 'vijay.anand@example.com', 'B-12, Thillai Nagar, Trichy, Tamil Nadu'),
('P006', 'Divya Menon', '9842345612', '1994-03-08', 'Female', 'divya.menon@example.com', 'No.67, Race Course Road, Coimbatore, Tamil Nadu'),
('P007', 'Rahul Iyer', '9987456123', '1991-06-15', 'Male', 'rahul.iyer@example.com', 'No.21, Ram Nagar, Salem, Tamil Nadu'),
('P008', 'Anitha Mohan', '9875564321', '1993-12-01', 'Female', 'anitha.mohan@example.com', 'Flat 204, MG Road, Tirunelveli, Tamil Nadu'),
('P009', 'Suresh Babu', '9998765432', '1987-08-17', 'Male', 'suresh.babu@example.com', 'No.88, Gandhi Market, Erode, Tamil Nadu'),
('P010', 'Lavanya Gopal', '9876547890', '1995-04-27', 'Female', 'lavanya.priya@example.com', 'Plot 16, KK Nagar, Chennai, Tamil Nadu');
Select * From Patients;

INSERT INTO Doctors(Doctor_ID, Doctor_Name, Contact_Number, Email, Specialization, Consultation_Fee) 
VALUES ('D001', 'Dr. Arjun Kumar', '9876543210', 'arjun.kumar@hospital.com', 'Cardiologist', '500.00'),
('D002', 'Dr. Priya Ramesh', '9876504321', 'priya.ramesh@hospital.com', 'Pediatrician', '400.00'),
('D003', 'Dr. Ravi Narayanan', '9945001234', 'ravi.narayanan@hospital.com', 'Orthopedic Surgeon', '600.00'),
('D004', 'Dr. Sneha Suresh', '9003456789', 'sneha.suresh@hospital.com', 'Gynecologist', '450.00'),
('D005', 'Dr. Vishal Balaji', '9845004321', 'vishal.balaji@hospital.com', 'Neurologist', '750.00'),
('D006', 'Dr. Anitha Shankar', '9567008901', 'anitha.shankar@hospital.com', 'Dermatologist', '350.00'),
('D007', 'Dr. Karthik Subramanian', '9441234567', 'karthik.subramanian@hospital.com', 'ENT Specialist', '300.00'),
('D008', 'Dr. Meera Rajan', '9978005678', 'meera.rajan@hospital.com', 'Psychiatrist', '650.00'),
('D009', 'Dr. Suresh Babu', '9900654321', 'suresh.babu@hospital.com', 'General Surgeon', '550.00'),
('D010', 'Dr. Lakshmi Prasad', '9887543210', 'lakshmi.prasad@hospital.com', 'Ophthalmologist', '400.00');
Select * From Doctors;

INSERT INTO AppointmentSlots(Slot_ID, Doctor_ID, Slot_Date, Slot_Time, Is_Available, Appointment_ID) 
VALUES ('SLT001', 'D001', '2024-12-21', '09:00:00', '1', 'APT001'),
('SLT002', 'D002', '2024-12-21', '10:00:00', '1', 'APT002'),
('SLT003', 'D003', '2024-12-22', '11:00:00', '1', 'APT003'),
('SLT004', 'D004', '2024-12-22', '14:00:00', '0', 'APT004'),
('SLT005', 'D005', '2024-12-23', '15:30:00', '1', 'APT005'),
('SLT006', 'D006', '2024-12-24', '16:00:00', '0', 'APT006'),
('SLT007', 'D001', '2024-12-25', '08:30:00', '1', 'APT007'),
('SLT008', 'D002', '2024-12-25', '09:30:00', '0', 'APT008'),
('SLT009', 'D003', '2024-12-26', '10:30:00', '1', 'APT009'),
('SLT010', 'D004', '2024-12-26', '11:30:00', '1', 'APT010');
Describe AppointmentSlots;

INSERT INTO Appointments(Appointment_ID, Patient_ID, Doctor_ID, Slot_ID, Appointment_Date, History_ID, Status) 
VALUES ('APT001', 'P001', 'D001', 'SLT001', '2024-12-21', 'HIS001', 'Scheduled'),
('APT002', 'P002', 'D002', 'SLT002', '2024-12-22', 'HIS002', 'Completed'),
('APT003', 'P003', 'D003', 'SLT003', '2024-12-23', 'HIS003', 'Cancelled'),
('APT004', 'P004', 'D004', 'SLT004', '2024-12-24', 'HIS004', 'Scheduled'),
('APT005', 'P005', 'D005', 'SLT005', '2024-12-25', 'HIS005', 'Completed'),
('APT006', 'P006', 'D006', 'SLT006', '2024-12-26', 'HIS006', 'Cancelled'),
('APT007', 'P007', 'D007', 'SLT007', '2024-12-27', 'HIS007', 'Scheduled'),
('APT008', 'P008', 'D008', 'SLT008', '2024-12-28', 'HIS008', 'Completed'),
('APT009', 'P009', 'D009', 'SLT009', '2024-12-29', 'HIS009', 'Cancelled'),
('APT010', 'P010', 'D010', 'SLT010', '2024-12-30', 'HIS010', 'Scheduled');
INSERT INTO MedicalHistories(History_ID, Patient_ID, Doctor_ID, Visit_Date, Diagnosis, Prescription, Notes) 
VALUES ('HIS001', 'P001', 'D001', '2024-01-10', 'Fever and cold', 'Paracetamol 500mg twice daily for 3 days', 'Advised rest and hydration'),
('HIS002', 'P002', 'D002', '2024-01-12', 'Type 2 Diabetes', 'Metformin 500mg once daily', 'Diet control and exercise advised'),
('HIS003', 'P003', 'D003', '2024-01-15', 'Hypertension', 'Amlodipine 5mg once daily', 'Monitor blood pressure weekly'),
('HIS004', 'P004', 'D004', '2024-01-20', 'Fracture (Right Hand)', 'Calcium supplements, painkillers', 'Plaster cast applied, review after 6 weeks'),
('HIS005', 'P005', 'D005', '2024-01-25', 'Viral Infection', 'Ibuprofen 200mg as needed', 'Avoid crowded places, maintain hygiene'),
('HIS006', 'P006', 'D006', '2024-02-02', 'Asthma', 'Salbutamol inhaler as needed', 'Advised to avoid allergens'),
('HIS007', 'P007', 'D007', '2024-02-05', 'Migraine', 'Sumatriptan 50mg as needed', 'Track triggers and avoid stress'),
('HIS008', 'P008', 'D008', '2024-02-10', 'Allergic Rhinitis', 'Cetirizine 10mg once daily', 'Stay away from dust and pollen'),
('HIS009', 'P009', 'D009', '2024-02-15', 'Anemia', 'Iron supplements daily', 'Increase green leafy vegetables and jaggery in diet'),
('HIS010', 'P010', 'D010', '2024-02-18', 'Back Pain', 'Diclofenac gel for application', 'Physiotherapy suggested for 2 weeks');

-- 1. Data Query Language (DQL) Functions
select * from patients;
select * from Doctors;
select * from AppointmentSlots;
select * from Appointments;
select * from MedicalHistories;

-- 2. Data Definition Language (DDL) Function

-- 1. Alter Function
ALTER TABLE Doctors ADD COLUMN City VARCHAR(15);
ALTER TABLE Doctors RENAME COLUMN City to City_ID;			-- (Its Change Only Particular Column Name)
ALTER TABLE Doctors MODIFY COLUMN City_ID INT;			-- (Its Change only for Datatype)
ALTER TABLE Doctors DROP COLUMN City_ID;
ALTER TABLE Patients Add Location VARCHAR(100), ADD City Varchar(100);			-- (Add Multiple Columns in Single Line Query)

-- 2. Rename Table
RENAME TABLE Doctor TO Doctors;
ALTER TABLE Patients RENAME COLUMN Location TO Area;
ALTER TABLE Patient RENAME TO Patients;

-- 3. Drop Function
DROP TABLE Healthcare;
DROP TABLE Patients;
DROP TABLE Doctors;

-- 4. Truncate Function
TRUNCATE TABLE Patients;
TRUNCATE TABLE Doctors;
TRUNCATE TABLE Appointments;

-- 2. Data Manupulation Language (DML) Functions

-- 1. Insert Function
INSERT INTO Medicalhistories(History_ID, Patient_ID, Doctor_ID, Visit_Date, Diagnosis, Prescription, Notes) 
VALUES ('HIS011', 'P001', 'D002', '2024-01-12', 'Type 2 Diabetes', 'Metformin 500mg once daily', 'Diet control and exercise advised');

-- 2. Update Function
UPDATE Patients SET Contact_Number = 9786784357 WHERE Patient_ID = 'P010';		-- (Update the value only for single row)
UPDATE Doctors SET Doctor_Name = 'Dr.Malathi', Contact_Number = '9786784357' WHERE Doctor_ID = 'D010';
UPDATE Doctors SET Email = 'malathi@hospital.com' WHERE Doctor_ID = 'D010';
UPDATE Patients SET City = 'Chennai';
UPDATE Doctors SET Consultation_Fee = 950 WHERE Doctor_ID in ('D003','D005','D008','D010');

-- 3. Delete Function
DELETE FROM Patients WHERE City = 'Chennai';
DELETE FROM MedicalHistories WHERE Doctor_ID in ('D001','D002','D003');

-- 4. Select Function
SELECT Patient_ID, Patient_Name, Address FROM Patients;
SELECT Doctor_Name, Specialization, Consultation_Fee FROM Doctors;
SELECT Slot_ID, Patient_ID, Appointment_Date, Status FROM Appointments;
SELECT Appointment_ID, Doctor_ID, Slot_Date, Slot_Time FROM AppointmentSlots;
SELECT History_ID, Patient_ID, Doctor_ID, Visit_Date FROM MedicalHistories;

-- 5. WHERE Function
SELECT * From Doctors WHERE Doctor_ID = 'D005';
SELECT * FROM Patients WHERE Patient_ID = 'P005';
SELECT * FROM MedicalHistories WHERE History_ID = 'HIS006';
SELECT Appointment_ID, Doctor_ID, Slot_Date, Slot_Time, Is_Available FROM AppointmentSlots WHERE Is_Available = 1;
SELECT Appointment_ID, Doctor_ID, Slot_Date, Slot_Time, Is_Available FROM AppointmentSlots WHERE Is_Available = 0;

-- 6. In Function
SELECT * FROM Patients WHERE Patient_ID in ('P003','P005','P007','P009');
SELECT * FROM Doctors WHERE Specialization in ('Neurologist','Cardiologist');

-- 7. Limit Function
SELECT * FROM AppointmentSlots LIMIT 5;
SELECT * FROM MedicalHistories LIMIT 5 OFFSET 3;
SELECT MAX(Consultation_Fee), Doctor_ID FROM Doctors GROUP BY Doctor_Name LIMIT 1;

-- 8. Like Function 
SELECT * FROM Doctors WHERE Doctor_ID LIKE '%D';
SELECT * FROM Doctors WHERE Doctor_ID LIKE 'D%';

-- 9. Aggregate Function

-- 1. SUM() Function
SELECT SUM(Consultation_Fee) FROM Doctors;
SELECT SUM(Consultation_Fee) as Total_Fee FROM Doctors;
-- 2. MAX() Function
SELECT MAX(Consultation_Fee) as Total_Fee FROM Doctors;
-- 3. MIN() Function
SELECT MIN(Consultation_Fee) as Total_Fee FROM Doctors;
-- 4. AVG() Function
SELECT AVG(Consultation_Fee) as Total_Fee FROM Doctors;
-- 5. COUNT() Function
SELECT COUNT(Slot_ID) as Total_Count FROM AppointmentSlots;
SELECT COUNT(History_ID) as Total_Count FROM MedicalHistories;

-- 10. Logical Function

-- 1. AND & Function
SELECT * FROM Patients WHERE Patient_Name = 'Karthik raja' and Gender = 'Male';
SELECT * FROM Doctors WHERE Doctor_Name = 'Dr. Vishal Balaji' and Consultation_Fee = 950;
SELECT * FROM AppointmentSlots WHERE Doctor_ID = 'D005' and Is_Available = 1;

-- 2. OR Function
SELECT * FROM Patients WHERE Patient_Name = 'Karthik raja' OR Gender = 'Male';
SELECT * FROM Doctors WHERE Doctor_Name = 'Dr. Vishal Balaji' OR Consultation_Fee = 950;
SELECT * FROM AppointmentSlots WHERE Doctor_ID = 'D010' OR Is_Available = 1;

-- 3. NOT Function
SELECT * FROM Doctors WHERE NOT Doctor_ID = 'D002';
SELECT * FROM Patients WHERE NOT (Patient_Name = 'Karthik raja' AND Gender = 'Male');
SELECT * FROM Patients WHERE Patient_Name NOT IN ('Karthik raja', 'Vijay Anand');
SELECT * FROM Patients WHERE NOT (Patient_Name = 'Karthik raja' OR Gender = 'Male');
SELECT * FROM Patient WHERE NOT Doctor_Name = 'Dr. Vishal Balaji' OR Consultation_Fee = 950;
SELECT * FROM Doctors WHERE NOT Doctor_ID IN ('D002','D004','D006','D008');
SELECT * FROM Doctors WHERE Consultation_Fee NOT BETWEEN 400 AND 600;

-- 11. RANGE FUNCTION
-- 1. USE Between
SELECT * FROM Doctors WHERE Consultation_Fee BETWEEN 400 AND 600;
SELECT * FROM AppointmentSlots WHERE Slot_Date BETWEEN '2024-12-22' AND '2024-12-24';

-- 2. Comparison Operators
SELECT * FROM Doctors WHERE Consultation_Fee >= 400 AND Consultation_Fee <= 950;

-- 3. Subquery for Custom Ranges
SELECT * FROM Doctors
WHERE Consultation_Fee BETWEEN (SELECT MIN(Consultation_Fee) FROM Doctors) AND (SELECT MAX(Consultation_Fee) FROM Doctors);

-- 3. Joints Function

-- 1. INNER JOINTS
SELECT Patients.Patient_Name, Patients.Contact_Number, Appointments.Appointment_Date FROM Patients
INNER JOIN Appointments ON Patients.Patient_ID = Appointments.Patient_ID;

SELECT Doctors.Doctor_Name, Doctors.Specialization, Doctors.Consultation_Fee, AppointmentSlots.Slot_Date, AppointmentSlots.Appointment_ID FROM Doctors
INNER JOIN AppointmentSlots ON Doctors.Doctor_ID = AppointmentSlots.Doctor_ID;

SELECT Appointments.Appointment_ID, Appointments.Patient_ID, AppointmentSlots.Doctor_ID, AppointmentSlots.Slot_Date, AppointmentSlots.Is_Available FROM AppointmentSlots
INNER JOIN Appointments ON AppointmentSlots.Slot_ID = Appointments.Slot_ID;

SELECT Appointments.Appointment_Date, Appointments.Status, MedicalHistories.Patient_ID, MedicalHistories.Doctor_ID, MedicalHistories.Visit_Date, MedicalHistories.Diagnosis
FROM Appointments INNER JOIN MedicalHistories ON Appointments.History_ID = MedicalHistories.History_ID;

-- 2. LEFT JOINTS
SELECT Patients.Patient_Name, Patients.Contact_Number, Appointments.Appointment_Date FROM Patients
LEFT JOIN Appointments ON Patients.Patient_ID = Appointments.Patient_ID;

SELECT Doctors.Doctor_Name, Doctors.Specialization, Doctors.Consultation_Fee, AppointmentSlots.Slot_Date, AppointmentSlots.Appointment_ID FROM Doctors
LEFT JOIN AppointmentSlots ON Doctors.Doctor_ID = AppointmentSlots.Doctor_ID;

SELECT Appointments.Appointment_ID, Appointments.Patient_ID, AppointmentSlots.Doctor_ID, AppointmentSlots.Slot_Date, AppointmentSlots.Is_Available FROM AppointmentSlots
LEFT JOIN Appointments ON AppointmentSlots.Slot_ID = Appointments.Slot_ID;

SELECT Appointments.Appointment_Date, Appointments.Status, MedicalHistories.Patient_ID, MedicalHistories.Doctor_ID, MedicalHistories.Visit_Date, MedicalHistories.Diagnosis
FROM Appointments LEFT JOIN MedicalHistories ON Appointments.History_ID = MedicalHistories.History_ID;

-- CROSS JOIN
SELECT Appointments.Appointment_Date, Appointments.Status, MedicalHistories.Patient_ID
FROM Appointments CROSS JOIN MedicalHistories;

select max(Consultation_Fee), Doctor_Name
from Doctors
group by Doctor_Name
limit 1;

SELECT Doctor_Name, Consultation_Fee
FROM Doctors
ORDER BY Consultation_Fee ASC
LIMIT 1;

select count(Patient_Name) as Total_Patient from Patients
where right (Patient_Name,1) in ('a','e','i','o','u');

select Doctor_Name from Doctors
where left(Doctor_Name,1)not in('a','e','i','o','u');

select Diagnosis from MedicalHistories
where left (Diagnosis,1) in ('a','e','i','o','u')
and
right (Diagnosis,1) in ('a','e','i','o','u');

select Doctor_Name from Doctors
where left (Doctor_Name,1) not in ('a','e','i','o','u')
and
right (Doctor_Name,1) not in ('a','e','i','o','u');

-- 9. Order by Function

SELECT * FROM Doctors ORDER BY Consultation_fee ASC;
SELECT * FROM Doctors ORDER BY Consultation_fee DESC;
SELECT * FROM Doctors ORDER BY Consultation_fee ASC LIMIT 5;
SELECT * FROM Doctors ORDER BY Consultation_fee DESC LIMIT 5;
SELECT Doctor_Name, Specialization FROM Doctors ORDER BY Specialization;
SELECT Patient_Name, Contact_Number FROM Patients ORDER BY Patient_Name DESC;
SELECT p_name, price FROM product ORDER BY price ASC LIMIT 1;

-- 10. Range Function

SELECT Doctor_Name, Specialization, Consultation_Fee FROM Doctors WHERE Consultation_Fee > 400;
-- 11. Constrain Function

ALTER TABLE MedicalHistories
ADD CONSTRAINT FK_Appointment
FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID);
-- -------------------------------------------------------------------------------------------------
