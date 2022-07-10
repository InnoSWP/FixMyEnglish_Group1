/// A class that represents a single [Sentence]
///
/// [Sentence] has [text], [error], [suggestion] and [label].
class Sentence {
  Sentence({
    required this.label,
    required this.text,
    this.error = '',
    required this.suggestion,
  });

  /// sentence it self.
  String text;

  /// [error] phrase in [Sentence].
  String error;

  /// [suggestion] how fix [erorr].
  String suggestion;

  /// Type of [error].
  String label;
}
