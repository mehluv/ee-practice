/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OEWAction;

import OEMEntities.* ;
/*
	* Manage User Login Account - Can Activate , Deactivate, and Delete
	* User Account. 	Check placed orders. 	Service placed orders. 
	 * Manage User Finance Account – Can manage user’s account balance. 
	 * Manage Stock : a)	Add CD/DVD to stock. b)	Remove CD/DVD to stock. c)
	 * Change details of existing stock.
	 *
	 *
	 * @author kiosk
	 */
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AdminSide
{

    static void toggleUser(Login_Master e, int ch)
    {

	Session s = DAOLayer.HibDAOLayer.getSession();
	Transaction t = s.beginTransaction();
	if (ch == 1)
	{
	    if (e.getStatus().equals("ACTIVATED"))
	    {
		e.setStatus("DEACTIVATED");
	    } else
	    {
		e.setStatus("ACTIVATED");
	    }
	}
	if(ch==2)
	    s.delete(e);
	s.save(e);
	t.commit();
	System.out.println("DATABASE UPDATED!");
    }

    static void userBalance(User_Account e, int money, int ch)
    {
	Session s = DAOLayer.HibDAOLayer.getSession();
	Transaction t = s.beginTransaction();
	if (ch == 1)
	//deposit or reedem
	{
	    e.setBalance(e.getBalance() + money);
	} //withdraw
	else if (e.getBalance() == 0)
	{
	    e.setBalance(e.getBalance() - money);
	}
	s.save(e);
	t.commit();
	System.out.println("DATA SAVED!");
    }
 static void addUser( Disk_Master e)
    {
	
	Session s = DAOLayer.HibDAOLayer.getSession();
	Transaction t = s.beginTransaction();   
	s.save(e);
	t.commit();
	System.out.println("DATA SAVED!");
    }
     static void viewStock()
     {
	 String query = "select * from Disk_Master";
	 Session s = DAOLayer.HibDAOLayer.getSession();
	Query q = s.createSQLQuery(query);
	List<Stock_Master> data = q.list();
     }
     static void updateStockName(int sid, String name)
    {
	Session s = DAOLayer.HibDAOLayer.getSession();
	 Stock_Master e = (Stock_Master) s.get(Stock_Master.class, sid);
	e.setSname(name);
	Transaction t = s.beginTransaction();
	s.update(e);
	t.commit();
	//System.out.println("DATA DELETED EEEEEEEEEEEEEEEEE!");
    }
    
}
