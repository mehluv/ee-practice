
package OEMEntities;
import javax.persistence.*;
/*
 * @author kiosk
 */

@Entity
public class Member_Detail
{
    @Id
    @GeneratedValue
    private int mid;//maps from Login_Master
    private String fname;
    private String lname;
    private String mobile;
    private String email;
    private String street;
    private String city;
    private String state;
    private String country;
    private String occu;
    

    public String getEmail()
    {
	return email;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }

    public String getOccu()
    {
	return occu;
    }

    public void setOccu(String occu)
    {
	this.occu = occu;
    }

    public int getMid()
    {
	return mid;
    }

    public void setMid(int mid)
    {
	this.mid = mid;
    }

    public String getFname()
    {
	return fname;
    }

    public void setFname(String fname)
    {
	this.fname = fname;
    }

    public String getLname()
    {
	return lname;
    }

    public void setLname(String lname)
    {
	this.lname = lname;
    }

    public String getMobile()
    {
	return mobile;
    }

    public void setMobile(String mobile)
    {
	this.mobile = mobile;
    }

    public String getStreet()
    {
	return street;
    }

    public void setStreet(String street)
    {
	this.street = street;
    }

    public String getCity()
    {
	return city;
    }

    public void setCity(String city)
    {
	this.city = city;
    }

    public String getState()
    {
	return state;
    }

    public void setState(String state)
    {
	this.state = state;
    }

    public String getCountry()
    {
	return country;
    }

    public void setCountry(String country)
    {
	this.country = country;
    }    
}
