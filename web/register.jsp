
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>@RENTerTainMent| buy happiness!</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="./layout/styles/layout.css" type="text/css" />
<%@page import="java.util.ArrayList" %>
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
<div class="wrapper col3">
  <div id="container">
    <div id="content" style="width: 80% ">
      <h2>Register</h2>
      <div id="respond">
        <form action="signup" method="post">
          <p>
            <!--<input type="text" name="name" id="name" value="" size="22" />
            <label for="name"><small>Name (required)</small></label>!-->
          </p>
                 <table class="table">
                <tr><td>First Name:</td><td><input type="text" name="fname" id="submit"  size="22"/></td>
                    <td>Last Name:</td><td><input type="text" name="lname" /></td></tr>
                <tr><td>Login Name:</td><td><input type="text" name="lid" id="submit"  size="22"/></td>
                <tr><td>Password:</td><td><input type="password" name="password" id="submit" /></td>
                    <td><small color="red">
                            <%--         <%
                            String errormsg=(String)request.getAttribute("errormsg");
                                %>
                            <%=errormsg%>--%>
                            ${requestScope.errormsg}
                        </small></td>
                <tr><td>Confirm Password:</td><td><input type="password" name="cpass" id="submit" /></td>
                    <td><small color="red">
                             ${requestScope.errormsg}
                            <%--=errormsg--%>
                        </small></td>
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
                    <tr><td>City:</td><td><input type="text" name="city" /></td></tr>
                </div>
                    <tr><td>Street:</td><td><input type="text" name="street" /></td></tr>
                </div>
                    <tr><td><input type="submit" value="REGISTER" name="submit"/></td><td><input type="reset" value="CLEAR"/></td>
            </table>
        </form>
      </div>
    </div>
    
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
 <%@include file="foot.jsp"%>
</body>
                <%@include file="modals.jsp"%>
</html>