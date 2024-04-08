package entity;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Map;

import javolution.util.FastMap;

public class Perametrs {
	
	private String uid;
	private String vid;
	private String action;
	private String service;
	private int count;
	private ResultSet resultset;
	private Map map;
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ResultSet getResultset() {
		return resultset;
	}
	public void setResultset(ResultSet resultset) {
		this.resultset = resultset;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	
	public Perametrs SetFields(String query,Perametrs param)
	{
		
		FastMap<String , String > map=new FastMap<String, String>();
		String str[]=query.split("&");
		for(String a:str)
		{
			String []kv=a.split("=");
			map.put(kv[0].trim(),(kv.length==2?kv[1].trim():"0"));
		}
		Iterator< String > iterator=map.keySet().iterator();
		Class<?> clazz=param.getClass();
		try {
			
			while(iterator.hasNext())
			{
				String key=iterator.next();
				
				Field field=clazz.getDeclaredField(key);
				Class<?> type=field.getType();
				String fieldtype=type.getCanonicalName();
				field.setAccessible(true);
				
				if(fieldtype.equalsIgnoreCase("int") || fieldtype.equalsIgnoreCase("java.lang.Integer") )
				{
					field.set(param,Integer.parseInt(map.get(key)));
				}
				else if("char".equalsIgnoreCase(fieldtype ) || "java.lang.Character".equalsIgnoreCase(fieldtype))
				{
					field.set(param,map.get(key));
				}
				else if(fieldtype.equalsIgnoreCase("double") || fieldtype.equalsIgnoreCase("java.lang.Double"))
				{
					
					field.set(param, Double.parseDouble(map.get(key)));
					
				}
				else if(fieldtype.equalsIgnoreCase("java.lang.String"))
				{
					field.set(param,map.get(key).toString());
				}
				
				
			}
			
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return param;
	}
	
	
	
	

}
