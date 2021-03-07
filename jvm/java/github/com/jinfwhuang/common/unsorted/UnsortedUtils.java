package github.com.jinfwhuang.common.unsorted;

import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileUtils;

public class UnsortedUtils {

  public static void forceMkdir(String path) {
    File file = new File(path);
    forceMkdir(file);
  }

  public static void forceMkdir(File file) {
    try {
      if (!file.isFile()) {
        FileUtils.forceMkdir(file.getParentFile());
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
}
