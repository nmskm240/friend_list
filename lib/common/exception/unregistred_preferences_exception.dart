class UnregisteredPreferenceException implements Exception {
  final String key;

  const UnregisteredPreferenceException(this.key);

  @override
  String toString() {
    return "The key ($key) is not registered.";
  }
}
