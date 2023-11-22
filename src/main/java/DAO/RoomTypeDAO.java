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
	
	
	
}
