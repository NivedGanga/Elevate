import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate/domain/audio/audio_result_model/audio_result_model.dart';
import 'package:elevate/domain/audio/i_audio_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAudioRepo)
// The above annotation (if used with a dependency injection framework like GetIt)
// marks this class as a singleton that implements the IAudioRepo interface.

class AudioRepo extends IAudioRepo {
  @override
  Future<Either<MainFailure, AudioResultModel>> postAudio(
      {required String path}) async {
    // Extract the file name from the provided path.
    String fileName = path.split('/').last;

    // Create a Dio instance for making HTTP requests.
    Dio dio = Dio(BaseOptions());
    dio.options.headers["Content-Type"] = "multipart/form-data";

    // Print the user ID from the UserModel instance.
    print(UserModel.instance.uid);

    // Create a FormData object for sending a multipart/form-data request.
    FormData formData = FormData.fromMap({
      'audio_file': await MultipartFile.fromFile(
        path,
        filename: fileName,
      ),
      "user_id": UserModel.instance.uid,
    });

    try {
      // Send a POST request to the specified URL with the FormData.
      final response = await dio.post(
        "https://elevate01.azurewebsites.net/content/get/stories/",
        data: formData,
      );

      // Check if the response status code indicates success (200 or 201).
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response data into an AudioResultModel.
        final AudioResultModel audioResultModel =
            AudioResultModel.fromJson(response.data);

        // Print the comparison result.
        print(audioResultModel.comparisonResult.toString());

        // Return a 'Right' Either with the parsed result.
        return Right(audioResultModel);
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
