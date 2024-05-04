package music.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import musics.business.Album;
import musics.business.Song;

public class AlbumDAO {
    private final EntityManagerFactory emf;

    public AlbumDAO() {
        emf = Persistence.createEntityManagerFactory("Music_webstite"); // Thay thế bằng tên persistence unit của bạn
    }

    public void closeEntityManagerFactory() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    public void addAlbum(Album album) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = null;

        try {
            transaction = em.getTransaction();
            transaction.begin();

            em.persist(album);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
    public Album getAlbumByName(String albumName) {
        EntityManager em = emf.createEntityManager();

        try {
            return em.find(Album.class, albumName);
        } finally {
            em.close();
        }
    }

    public List<Album> getAllAlbums() {
        EntityManager em = emf.createEntityManager();

        try {	
            TypedQuery<Album> query = em.createQuery("SELECT a FROM Album a", Album.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
    public List<Song> getSongsByAlbumName(String albumName) {
        EntityManager em = emf.createEntityManager();
        try {
            // Using a fetch join to load songs along with the album
            TypedQuery<Album> query = em.createQuery("SELECT a FROM Album a LEFT JOIN FETCH a.songs WHERE a.albumname = :albumname", Album.class);
            query.setParameter("albumname", albumName);

            Album album = query.getSingleResult();
            return album.getSong();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
    }




}
