/// Get extension of given [fileName] as String
///
/// if [fileName] doesn't have '.'(dot) then [fileName] will be returned as an extension
String getExtension(String fileName, {dot = true}) {
  if (!fileName.contains('.')) {
    return fileName;
  }
  return fileName.substring(fileName.lastIndexOf('.') + (dot ? 0 : 1));
}

/// Remove extension of a [fileName]
///
/// if [fileName] doesn't have '.'(dot) it won't remove anything
String removeExtension(String fileName) {
  if (!fileName.contains('.')) {
    return fileName;
  }
  return fileName.substring(0, fileName.lastIndexOf('.'));
}
