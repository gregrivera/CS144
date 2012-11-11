-- Parth and Greg 
-- Proj 2 load.sql

-- Bulk load insert to populate the Items Table
LOAD DATA
LOCAL INFILE
'nodup_items.dat'
INTO TABLE Items
FIELDS TERMINATED BY '|*|';

-- Bulk load insert to populate the Users Table
LOAD DATA
LOCAL INFILE
'nodup_users.dat'
INTO TABLE Users
FIELDS TERMINATED BY '|*|';

-- Bulk load insert to populate the Item_Category Table
LOAD DATA
LOCAL INFILE
'nodup_item_category.dat'
INTO TABLE Item_Category
FIELDS TERMINATED BY '|*|';

-- Bulk load insert to populate the Bids Table
LOAD DATA
LOCAL INFILE
'nodup_bids.dat'
INTO TABLE Bids
FIELDS TERMINATED BY '|*|';


-- End Load
