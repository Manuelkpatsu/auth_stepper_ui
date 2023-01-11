import 'dart:io';

import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class FileThumbnailPicker extends StatelessWidget {
  final VoidCallback? onTap;
  final File? photoFile;
  final double width;
  final double height;
  final double radius;

  const FileThumbnailPicker({
    Key? key,
    required this.onTap,
    required this.photoFile,
    this.width = 100,
    this.height = 100,
    this.radius = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: width,
      width: height,
      decoration: const BoxDecoration(
        color: CustomColor.hintColor,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: photoFile == null
              ? const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                )
              : FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const ExactAssetImage(
                    'assets/images/profile-placeholder.png',
                  ),
                  image: FileImage(photoFile!),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
