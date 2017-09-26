
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
                <tr><td>First Name:</td><td><input type="text" name="fname" id="submit"  size="22"/></td><td>Last Name:</td><td><input type="text" name="lname" /></td></tr>
                <tr><td>Login Name:</td><td><input type="text" name="lid" id="submit"  size="22"/></td>
                <tr><td>Password:</td><td><input type="password" name="password" id="submit" /></td>
                    <td><small color="red">
                            <%
                            String errormsg=(String)request.getAttribute("errormsg");
                                %>
                            <%=errormsg%>
                        </small></td>
                <tr><td>Confirm Password:</td><td><input type="password" name="cpass" id="submit" /></td>
                    <td><small color="red">
                            
                            <%=errormsg%>
                        </small></td>
                <tr><td>Mobile:</td><td><input type="text" name="mobile" id="submit"/></td></tr>
                <tr><td>E-Mail:</td><td><input type="text" name="email" id="submit" isdatepicker="true"/></td></tr>
                <tr><td>Occupation:</td><td><input type="text" name="occu" id="submit"/></td></tr>
                <div>
                    <%
                        String[] country={"India","United States","England","Italy","New-Zealand"};
                       
                        
                    %>
                <div width=33% margin=3em float=left>
                    <tr><td>SELECT COUNTRY:</td><td><select name="country" id="submit">
                        <option value="-1">SELECT</option>
                        <option value="in">India</option>
                        <option value="us">United States</option>
                        <option value="en">England</option>
                        <option value="it">Italy</option>
                        <option value="nz">New-Zealand</option>
                        </select>
                        </td>
                    </tr>
                </div>
                <div width=33% margin=3em float=center>
                    <tr><td>SELECT STATE:</td><td><select name="state" id="submit">
                        <option value="-1">Select State</option>
              
              <option value="38">Abroad</option>
              
              <option value="32">Andaman and Nicobar Islands</option>
              
              <option value="1">Andhra Pradesh</option>
              
              <option value="2">Arunachal Pradesh</option>
              
              <option value="3">Assam</option>
              
              <option value="4">Bihar</option>
              
              <option value="29">Chandigarh</option>
              
              <option value="5">Chhattisgarh</option>
              
              <option value="33">Dadra and Nagar Haveli</option>
              
              <option value="34">Daman and Diu</option>
              
              <option value="30">Delhi (National Capital)</option>
              
              <option value="6">Goa</option>
              
              <option value="7">Gujarat</option>
              
              <option value="8">Haryana</option>
              
              <option value="9">Himachal Pradesh</option>
              
              <option value="10">Jammu and Kashmir</option>
              
              <option value="11">Jharkhand</option>
              
              <option value="12">Karnataka</option>
              
              <option value="13">Kerala</option>
              
              <option value="35">Lakshadweep</option>
              
              <option value="14">Madhya Pradesh</option>
              
              <option value="15">Maharashtra</option>
              
              <option value="16">Manipur</option>
              
              <option value="17">Meghalaya</option>
              
              <option value="18">Mizoram</option>
              
              <option value="19">Nagaland</option>
              
              <option value="20">Orissa</option>
              
              <option value="31">Puducherry </option>
              
              <option value="21">Punjab</option>
              
              <option value="22">Rajasthan</option>
              
              <option value="23">Sikkim</option>
              
              <option value="24">Tamil Nadu</option>
              
              <option value="37">Telangana</option>
              
              <option value="25">Tripura</option>
              
              <option value="26">Uttar Pradesh</option>
              
              <option value="27">Uttarakhand</option>
              
              <option value="28">West Bengal</option>
                        </select>
                        </td>
                    </tr>
                </div>
                <div width=33% margin=3em float=right>
                    <tr><td>City:</td><td><input type="text" name=""city"/></td></tr>
                </div>
                    <tr><td>Street:</td><td><input type="text" name="street" /></td></tr>
                </div>
                <tr><td>UPLOADPHOTO:</td><td><input type="file" name="dp" id="submit"/></td></tr>
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