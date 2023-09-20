import 'package:bloc/bloc.dart';
import 'package:elevate/domain/splash/i_splash_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ISplashRepo _splashRepo;
  SplashBloc(this._splashRepo) : super(SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      final isUserLoggedIn = await _splashRepo.isUserLoggedIn();
      emit(SplashState(
        isUserLoggedIn: isUserLoggedIn,
      ));
    });
  }
}
