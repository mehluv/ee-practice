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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author luv
 */
public class Edit extends HttpServlet
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
	try {
	    HttpSession session = request.getSession(false);
	    /* TODO output your page here. You may use following sample code. */
	    String city = request.getParameter("city");
	    String street = request.getParameter("street");
	    String state = request.getParameter("state");
	    String country = request.getParameter("country");
	    String mobile = request.getParameter("mobile");
	    String occu = request.getParameter("occu");
	    String email = request.getParameter("email");
	    String activated = request.getParameter("activated");
	    String admin = request.getParameter("admin");
	    Session s = DAOLayer.HibDAOLayer.getSession();
	    String lid = (String) session.getAttribute("lid");
	    Transaction t = s.beginTransaction();
	    Criteria c = s.createCriteria(Login_Master.class);
	    c.add(Restrictions.eq("lid", lid));
	    List<Login_Master> data = c.list();
	    Login_Master l = data.get(0);
	    l.setStatus(activated);
	    l.setRole(admin);
	    l.setLid(lid);
	    Member_Detail md = l.getMd();
	    md.setCountry(country);
	    md.setState(state);
	    md.setCity(city);
	    md.setMobile(mobile);
	    md.setOccu(occu);
	    md.setEmail(email);
	    md.setStreet(street);
	    l.setMd(md);
	    s.update(md);
	    s.update(l);
	    t.commit();
	    response.sendRedirect("admin.jsp");
	} catch (Exception e) {
	    e.printStackTrace(out);
	} finally {
	    out.close();
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
