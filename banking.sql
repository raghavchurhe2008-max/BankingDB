use bankingDB;
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(15),
AccountCreationDate DATE
);

describe customers;
select * from customers;

CREATE TABLE Accounts (
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

desc Accounts;

create table Transactions (
TransactionID int,
TransactionDate date,
Amount decimal(10,2),
TransactionType varchar(20)
);
desc Transactions;

create table Branches (
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);

create table AccountBranches (
AssignmentDate date
);

create table Loans (
LoanID int,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
StartDate date,
EndDate date
);
desc Loans;

alter table Customers
add DateOfBirth date;
desc Customers;

alter table Customers
modify Phone varchar(20);
desc Customers;
alter table Accounts
add constraint chk_MinBalance
check (Balance >= 1000);

drop table accountbranches;

alter table Accounts
add CustomerID int;

alter table Accounts
add constraint FK_Accounts_Customers
foreign key (customerID)
references Customers(CustomerID);
desc Accounts;

alter table Accounts
add constraint 
primary key (AccountID);

alter table Customers
modify FirstName varchar(50) not null;
desc customers;

alter table Customers
add constraint uq_Email unique (Email);
desc customers;

alter table branches
add constraint
primary key (BranchID);

desc branches;

alter table Accounts
add BranchID int;

alter table Accounts
add constraint 
foreign key (BranchID)
references Branches(BranchID);
desc Accounts;
 
 desc transactions;
 alter table transactions
 add constraint PK_Transactions
 primary key (TransactionID);
 
alter table transactions
add AccountID int;

alter table transactions
add constraint 
foreign key (AccountID)
references accounts(AccountID);
desc transactions;

alter table loans
add constraint PK_Loans
primary key (LoanID);

alter table loans
add CustomerID int;

alter table loans
add constraint
foreign key (CustomerID)
references customers(CustomerID);
desc loans;

select
	constraint_name,
    constraint_type
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingDB'
  And TABLE_NAME = 'Acconts';
  
  insert into Customers
   (CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
   values
   (101,'Raghav','Churhe','raghavchurhe2008@gmail.com','7264832310','2008-05-18');
   select * from customers;
   
   insert into accounts
   (AccountID, CustomerID, AccountType, Balance)
   Values
   (201,101,'Savings',25000);
    select * from accounts;
    
    insert into Customers
   values
   (102,'Rehan','Churhe','rehanchurhe2008@gmail.com','7498107136','2026-08-04','2008-05-18');
   
    insert into Customers
   (CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
   values
   (103,'Aditya','Gaidhane','adityagaidhane@gmail.com','9876512345','2026-01-07','2004-07-18'),
   (104,'Shri','Jha','shrijha@gmail.com','7689745678','2025-11-23','2005-07-11');
   
   update customers
   set AccountCreationDate = '2025-06-29'
   where CustomerID = 101;
      select * from customers;


insert into branches
values
(901,"Dharampeth","Ramdaspeth,Nagpur","9865235894"),
(902,"Laxminagar","Ajni,Nagpur","8765298631"),
(903,"Ganeshpeth","GAneshpeth,Nagpur","909697382");

update accounts set branchID = 901
where AccountID= 201;

insert into accounts
(AccountID,AccountType,Balance,CustomerID,BranchID)
values(202,"current",15700,102,902),
(203,"saving",12300,103,903);

select * from accounts;

insert into transactions
values
(501,"2026-07-22","5000","UPI",201),
(502,"2026-07-18","10000","RTGS",202),
(503,"2026-07-09","12000","CASH",203);

select * from transactions;

insert into loans
values
(701,"2000","5","2022-05-22","2022-08-03",101),
(702,"5000","10","2025-05-13","2025-09-23",102),
(703,"6000","7","2026-03-15","2026-07-03",103);
select * from loans;

insert into customers
values 
(105,'Karishma','Patode','karishmapatode@gmail.com','7507884705','2024-06-22','2008-11-15'),
(106,'Vidhi','Churhe','vidhichurhe2005@gmail.com','7410735042','2024-09-12','2005-08-27');
select * from accounts;

insert into branches
values
(904,'CO.OP.Soundad','Soundad,Gondia','6548698654'),
(905,'Bank of Maharashtra Soundad','Soundad,Gondia','4569778564'),
(906,'SBI Soundad','Soundad,Gondia','4569778664');

insert into accounts
values
(204,'saving','17000','104','904'),
(205,'current','21000','105','905'),
(206,'current','8500','106','906');

insert into transactions
values
(504,"2025-12-27","11500","UPI",204),
(505,"2026-05-18","7000","UPI",205),
(506,"2025-12-14","1500","CASH",206);
select * from transactions;

insert into loans
values
(704,"15000","6","2023-06-12","2024-02-09",104),
(705,"23000","114","2025-04-16","2025-11-13",105),
(706,"8000","9","2026-01-09","2026-09-14",106);
select * from loans;

update accounts set balance = 60000
where accountid = 201;

update accounts set balance = balance + 5000
where accountid = 202;

select * from customers;

update customers set Email = "Raghavchurhe2008@gmail.com", phone = "7893549665"
where CustomerID = 101;

select customerid, firstname, lastname, phone
from customers;

select * from accounts
where AccountType = 'Savings';

update accounts set accounttype = 'Savings' 
where accountid = 203;

update accounts set accounttype = 'Savings' 
where accountid = 204;

update accounts set accounttype = 'Current' 
where accountid = 202;

update accounts set accounttype = 'Current' 
where accountid = 205;

update accounts set accounttype = 'Current' 
where accountid = 206;

select * from accounts 
where Balance > 2000;
select * from accounts
where AccountType != 'Savings' and Balance > 2000;

select * From customers
where AccountCreationDate > "2026-07-01";

select * from customers
where Phone in ('7893549665','7507884705','9876512345');

select * from customers
where Phone='7893549665' or Phone='7507884705' or Phone='9876512345';

select * from accounts
where Balance between 10000 and 30000;

select * from accounts
where Balance >= 10000 and Balance <= 30000;

-- Like Operator
-- Find all customers whose first name start with letter "K"
select * from customers
where FirstName like 'K%';

-- Find all customers whose last name ends with letter "K"
select * from customers
where LastName like '%e';

-- "%" matcher any number of char and even 0 characters and "_" matches exactly one charachers
-- Find all customers whose last name has exactly 3 characters;
select * from customers
where LastName like "______";

-- Order by clause
-- Sort the accounts table according to customers balance.
select CustomerID,balance
from accounts
order by balance;

-- Sort the branches table according to branch name.
select BranchID,BranchName
from branches
order by BranchName;

-- Sort the accounts table according to customers balance.
-- from highest to lowest balance amount.
select CustomerID,Balance
from accounts
order by balance desc;

-- Sort according to multiple columns.
-- Sort accounts table according to the accounttype and balance. 
select AccountID,AccountType,Balance,CustomerID
from Accounts
Order by AccountType DESC, Balance DESC;

-- distinct clause
-- Find distinct (unique) account type from accounts table
select distinct AccountType from Accounts;

-- Find distinct (unique) transaction type and accountID from transactions table
select distinct transactiontype,accountid from transactions;

select * from customers
limit 2 offset 2;

select * from transactions
limit 3 offset 1;

select * from loans
limit 4 offset 1;

select * from accounts
order by Balance desc limit 2;

select * from accounts
order by balance DESC
limit 1 offset 2;

select * from accounts
order by balance DESC
limit 2,1;  -- Here 2 specifies the rows to skip and 1 specifies the number

insert into customers
(CustomerID, FirstName, LastName, Email, AccountCreationDate, DateOfBirth)
values
(107, 'Awni', 'Raksiya', 'awniraksiya@gmail.com', '2025-11-24', '2009-01-20'),
(108, 'Chaitanya', 'Neware', 'chaitanyaneware@gmail.com', '2024-07-12', '2007-10-26'),
(109, 'Shrishant', 'Khobragade', 'shrishantkhobragade@gmail.com', '2024-07-12', '2008-10-14'),
(110, 'Jatin', 'Nimbekar', 'jatinnimbekar28@gmail.com', '2024-07-13', '2008-04-28');

select * from customers;

delete from customers where CustomerID = 107;
delete from customers where CustomerID = 108;
delete from customers where CustomerID = 109;
delete from customers where CustomerID = 110;

select * from customers
where Phone IS NULL;
select * from accounts;

insert into accounts
(AccountID, AccountType, Balance, CustomerID, BranchID)
values
(207, 'Current', '14000', '107', '902'),
(208, 'Current', '18700', '108', '904'),
(209, 'Savings', '35000', '109', '906'),
(210, 'Savings', '43000', '110', '901');

select * from transactions;
select * from loans;
select * from branches;

insert into transactions
(TransactionID, TransactionDate, Amount, TransactionType, AccountID)
values
(507, '2026-02-22', '50000', 'RTGS', '207'),
(508, '2026-05-07', '14000', 'UPI', '208'),
(509, '2026-06-27', '5000', 'CASH', '209'),
(510, '2026-04-29', '23000', 'RTGS', '210');

insert into loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
values
(707, '25000', '13', '2025-12-30', '2026-05-18', '108'),
(708, '20000', '9', '2026-01-25', '2026-06-09', '110');

-- If my balance value is <50000 else low value customers
 
 select AccountID, AccountType, Balance,
 case 
	when Balance>= 20000 then " High Value Customers"
    else "Low Value Customers"
 end as CustomerCategory
 from accounts;
 
 
SELECT CustomerID, FirstName, Email
FROM Customers
WHERE AccountCreationDate > '2025-01-01';

select * from accounts
where AccountType = 'Savings' and Balance > '20000';

select * from customers
where Phone IS NOT NULL;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT * FROM Customers
WHERE FirstName LIKE 'R%';

select * from accounts
where Balance >= 20000 AND Balance <= 60000;

SELECT * FROM Transactions
WHERE TransactionType = 'Deposit' AND Amount > 3000;

SELECT * FROM Customers
WHERE CustomerID IN (101, 103, 106, 109);

SELECT * FROM Customers
ORDER BY CustomerID LIMIT 5; 

SELECT * FROM Customers
LIMIT 10 OFFSET 3;

SELECT * FROM Accounts
WHERE AccountType = 'Savings' AND Balance BETWEEN 20000 AND 80000;

SELECT FirstName, LastName
FROM Customers
WHERE Phone IS NULL 
AND AccountCreationDate > '2025-01-01';

SELECT * FROM Customers
WHERE FirstName LIKE 'A%'
OR LastName LIKE 'S%';

SELECT *
FROM Accounts
WHERE AccountType = 'Savings' OR AccountType = 'Salary'
AND Balance > 10000;

SELECT * FROM Customers
WHERE CustomerID IN (101, 102, 105, 109)
AND Phone IS NOT NULL;

SELECT * FROM Transactions
WHERE Amount BETWEEN 2000 AND 8000
AND TransactionType = 'Deposit';

SELECT DISTINCT BranchID
FROM Accounts
WHERE Balance > 30000;

SELECT * FROM Customers
WHERE Email LIKE '%gmail%' AND FirstName LIKE '%a';

SELECT * FROM Customers
WHERE DateOfBirth BETWEEN '1995-01-01' AND '2000-12-31';

SELECT * FROM Accounts
WHERE AccountType = 'Savings'
AND Balance > 25000 ORDER BY AccountID LIMIT 3;

SELECT * FROM Customers
WHERE FirstName LIKE 'P%'
AND Phone IS NULL;

SELECT * FROM Accounts
WHERE Balance NOT BETWEEN 20000 AND 50000;

SELECT * FROM Customers
WHERE CustomerID NOT IN (101, 102, 103);

SELECT * FROM Transactions
WHERE TransactionType = 'Withdrawal'
AND Amount < 5000;

SELECT * FROM Customers
WHERE Email LIKE '%gmail.com'
AND Phone IS NOT NULL;

SELECT DISTINCT TransactionType FROM Transactions
WHERE Amount > 5000;

SELECT * FROM Accounts
WHERE AccountType = 'Savings'
AND (BranchID = 1 OR BranchID = 3);

SELECT * FROM Customers
WHERE FirstName LIKE '%ha%'
AND DateOfBirth > '1997-12-31';

SELECT * FROM Accounts
WHERE Balance > 30000 AND Balance < 80000;

SELECT * FROM Transactions
WHERE TransactionType = 'Deposit'
ORDER BY TransactionID LIMIT 4 OFFSET 2;

SELECT FirstName, LastName FROM Customers
WHERE Phone IS NULL
OR Email LIKE 's%';

SELECT * FROM Accounts
WHERE AccountType = 'Savings'
AND Balance > 10000 AND BranchID = 1;

SELECT * FROM Accounts
WHERE AccountType = 'Current'
AND Balance BETWEEN 40000 AND 100000;

SELECT * FROM Customers
WHERE LastName LIKE 'S%'
AND AccountCreationDate > '2024-12-31';

SELECT * FROM Transactions
WHERE Amount IN (2000, 3000, 5000, 7000);

SELECT * FROM Customers
WHERE (FirstName LIKE 'R%' OR FirstName LIKE 'P%')
AND Phone IS NOT NULL
AND CustomerID > 103;

SELECT DISTINCT Balance
FROM Accounts
WHERE Balance > 15000;

SELECT * FROM Accounts
WHERE AccountType <> 'Savings'
AND Balance > 25000;

SELECT * FROM Customers
WHERE Email LIKE '%gmail%' 
AND Phone IS NULL;

SELECT * FROM Accounts
WHERE Balance BETWEEN 15000 AND 90000
AND AccountType <> 'Salary';

SELECT * FROM Customers
WHERE (FirstName LIKE 'A%' OR FirstName LIKE 'R%')
ORDER BY CustomerID LIMIT 5;

SELECT * FROM Accounts
WHERE AccountType IN ('Savings', 'Salary')
AND Balance > 15000
AND Balance < 60000;

SELECT * FROM Customers
WHERE CustomerID IN (101, 103, 105, 107, 109)
AND DateOfBirth BETWEEN '1994-01-01' AND '2000-12-31';

SELECT * FROM Transactions
WHERE Amount > 2000
AND Amount < 8000
AND TransactionType <> 'Withdrawal';

SELECT * FROM Customers
WHERE Phone IS NULL
OR FirstName LIKE '%an%';

SELECT DISTINCT AccountType FROM Accounts
WHERE Balance > 20000;

SELECT * FROM Customers
LIMIT 4 OFFSET 2;

SELECT * FROM Customers
WHERE LastName LIKE '%kar'
AND Email LIKE '%gmail%';

SELECT * FROM Accounts
WHERE BranchID IN (1, 2)
AND Balance BETWEEN 20000 AND 70000;

SELECT * FROM Customers
WHERE FirstName LIKE 'S%'
AND Phone IS NOT NULL
AND AccountCreationDate BETWEEN '2025-01-01' AND '2025-12-31';

-- Categorize the RTGS in the transactions table as per conditions given
-- If above 10000(included) high amount
-- If 5000(included) to 10000 medium amount
-- If upto 5000 low amount
-- For other transactions type "Not applicable"

select * ,
 case 
	when TransactionType = "RTGS" and Amount >= 10000 then "High amount"
    when TransactionType = "RTGS" and Amount >=5000 then "Medium amount"
    when TransactionType = "RTGS" and Amount <5000 then "Low amount"
    else "Not appicable" 
 end as Transaction_Category
 from transactions;
 
 
 select * from transactions;
 select * from customers;

select CustomerID, upper(FirstName), upper(LastName) from customers;
select CustomerID, lower(FirstName), lower(LastName) from customers;

select LastName, length(lastname) from customers;

select length("NAGPUR") AS Characters; -- Gives output in number of bytes 
select length("नागपुर"); -- Gives output in number of bytes
select char_length("NAGPUR"); -- Gives output in number of Characters
select char_length("नागपुर"); -- Gives output in number of Characters

select concat("Hero"," ","Honda") as VehicleName;

select CustomerID,concat(FirstName," ",LastName) as FullName, Phone
from customers;

select substring("Hello World",1,5);

select CustomerID, concat(Substring(FirstName,1,1),".",LastName) as FullName from customers;

-- Trim() function
select length("  Hello World  ");
select length(trim("  Hello World  "));
select length(trim(substring("Hello World",6)));

-- Replace function (str,from_str,to_str)
select replace("Mat","M","C"); -- Returns the string str with all occurrences of the string from_str replaced by the string to_str. REPLACE() performs a case-sensitive match when searching for from_str.
select replace("Mat mat Mat","M","C");

-- Avg function
select avg(Balance) from accounts
where AccountType = "Savings";
-- Round function
select round(avg(Balance),2) from accounts
where AccountType = "Savings";

-- Ceil function
select ceil(avg(Balance)) from accounts
where AccountType = "Savings";

-- Floor function
select floor(avg(Amount)) from transactions;

-- Absolute function.... (It removes the sign)
select abs(-3656);
select abs(-1.34);
select abs(6.646);

-- MOD value
select mod(7,3);
select mod(3,7);

-- Power()
SELECT POW(2,3);
SELECT POW(1.5,3);

-- SQRT()
SELECT SQRT(16);

-- Date function 
-- Now Function -- return the current date and time
select now();    -- return date and time
select curdate();   -- return current date
select curtime();	-- return cur time

-- YEAR() MONTH() DAY()
select year(dateofbirth),month(dateofbirth),day(dateofbirth) from customers;

-- Datediff () function  -- it return thee number dayss between two dates
select concat(FirstName," ",LastName) as Fullname, DateOfBirth,
floor(datediff(curdate(),DateOfBirth)/365) as Current_Age from customers;

-- Date_add function
select concat(Firstname," ",Lastname) as Fullname,
AccountCreationDate,
DATE_ADD(AccountCreationDate,INTERVAL 1 YEAR) as KYC_Update from customers;


-- Aggregates
-- Count function
select * from customers;
select count(*) as TotalCustomers from customers;
select count(Phone) as TotalCustomers from customers;

-- Sum function
select * from accounts;
select sum(Balance) as TotalBalance from accounts;
select sum(Balance) as SavingsBalance from accounts where AccountType = 'Savings';
select sum(Balance) as CurrentBalance from accounts where AccountType = 'Current';

-- AVG function
select * from transactions;
select avg(Amount) as AverageTransactionAmount from transactions;
select avg(Amount) as Average_UPI_Transaction_Amount from transactions where TransactionType = 'UPI';
select avg(Amount) as Average_RTGS_Transaction_Amount from transactions where TransactionType = 'RTGS';
select avg(Amount) as Average_CASH_Transaction_Amount from transactions where TransactionType = 'CASH';

-- MAX() and MIN() function
-- Find maximum and minimum balance available in savings account
select * from accounts;
select max(Balance) as Maximum_Balance from accounts where AccountType = 'savings';
select min(Balance) as Minimum_Balance from accounts where AccountType = 'savings';


-- Group by
select * from transactions;
select transactionType, sum(amount) from transactions
group by (TransactionType);

select * from accounts;
SELECT  AccountType,
    COUNT(*) AS TotalAccounts,
    SUM(Balance) AS TotalBalance,
    AVG(Balance) AS AvgBalance
FROM accounts
GROUP BY AccountType;


-- find total accounts for branch and account type.

select * from accounts;
select BranchID, AccountType, count(*)
from accounts
group by BranchID, AccountType
order by BranchID;


-- Having clause
select BranchID, AccountType, count(*) as NoOfAccounts
from accounts
group by BranchID, AccountType
having NoOfAccounts >=2 and AccountType = "Savings";


-- Find number of customers accunt create according to year
SELECT YEAR(AccountCreationDate) AS Years, COUNT(*) AS AccountsOpened
FROM Customers
GROUP BY YEAR(AccountCreationDate);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

select * from customers;

-- Inner Join
-- Find all customers having loans with their Names, InterestRate and loan amount.
SELECT c.CustomerID ,c.FirstName, c.LastName, l.InterestRate, l.LoanAmount
FROM customers c
INNER JOIN loans l
ON c.CustomerID = l.CustomerID;

-- Find the branch names for all the accountid'savepoint
-- Include accountID, accounttype and branchname, branchaddress
select a.AccountID, a.AccountType, b.BranchName, b.BranchAddress
from accounts a
inner join Branches b
on a.BranchID = b.branchid
where AccountType = "Savings";

-- Find all the customers (name, phone, transactiontype, balance) where accounttype is deposit.
select c.FirstName, c.LastName, c.Phone, a.Accounttype, a.Balance
from customers c
inner join accounts a
on c.CustomerID = a.CustomerID
where accounttype = "Savings";

