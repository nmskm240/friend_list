import 'package:friend_list/domain/contact/contact.dart';
import 'package:friend_list/domain/tag/i_tag_repository.dart';
import 'package:friend_list/domain/tag/tag.dart';

class InMemoryTagRepository implements ITagRepository {
  final List<Tag> tags;

  const InMemoryTagRepository(this.tags);
  
  @override
  Future<void> deleteByID(String id) async {
    tags.removeWhere((element) => element.id == id);
  }
  
  @override
  Future<Tag?> findByID(String id) async {
    final searched = tags.where((element) => element.id == id);
    return searched.isEmpty ? null : searched.first;
  }
  
  @override
  Future<Tag?> findByName(String name) async {
    final searched = tags.where((element) => element.name == name);
    return searched.isEmpty ? null : searched.first;
  }
  
  @override
  Future<Iterable<Tag>> getAll() async {
    return tags;
  }
  
  @override
  Future<Tag> save(Tag tag) async {
    if(tags.where((element) => element.id == tag.id).isEmpty) {
      tags.add(tag);
    } else {
      final index = tags.indexWhere((element) => element.id == tag.id);
      tags.removeAt(index);
      tags.insert(index, tag);
    }
    return tag;
  }
}
