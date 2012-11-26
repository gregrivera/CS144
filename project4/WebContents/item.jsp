<!DOCTYPE html>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

<html>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
	<script type="text/javascript">
	var geocoder;
	var map;
	
	function initializeMap() {

		var latlng = new google.maps.LatLng(-34.397, 150.644);
		var myOptions = {
				zoom: 8,
				center: latlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
				}
		map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		codeAddress();
	}

	//note: some of this code was taken from the google geocoder tutorial
	function codeAddress() {
		geocoder = new google.maps.Geocoder();		
		var address = "<%= (String)request.getAttribute("loc") %>";
		geocoder.geocode( { 'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			initializeMap();
			map.setCenter(results[0].geometry.location);
			var marker = new google.maps.Marker({
				map: map,
				position: results[0].geometry.location
			});
		} 
		});
	}
		  
 
       </script>
<body onload="codeAddress()">
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




        
    
    
    
    
    
    
<div id="map_canvas" style="width: 600px; height: 400px"></div>

    
</body>
</html>
