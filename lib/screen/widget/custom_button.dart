import 'package:flutter/material.dart';

import 'circular_button_loader.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget widget;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.widget,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading ? const CircularButtonLoader() : widget,
    );
  }
}
