
package com.ssn.worldcup.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class WinningTeamForecast {
  @Id
  @GeneratedValue(generator = "increment")
  @GenericGenerator(name = "increment", strategy = "increment")
  private long id;

  @ManyToOne()
  @JoinColumn(name = "user_id", nullable = false)
  private User user;

  @ManyToOne()
  @JoinColumn(name = "tournament_id", nullable = false)
  private Tournament tournament;

  @OneToOne()
  @JoinColumn(name = "team_id", nullable = false)
  private Team team;

  public WinningTeamForecast() {
  }

  public WinningTeamForecast(User user, Tournament tournament, Team team) {
    super();
    this.user = user;
    this.tournament = tournament;
    this.team = team;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Tournament getTournament() {
    return tournament;
  }

  public void setTournament(Tournament tournament) {
    this.tournament = tournament;
  }

  public Team getTeam() {
    return team;
  }

  public void setTeam(Team team) {
    this.team = team;
  }

  @Override
  public String toString() {
    return this.team.getName();
  }
}
