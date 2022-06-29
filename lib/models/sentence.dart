class Sentence {
  String text;
  String error;
  String suggestion;
  String label;
  Sentence({
    required this.label,
    required this.text,
    this.error = '',
    required this.suggestion,
  });
}
