import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class SelectImageButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SelectImageButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: 30,
        width: 30,
        child: RawMaterialButton(
          shape: const CircleBorder(),
          fillColor: Colors.white,
          elevation: 5,
          onPressed: onTap,
          child: const Icon(
            Icons.camera_alt,
            color: CustomColor.hintColor,
            size: 16,
          ),
        ),
      ),
    );
  }
}
