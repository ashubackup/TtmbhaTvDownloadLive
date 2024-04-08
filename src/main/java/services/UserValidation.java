package services;

import java.sql.*;

import apis.Loader;

public class UserValidation {

	
public static int  checkUser(String ani,String servicename)
{
	ResultSet rs=null;
	int count =0;
	String query = "SELECT count(1) as count FROM tbl_subscription WHERE ani='"+ani+"' AND  service_type='"+servicename+"' AND DATE_ADD(sub_date_time ,INTERVAL 10 DAY) >= DATE(NOW()) and next_billed_date != 'null' ";
	
	System.out.println(query+"checkuser=====>");
	
	try {
		
		PreparedStatement ps=Loader.fiveSeven.prepareStatement(query);
		rs=ps.executeQuery();
		if(rs.next())
		{
		count=rs.getInt("count");	
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return count;
}

}
