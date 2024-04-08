<%@page import="services.UserValidation"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="services.DataCollector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="head.jsp" />

<%

//     String user=(String)session.getAttribute("ani");
//         int counts =UserValidation.checkUser(user, "TT Mbha TV");
// 	if( user == null)
// 	{
// 		response.sendRedirect("http://optin.telkomsdp.co.za/service/152");
// 	}
// 	else if(counts == 0)
//   	{
//   		response.sendRedirect("/wait.jsp");
//   	}

	%>
</head>
<body class="d-flex min-vh-100 flex-column">
	<header>
		<jsp:include page="nav.jsp" />

	</header>

	<%
    
    DataCollector colec=new DataCollector();

    %>
	<div class="body-wrapper flex-grow-1">

		<section class="cusslider mb-4">
			<div class="cuscontainer">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
				
					</ol>
					
					<div class="carousel-inner">

						<div class="carousel-item active" data-interval="3000">
							<img src="images/ttmbhacrousal.jpg" class="d-block w-100" alt="Memes">
						</div>
					</div>
				</div>
			</div>
		</section>

	<%-- 	<section class="secartist over-hidden py-3">
			<div class="cuscontainer">
				 <div class="artist-inner cusslider-slick">
                    <div class="section-heading">
                        <h3 class="text-white"><span><i class="fa fa-user"></i></span> Our Artist</h3>
                    </div>
                    <div class="artistslider mb-0">
                        
                        
                         <%     

                      		  ResultSet rs=colec.getArtist();   
                      
                              String imgurl=null;
                              String name=null;
                              String cat=null;
                              String id = null;
                                try
                                {
                                	while(rs.next())
                                	{
                                		imgurl=rs.getString("url");
                                		  name=rs.getString("artist");
                                		  cat=rs.getString("category");
                                		  id=rs.getString("id");
                                		  
                                		  
                                		  %>
                        
                         <div>
                            <a href="/Madfunny1/all.jsp?vcat=<%= id%>&type=artist">
                                <div class="artistimg">
                                    <img src="<%=imgurl %>" alt="Artist Name" class="img-fluid" />
                                </div>
                                <div class="artist-content">
                                    <h4><%=name %></h4>
                                    <h5 class="comedy-type"><%=cat %></h5>
                                </div>
                            </a>
                        </div>
                         <% 
                             }
                  						 } catch (Exception e) {
						 e.printStackTrace();
						 }
 %>
                      
                 </div>
                </div>
			</div>
		</section>--%>
		
		
		<%     
                     ResultSet set=DataCollector.getCategories();   
				       
                         try
                              {
                              while(set.next())
                              	{
                            	  
                            	  ResultSet rs1=null;
                           	  
                                      //rs1=DataCollector.getSubCat(set.getString("id"));
  
                                          if(rs1==null){
                                        	  rs1=DataCollector.getVideoByCatId(set.getString("id"),"cat");
                                		 %>
		<section class="secvideos over-hidden py-3" loading="lazy">
			<div class="cuscontainer">
				<div class="random-video cusslider-slick">
					<div class="section-heading">
						<h3 class="text-white" >
							<span><i class="fa fa-video"></i></span>
							<%=set.getString("category") %></h3>
					</div>
					<div>
						<div class="randomvideo mb-0">
							<% 
                                 
                                 	while(rs1.next())	  
                                	{
                                		String vurl=rs1.getString("vurl");
                                		String vcat=rs1.getString("category");
                                		String imurl=rs1.getString("imgurl");
                                		String videoid=rs1.getString("videoid");
                                		String playstatus=rs1.getString("playstatus");
                                		String whiteimage=rs1.getString("whiteimage");
//                                 		 if(vcat.equalsIgnoreCase(set.getString("category")))
//                                 	{
                                		if(playstatus.equalsIgnoreCase("1"))
                                		{
                                			
                                			%>
                							<a >
                								<div class="videothumb" id="loader">
                									<img  src="<%=whiteimage %>" class="img-fluid"
                										loading="lazy" />
                									<div class="play-icon">
                										<i class="fa fa-play-circle"></i>
                									</div>
                									<!-- <div class="timing-video"> <span>01:02</span></div> -->
                								</div>
                								
                							</a>
                							<%
                                			
                                		}
                                		else
                                		{

                                		%>
							<a href=<%="/play.jsp?videoid="+videoid  %>>
								<div class="videothumb" id="loader">
									<img  src="<%=imurl %>" class="img-fluid"
										loading="lazy" />
									<div class="play-icon">
										<i class="fa fa-play-circle"></i>
									</div>
									<!-- <div class="timing-video"> <span>01:02</span></div> -->
								</div>
								
							</a>
							<%
                                		}
// 					            }
             }
                                 %>
						</div>
					</div>
				</div>
			</div>
		</section>

		<%
		}
		     else {

				while (rs1.next()) {
			ResultSet subrs = colec.getData(rs1.getString("sub_cat_id"));
		%>
		<section class="secvideos over-hidden p1y-3">
			<div class="cuscontainer">
				<div class="random-video cusslider-slick">
					<div class="section-heading">
						<h3 class="text-white">
							<span><i class="fa fa-video"></i></span>
							<%=set.getString("category")%>
							-
							<%=rs1.getString("sub_cat_name")%></h3>
					</div>
					<div>
						<div class="randomvideo mb-0">
							<%
							while (subrs.next()) {
								String vurl = subrs.getString("vurl");
								String vcat = subrs.getString("category");
								String imurl = subrs.getString("imgurl");
								String videoid = subrs.getString("videoid");
								%>
							<a href=<%="/play.jsp?videoid=" + videoid%>>
								<div class="videothumb" id="loader">
									<img src="<%=imurl%>" src="<%=imurl%>" class="img-fluid" />
									<div class="play-icon">
										<i class="fa fa-play-circle"></i>
									</div>
									<div class="timing-video">
										<!--                                     <span>01:02</span>
                                   -->
									</div>
								</div>
								<div class="video-title">
									<!--  <h4>Kwaito Commission of Inquiry</h4> -->
								</div>
							</a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</section>

		<%
		}

		}
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>





	</div>


	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>