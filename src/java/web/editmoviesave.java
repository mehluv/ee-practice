/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import OEMEntities.Stock_Master;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author kiosk
 */
public class editmoviesave extends HttpServlet
{

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try
	{
	    Session se = DAOLayer.HibDAOLayer.getSession();
	    int sid = Integer.parseInt(request.getParameter("msid"));
	    Stock_Master stock = (Stock_Master) se.get(Stock_Master.class, sid);
	    String sname = request.getParameter("msname");
	    String year = request.getParameter("myear");
	    String cast = request.getParameter("mcast");
	    String director = request.getParameter("mdirector");
	    String img = request.getParameter("mimg");
	    int quantity = Integer.parseInt(request.getParameter("mquantity"));
	    float price = Float.parseFloat(request.getParameter("mprice"));
	    String version = request.getParameter("mversion");
	    String desc = request.getParameter("desc");

	    stock.setImg(img);
	    stock.setSname(sname);
	    stock.setCast(cast);
	    stock.setDirector(director);
	    stock.setYear(year);
	    stock.setVersion(version);
	    stock.setQuantity(quantity);
	    stock.setPrice(price);
	    stock.getDm().setDdesc(desc);
	    Transaction t = se.beginTransaction();
	    se.update(stock.getDm());
	    se.update(stock);
	    t.commit();
	    request.setAttribute("message", "MOVIE DATABASE UPDATED !");
           response.sendRedirect("editmovie.jsp?msid="+sid);
	} 
	catch(Exception e)
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
