part of 'story_bloc.dart';

@freezed
class StoryEvent with _$StoryEvent {
  const factory StoryEvent.fetchStory() = _FetchStory;
}
