/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import OEMEntities.Login_Master;
import OEMEntities.Member_Detail;
import OEMEntities.User_Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author kiosk
 */
public class Signup extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try
	{

	    String errormsg;
	    String lid = request.getParameter("lid");
	    String fname = request.getParameter("fname");
	    String lname = request.getParameter("lname");
	    String city = request.getParameter("city");
	    String street = request.getParameter("street");
	    String state = request.getParameter("state");
	    String country = request.getParameter("country");
	    String mobile = request.getParameter("mobile");
	    String pass = request.getParameter("password");
	    String pass2 = request.getParameter("cpass");
	    String occu = request.getParameter("occu");
	    String email = request.getParameter("email");
	    if (pass != null)
	    {
		if (!pass.equals(pass2))
		{
		    errormsg = "passwords dont match!";
		} else
		{
		    Session s = DAOLayer.HibDAOLayer.getSession();
		    Transaction t = s.beginTransaction();
		    Criteria c = s.createCriteria(Login_Master.class);
		    c.add(Restrictions.eq("lid", lid));
		    List<Login_Master> data = c.list();
		    if (!data.isEmpty())
		    {
			out.println("User ID already exists.");
		    } else
		    {
			Login_Master l = new Login_Master();
			l.setPassword(pass);
			l.setStatus("active");
			l.setRole("user");
			l.setLid(lid);
			Member_Detail md = new Member_Detail();
			md.setFname(fname);
			md.setLname(lname);
			md.setCountry(country);
			md.setState(state);
			md.setCity(city);
			md.setMobile(mobile);
			md.setOccu(occu);
			md.setEmail(email);
			md.setStreet(street);
			l.setMd(md);
			User_Account ua=new User_Account();
			ua.setBalance(0);
			l.setUa(ua);
			s.save(ua);
			s.save(md);
			s.save(l);
			t.commit();
			out.println("<body>");
			out.println("<html>");
			out.println("<h1>RenterTainMent Signup at " + request.getContextPath() + "</h1>");
			out.println("<h2>Signup successful!</h2>");
			out.println("<a href=\"index.jsp\">go to home to login now</a>");
			out.println("</body>");
			out.println("</html>");

		    }
		}
	    }

	} catch (Exception e)
	{
	    out.print(e);
	    e.printStackTrace(out);
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
	return "Short description";
    }// </editor-fold>

}
