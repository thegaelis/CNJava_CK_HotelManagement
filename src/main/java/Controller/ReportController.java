package Controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Guest;
import BEAN.Report;
import BEAN.RoomType;
import DAO.GuestDAO;
import DAO.ReportDAO;
import DAO.RoomTypeDAO;

/**
 * Servlet implementation class ReportController
 */
@WebServlet("/ReportController")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GuestDAO guestDAO =new GuestDAO();
    private ReportDAO reportDAO =new ReportDAO();
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
		
		List<Report> list = reportDAO.listReport();
		request.setAttribute("list", list);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String text = request.getParameter("text");
		
		System.out.println(email +" "+text);
		
		//check email
		List<Guest> guests = guestDAO.listGuest();
		if (guests.stream().anyMatch(x -> x.getEmail().equals(email))) {
			request.setAttribute("msg", "Bạn đã phản hồi thành công!");	
			//insert report
			Report report =new Report();
			report.setEmail(email);
			report.setText(text);
			
			reportDAO.insertReport(report);
        }else {
        	request.setAttribute("msg", "Bạn chưa đặt phòng trước đó thì không có tư cách phản hồi");	
        }
		
		doGet(request, response);
	}

}
