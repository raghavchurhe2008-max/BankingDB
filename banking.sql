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
