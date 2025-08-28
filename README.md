# Student Records Management System

## Question 1: Build a Complete Database Management System
This project is part of **Question 1**: Build a Complete Database Management System.  
It implements a **Student Records Management System** using MySQL, demonstrating database design, normalization, and proper relationships.

## Project Title
**Student Records Management System**

## Description
This database project manages:

- Students, Courses, Instructors, Departments  
- Student enrollments in courses  
- Course instructors  
- Student profiles  
- Student-department assignments  

It includes **1-1, 1-M, and M-M relationships**, fully normalized tables, primary and foreign keys, and sample data for testing.

## How to Run / Setup

1. Clone the repository:
```bash
git clone https://github.com/YourUsername/StudentRecordsDB.git
2. Open MySQL Workbench.
3. Open and execute the SQL file:
Open StudentRecordsDB.sql in MySQL Workbench.

**Execute it to:**

Create the StudentRecordsDB database

Create all tables with PK, FK, NOT NULL, UNIQUE constraints

Insert sample data into all tables

Create the StudentDepartments link table for Students ↔ Departments

4. Verify inserted data

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
