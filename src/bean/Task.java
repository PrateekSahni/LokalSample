/**
 * 
 */
package bean;

import java.util.Date;
/**
 * @author Prateek PC
 *
 */
public class Task {

	private String title;
	private String detail;
	private Date created;
	private Date expiry;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getExpiry() {
		return expiry;
	}
	public void setExpiry(Date expiry) {
		this.expiry = expiry;
	}
	@Override
	public String toString() {
		return "Task [title=" + title + ", detail=" + detail + ", created=" + created + ", expiry=" + expiry + "]";
	}
	
	

}
