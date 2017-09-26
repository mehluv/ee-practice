<%    if (session.getAttribute("lid") == null)
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
    <%@ page import="java.util.List" 
             import="OEMEntities.Stock_Master"
             import="OEMEntities.Disk_Master"
             import="org.hibernate.*"
             import="org.hibernate.criterion.Restrictions"
             %>
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
                        <li><a href="#orders">PLACED ORDERS</a></li>
                        <li><a href="#balance">BALANCE ENQUIRY</a></li>
                        <li><a href="#orders">SERVICE ORDER</a></li>
                        <li><a href="stockhandling.jsp">STOCK HANDLING</a>
                            <ul>
                                <li><a href="#addstock">Add CD/DVD</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <br class="clear" />
            </div>
        </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper col3">
            <form action='editmoviesave'>
                <div style="width:80%;background-color:rgb(219, 214, 214);" >
                    <%  Session se = DAOLayer.HibDAOLayer.getSession();
                    if(request.getParameter("msid")==null)
                    {
                        response.sendRedirect("index.jsp");
                    }
                        int sid = Integer.parseInt(request.getParameter("msid"));
                        Stock_Master stock = (Stock_Master) se.get(Stock_Master.class, sid);
                    %>
                    <div style="float:left; align-self:center; width:70%;">
                        <table>
                            <input type="hidden" value="<%=sid%>" name="msid" />
                            <tr><td>Name:</td><td><input type="text" name="msname" value='<%=stock.getSname()%>'></td></tr>
                            <tr><td>Casting:</td><td><input type="text" name="mcast" value='<%=stock.getCast()%>'></td></tr>
                            <tr><td>Director:</td><td><input type="text" name="mdirector" value='<%=stock.getDirector()%>'></td></tr>
                            <tr><td>Version:</td><td><input type="text" name="mversion" value='<%=stock.getVersion()%>'></td></tr>
                            <tr><td>Release Year:</td><td><input type="text" name="myear" value='<%=stock.getYear()%>'></td></tr>
                            <tr><td>Price:</td><td><input type="text" name="mprice" value='<%=stock.getPrice()%>'></td></tr>
                            <tr><td>Stock Quantity:</td><td><input type="text" name="mquantity" value='<%=stock.getQuantity()%>'/></td></tr>
                            <tr><td>Disk Decription:</td><td><select name="mdesc" id="submit" value='<%=stock.getDm().getDdesc()%>'/>
                                    <option value="CD">CD</option>
                                    <option value="DVD">DVD</option>
                                    </select></td></tr>
                            <tr><td>ImageSource:</td><td><input type="text" name="mimg" value='<%=stock.getImg()%>'></td></tr>
                            <tr><td colspan='2'><input type="submit" value="SAVE" id="cart"/></td></tr>
                        </table>
                        <br class="clear" />
                    </div>
                    <div style="float:right; width:30%;">
                        <img height=300px width=300px src="<%=stock.getImg()%>"/>
                    </div>
                    <br class="clear" />
            </form>
        </div>                            
        <br class="clear" />

        <!-- ####################################################################################################### -->
        <%@include file="foot.jsp"%>
        <!----------------------------------------------------------------------------------------------->
    </body>
    <%@include file="modals.jsp"%>
</html>