class NonexistentPersonException implements Exception {
  final String id;

  const NonexistentPersonException(this.id);

  @override
  String toString() {
    return "Person ($id) is not exist";
  }
}