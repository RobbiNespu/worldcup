package com.ssn.worldcup.manager;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ssn.core.utils.Utils;
import com.ssn.worldcup.model.Tournament;
import com.ssn.worldcup.model.User;

public class ModelManager {

	private Session session;

	public ModelManager(Session session) {
		this.session = session;
	}

	@SuppressWarnings("rawtypes")
	public User findUserByUserNameAndPassword(String user, String pass) {
		Query query = session.getNamedQuery(User.USER_BY_NAME_AND_PASS);
		query.setParameter("user", user);
		query.setParameter("pass", Utils.encrypt(pass));
		List result = query.list();

		if (result.size() == 0) {
			return null;
		}

		User user2 = (User) result.get(0);
		return user2;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<User> findAllUsers() {
		Query query = session.getNamedQuery(User.USER_ALL);
		List result = query.list();
		return (List<User>) result;
	}

	public Tournament findActiveTournament() {
		Query query = session.getNamedQuery(Tournament.TOURNAMENT_ACTIVE);
		Tournament result = (Tournament) query.uniqueResult();
		return result;
	}

	@SuppressWarnings("rawtypes")
	public User findUserByUserName(String name) {
		Query query = session.getNamedQuery(User.USER_BY_NAME);
		query.setParameter("user", name);
		List result = query.list();

		if (result.size() == 0) {
			return null;
		}

		return (User) result.get(0);
	}

	public User findUserByEmail(String email) {
		Query query = session.getNamedQuery(User.USER_BY_EMAIL);
		query.setParameter("email", email);
		List result = query.list();

		if (result.size() == 0) {
			return null;
		}

		return (User) result.get(0);
	}

}
