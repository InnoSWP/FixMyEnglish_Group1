class File {
  String? name;
  int id = 0;
  final List mistakeSentences;
  File({
    required this.name,
    required this.id,
    this.mistakeSentences = const [],
  });
}
