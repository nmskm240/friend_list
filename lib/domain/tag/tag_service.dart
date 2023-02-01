import 'package:friend_list/domain/tag/i_tag_repository.dart';
import 'package:friend_list/domain/tag/tag.dart';

class TagService {
  final ITagRepository repository;

  const TagService(this.repository);

  Future<bool> isDuplicated(Tag tag) async {
    final searched = await repository.findByName(tag.name);
    return searched != null;
  }
}