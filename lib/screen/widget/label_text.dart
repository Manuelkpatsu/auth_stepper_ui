import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;

  const LabelText({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: CustomColor.hintColor, fontSize: 14),
    );
  }
}
