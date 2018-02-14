package com.ssn.worldcup.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Team {
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

}
