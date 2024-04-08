package entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import apis.Loader;

public class Liked {
	
	static Connection conn=Loader.fiveSeven;
	public boolean chekUserLike(Perametrs param )
	{
		boolean status=false;
		String query = "select * from tbl_userlike where userid='"+param.getUid()+"' and videoid='"+param.getVid()+"'" ;
		System.out.println(query);
		try {
		PreparedStatement pstmt=conn.prepareStatement(query);
	  ResultSet rs=   pstmt.executeQuery();
	  if(rs.next())status=true;
		rs.close();
		pstmt.close();
		}
		catch (Exception e) 
		{
				e.printStackTrace();		
					}
		System.out.println(status);
		
		return (status==true ? false : setLike(param));
	}
	public boolean setLike(Perametrs param)
	{
		boolean status =false;
		
		String query = "insert into tbl_userlike (userid,videoid,servicename) values(?,?,?)" ;
		try {
		PreparedStatement pstmt=conn.prepareStatement(query);
		pstmt.setString(1,param.getUid());
		pstmt.setString(2, param.getVid());
		pstmt.setString(3, param.getService());

		pstmt.execute();
		status=true;
		pstmt.close();
		
		
		}
		
		catch (Exception e) 
		{
				e.printStackTrace();		
					}
		return status;
	}
	
	public static  String getLikeCount(String vid)
	{
		String count=null;
		String query ="select count(*) from tbl_userlike where videoid=? ";
		try {
			PreparedStatement pstmt=conn.prepareStatement(query);
			pstmt.setString(1,vid);
			ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			count=rs.getString(1);
		}
			pstmt.close();
			rs.close();
			
			
			}
			catch (Exception e) 
			{
					e.printStackTrace();		
						}
			return count;
	}

}
