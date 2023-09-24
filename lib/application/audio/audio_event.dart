part of 'audio_bloc.dart';

@freezed
class AudioEvent with _$AudioEvent {
  const factory AudioEvent.postAudio({required String path}) = _Started;
  const factory AudioEvent.clearState() = _ClearAudio;
}
