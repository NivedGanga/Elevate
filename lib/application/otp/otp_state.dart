part of 'otp_bloc.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    required Option<Either<MainFailure, int>> otpFailureOrSuccess,
    required int? otp,
    required bool isVerified,
  }) = _OtpState;
}
