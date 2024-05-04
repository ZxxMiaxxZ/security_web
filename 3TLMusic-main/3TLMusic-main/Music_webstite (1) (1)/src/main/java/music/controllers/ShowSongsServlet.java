package music.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import music.data.SongDAO;
import musics.business.Song;

@WebServlet("/ShowSongsServlet")
public class ShowSongsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SongDAO songDAO;

    @Override
    public void init() throws ServletException {
        songDAO = new SongDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String albumName = request.getParameter("albumName");

        List<Song> songs = songDAO.getsonginalbum(albumName);

        request.setAttribute("songs", songs);
        request.setAttribute("albumName", albumName);

        // Forward the request to the showSongs.jsp page
        request.getRequestDispatcher("/views/showSongs.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        songDAO.closeEntityManagerFactory();
    }
}
