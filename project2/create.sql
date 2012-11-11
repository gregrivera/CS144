-- Parth and Greg 
-- Proj 2 create.sql


-- Items Table
CREATE TABLE IF NOT EXISTS Items
(ItemID      INT(11) NOT NULL,
 UserID	     VARCHAR(100) NOT NULL,
 Name        VARCHAR(100) NOT NULL,
 Buy_Price   DECIMAL(8,2) NOT NULL,
 First_Bid   DECIMAL(8,2) NOT NULL,
 Started     TIMESTAMP NOT NULL,
 Ends        TIMESTAMP NOT NULL,
 Description VARCHAR(4000) NOT NULL,
 
 PRIMARY KEY(ItemID)
 );

-- Users Table
CREATE TABLE IF NOT EXISTS Users
(UserID     VARCHAR(100) NOT NULL,
 Rating     INT(11) NOT NULL,
 Location 	VARCHAR(100) NOT NULL,
 Country  	VARCHAR(100) NOT NULL,
 
 PRIMARY KEY(UserID)
 );
 
-- Create the Item_Category Table
CREATE TABLE IF NOT EXISTS Item_Category
(ItemID   INT(11) NOT NULL,
 Category VARCHAR(100) NOT NULL
 
 );
 
-- Create the Bids Table
CREATE TABLE IF NOT EXISTS Bids
(BidID  INT(11) NOT NULL AUTO_INCREMENT,
 UserID VARCHAR(100) NOT NULL,
 ItemID INT(11) NOT NULL,
 Time timestamp NOT NULL,
 Amount DECIMAL(8,2) NOT NULL,
 
 PRIMARY KEY(BidID)
 );
 
-- End











