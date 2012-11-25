package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;


public class ItemServlet extends HttpServlet implements Servlet {
       
    public ItemServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	//get the get paramters
    	String id = request.getParameter("id");
    	String result = AuctionSearchClient.getXMLDataForItemId(id);
    	String lines[] = result.split("\\r?\\n");
    	
    	//get the item id
    	String itemId = lines[0].replace("<Item ItemID=\"", "");
    	itemId = itemId.replace("\">", "");
    	
    	//get name
    	String name = lines[1].replace("<name>", "");
    	name = name.replace("</name>", "");
    	
    	//get categories
    	ArrayList<String> categories = new ArrayList<String>();
    	
    	int i = 2;
    	String matchCat = "<Category>";
    	
    	//start at line 2
    	for(; ; i++)
    	{
    		if(lines[i].contains(matchCat))
    		{
    			String toAdd = lines[i].replace("<Category>", "");
    			toAdd = toAdd.replace("</Category>", "");
    			categories.add(toAdd);
    		}
    		else
    		{
    			break;
    		}
    	}
    	
    	//process currently
    	String currently = lines[i].replace("<Currently>", "");
    	currently = currently.replace("</Currently>", "");
    	
    	//is there a buyprice?
    	String buyprice = "";
    	if(lines[i+1].contains("<Buy_Price>"))
    	{
    		buyprice = lines[++i].replace("<Buy_Price>", "");
    		buyprice = buyprice.replace("</Buy_Price>", "");
    	}
    	
    	//process first bid
    	String firstBid = lines[++i].replace("<First_Bid>", "");
    	firstBid = firstBid.replace("</First_Bid>", "");
    	
    	//process number of bids
    	String numberBid = lines[++i].replace("<Number_of_Bids>", "");
    	numberBid = numberBid.replace("</Number_of_Bids>", "");
    	ArrayList<String> bidderInfos = new ArrayList<String>();
    	
 
		
    	if(lines[++i].contains("<Bids/>") != true)
    	{
	    	//process bidders
	    	i+=2;
	    	
	    	String debug = "";
	    	for(; ;i++  )
	    	{
	    		
	    		String tem = "";
	    		String currentLine = lines[i];
	    		int set = 0;
	    		String entry = "";
	    		for(int a = 0; a != lines[i].length(); a++)
	        	{
	    			
	        		if(currentLine.charAt(a) == '"' )
	        		{
	        			a++;
	        			for(; currentLine.charAt(a) != '"'; a++)
	        			{
	        				tem = tem + currentLine.charAt(a);
	        				
	        			}
	        			if(set == 0)
	        			{
	        				entry += tem + "|";
	        				tem = "";
	        			}
	        			if(set == 1)
	        			{
	        				entry += tem + "|";
	        			}
	        			set++;
	        		}
	        	}
	    		i++; //move to next line
	    		String bidloc = lines[i].replace("<Location>", "");
	    		entry += bidloc.replace("</Location>", "") + "|";
	    		
	    		i++;//move to next line
	    		
	    		String bidcountry = lines[i].replace("<Country>", "");
	    		entry += bidcountry.replace("</Country>", "") + "|";
	    		
	    		i++; //move past the /bidder close tag
	    		
	    		i++;//move to next line
	    		
	    		String bidtime = lines[i].replace("<Time>", "");
	    		entry += bidtime.replace("</Time>", "") + "|";
	    		
	    		i++;//move to next line
	    		String bidamount = lines[i].replace("<Amount>", "");
	    		entry += bidamount.replace("</Amount>", "") + "|";
	    		
	    		
	    		//move to the /bid close tag, then to the next tag
	    		i+=2;
	    		bidderInfos.add(entry);
	    		
	    		debug += "line " + i + lines[i] + "|";
	    		if(lines[i].contains("</Bids>")) 
	    		{
	    			
	    			break;
	    		}
	    		
	    		
	    	}
    	}
    	
    	//else{i++;}
    	//process location
    	String location = lines[++i].replace("<Location>", "");
    	location = location.replace("</Location>", "");
    	
    	//process Country
    	String country = lines[++i].replace("<Country>", "");
    	country = country.replace("</Country>", "");
    	
    	//process Started
    	String started = lines[++i].replace("<Started>", "");
    	started = started.replace("</Started>", "");
    	
    	//process Ends
    	String ends = lines[++i].replace("<Ends>", "");
    	ends = ends.replace("</Ends>", "");
    	
    	
    	//process seller user id
    	String sellerids = "";
    	String selleratings = "";
    	String temp = "";
    	String rawseller = lines[++i];
    	int flag = 0;
    	for(int b = 0; b != rawseller.length(); b++)
    	{
    		if(rawseller.charAt(b) == '"' )
    		{
    			b++;
    			for(; rawseller.charAt(b) != '"'; b++)
    			{
    				temp = temp + rawseller.charAt(b);
    				
    			}
    			if(flag == 0)
    			{
    				sellerids += temp;
    				temp = "";
    			}
    			if(flag == 1)
    			{
    				selleratings += temp;
    			}
    			flag++;
    		}
    	}
    	
    	//process Description
    	String description = lines[++i].replace("<Description>", "");
    	description = description.replace("</Description>", "");
    	
    	
    	
    	
    	//pass off to jsp each line of the xml
    	request.setAttribute("itemid", itemId);
    	request.setAttribute("name", name);
    	request.setAttribute("cat", categories.toArray(new String[categories.size()]));
    	request.setAttribute("cur", currently);
    	request.setAttribute("firstBid", firstBid);
    	request.setAttribute("numBid", numberBid);
    	
    	request.setAttribute("loc", location);
    	request.setAttribute("start", started);
    	request.setAttribute("end", ends);
    	request.setAttribute("sellid", sellerids);
    	request.setAttribute("sellrate", selleratings);
    	request.setAttribute("bids", bidderInfos.toArray(new String[bidderInfos.size()]));
    	
    	
 
    	request.getRequestDispatcher("/item.jsp").forward(request,response);
    	
    }
    
    
}
