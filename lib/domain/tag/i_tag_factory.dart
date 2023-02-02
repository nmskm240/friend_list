import 'package:friend_list/domain/tag/tag.dart';

abstract class ITagFactory {
  Tag create(String name);
}