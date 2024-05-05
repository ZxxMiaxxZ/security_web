package musics.business;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the user database table.
 *
 */
@Entity
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	private String email;

	private String fullname;

	private String password;
	@Id
	private String username;

	@OneToMany
	@JoinColumn(name = "username",insertable = false, updatable = false)
	private List<Favouritelist> favouriteLists;
	@OneToMany
	@JoinColumn(name = "username",insertable = false, updatable = false)
	private List<Album> albums;

	public User() {
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public User(String name,String pass,String fullname,String email) {
		this.username=name;
		this.password=pass;
		this.fullname=fullname;
		this.email=email;
	}
}