import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_detail_page/state/person_detail_page_state.dart';

class PersonDetailPageNotifier
    extends StateNotifier<PersonDetailPageState> {
  final PersonAppService _service;
  final AppRouter _router;

  PersonDetailPageNotifier({
    required PersonAppService service,
    required AppRouter router,
    required Person domain,
  })  : _service = service,
        _router = router,
        super(PersonDetailPageState(domain: domain));

  Future<void> onPressedDeleteButton() async {
    await _service.deletePersonById(state.id);
    _router.popUntilRouteWithPath("/");
  }

  Future<void> onPressedEditButton(Person domain) async {
    await _router.push(PersonEditRoute(domain: domain));
  }

  Future<void> onPressedAnniversaryListTile(Anniversary anniversary) async {
    await _router.push(AnniversaryDetailRoute(state: anniversary));
  }
}
