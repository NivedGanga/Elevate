part of 'user_details_bloc.dart';

@freezed
class UserDetailsState with _$UserDetailsState {
  const factory UserDetailsState(
          {required Option<Either<MainFailure, void>> postFailureorSuccess}) =
      _UserDetailsState;
}
