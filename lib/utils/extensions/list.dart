extension ListExtensions on List {
  void rearrangeByIndex<T>(int initialIndex, [int finalIndex = 0]){
    T item = this.removeAt(initialIndex);
    this.insert(finalIndex, item);
  }
}