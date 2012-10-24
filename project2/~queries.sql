-- greg and parth queries.sql


--Find the number of users in the database
SELECT COUNT(UserID)
FROM Users;


--Find the number of sellers from New York
SELECT COUNT(UserID)
FROM Item_Seller, Location
WHERE Location = 'New York';


--Find the number of auctions belonging to exactly four categories
SELECT COUNT(ItemID)
FROM  
WHERE


--Find IDs of current unsold auctions with the highest bid
SELECT ItemID
FROM Bids, Items 
WHERE Ends < 2001-12-20 00:00:01
AND Amount =
	SELECT MAX(Amount) FROM Bids;


--Find number of sellers with rating higher than 1000
SELECT COUNT(UserID)
FROM Users, Item_Seller
WHERE Rating > 1000



--Find number of users who are both sellers and bidders
SELECT COUNT(UserID)
FROM Item_Sellers, Bids



--Number of categories that include at least one item with a bid of > $100
SELECT COUNT(Categories)
FROM Categories, Bids
WHERE Amount > 1
