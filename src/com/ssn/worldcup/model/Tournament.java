package com.ssn.worldcup.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

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
	@OrderBy(value = "name")
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

	public List<Match> getMatches() {
		return matches;
	}

	public void setMatches(List<Match> matches) {
		this.matches = matches;
	}

	public List<WinningTeamForecast> getWinnersForecasts() {
		return winnersForecasts;
	}

	public void setWinnersForecasts(List<WinningTeamForecast> winnersForecasts) {
		this.winnersForecasts = winnersForecasts;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + year;
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
		Tournament other = (Tournament) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (year != other.year)
			return false;
		return true;
	}

}
