/// [LastClick] helps to better navigate between files.
///
/// By [add] you can to `List` new `id` as last clicked one.
/// If it's already last one it will be ignored.
///
/// By [remove] you can remove file by providing `id`.
/// It will remove all instances of `id`, no need to `id` be last clicked.
///
/// By [getId] you can get access to last clicked `id`. If [_fileId] is empty,
/// it will return `0` as default Screen.
/// Example:
/// ```dart
///   LastClick lastClickFile = LastClick(initState: [1, 2, 1, 3]); // order of already clicked file
///
///   lastClickFile.getId(); // 3
///   lastClickFile.remove(1); // _fileId = [2, 3]
///   lastClickFile.getId(); // 3
///   lastClickFile.remove(3); // _fileId = [2]
///   lastClickFile.getId(); // 2
///   lastClickFile.remove(3); // _fileId = []
///   lastClickFile.getId(); // 0
/// ```
class LastClick {
  LastClick({initState = const [0]}) {
    _fileId = [];
    _fileId.addAll(initState);
  }

  /// List of `id`.
  late List<int> _fileId;

  /// Add new [id] to [_fileId].
  bool add(int id) {
    if (id == _fileId.last) {
      return false;
    }
    _fileId.add(id);
    return true;
  }

  /// Remove all instances of [id] if any.
  void remove(int id) {
    if (_fileId.isEmpty) {
      return;
    }
    _fileId.removeWhere((element) => element == id);
  }

  /// Get last clicked file(`id`).
  int getId() {
    if (_fileId.isEmpty) {
      return 0;
    }
    return _fileId.last;
  }
}
