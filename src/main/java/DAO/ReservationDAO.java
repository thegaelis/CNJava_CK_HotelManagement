package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import BEAN.Reservation;
import DB.config;

public class ReservationDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<Reservation> listReservation() {
		try {

			String query = "SELECT * FROM reservations ";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<Reservation> reservations = new ArrayList<Reservation>();
			while (result.next()) {
				Reservation reservation = new Reservation();
				reservation.setId(result.getString("ReservationID "));
				reservation.setGuestId(result.getString("GuestID"));
				reservation.setNumberOfPeople(result.getInt("NumberOfPeople"));
				reservation.setStartTime(result.getDate("StartTime"));
				reservation.setEndTime(result.getDate("EndTime"));
				reservation.setIsConfirmed(result.getBoolean("IsConfirmed"));
				reservation.setConfirmationTime(result.getDate("ConfirmationTime"));
				reservation.setUserId(result.getString("UserID "));
				
				reservations.add(reservation);
			}
			result.close();
			statement.close();
			connection.close();
			return reservations;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public Reservation detailReservation(String id) {
		Reservation reservation = null;
		try {
			String query = "SELECT * FROM reservations WHERE reservations.ReservationID  = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);

			result = statement.executeQuery();
			while (result.next()) {
				reservation = new Reservation();
				reservation.setId(result.getString("ReservationID "));
				reservation.setGuestId(result.getString("GuestID"));
				reservation.setNumberOfPeople(result.getInt("NumberOfPeople"));
				reservation.setStartTime(result.getDate("StartTime"));
				reservation.setEndTime(result.getDate("EndTime"));
				reservation.setIsConfirmed(result.getBoolean("IsConfirmed"));
				reservation.setConfirmationTime(result.getDate("ConfirmationTime"));
				reservation.setUserId(result.getString("UserID "));
			}
			result.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservation;
	}
	
	public boolean insertReservation(Reservation reservation) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO reservations  (`ReservationID `, `GuestID `, `NumberOfPeople`, `StartTime`, `EndTime`, `IsConfirmed`, `ConfirmationTime`, `DateCreated`,`UserID`) " + "VALUES (?, ?, ?, ?, ?,?, ?,? ,?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			statement.setString(1, reservation.getId());
			statement.setString(2, reservation.getGuestId());
			statement.setInt(3, reservation.getNumberOfPeople());
			statement.setDate(4, reservation.getStartTime());
			statement.setDate(5, reservation.getEndTime());
			
			if(reservation.getIsConfirmed()) {
				statement.setInt(6, 1);
			}
			else {
				statement.setInt(6, 0);
			}
			
			
			statement.setDate(7, reservation.getConfirmationTime());
			
			
			statement.setDate(8, new java.sql.Date(now.getTimeInMillis()));
			
			statement.setString(9,reservation.getUserId());

			boolean insertResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return insertResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateReservation(Reservation reservation) {
		try {
			String query = "UPDATE reservations SET GuestID  = ?, NumberOfPeople  = ?, StartTime = ?,EndTime=?,IsConfirmed=?,ConfirmationTime=?,UserID =? WHERE reservations.ReservationID   = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, reservation.getGuestId());
			statement.setInt(2, reservation.getNumberOfPeople());
			statement.setDate(3, reservation.getStartTime());
			statement.setDate(4, reservation.getEndTime());
			
			if(reservation.getIsConfirmed()) {
				statement.setInt(5, 1);
			}
			else {
				statement.setInt(5, 0);
			}
			
			statement.setDate(6, reservation.getConfirmationTime());		
			
			statement.setString(7, reservation.getUserId());
			
			statement.setString(8, reservation.getId());
			
			
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteReservation(String id) {
		try {
			String query = "DELETE FROM reservations WHERE ReservationID = ? ";
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
