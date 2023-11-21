package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Reservation;
import BEAN.ReservationRoom;
import BEAN.Room;
import BEAN.RoomType;
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
//		List<ReservationRoom> reservationRooms  = reservationRoomDAO.listReservationRoom();
//		List<ReservationRoom> reservationWithRooms = new ArrayList<ReservationRoom>();
		//List<RoomType> roomTypes =roomTypeDAO.listRoomType();
		
		
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
		request.setAttribute("mapRoom", mapRoomWithNumber);
		request.setAttribute("mapRoomTypeNumber", mapReservationWithRoomType);
		
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
		//doGet(request, response);
	}

}
