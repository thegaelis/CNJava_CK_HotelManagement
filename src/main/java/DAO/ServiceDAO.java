package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import BEAN.Service;

import DB.config; 

public class ServiceDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<Service> listServices() {
		try {

			String query = "SELECT * FROM `service` ";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			
			result = statement.executeQuery();
			List<Service> Services = new ArrayList<Service>();
			while (result.next()) {
				Service service = new Service();
				service.setId(result.getString("id"));
				service.setName(result.getString("name"));
				service.setPrice(result.getDouble("price"));
				service.setDescription(result.getString("description"));
				Services.add(service);
			}
			
			result.close();
			statement.close();
			connection.close();
			
			return Services;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	  // Method to add a new service and return true if successful, false otherwise
    public boolean addService(Service service) throws ClassNotFoundException {
        try {
            String query = "INSERT INTO `service` (id, name, price, description) VALUES (?, ?, ?, ?)";
            connection = new config().getConnection();
            statement = connection.prepareStatement(query);

            statement.setString(1, service.getId());
            statement.setString(2, service.getName());
            statement.setDouble(3, service.getPrice());
            statement.setString(4, service.getDescription());

            int rowsAffected = statement.executeUpdate();

            statement.close();
            connection.close();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to update an existing service and return true if successful, false otherwise
    public boolean updateService(Service service) throws ClassNotFoundException {
        try {
        	String query = "UPDATE `service` SET ";
            List<String> setStatements = new ArrayList<>();

            if (service.getName() != null && !service.getName().isEmpty()) {
                setStatements.add("name=?");
            }
            if (service.getPrice() > 0) {
                setStatements.add("price=?");
            }
            if (service.getDescription() != null && !service.getDescription().isEmpty()) {
                setStatements.add("description=?");
            }

          
            if (!setStatements.isEmpty()) {
                query += String.join(", ", setStatements);
                query += " WHERE id=?";

                connection = new config().getConnection();
                statement = connection.prepareStatement(query);

               
                int parameterIndex = 1;
                if (service.getName() != null && !service.getName().isEmpty()) {
                    statement.setString(parameterIndex++, service.getName());
                }
                if (service.getPrice() > 0) {
                    statement.setDouble(parameterIndex++, service.getPrice());
                }
                if (service.getDescription() != null && !service.getDescription().isEmpty()) {
                    statement.setString(parameterIndex++, service.getDescription());
                }

              
                statement.setString(parameterIndex, service.getId());

                int rowsAffected = statement.executeUpdate();

                statement.close();
                connection.close();

                return rowsAffected > 0;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a service by its ID and return true if successful, false otherwise
    public boolean deleteService(String serviceId) throws ClassNotFoundException {
        try {
            String query = "DELETE FROM `service` WHERE id=?";
            connection = new config().getConnection();
            statement = connection.prepareStatement(query);

            statement.setString(1, serviceId);

            int rowsAffected = statement.executeUpdate();

            statement.close();
            connection.close();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Service getService(String id){
    	
		try {
			System.out.println(id);
			String query = "SELECT * FROM service Where service.id = ?;";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			statement.setString(1, id);
			result = statement.executeQuery();
			

			Service service =new Service();
			
			
			while (result.next()) {
				
				service.setId(result.getString("id"));
				service.setName(result.getString("name"));
				service.setPrice(result.getDouble("price"));
		    } 
			
			result.close();
			statement.close();
			connection.close();
			return service;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
