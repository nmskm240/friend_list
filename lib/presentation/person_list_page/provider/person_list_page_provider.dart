import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/provider/person_service_provider.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_list_page/notifyer/person_list_notifyer.dart';

final personListPageProvider =
    StateNotifierProvider<PersonListPageNotifyer, AsyncValue<Iterable<Person>>>(
  (ref) => PersonListPageNotifyer(
    service: ref.read(personServiceProvider),
    router: ref.read(routerProvider),
  ),
);
