import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../dtos/new_contact_dto.dart';
import '../../models/contact_model.dart';
import '../../services/contacts_service/contacts_service.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

@Singleton()
class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(this._service) : super(ContactsState(state: [])) {
    on<GetAllContactsEvent>(_onGetAllContactsEvent);
    on<CreateContactEvent>(_onCreateContactEvent);
    on<DeleteContactEvent>(_onDeleteContactEvent);
  }

  final ContactsService _service;

  Future<void> _onGetAllContactsEvent(event, emit) async {
    emit(state.copyWith(isLoading: true));
    final contacts = await _service.getAllContacts();
    emit(state.copyWith(isLoading: false, state: contacts));
  }

  Future<void> _onCreateContactEvent(CreateContactEvent event, emit) async {
    await _service.createContact(event.newContactDTO);
    add(const GetAllContactsEvent());
  }

  Future<void> _onDeleteContactEvent(DeleteContactEvent event, emit) async {
    await _service.deleteContact(event.contact);
    add(const GetAllContactsEvent());
  }
}
