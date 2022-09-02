extension SingleWhereOrNull<T> on List<T> {
  T? singleWhereOrNull(Function(T element) test) {
    for (final item in this) {
      if (test(item)) {
        return item;
      }
    }
    return null;
  }
}
