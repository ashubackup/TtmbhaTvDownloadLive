<%@page import="services.UserValidation"%>
<%-- <%@page import="com.mysql.cj.protocol.Resultset"%> --%>
<%@page import="services.DataCollector"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="head.jsp"/>
</head>



<body class="d-flex min-vh-100 flex-column">
    <header>
         <jsp:include page="nav.jsp"/>
         
         <%
    String user=(String)session.getAttribute("ani");
        int counts =UserValidation.checkUser(user, "TT Mbha TV");
	if( user == null)
	{
		response.sendRedirect("http://optin.telkomsdp.co.za/service/152");
	
	}
	else if(counts == 0)
  	{
  		response.sendRedirect("/wait.jsp");
  	}
	%>
         
         
    </header>
  
      <div class="body-wrapper flex-grow-1">
          <section class="allvideo-artist">
            <div class="cuscontainer">
           
            <%
            if(request.getParameter("type").equalsIgnoreCase("scat"))
            {
            ResultSet rs=DataCollector.getCategory();
            try
            {
            while(rs.next())
            {
            	
            	String id=rs.getString("sub_cat_id");
            	String name=rs.getString("category");
            	String sname=rs.getString("sub_cat_name");
            	if(request.getParameter("vcat").equalsIgnoreCase(id))
            	{
            	%>
            	
  <div class="allvideo-inner rounded shadow px-5 py-5" style="background-image: url('images/');background-size: 312px;">
                <h3 class="mb-0 py-2"><%= name%> - <%=sname.toUpperCase() %></h3>
            </div>
            	<%
            	}
            }
            
            }
            catch(Exception e)
            {
            	e.printStackTrace();
            }
            
            }
            
            else
            {
            	try{
            	ResultSet rs1=DataCollector.getCategories();
            	while(rs1.next())
            	{
            		if(rs1.getString("id").equalsIgnoreCase(request.getParameter("vcat")))
            		{
            			
            	%>
            	
            	  <div class="allvideo-inner rounded shadow px-5 py-5" style="background-image: url('./images');background-size: 312px;">
            	                <h3 class="mb-0 py-2"><%=rs1.getString("category")%></h3>
            	            </div>
            	            	<%
            		}
            	}
            	 }catch(Exception e)
                {
                	e.printStackTrace();
                }
            	
            }
           
            
            %>
                
                
            </div>
        </section>
        <section class="allvideos py-4">
            <div class="cuscontainer">
<!--                 <div class="section-heading section-heading-line mb-3"> -->
<!--                     <h3 class="text-white"><span><i class="fa fa-video"></i></span> All Videos </h3> -->
<!--                 </div> -->
                <div class="row">
                  <% 
                    try{
                    	ResultSet rs3=DataCollector.getVideoByCatId(request.getParameter("vcat").toString(),request.getParameter("type").toString());
                    while(rs3.next())
                    {
                    	
                    	if(rs3.getString("playstatus").equalsIgnoreCase("1"))
                    	{
                    		 %>
                          	<div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                              <div class="allvideoinner">
                                   <a>
                                     
                                         <div class="videothumb">
                                         
                                         <img  src="<%=rs3.getString("whiteimage") %>" loading="lazy"/>
                                 <%--    <video id="my-video"   class="video-js videojs" 
         										width="250" height="250" data-setup="{}"
         										 oncontextmenu="return false"
         										 poster="<%=rs3.getString("imgurl") %>">
         										 
         										<source src="<%=rs3.getString("vurl")%>" type="video/mp4" />
         							</video>  --%>
         								   <i class="fa fa-play-circle"></i>
                                       </div>
          <!--   <div class="timing-video">
                                                 <span id="vtime">01:02</span>
                                             </div>  -->
                                         <div class="video-title">
                                             <h4><%=rs3.getString("name") %></h4>
                                         </div>
                                     </a>
                                      </div>
                                 
                              </div>
                        <% 
                    	}else
                    	{
                     %>
                 	<div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                     <div class="allvideoinner">
                          <a href="/play.jsp?videoid=<%=rs3.getString("videoid")%>">
                            
                                <div class="videothumb">
                                
                           <video id="my-video"   class="video-js videojs" 
										width="250" height="250" data-setup="{}"
										 oncontextmenu="return false"
										 poster="<%=rs3.getString("imgurl") %>">
										 
										<source src="<%=rs3.getString("vurl")%>" type="video/mp4" />
							</video> 
								   <i class="fa fa-play-circle"></i>
                              </div>
 <!--   <div class="timing-video">
                                        <span id="vtime">01:02</span>
                                    </div>  -->
                                <div class="video-title">
                                    <h4><%=rs3.getString("name") %></h4>
                                </div>
                            </a>
                             </div>
                        
                     </div>
               <% 
                    	}
                    }
                    }catch(Exception e)
                  {
                    	e.printStackTrace();
                  }
                
                    %>
                     
                   
                     </div>
                     
                    </div>
              </section>
            </div>
        
    
   
     <jsp:include page="footer.jsp"/>
</body>
</html>