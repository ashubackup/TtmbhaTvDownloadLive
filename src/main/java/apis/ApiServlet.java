package apis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.JSONObject;

import entity.Liked;
import entity.Perametrs;
import entity.UserWatchList;
import entity.VideoView;



@WebServlet("/ApiServlet")
public class ApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Perametrs param=new Perametrs();
	Liked objLiked=new Liked();
	VideoView view=new VideoView();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiServlet() {
        super();
        // TODO Auto-generated constructor stub
        
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		setAccessHeader(response);
		
	PrintWriter out=response.getWriter();
		BufferedReader br=request.getReader();
		String query = br.readLine();
	     JSONObject obj=new JSONObject();
		
		System.out.println(query);
       
       param=param.SetFields(URLDecoder.decode(query,"UTF-8"), param);
      if(param.getAction().equalsIgnoreCase("1"))
      {
    	  boolean status=false;
    	status =  objLiked.chekUserLike(param);
    	out.print(status);
        }
      else if(param.getAction().equalsIgnoreCase("2"))
      {
    	  boolean status=false;
    	status =  view.chekUserVideo(param);
    	out.print(status);
        }
      else if(param.getAction().equalsIgnoreCase("3"))
      {
    	  boolean status=true;
      	status = UserWatchList.checkUserWatchList(param);
      	out.print(status);
      }
}
	
	@Override
	protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		setAccessHeader(resp);
		resp.setStatus(HttpServletResponse.SC_OK);
		}
	
    private void setAccessHeader(HttpServletResponse resp)
         {
        	 resp.setHeader("Access-Control-Allow-Origin","*");
        	 resp.setHeader("Access-Control-Allow-Method", "POST");
        	 resp.setHeader("Access-Control-Allow-Headers","*");
        	 resp.setHeader("Access-Control-Allow-Headers","Content-Type");
        	 System.out.println(resp.getHeaderNames());
         }
}
