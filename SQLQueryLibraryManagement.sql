
INSERT INTO Authors (name, bio, date_of_birth, nationality) VALUES
('Leo Tolstoy', 'Russian author known for his novels "War and Peace" and "Anna Karenina".', '1828-09-09', 'Russian'),
('Gabriel Garcia Marquez', 'Colombian novelist known for "One Hundred Years of Solitude".', '1927-03-06', 'Colombian'),
('Herman Melville', 'American novelist known for "Moby-Dick".', '1819-08-01', 'American')

INSERT INTO Publishers (name, address, contact_info) VALUES
('HarperCollins', '195 Broadway, New York, NY 10007, USA', 'contact@harpercollins.com'),
('Penguin Random House', '1745 Broadway, New York, NY 10019, USA', 'info@penguinrandomhouse.com')


INSERT INTO Books (title, isbn, author_id, publishers_id, publication_year, genre, copies_avaliable) VALUES
('The Scarlet Letter', '9780142437260', 46, 7, 1850, 'Historical Fiction', 5),
('Frankenstein', '9780141439471', 47, 7, 1818, 'Gothic Fiction', 7),
('The Count of Monte Cristo', '9780140449266', 48, 8, 1844, 'Adventure', 4),
('Gullivers Travels', '9780141439495', 49, 7, 1726, 'Satire', 6)


INSERT INTO Members (name, email, phone_number, membership_start_date, membership_expiry_date) VALUES
('John Doe', 'johndoe@example.com', '+1-555-1234', '2022-01-15','2022-03-22'),
('Jane Smith', 'janesmith@example.com', '+1-555-5678', '2022-03-22','2023-05-30')


INSERT INTO BorrowedBooks (book_id, member_id, borrow_date, due_date, return_date) VALUES
(2, 12, '2023-07-20', '2023-08-03', '2023-08-02'),
(3, 8, '2023-06-10', '2023-06-24', '2023-06-22')


INSERT INTO Books (title, isbn, author_id, publishers_id, publication_year, genre, copies_avaliable) VALUES
('The Wind-Up Bird Chronicle', '9780679775430', 61, 3, 1994, 'Magical Realism', 4),
('One Hundred Years of Solitude', '9780060883287', 62, 7, 1967, 'Magical Realism', 7),
('The Metamorphosis', '9780805210576', 18, 2, 1915, 'Absurdist Fiction', 5),
('The Alchemist', '9780061122415', 63, 6, 1988, 'Adventure', 10),
('The Old Man and the Sea', '9780684830490', 17, 1, 1952, 'Literary Fiction', 6)

												--SAMPLE QUERIES

SELECT * 
FROM Authors
WHERE nationality='British' --brings British authors


SELECT * 
FROM Books
WHERE author_id=1  --brings author 1s books

SELECT * 
FROM BorrowedBooks
WHERE return_date IS NULL --those who buy books and do not bring them

SELECT * 
FROM Members
WHERE membership_start_date='2024-01-01'

SELECT * 
FROM ReadStatistics
WHERE times_borrowed>=1 --borrowed books at least once

SELECT b.title, bb.borrow_date, bb.due_date, bb.return_date
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.id
WHERE bb.member_id = 1; --member 1's borrowed books& date infos about these books

SELECT m.name, b.title, bb.borrow_date, bb.due_date, bb.return_date
FROM BorrowedBooks bb
JOIN Members m ON bb.member_id = m.id
JOIN Books b ON bb.book_id = b.id
WHERE bb.return_date > bb.due_date; --lists books submitted after the deadline

SELECT title, author_id, publication_year
FROM Books
WHERE publication_year = 2023; --books published in 2023

SELECT b.title, COUNT(bb.id) AS borrow_count
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.id
GROUP BY b.title
ORDER BY borrow_count DESC; --lists most borrowed books

SELECT title, author_id, publishers_id
FROM Books
WHERE genre = 'Fantasy'; -- lists books in a certain genre

SELECT m.name, b.title, bb.borrow_date, bb.due_date
FROM BorrowedBooks bb
JOIN Members m ON bb.member_id = m.id
JOIN Books b ON bb.book_id = b.id
WHERE bb.return_date IS NULL; --books that have not yet been returned and are overdue

SELECT name, email, membership_start_date
FROM Members
ORDER BY membership_start_date ASC; --lists oldest members

SELECT title, publication_year, genre
FROM Books
WHERE author_id = 66; --all books by a particular author

SELECT p.name, COUNT(b.id) AS book_count
FROM Books b
JOIN Publishers p ON b.publishers_id = p.id
GROUP BY p.name
ORDER BY book_count DESC; --which publisher has how many books

SELECT b.title, bb.borrow_date, bb.return_date
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.id
WHERE bb.member_id = 5 AND bb.return_date IS NOT NULL; --books returned by a certain member

SELECT AVG(CAST(YEAR(publication_year) AS INT)) AS average_year
FROM Books; --average publication year of books

SELECT a.name AS author_name, COUNT(bb.id) AS borrow_count
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.id
JOIN Authors a ON b.author_id = a.id
GROUP BY a.name
ORDER BY borrow_count DESC --brings up the most borrowed authors and the number of times books by each author have been borrowed.

SELECT m.name AS member_name, COUNT(bb.id) AS borrow_count
FROM BorrowedBooks bb
JOIN Books b ON bb.book_id = b.id
JOIN Members m ON bb.member_id = m.id
WHERE b.genre = 'Fantasy'
GROUP BY m.name
ORDER BY borrow_count DESC --shows the member who borrowed the most books of a certain type and the number of times they borrowed.


















