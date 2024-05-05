<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="musics.business.Song"%>
<%@ page import="music.data.SongDAO"%>
<%@ page import="java.util.List"%>
<html>
<head>
<title>Song List</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<h1 class="text-center">Songs List</h1>

		<!-- Songs Table -->
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>Song Name</th>
					<th>Author</th>
					<th>Release Day</th>
					<th>Album</th>
					<th>Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				SongDAO songDAO = new SongDAO();
				List<Song> songList = songDAO.getsonginalbum("DenVau");
				for (Song song : songList) {
				%>
				<tr>
					<td><%=song.getSongname()%></td>
					<td><%=song.getAuthor()%></td>
					<td><%=song.getReleaseday()%></td>
					<td><%=song.getAlbumname()%></td>
					<td><%=song.getType()%></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>

	<!-- Optional: Include Bootstrap JavaScript and jQuery -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
