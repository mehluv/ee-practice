<%@page import="OEMEntities.Login_Master"%>
<%@page import="org.hibernate.Transaction"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
ACKNOWLEDGEMENT:
Template Name: PlusBusiness
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
-->
<%  
    String ll=(String)session.getAttribute("lid");
    if (ll==null)
    {
        response.sendRedirect("index.jsp");
    }
    String m = (String) session.getAttribute("msg");
    if (m.equals("USER"))
    {
        response.sendRedirect("index.jsp");
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>@RENTerTainMent| buy happiness!</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="./layout/styles/layout.css" type="text/css" />
    </head>
    <body id="top">
        <!-- ####################################################################################################### -->
        <%@include file="head.jsp"%>
        <!-- ####################################################################################################### -->
        <div class="wrapper col2">
            <div style="align-self:center; padding:15px; background-color:black; position:relative;
                 margin:0 auto;">
                <li style="float:left;"><h3>ADMIN PANEL:</h3></li>
                <div id="topnav" style="float:right; align-self:center; " >
                    <ul>
                        <li><a href="#user">USER HANDLING</a></li>
                        <li><a href="orders.jsp">SERVICE ORDERS</a></li>
                        <li><a href="stockhandling.jsp">STOCK HANDLING</a>
                        </li>
                    </ul>
                </div>
                <br class="clear" />
            </div>
        </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper col3">
            <div id="container">
                <div id="content" style="width:auto;">
                    <h2>USER ACOUNT INFO:</h2>
                    <table class="user">
                        <thead><tr><td>Name</td><td>UserId</td><td>Balance</td><td>Status</td><td>Edit</td><td>Delete</td></tr></thead>
                        <tbody>
                            <%
                                String search = request.getParameter("usersearch");
                                Session s = DAOLayer.HibDAOLayer.getSession();
                                Transaction t = s.beginTransaction();
                                Criteria c = s.createCriteria(Login_Master.class);
                                if (search != null && !search.equals(""))
                                {
                                    c.add(Restrictions.ilike("lid", "%" + search + "%"));
                                }
                                List<Login_Master> list = c.list();
                                for (Login_Master l : list)
                                {
                            %>
                            <tr>
                                <td><%=l.getMd().getFname() + " " + l.getMd().getLname()%></td>
                                <td><%=l.getLid()%></td>
                                <td><%=l.getUa().getBalance()%></td>
                                <td><%=l.getStatus()%></td>
                                <td>
                                    <form action="editing.jsp" method="post">
                                        <input type="hidden" name="edit" value="<%=l.getLid()%>"  />
                                        <input type="submit" value="Edit"  />
                                    </form></td>
                                    <%
                                        if (l.getRole().equals("user"))
                                        {
                                    %>
                                <td>
                                    <form action="delete.jsp" method="post">
                                        <input type="hidden" name="delete" value="<%=l.getLid()%>" />
                                        <input type="submit" value="Delete" />
                                    </form></td>
                                    <%}%>
                            </tr>
                            <%
                                }
                            %>
                            <tr><td ><form action="admin.jsp"><input type="submit" value="SEARCH USER"/></td><td colspan=2><input type="search" name="usersearch" /></form></td></tr>
                        </tbody>
                    </table>


                </div>

                <br class="clear" />
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <%@include file="foot.jsp"%>
        <!----------------------------------------------------------------------------------------------->
        <%@include file="modals.jsp"%>
    </body>
</html>