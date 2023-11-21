package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import BEAN.ListService;
import BEAN.Reservation;
import DB.config;

public class ListServiceDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<ListService> listListService() {
		try {

			String query = "SELECT * FROM listservice";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<ListService> listServices = new ArrayList<ListService>();
			
			while (result.next()) {
				ListService listService = new ListService();
				listService.setId(result.getString("ID"));
				listService.setIdGuest(result.getString("IDGuest"));
				listService.setDateCreated(result.getDate("DateCreated"));
				listServices.add(listService);
			}
			result.close();
			statement.close();
			connection.close();
			return listServices;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	
	public boolean insertListService(ListService listService) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO listservice  (`ID`, `IDGuest`, `DateCreated`) " + "VALUES (?, ?, ?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			statement.setString(1, listService.getId());
			statement.setString(2, listService.getIdGuest());
			
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
	
	public String getD(String ID){
		try {

			String query = "SELECT * FROM listservice Where listservice.IDGuest  =?;";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			statement.setString(1,ID);
			result = statement.executeQuery();

			String id =null;
			while (result.next()) {
				id = result.getString("ID");
			}
			result.close();
			statement.close();
			connection.close();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean XoaTheoID(String id) {
		try {
			String query = "delete from listservice where listservice.ID = ?";
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
