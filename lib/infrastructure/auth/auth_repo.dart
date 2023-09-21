import 'package:dartz/dartz.dart';
import 'package:elevate/domain/auth/i_auth_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo implements IAuthRepo {
  @override
  Future<Either<MainFailure, String>> signup(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return right(userCredential.user!.uid);
      } else {
        return left(MainFailure.firebaseFailure('User registration failed.'));
      }
    } catch (e) {
      return left(MainFailure.firebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, bool>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return right(true);
    } catch (e) {
      return left(MainFailure.firebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, String>> signin(String email, String password) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> registerSharedPref(String uid) async {}

  @override
  Future<Either<MainFailure, String>> googleSignIn() async {
    //   try{
    //     Googl
    //   }catch(e){

    //   }
    return right('');
  }
}
