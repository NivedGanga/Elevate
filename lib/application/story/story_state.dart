part of 'story_bloc.dart';

@freezed
class StoryState with _$StoryState {
  const factory StoryState({
    required Option<Either<MainFailure, String>> failureOrStory,
    required String? story,
    required bool isLoading,
  }) = _StoryState;
  factory StoryState.initial() =>
      StoryState(failureOrStory: none(), story: null, isLoading: true);
}
