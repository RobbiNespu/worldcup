package com.ssn.worldcup.model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.hibernate.Session;

import com.ssn.core.persistence.WithSessionAndTransaction;
import com.ssn.core.utils.Utils;
import com.ssn.worldcup.manager.ModelManager;

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

					importTeamsAndMatches(session, tour);

					// Team eng = new Team("Rusia", tour);
					// session.save(eng);
					// Team rom = new Team("Arabia Saudita", tour);
					// session.save(rom);
					// Team ger = new Team("Egipt", tour);
					// session.save(ger);
					// Team fra = new Team("Uruguay", tour);
					// session.save(fra);

					// WinningTeamForecast wRaz = new WinningTeamForecast(raz,
					// tour, rom);
					// session.save(wRaz);
					// WinningTeamForecast wSor = new WinningTeamForecast(sorin,
					// tour, ger);
					// session.save(wSor);
					// WinningTeamForecast wDvr = new WinningTeamForecast(dvr,
					// tour, eng);
					// session.save(wDvr);

					// DateFormat format = new SimpleDateFormat("dd.MM.yyyy
					// hh:mm", Locale.ENGLISH);
					// Match m1;
					// Match m2;
					// try {
					// m1 = new Match(1, format.parse("14.06.2018 18:00"), eng,
					// rom, tour, 1, 1);
					// session.save(m1);
					// m2 = new Match(2, format.parse("15.06.2018 15:00"), ger,
					// fra, tour, 1, 1);
					// session.save(m2);
					// } catch (ParseException e) {
					// throw new RuntimeException(e);
					// }

					// session.save(new Forecast(raz, m1, 1, 1));
					// session.save(new Forecast(sorin, m1, 0, 1));
					// session.save(new Forecast(dvr, m1, 5, 0));
					// session.save(new Forecast(raz, m2, 2, 1));

				}
			}

		}.run();
	}

	protected void importTeamsAndMatches(Session session, Tournament tour) {
		ClassLoader classLoader = getClass().getClassLoader();
		File file = new File(classLoader.getResource("schedule.csv").getFile());

		try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)))) {
			while (true) {
				String s = br.readLine();
				if (s == null) {
					break;
				}
				importMatch(session, s, tour);
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	private void importMatch(Session session, String s, Tournament tour) {
		ModelManager mm = new ModelManager(session);
		try {
			DateFormat format = new SimpleDateFormat("dd.MM.yyyy hh:mm", Locale.ENGLISH);
			String[] splits = s.split(",");
			int number = Integer.parseInt(splits[0].trim());
			String stage = splits[1].trim();
			Date date = format.parse(splits[2].trim());
			String team1 = splits[3].trim();
			String team2 = splits[4].trim();
			int presenceValue = Integer.parseInt(splits[5].trim());
			int victoryValue = Integer.parseInt(splits[6].trim());

			if (team1.length() > 3) {
				Team team1db = mm.findTeamByName(team1);
				if (team1db == null) {
					team1db = new Team(team1, tour);
					session.save(team1db);
				}
				Team team2db = mm.findTeamByName(team2);
				if (team2db == null) {
					team2db = new Team(team2, tour);
					session.save(team2db);
				}
				Match m = new Match(number, date, team1db, team2db, tour, presenceValue, victoryValue);
				session.save(m);
			} else {
				Match m = new Match(number, date, team1, team2, tour, presenceValue, victoryValue);
				session.save(m);
			}
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
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

	@Override
	public Tournament getActiveTournament() {
		return new WithSessionAndTransaction<Tournament>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager mm = new ModelManager(session);
				setReturnValue(mm.findActiveTournament());
			}
		}.run();
	}

	@Override
	public List<User> getUsers() {
		return new WithSessionAndTransaction<List<User>>() {
			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager tm = new ModelManager(session);
				setReturnValue(tm.findAllUsers());
			}
		}.run();
	}

	@Override
	public boolean createUser(String name, String password, String email) {
		return new WithSessionAndTransaction<Boolean>() {

			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager mm = new ModelManager(session);
				User foundUser = mm.findUserByUserName(name);
				User foundEmail = mm.findUserByEmail(email);

				if (foundUser != null || foundEmail != null) {
					setReturnValue(false);
				}

				User user = new User(name, password, email, false, false);
				session.save(user);
				setReturnValue(true);
			}
		}.run();
	}

	@Override
	public List<Match> getMatchesForActiveTournament() {
		return new WithSessionAndTransaction<List<Match>>() {
			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager tm = new ModelManager(session);
				Tournament tour = tm.findActiveTournament();
				List<Match> matches = tour.getMatches();
				for (Match m : matches) {
					m.getForecasts().toString();
				}
				setReturnValue(matches);
			}
		}.run();
	}

	@Override
	public List<Classification> getClassification() {
		return new WithSessionAndTransaction<List<Classification>>() {
			@Override
			protected void executeBusinessLogic(Session session) {
				ModelManager tm = new ModelManager(session);
				setReturnValue(tm.getClassification());
			}
		}.run();
	}
}
