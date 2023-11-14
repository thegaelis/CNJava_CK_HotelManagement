package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;


import BEAN.Room;
import DB.config;

public class RoomDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<Room> listRoom() {
		try {

			String query = "SELECT * FROM rooms ";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<Room> rooms = new ArrayList<Room>();
			while (result.next()) {
				Room room = new Room();
				room.setId(result.getString("RoomId"));
				room.setNumber(result.getString("RoomNumber"));
				room.setTypeId(result.getString("RoomTypeID"));
				room.setIsVaiable(result.getBoolean("IsAvailable"));
				rooms.add(room);
			}
			result.close();
			statement.close();
			connection.close();
			return rooms;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public Room detailRoom(String id) {
		Room room = null;
		try {
			String query = "SELECT * FROM rooms WHERE rooms.RoomID = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);

			result = statement.executeQuery();
			while (result.next()) {
				room = new Room();
				room.setId(result.getString("RoomId"));
				room.setNumber(result.getString("RoomNumber"));
				room.setTypeId(result.getString("RoomTypeID"));
				room.setIsVaiable(result.getBoolean("IsAvailable"));
			}
			result.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return room;
	}
	
	public boolean insertRoom(Room room) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO rooms (RoomID, RoomNumber, RoomTypeID, IsAvailable, DateCreated) " + "VALUES (?, ?, ?, ?, ?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, room.getId());
			statement.setString(2, room.getNumber());
			statement.setString(3, room.getTypeId());
			//statement.setBoolean(4, room.getIsVaiable());
			
			if(room.getIsVaiable()) {
				statement.setInt(4, 1);
			}
			else {
				statement.setInt(4, 0);
			}
			
			statement.setDate(5, new java.sql.Date(now.getTimeInMillis()));

			boolean insertResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return insertResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateRoom(Room room) {
		try {
			String query = "UPDATE rooms SET RoomNumber = ?, RoomTypeID  = ?, IsAvailable = ? WHERE rooms.RoomID  = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, room.getNumber());
			statement.setString(2, room.getTypeId());
			
			if(room.getIsVaiable()) {
				statement.setInt(3, 1);
			}
			else {
				statement.setInt(3, 0);
			}
			
			statement.setString(4, room.getId());
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteRoom(String id) {
		try {
			String query = "DELETE FROM rooms WHERE RoomID  = ? ";
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
