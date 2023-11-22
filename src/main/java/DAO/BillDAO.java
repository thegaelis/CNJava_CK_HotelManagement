package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;


import BEAN.Bill;
import DB.config;

public class BillDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL

	
	
	public boolean insertBill(Bill bill) {
		try {
			Calendar now = Calendar.getInstance();
			String query = "INSERT INTO bills (ID,Sum , DateCreated,Status,IDGuest) " + "VALUES (?, ?, ?, ?,?)";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, bill.getId());
			statement.setInt(2, bill.getSum());
			
			statement.setDate(3, new java.sql.Date(now.getTimeInMillis()));
			if(bill.getStatus()) {
				statement.setBoolean(4, true);
			}
			else {
				statement.setBoolean(4, false);
			}
			
			statement.setString(5, bill.getIdGuest());
			
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
