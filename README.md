# LibraryManagementSystem


This project involves the design of a library management system database. It allows managing information about book borrowing and return transactions, authors, publishers, members and books.
You can find related database diagram(which i used dbdiagram.io for) and an Excel file for data visualization.
Features:

- **Books Table**: 
  - This table contains information about all the books in the library. It stores details such as the title, ISBN number, author, publisher, publication year, genre, and the number of available copies for each book.

- **Authors Table**: 
  - This table holds information about all the authors registered in the library. It includes the authors' names and biographies, helping to track which author wrote each book.

- **Publishers Table**: 
  - This table contains details about the publishers of the books. It stores the names of the publishers along with other relevant information.

- **Members Table**: 
  - This table stores information about the library members. It includes member names, email addresses, and membership start dates.

- **BorrowedBooks Table**: 
  - This table tracks the books that have been borrowed from the library. For each borrowing transaction, it records the member information, book details, borrow date, due date, and return date.

- **OverdueAlerts Table**: 
  - This table stores alerts for overdue books that have not yet been returned. It tracks which members have overdue books, helping to notify the library staff.

Data Types:
*Authors*
id (int)
name (varchar(255))
bio (text)
date_of_birth (date)
nationality  (varchar(100))

*Books*
id  (int)
title (varchar(255))
isbn  (varchar(13))
author_id  (int)
publishers_id (int)
publication_year (int)
genre (varchar(50))
copies_available  (int)

*BorrowedBooks*
id  (int)
book_id (int)
member_id (int)
borrow_date (date)
due_date (date)
return_date (date)

*Members*
id (int)
name  (varchar(255))
email  (varchar(255))
phone_number  (varchar(50))
membership_start_date  (date)
membership_expiry_date (date)

*Publishers*
id (int)
name ((varchar(255))
address (text)
contact_info  (varchar(50))
*ReadStatistics*
id  (int)
book_id (int)
times_borrowed (int)
