package github.com.jinfwhuang.cmd.app1;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import github.com.jinfwhuang.common.unsorted.AppConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.joda.time.format.DateTimeFormat;
//import org.joda.time.format.DateTimeFormatter;

/**
 * This class holds the configurable variables and constants.
 *
 * <p>- A variable is configurable if and if they are environment specific. - Constants are placed
 * here if they are application and reference in more than one class.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Parameters(separators = "=")
public class App1Config extends AppConfig {

  private static final Logger logger = LoggerFactory.getLogger(AppConfig.class);

  // DEBUGGING property
  @JsonProperty("fail")
  @Parameter(names = "--fail", description = "intentional failure")
  public boolean fail = false;

  // DEBUGGING property
  @Parameter(names = "--sleep", description = "intentionally sleep (ms) to debug pod environment")
  public long sleep = -1;

  @Parameter(names = "--param1", description = "param1")
  public String param1 = "param1-value";

  public static App1Config parse(String[] args) {
    App1Config config = AppConfig.parse(args, App1Config.class);
    logger.info("config: \n" + config.toString());

    if (config.fail) {
      throw new RuntimeException("intentionally fail config parsing; check your settings");
    }

    if (config.sleep > 0) {
      logger.info("the application is sleeping for {} seconds", config.sleep / 1000);
      try {
        Thread.sleep(config.sleep);
      } catch (Exception e) {
      }
    }

    return config;
  }

}
