
package OEMEntities;
import javax.persistence.*;
/**
 * 	Can open account.
	View all stock(CD/DVD’s) details.
	Can search stock by(Name, DiskType, Version, Casting, Director, and Year)
	Place order for CD/DVD’s.
	Check Order Status.
	Update and Cancel placed orders.


 *
 * @author kiosk
 */
@Entity
public class User_Account
{   
    @Id
    @GeneratedValue
    private int uid;
    private int balance;
    public int getUid()
    {
	return uid;
    }

    public void setUid(int uid)
    {
	this.uid = uid;
    }

    public int getBalance()
    {
	return balance;
    }

    public void setBalance(int balance)
    {
	this.balance = balance;
    }
}
