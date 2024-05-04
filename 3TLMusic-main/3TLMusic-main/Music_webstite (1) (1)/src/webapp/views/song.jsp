<%@ page import="musics.business.Album" %>
<%@ page import="musics.business.Song" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Album album = (Album) request.getAttribute("album");
    List<Song> songs = (List<Song>) request.getAttribute("song");
%>

<html>
<head>
    <title>Songs in Album</title>
</head>
<body>
    <h2>Songs in ${album.getName}</h2>
    <ul>
        <c:forEach var="song" items="${songs}">
            <li>${song.title} - ${song.author}</li>
        </c:forEach>
    </ul>
</body>
</html>
