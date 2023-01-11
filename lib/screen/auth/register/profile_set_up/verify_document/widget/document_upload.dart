import 'dart:io';

import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

import 'current_file.dart';

class DocumentUpload extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final File? currentFile;
  final VoidCallback? removeFile;

  const DocumentUpload({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.currentFile,
    required this.removeFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.28,
            color: CustomColor.grey600Color,
          ),
        ),
        const SizedBox(height: 10),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onPressed,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CustomColor.grey200Color,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: currentFile != null
                  ? CurrentFile(
                      file: currentFile!,
                      tag: title,
                      onChange: onPressed,
                      removeFile: removeFile,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            fontSize: 14,
                            color: CustomColor.grey600Color,
                          ),
                        ),
                        const Icon(
                          Icons.upload_rounded,
                          size: 70,
                          color: CustomColor.grey600Color,
                        )
                      ],
                    ),
            ),
          ),
        )
      ],
    );
  }
}
