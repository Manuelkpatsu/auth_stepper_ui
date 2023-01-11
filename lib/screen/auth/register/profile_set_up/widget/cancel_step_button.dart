import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class CancelStepButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CancelStepButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Cancel',
        style: TextStyle(
          color: CustomColor.yellowColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
