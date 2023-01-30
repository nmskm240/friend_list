import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/name_and_icon.dart';
import 'package:friend_list/view_model/person_basic_data_edit_view_model.dart';

final personBasicDataProvider = StateNotifierProvider.autoDispose<
    PersonBasicDataViewModel,
    NameAndIcon>((ref) => PersonBasicDataViewModel());
