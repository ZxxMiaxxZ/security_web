package music.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import music.data.UserDAO;
import musics.business.User;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve username from the request parameter
        String username = request.getParameter("12@gmail.com");

        // Get user information from the DAO
        User user = userDAO.getUserByUsername(username);

        // Set the user as an attribute in the request
        request.setAttribute("user", user);

        // Forward to the user.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user.jsp");
        dispatcher.forward(request, response);
    }


}
