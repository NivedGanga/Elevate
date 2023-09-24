import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate/domain/auth/i_auth_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'otp_event.dart';
part 'otp_state.dart';
part 'otp_bloc.freezed.dart';

@injectable
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final IAuthRepo _authRepo;
  OtpBloc(this._authRepo)
      : super(OtpState(
            otpFailureOrSuccess: none(), otp: null, isVerified: false)) {
    on<_SendOtp>((event, emit) async {
      final responce = await _authRepo.sendOtp(event.recipienEmail);
      responce.fold((failure) {
        emit(state.copyWith(
          otpFailureOrSuccess: some(left(failure)),
        ));
      }, (sucess) async {
        emit(state.copyWith(
          otpFailureOrSuccess: some(right(sucess)),
          otp: sucess,
        ));
      });
    });

    on<_VerifyOtp>((event, emit) async {
      await _authRepo
          .verifyOtp(otp: event.otp, enteredOtp: event.enteredOtp)
          .then((value) {
        value.fold((failure) {
          emit(state.copyWith(otpFailureOrSuccess: some(left(failure))));
        }, (sucess) {
          emit(state.copyWith(
            otpFailureOrSuccess: some(right(sucess)),
            otp: sucess,
            isVerified: true,
          ));
        });
      });
    });
  }
}
