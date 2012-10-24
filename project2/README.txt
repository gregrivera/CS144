1. * denotes keys

Items(ItemID, Name, Buy_Price, First_Bid, Started, Ends)
Users(UserID, Rating, LocationID, CountryID)
Location(*LocationID, CountryID, Location)
Country(*CountryID, Country)
Category(*CategoryID, Category)
Item_Category(*ItemID, CategoryID)
Bids(*BidID, UserID, ItemID, Amount)
Item_Seller(*ItemID, UserID)

2. Our relations don't hold any nontrivial function dependenceis, excluding those that effectiveley specify keys.


3. All our relations are in BCNF.
