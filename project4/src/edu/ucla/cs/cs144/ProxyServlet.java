package edu.ucla.cs.cs144;

import java.io.IOException;
import java.net.HttpURLConnection;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;

import java.net.URL;
import java.net.URI;

import java.io.BufferedReader;


public class ProxyServlet extends HttpServlet implements Servlet {
       
    public ProxyServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // your codes here
	//initialize the HttpURLConnection class and related classes

	HttpURLConnection httpconn = null;
        OutputStreamWriter osw = null;
        URL servAddr = null;
        URI uri = null;
	BufferedReader br = null;
	
	try
	{
		//get the query
		String query = request.getParameter("q");
		uri = new URI ("http", "google.com", "/complete/search",
			"output=toolbar&q=" + query, null);
			
		//set up connectio nand translate servAddr to url
		servAddr = uri.toURL();
		httpconn = (HttpURLConnection)servAddr.openConnection();
		httpconn.setDoOutput(true); //from URLConnection
		httpconn.setRequestMethod("GET");
		
		
		httpconn.connect();
		
		//connection established, get input stream from google server
		br = new BufferedReader(new InputStreamReader
		(httpconn.getInputStream()));
		
		String result = "";
		String currentLine = "";
		
		
		currentLine = br.readLine();
		while(currentLine != null)
		{
			//each line into a new line in the string
			result = result + currentLine;
			currentLine = br.readLine();
		}
		
		
		response.getWriter().println(result);
		response.setContentType("text/xml");
		
		//close httpconn
		httpconn.disconnect();
		
		
		
		
	}
	
	catch (Exception e)
	{
		e.printStackTrace();
	}
	
	
	
    }
}
