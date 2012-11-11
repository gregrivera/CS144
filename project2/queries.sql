-- greg and parth queries.sql


--Find the number of users in the database 13422
SELECT COUNT(*)
FROM Users;


--Find the number of sellers from New York 80
SELECT COUNT(DISTINCT Users.UserID)
FROM Users
INNER JOIN Items
ON Users.UserID = Items.UserID
WHERE BINARY Location = 'New York';


--Find the number of auctions belonging to exactly four categories 8365

SELECT COUNT(*)
FROM
(SELECT COUNT(*) as c FROM Item_Category 
	GROUP BY ItemID 
	HAVING c = 4)
as b;



--Find IDs of current unsold auctions with the highest bid 1046740686
SELECT Bids.ItemID
FROM Bids
INNER JOIN Items
ON Bids.ItemID = Items.ItemID
WHERE Ends > '2001-12-20 00:00:01'
AND Amount =
	(SELECT MAX(Amount) FROM Bids);


--Find number of sellers with rating higher than 1000 : 3130
SELECT COUNT(DISTINCT Users.UserID)
FROM Users
INNER JOIN Items
ON Users.UserID = Items.UserID
WHERE BINARY Rating > 1000;



--Find number of users who are both sellers and bidders 6717
SELECT COUNT(distinct Items.UserID)
FROM Items
INNER JOIN Bids
ON Items.UserID = Bids.UserID;



--Number of categories that include at least one item with a bid of > $100: 150
SELECT COUNT(distinct Category)
FROM Item_Category
INNER JOIN Bids
ON Item_Category.ItemID = Bids.ItemID
WHERE Amount > 100 
AND Bids.ItemID 
IN 
(SELECT Bids.ItemID
FROM Items
INNER JOIN Bids
ON Bids.ItemID = Items.ItemID);
