import 'package:dartz/dartz.dart';
import 'package:elevate/domain/failure/main_failure.dart';

abstract class IStoryRepo {
  Future<Either<MainFailure, String>> getStory();
}
