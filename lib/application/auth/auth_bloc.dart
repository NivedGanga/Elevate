import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate/domain/auth/i_auth_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthState.initial()) {
    //managing the state of the authenticaion process
    on<_SignIn>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final responce =
          await _authRepo.signin(email: event.email, password: event.password);
      await responce.fold((failure) {
        emit(state.copyWith(
          authFailureOrSuccess: some(left(failure)),
          isLoading: false,
        ));
      }, (sucess) async {
        await _authRepo.registerSharedPref(sucess);
        emit(state.copyWith(
          authFailureOrSuccess: some(right(sucess)),
          isLoading: false,
        ));
      });
    });
    //managing the state of the registration process
    on<_SignUp>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      
      final responce = await _authRepo.signup(
        email: event.email,
        password: event.password,
      );
      await responce.fold((failure) {
        emit(state.copyWith(
          authFailureOrSuccess: some(left(failure)),
          isLoading: false,
        ));
      }, (sucess) async {
        await _authRepo.registerSharedPref(sucess);
        emit(state.copyWith(
          authFailureOrSuccess: some(right(sucess)),
          isLoading: false,
        ));
      });
    });
    //managing the state of the logout process
    on<_SignOut>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final responce = await _authRepo.logout();
      await responce.fold((failure) {
        emit(state.copyWith(
          authFailureOrSuccess: some(left(failure)),
          isLoading: false,
        ));
      }, (sucess) async {
        await _authRepo.removeSharedpref();
        emit(state.copyWith(
          authFailureOrSuccess: Some(right('logout')),
          isLoading: false,
        ));
      });
    });
    //managing the state of the google signin process
    on<_GoogleSIgnIn>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final responce = await _authRepo.googleSignIn();
      await responce.fold((failure) {
        emit(state.copyWith(
          authFailureOrSuccess: some(left(failure)),
          isLoading: false,
        ));
      }, (sucess) async {
        await _authRepo.registerSharedPref(sucess);
        emit(state.copyWith(
          authFailureOrSuccess: some(right(sucess)),
          isLoading: false,
        ));
      });
    });
    //resetting the state of the auth bloc
    on<_ResetState>((event, emit) {
      emit(state.copyWith(
        authFailureOrSuccess: none(),
        isLoading: false,
      ));
    });
  }
}
