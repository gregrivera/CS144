-- Parth and Greg Proj 2 create.sql


-- Create the Items Table
CREATE TABLE Items
(ItemID    INT,
 Name      VARCHAR(80),
 Buy_Price INT,
 First_Bid INT,
 Started   TIMESTAMP,
 Ends      TIMESTAMP,
 
 PRIMARY KEY(ItemID)
 );


-- Create the Users Table
CREATE TABLE Users
(UserID     VARCHAR(80),
 Rating     INT,
 LocationID INT,
 CountryID  INT,
 Location   VARCHAR(80),
 
 PRIMARY KEY(UserID)
 );
 
 
-- Create the Location Table
CREATE TABLE Location
(LocationID INT,
 CountryID  INT,
 Location   VARCHAR(80)
 
 PRIMARY KEY(LocationID)
 );
 
 
-- Create the Country Table
CREATE TABLE Country
(CountryID INT,
 Country   VARCHAR(80),
 
 PRIMARY KEY(CountryID)
 );
 
 
-- Create the Category Table
CREATE TABLE Category
(CategoryID INT,
 Category   VARCHAR(80)
 
 PRIMARY KEY(CategoryID)
 );
 
 
-- Create the Item_Category Table
CREATE TABLE Item_Category
(ItemID     INT,
 CategoryID INT,
 
 PRIMARY KEY(ItemID)
 );
 

-- Create the Bids Table
CREATE TABLE Bids
(BidID  INT,
 UserID VARCHAR(80),
 ItemID INT,
 Amount INT,
 
 PRIMARY KEY(BidID)
 );
 
 
-- Create the Item_Seller table
CREATE TABLE Item_Seller
(ItemID INT,
 UserID VARCHAR(80),
 
 PRIMARY KEY(ItemID)
 );
 
 
-- End











