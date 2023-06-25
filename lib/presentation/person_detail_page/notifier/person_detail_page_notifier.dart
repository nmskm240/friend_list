import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/usecase/person_delete_usecase.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_detail_page/state/person_detail_page_state.dart';

class PersonDetailPageNotifier extends StateNotifier<PersonDetailPageState> {
  final Ref _ref;

  PersonDetailPageNotifier({required Ref ref, required Person person})
      : _ref = ref,
        super(PersonDetailPageState(person: person));

  Future<void> onPressedDeleteButton() async {
    await _ref.read(personDeleter).call(state.person.id);
    _ref.read(router).pop();
  }

  Future<void> onPressedEditButton() async {
    final res = await _ref
        .read(router)
        .push<Person>(PersonEditRoute(person: state.person));
    if (res == null) {
      return;
    }
    state = state.copyWith(person: res);
  }

  Future<void> onPressedAnniveraryListTile(Anniversary anniversary) async {
    final route = AnniversaryDetailRoute(anniversary: anniversary);
    _ref.read(router).push(route);
  }
}
