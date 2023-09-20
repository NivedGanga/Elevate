import 'package:elevate/presentation/homescreen/homescreen.dart';
import 'package:elevate/presentation/loginscreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:elevate/theme/material-theme/color_schemes.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      builder: (context, child) {
        return child!;
      },
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: LoginScreen(),
      ),
    );
  }
}
