import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class DropdownTextField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final FormFieldValidator<T?>? validator;
  final String hintText;
  final void Function(T?)? onChanged;

  const DropdownTextField({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.value,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      value: value,
      validator: validator,
      dropdownColor: CustomColor.borderColor,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      elevation: 16,
      iconSize: 20,
      icon: const Icon(Icons.keyboard_arrow_down, color: CustomColor.grey600Color),
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
      ),
    );
  }
}
