import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final VoidCallback? onPressed;

  const ActionWidget({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      onTap: onPressed,
      leading: Icon(
        leadingIcon,
        color: Colors.black,
        size: 20,
      ),
      trailing: Icon(
        trailingIcon,
        color: Colors.black,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
