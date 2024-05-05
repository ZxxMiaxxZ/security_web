package music.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import music.data.UserDAO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd =request.getRequestDispatcher("/views/Register.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sessionToken = (String) request.getSession().getAttribute("csrfToken");
        String formToken = request.getParameter("csrfToken");
        if (sessionToken == null || !sessionToken.equals(formToken)) {
            request.setAttribute("error", "Session expired or invalid request.");
            doGet(request, response);
            return;
        }
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		String fullname= request.getParameter("fullname");
		String email= request.getParameter("email");
		UserDAO u=new UserDAO();
		if(u.registerUser(username, password, fullname, email)) {
			request.setAttribute("MESSAGE","Succecfull register");
			RequestDispatcher rd = request.getRequestDispatcher("/views/Login.jsp");
			rd.forward(	request , response);
		}
		{
			request.setAttribute("MESSAGE","username");
			RequestDispatcher rd = request.getRequestDispatcher("/views/Register.jsp");
			rd.forward(	request , response);
		}
	}

}
