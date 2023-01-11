import 'package:flutter/material.dart';

class ReceiveCodeText extends StatelessWidget {
  const ReceiveCodeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Didn\'t receive the code?',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
