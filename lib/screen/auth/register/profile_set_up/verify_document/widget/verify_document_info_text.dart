import 'package:flutter/material.dart';

class VerifyDocumentInfoText extends StatelessWidget {
  const VerifyDocumentInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Upload your government issued ID (Passport, driver\'s license and ECOWAS ID)',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.28,
      ),
    );
  }
}
