show databases;
create  database project_v5;
use project_v5;

Add Table “books”
------------------------

CREATE TABLE books (
    book_id INTEGER NOT NULL,
    book_title VARCHAR(40),
    edition VARCHAR(40),
    availability BOOL,
    num_of_copies INTEGER,
    state VARCHAR(40),
    catalog_number INTEGER,
    row_number INTEGER,
    active BOOL,
    created_by VARCHAR(40),
    updated_by VARCHAR(40),
    created DATETIME,
    updated DATETIME,
    PRIMARY KEY (book_id)
);


Add Table “borrow_transaction”
------------------------

CREATE TABLE borrow_transaction (
    borrow_transaction_id INTEGER NOT NULL,
    librarian_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    borrowed_datetime DATETIME NOT NULL,
    returned_datetime DATETIME,
    borrowed_by VARCHAR(40),
    returned_by VARCHAR(40),
    date_due DATE,
    is_returned BOOL,
    created_by VARCHAR(40),
    updated_by VARCHAR(40),
    created DATETIME,
    updated DATETIME,
    PRIMARY KEY (borrow_transaction_id)
);


Add Table “librarian”
------------------------

CREATE TABLE librarian (
    librarian_id INTEGER NOT NULL,
    name VARCHAR(40),
    user_name VARCHAR(40),
    password VARCHAR(40),
    created_by VARCHAR(40),
    updated_by VARCHAR(40),
    created DATETIME,
    updated DATETIME,
    active BOOL,
    inactive_reason VARCHAR(40),
    PRIMARY KEY (librarian_id)
);


Add Table “members”
------------------------

CREATE TABLE members (
    member_id INTEGER NOT NULL,
    external_id INTEGER,
    member_type VARCHAR(40),
    member_name VARCHAR(40),
    phone_number INTEGER,
    gender VARCHAR(40),
    email VARCHAR(40),
    active BOOL,
    created_by VARCHAR(40),
    updated_by VARCHAR(40),
    created DATETIME,
    updated DATETIME,
    PRIMARY KEY (member_id)
);


Add Table “membership”
------------------------

CREATE TABLE membership (
    librarian_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    registred_datetime DATETIME NOT NULL,
    registred_by VARCHAR(40),
    membership_status BOOL,
    membership_expiry_date DATE
);


Add Table “fined_transactions”
------------------------

CREATE TABLE fined_transactions (
    fined_transaction_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    librarian_id INTEGER NOT NULL,
    borrow_transaction_id INTEGER NOT NULL,
    amount_added VARCHAR(40),
    amount_received VARCHAR(40),
    notes VARCHAR(40),
    deleted DATETIME,     
	 created DATETIME,
    created_by VARCHAR(40),
    PRIMARY KEY (fined_transaction_id)
);


Add Table “author”
------------------------

CREATE TABLE author (
    author_id INTEGER NOT NULL,
    first_name	VARCHAR(40),
    last_name VARCHAR(40),
    PRIMARY KEY (author_id)
);
    

Add Table “books_by_author”
------------------------

CREATE TABLE books_by_author (
    author_id	 INTEGER NOT NULL,
    book_id INTEGER not null
);


Add Table “books_by_category”
------------------------	 

CREATE TABLE books_by_category (
    category_id INTEGER NOT NULL,
    book_id INTEGER not null
);


Add Table “categories”
------------------------

CREATE TABLE categories (
    category_id INTEGER NOT NULL,
    category_name VARCHAr(40),
    PRIMARY KEY (category_id )
);


Add Table “publisher”
------------------------

CREATE TABLE publisher (
    pub_id INTEGER NOT NULL,
    pub_name VARCHAR(40),
    book_id INTEGER NOT NULL,
    PRIMARY KEY (pub_id )
);


DESCRIBE books;
DESCRIBE borrow_transaction;
DESCRIBE librarian;
DESCRIBE members;
DESCRIBE membership;
DESCRIBE fined_transactions;
DESCRIBE Author;
DESCRIBE books_by_author;
DESCRIBE books_by_category;
DESCRIBE categories;
DESCRIBE publisher;



Foreign key constraints  
------------------------------    

ALTER TABLE publisher 
ADD FOREIGN KEY (book_id) REFERENCES books(book_id);

ALTER TABLE borrow_transaction   
ADD FOREIGN KEY (book_id) REFERENCES books (book_id);

ALTER TABLE borrow_transaction 
ADD FOREIGN KEY (librarian_id) REFERENCES librarian (librarian_id);

ALTER TABLE borrow_transaction   
ADD FOREIGN KEY (member_id) REFERENCES members (member_id);

ALTER TABLE membership
ADD FOREIGN KEY (librarian_id) REFERENCES librarian (librarian_id);

ALTER TABLE membership 
ADD FOREIGN KEY (member_id) REFERENCES members (member_id);

ALTER TABLE fined_transactions 
ADD FOREIGN KEY (librarian_id) REFERENCES librarian (librarian_id);

ALTER TABLE fined_transactions
ADD FOREIGN KEY (borrow_transaction_id) REFERENCES borrow_transaction ( borrow_transaction_id);

ALTER TABLE fined_transactions 
ADD FOREIGN KEY (member_id) REFERENCES members (member_id);

ALTER TABLE books_by_author
ADD FOREIGN KEY (author_id) REFERENCES author(author_id );
    
ALTER TABLE books_by_author
ADD FOREIGN KEY (book_id) REFERENCES books(book_id );
    
ALTER TABLE books_by_category    
ADD FOREIGN KEY (category_id) REFERENCES Categories(category_id );

ALTER TABLE books_by_category
ADD FOREIGN KEY (book_id) REFERENCES books(book_id );



SELECT *FROM books;
SELECT *FROM borrow_transaction;
SELECT *FROM librarian;
SELECT *FROM members;
SELECT *FROM membership;
SELECT *FROM fined_transactions;
SELECT *FROM Author;
SELECT *FROM books_by_author;
SELECT *FROM books_by_category;
SELECT *FROM Categories;
SELECT *FROM Publisher;



Insertion, Updation, Deletion (DML)
------------------------------  

INSERT INTO books (book_id, book_title, edition, availability, num_of_copies,state, catalog_number, row_number, active, created_by, updated_by, created, updated) 
VALUES (101,'Numerical Methods For Engineer','4th',1,10,'EXCELLENT',3,4,1,'KAUSHIK','APU','2016-10-12 12:10:03','2017-10-12 12:10:03'),
       (102,'Discrete Mathematics And Its Application','7th',1,15,'EXCELLENT',5,6,1,'KAUSHIK','APU','2016-12-10 12:10:03','2018-10-12 12:10:03');

INSERT INTO librarian(librarian_id,name,user_name,password,created_by,updated_by,created,updated,active,inactive_reason)		
VALUES ( 1001,'Kaushik','kaushik','kaushik123','admin','admin','2015-10-12 12:10:03','2017-10-12 12:10:03',1,NULL),		
       ( 1002,'nafisa','nafisa','nafisa123','admin','admin','2015-10-12 12:10:03','2017-10-12 12:10:03',1,NULL);

		
INSERT INTO members(member_id,external_id,member_type,member_name,phone_number,gender,email,active,created_by,updated_by,created,updated)
VALUES (18101,1,'Student','Ahmed Apu',1700000,'Male','ahmed@gmail.com',1,'kaushik',NULL,'2018-2-10 12:10:03',NULL),
       (18102,2,'STAFF','nafisa',012563663,'female','nafisa@gmail.com',1,'nafisa',NULL,'2018-2-10 12:10:03',NULL);


INSERT INTO author(author_id,first_name,last_name)
VALUES (1001,'Steven C.','Chapra'),(1002,'Kenneth H.','Rosen');

INSERT INTO books_by_author(author_id,book_id)
VALUES (1001,101),(1002,102);

INSERT INTO categories(category_id,category_name)
VALUES (4,'Numerical Analysis'),(6,'Computer Mathematics');

INSERT INTO books_by_category(category_id,book_id)
VALUES (4,101),(6,102);

INSERT INTO publisher(pub_id,pub_name,book_id)
VALUES (10,'McGraw-Hill Education',101),(20,'William C Brown',102);


SELECT *FROM books;
SELECT *FROM borrow_transaction;
SELECT *FROM librarian;
SELECT *FROM members;
SELECT *FROM membership;
SELECT *FROM fined_transactions;
SELECT *FROM author;
SELECT *FROM books_by_author;
SELECT *FROM books_by_category;
SELECT *FROM categories;
SELECT *FROM publisher;




To find books with overdue date
------------------------------------------
SELECT members.member_name, books.book_title, borrow_transaction.borrowed_datetime, borrow_transaction.date_due
FROM borrow_transaction 
INNER JOIN members ON borrow_transaction.member_id=members.member_id
INNER JOIN books ON borrow_transaction.book_id=books.book_id
WHERE  date_due <= '2011-02-07' AND is_returned=0;


To find publisher name of a book
----------------------------------
SELECT books.book_title, publisher.pub_name
FROM books
INNER JOIN publisher on books.book_id=publisher.book_id;



Some other functions
---------------------------

SELECT member_type, member_name from members WHERE member_type!='student';

SELECT member_name,member_type,gender
FROM members  ORDER BY member_name DESC;

SELECT book_title
FROM books;


Create trigger to update members name from members table
----------------------------------------------------------

CREATE TABLE members_audit (
    serial_no INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    new_name VARCHAR(50) NOT NULL,
    old_name VARCHAR(50) NOT NULL,
    updated_by VARCHAR(50) NOT NULL,
    updated DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER after_members_update 
    after UPDATE ON members
    FOR EACH ROW 
BEGIN
    INSERT INTO members_audit
    SET action = 'update',
     member_id = OLD.member_id,
     new_name = new.member_name,
     old_name = old.member_name,
     updated_by = USER(),
     updated = NOW(); 
END$$
DELIMITER ;

SHOW TRIGGERS;

UPDATE members
SET member_name = 'Nafisa Anjum'
WHERE member_id = 18102;

SELECT *FROM members_audit;

    