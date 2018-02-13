package com.ssn.worldcup.model;

import java.util.ArrayList;

public class PreviousWinner {
	String name;
	int edition;

	public PreviousWinner(String name, int edition) {
		super();
		this.name = name;
		this.edition = edition;
	}

	public static ArrayList<Integer> count(PreviousWinner[] data, String name) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		for (PreviousWinner pw : data) {
			if (pw.name.equals(name)) {
				result.add(pw.edition);
			}
		}
		return result;
	}
}
