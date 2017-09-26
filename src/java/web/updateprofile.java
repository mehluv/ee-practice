/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import OEMEntities.Login_Master;
import OEMEntities.Member_Detail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author kiosk
 */
public class updateprofile extends HttpServlet
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
	    Login_Master l;
	    HttpSession session = request.getSession(false);
	    String ulid = (String) session.getAttribute("lid");

	    Session se = DAOLayer.HibDAOLayer.getSession();
	    l = (Login_Master) se.get(Login_Master.class, ulid);
	    String ufname = request.getParameter("ufname");
	    String ulname = request.getParameter("ulname");
	    String ucity = request.getParameter("ucity");
	    String ustate = request.getParameter("ustate");
	    String ucountry = request.getParameter("ucountry");
	    String umobile = request.getParameter("umobile");
	    String uoccu = request.getParameter("uoccu");
	    String uemail = request.getParameter("uemail");
	    String upass = request.getParameter("upassword");
	    String ucpass = request.getParameter("ucpass");
	    String ustreet = request.getParameter("ustreet");
	    String errormsg = null;
	    if (upass != null && !upass.equals(""))
	    {

		if (!upass.equals(ucpass))
		{
		    errormsg = "passwords dont match!";
		    RequestDispatcher rd = request.getRequestDispatcher("profile.jsp#profiledit");
		    rd.forward(request, response);
		} else
		{
		    Transaction t = se.beginTransaction();
		    l.setPassword(upass);
		    Member_Detail md = l.getMd();
		    md.setFname(ufname);
		    md.setLname(ulname);
		    md.setCountry(ucountry);
		    md.setState(ustate);
		    md.setCity(ucity);
		    md.setMobile(umobile);
		    md.setOccu(uoccu);
		    md.setEmail(uemail);
		    md.setStreet(ustreet);
		    l.setMd(md);
		    se.update(md);
		    se.update(l);
		    t.commit();
		    response.sendRedirect("profile.jsp");
		}
	    } else
	    {
		errormsg = "Password cannot be blank!";
		RequestDispatcher rd = request.getRequestDispatcher("profile.jsp#profiledit");
		rd.forward(request, response);
	    }

	} catch (Exception e)
	{
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
