package services;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import apis.Loader;
import entity.Perametrs;

public class DataCollector {

	public static ResultSet getArtist() {
//		String query = "SELECT  DISTINCT(t2.artist_img_url) as url, t2.artist,category,t2.id FROM tbl_videos t1 join tbl_artist t2 on t1.artist=t2.id where t2.status='1'";
		String query="select artist_img_url as url,id as id ,artist as artistname from tbl_artist where status='4'";
		ResultSet rs = null;
		try {
			Statement st = Loader.fiveSeven.createStatement();
			System.out.println(query);
			rs = st.executeQuery(query);
			

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;

	}

	public static ResultSet getCategory() {
//		String query = "SELECT  distinct(category_name)as category ,id FROM tbl_cat where status='4'";
		String query = "SELECT  distinct(category_name)as category ,id,t2.sub_cat_name,t2.sub_cat_id FROM tbl_cat t1  join tbl_sub_cat t2 on t1.id=t2.main_cat_id where t1.status='4' ";

		ResultSet rs=null;

		try {
			Statement st = Loader.fiveSeven.createStatement();
			System.out.println(query);
			 rs = st.executeQuery(query);
			

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getData(String id) {
//		String query = "SELECT  * FROM tbl_videos where status='4'";
		String query = "SELECT  * FROM tbl_videos where  sub_cat_id='"+id+"' and status='4'";
		ResultSet rs = null;
		try {
			Statement st = Loader.fiveSeven.createStatement();
//			System.out.println(query);
			rs = st.executeQuery(query);
                 if(rs.next())
                 {
                	 return rs;
                 }
                 else
                	 return rs= null;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}

	public static ResultSet getVideoUrl(String vid) {
		String url = null;

//		String query = "SELECT  vurl,name,description,t2.artist,category,imgurl FROM tbl_videos t1 join tbl_artist t2 on t1.artist= t2.id where videoid='"
//				+ vid + "'   ";
		
		String query = "SELECT  vurl,name,description,imgurl,category FROM tbl_videos t1  where videoid='" + vid + "' ";

//		System.out.println("Yoooooooo"+query);
		
		ResultSet rs = null;
		try {
			Statement st = Loader.fiveSeven.createStatement();

			rs = st.executeQuery(query);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return rs;
	}

	public static ResultSet getRandomVideos() {

		String query = "Select imgurl,name,videoid from tbl_videos  where status='4' and playstatus='0' order by rand() limit 12";
//		System.out.println(query);
		ResultSet rs = null;
		try {
			Statement st = Loader.fiveSeven.createStatement();

			rs = st.executeQuery(query);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return rs;

	}

	public static  ResultSet getVideoByCatId(String vcat,String type) {
		String query=null;
		if(type.equalsIgnoreCase("scat"))
		{
		    query = "Select * from tbl_videos where sub_cat_id='"+vcat+"' and status='4'";
		}
		else if(type.equalsIgnoreCase("cat"))
      {
		    query = "Select * from tbl_videos where cat_id="+vcat+" and status='4'";
		}
		
//		System.out.println(query);
		ResultSet rs = null;
		try {

			Statement st = Loader.fiveSeven.createStatement();
			rs = st.executeQuery(query);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet getCategories() 
	{
//		String query = "SELECT  distinct(category_name)as category ,id,t2.sub_cat_name,t2.sub_cat_id FROM tbl_cat t1  join tbl_sub_cat t2 on t1.id=t2.main_cat_id where t1.status='3' ";
        String query="SELECT  DISTINCT(category_name)AS category ,id FROM tbl_cat  WHERE status='4'";
		ResultSet rs=null;
try {
			
			Statement st = Loader.fiveSeven.createStatement();		
//			System.out.println(query);
			 rs = st.executeQuery(query);
			 
          } catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}
	
	
	public static Perametrs getSubCat(Perametrs param)
	
	{
		String query = "SELECT  * FROM tbl_sub_cat where status='4' and main_cat_id='"+param.getVid()+"' ";
	      
		 
		ResultSet rs = null;
		try {
			Statement st = Loader.fiveSeven.createStatement();
//			System.out.println(query);
			rs = st.executeQuery(query);
			Map<String ,String > map=new HashMap<String ,String>();
			
			while(rs.next())
			{
				
				map.put(rs.getString("sub_cat_id"), rs.getString("sub_cat_name"));
			}
			param.setMap(map);
//			rs.getRow();
//			if(rs.next())
//				param.setCount(1);
//			else
//				param.setCount(0);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return param;
	}

}
