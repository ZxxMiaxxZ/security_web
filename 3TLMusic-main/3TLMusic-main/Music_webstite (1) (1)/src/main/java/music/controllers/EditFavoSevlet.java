package music.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import music.data.FavouritelistDAO;

/**
 * Servlet implementation class EditFavoSevlet
 */
@WebServlet("/EditFavoSevlet")
public class EditFavoSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditFavoSevlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
		if (username != null) {
			String songname = request.getParameter("songname");
			System.out.println(songname);
			FavouritelistDAO newdao = new FavouritelistDAO();
			boolean removed = newdao.removeFromFavouriteList(username, songname);
			if (removed) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/showFavouriteList");
	            dispatcher.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/views/list.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
