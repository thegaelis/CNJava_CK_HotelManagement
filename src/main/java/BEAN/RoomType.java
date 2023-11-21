package BEAN;

import java.sql.Date;

public class RoomType {
	private String id;
	private String name;
	private int capacity;
	private double areaInSquareMeters;
	private String description;
	
	private double dailyPrice;
	
	private Date dateCreate;
	
	public RoomType() {}
	public RoomType(String id, String name, int capacity, double areaInSquareMeters, String description,
           double dailyPrice,
            Date dateCreate) {
			this.id = id;
			this.name = name;
			this.capacity = capacity;
			this.areaInSquareMeters = areaInSquareMeters;
			this.description = description;
			this.dailyPrice = dailyPrice;		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public double getAreaInSquareMeters() {
		return areaInSquareMeters;
	}
	public void setAreaInSquareMeters(double areaInSquareMeters) {
		this.areaInSquareMeters = areaInSquareMeters;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public double getDailyPrice() {
		return dailyPrice;
	}
	public void setDailyPrice(double dailyPrice) {
		this.dailyPrice = dailyPrice;
	}

	public Date getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
}
