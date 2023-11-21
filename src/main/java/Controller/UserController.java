package Controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.Random;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.User;
import DAO.UserDAO;


/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
        userDAO = new UserDAO();
    }
    
    public void init() {
    	userDAO = new UserDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String role = (String)session.getAttribute("role");
		if(role.equals("NV")) {
			RequestDispatcher rd = request.getRequestDispatcher("ProfileController");
			rd.forward(request, response);
		}
		
		List<User> users = userDAO.listUser();
			
		request.setAttribute("users", users.isEmpty() ? Collections.emptyList() : users);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("table.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("Add".equals(action)){
			addUser(request,response);
		}
		else if("Update".equals(action)) {
			updateUser(request,response);
		}
		else if("Delete".equals(action)) {
			deleteUser(request,response);
		}
	}
	
	protected void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name =request.getParameter("name");
		String age=request.getParameter("age");
		String salary =request.getParameter("salary");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		
		if(name.trim().isEmpty() || age.trim().isEmpty()|| salary.trim().isEmpty()|| email.trim().isEmpty()|| password.trim().isEmpty() ) {
			request.setAttribute("messUser", "Please fill input");
			doGet(request,response);
		}
		else {
		
			List<User> users = userDAO.listUser();
					
			//Check email
			if (users.stream().anyMatch(x -> x.getEmail().equals(email))) {
				request.setAttribute("messUser", "Email has exits");
				doGet(request,response);
	        }
			else {
			
				Calendar now = Calendar.getInstance();
				
				User user =new User();
				
				user.setId(randomID());
				user.setName(name);
				user.setAge(Integer.valueOf(age));
				user.setStartDate( new java.sql.Date(now.getTimeInMillis()));
				user.setSalary(salary);
				user.setRole("NV");
				user.setEmail(email);
				user.setPassword(password);
				
				Boolean add = userDAO.insertUser(user);
				if(add) {
					request.setAttribute("messUser", "Add user succesfull");
					doGet(request,response);
				}
				else {
					request.setAttribute("messUser",null);
					doGet(request,response);
				}
			}
			
		}
		
	}
	
	private String randomID() {
		return UUID.randomUUID().toString();
	}
	
	protected void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id =request.getParameter("id");
		String name =request.getParameter("name");
		String age=request.getParameter("age");
		String salary =request.getParameter("salary");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		
		List<User> users = userDAO.listUser();
		users = users.stream()
	                .filter(x -> !(x.getId().equals(id)))
	                .collect(Collectors.toList());
		System.out.println("------------------"+users);
		
		if(name.trim().isEmpty() || age.trim().isEmpty()|| salary.trim().isEmpty()|| email.trim().isEmpty()|| password.trim().isEmpty() ) {
			request.setAttribute("messUser", "Please fill input");
			doGet(request,response);
		}
		else {
			if (users.stream().anyMatch(x -> (x.getEmail().equals(email)))) {
				request.setAttribute("messUser", "Email has exits");
				doGet(request,response);
	        }
			else {
				Calendar now = Calendar.getInstance();
				
				User user =new User();
				
				user.setId(id);
				user.setName(name);
				user.setAge(Integer.valueOf(age));
				user.setSalary(salary);
				user.setEmail(email);
				user.setPassword(password);
				
				Boolean update = userDAO.updateUser(user);
				if(update) {
					request.setAttribute("messUser", "Update user succesfull");
					doGet(request,response);
				}
				else {
					request.setAttribute("messUser",null);
					doGet(request,response);
				}
			}
		}
		
	}
	
	protected void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id =request.getParameter("id");
		
		Boolean delete =userDAO.deleteUser(id);
		if(delete) {
			request.setAttribute("messUser", "Delete user succesfull");
			doGet(request,response);
		}
		else {
			request.setAttribute("messUser",null);
			doGet(request,response);
		}
	}
	

}
