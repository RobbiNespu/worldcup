
package com.ssn.core.utils;

/*
 * Copyright (c) 2014 SSI Schaefer Noell GmbH
 *
 * $Header: $
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

/**
 * @author <a href="mailto:rveina@ssi-schaefer-noell.com">rveina</a>
 * @version $Revision: $, $Date: $, $Author: $
 */

public class Updater {
  static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy hh:mm");

  public static void main(String[] args) throws ParseException {
    System.setProperty("java.net.useSystemProxies", "true");
    MatchData[] data = { //
      new MatchData(64, "https://m.flashscore.ro/meci/nDxZrI2c/?s=2", simpleDateFormat.parse("12.04.2018 11:00")), //
      new MatchData(63, "https://m.flashscore.ro/meci/KAvDEopp/?s=2", simpleDateFormat.parse("22.03.2018 14:45")), //
      new MatchData(62, "https://m.flashscore.ro/meci/d0RJgcK5/?s=2", simpleDateFormat.parse("22.03.2018 14:45")) };

    while (true) {
      long currentTime = System.currentTimeMillis();

      for (MatchData md : data) {
        if (md.date.getTime() < currentTime && !md.finished) {
          readData(md);
        } else {
          System.out.println("Match " + md.index + " not started yet or already finished.");
        }
      }
      try {
        Thread.sleep(1000 * 60);
      } catch (InterruptedException e) {

        //
      }

    }
  }

  protected static void readData(MatchData match) {
    String s = URLReader.readURL(match.url);
    // System.out.println(s);
    Document document = Jsoup.parse(s);
    Elements liveElements = document.getElementsByClass("live");
    Elements detailElements = document.getElementsByClass("detail");
    try {
      // Node halfTime = detailElements.get(0).childNode(1); // score for
      // 1st half and 2nd half in parentheses separated by a comma
      if (liveElements.size() > 0) {// game is live
        Node status = detailElements.get(1).childNode(0).childNode(0);
        Node score = liveElements.get(0).childNode(0).childNode(0); // live
        // score
        System.out.println("Match " + match.index + " live, score: " + score);
        if (s.indexOf("Prelungiri") != -1) {
          match.finished = true;
        } else {
          informServerAboutTheScore(match, score);
        }
      } else {
        if (detailElements.size() < 3) {
          System.out.println("Match " + match.index + " not started probably.");
        } else {
          Node status = detailElements.get(1).childNode(0);
          System.out.println(status);
          if (status.toString().contains("Final")) {
            Node score = detailElements.get(0).childNode(0).childNode(0);
            System.out.println("Match " + match.index + " finished, score: " + score);
            informServerAboutTheWinningTeam(match, score);
            match.finished = true;
          } else {
            // /System.out.println("Match finished, score: " +
            // score);
            // informServerAboutTheScore(match, score);
            // match.finished = true;
          }
        }
      }
    } catch (IndexOutOfBoundsException ex) {
      // do nothing
      ex.printStackTrace();
    }
  }

  private static void informServerAboutTheWinningTeam(MatchData match, Node score) {
    String splits[] = score.toString().split(":");
    int g1 = Integer.parseInt(splits[0]);
    int g2 = Integer.parseInt(splits[1]);
    URLReader.readURL("http://172.28.154.100:8080/worldcup2014/setMatchQualifiedTeam.jsp?id=" + match.index + "&team=" + (g1 > g2 ? "1" : "2"));
    System.out.println("Server informed about the change of q team: " + score);
  }

  protected static void informServerAboutTheScore(MatchData match, Node score) {
    String splits[] = score.toString().split(":");
    URLReader.readURLNoProxy("http://timw0186:8999/worldcup/setResult.jsp?id=" + match.index + "&g1=" + splits[0] + "&g2=" + splits[1]);
    System.out.println("Server informed about the change: " + score);
  }
}

class MatchData {
  int index;
  String url;
  boolean finished;
  Date date;

  public MatchData(int index, String url, Date date) {
    this.index = index;
    this.url = "https://m.flashscore.ro/meci/" + url + "/?s=2";
    this.date = date;
    finished = false;
  }
}