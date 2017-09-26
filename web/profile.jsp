<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <%@page import="OEMEntities.Login_Master"
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
            <div id="breadcrumb">
                <ul>
                    <li class="first">You Are Here</li>
                    <li>&#187;</li>
                    <li><a href="#">Home</a></li>
                    <li>&#187;</li>
                    <li><a href="#">Grand Parent</a></li>
                    <li>&#187;</li>
                    <li><a href="#">Parent</a></li>
                    <li>&#187;</li>
                    <li class="current"><a href="#">Child</a></li>
                </ul>
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div style="margin:20px;">
            <%		String id = (String) session.getAttribute("lid");
                Session se = DAOLayer.HibDAOLayer.getSession();
                Criteria c = se.createCriteria(Login_Master.class);
                c.add(Restrictions.eq("lid", id));
                Login_Master l = (Login_Master) c.list().get(0);
                String fname = l.getMd().getFname();
                String lname = l.getMd().getLname();
                String city = l.getMd().getCity();
                String state = l.getMd().getState();
                String country = l.getMd().getCountry();
                String mobile = l.getMd().getMobile();
                String occu = l.getMd().getOccu();
                String email = l.getMd().getEmail();
            %>
            
                <table style="padding:5px;" class="user">

                    <tr><td>UserName</td><td colspan="2"><%=fname + " " + lname%></td></tr>
                    <tr><td>Country:</td><td><%=country%></td><td>State:</td><td><%=state%></td><td>City:</td><td><%=city%></td></tr>
                    <tr><td>Occupation:</td><td><%=occu%></td></tr>
                    <tr><td>Mobile:</td><td><%=mobile%></td></tr>
                    <tr><td>Registered Email:</td><td><%=email%></td></tr>
                    <tr><td>Balance:</td><td><%=l.getUa().getBalance()%></td><td></td><td></td><td><a style="background-color:black; color:greenyellow; font-family:verdana; font-weigth:bold; padding:10px; float:right"href="#profiledit">edit profile</a></td></tr>
                            <tr><td>In CART:<%=(String) request.getParameter("orders")%></td></tr>
                            </table>
 </div>
                            <!-- ####################################################################################################### -->
                            <%@include file="foot.jsp"%>

                            <%@include file="modals.jsp"%>
                            <!-----------------------------------------PROFILEDIT----------------------------------------------------------------------------->
                            <div id="profiledit" class="modalDialog">
                                <div>
                                    <a href="#close" title="Close" class="close">X</a>
                                    <h2>UPDATE DETAILS</h2>
                                    <form action="updateprofile" method="POST">
                                        <table class="table" style="z-index: 100000;">
                                            <tr><td>First Name:</td><td><input type="text" name="ufname" id="submit"  size="22" value="<%=l.getMd().getFname()%>"/></td></tr>
                                             <tr><td>Last Name:</td><td><input type="text" name="ulname" value="<%=l.getMd().getLname()%>" /></td></tr>
                                            <tr><td>Password:</td><td><input type="password" name="upassword" id="submit" value="<%=l.getPassword()%>"/></td>
                                                <td><small color="red">
                                                        <%--         <%
                                                        String errormsg=(String)request.getAttribute("errormsg");
                                                            %>
                                                        <%=errormsg%>--%>
                                                        ${requestScope.errormsg}
                                                    </small></td>
                                                <tr><td>Confirm Password:</td><td><input type="password" name="ucpass" id="submit" value="<%=l.getPassword()%>" /></td>
                                                    <td><small color="red">
                                                            ${requestScope.errormsg}
                                                            <%--=errormsg--%>
                                                        </small></td>
                                                    <tr><td>Mobile:</td><td><input type="text" name="umobile" id="submit" value="<%=l.getMd().getMobile()%>"/></td></tr>
                                                    <tr><td>E-Mail:</td><td><input type="text" name="uemail" id="submit" isdatepicker="true" value="<%=l.getMd().getEmail()%>"/></td></tr>
                                                    <tr><td>Occupation:</td><td><input type="text" name="uoccu" id="submit" value="<%=l.getMd().getOccu()%>"/></td></tr>
                                                    <div>
                                                        <div width=33% margin=3em float=left>
                                                            <tr><td>SELECT COUNTRY:</td><td><select name="ucountry" id="submit" value="<%=l.getMd().getCountry()%>">
                                                                        <option value="-1">SELECT</option>
                                                                        <option value="India">India</option>
                                                                        <option value="United States">United States</option>
                                                                        <option value="England">England</option>
                                                                        <option value="Italy">Italy</option>
                                                                        <option value="New Zealand">New Zealand</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </div>
                                                        <div width=33% margin=3em float=center>
                                                            <tr><td>SELECT STATE:</td><td><select name="ustate" id="submit" value="<%=l.getMd().getState()%>">
                                                                        <option value="-1">Select State</option>

                                                                        <option value="Abroad">Abroad</option>

                                                                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>

                                                                        <option value="Andhra Pradesh">Andhra Pradesh</option>

                                                                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>

                                                                        <option value="Assam">Assam</option>

                                                                        <option value="Bihar">Bihar</option>

                                                                        <option value="Chandigarh">Chandigarh</option>

                                                                        <option value="Chhattisgarh">Chhattisgarh</option>

                                                                        <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>

                                                                        <option value="Daman and Diu">Daman and Diu</option>

                                                                        <option value="Delhi (National Capital)">Delhi (National Capital)</option>

                                                                        <option value="Goa">Goa</option>

                                                                        <option value="Gujarat">Gujarat</option>

                                                                        <option value="Haryana">Haryana</option>

                                                                        <option value="Himachal Pradesh">Himachal Pradesh</option>

                                                                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>

                                                                        <option value="Jharkhand">Jharkhand</option>

                                                                        <option value="Karnataka">Karnataka</option>

                                                                        <option value="Kerala">Kerala</option>

                                                                        <option value="Lakshadweep">Lakshadweep</option>

                                                                        <option value="Madhya Pradesh">Madhya Pradesh</option>

                                                                        <option value="Maharashtra">Maharashtra</option>

                                                                        <option value="Manipur">Manipur</option>

                                                                        <option value="Meghalaya">Meghalaya</option>

                                                                        <option value="Mizoram">Mizoram</option>

                                                                        <option value="Nagaland">Nagaland</option>

                                                                        <option value="Orissa">Orissa</option>

                                                                        <option value="Puducherry">Puducherry </option>

                                                                        <option value="Punjab">Punjab</option>

                                                                        <option value="Rajasthan">Rajasthan</option>

                                                                        <option value="Sikkim">Sikkim</option>

                                                                        <option value="Tamil Nadu">Tamil Nadu</option>

                                                                        <option value="Telangana">Telangana</option>

                                                                        <option value="Tripura">Tripura</option>

                                                                        <option value="Uttar Pradesh">Uttar Pradesh</option>

                                                                        <option value="Uttarakhand">Uttarakhand</option>

                                                                        <option value="West Bengal">West Bengal</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </div>
                                                        <div width=33% margin=3em float=right>
                                                            <tr><td>City:</td><td><input type="text" name="ucity" value="<%=l.getMd().getCity()%>"/></td></tr>
                                                        </div>
                                                        <tr><td>Street:</td><td><input type="text" name="ustreet" value="<%=l.getMd().getStreet()%>"/></td></tr>
                                                    </div>
                                                    <tr><td><input type="submit" value="SAVE" /></td><td><input type="reset" value="CLEAR"/></td>
                                                        </table>
                                                        </form>

                                                        </div>
                                                        </div>
                                                        </body>
                                                        </html>