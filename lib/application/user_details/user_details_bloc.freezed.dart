// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDetailsEvent {
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get genres => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailsEventCopyWith<UserDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsEventCopyWith<$Res> {
  factory $UserDetailsEventCopyWith(
          UserDetailsEvent value, $Res Function(UserDetailsEvent) then) =
      _$UserDetailsEventCopyWithImpl<$Res, UserDetailsEvent>;
  @useResult
  $Res call({String name, int age, String email, String genres, String uid});
}

/// @nodoc
class _$UserDetailsEventCopyWithImpl<$Res, $Val extends UserDetailsEvent>
    implements $UserDetailsEventCopyWith<$Res> {
  _$UserDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? email = null,
    Object? genres = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailsEventCopyWith<$Res>
    implements $UserDetailsEventCopyWith<$Res> {
  factory _$$_UserDetailsEventCopyWith(
          _$_UserDetailsEvent value, $Res Function(_$_UserDetailsEvent) then) =
      __$$_UserDetailsEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int age, String email, String genres, String uid});
}

/// @nodoc
class __$$_UserDetailsEventCopyWithImpl<$Res>
    extends _$UserDetailsEventCopyWithImpl<$Res, _$_UserDetailsEvent>
    implements _$$_UserDetailsEventCopyWith<$Res> {
  __$$_UserDetailsEventCopyWithImpl(
      _$_UserDetailsEvent _value, $Res Function(_$_UserDetailsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
    Object? email = null,
    Object? genres = null,
    Object? uid = null,
  }) {
    return _then(_$_UserDetailsEvent(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserDetailsEvent implements _UserDetailsEvent {
  const _$_UserDetailsEvent(
      {required this.name,
      required this.age,
      required this.email,
      required this.genres,
      required this.uid});

  @override
  final String name;
  @override
  final int age;
  @override
  final String email;
  @override
  final String genres;
  @override
  final String uid;

  @override
  String toString() {
    return 'UserDetailsEvent(name: $name, age: $age, email: $email, genres: $genres, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetailsEvent &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.genres, genres) || other.genres == genres) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, age, email, genres, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailsEventCopyWith<_$_UserDetailsEvent> get copyWith =>
      __$$_UserDetailsEventCopyWithImpl<_$_UserDetailsEvent>(this, _$identity);
}

abstract class _UserDetailsEvent implements UserDetailsEvent {
  const factory _UserDetailsEvent(
      {required final String name,
      required final int age,
      required final String email,
      required final String genres,
      required final String uid}) = _$_UserDetailsEvent;

  @override
  String get name;
  @override
  int get age;
  @override
  String get email;
  @override
  String get genres;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailsEventCopyWith<_$_UserDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserDetailsState {
  Option<Either<MainFailure, void>> get postFailureorSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailsStateCopyWith<UserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsStateCopyWith<$Res> {
  factory $UserDetailsStateCopyWith(
          UserDetailsState value, $Res Function(UserDetailsState) then) =
      _$UserDetailsStateCopyWithImpl<$Res, UserDetailsState>;
  @useResult
  $Res call({Option<Either<MainFailure, void>> postFailureorSuccess});
}

/// @nodoc
class _$UserDetailsStateCopyWithImpl<$Res, $Val extends UserDetailsState>
    implements $UserDetailsStateCopyWith<$Res> {
  _$UserDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postFailureorSuccess = null,
  }) {
    return _then(_value.copyWith(
      postFailureorSuccess: null == postFailureorSuccess
          ? _value.postFailureorSuccess
          : postFailureorSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailsStateCopyWith<$Res>
    implements $UserDetailsStateCopyWith<$Res> {
  factory _$$_UserDetailsStateCopyWith(
          _$_UserDetailsState value, $Res Function(_$_UserDetailsState) then) =
      __$$_UserDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Option<Either<MainFailure, void>> postFailureorSuccess});
}

/// @nodoc
class __$$_UserDetailsStateCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$_UserDetailsState>
    implements _$$_UserDetailsStateCopyWith<$Res> {
  __$$_UserDetailsStateCopyWithImpl(
      _$_UserDetailsState _value, $Res Function(_$_UserDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postFailureorSuccess = null,
  }) {
    return _then(_$_UserDetailsState(
      postFailureorSuccess: null == postFailureorSuccess
          ? _value.postFailureorSuccess
          : postFailureorSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
    ));
  }
}

/// @nodoc

class _$_UserDetailsState implements _UserDetailsState {
  const _$_UserDetailsState({required this.postFailureorSuccess});

  @override
  final Option<Either<MainFailure, void>> postFailureorSuccess;

  @override
  String toString() {
    return 'UserDetailsState(postFailureorSuccess: $postFailureorSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetailsState &&
            (identical(other.postFailureorSuccess, postFailureorSuccess) ||
                other.postFailureorSuccess == postFailureorSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postFailureorSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailsStateCopyWith<_$_UserDetailsState> get copyWith =>
      __$$_UserDetailsStateCopyWithImpl<_$_UserDetailsState>(this, _$identity);
}

abstract class _UserDetailsState implements UserDetailsState {
  const factory _UserDetailsState(
      {required final Option<Either<MainFailure, void>>
          postFailureorSuccess}) = _$_UserDetailsState;

  @override
  Option<Either<MainFailure, void>> get postFailureorSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailsStateCopyWith<_$_UserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
