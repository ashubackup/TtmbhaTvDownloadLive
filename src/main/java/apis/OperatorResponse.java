package apis;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.UserValidation;



/**
 * Servlet implementation class OperatorResponse
 */
@WebServlet("/DoiRedirect")
public class OperatorResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperatorResponse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//url=result=Active&result_id=2&subscription_id=98774&msisdn=279878715559&channel=wap&ext_ref=4sd54f
		//open url
		////https://ttmbhatv.co.za/DoiRedirect?result=Active&result_id=2&subscription_id=98774&msisdn=27787626418&channel=wap&ext_ref=4sd54f
		
     	String result = request.getParameter("result");
	    //String result = "ACTIVE";
	    String result_id = request.getParameter("result_id");
	    String subscription_id = request.getParameter("subscription_id");
	    String ani = request.getParameter("msisdn");
	    //String ani = "9878715559";
	    final String countyCode = "27";
        final int len = countyCode.length();
        if (ani.substring(0, len).equals(countyCode)) {
            ani = ani.substring(len);
        }
	    String WAP_DOI = request.getParameter("WAP_DOI");
	    String ext_ref = request.getParameter("ext_ref");
		
	    if(result.equalsIgnoreCase("Active"))
	    {
	     	long count = 0;
	  
	     	
			count =UserValidation.checkUser(ani, "TT Mbha TV");
	     System.out.println("count:"+count);
		    if(count!=0) {
		    	System.out.println("Sending user to home");
		    	
		    	HttpSession session = request.getSession();
		    	System.out.println("Session ID: " + session.getId());
		    	session = request.getSession();
				session.setAttribute("ani",ani);
		    	response.sendRedirect("/index.jsp");

		    }
		    else {
				/*
				 * System.out.println("insert in tbl_sub"); Statement stmtup =
				 * Loader.FGRConn.createStatement(); String instUser =
				 * configurator.getProperty("insertUser"); instUser = instUser.replace("<ani>",
				 * ani).replace("<service_type>", "Games"); System.out.println(instUser);
				 * stmtup.executeUpdate(instUser); request.setAttribute("ani",ani);
				 */
//		    	String SDPURL = "http://optin.telkomsdp.co.za/service/35";
		    	String url="http://optin.telkomsdp.co.za/service/152";
		    	response.sendRedirect(url);
		    }
	    }
		
		
	}

}
