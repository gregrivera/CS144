package edu.ucla.cs.cs144;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ResultGetter {
	public static void getCategoryData(ResultSet[] rs2, int UserID)
	{
		try{
			//establish a connection to the database
			Connection ca = DbManager.getConnection(true);
			//Statement sa = ca.createStatement();
			
			//query the database for necessary information
			Statement sa = ca.createStatement();
			
			rs2[0] = sa.executeQuery("SELECT * FROM Item_Category where ItemID=" + UserID);
            //c.close();
            //s.close();
		}
		catch (Exception e) {
			//catch all
		}
	}
	
	public static void getUserData(ResultSet[] rs)
	{
		try {
//			establish a connection to the database
			Connection c = DbManager.getConnection(true);
			Statement s = c.createStatement();
			
			rs[0] = s.executeQuery("SELECT * FROM Items");
			

			//return the two recordsets
	        //c.close();
	        //s.close();
			
		}
		catch (Exception e) {
			//pokemon exception handling
		}
		
		
	}
}
