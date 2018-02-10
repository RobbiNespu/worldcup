package com.ssn.worldcup.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Match {
	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private long id;

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
	@JoinColumn(name = "winningteam_id", nullable = false)
	private Team winningTeam;
}
