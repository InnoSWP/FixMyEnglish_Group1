/// A class that represents a single [File]
///
/// From this class you can take [name] of file.
/// Identifier [id] of a certain file.
/// And all [mistakeSentences] that was sent by API.
class File {
  File({
    required this.name,
    required this.id,
    this.mistakeSentences = const [],
  });

  /// Name of a [File].
  String? name;

  /// Identifier of a [File].
  int id = 0;

  /// All mistakes from [File] sent by API.
  final List mistakeSentences;
}
