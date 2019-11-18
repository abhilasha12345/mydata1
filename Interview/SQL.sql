CREATE DATABASE databasename;
CREATE DATABASE testDB;

DROP DATABASE databasename;
DROP DATABASE testDB;
--------------------------------------------------------------------------------------------------
The SQL BACKUP DATABASE Statement
The BACKUP DATABASE statement is used in SQL Server to create a full back up of an existing SQL database.

Syntax
BACKUP DATABASE databasename
TO DISK = 'filepath';

The SQL BACKUP WITH DIFFERENTIAL Statement
A differential back up only backs up the parts of the database that have changed since the last full database backup.

Syntax
BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;

Example
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak';

Example
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL;

Tip: A differential back up reduces the back up time (since only the changes are backed up).

--------------------------------------------------------------------------------------------------
The SQL CREATE TABLE Statement
The CREATE TABLE statement is used to create a new table in a database.
Syntax

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

Create Table Using Another Table
A copy of an existing table can also be created using CREATE TABLE.

The new table gets the same column definitions. All columns or specific columns can be selected.

If you create a new table using an existing table, the new table will be filled with the existing values from the old table.

Syntax
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;
The following SQL creates a new table called "TestTables" (which is a copy of the "Customers" table): 

Example
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;
--------------------------------------------------------------------------------------------------
The SQL DROP TABLE Statement
The DROP TABLE statement is used to drop an existing table in a database.

Syntax
DROP TABLE table_name;

DROP TABLE Shippers;

SQL TRUNCATE TABLE
The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.

Syntax
TRUNCATE TABLE table_name;
--------------------------------------------------------------------------------------------------
SQL ALTER TABLE Statement
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

ALTER TABLE - ADD Column
To add a column in a table, use the following syntax:

ALTER TABLE table_name
ADD column_name datatype;
The following SQL adds an "Email" column to the "Customers" table:

Example
ALTER TABLE Customers
ADD Email varchar(255);
ALTER TABLE - DROP COLUMN
To delete a column in a table, use the following syntax (notice that some database systems donot allow deleting a column):

ALTER TABLE table_name
DROP COLUMN column_name;
The following SQL deletes the "Email" column from the "Customers" table:

Example
ALTER TABLE Customers
DROP COLUMN Email;


MODIFY KEYWORD
 

The MODIFY Keyword allows you to-
	Modify Column Data Type
	Modify Column Constraints


ALTER TABLE - MODIFY COLUMN
To change the data type of a column in a table, use the following syntax:

ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

ALTER TABLE Persons
ADD DateOfBirth date;

ALTER TABLE Persons
MODIFY COLUMN DateOfBirth year;

https://www.guru99.com/alter-drop-rename.html
AFTER KEYWORD
Suppose that we want to add a new column at a specific position in the  table.

We can use the alter command together with the AFTER keyword.
The script below adds "date_of_registration" just after the date of birth in the members table.

ALTER TABLE  `members` ADD  `date_of_registration` date NULL AFTER  `date_of_birth`;


CHANGE KEYWORD
Change Keywords allows you to-
	Change Name of Column
	Change Column Data Type
	Change Column Constraints
	
Suppose we want to

Change the field name from "full_names" to "fullname"
Change it to char data type with a width of 250
Add a NOT NULL constraint
 We can accomplish this using the change command as follows -

ALTER TABLE `members` CHANGE COLUMN `full_names` `fullname` char(250) NOT NULL;	
--------------------------------------------------------------------------------------------------
RENAME TABLE `current_table_name` TO `new_table_name`;

SHOW COLUMNS FROM `members`;
--------------------------------------------------------------------------------------------------
SQL JOIN
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
--------------------------------------------------------------------------------------------------
SQL LEFT JOIN Keyword
The LEFT JOIN keyword returns all records from the left table (table1), and the matched records from the right table (table2). The result is NULL from the right side, if there is no match.

LEFT JOIN Syntax
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
Note: In some databases LEFT JOIN is called LEFT OUTER JOIN.

Example
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
Note: The LEFT JOIN keyword returns all records from the left table (Customers), even if there are no matches in the right table (Orders).
--------------------------------------------------------------------------------------------------
SQL RIGHT JOIN Keyword
The RIGHT JOIN keyword returns all records from the right table (table2), and the matched records from the left table (table1). The result is NULL from the left side, when there is no match.

RIGHT JOIN Syntax
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
Note: In some databases RIGHT JOIN is called RIGHT OUTER JOIN.

Example
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
Note: The RIGHT JOIN keyword returns all records from the right table (Employees), even if there are no matches in the left table (Orders).


--------------------------------------------------------------------------------------------------
SQL FULL OUTER JOIN Keyword
The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

Note: FULL OUTER JOIN can potentially return very large result-sets!

Tip: FULL OUTER JOIN and FULL JOIN are the same.

FULL OUTER JOIN Syntax
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

Note: The FULL OUTER JOIN keyword returns all matching records from both tables whether the other table matches or not. So, if there are rows in "Customers" that do not have matches in "Orders", or if there are rows in "Orders" that do not have matches in "Customers", those rows will be listed as well.
--------------------------------------------------------------------------------------------------
SQL INNER JOIN Keyword
The INNER JOIN keyword selects records that have matching values in both tables.

INNER JOIN Syntax
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

Example
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
Note: The INNER JOIN keyword selects all rows from both tables as long as there is a match between the columns. If there are records in the "Orders" table that do not have matches in "Customers", these orders will not be shown!

JOIN Three Tables
The following SQL statement selects all orders with customer and shipper information:

Example
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);
--------------------------------------------------------------------------------------------------
SQL Self JOIN
A self JOIN is a regular join, but the table is joined with itself.

Self JOIN Syntax
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;
T1 and T2 are different table aliases for the same table.

Example
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;
--------------------------------------------------------------------------------------------------
The SQL UNION Operator
The UNION operator is used to combine the result-set of two or more SELECT statements.

Each SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in each SELECT statement must also be in the same order

UNION Syntax
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;


UNION ALL Syntax
The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;
Note: The column names in the result-set are usually equal to the column names in the first SELECT statement in the UNION.


Example
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

Example
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

Example
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

Example
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

Example
SELECT 'Customer' As Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;
--------------------------------------------------------------------------------------------------
https://www.tutorialspoint.com/sql/sql-date-functions.htm#function_adddate

SQL - Date Functions

DATE_ADD,ADDDATE

SELECT DATE_ADD('1998-01-02', INTERVAL 31 DAY);
SELECT ADDDATE('1998-01-02', INTERVAL 31 DAY);
SELECT ADDDATE('1998-01-02', 31);// interval 31 days

DATEDIFF(expr1,expr2)
SELECT DATEDIFF('1997-12-31 23:59:59','1997-12-30');
---------------------------------------------------------------------------------------------------
https://www.geeksforgeeks.org/sql-indexes/
SQL indexes

An index is a schema object. It is used by the server to speed up the retrieval of rows by using a pointer. It can reduce disk I/O(input/output) by using a rapid path access method to locate data quickly. An index helps to speed up select queries and where clauses, but it slows down data input, with the update and the insert statements. Indexes can be created or dropped with no effect on the data.

For example, if you want to reference all pages in a book that discusses a certain topic, you first refer to the index, which lists all the topics alphabetically and is then referred to one or more specific page numbers.

syntax
create INDEX index_name on table_name column_name

create INDEX index_name on table_name (column1,clumn2...)     //multiple columns

Unique Indexes 
CREATE UNIQUE INDEX index_name  ON table_name column_name;

Removing an Index – To remove an index from the data dictionary by using the DROP INDEX command.

DROP INDEX index_name;
---------------------------------------------------------------------------
SQL CASE Statement

The CASE statement goes through conditions and returns a value when the first condition is met (like an IF-THEN-ELSE statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.

If there is no ELSE part and no conditions are true, it returns NULL.

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

Example
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN "The quantity is greater than 30"
    WHEN Quantity = 30 THEN "The quantity is 30"
    ELSE "The quantity is under 30"
END AS QuantityText
FROM OrderDetails;

Example
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

---------------------------------------------------------------------------
SQL NULL Functions

The MySQL IFNULL() function lets you return an alternative value if an expression is NULL:

SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products;

---------------------------------------------------------------------------
What is a Stored Procedure?
A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

Syntax
CREATE PROCEDURE procedure_name
AS
sql_statement
GO;

Execute a Stored Procedure
EXEC procedure_name;

example
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

EXEC SelectAllCustomers;

Example
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;
Execute the stored procedure above as follows:

Example
EXEC SelectAllCustomers @City = "London";


Example
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;
Execute the stored procedure above as follows:

Example
EXEC SelectAllCustomers @City = "London", @PostalCode = "WA1 1DP";
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------

https://www.geeksforgeeks.org/mysql-des_encrypt-function/
