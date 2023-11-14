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
				reservationRoom.setRoomId(result.getString("ReservationID "));
				reservationRoom.setReservationId(result.getString("ReservationID "));
				
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
	
	
	public boolean insertReservationRoom(ReservationRoom reservationRoom) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO reservationrooms  (`RoomID  `, `ReservationID  `, `DateCreated`) " + "VALUES (?, ?, ?)";
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
	
}
