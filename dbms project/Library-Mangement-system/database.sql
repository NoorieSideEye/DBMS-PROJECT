-- Create tables in SQLite
CREATE TABLE IF NOT EXISTS Author (
    AuthorID INTEGER PRIMARY KEY,
    AuthorBio TEXT
);

CREATE TABLE IF NOT EXISTS Publisher (
    PublisherID INTEGER PRIMARY KEY,
    PublisherName TEXT,
    PublisherAddress TEXT,
    PublisherPhoneNumber TEXT
);

CREATE TABLE IF NOT EXISTS Member (
    MemberID INTEGER PRIMARY KEY,
    Name TEXT,
    Address TEXT,
    Email TEXT,
    PhoneNumber TEXT,
    MembershipType TEXT,
    DateJoined DATE
);

CREATE TABLE IF NOT EXISTS Book (
    BookID INTEGER PRIMARY KEY,
    Title TEXT,
    AuthorID INTEGER,
    ISBN TEXT,
    Genre TEXT,
    PublicationYear INTEGER,
    PublisherID INTEGER,
    NumberOfPages INTEGER,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

CREATE TABLE IF NOT EXISTS Librarian (
    LibrarianID INTEGER PRIMARY KEY,
    Name TEXT,
    Email TEXT,
    PhoneNumber TEXT,
    Role TEXT,
    DateHired DATE
);

CREATE TABLE IF NOT EXISTS Borrowing (
    BorrowingID INTEGER PRIMARY KEY,
    BookID INTEGER,
    MemberID INTEGER,
    BorrowingDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE IF NOT EXISTS Reservation (
    ReservationID INTEGER PRIMARY KEY,
    BookID INTEGER,
    MemberID INTEGER,
    ReservationDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE IF NOT EXISTS Fine (
    FineID INTEGER PRIMARY KEY,
    MemberID INTEGER,
    PaymentStatus TEXT,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE IF NOT EXISTS Category (
    CategoryID INTEGER PRIMARY KEY,
    CategoryName TEXT
);

CREATE TABLE IF NOT EXISTS Location (
    LocationID INTEGER PRIMARY KEY,
    ShelfNumber TEXT,
    AisleNumber TEXT
);

CREATE TABLE IF NOT EXISTS Language (
    LanguageID INTEGER PRIMARY KEY,
    LanguageName TEXT
);

CREATE TABLE IF NOT EXISTS Edition (
    EditionID INTEGER PRIMARY KEY,
    BookID INTEGER,
    EditionNumber INTEGER,
    PublicationDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

CREATE TABLE IF NOT EXISTS Transaction (
    TransactionID INTEGER PRIMARY KEY,
    TransactionType TEXT,
    TransactionDate DATE,
    Amount NUMERIC(10, 2)
);

CREATE TABLE IF NOT EXISTS Review (
    ReviewID INTEGER PRIMARY KEY,
    BookID INTEGER,
    MemberID INTEGER,
    ReviewText TEXT,
    Rating NUMERIC(3, 1),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE IF NOT EXISTS Tag (
    TagID INTEGER PRIMARY KEY,
    TagName TEXT
);
