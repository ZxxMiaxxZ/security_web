package music.controllers;


import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import music.data.SongDAO;
import musics.business.Song;
import musics.business.User;


@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
	private SongDAO songDao;

    @Override
    public void init() throws ServletException {
        super.init();
        songDao = new SongDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sessionToken = (String) request.getSession().getAttribute("csrfToken");
        String formToken = request.getParameter("csrfToken");
        if (sessionToken == null || !sessionToken.equals(formToken)) {
        	return;
        }
        String searchTerm = request.getParameter("searchTerm");

        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            List<Song> songs = songDao.searchSongs(searchTerm);
            request.setAttribute("songs", songs);
        }

        // Lấy thông tin user từ Session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Kiểm tra nếu user tồn tại
        if (user != null) {
            // Sử dụng thông tin user ở đây
            request.setAttribute("user", user);
        }

        request.getRequestDispatcher("/views/Search1.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        songDao.closeEntityManagerFactory();
        super.destroy();
    }
}
