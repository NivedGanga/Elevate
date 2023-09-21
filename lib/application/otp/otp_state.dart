part of 'otp_bloc.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    required Option<Either<MainFailure, int>> otpFailureOrSuccess,
  }) = _OtpState;
  const factory OtpState.initial() = _Initial;
}
