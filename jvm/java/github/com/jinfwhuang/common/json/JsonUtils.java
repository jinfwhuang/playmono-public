package github.com.jinfwhuang.common.json;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

public class JsonUtils {

  public static final ObjectMapper mapper = new ObjectMapper();
  public static final ObjectReader reader = mapper.reader();
  public static final ObjectMapper prettyMapper =
      new ObjectMapper().enable(SerializationFeature.INDENT_OUTPUT);
  public static final ObjectMapper yamlMapper = new ObjectMapper(new YAMLFactory());

  public static <T> T parse(String s, Class<T> valueType) throws IOException {
    return mapper.readValue(s, valueType);
  }

  public static <T> T parse(InputStream inputStream, TypeReference<T> ref) throws IOException {
    return mapper.readValue(inputStream, ref);
  }

  public static <T> T parse(InputStream inputStream, Class<T> valueType) throws IOException {
    return mapper.readValue(inputStream, valueType);
  }

  public static <T> T parseYaml(File file, Class<T> valueType) throws IOException {
    return yamlMapper.readValue(file, valueType);
  }

  public static <T> T parseYaml(String s, Class<T> valueType) throws Exception {
    return yamlMapper.readValue(s, valueType);
  }

  public static <T> T parse(String s, TypeReference<T> ref) throws IOException {
    return mapper.readValue(s, ref);
  }

  public static JsonNode toJsonNode(Object o) {
    return mapper.convertValue(o, JsonNode.class);
  }

  public static String toJsonString(Object o) {
    try {
      return mapper.writeValueAsString(o);
    } catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }
  }

  public static String toPrettyString(Object o) {
    try {
      return prettyMapper.writeValueAsString(o);
    } catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }
  }

  public static String toYaml(Object o) {
    try {
      return yamlMapper.writeValueAsString(o);
    } catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }
  }

  public static Map<String, Object> toMap(Object o) {
    return mapper.convertValue(o, new TypeReference<Map<String, Object>>(){});
  }

  public static String toPrettyString(String s) {
    JsonNode js;
    try {
      js = reader.readTree(s);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }

    return JsonUtils.toPrettyString(js);
  }
}
