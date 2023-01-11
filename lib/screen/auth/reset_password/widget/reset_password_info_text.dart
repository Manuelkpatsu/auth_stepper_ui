import 'package:flutter/material.dart';

class ResetPasswordInfoText extends StatelessWidget {
  const ResetPasswordInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Reset your password by providing a new password',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 1.25,
        ),
      ),
    );
  }
}
