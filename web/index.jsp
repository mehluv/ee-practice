
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>RENTerTainMent</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
        <script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
        <script type="text/javascript" src="layout/scripts/jquery.jcarousel.pack.js"></script>
        <script type="text/javascript" src="layout/scripts/jquery.jcarousel.setup.js"></script>
        <%@ page import="java.util.List" 
                 import="OEMEntities.Stock_Master"
                
                 import="org.hibernate.Criteria"
                 import="org.hibernate.Session"
                 import="java.util.Random"
                 import="org.hibernate.criterion.Restrictions"
                 %>
    </head>
    <body id="top">
        <!-- ####################################################################################################### -->
      <%@include file="head.jsp"%>
        <!-- ####################################################################################################### -->
        <%
        ArrayList<Order_Master> order=(ArrayList<Order_Master>)session.getAttribute("orders");
        if(order==null)
        {
            order=new ArrayList<Order_Master>();
            session.setAttribute("orders", order);
        }
        %>
        <div class="wrapper col2">
            <div id="featured_slide">
                <div id="featured_content">
                    <ul>
                        <%
                                int i;
                            Random r = new Random();
                            Session se = DAOLayer.HibDAOLayer.getSession();
                            Criteria c = se.createCriteria(Stock_Master.class);
                            List<Stock_Master> mdata = c.list();
                            for ( i = 0; i <= 2; i++)
                            {
                                
                                int v = (r.nextInt()) % (mdata.size());
                                v = (v >= 0) ? v : (-v);
                                Stock_Master sd = mdata.get(v);
                        %>

                        <li><img src="<%=sd.getImg()%>" alt="Database error" />
                            <div class="floater">
                                <h2><%=sd.getSname()%></h2>
                                <pre>Release date: <%=sd.getYear()%>
Director: <%=sd.getDirector()%>
Screenplay:<%=sd.getCast()%>
Version:<%=sd.getVersion()%>
                                </pre>
                                <p class="readmore"><a href="search.jsp?search=<%=sd.getSname()%>">Continue Reading &raquo;</a></p>
                            </div>
                        </li>
                        <%}%>
                    </ul>
                </div>
                <a href="javascript:void(0);" id="featured-item-prev"><img src="layout/images/prev.png" alt="" /></a> <a href="javascript:void(0);" id="featured-item-next"><img src="layout/images/next.png" alt="" /></a> </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper col3">
            <div id="container">
                <div class="homepage">
                    <%
                            for(int j=0;j<2;j++)
                            {
                    %>
                    <ul>
                        
                            <%
                                for(i=0;i<=2;i++)
                                {
                                    int v = (r.nextInt()) % (mdata.size());
                                v = (v >= 0) ? v : (-v);
                                Stock_Master sd = mdata.get(v);
                            %>
                            <li>
                            <h2><img src="<%=sd.getImg()%>" alt="bummer!" height="100px" width="100px" /><%=sd.getSname()%></h2>
                            <p>Release date: <%=sd.getYear()%></br>
                                Director: <%=sd.getDirector()%></br>
                                Screenplay:<%=sd.getCast()%></br>
                                Version:<%=sd.getVersion()%>
                                </p>
                                <p class="readmore"><a href="search.jsp?search=<%=sd.getSname()%>">Continue Reading &raquo;</a></p>
                        </li>
                            <%
                                }
                            %>
                            
                    </ul>
                            </br></br>
                    <br class="clear" />
                    <%
                            }
                    %>
                </div>
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper col4">
  <div id="footer">
    <div class="box1">
      <h2>A Little Company Information !</h2>
      <img class="imgl" src="es/rentertainment.jpg" alt="" />
      <p>Rentertainment has some of the best movie and tv show collections in the world. So come join us and explore a fascinating range of dvds at a nominal charge.Register Today !</p>
      <p>All Rights Reserved.</p>
    </div>
    <div class="box contactdetails">
      <h2>Our Contact Details !</h2>
      <ul>
        <li>RENTERTAINMENT Media Industries Pvt. Ltd</li>
        <li>276/1,NagendraNath Road &amp; Number</li>
        <li>Kolkata</li>
        <li>700028</li>
        <li>Tel:+917278194445</li>
        <li>Email1: mehluv@gmail.com</li>
        <li>Email2: arka.bhowmik95@.com</li>
        <li class="last">LinkedIn: <a href="#">Company Profile</a></li>
      </ul>
    </div>
      <div class="box flickrbox">
      <h2>Latest Movies !</h2>
      <div class="wrap">
        <div class="fix"></div>
           <%
                        
                            for ( i = 0; i <= 5; i++)
                            {
                                
                                int v = (r.nextInt()) % (mdata.size());
                                v = (v >= 0) ? v : (-v);
                                Stock_Master sd = mdata.get(v);
                        %>
    
                        <div class="flickr_badge_image" id="flickr_badge_image1"><a href="search.jsp?search=<%=sd.getSname()%>"><img src="<%=sd.getImg()%>" alt="" height=75px width=75px"/></a></div>
        <%
             }
        %>
       
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2015 - All Rights Reserved - <a href="">www.rentertainment.com</a></p>
    <p class="fl_right">Licensed by <a target="_blank" href="http://www.w3schools.com" title="">@RENTerTaiNment</a></p>
    <br class="clear" />
  </div>
</div>
    </body>
    <%@include file="modals.jsp"%>
 </html>