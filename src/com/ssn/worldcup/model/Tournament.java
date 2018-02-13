package com.ssn.worldcup.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

@Entity
@NamedQueries({ //
		@NamedQuery(name = Tournament.TOURNAMENT_ACTIVE, query = "from Tournament where active = true"), //
})
public class Tournament {

	public static final String TOURNAMENT_ACTIVE = "Tournament.active";

	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private long id;

	private String name;

	private int year;

	@ManyToMany(mappedBy = "tournaments")
	private List<User> users;

	@OneToMany(mappedBy = "tournament")
	private List<Team> teams;

	@OneToMany(mappedBy = "tournament")
	private List<Match> matches;

	@OneToMany(mappedBy = "tournament")
	private List<WinningTeamForecast> winnersForecasts;

	private boolean active;

	public Tournament(String name, int year) {
		super();
		this.name = name;
		this.year = year;
	}

	public Tournament() {
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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return name + " " + year;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
