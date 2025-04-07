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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Customer Relationship Management (CRM) Database - README

## Overview
This repository contains a comprehensive CRM database system designed to manage customer information, product inventory, sales orders, and employee data. The system is built using MySQL and includes complete schema definitions, sample data, and a variety of SQL queries demonstrating database operations.

## Database Schema

Tables

## Customer

Stores customer personal information (name, email, phone, address)

Primary Key: Customer_id

## Product

Contains product details including brand and price

Primary Key: Product_id

## Orders

Tracks customer orders with dates and total amounts

Primary Key: Order_id

Foreign Key: Customer_id

## Order_detail

Manages line items for each order with quantities and prices

Primary Key: Order_id

Foreign Keys: Product_id, Order_id

## Employee

Stores employee information (name, contact, position)

Primary Key: Employee_id

## Employee_salary

Tracks employee working days and salary information

Foreign Key: Employee_id

## Key Features

## Sample Data
The database includes sample data for:

40 customers

10 products (smartphones from various brands)

50 orders with detailed line items

9 employees with salary information

## Data Query Examples
Basic SELECT queries for all tables

Filtering with WHERE clauses

Using LIKE and IN operators

Aggregate functions (COUNT, AVG, MIN, MAX)

Sorting with ORDER BY

Limiting results with LIMIT

JOIN operations (INNER, RIGHT)

CASE statements for categorization

Subqueries with EXISTS and ALL

## Business Insights
The system provides queries to answer business questions such as:

Customer purchase history

Product price range analysis

Employee salary calculations

Customer name pattern analysis

Order value statistics

![image](https://github.com/user-attachments/assets/e993e8ba-02a5-4c1a-a756-dc41845ba140)

## License

This project is open-source and available for educational purposes. The database design and sample queries can be adapted for various CRM applications.
