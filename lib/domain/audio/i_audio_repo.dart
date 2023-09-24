import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';

abstract class IAudioRepo {
  Future<Either<MainFailure, String>> postAudio({required String path});
}
