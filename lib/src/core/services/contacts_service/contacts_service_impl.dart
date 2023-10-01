import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;

import '../../dtos/new_contact_dto.dart';
import '../../models/contact_model.dart';
import '../../repositories/contacts/contacts_repository.dart';
import '../image_service/image_service.dart';
import 'contacts_service.dart';

@LazySingleton(as: ContactsService)
class ContactsServiceImpl implements ContactsService {
  ContactsServiceImpl(this._contactsRepository, this._imageService);

  final ContactsRepository _contactsRepository;
  final ImageService _imageService;

  @override
  Future<ContactModel> createContact(NewContactDTO newContactDTO) async {
    var newContact = await _contactsRepository.insertOne(newContactDTO);
    var avatarUrl = newContactDTO.avatarUrl;
    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      final imagePath = path.toUri(newContactDTO.avatarUrl!);
      avatarUrl = imagePath.pathSegments.last;
      final fileExtension = avatarUrl.split('.').last;
      final image = File(imagePath.path);
      final imageData = await image.readAsBytes();
      final profileImage = await _imageService.saveImage(
        '${newContact.id}.$fileExtension',
        imageData,
      );
      await _contactsRepository.updateOne(
        newContact.copyWith(
          avatarUrl: profileImage,
        ),
      );
      newContact = newContact.copyWith(avatarUrl: profileImage);
    }
    return newContact;
  }

  @override
  Future<List<ContactModel>> getAllContacts() async {
    final contacts = await _contactsRepository.findAll();
    return contacts;
  }

  @override
  Future<ContactModel?> getContactById(Object id) async {
    final contact = await _contactsRepository.findById(id);
    return contact;
  }

  @override
  Future<void> updateContact(ContactModel contactModel) async {
    final oldContact = await _contactsRepository.findById(contactModel.id);
    if (oldContact!.avatarUrl != null && oldContact.avatarUrl!.isNotEmpty) {
      await _imageService.deleteImage(oldContact.avatarUrl!);
    }
    await _contactsRepository.updateOne(contactModel);
  }

  @override
  Future<void> deleteContact(ContactModel contactModel) async {
    await _imageService.deleteImage(contactModel.avatarUrl);
    await _contactsRepository.deleteOne(contactModel.id);
  }
}
