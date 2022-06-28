class LastClick {
  late List<int> _fileId;
  LastClick({initState = const [0]}) {
    _fileId = [];
    _fileId.addAll(initState);
  }

  bool add(int id) {
    if (id == _fileId.last) {
      return false;
    }
    _fileId.add(id);
    return true;
  }

  void remove(int id) {
    if (_fileId.isEmpty) {
      return;
    }
    _fileId.removeWhere((element) => element == id);
  }

  int getId() {
    if (_fileId.isEmpty) {
      return 0;
    }
    return _fileId.last;
  }
}
