import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/provider/navigation_service_provider.dart';
import 'package:friend_list/application/provider/person_service_provider.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/person_list_page/notifyer/person_list_notifyer.dart';

final personListPageProvider =
    StateNotifierProvider<PersonListPageNotifyer, AsyncValue<Iterable<Person>>>(
  (ref) => PersonListPageNotifyer(
    service: ref.read(personServiceProvider),
    navigator: ref.read(navigationServiceProvider),
  ),
);
