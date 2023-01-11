import 'package:flutter/material.dart';

class ProfileSetUpText extends StatelessWidget {
  const ProfileSetUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Profile Setup',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
