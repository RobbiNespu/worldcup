package com.ssn.worldcup.model;

public interface Model {

	User checkLogin(String user, String password);

	void init();

	boolean changePassword(String oldUser, String oldPass, String newPass);

}
