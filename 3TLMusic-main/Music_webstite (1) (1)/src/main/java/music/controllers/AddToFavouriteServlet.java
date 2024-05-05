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

import music.data.FavouritelistDAO;
import music.data.SongDAO;
import musics.business.Song;

@WebServlet("/addToFavourite")
public class AddToFavouriteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
        String sessionToken = (String) request.getSession().getAttribute("csrfToken");
        String formToken = request.getParameter("csrfToken");

		if (username != null) {
			String songname = request.getParameter("songname");
			if (songname == null) {
				SongDAO songDAO = new SongDAO();
				String url = request.getParameter("songUrl");
				System.out.println("url" + url);
				songname = songDAO.getSongNameByUrl(url);
			}
			FavouritelistDAO favouritelistDAO = new FavouritelistDAO();
			boolean addedSuccessfully = favouritelistDAO.addFavouritelist(username, songname);

			if (addedSuccessfully) {
				// Chuyển hướng người dùng đến trang main.jsp
				response.sendRedirect(request.getContextPath() + "/HomeServlet");

			} else {

				// Chuyển hướng người dùng đến trang main.jsp
				response.sendRedirect(request.getContextPath() + "/HomeServlet");

			}
		}

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username != null) {
            FavouritelistDAO favouritelistDAO = new FavouritelistDAO();
            List<Song> favouriteList = favouritelistDAO.getFavouriteList(username);

            request.setAttribute("favouriteList", favouriteList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/favouriteList.jsp");
            dispatcher.forward(request, response);
        } else {
            // If not logged in, redirect to login page
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
