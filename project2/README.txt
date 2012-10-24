1. * denotes keys

Items(*ItemID, UserID, Name, Buy_Price, First_Bid, Started, Ends)
Users(*UserID, Rating, Location, Country)
Item_Category(*ItemID, Category)
Bids(*BidID, UserID, ItemID, Time, Amount)

2. Our relations don't hold any nontrivial function dependenceis, excluding those that effectiveley specify keys.


3. All our relations are in BCNF.
