<div class="wrapper col1">
    <div id="header">
        <div id="logo">
            <h1><a href="index.jsp">@RENTerTainMent</a></h1>
            <p>only the best entertainment collections</p>
        </div>
        <div id="topnav">
            <ul>
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="contact.jsp">CONTACT US</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li>
                    <%
                        String lid = (String) session.getAttribute("lid");
                        if ((lid)!=null)
                        {
                            String fname = (String) session.getAttribute("fname");
                            %>
                            <a href="#">WELCOME <%=fname%></a>
                            <ul>
                                <li><a href="profile.jsp">Profile</a></li>
                                <li><a href="#cart">CART</a></li>
                                <%
                                    if(session.getAttribute("msg").equals("ADMIN"))
                                    {
                                %>
                                <li><a href="admin.jsp">Admin Panel</a></li>
                                <%
                                    }
                                %>
                                <li><a href="logout">LogOut</a></li></ul>
                    <%
                            //out.print("<a href=\"#\">WELCOME " + fname + "</a><ul><li><a href=\"profile.jsp\">Profile</a></li><li><a href=\"#cart\">CART</a></li><li><a href=\"logout\">LogOut</a></li></ul>");
                        } else
                        {
                    %>
                    <a href="#">JOIN US</a>
                    <ul>
                        <li><a href="#openModal">Login</a></li>
                        <li><a href="register.jsp">SignUp</a></li>                        
                    </ul>
                    <% }
                    %>
                </li>
                <li><table class="navg"><form action="search.jsp"><td><input type="submit" value="SEARCH"/></td><td><input type="search" name="search" /></td></form></table></li>
            </ul>
        </div>
        <br class="clear" />
    </div>
</div>

<!--++++++++++++++++++++++++++++++++modal+++++++++++++++++++++++++++++++++++++++++++-->
