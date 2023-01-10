import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback? onTap;

  const AlreadyHaveAccount({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Already have an account? ',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        children: [
          WidgetSpan(
            child: InkWell(
              onTap: onTap,
              child: const Text(
                'Login',
                style: TextStyle(color: CustomColor.btnColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
