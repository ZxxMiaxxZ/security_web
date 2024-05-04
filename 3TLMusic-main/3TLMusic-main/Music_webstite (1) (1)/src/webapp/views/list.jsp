<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/searchheader.jsp" />
<jsp:include page="/include/sidebar.jsp" />
<jsp:include page="/include/search.jsp" />
<link rel="stylesheet" href="./styles/search.css">
<link rel="stylesheet" href="./styles/song.css">
<link rel="stylesheet" type="text/css" href="./styles/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	crossorigin="anonymous">
<%@ page import="java.util.List"%>
<%@ page import="musics.business.Song"%>
<%@ page import="music.data.SongDAO"%>
<%@ page import="musics.business.User"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
    <h1>Your Favorite Songs</h1>



    <%-- Display the list of favorite songs --%>
    <ul>
        <% 
            List<Song> favouriteList = (List<Song>) request.getAttribute("favouriteList");
            if (favouriteList != null && !favouriteList.isEmpty()) {
                for (Song song : favouriteList) {
        %>
		 <li class="song-card" data-song-url=".<%=song.getUrlsong()%>" data-song-name="<%=song.getSongname()%>" data-song-img=".<%=song.getUrlimg()%>">
                <img src=".<%=song.getUrlimg()%>" :alt="playlist.nome" style="width: 100px; height: 100px;">
                <span class="fw-semibold ms-3 me-auto" style="font-size: 20px"><%= song.getSongname() %></span><br>
				<strong>Author:</strong> <%= song.getAuthor() %><br>
				<strong>Release Day:</strong> <%= song.getReleaseday() %><br>
            	<button type="button" class="btn me-3 song-card" data-song-url=".<%=song.getUrlsong()%>" data-song-name="<%=song.getSongname()%>" data-song-img=".<%=song.getUrlimg()%>">
               		<svg role="img" height="24" width="24" viewBox="0 0 24 24">
                    <path
                      d="M7.05 3.606l13.49 7.788a.7.7 0 010 1.212L7.05 20.394A.7.7 0 016 19.788V4.212a.7.7 0 011.05-.606z">
                    </path>
                 </svg>
                 </button>
            <a href="EditFavoSevlet?songname=<%= song.getSongname()%>">Remove</a>
        </li> 

        <% 
                }
            } else {
        %>
        <li>No favorite songs yet.</li>
        <% } %>
    </ul>
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    </div>
    
    </div>
    
<script src="./js/script.js"></script>
<jsp:include page="/include/footer.jsp" />
