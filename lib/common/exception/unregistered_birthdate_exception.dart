class UnregisteredBirthdateException implements Exception {
  final String id;

  const UnregisteredBirthdateException(this.id);

  @override
  String toString() {
    return "Person ($id) is not registered birthdate";
  }
}
