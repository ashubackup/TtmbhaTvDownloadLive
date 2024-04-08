package entity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import apis.Loader;

public class VideoView {

	public boolean chekUserVideo(Perametrs param)
	{
		boolean status=false;
		String query = "select * from tbl_view_video where userid='"+param.getUid()+"' and videoid='"+param.getVid()+"'" ;
		System.out.println(query);
		try {
		PreparedStatement pstmt=Loader.fiveSeven.prepareStatement(query);
	  ResultSet rs=pstmt.executeQuery();
	  if(rs.next())status=true;
		pstmt.close();
		
		}
		catch (Exception e) 
		{
				e.printStackTrace();		
					}
		System.out.println(status);
		
		return (status==true ? false : setVideoView(param));
	}
	public boolean setVideoView(Perametrs param)
	{
		boolean status =false;
		
		String query = "insert into tbl_view_video (userid,videoid,servicename) values(?,?,?)" ;
		try {
		PreparedStatement pstmt=Loader.fiveSeven.prepareStatement(query);
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
	
	public static  String getVideoViewCount(String vid)
	{
		String count=null;
		String query ="select count(*) from tbl_view_video where videoid=? ";
		try {
			PreparedStatement pstmt=Loader.fiveSeven.prepareStatement(query);
			pstmt.setString(1,vid);
			ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			count=rs.getString(1);
		}
		pstmt.close();
			}
			catch (Exception e) 
			{
					e.printStackTrace();		
						}
			return count;
	}
}
