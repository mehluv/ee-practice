/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import OEMEntities.Login_Master;
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
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author kiosk
 */
public class login extends HttpServlet
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
	String dm;
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try
	{
	    String lid = request.getParameter("lid");
	    String pass = request.getParameter("pass");
	    lid = lid.replace("'", "\\'");
	    pass = pass.replace("'", "\\'");
	    Session se = DAOLayer.HibDAOLayer.getSession();
	    Criteria c = se.createCriteria(Login_Master.class);
	    c.add(Restrictions.eq("lid", lid));
	    List<Login_Master> data = c.list();

	    if (data.isEmpty())
	    {
		out.println("INVALID ID/PASSWORD");
	    } else
	    {
		Login_Master l = data.get(0);
		if (l.getPassword().equals(pass))
		{
		    out.println("Successfully logged in!");
		    String role = l.getRole();
		    HttpSession session = request.getSession();
		    session.setAttribute("lid", l.getLid());
		    String fname = l.getMd().getFname();
		    session.setAttribute("fname", fname);
		    if (role.equals("admin"))
		    {
			dm = "ADMIN";
			session.setAttribute("msg", dm);
			response.sendRedirect("admin.jsp");
		    } else
		    {
			dm = "USER";
			session.setAttribute("msg", dm);
			response.sendRedirect("index.jsp");
		    }
		} else
		{
		    dm = ("INVALID ID/PASSWORD");
		    request.setAttribute("msg", dm);
		    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		    rd.forward(request, response);
		}
	    }
	}
	catch (Exception e)
	{
	    out.println("Error in processRequest" + e);
	} finally
	{
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
