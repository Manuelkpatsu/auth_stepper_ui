import 'package:flutter/material.dart';

class VerifyIDText extends StatelessWidget {
  const VerifyIDText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Profile Picture and ID verification',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
