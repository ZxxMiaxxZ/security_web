package music.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import music.data.SongDAO;
import musics.business.Song;
import musics.business.User;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to main.jsp
    	HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
    	if (user != null) {
            // Sử dụng thông tin user ở đây
            request.setAttribute("user", user);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/views/main.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the username from the login process
    	// Assuming you have a method to get the list of songs, for example:
    	SongDAO songdao=new SongDAO();
        List<Song> songs = songdao.getAllSongs();

        // Set the list of songs as an attribute in the request
        request.setAttribute("songs", songs);
        String username = request.getParameter("username");

        // Save the username to the session
        HttpSession session = request.getSession();
        session.setAttribute("username", username);

        // Redirect to the main.jsp
        response.sendRedirect(request.getContextPath() + "/HomeServlet");
    }
}
