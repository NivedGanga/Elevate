part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
          {required Option<Either<MainFailure, String>> authFailureOrSuccess,required bool isLoading}) =
      _AuthState;
  factory AuthState.initial() => AuthState(
        authFailureOrSuccess: none(),
        isLoading: false,
      );
}
