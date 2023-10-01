part of 'contacts_bloc.dart';

interface class ContactsEvent {
  const ContactsEvent();
}

final class GetAllContactsEvent implements ContactsEvent {
  const GetAllContactsEvent();
}

final class CreateContactEvent implements ContactsEvent {
  const CreateContactEvent(this.newContactDTO);

  final NewContactDTO newContactDTO;
}

final class DeleteContactEvent implements ContactsEvent {
  const DeleteContactEvent(this.contact);

  final ContactModel contact;
}
