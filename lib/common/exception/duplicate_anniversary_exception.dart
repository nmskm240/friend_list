class DuplicateAnniversaryException implements Exception {
  final String id;
  final String name;

  const DuplicateAnniversaryException(this.id, this.name);

  @override 
  String toString() {
    return "Person ($id) has already same anniversary of $name";
  }
}