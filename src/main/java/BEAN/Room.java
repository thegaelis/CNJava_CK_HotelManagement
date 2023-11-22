package BEAN;

import java.sql.Date;

public class Room {
	private String id;
	private String number;
	private String typeId;
	private Boolean isVaiable;
	private Date dateCreate;
	
	public Room() {}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public Boolean getIsVaiable() {
		return isVaiable;
	}

	public void setIsVaiable(Boolean isVaiable) {
		this.isVaiable = isVaiable;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
	
	
	
	
}
