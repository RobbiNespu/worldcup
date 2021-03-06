
package com.ssn.core.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Utils {
	public static final String LOST_ENCRYPTED = "4907be270063f355ec08ccd7414f3bb8";

	public static String getParentsFromServletPath(String path) {
		{
			int count = 0;
			for (int i = 0; i < path.length(); i++) {
				if (path.charAt(i) == '/') {
					count++;
				}
			}

			String result = "";
			for (int i = 1; i < count; i++) {
				result += "../";
			}
			return result;
		}
	}

	private static final String STRING_ENCODING = "UTF-8";
	private static final String KEY = "LOGIMAT_PASSWORD";
	private static final String ALGORITHM = "AES";
	private static final Key AES_KEY = new SecretKeySpec(KEY.getBytes(), ALGORITHM);

	private static Cipher getCipher(int mode) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		cipher.init(mode, AES_KEY);
		return cipher;
	}

	private static String toHexString(byte b[]) {
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			String plainText = Integer.toHexString(0xff & b[i]);
			if (plainText.length() < 2) {
				plainText = "0" + plainText;
			}
			hexString.append(plainText);
		}
		return hexString.toString();
	}

	public static String encrypt(String input) {
		try {
			Cipher c = getCipher(Cipher.ENCRYPT_MODE);
			return toHexString(c.doFinal(input.getBytes(STRING_ENCODING)));
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	public static String bold(String s) {
		return "<B>" + s + "</B>";
	}

	public static String getServerHostName() {
		try {
			InetAddress inetAddress;
			inetAddress = InetAddress.getLocalHost();
			return inetAddress.getHostName();
		} catch (UnknownHostException e) {
			throw new RuntimeException(e);
		}
	}

	public static String escapeHTML(String s) {
		StringBuilder out = new StringBuilder(Math.max(16, s.length()));
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c > 127 || c == '"' || c == '<' || c == '>' || c == '&') {
				out.append("&#");
				out.append((int) c);
				out.append(';');
			} else {
				out.append(c);
			}
		}
		return out.toString();
	}
}
