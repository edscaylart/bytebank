class StringUtils {
  static String getLetters(String value) {
    return value.toUpperCase().split(' ').map((word) => word[0]).take(2).join();
  }
}
