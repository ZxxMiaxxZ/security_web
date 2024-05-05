package musics.business;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;

import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * The persistent class for the song database table.
 *
 */
@Entity
@NamedQuery(name = "Song.findAll", query = "SELECT s FROM Song s")
public class Song implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String songname;

	private String author;

	private String releaseday;
	private String albumname;
	private String type;
	private String urlimg;
	private String urlsong;
	@ManyToOne
	@JoinColumn(name = "albumname", insertable = false, updatable = false)
	private Album album;
	@OneToMany(mappedBy = "song", cascade = CascadeType.ALL)
	private List<Favouritelist> favouriteLists;

	public String getSongname() {
		return songname;
	}

	public void setSongname(String songname) {
		this.songname = songname;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public String getAlbumname() {
		return albumname;
	}

	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}

	public Song() {
	}

	public String getUrlimg() {
		return urlimg;
	}

	public void setUrlimg(String urlimg) {
		this.urlimg = urlimg;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getReleaseday() {
		return this.releaseday;
	}

	public void setReleaseday(String releaseday) {
		this.releaseday = releaseday;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrlsong() {
		return this.urlsong;
	}

	public void setUrlsong(String urlsong) {
		this.urlsong = urlsong;
	}

}