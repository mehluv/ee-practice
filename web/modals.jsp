<!--++++++++++++++++++++++++++++++++modal+++++++++++++++++++++++++++++++++++++++++++-->
<%@page import="java.util.ArrayList"
        import="OEMEntities.Order_Master"%>
<div id="openModal" class="modalDialog">
    <div>
        <a href="#close" title="Close" class="close">X</a>
        <h2>Login Portal</h2>
        <form action="login" method="POST">
            Your Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="lid"/><br />
            Password:&nbsp;&nbsp;<input type="password" name="pass" />
            <input type="submit" value="LOGIN" class="cart"/></br>
            <font color="red">
            <%
                String message = (String) request.getAttribute("msg");
                if (message != null)
                {
                    out.println(message);
                }
            %>
            </font>
            not a member?<a href="register.jsp" style="background-color:black;">   SignUp!   </a><br/>
        </form>
    </div>
</div>
<!-------------------------------------------CART MODAL WINDOW----------------------------------->
<div id="cart" class="modalDialog">
    <div>
        <a href="#close" title="Close" class="close">X</a>
        <img src="" height=auto weight=auto float=left><h2 float=left>Cart</h2>
    </div>
    <br class="clear" /><div>
        <table>
            <thead>
                <tr><td></td><td>Movie</td><td>Price</td></tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Order_Master> orders = (ArrayList) session.getAttribute("orders");
                    if (orders != null)
                        for (Order_Master o : orders)
                        {
                %>
                <tr><td><img src="<%=o.getSm().getImg()%>" height=30px width=30px /></td><td><%=o.getSm().getSname()%></td>
                    <td><%=o.getSm().getPrice()%></td>
                    <td><form action="remove" method="POST"><input type="hidden" name="oid" value="<%=o.getOid()%>" /><input value="Remove" type="submit"  /></form></td></tr>
                            <% }%>
                <tr><td colspan=2><span float=left>total</span></td><td>
                        <%
                            float amount = 0;
                            if (orders != null)
                            {
                                for (Order_Master o : orders)
                                {
                                    amount += o.getSm().getPrice();
                                }
                            }
                        %>
                        <%=amount%>
                    </td></tr>
            </tbody>
        </table>
        <form action="checkout" method="POST"><input type="submit" value="CHECKOUT" class="cart"/></form></br>
    </div>       

</div>