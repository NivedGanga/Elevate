// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:elevate/application/auth/auth_bloc.dart' as _i12;
import 'package:elevate/application/otp/otp_bloc.dart' as _i9;
import 'package:elevate/application/splash/splash_bloc.dart' as _i10;
import 'package:elevate/application/story/story_bloc.dart' as _i11;
import 'package:elevate/domain/auth/i_auth_repo.dart' as _i3;
import 'package:elevate/domain/splash/i_splash_repo.dart' as _i5;
import 'package:elevate/domain/story/i_story_repo.dart' as _i7;
import 'package:elevate/infrastructure/auth/auth_repo.dart' as _i4;
import 'package:elevate/infrastructure/splash/splash_repo.dart' as _i6;
import 'package:elevate/infrastructure/story/story_repo.dart' as _i8;
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
    gh.lazySingleton<_i3.IAuthRepo>(() => _i4.AuthRepo());
    gh.lazySingleton<_i5.ISplashRepo>(() => _i6.SplashRepo());
    gh.lazySingleton<_i7.IStoryRepo>(() => _i8.StoryRepo());
    gh.factory<_i9.OtpBloc>(() => _i9.OtpBloc(gh<_i3.IAuthRepo>()));
    gh.factory<_i10.SplashBloc>(() => _i10.SplashBloc(gh<_i5.ISplashRepo>()));
    gh.factory<_i11.StoryBloc>(() => _i11.StoryBloc(gh<_i7.IStoryRepo>()));
    gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(gh<_i3.IAuthRepo>()));
    return this;
  }
}
