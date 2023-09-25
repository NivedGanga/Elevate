import 'package:elevate/application/audio/audio_bloc.dart';
import 'package:elevate/application/auth/auth_bloc.dart';
import 'package:elevate/application/otp/otp_bloc.dart';
import 'package:elevate/application/splash/splash_bloc.dart';
import 'package:elevate/application/story/story_bloc.dart';
import 'package:elevate/application/user_details/user_details_bloc.dart';
import 'package:elevate/domain/di/injectable.dart';
import 'package:elevate/firebase_options.dart';
import 'package:elevate/presentation/detailsScreen/detailsScreen.dart';
import 'package:elevate/presentation/homescreen/homescreen.dart';
import 'package:elevate/presentation/loginscreen/login_screen.dart';
import 'package:elevate/presentation/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:elevate/presentation/loginscreen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:elevate/theme/material-theme/color_schemes.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  //Flutter to ensure that the Flutter framework is properly initialized before running any code
  WidgetsFlutterBinding.ensureInitialized();
  //initializing the dependency injection
  await configureInjuction();
  //initializing the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //running the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      builder: (context, child) => MultiBlocProvider(providers: [
        //providing all the blocs
        BlocProvider<SplashBloc>(
          create: (context) => getIt<SplashBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<OtpBloc>(
          create: (context) => getIt<OtpBloc>(),
        ),
        BlocProvider<StoryBloc>(
          create: (context) => getIt<StoryBloc>(),
        ),
        BlocProvider<UserDetailsBloc>(
          create: (context) => getIt<UserDetailsBloc>(),
        ),
        BlocProvider<AudioBloc>(
          create: (context) => getIt<AudioBloc>(),
        ),
      ], child: child!),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Elevate",
        initialRoute: '/',
        //light theme
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: 'Outfit',
        ),
        //dark theme
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          fontFamily: 'Outfit',
        ),
        //initializing the routes
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/signUp': (context) => SignUpScreen(),
          '/details': (context) => PersonalDetails(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
