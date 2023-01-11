import 'package:auth_ui/screen/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordButton extends CustomButton {
  ResetPasswordButton({
    Key? key,
    required VoidCallback onPressed,
    required bool isLoading,
  }) : super(
          key: key,
          onPressed: onPressed,
          isLoading: isLoading,
          widget: Text('Reset password'.toUpperCase()),
        );
}
