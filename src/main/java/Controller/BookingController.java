package Controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Bill;
import BEAN.Guest;
import BEAN.Reservation;
import BEAN.ReservationRoom;
import BEAN.Room;
import BEAN.RoomType;
import DAO.BillDAO;
import DAO.GuestDAO;
import DAO.ReservationDAO;
import DAO.ReservationRoomDAO;
import DAO.RoomDAO;
import DAO.RoomTypeDAO;


/**
 * Servlet implementation class BookingController
 */
@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
			List<RoomType> list = roomTypeDAO.listRoomType();
			request.setAttribute("list", list);
			
			
			
			RequestDispatcher rd = request.getRequestDispatcher("booking.jsp");
			rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
				
		if(action.equals("KiemTraPhong")) {
			KiemTraPhong(request, response);
		}
		else if (action.equals("Imformation")) {
			Infomation(request,response);
		}
	
	}

	
	protected void KiemTraPhong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ngayden = request.getParameter("checkin");
		String ngaydi = request.getParameter("checkout");
		RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
		RoomDAO roomDAO = new RoomDAO();
		List<RoomType> list = roomTypeDAO.listRoomType();
		Map<String, Integer> mapSoLuongPhongTheoId = new HashMap<>();
		for(RoomType i: list) {
			mapSoLuongPhongTheoId.put(i.getId(),Integer.parseInt(request.getParameter(i.getName())));
			request.setAttribute("number-"+i.getId(), Integer.parseInt(request.getParameter(i.getName())));
		}
		Set<String> setRoomTypeID = mapSoLuongPhongTheoId.keySet();
	
		for(String RoomTypeID: setRoomTypeID) {
			
			if(mapSoLuongPhongTheoId.get(RoomTypeID) > roomDAO.layPhongChuaDat(ngayden, ngaydi, RoomTypeID).size()) {
				request.setAttribute("msg", "Trong khoảng ngày đó không có phòng, vui lòng chọn ngày khác, hoặc loại phòng khác");	
				doGet(request,response);
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("checkin", ngayden);
		request.setAttribute("checkout", ngaydi);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("booking2.jsp");
		rd.forward(request, response);
	}
	
	protected void Infomation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ngayden = request.getParameter("checkin");
		String ngaydi = request.getParameter("checkout");
		String name = request.getParameter("name1");
		String email = request.getParameter("email");
		String sdt = request.getParameter("sdt");
		String CCCD = request.getParameter("CCCD");
		
		RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
		RoomDAO roomDAO = new RoomDAO();
		List<RoomType> list = roomTypeDAO.listRoomType();
		Map<String, Integer> mapSoLuongPhongTheoId = new HashMap<>();
		for(RoomType i: list) {
			mapSoLuongPhongTheoId.put(i.getId(),Integer.parseInt(request.getParameter(i.getName())));
			request.setAttribute("number-"+i.getId(), Integer.parseInt(request.getParameter(i.getName())));
		}
		Set<String> setRoomTypeID = mapSoLuongPhongTheoId.keySet();
	
		for(String RoomTypeID: setRoomTypeID) {
			
			if(mapSoLuongPhongTheoId.get(RoomTypeID) > roomDAO.layPhongChuaDat(ngayden, ngaydi, RoomTypeID).size()) {
				request.setAttribute("msg", "Trong khoảng ngày đó không có phòng, vui lòng chọn ngày khác, hoặc loại phòng khác");	
				doGet(request,response);
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("sdt", sdt);
		request.setAttribute("CCCD", CCCD);
		request.setAttribute("ngayden", ngayden);
		request.setAttribute("ngaydi", ngaydi);
		
		//Viết sql
		//tạo khách
		GuestDAO guestDAO =new GuestDAO(); 
		List<Guest> guests = guestDAO.listGuest();

		String guestID =null;
		//Check email
		if (guests.stream().anyMatch(x -> x.getEmail().equals(email))) {
			for(Guest g:guests) {
				if(g.getEmail().equals(email)) {
					guestID=g.getId();
					System.out.println(guestID);
				}
			}
        }else {
        	System.out.println("-------->checkfalse");
			Calendar now = Calendar.getInstance();
			Guest guest =new Guest();		
			
			guestID=randomID();
			
			guest.setId(guestID);
			guest.setCitizenId(randomID());
			guest.setName(name);
			guest.setAge(18);
			guest.setEmail(email);
			guest.setPhoneNumber(sdt);
			
			guestDAO.insertGuest(guest);
        }
		
		//tạo reservation----------------------------------------------------------------------------
		ReservationDAO reservationDAO =new ReservationDAO(); 
		Reservation reservation =new Reservation();
		
		reservation.setId(randomID());
		reservation.setGuestId(guestID);
		reservation.setNumberOfPeople(1);
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date dateCheckin = sdf.parse(ngayden);
	            Date dateCheckout = sdf.parse(ngaydi);
	            reservation.setStartTime(dateCheckin);
	            reservation.setEndTime(dateCheckout);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        };
	    boolean add= reservationDAO.insertReservation(reservation);
	    System.out.println("->>>>>>>>>>>>>check--"+add);
	    
	    
	    //tạo reservationRoom
	    ReservationRoomDAO reservationRoomDAO = new ReservationRoomDAO();
	    for(String RoomTypeID: setRoomTypeID) {
	    	List<Room> listPhongchuaDat = roomDAO.layPhongChuaDat(ngayden, ngaydi, RoomTypeID);
	    	for(int i = 0 ; i < mapSoLuongPhongTheoId.get(RoomTypeID);++i) {
	    		ReservationRoom reservationRoom = new ReservationRoom();
	    		reservationRoom.setRoomId(listPhongchuaDat.get(i).getId());
	    		reservationRoom.setReservationId(reservation.getId());
	    		reservationRoomDAO.insertReservationRoom(reservationRoom);
	    	}
	    }
	    
	    
	    
	    //ngày đi trừ ngày đến
		int days=0;
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
	    try {
			Date dateCheckin = sdf.parse(ngayden);
			Date dateCheckout = sdf.parse(ngaydi);
			c1.setTime(dateCheckin);
			c2.setTime(dateCheckout);
			days = (int)(c2.getTimeInMillis()-c1.getTimeInMillis())/(1000*60*60*24);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	    //Tính tiền
	    int sum = 0;
	    for(String RoomTypeID:setRoomTypeID) {
	    	RoomType roomType = roomTypeDAO.detailRoomType(RoomTypeID);
	    	sum += mapSoLuongPhongTheoId.get(RoomTypeID) * days * roomType.getDailyPrice();
	    }
	    
	    
	    //tạo Bill
	    BillDAO billDAO =new BillDAO();
	    Bill bill =new Bill();
	    bill.setId(randomID());
	    bill.setIdGuest(guestID);
	    bill.setStatus(false);
	    bill.setSum(sum);
	    billDAO.insertBill(bill);
	    
	    
	    
	    
		RequestDispatcher rd = request.getRequestDispatcher("successbooking.jsp");
		rd.forward(request, response);
	}
	
	private String randomID() {
		return UUID.randomUUID().toString();
	}
	
}
