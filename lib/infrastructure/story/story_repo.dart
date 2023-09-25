import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/story/i_story_repo.dart';
import 'package:elevate/domain/story/model/story.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:injectable/injectable.dart';

// This annotation (if used with a dependency injection framework like GetIt)
// marks this class as a singleton that implements the IStoryRepo interface.
@LazySingleton(as: IStoryRepo)
class StoryRepo extends IStoryRepo {
  @override
  Future<Either<MainFailure, String>> getStory() async {
    try {
      // Create a data map containing the user's ID for the request.
      final data = {'user_id': UserModel.instance.uid};
      print(data);

      // Make an HTTP GET request using the Dio library.
      final Response response = await Dio(BaseOptions()).get(
        'https://elevate01.azurewebsites.net/content/get/stories/',
        data: data,
      );

      // Check if the response status code indicates success (200 or 201).
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Extract the 'message' from the response data, or use an empty string if it's not present.
        final String? msg = response.data["message"];

        // Return the message as a 'right' Either.
        return right(msg ?? "");
      } else {
        // Return a 'left' Either indicating a server failure.
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      // Return a 'left' Either indicating a client failure (e.g., network error).
      return left(const MainFailure.clientFailure());
    }
  }
}

