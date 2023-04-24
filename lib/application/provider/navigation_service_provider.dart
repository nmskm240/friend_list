import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/navigation_service.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});