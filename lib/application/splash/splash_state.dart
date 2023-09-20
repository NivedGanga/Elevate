part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    required bool? isUserLoggedIn,
  }) = _SplashState;
  factory SplashState.initial() => SplashState(
        isUserLoggedIn: null,
      );
}
