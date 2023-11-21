package BEAN;

import java.util.Date;

public class ListService {
	private String id ;
	private String idGuest ;
	private Date dateCreated ;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdGuest() {
		return idGuest;
	}
	public void setIdGuest(String idGuest) {
		this.idGuest = idGuest;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
}
