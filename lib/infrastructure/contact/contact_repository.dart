import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/domain/contact/contact.dart';
import 'package:friend_list/domain/contact/i_contact_repositoty.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';

class ContactRepository implements IContactRepository {
  final ILocalDataSource _source;

  const ContactRepository(this._source);

  @override
  Future<void> deleteAll() async {
    final db = await _source.database;
    await db.delete(DatabaseTable.contacts.name);
  }

  @override
  Future<void> deleteAllByPersonID(String personId) async {
    final db = await _source.database;
    await db.delete(
      DatabaseTable.contacts.name,
      where: "person_id = ?",
      whereArgs: [personId],
    );
  }

  @override
  Future<void> deleteByID(String id) async {
    final db = await _source.database;
    await db.delete(
      DatabaseTable.contacts.name,
      where: "contact_id = ?",
      whereArgs: [id],
    );
  }

  @override
  Future<Iterable<Contact>> findAllByPersonID(String personId) async {
    final db = await _source.database;
    final searthed = await db.query(
      DatabaseTable.contacts.name,
      where: "person_id = ?",
      whereArgs: [personId],
    );
    return searthed.map((e) => Contact.fromJson(e));
  }

  @override
  Future<Contact?> findByID(String id) async {
    final db = await _source.database;
    final searched = await db.query(
      DatabaseTable.contacts.name,
      where: "contact_id = ?",
      whereArgs: [id],
      limit: 1,
    );
    return searched.isEmpty ? null : Contact.fromJson(searched.first);
  }

  @override
  Future<Contact> save(Contact contact) async {
    final db = await _source.database;
    final searched = await findByID(contact.id);
    if (searched == null) {
      db.insert(DatabaseTable.contacts.name, contact.toJson());
    } else {
      db.update(
        DatabaseTable.contacts.name,
        contact.toJson(),
        where: "contact_id = ?",
        whereArgs: [contact.id],
      );
    }
    return contact;
  }
}
