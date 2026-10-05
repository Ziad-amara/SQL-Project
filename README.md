# SQL Project

A SQL Server database project for a library management system designed to manage employees, floors, users, books, authors, borrowing records, and library operations.

## Overview

This project includes:
- Database schema creation
- Table definitions and foreign key relationships
- Data insertion for employees, users, floors, books, authors, and borrowing records
- Query examples for reporting and data retrieval
- SQL functions, stored procedures, and views
- Triggers for validation and restrictions
- Referential integrity and security scenarios

## Database Structure

The project contains the following core tables:

- Employees
- Floors
- Users
- User_PhoneNumbers
- Publishers
- Categories
- Shelfs
- Books
- Authors
- Authors_books
- Users_Borrowed_Books
- ReturnedBooks

## Main Features

### 1. Employee and Floor Management
- Employees have supervisors and are assigned to floors.
- Floors contain information such as number of blocks and manager assignment.
- Floor manager updates are handled through a stored procedure.

### 2. User Management
- Users are linked to employees and can have multiple phone numbers.
- User borrowing information is tracked through the borrowing table.

### 3. Library Catalog
- Books are categorized and linked to publishers and shelves.
- Authors and books are related through a many-to-many mapping.
- Books are organized by floor and shelf codes.

### 4. Borrowing Records
- Users borrow books with dates, due dates, and amounts paid.
- Borrowing records support reporting on late returns and payments.

### 5. SQL Queries
The script includes queries for:
- Full-name filtering
- Counting books by category and publisher
- Displaying borrowings before a specific date
- Showing author-book relationships
- Finding users with names containing a letter
- Identifying the most active borrower
- Summarizing user payments
- Finding the category with the minimum borrowed cost
- Listing books by shelf and floor
- Displaying employee-supervisor relationships
- Aggregate reporting across categories and floors

### 6. Functions
The project includes SQL functions such as:
- CheckEvenOrOdd
- GetBooksTitleByCategory
- GetBorrowingByPhone
- CheckUserName
- FormatDate

### 7. Stored Procedures and Views
Included examples:
- GetNumOfBooksperCategory
- updateFloorManager
- AlexAndCairoEmp
- V2
- V3
- v_2006_check

### 8. Triggers
The project demonstrates:
- Instead-of-insert trigger for returned books and fee calculation
- Trigger preventing changes to the Employees table

## Example of How to Use

1. Open the SQL script in SQL Server Management Studio (SSMS) or Azure Data Studio.
2. Execute the script to create the database and tables.
3. Review the inserted records.
4. Run the queries, functions, procedures, and views as needed.

## Notes

This project is designed as an academic/learning database and demonstrates many SQL concepts, including:
- DDL and DML
- Primary and foreign keys
- Joins and subqueries
- Aggregations and grouping
- Scalar and table-valued functions
- Stored procedures
- Views with check options
- Triggers and referential integrity checks
- Basic database security concepts

## Database Type

This script is written for Microsoft SQL Server (T-SQL).

## File

- project.sql — full SQL schema, seed data, and query examples

## License

This project is intended for educational use.
