import 'dart:io';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class CurrentFile extends StatelessWidget {
  final File file;
  final VoidCallback? onChange;
  final String tag;
  final VoidCallback? removeFile;

  const CurrentFile({
    Key? key,
    required this.file,
    required this.onChange,
    required this.tag,
    required this.removeFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        file.path.endsWith('pdf')
            ? SizedBox(
                height: 200,
                child: PDFView(
                  filePath: file.path,
                ),
              )
            : FadeInImage(
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
                placeholder: const ExactAssetImage(
                  'assets/images/profile-placeholder.png',
                  scale: 0.4,
                ),
                image: FileImage(file),
                imageErrorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Icon(
                        Icons.error,
                        size: 30,
                        color: CustomColor.removeColor,
                      ),
                    ),
                  );
                },
              ),
        Positioned(
          bottom: 10,
          right: -26,
          child: FloatingActionButton(
            backgroundColor: CustomColor.primaryColor,
            heroTag: tag,
            onPressed: onChange,
            child: const Icon(
              Icons.upload_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: -8,
          top: -8,
          child: InkWell(
            radius: 16,
            customBorder: const CircleBorder(),
            onTap: removeFile,
            child: const Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 16.0,
                backgroundColor: CustomColor.primaryColor,
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
