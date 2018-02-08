
package com.ssn.worldcup.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.ssn.core.utils.Utils;

@Entity
@Table(name = "PLAYER")
@NamedQueries({ //
		@NamedQuery(name = User.USER_BY_NAME, query = "from User where user = :user"), //
		@NamedQuery(name = User.USER_ALL, query = "from User"), //
		@NamedQuery(name = User.USER_BY_NAME_AND_PASS, query = "from User where user = :user and password = :pass"), //
})
public class User implements Serializable, Comparable<User> {
	public static final String USER_BY_NAME = "User.by.name";
	public static final String USER_BY_NAME_AND_PASS = "User.by.name.and.pass";
	private static final long serialVersionUID = 1L;
	public static final String USER_ALL = "Users.all";

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gen")
	@SequenceGenerator(initialValue = 1, sequenceName = "seq_gen", name = "gen")
	private long id;

	@Column(name = "username")
	private String user;
	private String password;
	private String name;
	private String surname;
	private boolean admin;
	private int rating = -1;

	public User() {
		//
	}

	public User(String user, String password, String name, String surname, boolean admin) {
		this.user = user;
		this.password = Utils.encrypt(password);
		this.name = name;
		this.surname = surname;
		this.admin = admin;
	}

	public void setId(long id) {
		this.id = id;
	}

	public boolean hasName(String pname) {
		return user.equals(pname);
	}

	@Override
	public String toString() {
		return user + " (" + getRating() + ")";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		User other = (User) obj;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

	public boolean hasPassword(String pass) {
		return password.equals(Utils.encrypt(pass));
	}

	public String getName() {
		return name;
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

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public void setName(String name) {
		this.name = name;
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

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getRating() {
		return rating;
	}

	@Override
	public int compareTo(User o) {
		return o.getRating() - this.getRating();
	}

}