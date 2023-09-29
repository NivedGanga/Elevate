import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:elevate/domain/auth/i_auth_repo.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This annotation (if used with a dependency injection framework like GetIt)
// marks this class as a singleton that implements the IAuthRepo interface.
@LazySingleton(as: IAuthRepo)
class AuthRepo implements IAuthRepo {
  @override
  Future<Either<MainFailure, String>> signup(
      {required String email, required String password}) async {
    try {
      // Create a user account using Firebase Authentication.
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user account was created successfully.
      if (userCredential.user != null) {
        // Update UserModel with user information.
        UserModel.instance.uid = userCredential.user!.uid;
        UserModel.instance.email = userCredential.user!.email!;
        // Return the user's UID on success.
        return right(userCredential.user!.uid);
      } else {
        // Return an error indicating a failure in user registration.
        return left(
            const MainFailure.firebaseFailure('User registration failed.'));
      }
    } catch (e) {
      // Return an error indicating a Firebase-related failure.
      return left(MainFailure.firebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, bool>> logout() async {
    try {
      // Sign the user out using Firebase Authentication.
      await FirebaseAuth.instance.signOut();
      // Return 'true' on successful logout.
      return right(true);
    } catch (e) {
      // Return an error indicating a Firebase-related failure during logout.
      return left(MainFailure.firebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, String>> signin(
      {required String email, required String password}) async {
    try {
      // Sign in the user using Firebase Authentication.
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if the sign-in was successful.
      if (userCredential.user != null) {
        // Update UserModel with user information.
        UserModel.instance.uid = userCredential.user!.uid;
        // Return the user's UID on success.
        return right(userCredential.user!.uid);
      } else {
        // Return an error indicating a failure in sign-in.
        return left(MainFailure.firebaseFailure('Sign-in failed.'));
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Authentication exceptions.
      if (e.code == 'user-not-found') {
        return left(MainFailure.firebaseFailure('User not found.'));
      } else if (e.code == 'wrong-password') {
        return left(MainFailure.firebaseFailure('Incorrect password.'));
      } else {
        return left(const MainFailure.firebaseFailure('Sign-in failed'));
      }
    } catch (e) {
      // Return an error indicating a Firebase-related failure.
      return left(MainFailure.firebaseFailure("e.toString()"));
    }
  }

  @override
  Future<void> registerSharedPref(String uid) async {
    // Store the user's UID in SharedPreferences.
    final sharedPref = SharedPreferences.getInstance();
    await sharedPref.then((value) => value.setString('uid', uid));
  }

  @override
  Future<Either<MainFailure, String>> googleSignIn() async {
    try {
      final GoogleSignInAccount? _googleSIgnInAccount =
          await GoogleSignIn().signIn();
      if (_googleSIgnInAccount != null) {
        final GoogleSignInAuthentication _googleSignInAuthentication =
            await _googleSIgnInAccount.authentication;
        final OAuthCredential _credential = GoogleAuthProvider.credential(
          accessToken: _googleSignInAuthentication.accessToken,
          idToken: _googleSignInAuthentication.idToken,
        );
        if (_googleSIgnInAccount.email.isNotEmpty) {
          // Check if a user with this email exists.
          await FirebaseAuth.instance
              .fetchSignInMethodsForEmail("nivedganga@gmail.com")
              .then((value) => {
                    if (value.isEmpty)
                      {print("No user found with this email.")}
                    else
                      {print("User with this email exists.")}
                  });
          final UserCredential _userCredential =
              await FirebaseAuth.instance.signInWithCredential(_credential);
          if (_userCredential.user != null) {
            UserModel.instance.uid = _userCredential.user!.uid;
            return right(_userCredential.user!.uid);
          }
        }
      }
      return left(MainFailure.firebaseFailure('Sign-in failed.'));
    } catch (e) {
      // Return an error indicating a failure during Google sign-in.
      return left(MainFailure.firebaseFailure("Something Went wrong"));
    }
  }

  @override
  Future<Either<MainFailure, bool>> googleSignOut() async {
    try {
      // Sign out from Google using GoogleSignIn.
      await GoogleSignIn().signOut();
      // Return 'true' on successful sign-out.
      return right(true);
    } catch (e) {
      // Return an error indicating a failure during Google sign-out.
      return left(MainFailure.firebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, int>> sendOtp(String recipientEmail) async {
    String username = 'javalab4us@gmail.com';
    String password = 'tfgo zdke kvqm bxrq';

    String rndnumber = "";
    var rnd = new Random();
    for (var i = 0; i < 6; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }

    // Create an email message with OTP and send it.
    final message = Message()
      ..from = Address(username, 'ELEVATE')
      ..recipients.add(recipientEmail)
      ..subject = 'OTP for ELEVATE'
      ..html = html(rndnumber);

    try {
      // Send the email using an SMTP server.
      final smtpServer = gmail(username, password);
      var connection = PersistentConnection(smtpServer);

      await connection.send(message);
      await connection.close();
    } on MailerException catch (_) {
      // Return an error indicating a client failure during email sending.
      return left(MainFailure.clientFailure());
    }

    // Return the generated OTP as an integer.
    return right(int.parse(rndnumber));
  }

  @override
  Future<Either<MainFailure, int>> verifyOtp(
      {required String otp, required String enteredOtp}) async {
    if (int.parse(otp) == int.parse(enteredOtp)) {
      // Return the verified OTP as an integer.
      return right(int.parse(otp));
    }
    // Return an error indicating an incorrect OTP.
    return left(MainFailure.otherFailure("Incorrect OTP"));
  }

  // Helper function to generate an HTML email message.
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
</html>''';

  @override
  Future<void> removeSharedpref() async {
    // Remove the user's UID from SharedPreferences.
    final sharedPref = SharedPreferences.getInstance();
    await sharedPref.then((value) => value.remove('uid'));
    return;
  }
}
