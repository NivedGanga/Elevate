import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/genre.dart';
import 'package:elevate/domain/user_details/i_user_details_repo.dart';
import 'package:dio/dio.dart';

class UserDetailsRepo extends IUserDetailsRepo {
  @override
  postUserDetails(
      {required String name,
      required int age,
      required List<Genre> genrea}) async {
    try {
      final result = await Dio(BaseOptions()).post("path");
      if (result.statusCode == 201 || result.statusCode == 200) {
        return Right(null);
      } else {
        return left(MainFailure.serverFailure());
      }
    } catch (e) {
      return Left(MainFailure.clientFailure());
    }
  }
}
