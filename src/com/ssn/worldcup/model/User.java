
package com.ssn.worldcup.model;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.ssn.core.utils.Utils;

@Entity
@Table(name = "PLAYER")
@NamedQueries({ //
		@NamedQuery(name = User.USER_BY_NAME, query = "from User where user = :user"), //
		@NamedQuery(name = User.USER_BY_EMAIL, query = "from User where email = :email"), //
		@NamedQuery(name = User.USER_ALL, query = "from User"), //
		@NamedQuery(name = User.USER_BY_NAME_AND_PASS, query = "from User where user = :user and password = :pass"), //
})
public class User {
	public static final String USER_BY_NAME = "User.by.name";
	public static final String USER_BY_NAME_AND_PASS = "User.by.name.and.pass";
	public static final String USER_ALL = "Users.all";
	public static final String USER_BY_EMAIL = "Users.by.email";

	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private long id;

	@Column(name = "username")
	private String user;
	private String password;
	private String email;
	private boolean validated;
	private boolean admin;
	private String validationCode;

	@ManyToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "user_tournament", //
	joinColumns = { @JoinColumn(name = "user_id") }, //
	inverseJoinColumns = { @JoinColumn(name = "tournament_id") })
	private List<Tournament> tournaments = new ArrayList<>();

	@OneToMany(mappedBy = "user")
	private List<WinningTeamForecast> winningTeamForecasts = new ArrayList<>();;

	@OneToMany(mappedBy = "user")
	private List<Forecast> forecasts = new ArrayList<>();;

	public User() {
		//
	}

	public User(String user, String password, String email, boolean admin, boolean validated) {
		this.user = user;
		this.password = Utils.encrypt(password);
		this.admin = admin;
		this.validated = validated;
		this.validationCode = UUID.randomUUID().toString();
	}

	public void setId(long id) {
		this.id = id;
	}

	public boolean hasName(String pname) {
		return user.equals(pname);
	}

	public boolean hasPassword(String pass) {
		return password.equals(Utils.encrypt(pass));
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isValidated() {
		return validated;
	}

	public void setValidated(boolean validated) {
		this.validated = validated;
	}

	public String getValidationCode() {
		return validationCode;
	}

	public void setValidationCode(String validationCode) {
		this.validationCode = validationCode;
	}

	public List<Tournament> getTournaments() {
		return tournaments;
	}

	public void setTournaments(List<Tournament> tournaments) {
		this.tournaments = tournaments;
	}

	public List<WinningTeamForecast> getWinningTeamForecasts() {
		return winningTeamForecasts;
	}

	public void setWinningTeamForecasts(List<WinningTeamForecast> winningTeamForecasts) {
		this.winningTeamForecasts = winningTeamForecasts;
	}

	public List<Forecast> getForecasts() {
		return forecasts;
	}

	public void setForecasts(List<Forecast> forecasts) {
		this.forecasts = forecasts;
	}

}