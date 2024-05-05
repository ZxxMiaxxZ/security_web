package music.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import music.until.until;
import musics.business.Favouritelist;
import musics.business.Song;
import musics.business.User;

public class FavouritelistDAO {
    private final EntityManagerFactory emf;

    public FavouritelistDAO() {
        emf = Persistence.createEntityManagerFactory("Music_webstite");
    }

    public void closeEntityManagerFactory() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    public boolean addFavouritelist(String username, String songname) {
        EntityManager em = until.getEntityManager();
        try {
            String userQuery = "SELECT u FROM User u WHERE u.username = :username";
            TypedQuery<User> userTypedQuery = em.createQuery(userQuery, User.class);
            userTypedQuery.setParameter("username", username);
            List<User> users = userTypedQuery.getResultList();

            String songQuery = "SELECT s FROM Song s WHERE s.songname = :songname";
            TypedQuery<Song> songTypedQuery = em.createQuery(songQuery, Song.class);
            songTypedQuery.setParameter("songname", songname);
            List<Song> songs = songTypedQuery.getResultList();

            if (users.isEmpty() || songs.isEmpty()) {
                // User or song not found
                return false;
            }
            

            Favouritelist favouritelist = new Favouritelist();
            favouritelist.setUsername(username);
            favouritelist.setSongname(songname);

            javax.persistence.EntityTransaction transaction = em.getTransaction();
            try {
                transaction.begin();

                em.persist(favouritelist);

                transaction.commit();

                return true;
            } catch (Exception e) {
                transaction.rollback();
                return false;
            }
        } catch (Exception e) {
            return false;
        } finally {
            em.close();
        }
    }


    public List<Song> getFavouriteList(String username) {
        EntityManager em = emf.createEntityManager();

        try {
            TypedQuery<Song> query = em.createQuery(
                    "SELECT f.song FROM Favouritelist f WHERE f.user.username = :username",
                    Song.class);
            query.setParameter("username", username);

            return query.getResultList();
        } finally {
            em.close();
        }
    }
    public boolean removeFromFavouriteList(String username, String songname) {
        EntityManager em = until.getEntityManager();

        try {
            String query = "SELECT f FROM Favouritelist f WHERE f.username = :username AND f.songname = :songname";
            TypedQuery<Favouritelist> typedQuery = em.createQuery(query, Favouritelist.class);
            typedQuery.setParameter("username", username);
            typedQuery.setParameter("songname", songname);
            List<Favouritelist> favourites = typedQuery.getResultList();

            if (favourites.isEmpty()) {
            	 System.out.println("Danh sách favo là null");
                return false;
            }
            Favouritelist favourite = favourites.get(0);
            EntityTransaction transaction = em.getTransaction();
            try {
                transaction.begin();

                em.remove(favourite);

                transaction.commit();

                return true;
            } catch (Exception e) {
                transaction.rollback();
                return false;
            }
        } catch (Exception e) {
            return false;
        } finally {
            em.close();
        }
    }
}
