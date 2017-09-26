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
import java.util.List;
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
public class checkout extends HttpServlet
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
	     
	    /* TODO output your page here. You may use following sample code.*/
	    HttpSession session=request.getSession(false);
	    ArrayList<Order_Master> orders=(ArrayList)session.getAttribute("orders");
	    Session se = DAOLayer.HibDAOLayer.getSession();
	    response.sendRedirect("index.jsp");
	    Stock_Master sm;
	    Transaction t=se.beginTransaction();
	    if(orders.isEmpty())
	    {
		out.println("Empty Cart");
		return;
	    }
	    for(Order_Master e:orders)
	    {
		sm=e.getSm();
		sm.setQuantity(sm.getQuantity()-1);
		se.update(sm);
		se.save(e);
	
	    }
	    
	    t.commit();
	    orders.clear();
	    session.setAttribute("orders", orders);
	    response.sendRedirect("search.jsp");
	    
	}catch (Exception e)
	{
	    out.println(e);
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
