class UnknownPlatformException implements Exception {
  const UnknownPlatformException();

  @override
  String toString() {
    return 'Unable to determine platform.';
  }
}
