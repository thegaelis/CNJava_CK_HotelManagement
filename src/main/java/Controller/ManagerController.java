package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.websocket.server.WsRemoteEndpointImplServer;

import BEAN.Bill;
import BEAN.Guest;
import BEAN.ListService;
import BEAN.Reservation;
import BEAN.ReservationRoom;
import BEAN.Room;
import BEAN.RoomType;
import BEAN.Service;
import BEAN.ServiceListService;
import DAO.BillDAO;
import DAO.CheckInDAO;
import DAO.GuestDAO;
import DAO.ListServiceDAO;
import DAO.ReservationDAO;
import DAO.ReservationRoomDAO;
import DAO.RoomDAO;
import DAO.RoomTypeDAO;
import DAO.ServiceDAO;
import DAO.ServiceListServiceDAO;

/**
 * Servlet implementation class CheckInController
 */
@WebServlet("/ManagerController")
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomDAO roomDAO;
	private RoomTypeDAO roomTypeDAO;
	private ReservationRoomDAO reservationRoomDAO;
	private ReservationDAO reservationDAO;
	private GuestDAO guestDAO;
	private ServiceDAO serviceDAO;
	private ListServiceDAO listserviceDAO;
	private ServiceListServiceDAO serviceListServiceDAO;
	private CheckInDAO checkinDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerController() {
        super();
        roomDAO = new RoomDAO();
        roomTypeDAO= new RoomTypeDAO();
        reservationRoomDAO= new ReservationRoomDAO();
        reservationDAO =new ReservationDAO();
        guestDAO=new GuestDAO();
        serviceDAO=new ServiceDAO();
        listserviceDAO=new ListServiceDAO();
        serviceListServiceDAO= new ServiceListServiceDAO();
        checkinDAO = new CheckInDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Room> rooms  = roomDAO.listRoom();
		List<RoomType> roomTypes  = roomTypeDAO.listRoomType();
		List<Service> services = serviceDAO.listServices();
		List<ServiceListService> serviceListService = serviceListServiceDAO.listServiceListService();
		
		Map<String, Reservation> mapIdRoomAndIdGuest = new HashMap<>();
		Map<String, List<Service>> mapIdServiceAndIdGuest = new HashMap<>();
		List<String> room_da_dat= roomDAO.layIdPhongDaDat();
		//List<String> id_reservation_room_da_dat= new ArrayList<String>();
		
		
		
		for(String idRoom :room_da_dat) {
			String idReservation=reservationRoomDAO.layIdPhongDaDat(idRoom);
			Reservation reservation=reservationDAO.layIdPhongDaDat(idReservation);
			mapIdRoomAndIdGuest.put(idRoom,reservation);
			
			String idGuest =reservation.getGuestId();
			String idListService =listserviceDAO.getD(idGuest);
			List<String> idService =serviceListServiceDAO.getIDService(idListService);
			List<Service> servicesWithGuest=new ArrayList<Service>();
			for(String id: idService) {
				Service s =new Service();
				s= serviceDAO.getService(id);
				
				servicesWithGuest.add(s);
			}

			
			mapIdServiceAndIdGuest.put(idGuest, servicesWithGuest);
			
		}
		
		
		request.setAttribute("rooms", rooms.isEmpty() ? Collections.emptyList() : rooms);
		request.setAttribute("roomTypes", roomTypes.isEmpty() ? Collections.emptyList() : roomTypes);
		request.setAttribute("services", services.isEmpty() ? Collections.emptyList() : services);
		request.setAttribute("map",mapIdRoomAndIdGuest);
		request.setAttribute("mapservice",mapIdServiceAndIdGuest);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("hotelmanage_manage.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String idGuest =request.getParameter("idGuest");
		String idService =request.getParameter("idService");
		
		boolean checkIdGuest = true;
		if(action.equals("AddService")) {
			List<ListService> listServices = listserviceDAO.listListService();
			ListService listService =new ListService();
			for(ListService ls : listServices) {
				if(ls.getIdGuest().equals(idGuest)) {
					checkIdGuest=false;
					listService.setId(ls.getId());
					listService.setIdGuest(ls.getIdGuest());
					listService.setDateCreated(ls.getDateCreated());
					break;
				}
			}
			
			if(checkIdGuest) {
				listService.setId(randomID());
				listService.setIdGuest(idGuest);
				listserviceDAO.insertListService(listService);
			}
			
			
//			add servicelistservice
			ServiceListService serviceListService =new ServiceListService();
		
			serviceListService.setIdListService(listService.getId());
			serviceListService.setIdService(idService);
			
			serviceListServiceDAO.insertServiceListService(serviceListService);
			doGet(request, response);
		}
		else if(action.equals("ThanhToan")) {
			ThanhToan(request, response);
		}
		
		
	}
	
	protected void ThanhToan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String guestID = request.getParameter("guestID");
		String reservationID = request.getParameter("reservationID");
		int sum = Integer.parseInt(request.getParameter("sum"));
		HttpSession session = request.getSession();
		String idUser = (String)session.getAttribute("id");
		String nameUser = (String)session.getAttribute("username");
		Guest guest = guestDAO.detailGuest(guestID);
		String nameGuest = guest.getName();
		request.setAttribute("nameguest", nameGuest);
		request.setAttribute("nameuser", nameUser);
		
		
		
		List<String> listIdPhong = roomDAO.LayIdPhongTheoIdKhach(guestID);
		for(String id : listIdPhong) {
			Room room = roomDAO.detailRoom(id);
			room.setIsVaiable(false);
			roomDAO.updateRoom(room);
		}
		String idListService = listserviceDAO.getD(guestID);
		serviceListServiceDAO.XoaTheoIdListService(idListService);
		listserviceDAO.XoaTheoID(idListService);
		checkinDAO.XoaTheoIdReservation(reservationID);
		reservationRoomDAO.XoaTheoReservationID(reservationID);
		reservationDAO.deleteReservation(reservationID);
		
		BillDAO billDAO = new BillDAO();
		Bill bill = billDAO.LayBillTheoIdGuest(guestID);
		bill.setSum(bill.getSum()+sum);
		bill.setStatus(true);
		bill.setIdUser(idUser);
		billDAO.updateBill(bill);
		
		sendMail("dongphuong122003@gmail.com", "Cảm ơn quý khách đã sử dụng dịch vụ của khách sạn");
		
		
		request.setAttribute("tien", bill.getSum());
		request.setAttribute("Thanhtoan", 1);
		doGet(request, response);
	}
	
	private String randomID() {
		return UUID.randomUUID().toString();
	}
	
	private boolean sendMail(String to, String content) {
		String from = "nexushotel123@gmail.com";
		String password = "lozezryvorvxnubz";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", "587"); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		Authenticator auth = new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(from, password);
			}
			
		};
		
		Session session = Session.getInstance(props,auth);
		
		
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.setFrom(from);
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to,false));
			msg.setSubject("Thông báo khách sạn");
			msg.setSentDate(new Date());
			msg.setContent(content, "text/HTML; charset=UTF-8");
			Transport.send(msg);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}

}
