<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="entity.Perametrs"%>
<%@page import="entity.UserWatchList"%>
<%@page import="java.util.List"%>
<%@page import="services.DataCollector"%>
<%@page import="java.sql.ResultSet"%>

<%

String user =(String)session.getAttribute("ani");
if(user == null)
{
	response.sendRedirect("http://optin.telkomsdp.co.za/service/152");
}


%>
<nav class="navbar navbar-expand-lg px-md-0 py-0">
	<div class="cuscontainer container">
		<a class="navbar-brand header-logo" href="/"><img
			src="https://content.madfunny.co.za/images/TTMBHATVlogo.png"
			alt="Logo" class="img-fluid" /></a>
		<button class="navbar-toggler rounded-0 text-white" type="button"
			data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa fa-bars"></i>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="/">Home</a>
				</li>
				<!-- Category  Section -->


				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<ul class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdown">
						<%
						Perametrs param=new Perametrs();
						ResultSet set=DataCollector.getCategories();
														try {
															while (set.next()) {
																String id = set.getString("id");
                                                                 param.setVid(id);
																param = DataCollector.getSubCat(param);
                                       HashMap<String ,String> map=(HashMap)param.getMap();
																if (map.size()==0) {
						%>

						<li><a class="dropdown-item"
							href="/all.jsp?vcat=<%=id%>&type=cat"><%=set.getString("category") %></a></li>

						<%
                                    	} 
                                    	else{
                                    		
                                    		%>
						<li class="dropdown-submenu"><a
							class="nav-link dropdown-item dropdown-toggle" href="#"><%=set.getString("category") %></a>


							<ul class="dropdown-menu">
								<%   
								
								
						                   for(String i:map.keySet())
                                                    {
//                                         	  System.out.println(rs1.getString("sub_cat_id")+"###"+rs1.getString("sub_cat_name"));
                                                 	    %>
								<li><a class="dropdown-item"
									href="/all.jsp?vcat=<%=i %>&type=scat"><%=param.getMap().get(i)%></a></li>
								<% 
                                                       } 
								
// 								param.getResultset().close();

                                            %>
							</ul></li>
						<% 
                                    	}
                                    		
                                    	
                                    
                                    } 
                                    		} catch(Exception e)
                                  					  {   
                                    			e.printStackTrace(); 
                                   							 } %>
					</ul></li>




				<!-- WatchList Menu -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" oncliaria-haspopup="true"
					aria-expanded="false"> WatchList </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<% ResultSet rs=UserWatchList.getWatchListCount(user); try { while(rs.next()) { %>
						<a class="dropdown-item"
							href="/play.jsp?videoid=<%=rs.getString(1) %>"> <%=rs.getString(2) %>
						</a>
						<% } } catch(Exception e) { e.printStackTrace(); } %>
					</div>
					
					
					</li>
			</ul>
		</div>
	</div>
</nav>