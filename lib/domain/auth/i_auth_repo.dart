import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';

abstract class IAuthRepo {
  Future<Either<MainFailure, String>> signin(String email, String password);
  Future<Either<MainFailure, bool>> logout();
  Future<Either<MainFailure, String>> signup(String email, String password);
  Future<void> registerSharedPref(String uid);
  Future<Either<MainFailure, String>> googleSignIn();
}
