import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/common/provider/person_service_provider.dart';

final personListProvider = FutureProvider((ref) async {
  final service = ref.watch(personServiceProvider);
  return service.getAll();
});