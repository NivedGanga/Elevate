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
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isUserLoggedIn == true) {
            Navigator.pushNamed(context, '/home');
          } else if (state.isUserLoggedIn == false) {
            Navigator.pushNamed(context, '/login');
          }
        },
        child: Center(
          child: Text(
            "Elevate",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
