// get extension of given file name as String
// if file name doesn't have '.'(dot) file name will be returned as an extension
String getExtension(String s, {dot = true}) {
  if (!s.contains('.')) {
    return s;
  }
  return s.substring(s.lastIndexOf('.') + (dot ? 0 : 1));
}

// remove extension of a file name[String]
// if file name doesn't have '.'(dot) it won't remove anything
String removeExtension(String s) {
  if (!s.contains('.')) {
    return s;
  }
  return s.substring(0, s.lastIndexOf('.'));
}
