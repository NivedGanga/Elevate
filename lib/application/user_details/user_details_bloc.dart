import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/genre.dart';
import 'package:elevate/domain/user_details/i_user_details_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';
part 'user_details_bloc.freezed.dart';

@injectable
class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final IUserDetailsRepo _userDetailsRepo;
  UserDetailsBloc(this._userDetailsRepo)
      : super(UserDetailsState(postFailureorSuccess: none())) {
    on<_UserDetailsEvent>((event, emit) async {
      final responce = await _userDetailsRepo.postUserDetails(
          name: event.name,
          age: event.age,
          email: event.email,
          genres: event.genres,
          uid: event.uid);
      responce.fold((l) {
        emit(state.copyWith(postFailureorSuccess: some(left(l))));
      }, (r) {
        emit(state.copyWith(postFailureorSuccess: some(right(r))));
      });
    });
  }
}
