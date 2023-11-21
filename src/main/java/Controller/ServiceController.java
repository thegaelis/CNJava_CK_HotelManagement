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

import BEAN.Service;
import DAO.ServiceDAO;

@WebServlet("/ServiceController")
public class ServiceController extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 
	 @Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	String action = req.getParameter("action");

			switch (action) {
			case "list":
				listService(req, resp);
				break;
			case "delete":
	            deleteService(req, resp);
	            break;
	        case "add":
	            addService(req, resp);
	            break;
	        case "update":
	            updateService(req, resp);
	            break;	
			default:
				listService(req, resp);
			}

		}
	 @Override
		 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			 	String action = req.getParameter("action");
	
				switch (action) {
				case "list":
					listService(req, resp);
					break;
				case "delete":
		            deleteService(req, resp);
		            break;
		        case "add":
		            addService(req, resp);
		            break;
		        case "update":
		            updateService(req, resp);
		            break;
				default:
					listService(req, resp);
				}
	
			}
	 
	    public void listService(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	       
	        ServiceDAO serviceDAO = new ServiceDAO();
	        List<Service> services = serviceDAO.listServices();

	        request.setAttribute("services", services.isEmpty() ? Collections.emptyList() : services);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("materialmanage_service.jsp");
	        dispatcher.forward(request, response);
	
	    }
	    
	    public void deleteService(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
			String id = request.getParameter("id");
			ServiceDAO serviceDAO = new ServiceDAO();
			try {
				serviceDAO.deleteService(id);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/ServiceController?action=list");
		}
	    private String randomID() {
			return UUID.randomUUID().toString();
		}

	    private void addService(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	        String id = randomID();
	        String name = request.getParameter("name");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String description = request.getParameter("description");

	        Service newService = new Service(id, name, price, description);

	        ServiceDAO serviceDAO = new ServiceDAO();
	        try {
				serviceDAO.addService(newService);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        response.sendRedirect(request.getContextPath() + "/ServiceController?action=list");
	    }
	    private void updateService(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	String id = request.getParameter("id");

	       
	        String name = request.getParameter("name");
	        double price;
	        try {
	          
	            String priceParam = request.getParameter("price");
	            price = (priceParam != null && !priceParam.isEmpty()) ? Double.parseDouble(priceParam) : 0.0;
	        } catch (NumberFormatException e) {
	           
	            price = 0.0;
	        }
	        String description = request.getParameter("description");

	        
	        Service updatedService = new Service(id, name, price, description);

	        ServiceDAO serviceDAO = new ServiceDAO();
	        try {
	            serviceDAO.updateService(updatedService);
	        } catch (ClassNotFoundException e) {
	            
	            e.printStackTrace();
	        }
	        response.sendRedirect(request.getContextPath() + "/ServiceController?action=list");
	    }
}