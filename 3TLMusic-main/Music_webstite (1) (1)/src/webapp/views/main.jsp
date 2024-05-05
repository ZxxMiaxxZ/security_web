<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/sidebar.jsp" />
<jsp:include page="/include/info.jsp" />
<%@ page import="java.util.List"%>
<%@ page import="musics.business.Song"%>
<%@ page import="music.data.SongDAO"%>
<%@ page import="musics.business.Album"%>
<%@ page import="music.data.AlbumDAO"%>
 <h1 style="color: #e39bb3; font-family: 'Arial', sans-serif; text-align: center;;font-size:70px">Welcome to 3TL Music Website</h1>


    <%-- Display the username if available --%>
    <% String username = (String) session.getAttribute("username"); %>
<% if (username != null && !username.isEmpty()) { %>
    <p style="color: #2eabdb; font-size: 30px;">Hello, <span style="font-weight: bold;"><%= username %></span>!</p>
<% } else { %>
    <p style="color: red; font-size: 70px;">Hello, Guest!</p>
<% } %>


<main id="main" class="p-4">

          <!-- seção inicial (header) -->
          <section id="feedHeader">

            <!-- start of greeting -->
            <h2 class="fw-bold" id="greeting">Welcome Back</h2>
            <!-- end of greeting -->
				  
            <!-- recent playlists -->
            <ul id="playlistsRecentes" class="mb-5">
            <% SongDAO songDAO = new SongDAO();
            List<Song> songs = songDAO.getAllSongs();
            int count = 0;
		    if (songs != null && !songs.isEmpty()) {
		        for (Song song : songs) {
		        	if(count<6){
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
		             count++; 	
		        	}else{
		        		break;
		        	}
		        }
		    } 
		    %>

              
            </ul>
          </section>



          <!-- Your top mixes -->
          <section class="feedPlaylist">
            <h4 class="mb-3"><a href="#"><b>Album</b></a></h4>
          <a class="see-all" href="#">SEE-ALL</a>
            <br>
            <br>
            <ul class="playlists">
            
            <% AlbumDAO albumDAO = new AlbumDAO();
    	    List<Album> albums = albumDAO.getAllAlbums();
            int count2 = 0;
		    if (albums != null && !albums.isEmpty()) {
		        for (Album album : albums) {
		        	if(count2<6){
		        	/* System.out.println(song.getUrlimg());  */
		            %>
              <li>
              
                <img src="./img/R.png" >

                <button type="button" class="btn me-3"><svg role="img" height="24" width="24" viewBox="0 0 24 24">
                                 <a href="<%= request.getContextPath() %>/ShowSongsServlet?albumName=<%= album.getAlbumname() %>">
                    <path
                      d="M7.05 3.606l13.49 7.788a.7.7 0 010 1.212L7.05 20.394A.7.7 0 016 19.788V4.212a.7.7 0 011.05-.606z">
                    </path>
                  </svg></button>
                <span><%= album.getAlbumname() %></span>
                <p><br><%= album.getAlbumname() %></p>
              </li>
		             <%
		             count2++; 	
		        	}else{
		        		break;
		        	}
		        }
		    } 
		    %>
             
            </ul>
            
          </section>

          <!--recently played-->
          
        </main>
        </div>
        </div>
<script src="./js/script.js"></script>
<jsp:include page="/include/footer.jsp" />
<script src="js/audioPlayer.js"></script>



