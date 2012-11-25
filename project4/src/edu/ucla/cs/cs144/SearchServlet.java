package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.io.PrintWriter;

public class SearchServlet extends HttpServlet implements Servlet {
       
    public SearchServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    //get the get paramters
	String query = request.getParameter("q");
	int ret      = Integer.parseInt(request.getParameter("numResultsToReturn"));
	int skip     = Integer.parseInt(request.getParameter("numResultsToSkip"));
	SearchResult[] result = AuctionSearchClient.basicSearch(query, skip, ret);
	
	//make two arraylists, and put the data in them
	ArrayList<String> names = new ArrayList<String>();
	ArrayList<String>    ids  = new ArrayList<String>();
	
	for(int i = 0; i != result.length; i ++)
	{
		names.add(result[i].getName());
		ids.add(result[i].getItemId());
	}
		
	//convert the arraylists to string arrays for jsp
	String[] nms = names.toArray(new String[names.size()]);
	String[] Ids = ids.toArray(new String[ids.size()]);
	
	//pass off to jsp
	request.setAttribute("names", nms);
	request.setAttribute("ids", Ids);
	request.setAttribute("skip", Integer.toString(skip));
	request.setAttribute("query", query);
	
	 //PrintWriter out = response.getWriter();
     //out.println("<html><body>");
     //out.println(result.length);
     
    // out.println("</html></body>");
	request.getRequestDispatcher("/keysearch.jsp").forward(request,response);
	
	
    }
}
