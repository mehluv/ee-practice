package OEMEntities;
import java.util.Date;
import javax.persistence.*;
/**
 *
 * @author kiosk
 */
@Entity
public class Order_Master
{
    @GeneratedValue
    @Id
    private int oid;
    @ManyToOne
    private Login_Master lm;
    private Date odate;
    private String status;//pending or delivered
    @OneToOne
    private Stock_Master sm;
    public int getOid()
    {
	return oid;
    }

    public void setOid(int oid)
    {
	this.oid = oid;
    }
    public Date getOdate()
    {
	return odate;
    }

    public void setOdate(Date odate)
    {
	this.odate = odate;
    }

    public String getStatus()
    {
	return status;
    }

    public void setStatus(String status)
    {
	this.status = status;
    }

    public Login_Master getLm()
    {
	return lm;
    }

    public void setLm(Login_Master lm)
    {
	this.lm = lm;
    }

    public Stock_Master getSm()
    {
	return sm;
    }

    public void setSm(Stock_Master sm)
    {
	this.sm = sm;
    }
    
 
}
