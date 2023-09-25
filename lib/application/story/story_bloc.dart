import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/story/i_story_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'story_event.dart';
part 'story_state.dart';
part 'story_bloc.freezed.dart';

@injectable
class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final IStoryRepo _storyRepo;
  StoryBloc(this._storyRepo) : super(StoryState.initial()) {
    //managing the state of the story fetching process
    on<_FetchStory>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final responce = await _storyRepo.getStory();
      responce.fold((l) {
        emit(state.copyWith(isLoading: false, failureOrStory: some(left(l))));
      }, (r) {
        emit(state.copyWith(
            isLoading: false, failureOrStory: some(right(r)), story: r));
      });
    });
  }
}
