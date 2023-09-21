import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate/domain/auth/i_auth_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_event.dart';
part 'otp_state.dart';
part 'otp_bloc.freezed.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final IAuthRepo _authRepo;
  OtpBloc(this._authRepo) : super(_Initial()) {
    on<_SendOtp>((event, emit) {
      _authRepo.sendOtp(event.recipienEmail).then((value) {
        value.fold((failure) {
          emit(OtpState(otpFailureOrSuccess: some(left(failure))));
        }, (sucess) {
          emit(OtpState(
            otpFailureOrSuccess: some(right(sucess)),
          ));
        });
      });
    });
    on<_VerifyOtp>((event, emit) {
      _authRepo.verifyOtp(otp: event.otp, enteredOtp: event.enteredOtp).then((value) {
        value.fold((failure) {
          emit(OtpState(otpFailureOrSuccess: some(left(failure))));
        }, (sucess) {
          emit(OtpState(
            otpFailureOrSuccess: some(right(sucess)),
          ));
        });
      });
    });
  }
}
