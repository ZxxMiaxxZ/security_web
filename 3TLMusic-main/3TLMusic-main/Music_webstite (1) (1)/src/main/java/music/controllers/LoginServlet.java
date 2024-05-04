package music.controllers;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import music.data.UserDAO;

@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String csrfToken = UUID.randomUUID().toString();
        session.setAttribute("csrfToken", csrfToken);
        request.setAttribute("csrfToken", csrfToken);

        RequestDispatcher rd = request.getRequestDispatcher("/views/Login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sessionToken = (String) session.getAttribute("csrfToken");
        String formToken = request.getParameter("csrf_token");

        if (sessionToken == null || !sessionToken.equals(formToken)) {
            request.setAttribute("MESSAGE", "Session expired or invalid request.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/Login.jsp");
            rd.forward(request, response);
            return;
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();


        if (username != null && password != null && username.length() <= 255 && password.length() <= 255) {
        	if (userDAO.CheckLogin(username, password)) {
                session.setAttribute("username", username);

                Cookie userCookie = new Cookie("user", username);
                userCookie.setHttpOnly(true);
                userCookie.setSecure(true); // Enable this only if using HTTPS
                userCookie.setMaxAge(60 * 60 * 24);
                response.addCookie(userCookie);

                response.sendRedirect(request.getContextPath() + "/HomeServlet");
            } else {
                request.setAttribute("MESSAGE", "Invalid username or password");
                RequestDispatcher rd = request.getRequestDispatcher("/views/Login.jsp");
                rd.forward(request, response);
            }
        } else {
            // Handle error: Input too long
            request.setAttribute("MESSAGE", "Input length is too long.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/Login.jsp");
            rd.forward(request, response);
            return;
        }
        
    }
}
