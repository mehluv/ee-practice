<%-- 
    Document   : delete
    Created on : 9 Jul, 2015, 10:45:54 AM
    Author     : luv
--%>

<%
    if (session.getAttribute("lid") == null)
    {
        response.sendRedirect("index.jsp");
    }
    String m = (String) session.getAttribute("msg");
    if (session.getAttribute("msg").equals("USER"))
    {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>@RENTerTainMent| buy happiness!</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="./layout/styles/layout.css" type="text/css" />
    </head>
    <body id="top">
        <%@include file="head.jsp"%>
        <div class="wrapper col3">
            <div id="container" align="center">
                <%		    String delete = request.getParameter("delete");
                %>
                Are you sure you want to delete the user <%=delete%>?
                <br />
                <form action="deleteuser">
                    <input type="hidden" value="<%=delete%>" name="delete"/>
                    <input type="submit" value="Yes" />
                </form>
                <form action="admin.jsp">
                    <input type="submit" value="No" />
                </form>   
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <%@include file="foot.jsp"%>
        <!----------------------------------------------------------------------------------------------->
        <%@include file="modals.jsp"%>
    </body>
</html>
