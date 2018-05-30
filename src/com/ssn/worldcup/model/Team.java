
package com.ssn.worldcup.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.hibernate.annotations.GenericGenerator;

@Entity
@NamedQueries({ //
  @NamedQuery(name = Team.TEAM_BY_NAME, query = "from Team where name = :name"), //
  @NamedQuery(name = Team.TEAM_ALL, query = "from Team") //
})
public class Team {
  public static final String TEAM_BY_NAME = "team.by.name";
  public static final String TEAM_ALL = "team.all";

  @Id
  @GeneratedValue(generator = "increment")
  @GenericGenerator(name = "increment", strategy = "increment")
  private long id;
  private String name;

  @ManyToOne()
  @JoinColumn(name = "tournament_id", nullable = false)
  private Tournament tournament;

  private boolean eliminated;

  public Team() {
    //
  }

  public Team(String name, Tournament tournament) {
    super();
    this.name = name;
    this.tournament = tournament;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Tournament getTournament() {
    return tournament;
  }

  public void setTournament(Tournament tournament) {
    this.tournament = tournament;
  }

  public boolean isEliminated() {
    return eliminated;
  }

  public void setEliminated(boolean eliminated) {
    this.eliminated = eliminated;
  }

  @Override
  public String toString() {
    return name;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((tournament == null) ? 0 : tournament.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Team other = (Team) obj;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (tournament == null) {
      if (other.tournament != null)
        return false;
    } else if (!tournament.equals(other.tournament))
      return false;
    return true;
  }

  public List<Match> getMatches() {
    List<Match> result = new ArrayList<Match>();
    List<Match> matches = tournament.getMatches();
    for (Match match : matches) {
      if (this.equals(match.getTeam1()) || this.equals(match.getTeam2())) {
        result.add(match);
      }
    }
    return result;
  }

  public String getMatchesAsTable() {
    List<Match> matches = getMatches();
    String result = "";
    DateFormat format = new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.ENGLISH);

    result += "<TABLE id=detail border='1' >";
    int counter = 0;
    for (Match m : matches) {
      if (m.isPlayed()) {
        counter++;
        result += "<TR>";
        result += "<TD>" + format.format(m.getDate()) + "</TD>";
        result += "<TD>" + m.getTeam1() + "</TD>";
        result += "<TD>" + m.getTeam2() + "</TD>";
        result += "<TD>" + m.getScore1() + " - " + m.getScore2() + "</TD>";
        result += "</TR>";
      }
    }
    result += "</TABLE>";

    return result;
  }

}
