-- Student Records Management System Database
-- Create database studentRecordsDB
CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;

-- Table: Students
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, Phone, Address) VALUES
('Alice', 'Johnson', '2000-05-12', 'alice.johnson@example.com', '0712345678', '123 Main St, Nairobi'),
('Brian', 'Omondi', '1999-09-22', 'brian.omondi@example.com', '0723456789', '45 Riverside, Kisumu'),
('Clara', 'Mwangi', '2001-01-15', 'clara.mwangi@example.com', '0734567890', '89 Moi Ave, Mombasa'),
('David', 'Mutiso', '1998-11-30', 'david.mutiso@example.com', '0745678901', '12 Kenyatta Rd, Nakuru'),
('Eva', 'Otieno', '2000-07-08', 'eva.otieno@example.com', '0756789012', '56 Ngong Rd, Nairobi');

-- Table: Courses
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL UNIQUE,
    Credits INT NOT NULL
);
INSERT INTO Courses (CourseName, Credits) VALUES
('Database Systems', 3),
('Web Development', 4),
('Business Management', 3),
('Calculus I', 4),
('Artificial Intelligence', 3);

-- Table: Instructors
CREATE TABLE Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO Instructors (FirstName, LastName, Email) VALUES
('James', 'Kamau', 'james.kamau@example.com'),
('Linda', 'Wanjiru', 'linda.wanjiru@example.com'),
('Peter', 'Otieno', 'peter.otieno@example.com'),
('Sophia', 'Mwende', 'sophia.mwende@example.com');

-- Table: Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
    );
    
-- Insert Departments
INSERT INTO Departments (department_id, department_name) 
VALUES
(1, 'Computer Science'),
(2, 'Business Management'),
(3, 'Mathematics');

-- Table: Enrollments (M-M: Students <-> Courses)
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    UNIQUE (StudentID, CourseID) -- prevent duplicate enrollment
);
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1, 1, '2025-01-10', 'A'),
(1, 2, '2025-01-12', 'B'),
(2, 3, '2025-01-11', 'A'),
(3, 4, '2025-01-15', 'B'),
(4, 1, '2025-01-20', 'C'),
(5, 5, '2025-01-25', 'A');

-- Table: CourseInstructors (M-M: Courses <-> Instructors)
CREATE TABLE CourseInstructors (
    CourseInstructorID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT NOT NULL,
    InstructorID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
    UNIQUE (CourseID, InstructorID)
);
INSERT INTO CourseInstructors (CourseID, InstructorID) VALUES
(1, 1), -- Database Systems by James
(2, 2), -- Web Development by Linda
(3, 3), -- Business Management by Peter
(4, 4), -- Calculus I by Sophia
(5, 1); -- AI also by James

-- Table: StudentProfiles (1-1 with Students)
CREATE TABLE StudentProfiles (
    ProfileID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT UNIQUE NOT NULL,
    Bio TEXT,
    EmergencyContact VARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO StudentProfiles (StudentID, Bio, EmergencyContact) VALUES
(1, 'Loves coding and databases', 'Mary Johnson - 0711000000'),
(2, 'Passionate about entrepreneurship', 'Paul Omondi - 0722000000'),
(3, 'Math enthusiast and chess player', 'Jane Mwangi - 0733000000'),
(4, 'Enjoys robotics and AI projects', 'Samuel Mutiso - 0744000000'),
(5, 'Future teacher, enjoys mentoring', 'Grace Otieno - 0755000000');

-- Link table for Students ↔ Departments (Many-to-One or Many-to-Many)
CREATE TABLE StudentDepartments (
    StudentID INT,
    department_id INT,
    PRIMARY KEY (StudentID, department_id),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE
);

-- Assign students to departments
INSERT INTO StudentDepartments (StudentID, department_id) VALUES
(1, 1),  -- Alice → Computer Science
(2, 2),  -- Brian → Business Management
(3, 1),  -- Clara → Computer Science
(4, 3),  -- David → Mathematics
(5, 2);  -- Eva → Business Management

-- Example of linked students with their department
SELECT s.FirstName, s.LastName, d.department_name
FROM Students s
JOIN StudentDepartments sd ON s.StudentID = sd.StudentID
JOIN Departments d ON sd.department_id = d.department_id;






