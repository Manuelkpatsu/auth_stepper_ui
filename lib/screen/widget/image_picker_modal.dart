import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

import 'action_widget.dart';

enum PickerType { imagePicker, videoPicker }

class ImagePickerModal extends StatelessWidget {
  final VoidCallback? onGalleryTap;
  final VoidCallback? onCameraTap;
  final PickerType type;

  const ImagePickerModal({
    Key? key,
    required this.onGalleryTap,
    required this.onCameraTap,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          type == PickerType.imagePicker ? 'Choose Image' : 'Choose a 3-5secs short video',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black45,
          ),
        ),
        const SizedBox(height: 20),
        ActionWidget(
          leadingIcon: Icons.camera_alt_outlined,
          title: type == PickerType.imagePicker ? "Take a photo" : "Take a video",
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
        const SizedBox(height: 30),
      ],
    );
  }
}
