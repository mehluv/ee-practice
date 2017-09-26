
package OEMEntities;
import javax.persistence.*;
/**
 *
 * @author kiosk
 */
@Entity
public class Disk_Master
{
    @GeneratedValue
    @Id
    private int did;
    private String ddesc;//cd or dvd

    public int getDid()
    {
	return did;
    }

    public void setDid(int did)
    {
	this.did = did;
    }

    public String getDdesc()
    {
	return ddesc;
    }

    public void setDdesc(String ddesc)
    {
	this.ddesc = ddesc;
    }
}
