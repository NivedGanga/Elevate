import 'package:elevate/domain/splash/i_splash_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ISplashRepo)
class SplashRepo extends ISplashRepo {
  @override
  Future<bool> isUserLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    final isUserLoggedIn = sharedPref.getString('UserToken');
    if (isUserLoggedIn != null) {
      return true;
    } else {
      return false;
    }
  }
}
