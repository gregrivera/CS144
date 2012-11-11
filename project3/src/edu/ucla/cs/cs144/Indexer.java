package edu.ucla.cs.cs144;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.lucene.document.Field;
import org.apache.lucene.document.Document;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.IndexWriter;
import java.sql.*;


public class Indexer {
    
    /** Creates a new instance of Indexer */
    public Indexer() {
    }
 
    public void rebuildIndexes() {

        Connection conn = null;

        // create a connection to the database to retrieve Items from MySQL
	try {
	    conn = DbManager.getConnection(true);
	} catch (SQLException ex) {
	    System.out.println(ex);
	}
	
	//create the index for basic search
	try {
		ResultSet[] rs;
		rs = new ResultSet[2];
		
		ResultGetter.getUserData(rs);
		
		
		String directory = System.getenv("LUCENE_INDEX") + "/basic";
		IndexWriter indexWriter = new IndexWriter(directory, new StandardAnalyzer(), true);
		while(rs[0].next())
		{
			
//			time to create lucene index
			
			
			//get the id of current item
			Document doc = new Document();
			int id = rs[0].getInt("ItemID");
			String sid = "" + id;
			doc.add(new Field("ItemID", sid, Field.Store.YES, Field.Index.NO));
			
			//get the categories associated with this id

			String categories = "";
			ResultSet[] rs2;
			rs2 = new ResultSet[1];
			ResultGetter.getCategoryData(rs2, rs[0].getInt("ItemID"));
			while(rs2[0].next())
			{
				categories += (rs2[0].getString("Category") + " ")	;
			}
			
			
			
			doc.add(new Field("ItemName", rs[0].getString("Name"), Field.Store.YES, Field.Index.TOKENIZED));
			doc.add(new Field("Description", rs[0].getString("Description"), Field.Store.YES, Field.Index.TOKENIZED));
			doc.add(new Field("Category", categories, Field.Store.YES, Field.Index.TOKENIZED));
			
			
			String fullSearchable = rs[0].getString("Name") + " " + rs[0].getString("Description") + " " 
				+ categories;
			
			
			doc.add(new Field("content", fullSearchable, Field.Store.YES, Field.Index.TOKENIZED));
			indexWriter.addDocument(doc);
			
			
		}
		indexWriter.close();
		rs[0].close();
		rs[1].close();
		//close everything
		
			
	}
	
	catch (Exception e) {
		//pokemon: gotta catch them all
	}


    // close the database connection
	try {
	    conn.close();
	} catch (SQLException ex) {
	    System.out.println(ex);
	}
    }    

    public static void main(String agrs[]) {
        Indexer idx = new Indexer();
        idx.rebuildIndexes();
    }   
}
