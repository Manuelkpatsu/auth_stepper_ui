import 'package:flutter/material.dart';

class ProfileCompleteText extends StatelessWidget {
  const ProfileCompleteText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Profile Setup Complete!',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
