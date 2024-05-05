package music.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import music.data.AlbumDAO;
import musics.business.Album;

@WebServlet("/showAllAlbums")
public class ShowAllAlbumsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AlbumDAO albumDAO = new AlbumDAO();
        List<Album> allAlbums = albumDAO.getAllAlbums();

        request.setAttribute("allAlbums", allAlbums);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/allAlbums.jsp");
        dispatcher.forward(request, response);
    }
}
