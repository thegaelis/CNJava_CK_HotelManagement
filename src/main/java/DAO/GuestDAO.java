package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;


import BEAN.Guest;
import BEAN.Room;
import DB.config;

public class GuestDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<Guest> listGuest() {
		try {

			String query = "SELECT * FROM guests";

			connection = new config().getConnection();

			statement = connection.prepareStatement(query);

			result = statement.executeQuery();

			List<Guest> guests = new ArrayList<Guest>();
	
			while (result.next()) {
				Guest guest = new Guest();
				guest.setId(result.getString("GuestID"));
				guest.setCitizenId(result.getString("CitizenID"));
				guest.setName(result.getString("Name"));
				guest.setAge(result.getInt("Age"));
				guest.setEmail(result.getString("Email"));
				guest.setPhoneNumber(result.getString("PhoneNumber"));
				
				guests.add(guest);
			}
			result.close();
			statement.close();
			connection.close();
			return guests;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public Guest detailGuest(String id) {
		Guest guest = null;
		try {
			String query = "SELECT * FROM guests WHERE guests.GuestID  = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);

			result = statement.executeQuery();
			while (result.next()) {
				guest = new Guest();
				guest.setId(result.getString("GuestID "));
				guest.setCitizenId(result.getString("CitizenID"));
				guest.setName(result.getString("Name"));
				guest.setAge(result.getInt("Age"));
				guest.setEmail(result.getString("Email"));
				guest.setPhoneNumber(result.getString("PhoneNumber"));
			}
			result.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return guest;
	}
	
	public boolean insertGuest(Guest guest) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO guests (GuestID , CitizenID, Name, Age, Email,PhoneNumber,DateCreated) " + "VALUES (?, ?, ?, ?, ?,?, ?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, guest.getId());
			statement.setString(2, guest.getCitizenId());
			statement.setString(3, guest.getName());
			statement.setInt(4, guest.getAge());
			statement.setString(5, guest.getEmail());
			statement.setString(6, guest.getPhoneNumber());
			
			statement.setDate(7, new java.sql.Date(now.getTimeInMillis()));

			boolean insertResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return insertResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateGuest(Guest guest) {
		try {
			String query = "UPDATE guests SET CitizenID = ?, Name  = ?, Age = ?,Email=?,PhoneNumber=? WHERE guests.GuestID = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, guest.getCitizenId());
			statement.setString(2, guest.getName());
			statement.setInt(3, guest.getAge());
			statement.setString(4, guest.getEmail());
			statement.setString(5, guest.getPhoneNumber());

			statement.setString(6, guest.getId());
			
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteGuest(String id) {
		try {
			String query = "DELETE FROM guests WHERE GuestID   = ? ";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);

			boolean deletedResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return deletedResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
