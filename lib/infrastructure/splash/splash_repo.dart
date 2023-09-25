import 'package:elevate/domain/splash/i_splash_repo.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This annotation (if used with a dependency injection framework like GetIt)
// marks this class as a singleton that implements the ISplashRepo interface.
@LazySingleton(as: ISplashRepo)
class SplashRepo extends ISplashRepo {
  @override
  Future<bool> isUserLoggedIn() async {
    // Get an instance of SharedPreferences to check if the user is logged in.
    final sharedPref = await SharedPreferences.getInstance();

    // Retrieve the user's UID from SharedPreferences.
    final isUserLoggedIn = sharedPref.getString('uid');

    // Check if a user UID is found in SharedPreferences.
    if (isUserLoggedIn != null) {
      // Update UserModel with the user's UID.
      UserModel.instance.uid = isUserLoggedIn;
      print(UserModel.instance.uid);
      // Return 'true' to indicate that the user is logged in.
      return true;
    } else {
      // Return 'false' to indicate that the user is not logged in.
      return false;
    }
  }
}
