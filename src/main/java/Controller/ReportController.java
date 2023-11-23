package Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import BEAN.Bill;
import BEAN.Report;
import DAO.BillDAO;
import DAO.ReportDAO;

/**
 * Servlet implementation class ReportController
 */
@WebServlet("/ReportController")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Report> reports = new ReportDAO().listReport();
				
				String str1 = request.getParameter("d1");
				String str2 = request.getParameter("d2");
				
				SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
				Date d2 = null;
				Date d1 = null;
				if(str1 == null || str2 == null) {
					d1 = new Date();
					d2 = new Date();
				}
				else {
					try {
						d1 = formatter2.parse(str1);
						d2 = formatter2.parse(str2);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				List<Bill> bills = new BillDAO().layBillTheoNgay(formatter2.format(d1), formatter2.format(d2));
				
				String action = request.getParameter("action");
				if(action != null && action.equals("XuatExcel")) {
					try {
						XSSFWorkbook workbook = new XSSFWorkbook();
						XSSFSheet sheet = workbook.createSheet("report");
						XSSFRow row = null;
						XSSFCell cell = null;
						row = sheet.createRow(0);
						
						cell = row.createCell(0,CellType.STRING);
						cell.setCellValue("Mã hóa đơn");
						
						cell = row.createCell(1,CellType.STRING);
						cell.setCellValue("Tổng tiền");
						
						cell = row.createCell(2,CellType.STRING);
						cell.setCellValue("Ngày");
						
						for(int i = 0; i < bills.size(); ++i) {
							row = sheet.createRow(i+1);
							
							cell = row.createCell(0,CellType.STRING);
							cell.setCellValue(bills.get(i).getId());
							
							cell = row.createCell(1,CellType.NUMERIC);
							cell.setCellValue(bills.get(i).getSum());
							
							cell = row.createCell(2,CellType.STRING);
							cell.setCellValue(formatter2.format(bills.get(i).getDateCreated()));
						}
						
						File file = new File("");
						String path = file.getAbsolutePath();
						File f = new File(path+"\\report.xlsx");
						
						if(f.exists()) {
							f = new File(path+"\\report"+UUID.randomUUID().toString()+".xlsx");
						}
						FileOutputStream fos = new FileOutputStream(f);
						workbook.write(fos);
						fos.close();
						//File lưu ở ngoài thư mục chứa project
					}
					catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				request.setAttribute("list", bills);
				request.setAttribute("reports", reports.isEmpty() ? Collections.emptyList() : reports);
				request.setAttribute("d1", formatter2.format(d1));
				request.setAttribute("d2", formatter2.format(d2));
				request.getRequestDispatcher("report.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email =request.getParameter("email");
		System.out.println(email+"00000");
		ReportDAO reportDAO =new ReportDAO();
		reportDAO.deleteReport(email);
		doGet(request, response);
	}

}
