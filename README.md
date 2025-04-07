**Healthcare Database System**
**Overview**
This repository contains a comprehensive healthcare database system designed to manage patient records, doctor information, appointments, and medical histories. The system is built using MySQL and includes complete schema definitions, sample data, and a variety of SQL queries demonstrating database operations.

**Database Schema**
Tables
**Patients**

Stores patient personal information (name, contact, DOB, gender, etc.)

Primary Key: Patient_ID

**Doctors**

Contains doctor details including specialization and consultation fees

Primary Key: Doctor_ID

**AppointmentSlots**

Manages available time slots for doctor appointments

Primary Key: Slot_ID

**Appointments**

Tracks scheduled patient-doctor appointments

Primary Key: Appointment_ID

Foreign Keys: Patient_ID, Doctor_ID, Slot_ID, History_ID

**MedicalHistories**

Maintains records of patient diagnoses and treatments

Primary Key: History_ID

Foreign Keys: Patient_ID, Doctor_ID

**Key Features**
**Data Query Language (DQL) Examples**
Basic SELECT queries for all tables

Filtering with WHERE clauses

Using IN, LIKE, and BETWEEN operators

Aggregate functions (COUNT, SUM, AVG, MIN, MAX)

Sorting with ORDER BY

Limiting results with LIMIT

**Data Definition Language (DDL) Examples**
Table creation with constraints

ALTER TABLE operations (add/drop columns, modify datatypes)

RENAME operations for tables and columns

DROP and TRUNCATE table operations

**Data Manipulation Language (DML) Examples**
INSERT statements for populating tables

UPDATE operations for modifying records

DELETE operations with conditions

**Advanced Operations**
JOIN operations (INNER, LEFT, CROSS)

Subqueries

Grouping and aggregation

Complex filtering conditions

![image](https://github.com/user-attachments/assets/9515e4a6-3377-4103-bbec-3069379dc4df)
