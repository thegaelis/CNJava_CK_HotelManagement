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
	
	public Bill LayBillTheoIdGuest(String id) {
		Bill bill = null;
		try {
			String query = "select * from bills where bills.IDGuest = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, id);

			result = statement.executeQuery();
			while (result.next()) {
				bill = new Bill();
				bill.setId(result.getString("ID"));
				bill.setSum(result.getInt("Sum"));
				bill.setIdGuest(id);
				bill.setStatus(result.getBoolean("Status"));
			}
			result.close();
			statement.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bill;
	}
	
	public boolean updateBill(Bill bill) {
		try {
			String query = "update bills set sum = ?, status = ?, IDUser = ?, DateCreated = ? where id = ?";
			connection = new config().getConnection();
			statement = connection.prepareStatement(query);
			
			statement.setInt(1, bill.getSum());
			if(bill.getStatus()) {
				statement.setBoolean(2,true);
			}
			else {
				statement.setBoolean(2,false);
			}
			statement.setString(3,bill.getIdUser());
			statement.setDate(4, new java.sql.Date(Calendar.getInstance().getTimeInMillis()));
			statement.setString(5, bill.getId());
			
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Bill> layBillTheoNgay(String d1, String d2){
		try {

			String query = "SELECT * FROM hotel.bills where DateCreated >= ? and DateCreated <= ?";

			connection = new config().getConnection();
			
			statement = connection.prepareStatement(query);
			statement.setString(1, d1);
			statement.setString(2, d2);
			result = statement.executeQuery();
			List<Bill> bills = new ArrayList<Bill>();
			while (result.next()) {
				Bill bill = new Bill();
				
				bill.setId(result.getString("ID"));
				bill.setSum(result.getInt("Sum"));
				bill.setDateCreated(result.getDate("DateCreated"));
				bill.setStatus(result.getBoolean("status"));
				if(bill.getStatus()) {
					bills.add(bill);
				}
				
			}
			
			result.close();
			statement.close();
			connection.close();
			
			return bills;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return Collections.emptyList();
	}
	
	public boolean deleteBillByIdGuest(String id) {
		try {
			String query = "delete from bills where IDGuest = ? and Status = 0; ";
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
