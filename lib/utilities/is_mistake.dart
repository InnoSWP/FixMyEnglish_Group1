/// A boolean function to determine should [error] be reconized as mistake or not.
///
/// It consider different situations.
/// Example:
/// ```dart
///   isMistake(error: 'n\'t', text: 'don\'t', suggestion: 'Using contractions'); // true
///   isMistake(error: 'we', text: 'went', suggestion: 'Using pronoun incorrectly'); // false
///   isMistake(error: 'we', text: 'we went', suggestion: 'Using pronoun incorrectly'); // true
///   isMistake(error: 'we', text: 'we', suggestion: '...'); // true
///   isMistake(error: 'we', text: 'we,', suggestion: '...'); // true
///   isMistake(error: 'we', text: ',we', suggestion: '...'); // true
/// ```
bool isMistake({
  text,
  error,
  index,
  suggestion,
}) {
  int sLength = text.length;
  int lastSymbol = index + (error.length); // not including last)
  if (index == 0 && lastSymbol == sLength) {
    // [error]
    return true;
  } else if (index == 0 && !isLetter(text[lastSymbol])) {
    // [error text]
    return true;
  } else if (index == 0 && suggestion == 'Using contractions') {
    // [error[n't]]
    return true;
  } else if (index > 0 && lastSymbol == sLength && !isLetter(text[index - 1])) {
    // [ error]
    return true;
  } else if (index > 0 &&
      lastSymbol == sLength &&
      suggestion == 'Using contractions') {
    // [[n't]error]
    return true;
  } else if (index > 0 && lastSymbol < sLength && !isLetter(text[lastSymbol])) {
    // [text error text]
    return true;
  } else if (index > 0 &&
      lastSymbol < sLength &&
      suggestion == 'Using contractions') {
    // [text errorn't text]
    return true;
  }
  return false;
}

/// A boolean function that returns true if the given string a Letter.
bool isLetter(String s) {
  if (s.length != 1) {
    return false;
  }
  int c = s.codeUnitAt(0);
  return (c >= 0x41 && c <= 0x5A) || (c >= 0x61 && c <= 0x7A);
}
