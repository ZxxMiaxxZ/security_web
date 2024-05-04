<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="app" class="d-flex flex-column">

	<div id="principal" class="d-flex">


		<nav id="latNav" class="w-100 pt-4 d-flex flex-column">

			<!-- Start of logo -->

			<a  href="${pageContext.request.contextPath}/HomeServlet" class="d-flex px-4"> 
            <path
						d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.669 11.538a.498.498 0 0 1-.686.165c-1.879-1.147-4.243-1.407-7.028-.77a.499.499 0 0 1-.222-.973c3.048-.696 5.662-.397 7.77.892a.5.5 0 0 1 .166.686zm.979-2.178a.624.624 0 0 1-.858.205c-2.15-1.321-5.428-1.704-7.972-.932a.625.625 0 0 1-.362-1.194c2.905-.881 6.517-.454 8.986 1.063a.624.624 0 0 1 .206.858zm.084-2.268C10.154 5.56 5.9 5.419 3.438 6.166a.748.748 0 1 1-.434-1.432c2.825-.857 7.523-.692 10.492 1.07a.747.747 0 1 1-.764 1.288z" />
          </svg> <span class="fw-semibold ms-2" style="font-size: 3.5em;">3TL</span>
			</a>

			<!-- End of logo -->



			<!-- Start of side bar-->

			<ul class="nav flex-column px-2 my-4">
				<li class="nav-item"><a href="${pageContext.request.contextPath}/HomeServlet" class="nav-link ativo"><svg
							role="img" height="24" width="24" viewBox="0 0 24 24">
                <path
								d="M13.5 1.515a3 3 0 00-3 0L3 5.845a2 2 0 00-1 1.732V21a1 1 0 001 1h6a1 1 0 001-1v-6h4v6a1 1 0 001 1h6a1 1 0 001-1V7.577a2 2 0 00-1-1.732l-7.5-4.33z">
                </path>
              </svg> Home</a></li>
				<li class="nav-item"><a href="${pageContext.request.contextPath}/SearchServlet" class="nav-link"><svg
							role="img" height="24" width="24" viewBox="0 0 24 24">
                <path
								d="M10.533 1.279c-5.18 0-9.407 4.14-9.407 9.279s4.226 9.279 9.407 9.279c2.234 0 4.29-.77 5.907-2.058l4.353 4.353a1 1 0 101.414-1.414l-4.344-4.344a9.157 9.157 0 002.077-5.816c0-5.14-4.226-9.28-9.407-9.28zm-7.407 9.279c0-4.006 3.302-7.28 7.407-7.28s7.407 3.274 7.407 7.28-3.302 7.279-7.407 7.279-7.407-3.273-7.407-7.28z">
                </path>
              </svg> Search</a></li>
				<li class="nav-item"><a href="${pageContext.request.contextPath}/showFavouriteList" class="nav-link"><svg
							role="img" height="24" width="24" viewBox="0 0 24 24">
                <path
								d="M14.5 2.134a1 1 0 011 0l6 3.464a1 1 0 01.5.866V21a1 1 0 01-1 1h-6a1 1 0 01-1-1V3a1 1 0 01.5-.866zM16 4.732V20h4V7.041l-4-2.309zM3 22a1 1 0 01-1-1V3a1 1 0 012 0v18a1 1 0 01-1 1zm6 0a1 1 0 01-1-1V3a1 1 0 012 0v18a1 1 0 01-1 1z">
                </path>
              </svg> Your FavoriteList</a></li>
			</ul>

			<div id="underList">
				<button>
				
					<div class="plus_bttn">
					<a href="${pageContext.request.contextPath}/AlbumServlet" class="nav-link">
						<svg role="img" height="12" width="12" aria-hidden="true"
							viewBox="0 0 16 16">
                <path
								d="M15.25 8a.75.75 0 01-.75.75H8.75v5.75a.75.75 0 01-1.5 0V8.75H1.5a.75.75 0 010-1.5h5.75V1.5a.75.75 0 011.5 0v5.75h5.75a.75.75 0 01.75.75z">
                </path>
              </svg>
					</div>
					Create Album
				</button>

				<button>
					<div class="heart_bttn">
					<a href="${pageContext.request.contextPath}/UploadFolderServlet" class="nav-link">
						<svg role="img" height="12" width="12" aria-hidden="true"
							viewBox="0 0 16 16">
                <path
								d="M15.724 4.22A4.313 4.313 0 0012.192.814a4.269 4.269 0 00-3.622 1.13.837.837 0 01-1.14 0 4.272 4.272 0 00-6.21 5.855l5.916 7.05a1.128 1.128 0 001.727 0l5.916-7.05a4.228 4.228 0 00.945-3.577z">
                </path>
              </svg>
					</div>
					Music UpLoad
				</button>
			</div>

			<!-- End of side bar-->



			<hr class="mx-4 mb-0 mt-2">

			<!-- Start of playlists in sidebar-->

			<ul id="playlistSidebar" class="nav px-2">
				<li class="nav-item"><a
					href="https://mrtoinh2003.github.io/Personal-Website/"
					class="nav-link">Thanh Tinh</a></li>
				<li class="nav-item"><a
					href="https://webpersonal-93hw.onrender.com/Webpersonal/?fbclid=IwAR1Rd92vJnTD0Nu4C13ODs1v4HB_mK5ARIL0M_T-EO7ap0CNi8CZSoJqxOg"
					class="nav-link">Ngoc Manh</a></li>
				<li class="nav-item"><a
					href="https://blakedrake37.github.io/PersonalWeb/?fbclid=IwAR2OuFzZBpTB1NtPnzl5v5uCwuuFyg0GjfGDcG29_5T1m9r7BX0PE1tMtV8"
					class="nav-link">Huu Tai</a></li>
			</ul>

			<!-- End of playlists in sidebar-->


			<!-- Start of Install App Button-->
			<a href="${pageContext.request.contextPath}/LoginServlet" id="installApp" class="d-block px-4 py-2">
				Log Out </a>

		</nav>