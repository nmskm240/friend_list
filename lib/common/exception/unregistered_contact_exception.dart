class UnregisteredContactException implements Exception {
  final String? id;
  final String? name;
  final String? method;
  final String? value;

  const UnregisteredContactException({this.id, this.method, this.value, this.name});

  @override
  String toString() {
    var detail = "";
    if(id != null) detail += "id: $id";
    if(name != null) detail += "name: $name";
    if(method != null) detail += "method: $method";
    if(value != null) detail += "value: $value";
    return "The Contact ($detail) is not registered";
  }
}
