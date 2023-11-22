package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import BEAN.ReservationRoom;
import DB.config;

public class ReservationRoomDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<ReservationRoom> listReservationRoom() {
		try {

			String query = "SELECT * FROM reservationrooms ";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<ReservationRoom> reservationRooms = new ArrayList<ReservationRoom>();
			while (result.next()) {
				ReservationRoom reservationRoom = new ReservationRoom();
				reservationRoom.setRoomId(result.getString("ReservationID"));
				reservationRoom.setReservationId(result.getString("ReservationID"));
				
				reservationRooms.add(reservationRoom);
			}
			result.close();
			statement.close();
			connection.close();
			return reservationRooms;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	
	public List<String> listIdPhongDaDat() {
		try {

			String query = "SELECT RoomID FROM reservationrooms ";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<String> id = new ArrayList<String>();
			while (result.next()) {
				id.add(result.getString("RoomID"));
			}
			result.close();
			statement.close();
			connection.close();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public boolean insertReservationRoom(ReservationRoom reservationRoom) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO reservationrooms  (`RoomID`, `ReservationID`, `DateCreated`) " + "VALUES (?, ?, ?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			statement.setString(1, reservationRoom.getRoomId());
			statement.setString(2, reservationRoom.getReservationId());
			
			statement.setDate(3, new java.sql.Date(now.getTimeInMillis()));

			boolean insertResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return insertResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String layIdPhongDaDat(String id) {
		try {

			String query = "SELECT * FROM reservationrooms Where reservationrooms.RoomID =?;";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			statement.setString(1, id);
			result = statement.executeQuery();

			String ids = null;
			while (result.next()) {
				ids=(result.getString("ReservationID"));
			}
			result.close();
			statement.close();
			connection.close();
			return ids;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<String> layIdPhongChuaDat(String id) {
		try {

			String query = "SELECT * FROM reservationrooms Where reservationrooms.ReservationID  =? ;";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			statement.setString(1, id);
			result = statement.executeQuery();

			List<String> rooms = new ArrayList<String>();
			while (result.next()) {
				rooms.add(result.getString("RoomID"));
			}
			result.close();
			statement.close();
			connection.close();
			System.out.println(rooms);
			return rooms;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	
	public boolean XoaTheoReservationID(String id) {
		try {
			String query = "delete from reservationrooms where ReservationID = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			
			statement.setString(1, id);
			
			boolean result = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
