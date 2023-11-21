package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;


import BEAN.Room;
import BEAN.RoomType;
import DB.config;


public class CheckInDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL
	
	public List<Room> listAvailableRooms(String roomTypeID, Date checkInDate, Date checkOutDate) {
        List<Room> availableRooms = new ArrayList<>();

        try {
            String query = "SELECT DISTINCT r.id, r.number, r.typeId, r.isAvailable, r.dateCreate " +
                           "FROM Room r " +
                           "JOIN ReservationRoom rm ON r.id = rm.roomId " +
                           "LEFT JOIN Reservation res ON rm.reservationId = res.id " +
                           "WHERE r.typeId = ? AND r.isAvailable = true AND " +
                           "((res.startTime IS NULL AND res.endTime IS NULL) OR NOT " +
                           "((res.startTime >= ? OR res.endTime <= ?) AND res.isConfirmed = true))";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, roomTypeID);
                preparedStatement.setDate(2, new java.sql.Date(checkOutDate.getTime()));
                preparedStatement.setDate(3, new java.sql.Date(checkInDate.getTime()));

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Room room = new Room();
                        room.setId(resultSet.getString("id"));
                        room.setNumber(resultSet.getString("number"));
                        room.setTypeId(resultSet.getString("typeId"));
                        room.setIsVaiable(resultSet.getBoolean("isAvailable"));
                        room.setDateCreate(resultSet.getDate("dateCreate"));
                        availableRooms.add(room);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return availableRooms;
    }
	
	public boolean XoaTheoIdReservation(String id) {
		try {
			String query = "delete from checkins where checkins.ReservationID = ?";
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
