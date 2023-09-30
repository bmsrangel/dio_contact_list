import '../../dtos/new_contact_dto.dart';
import '../../models/contact_model.dart';

abstract interface class ContactsRepository {
  Future<List<ContactModel>> findAll();
  Future<ContactModel> insertOne(NewContactDTO newContactDTO);
}
