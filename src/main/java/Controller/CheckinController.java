package Controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

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
 * Servlet implementation class CheckinController
 */
@WebServlet("/CheckinController")
public class CheckinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private ReservationDAO reservationDAO;
     private ReservationRoomDAO reservationRoomDAO;
     private RoomTypeDAO roomTypeDAO;
     private RoomDAO roomDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckinController() {
        super();
        roomTypeDAO= new RoomTypeDAO();
        reservationDAO= new ReservationDAO();
        reservationRoomDAO= new ReservationRoomDAO();
        roomDAO =new RoomDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Reservation> reservations  = reservationDAO.listReservation();
		List<String> idPhongDaDat  = reservationRoomDAO.listIdPhongDaDat();
		List<RoomType> roomTypes= roomTypeDAO.listRoomType();
		
		List<String> listIdPhongChuaDat = roomDAO.getAllRoomIdNoParam();
		
		listIdPhongChuaDat.removeAll(idPhongDaDat);
		
		List<Room> listRoomChuaDat = new ArrayList<Room>();
		
		List<RoomType> listRoomTypeChuaDat = new ArrayList<RoomType>();
		
		for(String id:listIdPhongChuaDat) {
			Room r =roomDAO.detailRoom(id);
			listRoomChuaDat.add(r);
		}
		
		for(Room room:listRoomChuaDat) {
			RoomType rt =roomTypeDAO.detailRoomType(room.getTypeId());
			listRoomTypeChuaDat.add(rt);
		}
		
		
		Map<String, Integer> mapNumberWithRoomChuaDat = new HashMap<>();
		
		for(RoomType rt: listRoomTypeChuaDat) {
			mapNumberWithRoomChuaDat.put(rt.getName(),mapNumberWithRoomChuaDat.getOrDefault(rt.getName(), 0) + 1);
		}
		
		
		
//		List<ReservationRoom> reservationWithRooms = new ArrayList<ReservationRoom>();
		
		
		
		Map<Reservation, Integer> mapRoomWithNumber = new HashMap<>();
		Map<String,Integer> mapRoomTypeWithNumber = new HashMap<>();
		Map<Reservation,Map<String,Integer>> mapReservationWithRoomType = new HashMap<>();
		
		
		for(Reservation reservation :reservations) {
			List<String> roomID = reservationRoomDAO.layIdPhongChuaDat(reservation.getId());
			mapRoomWithNumber.put(reservation, roomID.size());
			
			List<RoomType> roomTypesWithGuest = new ArrayList<RoomType>();
			
			for(String id: roomID) {
				Room room =roomDAO.detailRoom(id);
				RoomType roomType= roomTypeDAO.getRoomType(room.getTypeId());
				roomTypesWithGuest.add(roomType);
			}
			
			
			
			for(RoomType rt: roomTypesWithGuest) {
				
				mapRoomTypeWithNumber.put(rt.getName(),mapRoomTypeWithNumber.getOrDefault(rt.getName(), 0) + 1);
			}
			
			mapReservationWithRoomType.put(reservation, mapRoomTypeWithNumber);
			mapRoomTypeWithNumber = new HashMap<>();
			
		}
		

		
		
		
		request.setAttribute("reservations", reservations.isEmpty() ? Collections.emptyList() : reservations);
		request.setAttribute("roomTypes", roomTypes.isEmpty() ? Collections.emptyList() : roomTypes);
		request.setAttribute("mapRoom", mapRoomWithNumber);
		request.setAttribute("mapRoomTypeNumber", mapReservationWithRoomType);
		request.setAttribute("mapNumberWithRoomChuaDat", mapNumberWithRoomChuaDat);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("hotelmanage_checkin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("CheckIn")) {
			//update reservation
			String reservationID =request.getParameter("reservationID");
			
			Reservation reservation = reservationDAO.detailReservation(reservationID);
			Calendar now = Calendar.getInstance();
			
			reservation.setConfirmationTime(new java.sql.Date(now.getTimeInMillis()));
			reservation.setIsConfirmed(true);
			
			reservationDAO.updateReservation(reservation);
			
			//update room
				List<String> roomID = reservationRoomDAO.layIdPhongChuaDat(reservationID);
				for(String id: roomID) {
					Room room =roomDAO.detailRoom(id);
					room.setIsVaiable(true);
					roomDAO.updateRoom(room);
				}

			
			doGet(request, response);
		}
		else if (action.equals("booking")) {
			
			String name =request.getParameter("name");
			String sdt =request.getParameter("sdt");
			String email =request.getParameter("email");
			String cccd =request.getParameter("cccd");
			boolean check =KiemTraPhong(request,response); 
			if(check) {
				Infomation(request,response);
				request.setAttribute("msg", "Đặt phòng thành công");	
				doGet(request, response);
			}
			
		}
		
	}
	
	protected boolean KiemTraPhong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RoomType> list = roomTypeDAO.listRoomType();
		boolean check=false;
		for(RoomType i: list) {
			int number=Integer.parseInt(request.getParameter(i.getName()));
			if(number>0) {
				check=true;
			}
		}
		if(!check) {
			request.setAttribute("msg", "vui lòng chọn số phòng");	
			doGet(request, response);
			return false;
		}	
		return true;
	}
	
	protected void Infomation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ngayden = request.getParameter("checkin");
		String ngaydi = request.getParameter("checkout");
		String name =request.getParameter("name");
		String sdt =request.getParameter("sdt");
		String email =request.getParameter("email");
		String cccd =request.getParameter("cccd");
		
		RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
		RoomDAO roomDAO = new RoomDAO();
		List<RoomType> list = roomTypeDAO.listRoomType();
		
		Map<String, Integer> mapSoLuongPhongTheoId = new HashMap<>();
		for(RoomType i: list) {
			mapSoLuongPhongTheoId.put(i.getId(),Integer.parseInt(request.getParameter(i.getName())));
			System.out.println(i.getId()+" "+Integer.parseInt(request.getParameter(i.getName())));
		}
		Set<String> setRoomTypeID = mapSoLuongPhongTheoId.keySet();
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("sdt", sdt);
		request.setAttribute("CCCD", cccd);
		request.setAttribute("ngayden", ngayden);
		request.setAttribute("ngaydi", ngaydi);
//		
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
	   
	    
	    //tạo reservationRoom
	    ReservationRoomDAO reservationRoomDAO = new ReservationRoomDAO();
	    for(String RoomTypeID: setRoomTypeID) {
	    	System.out.println("////////////////////////////"+RoomTypeID);
	    	List<Room> listPhongchuaDat = roomDAO.layPhongChuaDat(ngayden, ngaydi, RoomTypeID);
	    	System.out.println("mmmmmmmmmmmmmmmmmmmmmm"+mapSoLuongPhongTheoId.get(RoomTypeID));
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
	}
	
	private String randomID() {
		return UUID.randomUUID().toString();
	}

}
