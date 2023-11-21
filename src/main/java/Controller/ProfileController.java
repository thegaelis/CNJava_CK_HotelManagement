package Controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

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
 * Servlet implementation class ProfileController
 */
@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserDAO userDAO = new UserDAO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		User user = userDAO.detailUser(id);
		request.setAttribute("user", user);
		RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if("Update".equals(action)) {
			Update(request,response);
		}
		else if("UpdatePass".equals(action)) {
			UpdatePass(request,response);
		}
		doGet(request, response);
	}
	
	protected void Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		UserDAO userDAO = new UserDAO();
		List<User> users = userDAO.listUser();
		users = users.stream().filter(x-> !(x.getId().equals(id))).collect(Collectors.toList());
		if(users.stream().anyMatch(x -> (x.getEmail()).equals(email))) {
			request.setAttribute("msg", "email đã tồn tại");
			request.setAttribute("emailchange", email);
			doGet(request, response);
		}
		else {
			User user = (User)userDAO.detailUser(id);
			user.setEmail(email);
			user.setName(name);
			userDAO.updateUser(user);	
			doGet(request, response);
		}
	}
	
	protected void UpdatePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		UserDAO userDAO = new UserDAO();
		User user = (User)userDAO.detailUser(id);
		user.setPassword(request.getParameter("newpass"));
		
		userDAO.updateUser(user);
		
		doGet(request, response);
	}

}
