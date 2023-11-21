package DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Reservation;
import BEAN.Room;
import BEAN.ServiceListService;
import BEAN.User;
import DB.config;

public class ServiceListServiceDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<ServiceListService> listServiceListService() {
		try {

			String query = "SELECT * FROM servicelistservice";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();

			List<ServiceListService> list = new ArrayList<ServiceListService>();
			
			while (result.next()) {
				ServiceListService serviceListService = new ServiceListService();
				serviceListService.setIdListService(result.getString("IDListService"));
				serviceListService.setIdService(result.getString("IDService"));
				
				serviceListService.setNumber(result.getInt("Number"));
				
				list.add(serviceListService);
			}
			result.close();
			statement.close();
			connection.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	

	public boolean insertServiceListService(ServiceListService serviceListService) {
		try {
			
			if(checkExitService(serviceListService.getIdListService(),serviceListService.getIdService())) {
				
				
				updateServiceListService(serviceListService);
				return true;
			}
			else {
				
				String query = "INSERT INTO servicelistservice  (`IDListService`, `IDService`,`Number`) " + "VALUES (?, ?, ?)";
				connection = new config().getConnection();
				statement = connection.prepareStatement(query);
				
				statement.setString(1, serviceListService.getIdListService());
				statement.setString(2, serviceListService.getIdService());
				statement.setInt(3, 1);
				
				boolean insertResult = statement.executeUpdate() > 0;
				
				statement.close();
				connection.close();
				return insertResult;
				
		}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkExitService(String IDListService,String IDService) {
		try {
			String query = "SELECT * FROM servicelistservice Where IDListService = ? AND IDService= ? ;";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			
			statement.setString(1,IDListService);
			statement.setString(2,IDService);
			result = statement.executeQuery();
			
			boolean check= false;
			
			if (result.next()) {

		        check =true;
		    } else {
		      
		    	check= false;
		    }
			statement.close();
			connection.close();
			
			return check;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateServiceListService(ServiceListService serviceListService) {
		try {
			String query = "UPDATE servicelistservice SET Number = Number +1 WHERE servicelistservice.IDListService = ? AND servicelistservice.IDService = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			
			statement.setString(1, serviceListService.getIdListService());
			statement.setString(2, serviceListService.getIdService());
			
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int getNumber (String IDListService,String IDService) {
		try {

			String query = "SELECT * FROM servicelistservice Where  IDListService = ? AND IDService= ? ;";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			statement.setString(1, IDListService);
			statement.setString(2, IDService);
			result = statement.executeQuery();
			System.out.println(IDListService+"__"+IDService);
			int number=0;

			while (result.next()) {
				
				number = result.getInt("Number");
				
			}
			
			result.close();
			statement.close();
			connection.close();
			return number;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<String> getIDService(String id){
		try {

			String query = "SELECT * FROM servicelistservice Where servicelistservice.IDListService = ?;";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			statement.setString(1, id);
			result = statement.executeQuery();

			List<String> service =new ArrayList<String>();

			while (result.next()) {
				String idService=result.getString("IDService");
				int number = result.getInt("Number");
				service.add(idService);
			}
			
			result.close();
			statement.close();
			connection.close();
			return service;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public boolean XoaTheoIdListService(String id) {
		try {
			String query = "delete from servicelistservice where servicelistservice.IDListService = ?";
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

