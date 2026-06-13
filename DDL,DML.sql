
CREATE TABLE Members (
    member_id INT PRIMARY KEY 
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    join_date DATE
);

CREATE TABLE Authors (
    author_id INT PRIMARY KEY 
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY 
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY 
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    author_id INT,
    category_id INT,
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Librarians (
    librarian_id INT PRIMARY KEY 
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE Issued_Books (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE Fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT,
    fine_amount DECIMAL(10,2),
    paid_status VARCHAR(20) DEFAULT 'Unpaid',
    FOREIGN KEY (issue_id) REFERENCES Issued_Books(issue_id)
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    reservation_date DATE,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    message VARCHAR(255),
    notification_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
INSERT INTO Authors(author_name)
VALUES ('Unknown Author');

INSERT INTO Categories(category_name)
VALUES ('General');

INSERT INTO Loans (book_id, member_id, due_date)
VALUES (1, 5, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY));

INSERT INTO Books
(title, isbn, author_id, category_id, total_copies, available_copies)
VALUES
('Database Systems', '9781234567890', 1, 1, 5, 5);

UPDATE Books 
SET available_copies = available_copies - 1 
WHERE book_id = 1 AND available_copies > 0;

DELETE FROM Members WHERE member_id = 12;
WHERE member_id = 1;

UPDATE Members 
SET phone_number = '555-9999' 
WHERE member_id = 1;

SELECT * FROM Books;
SELECT genre, COUNT(*) AS total_books, SUM(total_copies) AS absolute_copy_count
FROM Books
GROUP BY genre
ORDER BY total_books DESC;

SELECT b.title, COUNT(i.issue_id) AS times_issued
FROM Books b
LEFT JOIN Issued_Books i
ON b.book_id = i.book_id
GROUP BY b.book_id;

SELECT * FROM Books;
SELECT m.name, b.title, i.due_date
FROM Issued_Books i
JOIN Members m ON i.member_id = m.member_id
JOIN Books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL
AND i.due_date < CURDATE();

SELECT Student.Name, Book.Title
FROM Issue
JOIN Student ON Issue.StudentID = Student.StudentID
JOIN Book ON Issue.BookID = Book.BookID;


