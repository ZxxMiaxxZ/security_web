 <div id="feed" class="w-100">

        <!-- menu superior do conteudo -->
        <nav id="topNav" class="d-flex justify-content-between align-items-center px-4 py-2">

          <!-- Start of arrows -->

          <div id="arrowMenu">
            
          </div>

          <!-- End of arrows-->

          <div id="btnTopNav" class="d-flex">

            <!-- Start of user profile -->
            <div class="dropdown ms-3" id="user_bttn">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                data-bs-toggle="dropdown" aria-expanded="false">
                
                <div class="imgUsuario bg-secondary">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    viewBox="0 0 16 16">
                    <path
                      d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                  </svg>
                </div>
                 <% String username = (String) session.getAttribute("username"); %>
    <% if (username != null && !username.isEmpty()) { %>
        <p>Hello, <%= username %>!</p>
    <% } %>     
    <div id="editProfile" class="ms-3">
						<a href="UpdateuserServlet" class="btn btn-secondary">Edit
							Profile</a>
					</div>          
              </button>
              <div class="dropdownMenuButton1-dropContent">
                <a href="./login.html">Log Out</a>
              </div>
             
            </div>
          </div>
        </nav>