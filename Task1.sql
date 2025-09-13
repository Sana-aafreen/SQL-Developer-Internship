CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Publisher
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(150),
    Address VARCHAR(255)
);

-- Book
CREATE TABLE Book (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    PublisherID INT,
    ISBN VARCHAR(20) UNIQUE,
    Genre VARCHAR(100),
    Year YEAR,
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- Author
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);

-- BookAuthor (many-to-many)
CREATE TABLE BookAuthor (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- Copy
CREATE TABLE Copy (
    CopyID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    Status ENUM('Available', 'Loaned'),
    Location VARCHAR(100),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

-- Member
CREATE TABLE Member (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    JoinDate DATE
);

-- Staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Email VARCHAR(150)
);

-- Loan
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    CopyID INT,
    MemberID INT,
    StaffID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FineAmount DECIMAL(6,2),
    FOREIGN KEY (CopyID) REFERENCES Copy(CopyID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

SELECT 
    l.LoanID,
    m.FirstName,
    m.LastName,
    b.Title,
    l.DueDate,
    l.ReturnDate,
    l.FineAmount
FROM Loan l
JOIN Member m ON l.MemberID = m.MemberID
JOIN Copy c ON l.CopyID = c.CopyID
JOIN Book b ON c.BookID = b.BookID
WHERE l.ReturnDate IS NULL AND l.DueDate < CURDATE();
CREATE VIEW OverdueFines AS
SELECT 
    l.LoanID,
    m.FirstName,
    m.LastName,
    b.Title,
    l.DueDate,
    l.ReturnDate,
    CASE
        WHEN l.ReturnDate > l.DueDate THEN DATEDIFF(l.ReturnDate, l.DueDate) * 1.00
        ELSE 0.00
    END AS FineAmount
FROM Loan l
JOIN Copy c ON l.CopyID = c.CopyID
JOIN Book b ON c.BookID = b.BookID
JOIN Member m ON l.MemberID = m.MemberID;
