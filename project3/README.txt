This example contains a simple utility class to simplify opening database
connections in Java applications, such as the one you will write to build
your Lucene index. 

To build and run the sample code, use the "run" ant target inside
the directory with build.xml by typing "ant run".

Parth Shah  303775808
Greg Rivera 103764354

The Lucene Index was built on the text fields ItemName, Description, and Category. There is also a another index called content which contains the union of the above lucene indexes. The entire indexes are in the basic folder.


There are mysql indexes on:
Items Table: Buy_Price, UserID, Ends

Bids Table: UserID
