package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import java.util.Collections;
import java.util.List;


import BEAN.User;
import DB.config;

public class UserDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<User> listUser() {
		try {

			String query = "SELECT * FROM `user` ";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();
			List<User> users = new ArrayList<User>();
			while (result.next()) {
				User user = new User();
				user.setId(result.getString("ID"));
				user.setName(result.getString("Name"));
				user.setAge(result.getInt("Age"));			
				user.setStartDate(result.getDate("StartDate")); 	
				user.setSalary(result.getString("Salary"));
				user.setRole(result.getString("Role"));
				user.setEmail(result.getString("Email"));
				user.setPassword(result.getString("Password"));
				users.add(user);
			}
			
			result.close();
			statement.close();
			connection.close();
			
			return users;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public User detailUser(String id) {
		User user = null;
		try {
			String query = "SELECT * FROM user WHERE user.ID = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);

			result = statement.executeQuery();
			while (result.next()) {
				user = new User();
				user.setId(result.getString("ID"));
				user.setName(result.getString("Name"));
				user.setAge(result.getInt("Age"));
				user.setStartDate(result.getDate("StartDate"));
				user.setSalary(result.getString("Salary"));
				user.setRole(result.getString("Role"));
				user.setEmail(result.getString("Email"));
				user.setPassword(result.getString("Password"));
			}
			result.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean insertUser(User user) {
		try {
			String query = "INSERT INTO user (ID , Name, Age, StartDate, Salary,Role,Email,Password) " + "VALUES (?, ?, ?, ?, ?,?,?,?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, user.getId());
			statement.setString(2, user.getName());
			statement.setInt(3, user.getAge());
			statement.setDate(4, user.getStartDate());
			statement.setString(5, user.getSalary());
			statement.setString(6, user.getRole());
			statement.setString(7, user.getEmail());
			statement.setString(8, user.getPassword());
			
			boolean insertResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return insertResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateUser(User user) {
		try {
			String query = "UPDATE user SET Name = ?, Age  = ?, Salary=?,Email=?,Password=? WHERE user.ID  = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			statement.setString(1, user.getName());
			statement.setInt(2, user.getAge());
			
			statement.setString(3, user.getSalary());
			
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getPassword());
			
			statement.setString(6, user.getId());
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public User login(String email,String password) {
		User user = null;
		String query = "SELECT * FROM user where Email=? and Password =?";
		try {
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, password);
			result = statement.executeQuery();
			if(result.next()) {
				user = new User();
				user.setName(result.getString("Name"));
				user.setRole(result.getString("Role"));
				user.setId(result.getString("ID"));
			}
			result.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean deleteUser(String id) {
		try {
			String query = "DELETE FROM user WHERE ID   = ? ";
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
