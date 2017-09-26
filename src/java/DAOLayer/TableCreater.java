/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DAOLayer;
import OEMEntities.*;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**Demoniser and Labh Lee
 *Creates the tables for OEW database
 * 
 */
public class TableCreater
{

    public static void main(String[] args)
    {
	AnnotationConfiguration cfg;
	cfg = new AnnotationConfiguration();
	
	cfg.addAnnotatedClass(Disk_Master.class);
	cfg.addAnnotatedClass(Order_Master.class);
	cfg.addAnnotatedClass(Stock_Master.class);
	cfg.addAnnotatedClass(Member_Detail.class);
	cfg.addAnnotatedClass(User_Account.class);
	cfg.addAnnotatedClass(Login_Master.class);
	cfg.configure();//gets info from database
	SchemaExport se = new SchemaExport(cfg);
	se.create(true, true);//1. to implement query building and display in log,2. execute build query
	System.out.println("TABLE CREATED");
    }
}
