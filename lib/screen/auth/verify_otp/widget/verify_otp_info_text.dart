import 'package:flutter/material.dart';

class VerifyOTPInfoText extends StatelessWidget {
  const VerifyOTPInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'We have sent you an OTP code for verification of your email',
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
