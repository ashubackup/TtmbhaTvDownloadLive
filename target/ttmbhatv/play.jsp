<%@page import="services.UserValidation"%>
<%@page import="entity.VideoView"%>
<%@page import="entity.Liked"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="services.DataCollector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="head.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
      <script src="https://vjs.zencdn.net/7.10.2/video.min.js"></script>
    
    
    <%
    String user=(String)session.getAttribute("ani");
    //System.out.println("ani is---" + user);
        int counts =UserValidation.checkUser(user, "TT Mbha TV");
        //System.out.println("count of ---" + counts);
        
	if( user == null)
	{
		response.sendRedirect("http://optin.telkomsdp.co.za/service/152");
	}
	else if(counts == 0)
  	{
  		response.sendRedirect("/wait.jsp");
  	}
	%>
    
    
</head>	
<style>

</style>
<body class="d-flex min-vh-100 flex-column">
    <header>
        <jsp:include page="nav.jsp"/>
    </header>
    <div class="body-wrapper flex-grow-1">
     <%
    
  
    String vid=request.getParameter("videoid");
  
 ResultSet rs = DataCollector.getVideoUrl(vid) ;
    try{
  while(rs.next())
  {
    %>
        <section class="view-video pb-3">
            <div class="cuscontainer py-3">
                <div class="row">
                    <div class="col-md-7">                   
					   <video
					    id="my-video"
					    class="video-js"
					    controls
					    preload="auto"
					    width="640"
					    height="264"   
					     data-setup="{}"
					    poster="<%=rs.getString("imgurl") %>"
					     muted=""
					     ontimeupdate="mytime()"
					     onplay='vidviews("ttmbhatv","<%=vid %>","<%=user %>>")'
					     oncontextmenu="return false"
					     autoplay="true"
					   
					  >
					    <source src="<%=rs.getString("vurl")%>" type="video/mp4" />
					    <p class="vjs-no-js">
					      To view this video please enable JavaScript, and consider upgrading to a
					      web browser that
					      <a href="https://videojs.com/html5-video-support/" target="_blank"
					        >supports HTML5 video</a
					      >
					    </p>
					    </video>
	
		      </div>
                                 <div class="col-md-5">
                        <div class="video-details mb-2">
                            <h4 class="text-white text-uppercase"><%=rs.getString("name") %></h4>
                            <div class="likebtn">
                                <a href="javascript:void(0);" class="text-decoration-none text-white mb-2 d-inline-block" onclick='like("<%= vid %>","<%=user %>","ttmbhatv")'><i class="fas fa-thumbs-up ">
                      </i> <span>Like</span> <span class="likes" id="lcount"><%= Liked.getLikeCount(vid) %></span></a>
                                
                                
         <a href="javascript:void(0);" class="text-decoration-none text-white mb-2 d-inline-block"   onclick='wlist("<%= vid %>","<%=user%>")'><i class="fas fa-plus"></i>
                                 <span id="watchlist" data-toggle="tooltip"  id="helpbutton" title="Watchlist">Watchlist</span><p id="ttip"></p></a>
                                <a href="javascript:void(0);" class="text-decoration-none text-white mb-2 d-inline-block"><i class="fas fa-eye"></i> 
                                <span >Views</span> <span class="likes  vcount" ><%=VideoView.getVideoViewCount(vid) %></span></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10">
                                <div class="video-details text-white">
                                    <p><span class="text-warning text-uppercase"><i class="fa fa-info-circle"></i> Category:</span><%=rs.getString("category")%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
        </section>
        <% 
        }
        }catch(Exception e)
        {
        e.printStackTrace();
        }
         %>
        
        <section class="secvideos over-hidden py-3">
            <div class="cuscontainer">
                <div class="random-video cusslider-slick">
                    <div class="section-heading">
                        <h3 class="text-white"><span><i class="fa fa-video"></i></span> Related Videos</h3>
                    </div>
                     <div class="randomvideo mb-0">
                   
                   <%
                   ResultSet rs1 = DataCollector.getRandomVideos();

			    try{
			  while(rs1.next())
			  {
			    %>     
			    <div>
			    <a href="/play.jsp?videoid=<%=rs1.getString("videoid")%>" >
                                <div class="videothumb">
                                    <img src="<%=rs1.getString(1) %>" alt="Artist Name" class="img-fluid" />
                                    <div class="play-icon">
                                        <i class="fa fa-play-circle"></i>
                                    </div>
                                   <!--  <div class="timing-video"> 
                                        <span>01:02</span>
                                    </div> -->
                                </div>
                                <div class="video-title">
                                    <h4><%=rs1.getString(2) %></h4>
                                </div>
                            </a>
                        </div>
                      
                        <% 
                        }
                        }catch(Exception e)
                        {
                        e.printStackTrace();
                        }
                         %>
                       
                             </div>
                 
                </div>
            </div>
        </section>

    </div>
   	<jsp:include page="footer.jsp"/>
</body>
</html>