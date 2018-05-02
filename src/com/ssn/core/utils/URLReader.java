
package com.ssn.core.utils;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.URL;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class URLReader {
  public static String readURL(String url) {
    if (!url.startsWith("https://") && !url.startsWith("http://")) {
      return null;
    }
    try {
      Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("172.28.150.130", 8080));
      final String authUser = "RVOICU";
      final String authPassword = "ssi!@#45";
      Authenticator.setDefault(new Authenticator() {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
          return new PasswordAuthentication(authUser, authPassword.toCharArray());
        }
      });

      System.setProperty("http.proxyUser", authUser);
      System.setProperty("http.proxyPassword", authPassword);

      URL yahoo = new URL(url);
      BufferedReader in = new BufferedReader(new InputStreamReader(yahoo.openConnection(proxy).getInputStream()));
      // InputStreamReader inputStream = ((HttpURLConnection)
      // yahoo.openConnection(proxy)).getInputStream();
      String inputLine;
      StringBuffer result = new StringBuffer();
      while ((inputLine = in.readLine()) != null) {
        result.append(inputLine);
      }
      in.close();

      String s = result.toString();
      return s;
    } catch (MalformedURLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return null;
  }

  public static String readURLNoProxy(String url) {
    if (!url.startsWith("https://") && !url.startsWith("http://")) {
      return null;
    }
    try {

      URL yahoo = new URL(url);
      BufferedReader in = new BufferedReader(new InputStreamReader(yahoo.openStream()));
      String inputLine;
      StringBuffer result = new StringBuffer();
      while ((inputLine = in.readLine()) != null) {
        result.append(inputLine);
      }
      in.close();

      String s = result.toString();
      return s;
    } catch (MalformedURLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return null;
  }

  public static String readURLCached(String url, int sleep) throws IOException {
    if (!url.startsWith("https://"))
      return null;

    String simpleURL = getSimpleURL(url);
    File f = new File("cache/" + simpleURL);
    if (f.exists()) {
      System.out.println("Returning cached version of " + url);
      return readDataFromFile("cache/" + simpleURL);
    }

    try {
      try {
        Thread.sleep(sleep);
      } catch (InterruptedException e) {
        //
      }
      URL yahoo = new URL(url);
      BufferedReader in = new BufferedReader(new InputStreamReader(yahoo.openStream()));

      String inputLine;
      StringBuffer result = new StringBuffer();

      while ((inputLine = in.readLine()) != null) {
        result.append(inputLine);
        // System.out.println(inputLine);
      }

      in.close();

      String s = result.toString();
      writeDataToFile("cache/" + simpleURL, s);
      return s;
    } catch (MalformedURLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return null;
  }

  /**
   * @param simpleURL
   * @return
   * @throws IOException
   */
  private static String readDataFromFile(String simpleURL) throws IOException {
    FileInputStream fis = new FileInputStream(simpleURL);
    BufferedReader br = new BufferedReader(new InputStreamReader(fis));
    StringBuffer sb = new StringBuffer();
    while (true) {
      String s = br.readLine();
      if (s == null)
        break;

      sb.append(s + "\n");
    }

    br.close();
    return sb.toString();
  }

  private static void writeDataToFile(String file, String s) throws FileNotFoundException {
    FileOutputStream fos = new FileOutputStream(file);
    PrintWriter pw = new PrintWriter(fos);
    pw.print(s);
    pw.close();
  }

  /**
   * @param url
   * @return
   */
  private static String getSimpleURL(String url) {
    url = url.replace('/', '_');
    url = url.replace('-', '_');
    url = url.replace(':', '_');
    return url;
  }

  public static void readFileURL(String url, String output) throws IOException {
    URL yahoo = new URL(url);
    DataInputStream dis = new DataInputStream(yahoo.openStream());

    FileOutputStream fos = new FileOutputStream(output);

    byte[] b = new byte[255];
    while (true) {
      int read = dis.read(b);
      if (read == -1)
        break;
      fos.write(b, 0, read);
    }

    dis.close();
    fos.close();
  }

  public static void main(String[] args) throws Exception {
    // URL yahoo = new
    // URL("http://www.bvb.ro/cgi-bin/bse_menu.cgi?select_leng=ROM");
    // URL yahoo = new URL(
    // "http://www.bvb.ro/cgi-bin/bse_main.cgi?select_leng=ENG&select_usertype=basic"
    // );

    // URL yahoo = new URL(
    // "http://www.bvb.ro/cgi-bin/bse_onlineSymb.cgi?select_leng=ENG&input_symbol=RRC"
    // );
    // URL yahoo = new URL("http://vremea.ido.ro/Timis.htm");
    // String s = readURL("http://www.google.com");
    // String s = URLReader.readURL(
    // "http://www.bvb.ro/cgi-bin/bse_onlineSymb.cgi?select_leng=ENG&input_symbol=RRC"
    // );
    String s = URLReader.readURL("https://www.soccerway.com/match/premier-league/bohemian-football-club/galway-united-football-club/551627/");
    s = s.replaceAll("https://", "");
    s = s.replaceAll("<img src=\"cache.images.soccerway.com/new/symbol/draw.gif\" width=\"10\" height=\"10\" border=\"0\" alt=\"Draw\"/>", "Draw");
    s = s.replaceAll("<img src=\"cache.images.soccerway.com/new/symbol/won.gif\" width=\"10\" height=\"10\" border=\"0\" alt=\"Won\"/>", "Won");
    s = s.replaceAll("<img src=\"cache.images.soccerway.com/new/symbol/lost.gif\" width=\"10\" height=\"10\" border=\"0\" alt=\"Lost\"/>", "Lost");
    s = s.substring(s.indexOf("<div id=\"content\">"));
    s = s.substring(s.indexOf("<td width='624' valign='top'>"));

    System.out.println(s);
    // BufferedReader in = new BufferedReader(new
    // InputStreamReader(yahoo.openStream()));
    //
    // String inputLine;
    // StringBuffer result = new StringBuffer();
    //
    // while ((inputLine = in.readLine()) != null)
    // {
    // result.append(inputLine);
    // System.out.println(inputLine);
    // }
    //
    // in.close();
    //
    // String s = result.toString();
    // System.out.println("Vol: " + getValue1(s, "Total Volume"));
    // System.out.println("Last: " + getValue1(s, "Last Price"));
    // System.out.println("Bid: " + getValue2(s, "Bid"));
    // System.out.println("Ask: " + getValue2(s, "Ask"));
    // System.out.println("QBid: " + getValue4(s, "Bid"));
    // System.out.println("QAsk: " + getValue4(s, "Ask"));
    // System.out.println("Low: " + getValue1(s, "Low"));
    // System.out.println("High: " + getValue1(s, "High"));
    // System.out.println("Ref: " + getValue1(s, "Reference Price"));

  }

  public static String getValue1(String s, String searched) {
    int x = s.indexOf(searched);
    int y = s.indexOf("<b>", x);
    int z = s.indexOf("</b>", y);
    String value = s.substring(y + 3, z);
    return value;
  }

  public static String getValue2(String s, String searched) {
    int x = s.indexOf(searched);
    int y = s.indexOf("<b>", x);
    y = s.indexOf("<b>", y + 1);
    int z = s.indexOf("</b>", y);
    String value = s.substring(y + 3, z);
    return value;
  }

  public static String getValue4(String s, String searched) {
    int x = s.indexOf(searched);
    int y = s.indexOf("<b>", x);
    y = s.indexOf("<b>", y + 1);
    y = s.indexOf("<b>", y + 1);
    y = s.indexOf("<b>", y + 1);
    int z = s.indexOf("</b>", y);
    String value = s.substring(y + 3, z);
    return value;
  }

  public static final void copyInputStream(InputStream in, OutputStream out) throws IOException {
    byte[] buffer = new byte[1024];
    int len;

    while ((len = in.read(buffer)) >= 0)
      out.write(buffer, 0, len);

    in.close();
    out.close();
  }

  public static final void extract(String param) throws FileNotFoundException, IOException {
    Enumeration entries;
    ZipFile zipFile;

    zipFile = new ZipFile(param);

    entries = zipFile.entries();

    while (entries.hasMoreElements()) {
      ZipEntry entry = (ZipEntry) entries.nextElement();

      if (entry.isDirectory()) {
        // Assume directories are stored parents first then children.
        // System.err.println("Extracting directory: " +
        // entry.getName());
        // This is not robust, just for demonstration purposes.
        (new File(entry.getName())).mkdir();
        continue;
      }

      // System.err.println("Extracting file: " + entry.getName());
      copyInputStream(zipFile.getInputStream(entry), new BufferedOutputStream(new FileOutputStream(entry.getName())));
    }

    zipFile.close();
  }

}