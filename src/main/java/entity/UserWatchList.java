package entity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import apis.Loader;

public class UserWatchList {
	
	public static  boolean checkUserWatchList(Perametrs param )
	{
		boolean status=false;
		
		String query = "select * from tbl_watchlist where userid='"+param.getUid()+"' and videoid='"+param.getVid()+"'" ;
		System.out.println(query);
		try {
		PreparedStatement pstmt=Loader.fiveSeven.prepareStatement(query);
	  ResultSet rs=   pstmt.executeQuery();
	  if(rs.next())status=true;
		}
		catch (Exception e) 
		{
				e.printStackTrace();		
					}
		System.out.println(status);
		
		return (status==true ? false : setVideoList(param));
		
		
		
	}
	public static boolean setVideoList(Perametrs param)
	{
		boolean status =false;
		
		String query = "insert into tbl_watchlist (userid,videoid) values(?,?)" ;
		try {
		PreparedStatement pstmt=Loader.fiveSeven.prepareStatement(query);
		pstmt.setString(1,param.getUid());
		pstmt.setString(2, param.getVid());
		pstmt.execute();
		status=true;
		
		}
		catch (Exception e) 
		{
				e.printStackTrace();		
					}
		return status;
	}
	

	public static  ResultSet getWatchListCount(String uid)
	{
		ResultSet rs=null;
		String query ="select t1.videoid , t2.name from tbl_watchlist t1 join  tbl_videos t2 on t2.videoid=t1.videoid  where userid=? ";
		
		try {
			PreparedStatement pstmt=Loader.fiveSeven.prepareStatement(query);
		 System.out.println(query);
			pstmt.setString(1,uid);
				rs=pstmt.executeQuery();
		  }
			catch (Exception e) 
			{
					e.printStackTrace();		
						}
			return rs;
	}
}
