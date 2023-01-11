import 'package:flutter/material.dart';

class VerifyIDInfoText extends StatelessWidget {
  const VerifyIDInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Click on the camera icon to upload your profile picture.',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.28,
      ),
    );
  }
}
