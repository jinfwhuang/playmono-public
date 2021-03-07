package github.com.jinfwhuang.common.unsorted;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import github.com.jinfwhuang.common.json.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@JsonIgnoreProperties(ignoreUnknown = true)
@Parameters(separators = "=")
public class AppConfig {

  private static final Logger logger = LoggerFactory.getLogger(AppConfig.class);

  public String toString() {
    return JsonUtils.toPrettyString(this);
  }

  public static <T extends AppConfig> T parse(String[] args, Class<T> type) {
    T config;
    try {
      config = type.newInstance();
    } catch (InstantiationException | IllegalAccessException e) {
      throw new RuntimeException(e);
    }
    JCommander.newBuilder().addObject(config).build().parse(args);

    return config;
  }
}
