import '../../dtos/new_contact_dto.dart';
import '../../models/contact_model.dart';

abstract interface class ContactsService {
  Future<List<ContactModel>> getAllContacts();
  Future<ContactModel?> getContactById(Object id);
  Future<ContactModel> createContact(NewContactDTO newContactDTO);
  Future<void> updateContact(ContactModel contactModel);
  Future<void> deleteContact(ContactModel contactModel);
}
