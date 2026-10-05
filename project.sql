-- Create database

Create Database SQLProject;

-- Create tables

Create Table Employees(
	Emp_id int primary key,
	Fname varchar(50) not null,
	Lname varchar(50),
	Email varchar(100),
	Salary decimal(10,2) ,
	Date_Of_Birth date,
	Bonus Decimal(10,2),
	Address varchar(100),
	PhoneNumber varchar(11),
	Supervisor int not null,
	Floor_id int,
	
	Foreign key (Supervisor) References Employees (Emp_id));


Create Table Floors(
	Floor_Number int Primary key,
	Number_Of_Blocks int not null,
	Emp_id int	not null,
	Hire_Date date,

	Foreign key (Emp_id) References Employees (Emp_id) 
	);

Create Table Users(
	SSN int Primary key,
	Name Varchar(50) not null,
	Email Varchar(100),
	Emp_id int not null,

	Foreign Key (Emp_id) References Employees (Emp_id) 
	);

Create Table User_PhoneNumbers(
	SSN int not null,
	PhoneNumbers varchar(11),

	Primary key (SSN , PhoneNumbers),
	Foreign key (SSN) References Users (SSN)
	);

Create Table Publishers (
    Publisher_id INT PRIMARY KEY,
    Name VARCHAR(100)
);

Create table Categories (
    ID INT PRIMARY KEY,
    Cat_name VARCHAR(100)
);

Create Table Shelfs (
    Shelf_Code VARCHAR(20) PRIMARY KEY,
    Floor_Number INT ,
	Foreign Key (Floor_Number) References Floors(Floor_number)
);

Create Table Books(
	Book_id int primary key,
	Title varchar(100),
	Publisher_id int ,
	Category_id int,
	Shelf_Code Varchar(20),

	Foreign key (Publisher_id) References Publishers(Publisher_id),
	Foreign key (Category_id) References Categories(ID),
	Foreign key (Shelf_Code) References Shelfs(Shelf_Code)
	);


Create Table Authors (
    Author_id int Primary Key,
    Name Varchar(100)
);


Create table Authors_books (
    Book_id int,
    Author_id int,
    Primary Key (Book_id, Author_id),
    Foreign Key (Book_id) References Books(Book_id),
    Foreign Key (Author_id) References Authors(Author_id) 
);

Create Table Users_Borrowed_Books (
    Emp_id int not null,
    User_SSN int not null,
    Book_id int not null,
    Date_Borrowed date,
    Due_Date date,
    Money_Paid decimal(10, 2),

	Primary Key (Emp_id,User_SSN,Book_id),

	Foreign Key (Emp_id)   References Employees(Emp_id),
	Foreign Key (User_SSN) References Users(SSN),
	Foreign Key (Book_id)  References Books(Book_id)
);

-- Update Tables With Missing Foreign keys


Alter Table Employees
Add Foreign key (Floor_id) References Floors (Floor_Number)


-- Insert data 

INSERT INTO Employees
(Emp_id, Fname, Lname, Email, Salary, Date_Of_Birth, Bonus, Address, PhoneNumber, Supervisor,Floor_id)
VALUES
(1, 'Ahmed', 'Ali', 'ahmed.ali@gmail.com', 15000.00, '1985-01-15', 2000.00, 'Cairo', '01010000001', 7,1),
(2, 'Mohamed', 'Hassan', 'mohamed.hassan@gmail.com', 12000.00, '1988-03-20', 1500.00, 'Alex', '01010000002', 1,5),
(3, 'Omar', 'Amr', 'omar.amr@gmail.com', 11000.00, '1990-05-10', 1000.00, 'Cairo', '01010000003', 1,6),
(4, 'Ali', 'Mohamed', NULL, 9500.00, '1992-07-25', 1200.00, 'Alex', '01010000004', 2,2),
(5, 'Hany', 'Adel', 'hany.adel@gmail.com', 9000.00, '1993-02-11', 800.00, 'Cairo', '01010000005', 2,2),
(6, 'Khaled', 'Said', NULL, 8500.00, '1994-06-18', 700.00, 'Giza', '01010000006', 2,6),
(7, 'Mostafa', 'Omar', 'mostafa.omar@gmail.com', 8000.00, '1995-09-12', 600.00, 'Cairo', '01010000007', 3,4),
(8, 'Youssef', 'Mahmoud', NULL, 7800.00, '1996-04-05', 500.00, 'Alex', '01010000008', 3,7),
(9, 'Mahmoud', 'Samir', 'mahmoud.samir@gmail.com', 7600.00, '1997-08-22', 400.00, 'Giza', '01010000009', 3,3),
(10, 'Ibrahim', 'Tarek', 'ibrahim.tarek@gmail.com', 7200.00, '1998-11-30', 300.00, 'Cairo', '01010000010', 4,2),
(11, 'Karim', 'Nabil', NULL, 7000.00, '1999-01-19', 250.00, 'Alex', '01010000011', 4,2),
(12, 'Ali', 'Mohamed', 'ali.mohamed@gmail.com', 6800.00, '1991-10-14', 900.00, 'Cairo', '01010000012', 4,1),
(13, 'Sara', 'Ahmed', 'sara.ahmed@gmail.com', 6500.00, '1996-12-01', 350.00, 'Alex', '01010000013', 5,6),
(14, 'Mariam', 'Khaled', NULL, 6200.00, '1997-03-17', 300.00, 'Cairo', '01010000014', 5,2),
(15, 'Nour', 'Hassan', 'nour.hassan@gmail.com', 6000.00, '1998-05-28', 250.00, 'Alex', '01010000015', 5,5),
(16, 'Mostafa', 'Samy', NULL, 1000.50, '1999-07-07', 1000.00, 'Cairo', '01010000016', 6,6),
(17, 'Hossam', 'Adel', 'hossam.adel@gmail.com', 4845.35, '1995-02-09', 1200.00, 'Alex', '01010000017', 6,1),
(18, 'Sherif', 'Omar', NULL, 5500.00, '1994-09-16', 200.00, 'Giza', '01010000018', 6,5),
(19, 'Amr', 'Khaled', 'amr.khaled@gmail.com', 5200.00, '1993-11-03', 150.00, 'Cairo', '01010000019', 7,3),
(20, 'Omar', 'Amr', 'omar.manager@gmail.com', 18000.00, '1982-06-25', 3000.00, 'Alex', '01010000020', 20,3);


INSERT INTO Floors
(Floor_Number, Number_Of_Blocks, Emp_id, Hire_Date)
VALUES
(1, 10, 1, '2020-01-10'),
(2, 8, 2, '2020-03-15'),
(3, 12, 3, '2021-06-20'),
(4, 7, 4, '2021-09-01'),
(5, 9, 5, '2022-03-01'),
(6, 2, 20, GETDATE()),
(7, 1, 12, '2022-04-08');


INSERT INTO Users
(SSN, Name, Email, Emp_id)
VALUES
(1, 'Ahmed Mohamed', 'ahmed.user@gmail.com', 1),
(2, 'Sara Ali', 'sara.user@gmail.com', 2),
(3, 'Mariam Hassan', 'mariam.user@gmail.com', 3),
(4, 'Khaled Ahmed', 'khaled.user@gmail.com', 4),
(5, 'Omar Samir', 'omar.user@gmail.com', 5),
(6, 'Hany Adel', 'hany.user@gmail.com', 6),
(7, 'Nour Ali', 'nour.user@gmail.com', 7),
(8, 'Mostafa Hassan', 'mostafa.user@gmail.com', 8),
(9, 'Ali Mahmoud', 'ali.user@gmail.com', 9),
(10, 'Ahmed Mohamed', 'ahmed2.user@gmail.com', 10),
(11, 'Mona Khaled', 'mona.user@gmail.com', 11),
(12, 'Karim Samir', 'karim.user@gmail.com', 12),
(13, 'Youssef Ahmed', 'youssef.user@gmail.com', 13),
(14, 'Hassan Omar', 'hassan.user@gmail.com', 14),
(15, 'Amr Khaled', 'amr.user@gmail.com', 15),
(16, 'Dina Ali', 'dina.user@gmail.com', 16),
(17, 'Mai Hassan', 'mai.user@gmail.com', 17),
(18, 'Aya Mohamed', 'aya.user@gmail.com', 18),
(19, 'Hossam Adel', 'hossam.user@gmail.com', 19),
(20, 'Ahmed Mohamed', 'ahmed3.user@gmail.com', 20);


INSERT INTO User_PhoneNumbers
(SSN, PhoneNumbers)
VALUES
(1, '01020000001'),
(1, '01120000001'),
(2, '01020000002'),
(3, '01020000003'),
(3, '01220000003'),
(4, '01020000004'),
(5, '01020000005'),
(5, '01120000005'),
(6, '01020000006'),
(7, '01020000007'),
(8, '01020000008'),
(8, '01220000008'),
(9, '01020000009'),
(10, '01020000010'),
(11, '01020000011'),
(12, '01020000012'),
(12, '01120000012'),
(13, '01020000013'),
(14, '01020000014'),
(15, '01020000015'),
(16, '01020000016'),
(17, '01020000017'),
(18, '01020000018'),
(19, '01020000019'),
(20, '01020000020');


INSERT INTO Publishers
(Publisher_id, Name)
VALUES
(1, 'HarperCollins'),
(2, 'OReilly Media'),
(3, 'Pearson'),
(4, 'McGraw Hill'),
(5, 'Packt Publishing'),
(6, 'Apress'),
(7, 'Wiley'),
(8, 'Springer');


INSERT INTO Categories
(ID, Cat_name)
VALUES
(1, 'Programming'),
(2, 'Database'),
(3, 'Computer Science'),
(4, 'Web Development'),
(5, 'Software Engineering'),
(6, 'Networking'),
(7, 'Artificial Intelligence'),
(8, 'Cyber Security');


INSERT INTO Shelfs
(Shelf_Code, Floor_Number)
VALUES
('A1', 1),
('A2', 1),
('A3', 1),
('B1', 2),
('B2', 2),
('B3', 2),
('C1', 3),
('C2', 3),
('C3', 3),
('D1', 4),
('D2', 4),
('E1', 5),
('E2', 5),
('E3', 5),
('F1', 6),
('F2', 6),
('G1', 7);


INSERT INTO Books
(Book_id, Title, Publisher_id, Category_id, Shelf_Code)
VALUES
(1, 'Clean Code', 1, 5, 'A1'),
(2, 'C# Programming Basics', 2, 1, 'A1'),
(3, 'Learning SQL', 3, 2, 'A1'),
(4, 'Database Design', 4, 2, 'A1'),
(5, 'The Pragmatic Programmer', 1, 5, 'A2'),
(6, 'C# in Depth', 5, 1, 'A2'),
(7, 'Python Programming', 2, 1, 'A2'),
(8, 'Algorithms', 4, 3, 'A2'),
(9, 'ASP.NET Core in Action', 6, 4, 'A3'),
(10, 'HTML and CSS Guide', 5, 4, 'A3'),
(11, 'SQL Cookbook', 2, 2, 'B1'),
(12, 'Database System Concepts', 4, 2, 'B1'),
(13, 'Advanced SQL', 1, 2, 'B1'),
(14, 'Programming C#', 3, 1, 'B2'),
(15, 'Java Programming', 5, 1, 'B2'),
(16, 'Python Advanced', 1, 1, 'B2'),
(17, 'Computer Networks', 4, 6, 'B3'),
(18, 'Network Security', 7, 6, 'B3'),
(19, 'Software Engineering', 1, 5, 'C1'),
(20, 'Design Patterns', 3, 5, 'C1'),
(21, 'Software Architecture', 6, 5, 'C1'),
(22, 'Operating Systems', 4, 3, 'C2'),
(23, 'Computer Organization', 7, 3, 'C2'),
(24, 'Artificial Intelligence', 8, 7, 'C3'),
(25, 'Machine Learning', 1, 7, 'C3'),
(26, 'Deep Learning', 8, 7, 'C3'),
(27, 'Web Development with ASP.NET', 5, 4, 'D1'),
(28, 'JavaScript Complete Guide', 2, 4, 'D1'),
(29, 'React Development', 6, 4, 'D2'),
(30, 'Cyber Security Basics', 7, 8, 'E1'),
(31, 'Ethical Hacking', 5, 8, 'E1'),
(32, 'Network Defense', 1, 8, 'E2'),
(33, 'Advanced C#', 2, 1, 'E3'),
(34, 'Programming Fundamentals', 3, 1, 'E3'),
(35, 'SQL Server Administration', 1, 2, 'F1'),
(36, 'SQL Server Performance', 4, 2, 'F1'),
(37, 'Database Administration', 3, 2, 'F2'),
(38, 'Data Structures', 7, 3, 'G1'),
(39, 'Algorithms in Practice', 1, 3, 'G1');


INSERT INTO Authors
(Author_id, Name)
VALUES
(1, 'Robert C. Martin'),
(2, 'David Thomas'),
(3, 'Andrew Hunt'),
(4, 'Mark Price'),
(5, 'Abraham Silberschatz'),
(6, 'Henry Korth'),
(7, 'Martin Fowler'),
(8, 'Jon Skeet'),
(9, 'Eric Matthes'),
(10, 'Andrew S. Tanenbaum'),
(11, 'Ian Sommerville'),
(12, 'Thomas H. Cormen'),
(13, 'Charles Petzold'),
(14, 'John Sharp'),
(15, 'Adam Freeman');


INSERT INTO Authors_books
(Book_id, Author_id)
VALUES
(1, 1),
(2, 8),
(2, 14),
(3, 2),
(4, 5),
(4, 6),
(5, 2),
(5, 3),
(6, 8),
(7, 9),
(8, 12),
(9, 15),
(10, 13),
(11, 2),
(12, 5),
(12, 6),
(13, 2),
(14, 8),
(15, 4),
(16, 9),
(17, 10),
(18, 10),
(19, 11),
(20, 1),
(21, 7),
(22, 10),
(23, 13),
(24, 9),
(25, 9),
(26, 9),
(27, 15),
(28, 2),
(29, 15),
(30, 10),
(31, 10),
(32, 10),
(33, 8),
(34, 14),
(35, 5),
(36, 5),
(37, 5),
(38, 12),
(39, 12);


INSERT INTO Users_Borrowed_Books
(Emp_id, User_SSN, Book_id, Date_Borrowed, Due_Date, Money_Paid)
VALUES
-- User 1 - many borrowings
(1, 1, 1, '2022-03-01', '2022-03-15', 50.00),
(1, 1, 5, '2022-03-10', '2022-03-24', 30.00),
(1, 1, 10, '2022-04-01', '2022-04-15', 20.00),
(1, 1, 15, '2022-05-05', '2022-05-19', 40.00),
(1, 1, 20, '2022-06-01', '2022-06-15', 25.00),
(1, 1, 25, '2022-07-10', '2022-07-24', 60.00),
(1, 1, 30, '2022-08-01', '2022-08-15', 10.00),
-- User 2
(2, 2, 2, '2022-02-10', '2022-02-24', 20.00),
(2, 2, 12, '2022-03-15', '2022-03-29', 35.00),
(2, 2, 22, '2022-05-20', '2022-06-03', 45.00),
-- User 3
(3, 3, 3, '2022-01-05', '2022-01-19', 15.00),
(3, 3, 7, '2022-04-10', '2022-04-24', 25.00),
-- User 4
(4, 4, 4, '2022-03-20', '2022-04-03', 40.00),
(4, 4, 17, '2022-06-15', '2022-06-29', 50.00),
-- User 5
(5, 5, 6, '2022-04-01', '2022-04-15', 30.00),
(5, 5, 18, '2022-05-01', '2022-05-15', 35.00),
(5, 5, 24, '2022-09-01', '2022-09-15', 70.00),
-- User 6
(6, 6, 8, '2022-03-05', '2022-03-19', 20.00),
(6, 6, 14, '2022-04-05', '2022-04-19', 30.00),
-- User 7
(7, 7, 9, '2022-05-10', '2022-05-24', 40.00),
(7, 7, 19, '2022-06-10', '2022-06-24', 45.00),
-- User 8
(8, 8, 11, '2022-03-01', '2022-03-15', 10.00),
(8, 8, 23, '2022-08-10', '2022-08-24', 25.00),
-- User 9
(9, 9, 13, '2022-02-20', '2022-03-06', 15.00),
(9, 9, 26, '2022-07-01', '2022-07-15', 50.00),
-- User 10
(10, 10, 16, '2022-03-10', '2022-03-24', 20.00),
(10, 10, 27, '2022-09-05', '2022-09-19', 35.00),
-- User 11
(11, 11, 21, '2022-04-15', '2022-04-29', 45.00),
-- User 12
(12, 12, 28, '2022-05-15', '2022-05-29', 30.00),
(12, 12, 31, '2022-06-20', '2022-07-04', 55.00),
-- User 13
(13, 13, 29, '2022-03-25', '2022-04-08', 25.00),
-- User 14
(14, 14, 32, '2022-07-15', '2022-07-29', 40.00),
-- User 15
(15, 15, 33, '2022-08-01', '2022-08-15', 35.00),
(15, 15, 34, '2022-09-01', '2022-09-15', 30.00),
-- User 16
(16, 16, 35, '2022-03-05', '2022-03-19', 10.00),
-- User 17
(17, 17, 36, '2022-04-20', '2022-05-04', 50.00),
-- User 18
(18, 18, 37, '2022-06-01', '2022-06-15', 20.00),
-- User 19
(19, 19, 38, '2022-08-15', '2022-08-29', 15.00),
-- User 20
(20, 20, 39, '2022-09-10', '2022-09-24', 25.00);

---------------------------------------------------------------------------
------- Part 2 : Queries -----------
------------------------------------

/*
1. Write a query that displays Full name of an employee who has more than
3 letters in his/her First Name.
*/

Select CONCAT(Fname , ' ',Lname)
From Employees 
Where Fname like '____%'


/*
2. Write a query to display the total number of Programming books
   available in the library with alias name ‘NO OF PROGRAMMING BOOKS’
*/

Select Count(*) AS [NO OF PROGRAMMING BOOKS]
From Books B inner join Categories C
ON B.Category_id = C.ID
where C.Cat_name = 'Programming';


/*
3. Write a query to display the number of books published by
   (HarperCollins) with the alias name 'NO_OF_BOOKS'.
*/

Select Count(*) AS [NO_OF_BOOKS]
From Books B inner Join Publishers P
ON B.Publisher_id = P.Publisher_id
Where P.Name = 'HarperCollins'


/*
4. Write a query to display the User SSN and name, date of borrowing and
   due date of the User whose due date is before July 2022.
*/

Select U.SSN ,U.Name ,B.Date_Borrowed , B.Due_Date 
From users U inner Join Users_Borrowed_Books B
ON U.SSN = B.User_SSN
Where B.Due_Date < '2022-07-01'


/*
5. Write a query to display book title, author name and display in the
   following format,
   [Book Title] is written by [Author Name].
*/

Select CONCAT(B.Title , ' is written by ' , A.Name) AS [Authors books]
From Books B inner join Authors_books AB
ON B.Book_id = AB.Book_id
Inner Join Authors A
ON AB.Author_id = A.Author_id


/*
6. Write a query to display the name of users who have letter 'A' in their names.
*/

Select Name
From users
Where name like '%A%';


/*
7. Write a query that display user SSN who makes the most borrowing
*/

Select top 1 User_SSN , Count(*) AS [NO_Of_Books_borrowed]
From Users_Borrowed_Books
Group by User_SSN
Order by NO_Of_Books_borrowed desc


/*
8. Write a query that displays the total amount of money that each user paid
   for borrowing books.	
*/

Select User_SSN , Sum(ISNULL(Money_Paid,0)) As [Total_Usser_paid]
From Users_Borrowed_Books
Group by User_SSN


/*
9. write a query that displays the category which has the book that has the
   minimum amount of money for borrowing.
*/

Select distinct C.Cat_name 
From Categories C inner join Books B
ON C.ID = B.Category_id
Where B.Book_id in (Select Book_id 
					From Users_Borrowed_Books 
					Where Money_Paid = (Select MIN(Money_Paid)
										From Users_Borrowed_Books))

-- because there is multiple books with same price 10$ in different categories ,so display all categories with the minimum money_paid = 10


/*
10. write a query that displays the email of an employee if it's not found,
    display address if it's not found, display date of birthday.
*/

SELECT COALESCE(
    Email,
    Address,
    CONVERT(VARCHAR(20), Date_Of_Birth)
)
FROM Employees;


/*
11. Write a query to list the category and number of books in each category
    with the alias name 'Count Of Books'.
*/

Select C.Cat_name , COUNT(B.Book_id) AS [Count Of Books]
From Categories C left Outer join Books B
ON C.ID = B.Category_id
Group by C.Cat_name


/*
12. Write a query that display books id which is not found in floor num = 1 and shelf-code = A1.{
*/

Select B.Book_id
From Books B Inner Join Shelfs S
ON B.Shelf_Code = S.Shelf_Code
Where Not (S.Floor_Number = 1 AND B.Shelf_Code = 'A1');


/*
13. Write a query that displays the floor number , Number of Blocks and number of employees working on that floor. 
*/
	

Select F.Floor_Number , F.Number_Of_Blocks , COUNT(E.Emp_id) AS [Number Of Employees]
From Floors F left join Employees E
ON E.Floor_id = F.Floor_Number
Group by F.Floor_Number , F.Number_Of_Blocks;



/*
14. Display Book Title and User Name to designate Borrowing that occurred
    within the period ‘3/1/2022’ and ‘10/1/2022’.
*/

select B.Title , U.Name
From Users U inner join Users_Borrowed_Books UB
ON U.SSN = UB.User_SSN 
inner join Books B
ON B.Book_id = UB.Book_id
where Date_Borrowed between '2022-03-01' and '2022-10-01'


/*
15. Display Employee Full Name and Name Of his/her Supervisor as
	Supervisor Name.
*/

select CONCAT(E.Fname,' ',E.Lname) AS [Full Name] , CONCAT(S.Fname, ' ', S.Lname) AS [Supervisor Name]
From Employees E Inner join Employees S
ON E.Supervisor = S.Emp_id


/*
16. Select Employee name and his/her salary but if there is no salary display
	Employee bonus.
*/

Select CONCAT(Fname,' ',Lname) AS [Full Name], ISNULL(Salary,Bonus) AS [Salary]
From Employees


/*
17. Display max and min salary for Employees
*/

Select  MAX(Salary) AS [Max Salary] , MIN(Salary) AS [Min Salary]
FROM Employees;


/*
18. Write a function that take Number and display if it is even or odd
*/


Go
Create Function CheckEvenOrOdd (@number int)
returns varchar(10)
AS
Begin 
	Declare @result Varchar(10);

	if @number % 2 = 0
		SET @result = 'Even';
	else
		SET @result = 'Odd';

	Return @result 
End


/*
19. write a function that take category name and display Title of books in that category
*/

Go
Create Function GetBooksTitleByCategory (@CategoryName varchar(50))
Returns Table
AS
Return(
		Select B.Title
		From Books B inner join Categories C
		ON B.Category_id = C.ID
		Where C.Cat_name = @CategoryName)



/*
20. write a function that takes the phone of the user and displays Book Title ,
	user-name, amount of money and due-date.
*/

GO
Create Function GetBorrowingByPhone (@PhoneNumber varchar(11))
Returns table
as
return
(
	select B.Title , U.Name , UB.Money_Paid, UB.Due_Date
	from User_PhoneNumbers UP inner join Users U
	ON UP.SSN = U.SSN
	Inner join Users_Borrowed_Books UB
	ON U.SSN = UB.User_SSN
	Inner join Books B
	ON UB.Book_id = B.Book_id
	Where UP.PhoneNumbers = @PhoneNumber
)



/*
21. Write a function that take user name and check if it's duplicated return Message in the following format
	- ([User Name] is Repeated [Count] times) 
	- if it's not duplicated display msg with this format [username] is not duplicated,
	- if it's not Found Return [User Name] is Not Found
*/


Go
Create  function CheckUserName (@UserName varchar(50))
returns varchar(100)
AS
Begin 
	Declare @count int;
	Declare @result varchar(100);

	select @count = count(*)
	from Users
	where Name = @UserName;

	if @count = 0
		SET @Result = @UserName + ' is Not Found';

    ELSE IF @Count = 1
        SET @Result = @UserName + ' is not duplicated';

    ELSE
        SET @Result = @UserName + ' is Repeated '
                    + CAST(@Count AS VARCHAR(10)) + ' times';

    RETURN @Result;
End;



/*
22. Create a scalar function that takes date and Format to return Date With That Format. 
*/

GO
Create Function FormatDate (@Date date , @format int)
returns Varchar(10)
AS
begin 
	return convert(varchar(10),@Date,@format)
End



/*
23. Create a stored procedure to show the number of books per Category.
*/

Go
Create Procedure GetNumOfBooksperCategory
AS
Begin
	Select C.Cat_name , Count(B.Book_id) AS [Books number]
	From Books B left outer join Categories C
	ON B.Category_id = C.ID
	group by C.Cat_name
End


/*
24. Create a stored procedure that will be used in case there is an old manager
	who has left the floor and a new one becomes his replacement.
	The procedure should take 3 parameters (old Emp.id, new Emp.id and the floor number) 
	and it will be used to update the floor table.
*/

Go
Create Procedure updateFloorManager (
		@OldEmpID int,
		@NewEmpID int,
		@Floornumber int
		)
AS
Begin 
	update Floors
	SET Emp_id = @NewEmpID
	Where Floor_Number = @Floornumber and Emp_id = @OldEmpID
End


/*
25. Create a view AlexAndCairoEmp that displays Employee data for users
	who live in Alex or Cairo.
*/

GO
Create View AlexAndCairoEmp
AS
SELECT *
FROM Employees
WHERE Address IN ('Alex', 'Cairo');



/*
26. create a view "V2" That displays number of books per shelf
*/

Go
Create View V2
AS
	Select Shelf_Code , COUNT(Book_id) As [numbers of books]
	From Books
	Group by Shelf_Code



/*
27. create a view "V3" That display the shelf code that have maximum
	number of books using the previous view "V2"
*/

GO
Create View V3
AS
	Select Shelf_Code , [numbers of books]
	From V2
	Where [numbers of books] = (Select Max([numbers of books])
								From V2)


/*
28. Create a table named ‘ReturnedBooks’ With the Following Structure 
	- then create A trigger that instead of inserting the data of returned book
	- checks if the return date is the due date or not
	- if not so the user must pay a fee and it will be 20% of the amount that was paid before.
*/

-- Create Table

Go
Create table ReturnedBooks(
	User_SSN int,
	Book_id int,
	Due_Date Date,
    Return_Date Date,
    Fees Decimal(10,2),

	Foreign Key (User_SSN) References Users(SSN),
    Foreign Key (Book_Id)  References Books(Book_id)
	);


-- Trigger

Go
Create Trigger CheckDateOFReturnedBooks
ON ReturnedBooks
Instead of Insert
AS
BEGIN
    Insert into ReturnedBooks(
        User_SSN,
        Book_Id,
        Due_Date,
        Return_Date,
        Fees )

    Select I.User_SSN, I.Book_Id, I.Due_Date,I.Return_Date,
        CASE
            WHEN I.Return_Date = I.Due_Date THEN 0
            ELSE UB.Money_Paid * 0.20
        END
    From inserted I Inner Join Users_Borrowed_Books UB
    ON UB.User_SSN = I.User_SSN and UB.Book_Id = I.Book_Id and UB.Due_Date = I.Due_Date;
END;
		


/*
29. In the Floor table insert new Floor With Number of blocks 2,employee with SSN = 20 as a manager for this Floor,The start date for this manager is Now.
	- Do what is required if you know that : 
	- Mr.Omar Amr(SSN=5) moved to be the manager of the new Floor (id = 6), and they give Mr. Ali Mohamed(his SSN =12) His position .
*/


GO
Begin Transaction;
Begin Try

    -- Create the new floor
   Insert into Floors (Floor_Number, Number_Of_Blocks, Emp_id, Hire_Date)
   Values (6, 2, 20, GETDATE());


    -- Omar moves to Floor 6
    Update Floors
    Set Emp_id = 5
    Where Floor_Number = 6;


    -- Ali takes Omar's old position
    Update Floors
    Set Emp_id = 12
    Where Floor_Number = 5;

    Commit TRANSACTION;

End Try

begin Catch

    RollBack Transaction;

End Catch;



/*
30. Create view name (v_2006_check) that will display Manager id, Floor Number where he/she works , Number of Blocks and the Hiring Date
	- which must be from the first of March and the May of December 2022.
	- this view will be used to insert data so make sure that the coming new data must match the condition 
	- then try to insert this 2 rows and Mention What will happen
*/


Go
Create View v_2006_check
AS
	
	Select Emp_id, Floor_Number, Number_Of_Blocks, Hire_Date
	From Floors
	Where Hire_Date Between '2022-03-01' and '2022-12-01'
	With Check Option;



/*
31. Create a trigger to prevent anyone from Modifying or Delete or Insert in the Employee table
	( Display a message for user to tell him that he can’t take any action with this Table)
*/


Go
Create Trigger PreventChangeByEmp
ON Employees 
Instead of Insert, update ,Delete 
AS
begin
	Print 'You can’t take any action with this Table';
End



/*
32. Testing Referential Integrity , Mention What Will Happen When:
	A. Add a new User Phone Number with User_SSN = 50 in User_Phones Table 
	B. Modify the employee id 20 in the employee table to 21 
	C. Delete the employee with id 1
	D. Delete the employee with id 12 
	E. Create an index on column (Salary) that allows you to cluster the data in table Employee. 
*/


-- (A.)  Add a new User Phone Number with User_SSN = 50 in User_Phones Table 

Insert into User_PhoneNumbers
Values (50, '01000000000');

-- Answer: It will fail because the SSN 50 didn't exists in the users table



-- (B.) Modify the employee id 20 in the employee table to 21 
 
Update Employees
Set Emp_id = 21
Where Emp_id = 20;

-- Answer:  It will fail because the Emp_id = 20 used as a foreign key in other tables


-- (C.)  Delete the employee with id 1

Delete from Employees
Where Emp_id = 1;

-- Answer: It will fail because the Emp_id = 1 used as a foreign key in other tables


-- (D.) Delete the employee with id 12 

Delete From Employees
Where Emp_id = 12;

-- Answer: It will fail because the Emp_id = 12 used as a foreign key in other tables


-- (E.) Create an index on column (Salary) that allows you to cluster the data in table Employee. 

Create Clustered Index IX_Employees_Salary
ON Employees(Salary);

-- Answer: it will get an error message cause the primary key of the Employees table is a clustered index by defult and a table can't have more than one clustered index



/*
33. Try to Create Login With Your Name And give yourself access Only to Employee and Floor tables 
	then allow this login to select and insert data into tables and deny Delete and update 
	(Don't Forget To take screenshot to every step)
*/
