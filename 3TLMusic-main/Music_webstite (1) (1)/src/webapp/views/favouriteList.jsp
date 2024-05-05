<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/searchheader.jsp" />
<jsp:include page="/include/sidebar.jsp" />
<jsp:include page="/include/search.jsp" />
<%@ page import="java.util.List"%>
<%@ page import="musics.business.Song"%>
<%@ page import="music.data.SongDAO"%>
<%@ page import="musics.business.User"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
    <h1>Add to Favorite List</h1>

    <%-- Display success message --%>
    <% String successMessage = (String) request.getAttribute("successMessage"); %>
    <% if (successMessage != null && !successMessage.isEmpty()) { %>
        <p style="color: green;"><%= successMessage %></p>
    <% } %>

    <%-- Display error message --%>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <%-- Your form goes here --%>
    <form action="addToFavourite" method="post">
   		
   		<input type="hidden" name="csrfToken" value="${csrfToken}">
        
        <%-- Get username from the session --%>
        <% HttpSession Session = request.getSession(); %>
        <% String username = (String) session.getAttribute("username"); %>

        <%-- Display username in the form --%>
        <label>Username:</label>
        <input type="text" name="username" value="<%= username %>" readonly>

        <%-- Display song dropdown list (you can modify this as needed) --%>
        <label>Song Name:</label>
        <select name="songname">
            <% 
                SongDAO songDAO = new SongDAO();
                List<Song> allSongs = songDAO.getAllSongs();

                for (Song song : allSongs) {
            %>
            <option value="<%= song.getSongname() %>"><%= song.getSongname() %></option>
            <% } %>
        </select>

        <input type="submit" value="Add to Favorite">
    </form>

    <%-- Add button to view favorite list --%>
    <form action="showFavouriteList" method="get">
        <input type="submit" value="View Favorite List">
    </form>
 </div>
    
    </div>
    
<script src="./js/script.js"></script>
<jsp:include page="/include/footer.jsp" />
