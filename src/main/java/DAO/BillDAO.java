package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import BEAN.Bill;
import DB.config;

public class BillDAO {
	Connection connection = null; // ket noi toi database
	PreparedStatement statement = null; // thuc thi cau lenh SQL
	ResultSet result = null; // ket qua cau lenh SQL
	
	
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
			String query = "update bills set sum = ?, status = ?, IDUser = ?  where id = ?";
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
			statement.setString(4, bill.getId());
			
			boolean updateResult = statement.executeUpdate() > 0;
			statement.close();
			connection.close();

			return updateResult;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
