import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:elevate/domain/auth/i_auth_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IAuthRepo)
class AuthRepo implements IAuthRepo {
  @override
  Future<Either<MainFailure, String>> signup(
      {required String email, required String password}) async {
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
      {required String email, required String password}) async {
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

  @override
  Future<Either<MainFailure, int>> sendOtp(String recipienEmail) async {
    String username = 'javalab4us@gmail.com';
    String password = 'tfgo zdke kvqm bxrq';

    String rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 6; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'ELEVATE')
      ..recipients.add(recipienEmail)
      ..subject = 'OTP for ELEVATE'
      ..html = html(rndnumber);

    try {
      var connection = PersistentConnection(smtpServer);
      await connection.send(message);

      await connection.close();
    } on MailerException catch (_) {
      return left(MainFailure.clientFailure());
    }

    return right(int.parse(rndnumber));
  }

  @override
  Future<Either<MainFailure, int>> verifyOtp(
      {required String otp, required String enteredOtp}) async {
    if (otp == enteredOtp) {
      return right(1);
    }
    return left(MainFailure.otherFailure("OTP is not correct"));
  }

  String html(String rndnumber) => '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP for ELEVATE</title>
    <style>
        /* Add attractive styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #8c74cc;
            border-radius: 10px;
          
        }

        h1 {
            color: #ffffff;
            font-size: 24px;
        }

        p {
            color: #ffffff;
            font-size: 18px;
        }

        .otp-code {
            font-size: 36px;
            font-weight: bold;
            margin: 20px 0;
            color: #FFD8E4;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>OTP for ELEVATE</h1>
        <p>Please enter the OTP in the ELEVATE app.</p>
        <p class="otp-code">${rndnumber}</p>
    </div>
</body>
</html>
''';
}
