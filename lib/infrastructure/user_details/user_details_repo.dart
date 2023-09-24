import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/genre.dart';
import 'package:elevate/domain/user_details/i_user_details_repo.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserDetailsRepo)
class UserDetailsRepo extends IUserDetailsRepo {
  @override
  postUserDetails({
    required String name,
    required int age,
    required String email,
    required String genres,
    required String uid,
  }) async {
    try {
      print(genres);
      final data = {
        "name": name,
        "age": age,
        "email": email,
        "tags": genres,
        "user_id": uid,
      };
      final result = await Dio(BaseOptions()).post(
          "https://elevate01.azurewebsites.net/content/signup/",
          data: data);
      if (result.statusCode == 201 || result.statusCode == 200) {
        return Right(null);
      } else {
        return left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }
}
