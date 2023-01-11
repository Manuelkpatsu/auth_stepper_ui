import 'package:flutter/material.dart';

class BasicDetailsInfoText extends StatelessWidget {
  const BasicDetailsInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Let\'s begin with your basic details. Information given should match your legal document.',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.28,
      ),
    );
  }
}
