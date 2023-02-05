import 'package:friend_list/domain/tag/i_tag_factory.dart';
import 'package:friend_list/domain/tag/tag.dart';

class AutoIncrementTagFactory implements ITagFactory {
  int count = 0;

  @override
  Tag create(String name) {
    return Tag(count.toString(), name);
  }
}
