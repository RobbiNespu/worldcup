package com.ssn.worldcup.model;

import java.util.List;

import org.hibernate.Session;

import com.ssn.core.persistence.WithSessionAndTransaction;
import com.ssn.core.utils.Utils;

public class ModelImpl implements Model {

	public ModelImpl() {
		init();
	}

	@Override
	public User checkLogin(String user, String password) {
		return new WithSessionAndTransaction<User>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager tm = new ModelManager(session);
				setReturnValue(tm.findUserByUserNameAndPassword(user, password));
			}

		}.run();
	}

	@Override
	public void init() {
		new WithSessionAndTransaction<User>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager tm = new ModelManager(session);
				List<User> findAllUsers = tm.findAllUsers();
				if (findAllUsers.size() == 0) {
					session.save(new User("raz", "raz", "Razvan", "Veina", true));
				}
			}

		}.run();
	}

	@Override
	public boolean changePassword(String oldUser, String oldPass, String newPass) {
		return new WithSessionAndTransaction<Boolean>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				User tempUser = checkLogin(oldUser, oldPass);
				if (tempUser != null) {
					tempUser.setPassword(Utils.encrypt(newPass));
					session.update(tempUser);
					setReturnValue(true);
				} else {
					setReturnValue(false);
				}
			}
		}.run();
	}
}
