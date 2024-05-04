package music.controllers;

import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import music.data.AlbumDAO;
import musics.business.Album;
import musics.business.User;

@WebServlet("/AlbumServlet")
public class AlbumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve the CSRF token from the session and request
        String sessionToken = (String) session.getAttribute("csrfToken");
        String requestToken = request.getParameter("csrfToken");

        // Validate the CSRF token
        if (sessionToken == null || !sessionToken.equals(requestToken)) {
            // If token is invalid, redirect to error page or handle appropriately
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            return; // Important to stop further execution
        }

        String albumName = request.getParameter("albumname");
        String singerName = request.getParameter("singername");

        if (albumName != null && !albumName.isEmpty() && singerName != null && !singerName.isEmpty()) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                request.setAttribute("user", user);
            }

            Album newAlbum = new Album();
            newAlbum.setAlbumname(albumName);
            newAlbum.setSingername(singerName);

            AlbumDAO albumDAO = new AlbumDAO();
            albumDAO.addAlbum(newAlbum);

            response.sendRedirect(request.getContextPath() + "/HomeServlet");
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String csrfToken = UUID.randomUUID().toString();
        session.setAttribute("csrfToken", csrfToken);

        AlbumDAO albumDAO = new AlbumDAO();
        List<Album> albums = albumDAO.getAllAlbums();
        request.setAttribute("albums", albums);
        request.setAttribute("csrfToken", csrfToken); // Pass token to the JSP

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/showAllAlbums.jsp");
        dispatcher.forward(request, response);
    }
}
