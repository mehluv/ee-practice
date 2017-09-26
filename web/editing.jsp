<%-- 
    Document   : editing
    Created on : 8 Jul, 2015, 11:10:53 PM
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
                <%String edit=request.getParameter("edit");%>
                <h2><%=edit%></h2>
                <form action="edit">
                    <table>
                        <tr><td>Mobile:</td><td><input type="text" name="mobile" id="submit"/></td></tr>
                        <tr><td>E-Mail:</td><td><input type="text" name="email" id="submit" isdatepicker="true"/></td></tr>
                        <tr><td>Occupation:</td><td><input type="text" name="occu" id="submit"/></td></tr>
                        <div>
                            <div width=33% margin=3em float=left>
                                <tr><td>SELECT COUNTRY:</td><td><select name="country" id="submit">
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
                                <tr><td>SELECT STATE:</td><td><select name="state" id="submit">
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

                                            <option value="31">Puducherry </option>

                                            <option value="Puducherry">Punjab</option>

                                            <option value="Rajasthan">Rajasthan</option>

                                            <option value="Sikkim">Sikkim</option>

                                            <option value="Tamil Nadu">Tamil Nadu</option>

                                            <option value="Telangana">Telangana</option>

                                            <option value="Tripura">Tripura</option>

                                            <option value="Uttar Pradesh">Uttar Pradesh</option>

                                            <option value="Uttarakhand">Uttarakhand</option>

                                            <option value="West Bengal">West Bengal</option>
                                        </select>
                                    </td></tr>
                                <tr>
                                    <td>Activation Status</td>
                                    <td>
                                        <select name="activated" id="submit">
                                            <option value="active">Active</option>
                                            <option value="inactive">Inactive</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Admin</td>
                                    <td>
                                        <select name="admin" id="submit">
                                            <option value="admin">Yes</option>
                                            <option value="user">No</option>
                                        </select>
                                    </td>
                                </tr>
                            </div>
                            <div width=33% margin=3em float=right>
                                <tr><td>City:</td><td><input type="text" name="city" /></td></tr>
                            </div>
                            <tr><td>Street:</td><td><input type="text" name="street" /></td></tr>
                        </div>
                        <tr><td><input type="submit" value="REGISTER" name="submit"/></td><td><input type="reset" value="CLEAR"/></td>
                    </table>
                </form>
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <%@include file="foot.jsp"%>
        <!----------------------------------------------------------------------------------------------->
        <%@include file="modals.jsp"%>
    </body>
</html>
