import 'package:flutter/material.dart';

class ForgotPasswordInfoText extends StatelessWidget {
  const ForgotPasswordInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Don\'t worry.\nEnter your email and we\'ll send an OTP code to the email',
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
