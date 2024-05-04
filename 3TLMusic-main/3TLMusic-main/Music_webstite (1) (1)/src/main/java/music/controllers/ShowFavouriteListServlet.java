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
import musics.business.Song;

@WebServlet("/showFavouriteList")
public class ShowFavouriteListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username != null) {
            FavouritelistDAO favouritelistDAO = new FavouritelistDAO();
            List<Song> favouriteList = favouritelistDAO.getFavouriteList(username);

            request.setAttribute("favouriteList", favouriteList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/list.jsp");
            dispatcher.forward(request, response);
        } else {
            // If not logged in, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
