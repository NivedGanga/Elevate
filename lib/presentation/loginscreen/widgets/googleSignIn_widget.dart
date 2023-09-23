import 'package:elevate/infrastructure/auth/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      child: Material(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
        child: InkWell(
          borderRadius: BorderRadius.circular(50.r),
          splashFactory: InkSparkle.splashFactory, 
          splashColor: Color.fromARGB(255, 255, 193, 212),
          onTap: ()  {
            FocusScope.of(context).unfocus();
             AuthRepo().googleSignIn();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: AssetImage('assets/auth/google-logo-9808.png'),
                    ),
                  ),
                ),
                Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
