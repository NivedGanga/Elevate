part of 'audio_bloc.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState({
    required Option<Either<MainFailure, AudioResultModel>> currectedorfailure,
    required bool isLoading,
  }) = _AudioState;
}
