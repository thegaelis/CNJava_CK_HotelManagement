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

			String query = "SELECT * FROM rooms ORDER BY RoomNumber DESC;";

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

				statement.setBoolean(4, false);
			
				statement.setBoolean(4, false);
			
			
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
				statement.setBoolean(3,true);
			}
			else {
				statement.setBoolean(3,false);
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
	
	public List<String> layIdPhongDaDat() {
		try {

			String query = "SELECT * FROM rooms Where rooms.IsAvailable=1;";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<String> ids = new ArrayList<String>();
			while (result.next()) {
				ids.add(result.getString("RoomId"));
			}
			result.close();
			statement.close();
			connection.close();
			return ids;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}

	public List<String> getAllRoomId(String RoomTypeId) {
		try {
			String query = "SELECT RoomId FROM rooms where RoomTypeID=?";
			List<String> listRoomId = new ArrayList<>();
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, RoomTypeId);
			result = statement.executeQuery();
			while (result.next()) {
				listRoomId.add(result.getString("RoomID"));
			}
			result.close();
			statement.close();
			connection.close();
			return listRoomId;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}

	
	public List<String> LayIdPhongTheoIdKhach(String id){
		try {
			String query = "select RoomID from reservations, reservationrooms where reservationrooms.ReservationID = reservations.ReservationID and reservations.GuestID = ?";
			List<String> listRoomId = new ArrayList<>();
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);
			result = statement.executeQuery();
			while (result.next()) {
				listRoomId.add(result.getString("RoomID"));
			}
			result.close();
			statement.close();
			connection.close();
			return listRoomId;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
}
