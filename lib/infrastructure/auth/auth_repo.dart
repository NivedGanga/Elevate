import 'package:dartz/dartz.dart';
import 'package:elevate/domain/auth/i_auth_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
        return left(
            const MainFailure.firebaseFailure('User registration failed.'));
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
  Future<Either<MainFailure, String>> signin(
      String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        return right(userCredential.user!.uid);
      } else {
        return left(MainFailure.firebaseFailure('Sign-in failed.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(MainFailure.firebaseFailure('User not found.'));
      } else if (e.code == 'wrong-password') {
        return left(MainFailure.firebaseFailure('Incorrect password.'));
      } else {
        return left(
            MainFailure.firebaseFailure('Sign-in failed: ${e.message}'));
      }
    } catch (e) {
      return left(MainFailure.firebaseFailure(e.toString()));
    }
  }

  @override
  Future<void> registerSharedPref(String uid) async {
    final sharedPref = SharedPreferences.getInstance();
    await sharedPref.then((value) => value.setString('uid', uid));
  }

  @override
  Future<Either<MainFailure, String>> googleSignIn() async {
    //   try{
    //     Googl
    //   }catch(e){

    //   }
    return right('');
  }
}
