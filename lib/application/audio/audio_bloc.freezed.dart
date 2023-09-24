// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) postAudio,
    required TResult Function() clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? postAudio,
    TResult? Function()? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? postAudio,
    TResult Function()? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) postAudio,
    required TResult Function(_ClearAudio value) clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? postAudio,
    TResult? Function(_ClearAudio value)? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? postAudio,
    TResult Function(_ClearAudio value)? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioEventCopyWith<$Res> {
  factory $AudioEventCopyWith(
          AudioEvent value, $Res Function(AudioEvent) then) =
      _$AudioEventCopyWithImpl<$Res, AudioEvent>;
}

/// @nodoc
class _$AudioEventCopyWithImpl<$Res, $Val extends AudioEvent>
    implements $AudioEventCopyWith<$Res> {
  _$AudioEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$_Started(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'AudioEvent.postAudio(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) postAudio,
    required TResult Function() clearState,
  }) {
    return postAudio(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? postAudio,
    TResult? Function()? clearState,
  }) {
    return postAudio?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? postAudio,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (postAudio != null) {
      return postAudio(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) postAudio,
    required TResult Function(_ClearAudio value) clearState,
  }) {
    return postAudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? postAudio,
    TResult? Function(_ClearAudio value)? clearState,
  }) {
    return postAudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? postAudio,
    TResult Function(_ClearAudio value)? clearState,
    required TResult orElse(),
  }) {
    if (postAudio != null) {
      return postAudio(this);
    }
    return orElse();
  }
}

abstract class _Started implements AudioEvent {
  const factory _Started({required final String path}) = _$_Started;

  String get path;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearAudioCopyWith<$Res> {
  factory _$$_ClearAudioCopyWith(
          _$_ClearAudio value, $Res Function(_$_ClearAudio) then) =
      __$$_ClearAudioCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearAudioCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_ClearAudio>
    implements _$$_ClearAudioCopyWith<$Res> {
  __$$_ClearAudioCopyWithImpl(
      _$_ClearAudio _value, $Res Function(_$_ClearAudio) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearAudio implements _ClearAudio {
  const _$_ClearAudio();

  @override
  String toString() {
    return 'AudioEvent.clearState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearAudio);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String path) postAudio,
    required TResult Function() clearState,
  }) {
    return clearState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String path)? postAudio,
    TResult? Function()? clearState,
  }) {
    return clearState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String path)? postAudio,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) postAudio,
    required TResult Function(_ClearAudio value) clearState,
  }) {
    return clearState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? postAudio,
    TResult? Function(_ClearAudio value)? clearState,
  }) {
    return clearState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? postAudio,
    TResult Function(_ClearAudio value)? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState(this);
    }
    return orElse();
  }
}

abstract class _ClearAudio implements AudioEvent {
  const factory _ClearAudio() = _$_ClearAudio;
}

/// @nodoc
mixin _$AudioState {
  Option<Either<MainFailure, AudioResultModel>> get currectedorfailure =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioStateCopyWith<AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res, AudioState>;
  @useResult
  $Res call(
      {Option<Either<MainFailure, AudioResultModel>> currectedorfailure,
      bool isLoading});
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res, $Val extends AudioState>
    implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currectedorfailure = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      currectedorfailure: null == currectedorfailure
          ? _value.currectedorfailure
          : currectedorfailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, AudioResultModel>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioStateCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$$_AudioStateCopyWith(
          _$_AudioState value, $Res Function(_$_AudioState) then) =
      __$$_AudioStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<MainFailure, AudioResultModel>> currectedorfailure,
      bool isLoading});
}

/// @nodoc
class __$$_AudioStateCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$_AudioState>
    implements _$$_AudioStateCopyWith<$Res> {
  __$$_AudioStateCopyWithImpl(
      _$_AudioState _value, $Res Function(_$_AudioState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currectedorfailure = null,
    Object? isLoading = null,
  }) {
    return _then(_$_AudioState(
      currectedorfailure: null == currectedorfailure
          ? _value.currectedorfailure
          : currectedorfailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, AudioResultModel>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AudioState implements _AudioState {
  const _$_AudioState(
      {required this.currectedorfailure, required this.isLoading});

  @override
  final Option<Either<MainFailure, AudioResultModel>> currectedorfailure;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AudioState(currectedorfailure: $currectedorfailure, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioState &&
            (identical(other.currectedorfailure, currectedorfailure) ||
                other.currectedorfailure == currectedorfailure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currectedorfailure, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      __$$_AudioStateCopyWithImpl<_$_AudioState>(this, _$identity);
}

abstract class _AudioState implements AudioState {
  const factory _AudioState(
      {required final Option<Either<MainFailure, AudioResultModel>>
          currectedorfailure,
      required final bool isLoading}) = _$_AudioState;

  @override
  Option<Either<MainFailure, AudioResultModel>> get currectedorfailure;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}
