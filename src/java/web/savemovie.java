/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import OEMEntities.Disk_Master;
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
public class savemovie extends HttpServlet
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
	    String sname = request.getParameter("shsname");
	    String year = request.getParameter("shyear");
	    String cast = request.getParameter("shcast");
	    String director = request.getParameter("shdirector");
	    String img = request.getParameter("shimg");
	    int quantity = Integer.parseInt(request.getParameter("shquantity"));
	    float price = Float.parseFloat(request.getParameter("shprice"));
	    String version = request.getParameter("shversion");
	    String desc = request.getParameter("desc");
	    Disk_Master dm=new Disk_Master();
	    Stock_Master sm=new Stock_Master();
	    dm.setDdesc(desc);
	    sm.setImg(img);
	    sm.setSname(sname);
	    sm.setCast(cast);
	    sm.setDirector(director);
	    sm.setYear(year);
	    sm.setVersion(version);
	    sm.setQuantity(quantity);
	    sm.setPrice(price);
	    sm.setDm(dm);
	    Session se=DAOLayer.HibDAOLayer.getSession();
	    Transaction t=se.beginTransaction();
	    se.save(dm);
	    se.save(sm);
	    t.commit();
	    String msg="SAVE SUCCESSFUL";
	    response.sendRedirect("stockhandling.jsp");

	} catch(Exception e)
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
