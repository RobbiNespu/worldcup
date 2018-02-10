package com.ssn.worldcup.model;

import java.util.List;

import org.hibernate.Session;

import com.ssn.core.persistence.WithSessionAndTransaction;
import com.ssn.core.utils.Utils;

public class ModelImpl implements Model {

	public ModelImpl() {
		init();
	}

	@Override
	public User checkLogin(String user, String password) {
		return new WithSessionAndTransaction<User>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager tm = new ModelManager(session);
				setReturnValue(tm.findUserByUserNameAndPassword(user, password));
			}

		}.run();
	}

	@Override
	public void init() {
		new WithSessionAndTransaction<User>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager tm = new ModelManager(session);
				List<User> findAllUsers = tm.findAllUsers();
				if (findAllUsers.size() == 0) {
					User raz = new User("raz", "raz", "razvan.veina@ss-schaefer.com", true, true);
					session.save(raz);
					User sorin = new User("sorin", "sorin", "razvan.veina@ss-schaefer.com", false, true);
					session.save(sorin);
					User dvr = new User("dvr", "dvr", "razvan.veina@ss-schaefer.com", false, true);
					session.save(dvr);

					Tournament tour = new Tournament("World Cup", 2018);
					tour.setActive(true);
					session.save(tour);

					raz.getTournaments().add(tour);
					sorin.getTournaments().add(tour);
					dvr.getTournaments().add(tour);

					Team eng = new Team("England", tour);
					session.save(eng);
					Team rom = new Team("Romania", tour);
					session.save(rom);
					Team ger = new Team("Germany", tour);
					session.save(ger);
					Team fra = new Team("France", tour);
					session.save(fra);

					WinningTeamForecast wRaz = new WinningTeamForecast(raz, tour, rom);
					session.save(wRaz);
					WinningTeamForecast wSor = new WinningTeamForecast(raz, tour, rom);
					session.save(wSor);
					WinningTeamForecast wDvr = new WinningTeamForecast(raz, tour, rom);
					session.save(wDvr);

					Match m1 = new Match(1, eng, rom, tour);
					session.save(m1);
					Match m2 = new Match(2, ger, fra, tour);
					session.save(m2);

					session.save(new Forecast(raz, m1, 1, 1));
					session.save(new Forecast(sorin, m1, 0, 1));
					session.save(new Forecast(dvr, m1, 1, 0));
					session.save(new Forecast(raz, m2, 2, 1));

				}
			}

		}.run();
	}

	@Override
	public boolean changePassword(String oldUser, String oldPass, String newPass) {
		return new WithSessionAndTransaction<Boolean>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				User tempUser = checkLogin(oldUser, oldPass);
				if (tempUser != null) {
					tempUser.setPassword(Utils.encrypt(newPass));
					session.update(tempUser);
					setReturnValue(true);
				} else {
					setReturnValue(false);
				}
			}
		}.run();
	}
}
