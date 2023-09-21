import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';

abstract class IAuthRepo {
  Future<Either<MainFailure, String>> signin({required String email,required String password});
  Future<Either<MainFailure, bool>> logout();
  Future<Either<MainFailure, String>> signup({required String email,required String password});
  Future<void> registerSharedPref(String uid);
  Future<Either<MainFailure, String>> googleSignIn();
  Future<Either<MainFailure, int>> sendOtp(String recipienEmail);
  Future<Either<MainFailure, int>> verifyOtp({required String otp,required String enteredOtp});
}
