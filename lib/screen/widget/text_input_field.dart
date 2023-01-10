import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;

  const TextInputField({
    Key? key,
    required this.controller,
    this.inputType,
    this.inputAction,
    this.validator,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.maxLines,
    this.inputFormatters,
    this.autofillHints,
    this.onTap,
    this.onSaved,
    this.autofocus = false,
    this.contentPadding,
    this.enabled,
    this.readOnly = false,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      cursorColor: Colors.white,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      onTap: onTap,
      onSaved: onSaved,
      enabled: enabled,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: contentPadding,
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
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: validator,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
    );
  }
}
