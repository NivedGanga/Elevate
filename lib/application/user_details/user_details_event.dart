part of 'user_details_bloc.dart';

@freezed
class UserDetailsEvent with _$UserDetailsEvent {
  const factory UserDetailsEvent({
    required String name,
    required int age,
    required String email,
    required String genres,
    required String uid,
  }) = _UserDetailsEvent;
}
