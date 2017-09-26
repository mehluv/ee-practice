/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package OEWAction;

import OEMEntities.*;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/*
 * Can open account.
	View all stock(CD/DVD’s) details.
	Can search stock by(Name, DiskType, Version, Casting, Director, and Year)
	Place order for CD/DVD’s.
	Check Order Status.
	Update and Cancel placed orders.
*	@author kiosk
*/
public class UserSide
{
     static void addUser( Login_Master e)
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
}
