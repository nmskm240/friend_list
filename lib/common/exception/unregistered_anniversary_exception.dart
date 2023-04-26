class UnregisteredAnniversaryException implements Exception {
  final String name;

  const UnregisteredAnniversaryException(this.name);

  @override
  String toString() {
    return "The Anniversary ($name) is not registered";
  }
}
