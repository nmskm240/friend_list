class UnregisteredPersonException implements Exception {
  final String id;

  const UnregisteredPersonException(this.id);

  @override
  String toString() {
    return "Person ($id) is not exist";
  }
}