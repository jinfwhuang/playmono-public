package github.com.jinfwhuang.cmd.helloserver;

import java.io.OutputStream;
import java.net.InetSocketAddress;

import com.sun.net.httpserver.HttpServer;

public class HelloServer {

  public static void main(String args[]) throws Exception {
    String path = "/hello";
    byte response[] = "okay".getBytes("UTF-8");
    int port = 8080;

    if (args.length > 0) {
      port = Integer.parseInt(args[0]);
    }

    HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);
    System.out.println("Starting server at port: " + port);
    server.createContext(path, httpExchange -> {
      httpExchange.getResponseHeaders().add("Content-Type", "text/plain; charset=UTF-8");
      httpExchange.sendResponseHeaders(200, response.length);
      OutputStream out = httpExchange.getResponseBody();
      out.write(response);
      out.close();
      System.out.println("Hitting: " + path);
    });

    // start server
    server.start();
  }
}
