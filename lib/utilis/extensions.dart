String createEmail(String firstName, String lastName, String domainName) {
  return "${lastName.toLowerCase()}.${firstName.toLowerCase()}@$domainName";
}

String createUsername(String firstName, String lastName) {
  return "${lastName.toLowerCase()}_${firstName.toLowerCase()}";
}

extension StringOperations on String {
  String toCapitalCase() {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + substring(1);
  }

  List<String> splitAtFirstWord() {
    final words = split(' ');
    if (words.isNotEmpty) {
      return [
        words[0].toCapitalCase(),
        words.sublist(1).join(" ").toCapitalCase()
      ];
    }
    throw ArgumentError("string is empty: $this");
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
