
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    genre VARCHAR(50),
    published_year INT,
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1
);


CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    join_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE DEFAULT (CURRENT_DATE),
    due_date DATE,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE Fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT,
    fine_amount DECIMAL(6,2),
    paid_status ENUM('Unpaid', 'Paid') DEFAULT 'Unpaid',
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);