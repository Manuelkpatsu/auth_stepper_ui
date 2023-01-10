import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class CreateNewAccount extends StatelessWidget {
  final VoidCallback? onTap;

  const CreateNewAccount({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Don\'t have an account? ',
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
                'Sign up',
                style: TextStyle(
                  color: CustomColor.btnColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
