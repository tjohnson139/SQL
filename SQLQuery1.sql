CREATE DATABASE db_library

USE db_library

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR (100) NOT NULL
)

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL,
)

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Publisher_Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(12) NOT NULL
)

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Loans FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_Loans FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo_Loans FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
)

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Borrower_Name VARCHAR(50) NOT NULL,
	Borrower_Addres VARCHAR (100) NOT NULL,
	Phone VARCHAR (12) NOT NULL
)

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Author FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	Author_Name VARCHAR(50) NOT NULL
)

INSERT INTO LIBRARY_BRANCH
	(BranchName, BranchAddress)
	VALUES
	('Sharpstown', '801 SW 10th Ave, Portland, OR 97205'),
	('Central', '512 N Killingsworth St, Portland, OR 97217'),
	('Aloha Community Library', '17455 SW Farmington Rd Suite 26A, Aloha, OR 97078'),
	('Beaverton City Library', '12375 SW 5th St, Beaverton, OR 97005'),
	('Cedar Mill Library', '12505 NW Cornell Rd #13, Portland, OR 97229')
;

INSERT INTO PUBLISHER
	(PublisherName, Publisher_Address, Phone)
	VALUES
	('Grand Central Publishing', '1290 Avenue of the Americas New York, NY 10104', '800-759-0190'),
	('Penguin Publishing Group', '1745 Broadway/230 West 56th Street, New York City', '212-366-2000'),
	('Barnes & Noble', '122 5th Avenue #2, New York, NY, 10011', '866-238-7323'),
	('Houghton Mifflin Harcourt', '222 Berkeley St. Boston, MA 02116', '617-351-5000'),
	('Simon & Schuster', '1230 Avenue of the Americas New York, NY 10020', '212-698-7000'),
	('Norton, W. W. & Company, Inc.', '500 Fifth Ave. New York, New York 10110', '212-354-5500'),
	('HarperCollins Publishers', '195 Broadway, New York, NY 10007', '212-207-7000'),
	('Wordsworth Editions, Limited', '8b East Street Ware Hertfordshire SG12 9HJ', '865-922-7495'),
	('Knopf Doubleday Publishing Group', '1745 Broadway, New York, NY 10019', '212-940-7390'),
	('Atria Books', '1230 Avenue of the Americas New York, NY 10020', '212-698-7000'),
	('Grove/Atlantic, Inc.', '154 W. 14th Street, New York City, NY 10011', '212-614-7850'),
	('Scribner', '153–157 Fifth Avenue, New York City', '800-897-7650')
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('To Kill A Mockingbird', 'Grand Central Publishing'),
	('Ceremony', 'Penguin Publishing Group'),
	('Things Fall Apart', 'Penguin Publishing Group'),
	('Moby-Dick', 'Barnes & Noble'),
	('The Color Purple', 'Houghton Mifflin Harcourt'),
	('Catch-22', 'Simon & Schuster'),
	('Atlas Shrugged', 'Penguin Publishing Group'),
	('The Lord of the Rings', 'Houghton Mifflin Harcourt'),
	('Hamlet', 'Norton, W. W. & Company, Inc.'),
	('The Murder of Roger Ackroyd', 'HarperCollins Publishers'),
	('Ulysses', 'Wordsworth Editions, Limited'),
	('Invisible Man', 'Knopf Doubleday Publishing Group'),
	('Schindler''s List', 'Atria Books'),
	('Glengarry Glen Ross', 'Grove/Atlantic, Inc.'),
	('The Brothers Karamazov', 'Barnes & Noble'),
	('The Maltese Falcon', 'Knopf Doubleday Publishing Group'),
	('Giovanni''s Room', 'Knopf Doubleday Publishing Group'),
	('The Hate U Give', 'HarperCollins Publishers'),
	('IT', 'Scribner'),
	('The Shining', 'Knopf Doubleday Publishing Group'),
	('The Lost Tribe', 'Houghton Mifflin Harcourt')
;

INSERT INTO BOOK_AUTHORS
	(BookID, Author_Name)
	VALUES
	(2, 'Harper Lee'),
	(3, 'Leslie Marmon Silko'),
	(4, 'Chinua Achebe'),
	(5, 'Herman Melville'),
	(6, 'Alice Walker'),
	(7, 'Joseph Heller'),
	(8, 'Ayn Rand'),
	(9, 'J.R.R. Tolkien'),
	(10, 'William Shakespeare'),
	(11, 'Agatha Christie'),
	(12, 'James Joyce'),
	(13, 'Ralph Ellison'),
	(14, 'Thomas Keneally'),
	(15, 'David Mamet'),
	(16, 'Fyodor Dostoevsky'),
	(17, 'Dashiell Hammett'),
	(18, 'James Baldwin'),
	(19, 'Angie Thomas'),
	(20, 'Stephen King'),
	(21, 'Stephen King')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(2, 1, 5),
	(2, 2, 4),
	(2, 3, 2),
	(2, 4, 4),
	(2, 5, 6),
	(3, 1, 3),
	(3, 2, 7),
	(3, 3, 5),
	(3, 4, 2),
	(3, 5, 4),
	(4, 1, 2),
	(4, 2, 3),
	(4, 3, 4),
	(4, 4, 5),
	(4, 5, 6),
	(5, 1, 2),
	(5, 2, 3),
	(5, 3, 4),
	(5, 4, 5),
	(5, 5, 6),
	(6, 1, 5),
	(6, 2, 10),
	(6, 3, 8),
	(6, 4, 2),
	(6, 5, 6),
	(7, 1, 3),
	(7, 2, 2),
	(7, 3, 6),
	(7, 4, 3),
	(7, 5, 8),
	(8, 1, 4),
	(8, 2, 2),
	(8, 3, 7),
	(8, 4, 2),
	(8, 5, 4),
	(9, 1, 4),
	(9, 2, 2),
	(9, 3, 7),
	(9, 4, 2),
	(9, 5, 4),
	(10, 1, 5),
	(10, 2, 4),
	(10, 3, 3),
	(10, 4, 2),
	(10, 5, 7),
	(11, 1, 2),
	(11, 2, 6),
	(11, 3, 5),
	(11, 4, 11),
	(11, 5, 175),
	(12, 1, 3),
	(12, 2, 2),
	(12, 3, 5),
	(12, 4, 6),
	(12, 5, 7),
	(13, 1, 6),
	(13, 2, 4),
	(13, 3, 11),
	(13, 4, 5),
	(13, 5, 9),
	(14, 1, 6),
	(14, 2, 4),
	(14, 3, 11),
	(14, 4, 5),
	(14, 5, 9),
	(15, 1, 3),
	(15, 2, 8),
	(15, 3, 22),
	(15, 4, 10),
	(15, 5, 18),
	(16, 1, 2),
	(16, 2, 4),
	(16, 3, 6),
	(16, 4, 8),
	(16, 5, 10),
	(17, 1, 4),
	(17, 2, 6),
	(17, 3, 8),
	(17, 4, 10),
	(17, 5, 12),
	(18, 1, 5),
	(18, 2, 7),
	(18, 3, 9),
	(18, 4, 11),
	(18, 5, 13),
	(19, 1, 10),
	(19, 2, 9),
	(19, 3, 8),
	(19, 4, 7),
	(19, 5, 6),
	(20, 1, 5),
	(20, 2, 10),
	(20, 3, 20),
	(20, 4, 30),
	(20, 5, 40),
	(21, 1, 10),
	(21, 2, 15),
	(21, 3, 25),
	(21, 4, 35),
	(21, 5, 45),
	(22, 1, 10),
	(22, 2, 12),
	(22, 3, 13),
	(22, 4, 16),
	(22, 5, 18)
;

INSERT INTO BORROWER
	(Borrower_Name,	Borrower_Addres, Phone)
	VALUES
	('Justin L. Cole', '1910 Davis Lane Denver, CO 80203', '720-263-2730'),
	('Amy F. Greer', '3491 Newton Street Saint Cloud, MN 56303', '320-338-1741'),
	('Debra S. Cauley', '2755 Hoffman Avenue Syosset, NY 11791', '917-889-2481'),
	('Mirta A. Reed', '3977 Linda Street Philadelphia, PA 19103', '267-873-1233'),
	('Tonya J. Potter', '2525 West Virginia Avenue Albany, NY 12207', '518-836-5822'),
	('Rebecca H. Mahlum', '3020 Sheila Lane Reno, NV 89501', '775-546-7780'),
	('Annie R. Chenoweth', '3747 Clinton Street Morrilton, AR 72110', '501-208-8729'),
	('Luis M. Harris', '425 Star Trek Drive Pensacola, FL 32505', '850-418-5927')
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(6, 3, 1, '2019-08-27', '2019-09-27'),
	(3, 3, 1, '2019-08-28', '2019-09-28'),
	(21, 5, 8, '2019-08-29', '2019-09-30'),
	(18, 2, 2, '2019-08-01', '2019-09-01'),
	(8, 2, 5, '2000-02-05', '2000-03-05'),
	(3, 2, 4, '2019-07-01', '2019-08-01'),
	(8, 2, 4, '2019-08-15', '2019-09-15'),
	(15, 4, 8, '2019-08-01', '2019-09-01'),
	(13, 1, 6, '2019-08-06', '2019-09-06'),
	(22, 1, 5, '2019-07-05', '2019-08-05'),
	(4, 3, 4, '2019-06-01', '2019-07-01'),
	(16, 1, 7, '2019-08-28', '2019-09-28'),
	(12, 5, 8, '2019-08-29', '2019-09-30'),
	(7, 2, 2, '2019-08-28', '2019-09-28'),
	(18, 4, 6, '2019-06-05', '2019-07-05'),
	(2, 3, 5, '2019-07-28', '2019-08-28'),
	(21, 4, 6, '2019-07-29', '2019-08-29'),
	(3, 4, 2, '2019-07-13', '2019-08-13'),
	(16, 1, 6, '2019-07-31', '2019-08-31'),
	(9, 5, 2, '2000-08-09', '2000-09-09'),
	(3, 5, 7, '2019-05-01', '2019-06-01'),
	(19, 1, 6, '2019-07-28', '2019-08-28'),
	(13, 3, 5, '2013-03-05', '2013-04-05'),
	(5, 5, 2, '2018-08-01', '2018-09-01'),
	(3, 2, 4, '2019-08-10', '2019-09-10'),
	(19, 4, 6, '2019-07-06', '2019-08-06'),
	(4, 5, 8, '2019-08-30', '2019-09-30'),
	(16, 4, 7, '2019-07-18', '2019-08-18'),
	(4, 3, 5, '2019-07-31', '2019-08-31'),
	(16, 2, 4, '2019-07-28', '2019-08-28'),
	(22, 1, 1, '2019-08-13', '2019-09-13'),
	(9, 5, 2, '2019-06-28', '2019-07-28'),
	(3, 3, 4, '2019-08-29', '2019-09-29'),
	(12, 1, 6, '2019-07-28', '2019-08-28'),
	(6, 1, 1, '2019-08-05', '2019-09-05'),
	(3, 2, 2, '2019-07-28', '2019-08-28'),
	(11, 2, 2, '2019-07-29', '2019-08-29'),
	(8, 3, 4, '2019-08-13', '2019-09-13'),
	(12, 3, 5, '2019-07-20', '2019-08-20'),
	(20, 4, 6, '2019-08-09', '2019-09-19'),
	(16, 4, 7, '2019-07-01', '2019-08-01'),
	(6, 5, 8, '2019-08-28', '2019-09-28'),
	(18, 5, 7, '2019-08-29', '2019-09-29'),
	(4, 5, 6, '2019-08-08', '2019-09-08'),
	(19, 5, 5, '2019-02-05', '2019-03-05'),
	(6, 4, 4, '2019-07-01', '2019-08-01'),
	(5, 4, 1, '2019-08-18', '2019-09-18'),
	(10, 3, 2, '2019-07-04', '2019-08-04'),
	(9, 3, 1, '2019-08-13', '2019-09-13'),
	(15, 2, 1, '2019-08-09', '2019-09-09'),
	(2, 2, 2, '2019-06-14', '2019-07-14'),
	(2, 1, 2, '2019-08-28', '2019-09-28'),
	(9, 1, 8, '2019-07-29', '2019-08-29'),
	(2, 3, 7, '2019-08-28', '2019-09-28'),
	(7, 5, 4, '2019-08-05', '2019-09-05'),
	(3, 2, 4, '2019-07-28', '2019-08-28'),
	(13, 3, 5, '2019-08-13', '2019-09-13'),
	(2, 4, 5, '2019-07-13', '2019-08-13')
;

CREATE PROCEDURE dbo.sharpTribe
AS
SELECT
a1.Title, a2.BranchName,
a3.Number_Of_Copies
FROM
BOOK_COPIES a3
INNER JOIN BOOKS a1 ON a1.BookID = a3.BookID
INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a3.BranchID
WHERE Title = 'The Lost Tribe'
AND BranchName = 'Sharpstown'
GO

CREATE PROCEDURE dbo.tribeCopies
AS
SELECT
a1.Title, a2.BranchName,
a3.Number_Of_Copies
FROM
BOOK_COPIES a3
INNER JOIN BOOKS a1 ON a1.BookID = a3.BookID
INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a3.BranchID
WHERE Title = 'The Lost Tribe'
GO

CREATE PROCEDURE dbo.noLoans
AS
SELECT
a1.Borrower_Name
FROM
BORROWER a1
full outer JOIN BOOK_LOANS a2 ON a2.CardNo = a1.CardNo where a2.CardNo is null
GO

CREATE PROCEDURE dbo.sharpDueToday
AS
SELECT
a2.Title, a1.Borrower_Name, a1.Borrower_Addres
FROM
BOOK_LOANS a3
INNER JOIN BOOKS a2 ON a2.BookID = a3.BookID
INNER JOIN BORROWER a1 ON a1.CardNo = a3.CardNo
INNER Join LIBRARY_BRANCH a4 ON a4.BranchID = a3.BranchID
WHERE a4.BranchName = 'Sharpstown'
AND a3.DateDue = CONVERT (date, SYSDATETIME())
GO

CREATE PROCEDURE dbo.branchLoans
AS
SELECT
a1.BranchName, COUNT(a2.BranchID)
FROM
BOOK_LOANS a2
INNER JOIN LIBRARY_BRANCH a1 ON a1.BranchID = a2.BranchID
GROUP BY a1.BranchName
GO

CREATE PROCEDURE dbo.fiveBooks
AS
SELECT
a1.Borrower_Name, a1.Borrower_Addres,
COUNT(a2.CardNo) AS 'Books Borrowed'
FROM
BOOK_LOANS a2
INNER JOIN BORROWER a1 ON a1.CardNo = a2.CardNo
GROUP BY a1.Borrower_Name, a1.Borrower_Addres
HAVING COUNT(a2.CardNo) > 5
GO

CREATE PROCEDURE dbo.centralKing
AS
SELECT
a1.Title, a3.Number_Of_Copies, a2.BranchName
FROM
BOOK_COPIES a3
INNER JOIN BOOKS a1 ON a1.BookID = a3.BookID
INNER JOIN LIBRARY_BRANCH a2 ON a2.BranchID = a3.BranchID
INNER JOIN BOOK_AUTHORS ON BOOK_AUTHORS.BookID = a1.BookID
WHERE a2.BranchName = 'Central'
AND BOOK_AUTHORS.Author_Name = 'Stephen King'
GO