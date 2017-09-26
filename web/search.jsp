<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.List" 
         import="OEMEntities.Stock_Master"
         import="OEMEntities.Disk_Master"
         import="org.hibernate.Criteria"
         import="org.hibernate.Session"
         import="org.hibernate.criterion.Restrictions"
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
        <div class="wrapper col3">
            <div id="container">
                <div id="content">
                    <div id="comments">
                        <h2>Movies</h2>

                        <% int i;
                        
                            String search = request.getParameter("search");
                            Session se = DAOLayer.HibDAOLayer.getSession();
                            Criteria c = se.createCriteria(Stock_Master.class);
                             if (search != null && !search.equals(""))
                            {
                                c.add(Restrictions.ilike("sname", search+"%"));
                            }
                            List<Stock_Master> movies = c.list();
                            
                            if (movies.isEmpty())
                            {
                                out.println("<h2>Sorry,Nothing matched your search value</h2>");
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
                                out.print("<div class=\"detail\"><span>Price:" + price + "</span></a></div><div class=\"detail\"><span></div>");
                                out.print("<div class=\"detail\"><span>DiscId:</span>" + sid + "<span>   quantity available:</span>" + quantity + "</div><div class=\"detail\"><span>Disc-Type:</span>DVD</div>");
                                if (request.getSession(false).getAttribute("lid") != null)
                                {

                        %>
                        <div class=\"cart\">
                            <form action="cart" type='POST'>
                                <input type='hidden' name='diid' value='<%=sid%>' />
                                <input type="submit" value="ADD TO CART" class="cart"/>
                                <br />
                            </form>
                        </div>
                        <%
                            }
                        %>
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

</html>