/// A class that represents a single user report.
///
/// [Report] consist of [sentence], [match], [description], [label] and [reason]
/// [Report] has static method [fromJson], thats convert given `Map<String, Object>`
/// to type [Report] and return it.
/// You can convert any report to Json by [toJson], it will return a `Map<String, Object>`
/// with all fields of [Report].
class Report {
  Report({
    required this.label,
    required this.sentence,
    this.match = '',
    required this.description,
    required this.reason,
  });

  /// [sentence] that has `false-positive` error
  String sentence;

  /// error that seems to be incorrect(`false-positive`)
  String match;

  /// [description] of [match](error)
  String description;

  /// type of [match]
  String label;

  /// [reason] why this [Report] was created
  String reason;

  /// Converts [Report] to `Map<String, Object>`.
  Map<String, Object> toJson() {
    return <String, Object>{
      'match': match,
      'sentence': sentence,
      'label': label,
      'description': description,
      'reason': reason,
    };
  }

  /// Converts given `Map<String, Object>` to [Report].
  static Report fromJson(Map<String, Object> data) {
    return Report(
      label: data['label'] as String,
      reason: data['reason'] as String,
      description: data['description'] as String,
      sentence: data['sentence'] as String,
      match: data['match'] as String,
    );
  }
}
