package BEAN;

import java.sql.Date;

public class ReservationRoom {
	private String roomId ;
	private String reservationId  ;
	private Date dateCreated ;
	
	public ReservationRoom() {};
	
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationID) {
		this.reservationId = reservationID;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	
}
