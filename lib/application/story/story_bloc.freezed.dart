// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchStory value) fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchStory value)? fetchStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchStory value)? fetchStory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryEventCopyWith<$Res> {
  factory $StoryEventCopyWith(
          StoryEvent value, $Res Function(StoryEvent) then) =
      _$StoryEventCopyWithImpl<$Res, StoryEvent>;
}

/// @nodoc
class _$StoryEventCopyWithImpl<$Res, $Val extends StoryEvent>
    implements $StoryEventCopyWith<$Res> {
  _$StoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchStoryCopyWith<$Res> {
  factory _$$_FetchStoryCopyWith(
          _$_FetchStory value, $Res Function(_$_FetchStory) then) =
      __$$_FetchStoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchStoryCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res, _$_FetchStory>
    implements _$$_FetchStoryCopyWith<$Res> {
  __$$_FetchStoryCopyWithImpl(
      _$_FetchStory _value, $Res Function(_$_FetchStory) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchStory implements _FetchStory {
  const _$_FetchStory();

  @override
  String toString() {
    return 'StoryEvent.fetchStory()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchStory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStory,
  }) {
    return fetchStory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStory,
  }) {
    return fetchStory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStory,
    required TResult orElse(),
  }) {
    if (fetchStory != null) {
      return fetchStory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchStory value) fetchStory,
  }) {
    return fetchStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchStory value)? fetchStory,
  }) {
    return fetchStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchStory value)? fetchStory,
    required TResult orElse(),
  }) {
    if (fetchStory != null) {
      return fetchStory(this);
    }
    return orElse();
  }
}

abstract class _FetchStory implements StoryEvent {
  const factory _FetchStory() = _$_FetchStory;
}

/// @nodoc
mixin _$StoryState {
  Option<Either<MainFailure, String>> get failureOrStory =>
      throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryStateCopyWith<StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStateCopyWith<$Res> {
  factory $StoryStateCopyWith(
          StoryState value, $Res Function(StoryState) then) =
      _$StoryStateCopyWithImpl<$Res, StoryState>;
  @useResult
  $Res call(
      {Option<Either<MainFailure, String>> failureOrStory,
      String? story,
      bool isLoading});
}

/// @nodoc
class _$StoryStateCopyWithImpl<$Res, $Val extends StoryState>
    implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrStory = null,
    Object? story = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      failureOrStory: null == failureOrStory
          ? _value.failureOrStory
          : failureOrStory // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, String>>,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryStateCopyWith<$Res>
    implements $StoryStateCopyWith<$Res> {
  factory _$$_StoryStateCopyWith(
          _$_StoryState value, $Res Function(_$_StoryState) then) =
      __$$_StoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<MainFailure, String>> failureOrStory,
      String? story,
      bool isLoading});
}

/// @nodoc
class __$$_StoryStateCopyWithImpl<$Res>
    extends _$StoryStateCopyWithImpl<$Res, _$_StoryState>
    implements _$$_StoryStateCopyWith<$Res> {
  __$$_StoryStateCopyWithImpl(
      _$_StoryState _value, $Res Function(_$_StoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrStory = null,
    Object? story = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_StoryState(
      failureOrStory: null == failureOrStory
          ? _value.failureOrStory
          : failureOrStory // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, String>>,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StoryState implements _StoryState {
  const _$_StoryState(
      {required this.failureOrStory,
      required this.story,
      required this.isLoading});

  @override
  final Option<Either<MainFailure, String>> failureOrStory;
  @override
  final String? story;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'StoryState(failureOrStory: $failureOrStory, story: $story, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryState &&
            (identical(other.failureOrStory, failureOrStory) ||
                other.failureOrStory == failureOrStory) &&
            (identical(other.story, story) || other.story == story) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, failureOrStory, story, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryStateCopyWith<_$_StoryState> get copyWith =>
      __$$_StoryStateCopyWithImpl<_$_StoryState>(this, _$identity);
}

abstract class _StoryState implements StoryState {
  const factory _StoryState(
      {required final Option<Either<MainFailure, String>> failureOrStory,
      required final String? story,
      required final bool isLoading}) = _$_StoryState;

  @override
  Option<Either<MainFailure, String>> get failureOrStory;
  @override
  String? get story;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_StoryStateCopyWith<_$_StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
