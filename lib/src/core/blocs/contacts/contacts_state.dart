part of 'contacts_bloc.dart';

class ContactsState {
  ContactsState({
    this.isLoading = false,
    required this.state,
    this.error,
  });

  bool isLoading;
  List<ContactModel> state;
  String? error;

  ContactsState copyWith({
    bool? isLoading,
    List<ContactModel>? state,
    String? error,
  }) {
    return ContactsState(
      isLoading: isLoading ?? this.isLoading,
      state: state ?? this.state,
      error: error ?? this.error,
    );
  }
}
