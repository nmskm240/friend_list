import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_detail_page/state/person_detail_page_state.dart';

class PersonDetailPageNotifier
    extends StateNotifier<AsyncValue<PersonDetailPageState>> {
  final PersonAppService _service;
  final AppRouter _router;

  PersonDetailPageNotifier({
    required PersonAppService service,
    required AppRouter router,
    required String id,
  })  : _service = service,
        _router = router,
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
    _router.popUntilRouteWithPath("/");
  }

  Future<void> onPressedEditButton(String id) async {
    await _router.push(PersonEditRoute(id: id));
  }

  Future<void> onPressedAnniversaryListTile(String id) async {
    await _router.push(const AnniversaryEditRoute());
  }
}
