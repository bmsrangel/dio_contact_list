import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../dtos/new_contact_dto.dart';
import '../../models/contact_model.dart';
import 'contacts_repository.dart';

@LazySingleton(as: ContactsRepository)
class SqfliteContactsRepositoryImpl implements ContactsRepository {
  SqfliteContactsRepositoryImpl(this._db);

  final Database _db;

  @override
  Future<List<ContactModel>> findAll() async {
    final results = await _db.query('contacts', orderBy: 'first_name');
    final contacts = results.map(ContactModel.fromJson).toList();
    return contacts;
  }

  @override
  Future<ContactModel> insertOne(NewContactDTO newContactDTO) async {
    final newContactId = await _db.insert('contacts', newContactDTO.toJson());
    final newContact = await _db.query(
      'contacts',
      where: 'id = ?',
      whereArgs: [
        newContactId,
      ],
    );
    final contactModel = ContactModel.fromJson(newContact.first);
    return contactModel;
  }
}
