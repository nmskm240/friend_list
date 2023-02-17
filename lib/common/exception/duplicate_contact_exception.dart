class DuplicateContactException implements Exception {
  final String id;
  final String method;
  final String value;

  const DuplicateContactException(this.id, this.method, this.value);

  @override
  String toString() {
    return "Person ($id) has already same contact of $method and $value";
  }
}