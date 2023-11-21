package Controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Room;
import BEAN.RoomType;

import DAO.RoomDAO;
import DAO.RoomTypeDAO;


/**
 * Servlet implementation class RoomController
 */
@WebServlet("/RoomController")
public class RoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomDAO roomDAO;
	private RoomTypeDAO roomTypeDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomController() {
        super();
        // TODO Auto-generated constructor stub
        roomDAO = new RoomDAO();
        roomTypeDAO= new RoomTypeDAO();
    }
    public void init() {
    	roomDAO = new RoomDAO();
        roomTypeDAO= new RoomTypeDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String role = (String)session.getAttribute("role");
		if(role.equals("NV")) {
			RequestDispatcher rd = request.getRequestDispatcher("ProfileController");
			rd.forward(request, response);
		}
		
		List<Room> rooms  = roomDAO.listRoom();
		List<RoomType> roomTypes  = roomTypeDAO.listRoomType();
		
		request.setAttribute("rooms", rooms.isEmpty() ? Collections.emptyList() : rooms);
		request.setAttribute("roomTypes", roomTypes.isEmpty() ? Collections.emptyList() : roomTypes);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("materialmanage_room.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("Add".equals(action)){
			addRoom(request,response);
		}
		else if("Update".equals(action)) {
			updateRoom(request,response);
		}
		else if("Delete".equals(action)) {
			deleteRoom(request,response);
		}
		//doGet(request, response);
	}
	
	protected void addRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String status =request.getParameter("status");
		String number=request.getParameter("number");
		String roomType =request.getParameter("roomType");
		
		System.out.println(status +'-'+number +' '+roomType);
		
		if(status.equals("null")||number.trim().isEmpty()||roomType.equals("null")) {
			doGet(request,response);
		}
		else {
		
			//check Number Room
			List<Room> rooms  = roomDAO.listRoom();
			if (rooms.stream().anyMatch(x -> x.getNumber().equals(number))) {
				request.setAttribute("messRoom", "Number has exits");
				doGet(request,response);
	        }
			else {
				Calendar now = Calendar.getInstance();
				System.out.println("-------------check"+status);
				Room room =new Room();
				
				room.setId(randomID());
				room.setNumber(number);
				if(status.equals("true")) {
					System.out.println("-------------"+status);
					room.setIsVaiable(true);
				}
				else {
					room.setIsVaiable(false);
				}
				room.setTypeId(roomType);
				room.setDateCreate(new java.sql.Date(now.getTimeInMillis()));
				
				Boolean add = roomDAO.insertRoom(room);
				if(add) {
					request.setAttribute("messRoom", "Add room succesfull");
					doGet(request,response);
				}
				else {
					request.setAttribute("messRoom",null);
					doGet(request,response);
				}
			}
		}
	}
	
	private String randomID() {
		return UUID.randomUUID().toString();
	}
	
	protected void updateRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id =request.getParameter("id");
		String status =request.getParameter("status");
		String number=request.getParameter("number");
		String roomType =request.getParameter("roomType");
		
		
		if(status.equals("null")||number.trim().isEmpty()||roomType.equals("null")) {
			doGet(request,response);
		}
		else {
		
			List<Room> rooms = roomDAO.listRoom();
			rooms = rooms.stream()
		                .filter(x -> !(x.getId().equals(id)))
		                .collect(Collectors.toList());
			
			if(status.equals("null")||number.trim().isEmpty()||roomType.equals("null")) {
				doGet(request,response);
			}
			else {
				if (rooms.stream().anyMatch(x -> (x.getNumber().equals(number)))) {
					request.setAttribute("messRoom", "Number has exits");
					doGet(request,response);
		        }
				else {		
					Room room =new Room();
					
					room.setId(id);
					room.setNumber(number);
					if(status=="true") {
						room.setIsVaiable(true);
					}
					else {
						room.setIsVaiable(false);
					}
					room.setTypeId(roomType);	
					
					Boolean update = roomDAO.updateRoom(room);
					if(update) {
						request.setAttribute("messRoom", "Update room succesfull");
						doGet(request,response);
					}
					else {
						request.setAttribute("messRoom",null);
						doGet(request,response);
					}
				}
			}
		}
		
	}
	
	protected void deleteRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id =request.getParameter("id");
		
		Boolean delete =roomDAO.deleteRoom(id);
		if(delete) {
			request.setAttribute("messRoom", "Delete room succesfull");
			doGet(request,response);
		}
		else {
			request.setAttribute("messRoom",null);
			doGet(request,response);
		}
	}
	
}
