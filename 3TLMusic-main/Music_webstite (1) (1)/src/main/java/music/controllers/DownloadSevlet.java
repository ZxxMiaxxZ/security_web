package music.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;

import music.data.SongDAO;
import musics.business.Song;

/**
 * Servlet implementation class DownloadSevlet
 */
@WebServlet("/DownloadSevlet")
public class DownloadSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownloadSevlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get the song URL from the request parameter
		String audioFilePath = request.getParameter("songUrlD");
		System.out.println("Requested URL: " + audioFilePath);

		// Assuming SongDAO.getSongNameByUrl(audioFilePath) correctly fetches the song
		// name
		SongDAO songDao = new SongDAO();
		String songname = songDao.getSongNameByUrl(audioFilePath);
		
		// This should just return the file name, not the
		// Get the requested MP3 file name from the query parameter
		String fileName = request.getParameter("songUrlD");

		// Validate the file name to prevent unauthorized access or invalid requests
		if (fileName == null || fileName.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request");
			return;
		}

		// Construct the file path to the MP3 file
		String filePath = fileName;
		// Get the input stream of the MP3 file
		InputStream inputStream = getServletContext().getResourceAsStream(filePath);

		// Check if the file exists
		if (inputStream == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
			return;
		}

		try {
			songname = songname.replaceAll(" ", "");
			// Set the content type and headers for the response
			response.setContentType("audio/mpeg3");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + songname + ".mp3\"");

			// Create an output stream to write the MP3 file to the response
			OutputStream outputStream = response.getOutputStream();

			// Create a buffer to read and write the MP3 file in chunks
			byte[] buffer = new byte[4096];
			int bytesRead;

			// Read the MP3 file from the input stream and write it to the output stream
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
// Close the streams
			inputStream.close();
			outputStream.close();
		} catch (IOException e) {
			// Handle any errors that occur during the file download
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error downloading file");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}