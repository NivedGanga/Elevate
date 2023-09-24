import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate/domain/audio/i_audio_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';

class AudioRepo extends IAudioRepo {
  @override
  Future<Either<MainFailure, String>> postAudio({required String path}) async {
    String fileName = path.split('/').last;
    Dio dio = Dio(BaseOptions());
    Response response = await dio.get(
      'https://elevate01.azurewebsites.net/content/get/stories/',
    );
    print(response);
    dio.options.headers["Content-Type"] = "multipart/form-data";
    FormData formData = FormData.fromMap({
      'audio_file': await MultipartFile.fromFile(
        path,
        filename: fileName,
      )
    });
    try {
      Response response = await dio.post(
        'https://elevate01.azurewebsites.net/content/get/stories/',
        data: formData,
      );
      print(response);
    } catch (e) {
      print(e.toString());
    }
    throw UnimplementedError();
  }
}
