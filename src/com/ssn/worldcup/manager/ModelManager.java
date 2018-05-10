
package com.ssn.worldcup.manager;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.ssn.core.utils.Utils;
import com.ssn.worldcup.model.Classification;
import com.ssn.worldcup.model.Forecast;
import com.ssn.worldcup.model.Match;
import com.ssn.worldcup.model.Team;
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
    user2.getWinningTeamForecasts().toString();
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

  public List<Classification> getClassification() {
    SQLQuery query = session.createSQLQuery("select * from vw_classification").addEntity(Classification.class);
    List list = query.list();
    return list;
  }

  public Team findTeamByName(String name) {
    Query query = session.getNamedQuery(Team.TEAM_BY_NAME);
    query.setParameter("name", name);
    List result = query.list();

    if (result.size() == 0) {
      return null;
    }

    return (Team) result.get(0);
  }

  public Match findMatchByTournamentAndNumber(Tournament tour, int number) {
    Query query = session.getNamedQuery(Match.BY_TOURNAMENT_AND_NUMBER);
    query.setParameter("tournament", tour);
    query.setParameter("number", number);
    List result = query.list();

    if (result.size() == 0) {
      return null;
    }

    return (Match) result.get(0);
  }

  public Forecast findForecastByMatchAndUser(Match match, User user) {
    Query query = session.getNamedQuery(Forecast.BY_MATCH_AND_USER);
    query.setParameter("match", match);
    query.setParameter("user", user);
    List result = query.list();

    if (result.size() == 0) {
      return null;
    }

    return (Forecast) result.get(0);
  }

  public User findUserByValidationCode(String code) {
    Query query = session.getNamedQuery(User.USER_BY_VALIDATION_CODE);
    query.setParameter("code", code);
    List result = query.list();

    if (result.size() == 0) {
      return null;
    }

    User user2 = (User) result.get(0);
    user2.getWinningTeamForecasts().toString();
    return user2;
  }

}
