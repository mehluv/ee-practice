 <%@ page import="java.util.List" 
                 import="OEMEntities.Stock_Master"
                
                 import="org.hibernate.Criteria"
                 import="org.hibernate.Session"
                 import="java.util.Random"
                 import="org.hibernate.criterion.Restrictions"
                 %>
<div class="wrapper col4">
  <div id="footer">
    <div class="box1">
      <h2>A Little Company Information !</h2>
      <img class="imgl" src="es/rentertainment.jpg" alt="" />
      <p>Rentertainment has some of the best movie and tv show collections in the world. So come join us and explore a fascinating range of dvds at a nominal charge.Register Today !</p>
      <p>All Rights Reserved.</p>
    </div>
    <div class="box contactdetails">
      <h2>Our Contact Details !</h2>
      <ul>
        <li>RENTERTAINMENT Media Industries Pvt. Ltd</li>
        <li>276/1,NagendraNath Road &amp; Number</li>
        <li>Kolkata</li>
        <li>700028</li>
        <li>Tel:+917278194445</li>
        <li>Email1: mehluv@gmail.com</li>
        <li>Email2: arka.bhowmik95@.com</li>
        <li class="last">LinkedIn: <a href="#">Company Profile</a></li>
      </ul>
    </div>
      <div class="box flickrbox">
      <h2>Latest Movies !</h2>
      <div class="wrap">
        <div class="fix"></div>
           <%
                            int i1;
                            Random r = new Random();
                            Session se1 = DAOLayer.HibDAOLayer.getSession();
                            Criteria c1 = se1.createCriteria(Stock_Master.class);
                            List<Stock_Master> mdata = c1.list();
                            for ( i1 = 0; i1 <= 5; i1++)
                            {
                                
                                int v = (r.nextInt()) % (mdata.size());
                                v = (v >= 0) ? v : (-v);
                                Stock_Master sd = mdata.get(v);
                        %>
    
                        <div class="flickr_badge_image" id="flickr_badge_image1"><a href="search.jsp?search=<%=sd.getSname()%>"><img src="<%=sd.getImg()%>" height=75px width=75px alt="" /></a></div>
        <%
             }
        %>
        <div class="fix"></div>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2015 - All Rights Reserved - <a href="#">www.rentertainment.com</a></p>
    <p class="fl_right">Licensed by <a target="_blank" href="http://www.w3schools.com" title="">@RENTerTaiNment</a></p>
    <br class="clear" />
  </div>
</div>