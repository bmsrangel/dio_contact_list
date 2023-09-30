part of 'single_contact_bloc.dart';

class SingleContactState {
  SingleContactState({
    this.isLoading = false,
    this.state,
    this.error,
  });

  final bool isLoading;
  final ContactModel? state;
  final String? error;

  SingleContactState copyWith({
    bool? isLoading,
    ContactModel? state,
    String? error,
  }) {
    return SingleContactState(
      isLoading: isLoading ?? this.isLoading,
      state: state ?? this.state,
      error: error ?? this.error,
    );
  }
}
