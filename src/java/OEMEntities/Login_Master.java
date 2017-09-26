/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OEMEntities;

import java.util.List;
import javax.persistence.*;

/*
 * 	Manage User Login Account - Can Activate , Deactivate, and Delete User Account.
 	Check placed orders.
 	Service placed orders.
 	Manage User Finance Account – Can manage user’s account balance.
 	Manage Stock :
 a)	Add CD/DVD to stock.
 b)	Remove CD/DVD to stock.
 c)	Change details of existing stock.
 */
@Entity
public class Login_Master
{

    @Id
    private String lid;
    private String password;
    private String role;//user or admin
    private String status;//activated or deactivated
    @OneToMany(targetEntity=Order_Master.class,mappedBy="lm")
    private List<Order_Master> om;
    @OneToOne
    private User_Account ua;
    @OneToOne
    private Member_Detail md;

    public String getLid()
    {
	return lid;
    }

    public void setLid(String lid)
    {
	this.lid = lid;
    }

    public String getPassword()
    {
	return password;
    }

    public void setPassword(String password)
    {
	this.password = password;
    }

    public String getRole()
    {
	return role;
    }

    public void setRole(String role)
    {
	this.role = role;
    }

    public String getStatus()
    {
	return status;
    }

    public void setStatus(String status)
    {
	this.status = status;
    }

    public Member_Detail getMd()
    {
	return md;
    }

    public void setMd(Member_Detail md)
    {
	this.md = md;
    }

    public List<Order_Master> getOm()
    {
	return om;
    }

    public void setOm(List<Order_Master> om)
    {
	this.om = om;
    }

    public User_Account getUa()
    {
	return ua;
    }

    public void setUa(User_Account ua)
    {
	this.ua = ua;
    }

}
