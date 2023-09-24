// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recipienEmail) sendOtp,
    required TResult Function(String otp, String enteredOtp) verifyOtp,
    required TResult Function() resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipienEmail)? sendOtp,
    TResult? Function(String otp, String enteredOtp)? verifyOtp,
    TResult? Function()? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipienEmail)? sendOtp,
    TResult Function(String otp, String enteredOtp)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEventCopyWith<$Res> {
  factory $OtpEventCopyWith(OtpEvent value, $Res Function(OtpEvent) then) =
      _$OtpEventCopyWithImpl<$Res, OtpEvent>;
}

/// @nodoc
class _$OtpEventCopyWithImpl<$Res, $Val extends OtpEvent>
    implements $OtpEventCopyWith<$Res> {
  _$OtpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendOtpCopyWith<$Res> {
  factory _$$_SendOtpCopyWith(
          _$_SendOtp value, $Res Function(_$_SendOtp) then) =
      __$$_SendOtpCopyWithImpl<$Res>;
  @useResult
  $Res call({String recipienEmail});
}

/// @nodoc
class __$$_SendOtpCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$_SendOtp>
    implements _$$_SendOtpCopyWith<$Res> {
  __$$_SendOtpCopyWithImpl(_$_SendOtp _value, $Res Function(_$_SendOtp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipienEmail = null,
  }) {
    return _then(_$_SendOtp(
      recipienEmail: null == recipienEmail
          ? _value.recipienEmail
          : recipienEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendOtp implements _SendOtp {
  const _$_SendOtp({required this.recipienEmail});

  @override
  final String recipienEmail;

  @override
  String toString() {
    return 'OtpEvent.sendOtp(recipienEmail: $recipienEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendOtp &&
            (identical(other.recipienEmail, recipienEmail) ||
                other.recipienEmail == recipienEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recipienEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendOtpCopyWith<_$_SendOtp> get copyWith =>
      __$$_SendOtpCopyWithImpl<_$_SendOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recipienEmail) sendOtp,
    required TResult Function(String otp, String enteredOtp) verifyOtp,
    required TResult Function() resetState,
  }) {
    return sendOtp(recipienEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipienEmail)? sendOtp,
    TResult? Function(String otp, String enteredOtp)? verifyOtp,
    TResult? Function()? resetState,
  }) {
    return sendOtp?.call(recipienEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipienEmail)? sendOtp,
    TResult Function(String otp, String enteredOtp)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(recipienEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class _SendOtp implements OtpEvent {
  const factory _SendOtp({required final String recipienEmail}) = _$_SendOtp;

  String get recipienEmail;
  @JsonKey(ignore: true)
  _$$_SendOtpCopyWith<_$_SendOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyOtpCopyWith<$Res> {
  factory _$$_VerifyOtpCopyWith(
          _$_VerifyOtp value, $Res Function(_$_VerifyOtp) then) =
      __$$_VerifyOtpCopyWithImpl<$Res>;
  @useResult
  $Res call({String otp, String enteredOtp});
}

/// @nodoc
class __$$_VerifyOtpCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$_VerifyOtp>
    implements _$$_VerifyOtpCopyWith<$Res> {
  __$$_VerifyOtpCopyWithImpl(
      _$_VerifyOtp _value, $Res Function(_$_VerifyOtp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? enteredOtp = null,
  }) {
    return _then(_$_VerifyOtp(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      enteredOtp: null == enteredOtp
          ? _value.enteredOtp
          : enteredOtp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyOtp implements _VerifyOtp {
  const _$_VerifyOtp({required this.otp, required this.enteredOtp});

  @override
  final String otp;
  @override
  final String enteredOtp;

  @override
  String toString() {
    return 'OtpEvent.verifyOtp(otp: $otp, enteredOtp: $enteredOtp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyOtp &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.enteredOtp, enteredOtp) ||
                other.enteredOtp == enteredOtp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp, enteredOtp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyOtpCopyWith<_$_VerifyOtp> get copyWith =>
      __$$_VerifyOtpCopyWithImpl<_$_VerifyOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recipienEmail) sendOtp,
    required TResult Function(String otp, String enteredOtp) verifyOtp,
    required TResult Function() resetState,
  }) {
    return verifyOtp(otp, enteredOtp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipienEmail)? sendOtp,
    TResult? Function(String otp, String enteredOtp)? verifyOtp,
    TResult? Function()? resetState,
  }) {
    return verifyOtp?.call(otp, enteredOtp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipienEmail)? sendOtp,
    TResult Function(String otp, String enteredOtp)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(otp, enteredOtp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements OtpEvent {
  const factory _VerifyOtp(
      {required final String otp,
      required final String enteredOtp}) = _$_VerifyOtp;

  String get otp;
  String get enteredOtp;
  @JsonKey(ignore: true)
  _$$_VerifyOtpCopyWith<_$_VerifyOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetStateCopyWith<$Res> {
  factory _$$_ResetStateCopyWith(
          _$_ResetState value, $Res Function(_$_ResetState) then) =
      __$$_ResetStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetStateCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$_ResetState>
    implements _$$_ResetStateCopyWith<$Res> {
  __$$_ResetStateCopyWithImpl(
      _$_ResetState _value, $Res Function(_$_ResetState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetState implements _ResetState {
  const _$_ResetState();

  @override
  String toString() {
    return 'OtpEvent.resetState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String recipienEmail) sendOtp,
    required TResult Function(String otp, String enteredOtp) verifyOtp,
    required TResult Function() resetState,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String recipienEmail)? sendOtp,
    TResult? Function(String otp, String enteredOtp)? verifyOtp,
    TResult? Function()? resetState,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String recipienEmail)? sendOtp,
    TResult Function(String otp, String enteredOtp)? verifyOtp,
    TResult Function()? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendOtp value) sendOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResetState value) resetState,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendOtp value)? sendOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResetState value)? resetState,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendOtp value)? sendOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResetState value)? resetState,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _ResetState implements OtpEvent {
  const factory _ResetState() = _$_ResetState;
}

/// @nodoc
mixin _$OtpState {
  Option<Either<MainFailure, int>> get otpFailureOrSuccess =>
      throw _privateConstructorUsedError;
  int? get otp => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call(
      {Option<Either<MainFailure, int>> otpFailureOrSuccess,
      int? otp,
      bool isVerified});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpFailureOrSuccess = null,
    Object? otp = freezed,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      otpFailureOrSuccess: null == otpFailureOrSuccess
          ? _value.otpFailureOrSuccess
          : otpFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, int>>,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpStateCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$$_OtpStateCopyWith(
          _$_OtpState value, $Res Function(_$_OtpState) then) =
      __$$_OtpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<MainFailure, int>> otpFailureOrSuccess,
      int? otp,
      bool isVerified});
}

/// @nodoc
class __$$_OtpStateCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$_OtpState>
    implements _$$_OtpStateCopyWith<$Res> {
  __$$_OtpStateCopyWithImpl(
      _$_OtpState _value, $Res Function(_$_OtpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpFailureOrSuccess = null,
    Object? otp = freezed,
    Object? isVerified = null,
  }) {
    return _then(_$_OtpState(
      otpFailureOrSuccess: null == otpFailureOrSuccess
          ? _value.otpFailureOrSuccess
          : otpFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, int>>,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OtpState implements _OtpState {
  const _$_OtpState(
      {required this.otpFailureOrSuccess,
      required this.otp,
      required this.isVerified});

  @override
  final Option<Either<MainFailure, int>> otpFailureOrSuccess;
  @override
  final int? otp;
  @override
  final bool isVerified;

  @override
  String toString() {
    return 'OtpState(otpFailureOrSuccess: $otpFailureOrSuccess, otp: $otp, isVerified: $isVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpState &&
            (identical(other.otpFailureOrSuccess, otpFailureOrSuccess) ||
                other.otpFailureOrSuccess == otpFailureOrSuccess) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, otpFailureOrSuccess, otp, isVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpStateCopyWith<_$_OtpState> get copyWith =>
      __$$_OtpStateCopyWithImpl<_$_OtpState>(this, _$identity);
}

abstract class _OtpState implements OtpState {
  const factory _OtpState(
      {required final Option<Either<MainFailure, int>> otpFailureOrSuccess,
      required final int? otp,
      required final bool isVerified}) = _$_OtpState;

  @override
  Option<Either<MainFailure, int>> get otpFailureOrSuccess;
  @override
  int? get otp;
  @override
  bool get isVerified;
  @override
  @JsonKey(ignore: true)
  _$$_OtpStateCopyWith<_$_OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}
