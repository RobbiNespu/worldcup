package com.ssn.worldcup.model;

import java.util.List;

public interface Model {

	public User checkLogin(String user, String password);

	public void init();

	public boolean changePassword(String oldUser, String oldPass, String newPass);

	public Tournament getActiveTournament();

	public List<User> getUsers();

	public boolean createUser(String name, String password, String email);

	public List<Match> getMatchesForActiveTournament();

	public List<Classification> getClassification();

}
