package apis;

import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import dbconnection.DbConnection;

public class Loader extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	public static Connection fiveSeven=null;
	
	
    public Loader() {
        super();
    }
    
@Override
public void init() throws ServletException {
	System.out.println("Loader----");
	DbConnection db=new DbConnection();
	fiveSeven=db.getDatabaseCoonection();
	//super.init();
}
	
}
