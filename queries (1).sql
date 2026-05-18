

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Department VARCHAR(50)
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Category VARCHAR(50)
);

CREATE TABLE Librarian (
    LibrarianID INT PRIMARY KEY,
    Name VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Issue (
    IssueID INT PRIMARY KEY,
    StudentID INT,
    BookID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);




INSERT INTO Student
VALUES
(1, 'Ali', 'alig@gmail.com', 'CS'),
(2, 'Sara', 'sara@gmail.com', 'IT');

INSERT INTO Book
VALUES
(101, 'Database Systems', 'Navathe', 'Education'),
(102, 'Python Basics', 'John', 'Programming');

INSERT INTO Librarian
VALUES
(1, 'Ahmed', '9876543210'),
(2, 'Mona', '9123456780');

INSERT INTO Issue
VALUES
(1, 1, 101, '2025-01-10', '2025-01-20'),
(2, 2, 102, '2025-01-12', '2025-01-22');




SELECT Student.Name, Book.Title
FROM Issue
JOIN Student ON Issue.StudentID = Student.StudentID
JOIN Book ON Issue.BookID = Book.BookID;