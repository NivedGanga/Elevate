import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate/domain/audio/audio_result_model/audio_result_model.dart';
import 'package:elevate/domain/audio/i_audio_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAudioRepo)
class AudioRepo extends IAudioRepo {
  @override
  Future<Either<MainFailure, AudioResultModel>> postAudio(
      {required String path}) async {
    String fileName = path.split('/').last;
    Dio dio = Dio(BaseOptions());
    dio.options.headers["Content-Type"] = "multipart/form-data";
    print(UserModel.instance.uid);
    FormData formData = FormData.fromMap({
      'audio_file': await MultipartFile.fromFile(
        path,
        filename: fileName,
      ),
      "user_id": UserModel.instance.uid,
    });

    try {
      final response = await dio.post(
        "https://elevate01.azurewebsites.net/content/get/stories/",
        data: formData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final AudioResultModel audioResultModel =
            AudioResultModel.fromJson(response.data);
        print(audioResultModel.comparisonResult.toString());
        return Right(audioResultModel);
      } else {
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      return left(const MainFailure.clientFailure());
    }
  }
}
