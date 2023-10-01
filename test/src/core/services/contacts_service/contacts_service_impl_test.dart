import 'package:dio_contact_list/src/core/dtos/new_contact_dto.dart';
import 'package:dio_contact_list/src/core/models/contact_model.dart';
import 'package:dio_contact_list/src/core/repositories/contacts/contacts_repository.dart';
import 'package:dio_contact_list/src/core/services/contacts_service/contacts_service_impl.dart';
import 'package:dio_contact_list/src/core/services/image_service/image_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ContactsRepositoryMock extends Mock implements ContactsRepository {}

class ImageServiceMock extends Mock implements ImageService {}

void main() {
  final repository = ContactsRepositoryMock();
  final imageService = ImageServiceMock();
  const imagePath =
      '/data/user/0/br.com.bmsrangel.dev.dio_contact_list/cache/image_cropper_1696186026164.jpg';

  final contactsService = ContactsServiceImpl(
    repository,
    imageService,
  );
  test('Should return a ContactModel if store is successful', () async {
    final dto = NewContactDTO(firstName: 'John', avatarUrl: imagePath);
    when(() => repository.insertOne(dto)).thenAnswer(
      (_) async => ContactModel(id: 1, firstName: 'John', lastName: 'Doe'),
    );
    final contact = await contactsService.createContact(dto);
    expect(contact.firstName, 'John');
  });
}
