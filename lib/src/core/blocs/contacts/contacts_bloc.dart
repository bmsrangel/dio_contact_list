import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../dtos/new_contact_dto.dart';
import '../../models/contact_model.dart';
import '../../repositories/contacts/contacts_repository.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

@Singleton()
class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(this._repository) : super(ContactsState(state: [])) {
    on<GetAllContactsEvent>(_onGetAllContactsEvent);
    on<CreateContactEvent>(_onCreateContactEvent);
  }

  final ContactsRepository _repository;

  Future<void> _onGetAllContactsEvent(event, emit) async {
    emit(state.copyWith(isLoading: true));
    final contacts = await _repository.findAll();
    emit(state.copyWith(isLoading: false, state: contacts));
  }

  Future<void> _onCreateContactEvent(CreateContactEvent event, emit) async {
    await _repository.insertOne(event.newContactDTO);
  }
}
