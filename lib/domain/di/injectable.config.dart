// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:elevate/application/audio/audio_bloc.dart' as _i17;
import 'package:elevate/application/auth/auth_bloc.dart' as _i18;
import 'package:elevate/application/otp/otp_bloc.dart' as _i13;
import 'package:elevate/application/splash/splash_bloc.dart' as _i14;
import 'package:elevate/application/story/story_bloc.dart' as _i15;
import 'package:elevate/application/user_details/user_details_bloc.dart'
    as _i16;
import 'package:elevate/domain/audio/i_audio_repo.dart' as _i3;
import 'package:elevate/domain/auth/i_auth_repo.dart' as _i5;
import 'package:elevate/domain/splash/i_splash_repo.dart' as _i7;
import 'package:elevate/domain/story/i_story_repo.dart' as _i9;
import 'package:elevate/domain/user_details/i_user_details_repo.dart' as _i11;
import 'package:elevate/infrastructure/audio/audio_repo.dart' as _i4;
import 'package:elevate/infrastructure/auth/auth_repo.dart' as _i6;
import 'package:elevate/infrastructure/splash/splash_repo.dart' as _i8;
import 'package:elevate/infrastructure/story/story_repo.dart' as _i10;
import 'package:elevate/infrastructure/user_details/user_details_repo.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IAudioRepo>(() => _i4.AudioRepo());
    gh.lazySingleton<_i5.IAuthRepo>(() => _i6.AuthRepo());
    gh.lazySingleton<_i7.ISplashRepo>(() => _i8.SplashRepo());
    gh.lazySingleton<_i9.IStoryRepo>(() => _i10.StoryRepo());
    gh.lazySingleton<_i11.IUserDetailsRepo>(() => _i12.UserDetailsRepo());
    gh.factory<_i13.OtpBloc>(() => _i13.OtpBloc(gh<_i5.IAuthRepo>()));
    gh.factory<_i14.SplashBloc>(() => _i14.SplashBloc(gh<_i7.ISplashRepo>()));
    gh.factory<_i15.StoryBloc>(() => _i15.StoryBloc(gh<_i9.IStoryRepo>()));
    gh.factory<_i16.UserDetailsBloc>(
        () => _i16.UserDetailsBloc(gh<_i11.IUserDetailsRepo>()));
    gh.factory<_i17.AudioBloc>(() => _i17.AudioBloc(gh<_i3.IAudioRepo>()));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(gh<_i5.IAuthRepo>()));
    return this;
  }
}
