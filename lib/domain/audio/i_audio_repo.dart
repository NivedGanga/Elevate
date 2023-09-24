import 'package:dartz/dartz.dart';
import 'package:elevate/domain/audio/audio_result_model/audio_result_model.dart';
import 'package:elevate/domain/failure/main_failure.dart';

abstract class IAudioRepo {
  Future<Either<MainFailure, AudioResultModel>> postAudio({required String path});
}
