package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import BEAN.Guest;
import BEAN.Report;
import DB.config;

public class ReportDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	public List<Report> listReport() {
		try {

			String query = "SELECT * FROM report";

			connection = new config().getConnection();

			statement = connection.prepareStatement(query);

			result = statement.executeQuery();

			List<Report> reports = new ArrayList<Report>();
	
			while (result.next()) {
				Report report = new Report();
				report.setEmail(result.getString("email"));
				report.setText(result.getString("text"));
				
				reports.add(report);
			}
			result.close();
			statement.close();
			connection.close();
			return reports;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	
	public boolean insertReport(Report report) {
		try {
			List<Report> reports = listReport();
			if (reports.stream().anyMatch(x -> x.getEmail().equals(report.getEmail()))) {
				deleteReport(report.getEmail());
	        }
			
			String query = "INSERT INTO report (email,text) " + "VALUES (?, ?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, report.getEmail());
			statement.setString(2, report.getText());
			boolean insertResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return insertResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean deleteReport(String email) {
		try {
			
			String query = "DELETE FROM `report` WHERE email=?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, email);
			
			boolean deleteResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return deleteResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
