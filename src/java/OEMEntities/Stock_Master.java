
package OEMEntities;

/**
 *
 * @author kiosk
 */
import javax.persistence.*;

@Entity
public class Stock_Master
{

    public Disk_Master getDm()
    {
	return dm;
    }

    public void setDm(Disk_Master dm)
    {
	this.dm = dm;
    }
    @Id
    @GeneratedValue
    private int sid;
    private String sname;
    private String version;//hindi or english
    private String img;
    private String cast;
    private String director;
    private String year;
    private int quantity;
    private float price;
    @OneToOne
    Disk_Master dm;
    public int getSid()
    {
	return sid;
    }

    public void setSid(int sid)
    {
	this.sid = sid;
    }

    public String getSname()
    {
	return sname;
    }

    public void setSname(String sname)
    {
	this.sname = sname;
    }

    public String getVersion()
    {
	return version;
    }

    public void setVersion(String version)
    {
	this.version = version;
    }

    public String getImg()
    {
	return img;
    }

    public void setImg(String img)
    {
	this.img = img;
    }

    public String getCast()
    {
	return cast;
    }

    public void setCast(String cast)
    {
	this.cast = cast;
    }

    public String getDirector()
    {
	return director;
    }

    public void setDirector(String director)
    {
	this.director = director;
    }

    public String getYear()
    {
	return year;
    }

    public void setYear(String year)
    {
	this.year = year;
    }

    public int getQuantity()
    {
	return quantity;
    }

    public void setQuantity(int quantity)
    {
	this.quantity = quantity;
    }

    public float getPrice()
    {
	return price;
    }

    public void setPrice(float price)
    {
	this.price = price;
    }
    
}
