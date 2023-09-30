part of 'single_contact_bloc.dart';

abstract interface class SingleContactEvent {
  const SingleContactEvent();
}

final class AddContactEvent implements SingleContactEvent {
  const AddContactEvent(this.newContactDTO);

  final NewContactDTO newContactDTO;
}

final class GetContactByIdEvent implements SingleContactEvent {
  const GetContactByIdEvent(this.id);

  final Object id;
}

final class UpdateContactEvent implements SingleContactEvent {
  const UpdateContactEvent(this.contactModel);

  final ContactModel contactModel;
}
