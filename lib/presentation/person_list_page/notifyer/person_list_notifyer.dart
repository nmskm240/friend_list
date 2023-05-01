import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';

class PersonListPageNotifyer
    extends StateNotifier<AsyncValue<Iterable<Person>>> {
  final PersonAppService _service;
  final AppRouter _router;

  PersonListPageNotifyer({
    required PersonAppService service,
    required AppRouter router,
  })  : _service = service,
        _router = router,
        super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final persons = await _service.getAll();
      state = AsyncValue.data(persons);
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> onPressedPersonListTile(String id) async {
    _router.push(PersonDetailRoute(id: id));
  }

  Future<void> onPressedAddPerson() async {
    _router.pushNamed("/edit");
  }
}
