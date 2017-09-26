
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
        <!-- ####################################################################################################### -->
        <div class="wrapper col3">
            <div id="container">
                <div id="content"> 
                    <div id="comments" >
                        <h2 id="editviewstock">View Stock</h2>
                        <form action="stockhandling.jsp"><td><input type="submit" value="SEARCH"/><input type="search" name="valuesearch" /></form>
                        <% 
                            String search = request.getParameter("valuesearch");
                            Session se = DAOLayer.HibDAOLayer.getSession();
                            Criteria c = se.createCriteria(Stock_Master.class);
                                 if (search != null && !search.equals(""))
                            {
                                c.add(Restrictions.ilike("sname", search+"%"));
                            }
                            List<Stock_Master> movies = c.list();
                            if (movies.isEmpty())
                            {
                                return;
                            }
                            String mimg, cast, director, name, ryear, descp, version;
                            float price;
                            int sid, quantity;

                            for (Stock_Master dm : movies)
                            {

                                mimg = dm.getImg();
                                name = dm.getSname();
                                cast = dm.getCast();
                                director = dm.getDirector();
                                ryear = dm.getYear();
                                descp = dm.getDm().getDdesc();
                                price = dm.getPrice();
                                sid = dm.getSid();
                                quantity = dm.getQuantity();
                                version = dm.getVersion();
                                out.print("<ul class=\"commentlist\"><li class=\"comment_odd\"><div>");
                                out.print("<div class=\"author\"><img src=\"" + mimg + "\" width=\"100%\" height=auto;  alt=\"images are disabled\" /></div><div class=\"description\">");
                                out.print("<div class=\"name\"><a href=\"#\">" + name + "</a></div><div class=\"detail\"><span>Release Year:</span>" + ryear + "</a></div>");
                                out.print("<div class=\"detail\"><span>Cast:</span>" + cast + "</div><div class=\"detail\"><span>Director:</span>" + director + "</div>");
                                out.print("<span>Description:</span>" + descp + "<span>  Version:  " + version + "</span>");
                                out.print("<div class=\"detail\"><span>Price:" + price + "</span></a></div><div class=\"detail\"></div>");
                                out.print("<div class=\"detail\"><span>DiscId:</span>" + sid + "<span>   quantity available:</span>" + quantity + "</div><div class=\"detail\"><span>Disc-Type:</span>DVD</div>");
                        %>
                        <div class=\"cart\">
                            <table>
                                <td>
                            <form action="editmovie.jsp">
                                <input type='hidden' name='msid' value='<%=sid%>' />
                                <input type="submit" value="EDIT" class="cart" />
                                <br />
                            </form>
                                </td><td>
                                <form action="delete">
                                <input type='hidden' name='msid' value='<%=sid%>' />
                                <input type="submit" value="DELETE" class="cart"/>
                                <br/>
                            </form>
                                </td>
                                </table>
                        </div>
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
        <h2 id="add">Add TO Stock</h2>
        <form action='savemovie'>
            <div style="width:85%;background-color:rgb(219, 214, 214);">
                <div style="float:left; width:70%;">
                    <table>
                        <tr><td>Name:</td><td><input type="text" name="shsname"></td></tr>
                        <tr><td>Casting:</td><td><input type="text" name="shcast"></td></tr>
                        <tr><td>Director:</td><td><input type="text" name="shdirector"></td></tr>
                        <tr><td>Version:</td><td><input type="text" name="shversion"></td></tr>
                        <tr><td>Release Year:</td><td><input type="text" name="shyear"></td></tr>
                        <tr><td>Price:</td><td><input type="text" name="shprice"></td></tr>
                        <tr><td>Stock Quantity:</td><td><input type="text" name="shquantity"></td></tr>
                        <tr><td>Disk Decription:</td><td><select name="shdesc" id="submit">
                                    <option value="CD">CD</option>
                                    <option value="DVD">DVD</option>
                                </select></td></tr>
                        <tr><td>ImageSource:</td><td><input type="text" name="shimg"></td></tr>
                        <tr><td colspan='2'><input type="submit" value="SAVE" class="cart"/></td></tr>
                    </table>
                </div>
                <div style="float:right; width:30%;">
                    <input type='image' name='shimg' height=300px width=300px margin-top=10px/>
                </div>
                <br class="clear" />
            </div>
        </form>

        <br class="clear" />
        </div>
        </div>
        </div>
        <!-- ####################################################################################################### -->
        <%@include file="foot.jsp"%>
        <!----------------------------------------------------------------------------------------------->
    </body>
    <%@include file="modals.jsp"%>
</html>