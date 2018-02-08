package com.ssn.worldcup.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ssn.core.utils.Utils;

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

}
