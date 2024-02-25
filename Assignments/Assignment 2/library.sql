DROP DATABASE IF EXISTS library_db;
CREATE DATABASE library_db;
USE library_db;

CREATE TABLE Publication (
    SurrogateKey VARCHAR(13) PRIMARY KEY,
    ISBN VARCHAR(13) UNIQUE, -- Here, we ensure that ISBN is also a candidate for unique keys
    Title VARCHAR(255),
    Edition VARCHAR(50),
    PublicationDate DATE,
    Publisher VARCHAR(255),
    DeweyDecimalSystemNumber VARCHAR(20),
    LibraryOfCongressCatalogNumber VARCHAR(20),
    NumberOfPages INT,
    PublicationType VARCHAR(50),
    Type VARCHAR(50),
    Description TEXT
);

CREATE TABLE Author (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    MiddleName VARCHAR(100),
    LastName VARCHAR(100)
);

CREATE TABLE PublicationAuthor (
    ISBN VARCHAR(13),
    AuthorID INT,
    FOREIGN KEY (ISBN) REFERENCES Publication(ISBN),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    PRIMARY KEY (ISBN, AuthorID)
);

CREATE TABLE Copy (
    CopyNumber INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13),
    PhysicalLocation VARCHAR(255),
    Status VARCHAR(50),
    FOREIGN KEY (ISBN) REFERENCES Publication(ISBN)
);

CREATE TABLE User (
    UTDID VARCHAR(10) PRIMARY KEY,
    NetID VARCHAR(50),
    FirstName VARCHAR(100),
    MiddleName VARCHAR(100),
    LastName VARCHAR(100),
    PhoneNumber VARCHAR(50),
    EmailAddress VARCHAR(100),
    PhysicalAddress TEXT,
    BorrowerType VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(100)
);

CREATE TABLE Borrow (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    UTDID VARCHAR(10),
    CopyNumber INT,
    BorrowDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (UTDID) REFERENCES User(UTDID),
    FOREIGN KEY (CopyNumber) REFERENCES Copy(CopyNumber)
);

CREATE TABLE FineRate (
    FineRateID INT AUTO_INCREMENT PRIMARY KEY,
    DailyRate DECIMAL(5,2),
    MaximumFine DECIMAL(5,2)
);

CREATE TABLE Fine (
    FineID INT AUTO_INCREMENT PRIMARY KEY,
    BorrowID INT,
    FineRateID INT,
    FineAccrued DECIMAL(5,2),
    FOREIGN KEY (BorrowID) REFERENCES Borrow(BorrowID),
    FOREIGN KEY (FineRateID) REFERENCES FineRate(FineRateID)
);

CREATE TABLE EBook (
    EBookID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13),
    LinkToEBook VARCHAR(255),
    FOREIGN KEY (ISBN) REFERENCES Publication(ISBN)
);

CREATE TABLE Subject (
    SubjectID INT AUTO_INCREMENT PRIMARY  KEY,
    Description VARCHAR(255)
);

CREATE TABLE PublicationSubject (
    ISBN VARCHAR(13),
    SubjectID INT,
    FOREIGN KEY (ISBN) REFERENCES Publication(ISBN),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID),
    PRIMARY KEY (ISBN, SubjectID)
);
