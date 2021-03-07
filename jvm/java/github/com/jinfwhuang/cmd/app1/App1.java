package github.com.jinfwhuang.cmd;

import github.com.jinfwhuang.common.unsorted.AppConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App1 {

  private static final Logger logger = LoggerFactory.getLogger(AppConfig.class);

  public static void main(String[] args) {
    App1Config config = App1Config.parse(args);
    System.out.println("ffff");
  }

}
