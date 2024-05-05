package music.controllers;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import music.data.SongDAO;
import musics.business.Song;

@WebServlet("/UploadFolderServlet")
@MultipartConfig
public class SongServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SongDAO songDAO;
    @Override
    public void init() throws ServletException {
        super.init();
        songDAO = new SongDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy đối tượng Part của file từ yêu cầu
        Part audioFilePart = request.getPart("audioFile");
        Part imageFilePart = request.getPart("imageFile");

        // Lấy thông tin về file
        String audioFileName = getSubmittedFileName(audioFilePart);
        String imageFileName = getSubmittedFileName(imageFilePart);

        // Lấy thông tin khác từ request
        String songName = request.getParameter("name");
        String author = request.getParameter("author");
        String releaseDay = request.getParameter("releaseDay");
        String type = request.getParameter("type");
        String audioFileURL = "/music/" + audioFileName;  // Assuming "/music/" is the relative path where audio files are stored
        String imageFileURL = "/img/" + imageFileName; // Assuming "/img/" is the relative path where image files are stored
        String albumname = request.getParameter("albumname");
        // Đặt đường dẫn để lưu trữ file vào thư mục mong muốn
        String uploadPathAudio = getServletContext().getRealPath("/music"); // Đường dẫn thư mục audio uploads
        String audioFilePath = uploadPathAudio + File.separator + audioFileName;

        // Ghi file audio vào thư mục
        try (InputStream audioInput = audioFilePart.getInputStream()) {
            Files.copy(audioInput, Path.of(audioFilePath), StandardCopyOption.REPLACE_EXISTING);
        }

        // Đặt đường dẫn cho ảnh
        String uploadPathImage = getServletContext().getRealPath("/img"); // Đường dẫn thư mục image uploads
        String imageFilePath = uploadPathImage + File.separator + imageFileName;

        // Ghi file ảnh vào thư mục
        try (InputStream imageInput = imageFilePart.getInputStream()) {
            Files.copy(imageInput, Path.of(imageFilePath), StandardCopyOption.REPLACE_EXISTING);
        }

        // Lưu thông tin vào database bằng JPA
        Song song = new Song();
        song.setSongname(songName);
        song.setAuthor(author);
        song.setReleaseday(releaseDay);
        song.setType(type);
        song.setUrlsong(audioFileURL);
        song.setUrlimg(imageFileURL);
        song.setAlbumname(albumname);
        // Thêm bài hát vào database
        songDAO.addSong(song);

        // In ra console để kiểm tra
        System.out.println("Audio File uploaded to: " + audioFilePath);
        System.out.println("Image File uploaded to: " + imageFilePath);
        System.out.println("Song Information: Name=" + songName + ", Author=" + author +
                           ", Release Day=" + releaseDay + ", Type=" + type +
                           ", URL Audio=" + audioFileURL + ", URL Image=" + imageFileURL);

        // Chuyển hướng hoặc trả về phản hồi tùy thuộc vào yêu cầu của bạn
        response.sendRedirect(request.getContextPath() + "/HomeServlet");

    }
    @Override
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		// TODO Auto-generated method stub
  		RequestDispatcher rd = request.getRequestDispatcher("/views/music.jsp");
  		rd.forward(	request , response);
  	}
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }
}
