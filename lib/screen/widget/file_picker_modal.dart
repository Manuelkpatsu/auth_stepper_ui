import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

import 'action_widget.dart';

class FilePickerModal extends StatelessWidget {
  final VoidCallback? onGalleryTap;
  final VoidCallback? onCameraTap;
  final VoidCallback? onBrowserTap;

  const FilePickerModal({
    Key? key,
    required this.onGalleryTap,
    required this.onCameraTap,
    required this.onBrowserTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Choose Document',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black26,
          ),
        ),
        const SizedBox(height: 20),
        ActionWidget(
          leadingIcon: Icons.camera_alt_outlined,
          title: "Take a photo",
          trailingIcon: Icons.arrow_forward_ios_rounded,
          onPressed: onCameraTap,
        ),
        const Divider(color: CustomColor.grey300Color, thickness: 1, height: 0),
        ActionWidget(
          leadingIcon: Icons.collections_outlined,
          title: "Choose from gallery",
          trailingIcon: Icons.arrow_forward_ios_rounded,
          onPressed: onGalleryTap,
        ),
        const Divider(color: CustomColor.grey300Color, thickness: 1, height: 0),
        ActionWidget(
          leadingIcon: Icons.file_copy_outlined,
          title: "Choose a PDF file",
          trailingIcon: Icons.arrow_forward_ios_rounded,
          onPressed: onBrowserTap,
        ),
        const Divider(color: CustomColor.grey300Color, thickness: 1, height: 0),
        const SizedBox(height: 30),
      ],
    );
  }
}
