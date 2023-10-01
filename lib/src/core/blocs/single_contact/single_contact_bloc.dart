import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../dtos/new_contact_dto.dart';
import '../../models/contact_model.dart';
import '../../services/contacts_service/contacts_service.dart';

part 'single_contact_event.dart';
part 'single_contact_state.dart';

@injectable
class SingleContactBloc extends Bloc<SingleContactEvent, SingleContactState> {
  SingleContactBloc(
    @factoryParam SingleContactState initialState,
    this._service,
  ) : super(initialState) {
    on<AddContactEvent>(_onAddContactEvent);
    on<GetContactByIdEvent>(_onGetContactByIdEvent);
    on<UpdateContactEvent>(_onUpdateContactEvent);
  }

  final ContactsService _service;

  Future<void> _onAddContactEvent(AddContactEvent event, emit) async {
    emit(state.copyWith(isLoading: true));
    final newContact = await _service.createContact(event.newContactDTO);
    emit(state.copyWith(isLoading: false, state: newContact));
  }

  Future<void> _onGetContactByIdEvent(GetContactByIdEvent event, emit) async {
    final contact = await _service.getContactById(event.id);
    emit(state.copyWith(isLoading: false, state: contact));
  }

  Future<void> _onUpdateContactEvent(UpdateContactEvent event, emit) async {
    await _service.updateContact(event.contactModel);
    add(GetContactByIdEvent(event.contactModel.id));
  }
}
