import 'package:elevate/application/auth/auth_bloc.dart';
import 'package:elevate/infrastructure/auth/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.authFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {},
            (sucess) {
              if (sucess == "logout") {
                context.read<AuthBloc>().add(
                      AuthEvent.resetState(),
                    );
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (route) => false);
              }
            },
          ),
        );
      },
      child: Transform.translate(
        offset: Offset(50.w, 0),
        child: PopupMenuButton<int>(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 0,
                child: Center(
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 16),
                  ),
                ),
              )
            ];
          },
          onSelected: (value) {
            showDialog(
              context: context,
              builder: (context) => SizedBox(
                width: 200,
                height: 30,
                child: AlertDialog(
                  title: Column(
                    children: [
                      Text(
                        'Do you want to sign out?',
                        style: TextStyle(
                            decoration: TextDecoration.none, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    AuthEvent.signOut(),
                                  );
                              AuthRepo().googleSignOut();

                              Navigator.pop(context);
                            },
                            child: Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
