import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/navigation_service.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/presentation/person_detail_page/state/person_detail_page_state.dart';

class PersonDetailPageNotifier
    extends StateNotifier<AsyncValue<PersonDetailPageState>> {
  final PersonAppService _service;
  final NavigationService _navigator;

  PersonDetailPageNotifier({
    required PersonAppService service,
    required NavigationService navigator,
    required String id,
  })  : _service = service,
        _navigator = navigator,
        super(const AsyncValue.loading()) {
    _init(id);
  }

  Future<void> _init(String id) async {
    try {
      final person = await _service.findPersonById(id);
      state = AsyncValue.data(PersonDetailPageState(domain: person));
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> onPressedDeleteButton() async {
    await _service.deletePersonById(state.value!.id);
    await _navigator.pop();
  }

  Future<void> onPressedEditButton(String id) async {
    await _navigator.push("/person/edit");
  }

  Future<void> onPressedAnniversaryListTile(String id) async {
    await _navigator.push("/anniversary/detail");
  }
}
