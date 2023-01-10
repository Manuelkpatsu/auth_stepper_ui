import 'package:flutter/material.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
