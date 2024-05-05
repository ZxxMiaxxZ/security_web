<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/sidebar.jsp" />
<jsp:include page="/include/info.jsp" />
<%@ page import="java.util.List"%>
<%@ page import="musics.business.Song"%>
<%@ page import="music.data.SongDAO"%>
<%@ page import="musics.business.Album"%>
<%@ page import="music.data.AlbumDAO"%>
<%@ page import="java.net.URLEncoder"%>
<h1>Welcome to the Main Page</h1>

<%-- Display the username if available --%>
<% String username = (String) session.getAttribute("username"); %>
<% if (username != null && !username.isEmpty()) { %>
<p>
	Hello,
	<%= username %>!
</p>
<% } else { %>
<p>Hello, Guest!</p>
<% } %>

<main id="main" class="p-4">
    <section id="feedHeader">

		<!-- start of greeting -->
		<h3 class="fw-bold" >Album</h3>
		<!-- end of greeting -->

		<!-- recent playlists -->
		<ul id="playlistsRecentes" class="mb-5">
			<%String albumNameParam = request.getParameter("albumName");
            String encodedAlbumName = URLEncoder.encode(albumNameParam, "UTF-8");
			SongDAO songDAO = new SongDAO();
            List<Song> songs = songDAO.getsonginalbum(albumNameParam);
		    if (songs != null && !songs.isEmpty()) {
		        for (Song song : songs) {
		        	/* System.out.println(song.getUrlimg());  */
		            %>

		<li class="song-card" data-song-url=".<%=song.getUrlsong()%>" data-song-name="<%=song.getSongname()%>" data-song-img=".<%=song.getUrlimg()%>">
                <img src=".<%=song.getUrlimg()%>" :alt="playlist.nome">
                <span class="fw-semibold ms-3 me-auto"><%= song.getSongname() %></span>
               	<button type="button" class="btn me-3 song-card" data-song-url=".<%=song.getUrlsong()%>" data-song-name="<%=song.getSongname()%>" data-song-img=".<%=song.getUrlimg()%>">
               		<svg role="img" height="24" width="24" viewBox="0 0 24 24">
                    <path
                      d="M7.05 3.606l13.49 7.788a.7.7 0 010 1.212L7.05 20.394A.7.7 0 016 19.788V4.212a.7.7 0 011.05-.606z">
                    </path>
                 </svg>
                 </button>
              </li>
			<%
		        }
		    } 
		    %>

		</ul>
	</section>

    <!-- Optional: Include Bootstrap JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</div>
</div>
<script src="./js/script.js"></script>
<jsp:include page="/include/footer.jsp" />
<script src="js/audioPlayer.js"></script>
