<html>

<body>
<form name="search" action="/eBay/search" method="get">
Keyword Query: <input type="text" name="q"><br>
<input type="hidden" name="numResultsToSkip" value="0">
<input type="hidden" name="numResultsToReturn" value="10">
<input type="submit" value="Submit Query">
</form>

<%  
	//get values from servlet
	String[] names  = (String[])request.getAttribute("names");
    String[] ids    = (String[])request.getAttribute("ids");
    if(names.length == 0)
    {
    	%><p> No more results! </p> <%
    }
	for(int i = 0; i < names.length; i++)
	{
		%>
		<a href="/eBay/item?id=<%= ids[i] %>"><%= ids[i] %></a>
		<p> <%= names[i] %> </p><br>
		<%
	}
	
	//set the correct values for previous and next results to skip
	int initFor = Integer.parseInt((String)request.getAttribute("skip")) + 10;
	int initBac = Integer.parseInt((String)request.getAttribute("skip")) - 10;
%>

<%  
	//output the next and previous links if applicable
	if(initBac >= 0)
	{
	%>
	<a href="/eBay/search?q=<%= (String)request.getAttribute("query") %>&numResultsToSkip=<%= initBac %>&numResultsToReturn=10">Previous</a>
	<%
	}   
%>

<%  if(names.length == 10)
	{
	%>
	<a href="/eBay/search?q=<%= (String)request.getAttribute("query") %>&numResultsToSkip=<%= initFor %>&numResultsToReturn=10">Next</a>
	<%
	}   
%>
    
    
    
    
</body>
</html>
