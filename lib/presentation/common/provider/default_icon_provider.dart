import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final defaultIconProvider = FutureProvider<Uint8List>((ref) async {
  final data = await rootBundle.load("assets/images/default_avatar.png");
  final buffer = data.buffer;
  final bytes = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  return bytes;
});
