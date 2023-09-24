import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/genre.dart';

abstract class IUserDetailsRepo {
  Future<Either<MainFailure, void>> postUserDetails({
    required String name,
    required int age,
    required List<Genre> genrea,
  });
}
