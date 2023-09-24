part of 'otp_bloc.dart';

@freezed
class OtpEvent with _$OtpEvent {
  const factory OtpEvent.sendOtp({required String recipienEmail}) = _SendOtp;
  const factory OtpEvent.verifyOtp(
      {required String otp, required String enteredOtp}) = _VerifyOtp;
  const factory OtpEvent.resetState() = _ResetState;
}
