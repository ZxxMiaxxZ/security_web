<%@ page import="java.util.List"%>
<%@ page import="musics.business.Song"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<div id="feed" class="w-100">

	<nav id="topNav" class="d-flex justify-content-between  px-4 py-2">

		<!-- Start of arrows -->

		<div id="arrowMenu">
			
			<div class="div--hun">
				<form class="form--hun" action="SearchServlet" method="get">
					<input
						class="Type__TypeElement-goli3j-0 cPwEdQ QO9loc33XC50mMRUCIvf"
						maxlength="800" autocorrect="off" autocapitalize="off"
						spellcheck="false" placeholder="What do you want to listen to?"
						data-testid="search-input" value="" style="color: rgb(0, 0, 0);"
						name="searchTerm">
					<button type="submit"
						style="background-color: #042058; color: #f17822; padding: 8px 90px; border: none; border-radius: 29px; cursor: pointer; text-align: center;">Search</button>

				</form>
				<!-- Display search results -->
				<div id="searchResults" class="text-center mt-4">
					<%
					List<Song> songs = (List<Song>) request.getAttribute("songs");
					if (songs != null && !songs.isEmpty()) {
						for (Song song : songs) {
							/* System.out.println(song.getUrlsong()); */
					%>
					<div class="song-card">
						<div class="song-details">
							<div class="song-card" data-song-url=".<%=song.getUrlsong()%>"
								data-song-name="<%=song.getSongname()%>"
								data-song-img=".<%=song.getUrlimg()%>">
								<img src=".<%=song.getUrlimg()%>" :alt="playlist.nome" style="width: 100px; height: 100px;">
									<h3><%=song.getSongname()%></h3>
									<p>Artist: <%= song.getAuthor() %></p>
									<p>Release Day:  <%= song.getReleaseday() %></p>
					            	<p>
									Type:
									<%=song.getType()%></p>
							</div>
						</div>
					</div>
					<%
					}
					} else {
					// Handle no results case if needed
					}
					%>
				</div>

			</div>
		</div>

		<!-- End of arrows-->

		<div id="btnTopNav" class="d-flex">

			<!-- Start of user profile -->
			<div class="dropdown ms-3" id="user_bttn">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">
					<div class="imgUsuario bg-secondary">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" viewBox="0 0 16 16">
                    <path
								d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                  </svg>
					</div>
					<%
					String username = (String) session.getAttribute("username");
					%>
					<%
					if (username != null && !username.isEmpty()) {
					%>
					<p>
						Hello,
						<%=username%>!
					</p>
					<%
					}
					%>
					<div id="editProfile" class="ms-3">
						<a href="UpdateuserServlet" class="btn btn-secondary">Edit Profile</a>
					</div>
				</button>
				<div class="dropdownMenuButton1-dropContent">
					<a href="./login.html">Log Out</a>
				</div>
			</div>
		</div>
	</nav>
	<script src="js/audioPlayer.js"></script>