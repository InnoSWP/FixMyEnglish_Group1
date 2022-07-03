class Report {
  String sentence;
  String match;
  String description;
  String label;
  String reason;
  Report({
    required this.label,
    required this.sentence,
    this.match = '',
    required this.description,
    required this.reason,
  });

  Map<String, Object> toJson() {
    return <String, Object>{
      'match': match,
      'sentence': sentence,
      'label': label,
      'description': description,
      'reason': reason,
    };
  }

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
