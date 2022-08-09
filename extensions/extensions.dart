extension PrintList on List {
  void printList() {
    this.forEach(print);
  }
}

extension StringToInt on String {
  int toInt() {
    try {
      return int.parse(this);
    } catch (exception) {
      throw 'Not possible to parse $this to String $exception';
    }
  }
}
