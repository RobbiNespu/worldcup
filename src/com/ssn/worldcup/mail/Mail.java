package com.ssn.worldcup.mail;

import com.ssn.worldcup.model.User;

public class Mail {
	private String sender;
	private String pass;
	private SendMailSSL ssl;

	public Mail(String sender, String pass) {
		super();
		this.sender = sender;
		this.pass = pass;
		ssl = new SendMailSSL();
	}

	public void sendMessage(User user, String serverIP, int serverPort) {
		ssl.sendMail(sender, pass, user.getEmail(),
				getLinkFordata(user.getUser(), user.getValidationCode(), serverIP, "" + serverPort));
	}

	private String getLinkFordata(String user, String code, String serverIP, String serverPort) {
		return "Ceau, " + user + "! \n\nAcesta e linkul tau de validare: http://" + serverIP + ":" + serverPort
				+ "/worldcup/users/validateUser.jsp?user=" + user.trim() + "&vc=" + code.trim() + "\n\n Succes!";
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

}
