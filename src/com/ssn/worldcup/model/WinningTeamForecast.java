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

}
