

<%-- 
    Document   : orders
    Created on : 11 Jul, 2015, 12:01:16 PM
    Author     : luv
--%>

<%@page import="org.hibernate.criterion.Order"%>
<%@page import="OEMEntities.*"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    if (session.getAttribute("lid") == null)
    {
        response.sendRedirect("index.jsp");
    }
    String m = (String) session.getAttribute("msg");
    if (session.getAttribute("msg").equals("USER"))
    {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./layout/styles/layout.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
    <body id="top">
        <!-- ####################################################################################################### -->
        <%@include file="head.jsp"%>
        <!-- ####################################################################################################### -->
         <!-- ####################################################################################################### -->
        <div class="wrapper col2">
            <div style="align-self:center; padding:15px; background-color:black; position:relative;
                 margin:0 auto;">
                <li style="float:left;"><h3>ADMIN PANEL:</h3></li>
                <div id="topnav" style="float:right; align-self:center; " >
                    <ul>
                        <li><a href="admin.jsp#user">USER HANDLING</a></li>
                        
                        <li><a href="orders.jsp">SERVICE ORDER</a></li>
                        <li><a href="stockhandling.jsp">STOCK HANDLING</a>
                            <ul>
                                <li><a href="#add">Add CD/DVD</a></li>
                                
                            </ul>
                        </li>
                    </ul>
                </div>
                <br class="clear" />
            </div>
        </div>
        </div>
        <!--###########################################################################################-->
        <div class="wrapper col3">
            <div id="container">
                <div id="content">
                    <div id="comments">
                        <h2>Movies</h2>

                        <% int i;

                            String search = request.getParameter("search");
                            Session se = DAOLayer.HibDAOLayer.getSession();
                            Criteria c = se.createCriteria(Order_Master.class);

                            c.addOrder(Order.asc("status"));
                            List<Order_Master> movies = c.list();

                            if (movies.isEmpty())
                            {
                                out.println("<h2>No orers to service</h2>");
                                return;
                            }
                            String mimg, cast, director, name, ryear, descp, version, odate, stat, nam;
                            float price;
                            int sid, quantity;

                            for (Order_Master om : movies)
                            {
                                Stock_Master dm = om.getSm();
                                Member_Detail md = om.getLm().getMd();
                                mimg = dm.getImg();
                                name = dm.getSname();
                                cast = dm.getCast();
                                director = dm.getDirector();
                                ryear = dm.getYear();
                                //descp = dm.getDm().getDdesc();
                                price = dm.getPrice();
                                sid = dm.getSid();
                                quantity = dm.getQuantity();
                                version = dm.getVersion();
                                odate = om.getOdate().toString();
                                stat = om.getStatus();
                                nam = md.getFname() + " " + md.getLname();
                                out.print("<ul class=\"commentlist\"><li class=\"comment_odd\"><div>");
                                out.print("<div class=\"author\"><img src=\"" + mimg + "\" width=\"100%\" height=auto;  alt=\"images are disabled\" /></div><div class=\"description\">");
                                out.print("<div class=\"name\"><a href=\"#\">" + name + "</a></div><div class=\"detail\"><span>Release Year:</span>" + ryear + "</a></div>");
                                out.print("<div class=\"detail\"><span>Cast:</span>" + cast + "</div><div class=\"detail\"><span>Director:</span>" + director + "</div>");
                                out.print("<span>  Version:  " + version + "</span>");
                                out.print("<div class=\"detail\"><span>Price:" + price + "</span></a></div><div class=\"detail\"><span></div>");
                                out.print("<div class=\"detail\"><span>DiscId:</span>" + sid + "<span>   quantity available:</span>" + quantity + "</div><div class=\"detail\"><span>Disc-Type:</span>DVD</div>");
                        %>
                        <div class="detail"><span>Ordered by:</span> <%=nam%><span> on: </span><%=odate%></div>
                        <div class="detail"><span>Status: </span><%=stat%></div>
                        <%
                            if (stat.equals("Pending"))
                            {
                        %>
                        <div>
                            <form action="service" type='POST'>
                                <input type='hidden' name='oid' value='<%=om.getOid()%>' />
                                <input type="submit" value="Service" class="cart"/>
                                <br />
                            </form>
                        </div>
                        <%}%>
                    </div>
                    <br class="clear" />
                </div>
                </li>
                </ul>
                <%
                    }
                %>
            </div>
        </div>
        <br class="clear" />
    </div>
</div>
<!-- ####################################################################################################### -->
<%@include file="foot.jsp"%>
<%@include file="modals.jsp"%>
</body>
</body>
</html>
