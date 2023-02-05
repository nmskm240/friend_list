import 'package:friend_list/domain/tag/i_tag_factory.dart';
import 'package:friend_list/domain/tag/tag.dart';
import 'package:uuid/uuid.dart';

class TagFactory implements ITagFactory {
  @override
  Tag create(String name) {
    return Tag(const Uuid().v1(), name);
  }
}
