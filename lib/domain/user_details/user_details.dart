import 'package:elevate/domain/user_details/genre.dart';

abstract class IUserDetailsRepo {
  Future<void> postUserDetails({
    required String name,
    required int age,
    required List<Genre> genrea,
  });
}
