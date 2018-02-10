package com.ssn.worldcup.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Match {
	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private long id;

	@Column(name = "match_nr")
	private int number;

	@OneToOne()
	@JoinColumn(name = "team1_id", nullable = false)
	private Team team1;

	@OneToOne()
	@JoinColumn(name = "team2_id", nullable = false)
	private Team team2;

	private int score1;

	private int score2;

	@OneToOne()
	@JoinColumn(name = "winningteam_id", nullable = true)
	private Team winningTeam;

	@ManyToOne()
	@JoinColumn(name = "tournament_id", nullable = false)
	private Tournament tournament;

	public Match(int number, Team team1, Team team2, Tournament tournament) {
		super();
		this.number = number;
		this.team1 = team1;
		this.team2 = team2;
		this.tournament = tournament;
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

}
