package BEAN;

import java.sql.Date;

public class Bill {
	private String id  ;
	private String idGuest;
	private String idUser;
	private Boolean status ;
	private Date dateCreated ;
	private int sum;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getIdGuest() {
		return idGuest;
	}
	public void setIdGuest(String idGuest) {
		this.idGuest = idGuest;
	}
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
}
