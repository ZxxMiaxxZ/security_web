package musics.business;

import java.io.Serializable;
import java.util.List;
import javax.persistence.OneToMany;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;

/**
 * The persistent class for the album database table.
 *
 */
@Entity
@NamedQuery(name = "Album.findAll", query = "SELECT a FROM Album a")
public class Album implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String albumname;
	private String singername;
	
	public String getSingername() {
		return singername;
	}


	public void setSingername(String singername) {
		this.singername = singername;
	}


	@OneToMany
	@JoinColumn(name="albumname")
	private List<Song> song;

	public Album() {
	}


	public List<Song> getSong() {
		return song;
	}


	public void setSong(List<Song> song) {
		this.song = song;
	}


	public String getAlbumname() {
		return albumname;
	}

	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}

}