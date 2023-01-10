import 'package:auth_ui/theme/custom_theme.dart';
import 'package:flutter/material.dart';

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
      home: const LoginScreen(),
    );
  }
}
