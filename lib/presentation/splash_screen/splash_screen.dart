import 'package:elevate/application/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      context.read<SplashBloc>().add(const SplashEvent.started());
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isUserLoggedIn == true) {
            Navigator.pushNamed(context, '/home');
          } else if (state.isUserLoggedIn == false) {
            Navigator.pushNamed(context, '/login');
          }
        },
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/logo.png"),
                height: 250.h,
                width: 250.w,
              ),
              Text("Elevate",
                  style: TextStyle(
                    fontSize: 200.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
