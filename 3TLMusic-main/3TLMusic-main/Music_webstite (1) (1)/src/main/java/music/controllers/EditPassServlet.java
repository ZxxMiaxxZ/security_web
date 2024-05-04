package music.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import music.data.UserDAO;
import musics.business.User;

@WebServlet("/EditPassServlet")
public class EditPassServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditPassServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // GET should handle displaying the form (or data for the form)
        // Assuming you have a mechanism to validate and retrieve session or user information
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Edit.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle update logic here
    	 // CSRF Token validation
        String sessionToken = (String) request.getSession().getAttribute("csrfToken");
        String formToken = request.getParameter("csrfToken");
        if (sessionToken == null || !sessionToken.equals(formToken)) {
            request.setAttribute("error", "Session expired or invalid request.");
            doGet(request, response);
            return;
        }
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();
        User user = new User(username, newPassword, fullname, email);
        boolean success = userDAO.updateUser(user);

        if (success) {
        	request.getSession().setAttribute("successMessage", "Profile updated successfully.");
            response.sendRedirect(request.getContextPath() + "/profile.jsp"); // Redirect to profile page on successful update
        } else {
            // Send back to the form with error message
            request.setAttribute("error", "Failed to update user information.");
            doGet(request, response);
        }
    }
}
