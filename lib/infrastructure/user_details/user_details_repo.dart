import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/i_user_details_repo.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// This annotation (if used with a dependency injection framework like GetIt)
// marks this class as a singleton that implements the IUserDetailsRepo interface.
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
      // Print the 'genres' parameter for debugging purposes.
      print(genres);

      // Create a data map containing user details for the request.
      final data = {
        "name": name,
        "age": age,
        "email": email,
        "tags": genres,
        "user_id": uid,
      };

      // Make an HTTP POST request using the Dio library.
      final result = await Dio(BaseOptions()).post(
          "https://elevate01.azurewebsites.net/content/signup/",
          data: data);

      // Check if the response status code indicates success (200 or 201).
      if (result.statusCode == 201 || result.statusCode == 200) {
        // Return a 'Right' Either indicating success with a null value.
        return Right(null);
      } else {
        // Return a 'Left' Either indicating a server failure.
        return Left(MainFailure.serverFailure());
      }
    } catch (e) {
      // Print any caught exceptions for debugging purposes.
      print(e.toString());

      // Return a 'Left' Either indicating a client failure (e.g., network error).
      return Left(MainFailure.clientFailure());
    }
  }
}

