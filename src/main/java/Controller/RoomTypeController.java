package Controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.RoomType;
import DAO.RoomTypeDAO;

@WebServlet("/RoomTypeController")
public class RoomTypeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		listRoomType(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "list":
                listRoomType(req, resp);
                break;
            case "delete":
                deleteRoomType(req, resp);
                break;
            case "add":
			try {
				addRoomType(req, resp);
			} catch (ClassNotFoundException | IOException | ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
                break;
            case "update":
                updateRoomType(req, resp);
                break;
            default:
                listRoomType(req, resp);
        }
    }

    public void listRoomType(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        List<RoomType> roomTypes = roomTypeDAO.listRoomType();

        request.setAttribute("roomTypes", roomTypes.isEmpty() ? Collections.emptyList() : roomTypes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("materialmanage_roomtype.jsp");
        dispatcher.forward(request, response);
    }

    public void deleteRoomType(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        roomTypeDAO.deleteRoomType(id);
        response.sendRedirect(request.getContextPath() + "/RoomTypeController");
    }

    private String randomID() {
        return UUID.randomUUID().toString();
    }

    private void addRoomType(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ClassNotFoundException {
        String id = randomID();
        String name = request.getParameter("name");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        double areaInSquareMeters = Double.parseDouble(request.getParameter("areaInSquareMeters"));
        String description = request.getParameter("description");
     
        double dailyPrice = Double.parseDouble(request.getParameter("dailyPrice"));

        
        RoomType newRoomType = new RoomType(id, name, capacity, areaInSquareMeters, description, dailyPrice, null);

        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        roomTypeDAO.insertRoomType(newRoomType);

        response.sendRedirect(request.getContextPath() + "/RoomTypeController");
    }

    private void updateRoomType(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String capacityParam = request.getParameter("capacity");
            String areaInSquareMetersParam = request.getParameter("areaInSquareMeters");
            String description = request.getParameter("description");
           
            String dailyPriceParam = request.getParameter("dailyPrice");
         

            // Check and parse non-empty parameters
            int capacity = (capacityParam != null && !capacityParam.isEmpty()) ? Integer.parseInt(capacityParam) : 0;
            double areaInSquareMeters = (areaInSquareMetersParam != null && !areaInSquareMetersParam.isEmpty()) ?
                    Double.parseDouble(areaInSquareMetersParam) : 0.0;
          
            double dailyPrice = (dailyPriceParam != null && !dailyPriceParam.isEmpty()) ?
                    Double.parseDouble(dailyPriceParam) : 0.0;
           

            RoomType updatedRoomType = new RoomType(id, name, capacity, areaInSquareMeters, description, dailyPrice,null);

            RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
            roomTypeDAO.updateRoomType(updatedRoomType);

            response.sendRedirect(request.getContextPath() + "/RoomTypeController");
        } catch (NumberFormatException e) {
            // Handle parsing errors (e.g., invalid number format)
            e.printStackTrace(); // Log the error or handle it as needed
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        }
    }

}
