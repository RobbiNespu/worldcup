package com.ssn.worldcup.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Immutable;

@Entity
@Immutable
public class Classification {
	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private long id;

	private String name;

	private int winners;

	private int scores;

	private int scoreBonus;

	private String bonusTeam;

	private Integer teamBonus;

	public Classification() {
		//
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getWinners() {
		return winners;
	}

	public void setWinners(int winners) {
		this.winners = winners;
	}

	public int getScores() {
		return scores;
	}

	public void setScores(int scores) {
		this.scores = scores;
	}

	public int getScoreBonus() {
		return scoreBonus;
	}

	public void setScoreBonus(int bonus) {
		this.scoreBonus = bonus;
	}

	public String getBonusTeam() {
		return bonusTeam;
	}

	public void setBonusTeam(String bonusTeam) {
		this.bonusTeam = bonusTeam;
	}

	public Integer getTeamBonus() {
		return teamBonus == null ? 0 : teamBonus;
	}

	public void setTeamBonus(Integer teamBonus) {
		this.teamBonus = teamBonus;
	}

}
