import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate/domain/audio/audio_result_model/audio_result_model.dart';
import 'package:elevate/domain/audio/i_audio_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'audio_event.dart';
part 'audio_state.dart';
part 'audio_bloc.freezed.dart';

@injectable
class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final IAudioRepo _audioRepo;
  AudioBloc(this._audioRepo)
      : super(AudioState(currectedorfailure: None(), isLoading: false)) {
    //managing the state of the audio posting process
    on<_Started>((event, emit) async {
      emit(state.copyWith(currectedorfailure: none(), isLoading: true));
      final responce = await _audioRepo.postAudio(path: event.path);
      responce.fold((l) {
        emit(state.copyWith(
            currectedorfailure: some(left(l)), isLoading: false));
      }, (r) {
        emit(state.copyWith(
            currectedorfailure: some(right(r)), isLoading: false));
      });
    });
//managing the state of the audio clearing process
    on<_ClearAudio>((event, emit) {
      emit(state.copyWith(currectedorfailure: none()));
    });
  }
}
