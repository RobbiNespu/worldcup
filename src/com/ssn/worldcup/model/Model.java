
package com.ssn.worldcup.model;

import java.util.List;

import com.ssn.worldcup.mail.Mail;

public interface Model {

  public User checkLogin(String user, String password);

  public void init();

  public boolean changePassword(String oldUser, String oldPass, String newPass);

  public Tournament getActiveTournament();

  public List<User> getUsers();

  public User createUser(String name, String password, String email);

  public List<Match> getMatchesForActiveTournament();

  public List<Classification> getClassification();

  public boolean setForecast(User user, int number, int score1, int score2);

  public User getUserByName(String name);

  public User getUserByNameOrEmail(String name, String email);

  public void setUserActivated(User user, boolean activated);

  public List<Team> getTeamsForActiveTournament();

  boolean setBonusTeam(String username, String name);

  void setSender(String s1, String s2);

  Mail getMail();

  public void setUserComment(User user, String comment);

  public void setResult(int id, int g1, int g2);

}
