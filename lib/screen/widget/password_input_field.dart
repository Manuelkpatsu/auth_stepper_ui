import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final String hintText;
  final bool obscureText;
  final VoidCallback? toggle;
  final void Function(String)? onChanged;

  const PasswordInputField({
    Key? key,
    required this.controller,
    this.inputType,
    this.inputAction,
    this.validator,
    required this.hintText,
    this.obscureText = true,
    this.toggle,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: Colors.white,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: CustomColor.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: CustomColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: CustomColor.btnColor),
        ),
        filled: true,
        fillColor: CustomColor.fillColor,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, color: CustomColor.hintColor),
        suffixIcon: IconButton(
          icon: obscureText
              ? const Icon(Icons.visibility_off, color: Colors.white)
              : const Icon(Icons.visibility, color: Colors.white),
          onPressed: toggle,
        ),
      ),
      obscuringCharacter: '●',
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureText,
      validator: validator,
      textCapitalization: textCapitalization,
    );
  }
}
