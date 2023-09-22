import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() = _ClientFailure;
  const factory MainFailure.serverFailure() = _ServerFailure;
  const factory MainFailure.firebaseFailure(String message) = FirebaseFailure;
  const factory MainFailure.otherFailure(String message) = _OtherFailure;
}
