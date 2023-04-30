import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/navigation_service.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/domain/person/person.dart';

class PersonListPageNotifyer
    extends StateNotifier<AsyncValue<Iterable<Person>>> {
  final PersonAppService _service;
  final NavigationService _navigator;

  PersonListPageNotifyer({
    required PersonAppService service,
    required NavigationService navigator,
  })  : _service = service,
        _navigator = navigator,
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
    final person = await _service.findPersonById(id);
  }

  Future<void> onPressedAddPerson() async {
    _navigator.push("/edit");
  }
}
