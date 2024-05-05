package music.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import musics.business.Song;

public class SongDAO {
    private final EntityManagerFactory emf;

    public SongDAO() {
        emf = Persistence.createEntityManagerFactory("Music_webstite");
    }

    public void closeEntityManagerFactory() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
    public void addSong(Song song) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(song);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Song> searchSongs(String searchTerm) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Song> query = em.createQuery(
                    "SELECT s FROM Song s WHERE s.type like :searchTerm or s.songname like :searchTerm or s.author like :searchTerm", Song.class);
            query.setParameter("searchTerm", "%"+searchTerm+"%");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Song> getsonginalbum(String searchTerm) {
		EntityManager em = emf.createEntityManager();
		try {
			TypedQuery<Song> query = em.createQuery(
					"SELECT s FROM Song s JOIN s.album a WHERE a.albumname = :albumname",
					Song.class);
			query.setParameter("albumname", searchTerm);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

    public List<Song> getAllSongs() {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Song> query = em.createQuery("SELECT s FROM Song s", Song.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public String getSongNameByUrl(String url) {
    		EntityManager em = emf.createEntityManager();
    		if (url.startsWith(".")) {
    			url = url.substring(1);
    		}
    		try {
    			TypedQuery<String> query = em.createQuery("SELECT s.songname FROM Song s WHERE s.urlsong = :url",
    					String.class);
    			query.setParameter("url", url);
    			return query.getSingleResult();
    		} finally {
    			em.close();
    		}
    	}

    
}
