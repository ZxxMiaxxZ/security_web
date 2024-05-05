package music.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import music.until.*;
import musics.business.User;

public class UserDAO {
	public boolean CheckLogin(String username, String password) {
	    EntityManager em = until.getEntityManager();
	    try {
	        String jpql = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
	        TypedQuery<User> query = em.createQuery(jpql, User.class);
	        query.setParameter("username", username);
	        query.setParameter("password", password);
	        List<User> users = query.getResultList();

	        return !users.isEmpty();
	    } catch (Exception e) {
	        return false;
	    } finally {
	        em.close();
	    }
	}
	public boolean registerUser(String username, String password, String fullname, String email) {
	    EntityManager em = until.getEntityManager();
	    try {
	        String jpql = "SELECT u FROM User u WHERE u.username = :username";
	        TypedQuery<User> query = em.createQuery(jpql, User.class);
	        query.setParameter("username", username);
	        List<User> existingUsers = query.getResultList();

	        if (!existingUsers.isEmpty()) {
	            // Người dùng đã tồn tại
	            return false;
	        }

	        User newUser = new User();
	        newUser.setUsername(username);
	        newUser.setPassword(password);
	        newUser.setFullname(fullname);
	        newUser.setEmail(email);

	        javax.persistence.EntityTransaction transaction = em.getTransaction();
	        try {
	            transaction.begin();

	            em.persist(newUser);

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
	
	public User getUserByUsername(String username) {
		EntityManager em = until.getEntityManager();
		try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class);
            query.setParameter("username", username);
            return query.getSingleResult();
        } catch (Exception e) {
            return null; // Handle the exception according to your needs
        } finally {
            em.close();
        }
    }
	public boolean updateUser(User userToUpdate) {
        EntityManager em = until.getEntityManager();
        javax.persistence.EntityTransaction transaction = em.getTransaction();

        try {
            // Start a transaction
            transaction.begin();

            // Find the existing user
            User existingUser = em.find(User.class, userToUpdate.getUsername());
            if (existingUser == null) {
                // User not found
                return false;
            }

            // Update the user's information
            existingUser.setFullname(userToUpdate.getFullname());
            existingUser.setEmail(userToUpdate.getEmail());
            // Only update the password if it's provided (not null or empty)
            if (userToUpdate.getPassword() != null && !userToUpdate.getPassword().isEmpty()) {
                existingUser.setPassword(userToUpdate.getPassword());
            }

            // Persist the changes
            em.merge(existingUser);

            // Commit the transaction
            transaction.commit();

            return true;
        } catch (Exception e) {
            // If any exception occurs, roll back the transaction
            if (transaction.isActive()) {
                transaction.rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }
}
