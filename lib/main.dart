import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:auth_ui/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'router.dart';
import 'screen/auth/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.theme,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: CustomColor.primaryColor,
        splashIconSize: 150,
      ),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
