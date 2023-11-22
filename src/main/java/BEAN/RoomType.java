package BEAN;

import java.sql.Date;

public class RoomType {
	private String id;
	private String name;
	private int capacity;
	private double areaInSquareMeters;
	private String description;
	private double firstHourPrice;
	private double hourlyPrice;
	private double overNightPrice;
	private double dailyPrice;
	private double peakDayRateMultiplier;
	private Date dateCreate;
	
	public RoomType() {}
	
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
	public double getFirstHourPrice() {
		return firstHourPrice;
	}
	public void setFirstHourPrice(double firstHourPrice) {
		this.firstHourPrice = firstHourPrice;
	}
	public double getHourlyPrice() {
		return hourlyPrice;
	}
	public void setHourlyPrice(double hourlyPrice) {
		this.hourlyPrice = hourlyPrice;
	}
	public double getOverNightPrice() {
		return overNightPrice;
	}
	public void setOverNightPrice(double overNightPrice) {
		this.overNightPrice = overNightPrice;
	}
	public double getDailyPrice() {
		return dailyPrice;
	}
	public void setDailyPrice(double dailyPrice) {
		this.dailyPrice = dailyPrice;
	}
	public double getPeakDayRateMultiplier() {
		return peakDayRateMultiplier;
	}
	public void setPeakDayRateMultiplier(double peakDayRateMultiplier) {
		this.peakDayRateMultiplier = peakDayRateMultiplier;
	}
	public Date getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
}
