
package com.ssn.worldcup.model;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
@NamedQueries({ //
  @NamedQuery(name = Match.BY_TOURNAMENT_AND_NUMBER, query = "from Match where tournament = :tournament and number = :number") //
})
public class Match {
  private static final int MATCH_TIME_LIMIT = 15 * 60 * 1000;

  public static final String BY_TOURNAMENT_AND_NUMBER = "match.by.tour.and.number";

  @Id
  @GeneratedValue(generator = "increment")
  @GenericGenerator(name = "increment", strategy = "increment")
  private long id;

  @Column(name = "match_nr")
  private int number;

  @OneToOne()
  @JoinColumn(name = "team1_id", nullable = true)
  private Team team1;

  @OneToOne()
  @JoinColumn(name = "team2_id", nullable = true)
  private Team team2;

  private int score1;

  private int score2;

  @OneToOne()
  @JoinColumn(name = "winningteam_id", nullable = true)
  private Team winningTeam;

  @ManyToOne()
  @JoinColumn(name = "tournament_id", nullable = false)
  private Tournament tournament;

  @OneToMany(mappedBy = "match")
  private List<Forecast> forecasts;

  @Column(name = "match_date")
  private Date date;

  private int presenceValue;

  private int victoryValue;

  private String stage;

  private String team1PlaceHolder;

  private String team2PlaceHolder;

  private String liveScoreId;

  /**
   * 1 if team1 goes further, 2 if team2 goes further, any other value if the
   * value is not relevant
   */
  private int goesFurther;

  public Match(int number, Date date, String stage, Team team1, Team team2, Tournament tournament, int presenceValue, int victoryValue, String liveScoreId) {
    super();
    this.number = number;
    this.date = date;
    this.stage = stage;
    this.team1 = team1;
    this.team2 = team2;
    this.tournament = tournament;
    this.presenceValue = presenceValue;
    this.victoryValue = victoryValue;
    this.liveScoreId = liveScoreId;
    this.score1 = -1;
    this.score2 = -1;
  }

  public Match(int number, Date date, String stage, String team1PlaceHolder, String team2PlaceHolder, Tournament tournament, int presenceValue, int victoryValue) {
    super();
    this.number = number;
    this.date = date;
    this.stage = stage;
    this.team1PlaceHolder = team1PlaceHolder;
    this.team2PlaceHolder = team2PlaceHolder;
    this.tournament = tournament;
    this.presenceValue = presenceValue;
    this.victoryValue = victoryValue;
    this.score1 = -1;
    this.score2 = -1;
  }

  public Match() {
    super();
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public Team getTeam1() {
    return team1;
  }

  public void setTeam1(Team team1) {
    this.team1 = team1;
  }

  public Team getTeam2() {
    return team2;
  }

  public void setTeam2(Team team2) {
    this.team2 = team2;
  }

  public int getScore1() {
    return score1;
  }

  public void setScore1(int score1) {
    this.score1 = score1;
  }

  public int getScore2() {
    return score2;
  }

  public void setScore2(int score2) {
    this.score2 = score2;
  }

  public Team getWinningTeam() {
    return winningTeam;
  }

  public void setWinningTeam(Team winningTeam) {
    this.winningTeam = winningTeam;
  }

  public Tournament getTournament() {
    return tournament;
  }

  public void setTournament(Tournament tournament) {
    this.tournament = tournament;
  }

  public List<Forecast> getForecasts() {
    return forecasts;
  }

  public void setForecasts(List<Forecast> forecasts) {
    this.forecasts = forecasts;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public boolean isPlayed() {
    return score1 > -1;
  }

  public boolean isWonByTeam1() {
    return isPlayed() && score1 > score2;
  }

  public boolean isWonByTeam2() {
    return isPlayed() && score1 < score2;
  }

  public boolean isDraw() {
    return isPlayed() && score1 == score2;
  }

  public Forecast getForecastByUser(User user) {
    for (Forecast f : forecasts) {
      if (f.getUser().equals(user)) {
        return f;
      }
    }
    return null;
  }

  public int getPresenceValue() {
    return presenceValue;
  }

  public void setPresenceValue(int presenceValue) {
    this.presenceValue = presenceValue;
  }

  public int getVictoryValue() {
    return victoryValue;
  }

  public void setVictoryValue(int victoryValue) {
    this.victoryValue = victoryValue;
  }

  public int getGoesFurther() {
    return goesFurther;
  }

  public void setGoesFurther(int goesFurther) {
    this.goesFurther = goesFurther;
  }

  public String getStage() {
    return stage;
  }

  public void setStage(String stage) {
    this.stage = stage;
  }

  public String getTeam1PlaceHolder() {
    return team1PlaceHolder;
  }

  public void setTeam1PlaceHolder(String team1PlaceHolder) {
    this.team1PlaceHolder = team1PlaceHolder;
  }

  public String getTeam2PlaceHolder() {
    return team2PlaceHolder;
  }

  public void setTeam2PlaceHolder(String team2PlaceHolder) {
    this.team2PlaceHolder = team2PlaceHolder;
  }

  public Map<String, Integer> getScoresMap() {
    Map<String, Integer> map = new TreeMap<String, Integer>();

    for (Forecast f : forecasts) {
      String key = "" + f.getScore1() + " - " + f.getScore2();
      Integer value = map.get(key);
      if (value == null) {
        value = 0;
        map.put(key, value);
      }
      value = value + 1;
      map.put(key, value);
    }

    return map;
  }

  public String getScoresAsTable() {
    Map<String, Integer> scores = getScoresMap();
    String result = "";
    if (scores.size() == 0) {
      return null;
    }
    result += "<TABLE id='detail' border='1' class='table table-bordered table-striped table-hover table-condensed'>";
    result += "<THEAD>";
    result += "<tr style='background-color: white'>";
    result += "<th>Scor";
    result += "</th>";
    result += "<th>Aparitii";
    result += "</th>";
    result += "<th>Procent";
    result += "</th>";
    result += "</tr>";
    result += "</THEAD>";
    int counter = 0;
    for (Entry<String, Integer> score : scores.entrySet()) {
      counter++;
      result += "<TR>";
      result += "<TD>" + score.getKey() + "</TD>";
      result += "<TD>" + score.getValue() + "</TD>";
      result += "<TD>" + (int) (100.0 * score.getValue() / forecasts.size()) + "%</TD>";
      result += "</TR>";
    }
    result += "</TABLE>";
    return result;
  }

  public String getTeam1OrPlaceholder() {
    return getTeam1() != null ? getTeam1().getName() : getTeam1PlaceHolder();
  }

  public String getTeam2OrPlaceholder() {
    return getTeam2() != null ? getTeam2().getName() : getTeam2PlaceHolder();
  }

  public String getScore() {
    return score1 + " - " + score2;
  }

  public boolean isStillOpenForBets() {
    long currentTime = System.currentTimeMillis();
    long matchTime = getDate().getTime();

    return currentTime < matchTime - MATCH_TIME_LIMIT;
  }

  /**
   * @return the liveScoreId
   */
  public String getLiveScoreId() {
    return liveScoreId;
  }

  /**
   * @param liveScoreId the liveScoreId to set
   */
  public void setLiveScoreId(String liveScoreId) {
    this.liveScoreId = liveScoreId;
  }
}
