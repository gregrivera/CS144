<html>

<body>
<form name="itemsearch" action="/eBay/item" method="get">
ID Query: <input type="text" name="id"><br>
<input type="submit" value="Submit Query">
<br>

</form>

	<p>ItemID: <%= (String)request.getAttribute("itemid") %> </p> <br>
	<p>Itemname is <%= (String)request.getAttribute("name") %> </p> <br>
	<% String[] cat = (String[])request.getAttribute("cat");
	for(int i = 0; i != cat.length; i++)
	{
		%>
		<p>Category: <%= cat[i] %> </p><br>
		<%
	}
	%>
	
	<p>Current Price: <%= (String)request.getAttribute("cur") %> </p> <br>
	<p>First Bid:<%= (String)request.getAttribute("firstBid") %> </p> <br>
	<p>Number of Bids:<%= (String)request.getAttribute("numBid") %> </p> <br>
	
	
	<p>Bids if any are below: <br>
	<% String[] bids = (String[])request.getAttribute("bids");
	for(int q = 0; q != bids.length; q++)
	{
		String[] temp = bids[q].split("\\|");
		%>
		<p>Bidder Name: <%= temp[0] %> <br>
		Bidder Rating: <%= temp[1] %> <br>
		Bidder City: <%= temp[2] %> <br>
		Bidder Country: <%= temp[3] %> <br>
		Bidder Time: <%= temp[4] %> <br>
		Bidder Amount: <%= temp[5] %> <br>
		</p>
		<%
	}		
	if(bids.length == 0) 
	{
	%> There are no bids for this item.						
	<% 
	}
	%>
	</p>
	
	
	<p>Location:<%= (String)request.getAttribute("loc") %> </p> <br>
	<p>Started:<%= (String)request.getAttribute("start") %> </p> <br>
	<p>Ends:<%= (String)request.getAttribute("end") %> </p> <br>
	<p>SellerID:<%= (String)request.getAttribute("sellid") %> </p> <br>
	<p>Seller Rating:<%= (String)request.getAttribute("sellrate") %> </p> <br>
	

    
    
    
    
    
    
    
    
    
</body>
</html>
