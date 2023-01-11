import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

import 'screen/auth/forgot_password/forgot_password_screen.dart';
import 'screen/auth/login/login_screen.dart';
import 'screen/auth/register/register_screen.dart';
import 'screen/auth/reset_password/reset_password_screen.dart';
import 'screen/auth/verify_otp/verify_otp_argument.dart';
import 'screen/auth/verify_otp/verify_otp_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case VerifyOTPScreen.routeName:
        VerifyOTPArgument argument = settings.arguments as VerifyOTPArgument;
        return MaterialPageRoute(builder: (_) => VerifyOTPScreen(argument: argument));
      case ResetPasswordScreen.routeName:
        String argument = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen(email: argument));
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
