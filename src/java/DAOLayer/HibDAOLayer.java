/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOLayer;

import OEMEntities.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author kiosk
 */
public class HibDAOLayer
{

    private static SessionFactory sessionFactory;

    static
    {
	try
	{
	    AnnotationConfiguration cfg = new AnnotationConfiguration();
	    cfg.addAnnotatedClass(Disk_Master.class);
	    cfg.addAnnotatedClass(Login_Master.class);
	    cfg.addAnnotatedClass(Order_Master.class);
	    cfg.addAnnotatedClass(Stock_Master.class);
	    cfg.addAnnotatedClass(Member_Detail.class);
	    cfg.addAnnotatedClass(User_Account.class);
	    cfg.configure();
	    sessionFactory = cfg.buildSessionFactory();
	} catch (Throwable ex)
	{
	    // Log the exception. 
	    System.err.println("Initial SessionFactory creation failed." + ex);
	}
    }

    public static SessionFactory getSessionFactory()
    {
	return sessionFactory;
    }

    public static Session getSession()
    {
	return sessionFactory.openSession();
    }
}
