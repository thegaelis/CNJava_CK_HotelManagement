package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import BEAN.RoomType;
import DB.config;

public class RoomTypeDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<RoomType> listRoomType() {
		try {

			String query = "SELECT * FROM roomtypes ";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<RoomType> roomTypes = new ArrayList<RoomType>();
			while (result.next()) {
				RoomType roomType = new RoomType();
				roomType.setId(result.getString("RoomTypeID"));
				roomType.setName(result.getString("Name"));
				roomType.setCapacity(result.getInt("Capacity"));
				roomType.setAreaInSquareMeters(result.getDouble("AreaInSquareMeters"));
				roomType.setDescription(result.getString("Description"));
			
				roomType.setDailyPrice(result.getDouble("DailyPrice"));
				
				roomTypes.add(roomType);
			}
			result.close();
			statement.close();
			connection.close();
			return roomTypes;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public RoomType detailRoomType(String id) {
		RoomType roomType = null;
		try {
			String query = "SELECT * FROM roomtypes WHERE roomtypes.RoomTypeID = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);

			result = statement.executeQuery();
			while (result.next()) {
				roomType = new RoomType();
				roomType.setId(result.getString("RoomTypeID"));
				roomType.setName(result.getString("Name"));
				roomType.setCapacity(result.getInt("Capacity"));
				roomType.setAreaInSquareMeters(result.getDouble("AreaInSquareMeters"));
				roomType.setDescription(result.getString("Description"));
				
				roomType.setDailyPrice(result.getDouble("DailyPrice"));
				
			}
			result.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return roomType;
	}
	
	public boolean insertRoomType(RoomType roomType) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO roomtypes  (`RoomTypeID`, `Name`, `Capacity`, `AreaInSquareMeters`, `Description`, `DailyPrice`, `DateCreated`) " + "VALUES (?, ?, ?, ?, ?,?, ?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			statement.setString(1, roomType.getId());
			statement.setString(2, roomType.getName());
			statement.setInt(3, roomType.getCapacity());
			statement.setDouble(4, roomType.getAreaInSquareMeters());
			statement.setString(5, roomType.getDescription());
			
			
			statement.setDouble(6, roomType.getDailyPrice());
		
			
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
	
	public boolean updateRoomType(RoomType roomType) {
		try {
			String query = "UPDATE roomtypes SET Name = ?, Capacity  = ?, AreaInSquareMeters = ?,Description=?,DailyPrice=? WHERE roomtypes.RoomTypeID  = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, roomType.getName());
			statement.setInt(2, roomType.getCapacity());
			statement.setDouble(3, roomType.getAreaInSquareMeters());
			statement.setString(4, roomType.getDescription());
			
			statement.setDouble(5, roomType.getDailyPrice());
		
			
			
			statement.setString(6, roomType.getId());
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteRoomType(String id) {
		try {
			String query = "DELETE FROM roomtypes WHERE RoomTypeID  = ? ";
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
	
	public RoomType getRoomType (String id) {
    	try {
    		
			String query = "SELECT * FROM roomtypes Where RoomTypeID =? ;";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);
			
			result = statement.executeQuery();
			
			RoomType rooms = new RoomType();
			while (result.next()) {
				rooms.setId(result.getString("RoomTypeID"));
				rooms.setName(result.getString("Name"));
				rooms.setDailyPrice(result.getDouble("DailyPrice"));
			}
			
			result.close();
			statement.close();
			connection.close();
			return rooms;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
    }
}
