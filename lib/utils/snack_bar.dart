import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void openSnackBar({
    required BuildContext context,
    required String text,
    Color backgroundColor = CustomColor.btnColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
