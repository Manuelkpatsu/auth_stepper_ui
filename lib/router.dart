import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

import 'screen/auth/login/login_screen.dart';
import 'screen/auth/register/register_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: CustomColor.primaryColor,
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        );
    }
  }
}
