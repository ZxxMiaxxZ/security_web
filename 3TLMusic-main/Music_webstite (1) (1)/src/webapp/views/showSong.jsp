<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="musics.business.Song" %>
<%@ page import="musics.business.Album" %>
<%@ page import="music.data.AlbumDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin bài hát</title>
</head>
<body>

    <h2>Danh sách bài hát trong album <%= request.getParameter("DenVau") %></h2>

    <% List<Song> songs = (List<Song>) request.getAttribute("songs"); %>
    
    <% if (songs != null && !songs.isEmpty()) { %>
        <table border="1">
            <tr>
                <th>Bài hát</th>
                <th>Tác giả</th>
                <th>Ngày phát hành</th>
                <!-- Add other song attributes as needed -->
            </tr>
            <% for (Song song : songs) { %>
                <tr>
                    <td><strong><%= song.getSongname() %></strong></td>
                    <td><%= song.getAuthor() %></td>
                    <td><%= song.getReleaseday() %></td>
                    <!-- Add other song attributes as needed -->
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>Không có bài hát nào trong album.</p>
    <% } %>

</body>
</html>
