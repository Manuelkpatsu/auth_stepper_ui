import 'package:flutter/material.dart';

class ProfileCompleteInfoText extends StatelessWidget {
  const ProfileCompleteInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Profile was setup successfully.',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.28,
      ),
    );
  }
}
