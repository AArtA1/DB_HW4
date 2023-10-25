CREATE TABLE Reader (
    ID SERIAL PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Address VARCHAR(255),
    BirthDate DATE
);

CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    PagesNum INTEGER,
    PubYear INTEGER,
    PubName VARCHAR(255),
    FOREIGN KEY (PubName) REFERENCES Publisher(PubName)
);

CREATE TABLE Publisher (
    PubName VARCHAR(255) PRIMARY KEY,
    PubKind VARCHAR(255)
);

CREATE TABLE Category (
    CategoryName VARCHAR(255) PRIMARY KEY,
    ParentCat VARCHAR(255)
);

CREATE TABLE Copy (
    ISBN VARCHAR(13),
    CopyNumber INTEGER,
    Shelf VARCHAR(255),
    Position VARCHAR(255),
    PRIMARY KEY (ISBN, CopyNumber),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE Borrowing (
    ID SERIAL PRIMARY KEY,
    ReaderNr INTEGER,
    ISBN VARCHAR(13),
    CopyNumber INTEGER,
    ReturnDate DATE,
    FOREIGN KEY (ReaderNr) REFERENCES Reader(ID),
    FOREIGN KEY (ISBN, CopyNumber) REFERENCES Copy(ISBN, CopyNumber)
);

CREATE TABLE BookCat (
    ISBN VARCHAR(13),
    CategoryName VARCHAR(255),
    PRIMARY KEY (ISBN, CategoryName),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (CategoryName) REFERENCES Category(CategoryName)
);
