-- Parth and Greg Proj 2 load.sql

-- Bulk load insert to populate the Items Table
LOAD DATA
LOCAL INFILE
'items.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- Bulk load insert to populate the Users Table
LOAD DATA
LOCAL INFILE
'users.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- Bulk load insert to populate the Location Table
LOAD DATA
LOCAL INFILE
'location.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- Bulk load insert to populate the Country Table
LOAD DATA
LOCAL INFILE
'country.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- Bulk load insert to populate the Category Table
LOAD DATA
LOCAL INFILE
'category.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- Bulk load insert to populate the Item_Category Table
LOAD DATA
LOCAL INFILE
'item_category.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- Bulk load insert to populate the Bids Table
LOAD DATA
LOCAL INFILE
'bids.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- Bulk load insert to populate the Item_Seller Table
LOAD DATA
LOCAL INFILE
'item_seller.dat'
INTO TABLE Items
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';


-- End Load
