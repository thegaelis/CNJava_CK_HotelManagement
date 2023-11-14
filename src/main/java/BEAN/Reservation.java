package BEAN;
import java.sql.Date;
public class Reservation {
	private String id;
	private String guestId;
	private String userId;
	private int numberOfPeople;
	private Date startTime;
	private Date endTime;
	private Boolean isConfirmed;
	private Date confirmationTime;
	private Date dateCreated;
	
	public Reservation() {}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGuestId() {
		return guestId;
	}
	public void setGuestId(String guestId) {
		this.guestId = guestId;
	}
	public int getNumberOfPeople() {
		return numberOfPeople;
	}
	public void setNumberOfPeople(int numberOfPeople) {
		this.numberOfPeople = numberOfPeople;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Boolean getIsConfirmed() {
		return isConfirmed;
	}
	public void setIsConfirmed(Boolean isConfirmed) {
		this.isConfirmed = isConfirmed;
	}
	public Date getConfirmationTime() {
		return confirmationTime;
	}
	public void setConfirmationTime(Date confirmationTime) {
		this.confirmationTime = confirmationTime;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
