<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="musics.business.Song"%>
<%@ page import="music.data.SongDAO"%>
<%@ page import="java.util.List"%>
<div id="footer">

	<div id="audioBar" class="p-3 d-flex justify-content-between">

		<div id="musicaPlay"></div>

		<div id="botomIcon">
			<ul class="nav flex-row px-2 my-4">
				<li class="nav-item"><a href="#"
					class="nav-link ativo d-flex flex-column align-items-center"><svg
							role="img" height="20" width="20" fill="white"
							viewBox="0 0 24 24">
                  <path
								d="M13.5 1.515a3 3 0 00-3 0L3 5.845a2 2 0 00-1 1.732V21a1 1 0 001 1h6a1 1 0 001-1v-6h4v6a1 1 0 001 1h6a1 1 0 001-1V7.577a2 2 0 00-1-1.732l-7.5-4.33z">
                  </path>
                </svg>Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link d-flex flex-column align-items-center"><svg
							role="img" height="20" width="20" fill="white"
							viewBox="0 0 24 24">
                  <path
								d="M10.533 1.279c-5.18 0-9.407 4.14-9.407 9.279s4.226 9.279 9.407 9.279c2.234 0 4.29-.77 5.907-2.058l4.353 4.353a1 1 0 101.414-1.414l-4.344-4.344a9.157 9.157 0 002.077-5.816c0-5.14-4.226-9.28-9.407-9.28zm-7.407 9.279c0-4.006 3.302-7.28 7.407-7.28s7.407 3.274 7.407 7.28-3.302 7.279-7.407 7.279-7.407-3.273-7.407-7.28z">
                  </path>
                </svg>Search</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link d-flex flex-column align-items-center"><svg
							role="img" height="20" width="20" fill="white"
							viewBox="0 0 24 24">
                  <path
								d="M14.5 2.134a1 1 0 011 0l6 3.464a1 1 0 01.5.866V21a1 1 0 01-1 1h-6a1 1 0 01-1-1V3a1 1 0 01.5-.866zM16 4.732V20h4V7.041l-4-2.309zM3 22a1 1 0 01-1-1V3a1 1 0 012 0v18a1 1 0 01-1 1zm6 0a1 1 0 01-1-1V3a1 1 0 012 0v18a1 1 0 01-1 1z">
                  </path>
                </svg>Your Library</a></li>
				<li><a href="#"
					class="nav-link d-flex flex-column align-items-center"><svg
							role="img" width="20" height="20" fill="white"
							viewBox="0 3 16 10">
                  <path
								d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.669 11.538a.498.498 0 0 1-.686.165c-1.879-1.147-4.243-1.407-7.028-.77a.499.499 0 0 1-.222-.973c3.048-.696 5.662-.397 7.77.892a.5.5 0 0 1 .166.686zm.979-2.178a.624.624 0 0 1-.858.205c-2.15-1.321-5.428-1.704-7.972-.932a.625.625 0 0 1-.362-1.194c2.905-.881 6.517-.454 8.986 1.063a.624.624 0 0 1 .206.858zm.084-2.268C10.154 5.56 5.9 5.419 3.438 6.166a.748.748 0 1 1-.434-1.432c2.825-.857 7.523-.692 10.492 1.07a.747.747 0 1 1-.764 1.288z">
                  </path>
                </svg>Get App</a></li>
			</ul>
		</div>
		
		<audio id="myAudio" style="display: none;" controls>
			<source src="./music/DiDeTroVe.mp3" type="audio/mpeg">
		</audio>
		


		<div id="imgNameSong"
			style="display: none; position: absolute; left: 400px;">
			<img id="songImage" src="path_to_default_image.jpg" alt="Song Image"
				style="width: 50px; height: 50px;" /> <span id="songName"
				class="fw-semibold ms-3 me-auto" style="color: white;"></span>
		</div>
		<div id="caixaCentral" class="d-flex flex-column align-items-center">

			<div id="caixaSetas" class="d-flex align-items-center">
				<button type="button" class="icones aleatorio">
					<svg onClick="enabledisable(this)" role="img" height="16"
						width="16" viewBox="0 0 16 16">
                <path
							d="M13.151.922a.75.75 0 10-1.06 1.06L13.109 3H11.16a3.75 3.75 0 00-2.873 1.34l-6.173 7.356A2.25 2.25 0 01.39 12.5H0V14h.391a3.75 3.75 0 002.873-1.34l6.173-7.356a2.25 2.25 0 011.724-.804h1.947l-1.017 1.018a.75.75 0 001.06 1.06L15.98 3.75 13.15.922zM.391 3.5H0V2h.391c1.109 0 2.16.49 2.873 1.34L4.89 5.277l-.979 1.167-1.796-2.14A2.25 2.25 0 00.39 3.5z">
                </path>
                <path
							d="M7.5 10.723l.98-1.167.957 1.14a2.25 2.25 0 001.724.804h1.947l-1.017-1.018a.75.75 0 111.06-1.06l2.829 2.828-2.829 2.828a.75.75 0 11-1.06-1.06L13.109 13H11.16a3.75 3.75 0 01-2.873-1.34l-.787-.938z">
                </path>
              </svg>
				</button>

				<button type="button" class="icones anterior">
					<svg role="img" height="16" width="16" viewBox="0 0 16 16">
                <path
							d="M12.7 1a.7.7 0 00-.7.7v5.15L2.05 1.107A.7.7 0 001 1.712v12.575a.7.7 0 001.05.607L12 9.149V14.3a.7.7 0 00.7.7h1.6a.7.7 0 00.7-.7V1.7a.7.7 0 00-.7-.7h-1.6z">
                </path>
              </svg>
				</button>

				<button type="button" class="btn playPause"
					onclick="togglePlayPause()">
					<svg role="img" height="24" width="24" viewBox="0 0 24 24"
						id="playPauseBtn">
                <path
							d="M7.05 3.606l13.49 7.788a.7.7 0 010 1.212L7.05 20.394A.7.7 0 016 19.788V4.212a.7.7 0 011.05-.606z">
                </path>
              </svg>
				</button>

				<button type="button" class="icones proximo">
					<svg role="img" height="16" width="16" viewBox="0 0 16 16">
                <path
							d="M12.7 1a.7.7 0 00-.7.7v5.15L2.05 1.107A.7.7 0 001 1.712v12.575a.7.7 0 001.05.607L12 9.149V14.3a.7.7 0 00.7.7h1.6a.7.7 0 00.7-.7V1.7a.7.7 0 00-.7-.7h-1.6z">
                </path>
              </svg>
				</button>

				<button type="button" class="icones repetir" id="loopButton">
					<svg onClick="enabledisable(this)" role="img" height="16"
						width="16" viewBox="0 0 16 16">
                <path
							d="M0 4.75A3.75 3.75 0 013.75 1h8.5A3.75 3.75 0 0116 4.75v5a3.75 3.75 0 01-3.75 3.75H9.81l1.018 1.018a.75.75 0 11-1.06 1.06L6.939 12.75l2.829-2.828a.75.75 0 111.06 1.06L9.811 12h2.439a2.25 2.25 0 002.25-2.25v-5a2.25 2.25 0 00-2.25-2.25h-8.5A2.25 2.25 0 001.5 4.75v5A2.25 2.25 0 003.75 12H5v1.5H3.75A3.75 3.75 0 010 9.75v-5z">
                </path>
              </svg>
				</button>
			</div>

			<div id="barraDeProgresso">
				<small id="currentTime">00:00</small> <input type="range"
					id="progressBar" min="0" max="100" value="0"> <small
					id="totalTime">00:00</small>
			</div>
		</div>

		<div id="configAudio" class="d-flex align-items-center">
			<form action="${pageContext.request.contextPath}/addToFavourite"
				method="post" id="songUrlForm">
				<input type="hidden" name="songUrl" id="songUrlInput" value="">
				<button type="submit" class="icones legenda" id="">
					<svg onClick="enabledisable(this)" role="img" height="16"
						width="16" viewBox="0 0 16 16">
              <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
            </svg>
				</button>
			</form>
			<form action="${pageContext.request.contextPath}/DownloadSevlet"
				method="post" id="songUrlForm">
				<input type="hidden" name="songUrlD" id="songUrlInputD" value="">
				<button type="submit" class="icones legenda" id="">
					<svg onClick="enabledisable(this)" role="img" height="16"
						width="16" viewBox="0 0 16 16">
			      <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/> <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
			    </svg>
							</button>
						</form>
			

			<div id="volume">
				<button type="button" class="icones outrosDispositivos"
					id="volumeBtn">
					<svg role="presentation" height="16" width="16"
						aria-label="Volume mÃ©dio" id="volume-icon" viewBox="0 0 16 16">
                <path
							d="M9.741.85a.75.75 0 01.375.65v13a.75.75 0 01-1.125.65l-6.925-4a3.642 3.642 0 01-1.33-4.967 3.639 3.639 0 011.33-1.332l6.925-4a.75.75 0 01.75 0zm-6.924 5.3a2.139 2.139 0 000 3.7l5.8 3.35V2.8l-5.8 3.35zm8.683 6.087a4.502 4.502 0 000-8.474v1.65a2.999 2.999 0 010 5.175v1.649z">
                </path>
              </svg>
				</button>
				<input type="range" id="volumeControl" min="0" max="1" step="0.01"
					value="1">
			</div>

		</div>
	</div>
</div>
</div>
<script src="js/audioPlayer.js"></script>