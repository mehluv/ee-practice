/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import OEMEntities.Login_Master;
import OEMEntities.Order_Master;
import OEMEntities.Stock_Master;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;


public class cart extends HttpServlet
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	PrintWriter out = response.getWriter();
	try
	{
	    HttpSession session = request.getSession(false);
	    List<Order_Master> orders = (List) session.getAttribute("orders");
	    Session se = DAOLayer.HibDAOLayer.getSession();
	    Order_Master order = new Order_Master();
	    Date d = new Date();
	    String lid = (String) session.getAttribute("lid");
	    int sid = Integer.parseInt(request.getParameter("diid"));
	    Stock_Master moviec = (Stock_Master) se.get(Stock_Master.class, sid);
	    if (moviec.getQuantity()<= 0)
	    {
		out.println("<script>alert('NOT AVAILABLE RIGHT NOW');</script>");
	    } else
	    {
		Login_Master lm = (Login_Master) se.get(Login_Master.class, lid);
		order.setLm(lm);
		order.setOdate(d);
		order.setStatus("Pending");
		order.setLm(lm);
		order.setSm(moviec);
		orders.add(order);
		session.setAttribute("orders", orders);
		response.sendRedirect("search.jsp#cart");
	    }
	} catch (Exception e)
	{
	    response.sendRedirect("search.jsp");
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
