
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    join_date DATE
);

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
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
    librarian_id INT PRIMARY KEY AUTO_INCREMENT,
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

INSERT INTO Books
(title, isbn, author_id, category_id, total_copies, available_copies)
VALUES
('Database Systems', '9781234567890', 1, 1, 5, 5);

SELECT * FROM Books;
SELECT genre, COUNT(*) AS total_books, SUM(total_copies) AS absolute_copy_count
FROM Books
GROUP BY genre
ORDER BY total_books DESC;
