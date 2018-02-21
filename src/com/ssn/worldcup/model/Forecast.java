package com.ssn.worldcup.model;

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
		@NamedQuery(name = Forecast.BY_MATCH_AND_USER, query = "from Forecast where match = :match and user = :user") //
})
public class Forecast {
	public static final String BY_MATCH_AND_USER = "Forecast.by.match.and.user";

	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private long id;

	@ManyToOne()
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	@ManyToOne()
	@JoinColumn(name = "match_id", nullable = false)
	private Match match;

	private int score1;

	private int score2;

	public Forecast(User user, Match match, int score1, int score2) {
		super();
		this.user = user;
		this.match = match;
		this.score1 = score1;
		this.score2 = score2;
	}

	public Forecast() {
		super();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Match getMatch() {
		return match;
	}

	public void setMatch(Match match) {
		this.match = match;
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

	public int getBalls() {
		int result = 0;

		if (match.isPlayed()) {
			if (match.getScore1() == score1 && match.getScore2() == score2) {
				result = 3;
				if (score1 + score2 > 3) {
					result = score1 + score2;
				}
			} else if ((match.isWonByTeam1() && score1 > score2) //
					|| (match.isWonByTeam2() && score1 < score2) //
					|| (match.isDraw() && score1 == score2)) {
				result = 1;
			}
		}

		return result;
	}

	@Override
	public String toString() {
		return user + " " + match;
	}

	public String getScore() {
		return score1 + " - " + score2;
	}

}
