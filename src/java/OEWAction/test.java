/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OEWAction;

import OEMEntities.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Random;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author kiosk
 */
public class test
{

    public static void main(String args[]) throws Exception
    {
	Session se = DAOLayer.HibDAOLayer.getSession();
	/*        Criteria c = se.createCriteria(Disk_Master.class);
	 List<Disk_Master> mdata=c.list();
	 for(int i=0;i<=2;i++)
	 {
	 //Random r=new Random();
	 // int v=r.nextInt()%mdata.size();
	 Disk_Master sd=mdata.get(i);
	 System.out.println(sd.getSm().getImg());
	 }*/
	Transaction t = se.beginTransaction();
	/*for (int i=0;i<13;i++)
	 {
	 Disk_Master dm=new Disk_Master();
	 if(i%2==0)
	 dm.setDdesc("CD");
	 else
	 dm.setDdesc("DVD");
	 se.save(dm);
	 }*/
	Criteria c = se.createCriteria(Login_Master.class);
	List<Login_Master> mdata = c.list();
	Random r = new Random();
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	for (Login_Master l : mdata)
	{
	    System.out.println("Username:- " + l.getLid());
	    User_Account ua = new User_Account();
	    int v = r.nextInt() + 1;
	    v = (v > 0) ? v : (-v);
	    ua.setUid(v);
	    System.out.println("Enter Balance:- ");
	    ua.setBalance(Integer.parseInt(br.readLine()));
	    se.save(ua);
	}
	t.commit();
    }
}
