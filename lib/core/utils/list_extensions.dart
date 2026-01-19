/// Extension methods for Iterable to add useful list operations
extension IterableExtensions<T> on Iterable<T> {
  /// Returns a new list with duplicates removed based on a key selector.
  ///
  /// The first occurrence of each unique key is kept.
  ///
  /// Example:
  /// ```dart
  /// final users = [User(id: 1, name: 'Alice'), User(id: 2, name: 'Bob'), User(id: 1, name: 'Alice2')];
  /// final uniqueUsers = users.distinctBy((u) => u.id); // [User(id: 1, name: 'Alice'), User(id: 2, name: 'Bob')]
  /// ```
  List<T> distinctBy<K>(K Function(T element) keySelector) {
    final seenKeys = <K>{};
    return where((element) {
      final key = keySelector(element);
      if (seenKeys.contains(key)) {
        return false;
      }
      seenKeys.add(key);
      return true;
    }).toList();
  }
}
