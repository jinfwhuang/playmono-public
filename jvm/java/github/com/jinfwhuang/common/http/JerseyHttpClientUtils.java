package github.com.jinfwhuang.common.json;

import javax.ws.rs.client.Entity;
import org.glassfish.jersey.client.JerseyClient;
import org.glassfish.jersey.client.JerseyInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JerseyHttpClientUtils {

  private static final Logger logger = LoggerFactory.getLogger(JerseyHttpClientUtils.class);

  public static String get(JerseyClient client, String url) {
    String res;
    JerseyInvocation.Builder bd = client.target(url).request();
    try {
      res = bd.get(String.class);
    } catch (Exception e) {
      logger.info(url);
      logger.info("error", e);
      throw new RuntimeException(e);
    }

    return res;
  }

  public static String post(JerseyClient client, String url, String content) {
    String res;
    JerseyInvocation.Builder bd = client.target(url).request();
    try {
      res = bd.post(Entity.text(content), String.class);
    } catch (Exception e) {
      logger.info(url);
      logger.info("error", e);
      throw new RuntimeException(e);
    }

    return res;
  }
}
