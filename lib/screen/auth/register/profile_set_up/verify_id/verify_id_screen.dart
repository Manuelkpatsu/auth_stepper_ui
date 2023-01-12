import 'dart:io';

import 'package:auth_ui/screen/widget/image_picker_modal.dart';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:auth_ui/utils/modal_bottom_sheet.dart';
import 'package:auth_ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'widget/file_thumbnail_picker.dart';
import 'widget/select_image_button.dart';
import 'widget/verify_id_info_text.dart';
import 'widget/verify_id_text.dart';

class VerifyIDScreen extends StatefulWidget {
  const VerifyIDScreen({Key? key}) : super(key: key);

  @override
  State<VerifyIDScreen> createState() => _VerifyIDScreenState();
}

class _VerifyIDScreenState extends State<VerifyIDScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _profilePhoto;
  bool _processing = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: CustomColor.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const VerifyIDText(),
          const SizedBox(height: 7),
          const VerifyIDInfoText(),
          const SizedBox(height: 26),
          Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                FileThumbnailPicker(
                  onTap: () {
                    _showImageModal();
                  },
                  photoFile: _profilePhoto,
                ),
                SelectImageButton(
                  onTap: () {
                    _showImageModal();
                  },
                ),
                Positioned(
                  right: 4,
                  bottom: 5,
                  child: Visibility(
                    visible: _processing,
                    child: const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          CustomColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _showImageModal() {
    ModalBottomSheet.openModalBottomSheet(
      context: context,
      widget: IntrinsicHeight(
        child: ImagePickerModal(
          type: PickerType.imagePicker,
          onCameraTap: () {
            _getImage(ImageSource.camera);
          },
          onGalleryTap: () {
            _getImage(ImageSource.gallery);
          },
        ),
      ),
    );
  }

  Future<void> _getImage(ImageSource source) async {
    // Close the dialog
    Navigator.of(context).pop();

    /// We delay for a little bit to prevent
    /// the loader from kicking off before the
    /// image picker or the camera loads up.
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => _processing = true);
    });
    XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      int sizeInBytes = file.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > 10) {
        CustomSnackBar.openSnackBar(
          context: context,
          text: 'File size shouldn\'t exceed 10MB.',
          backgroundColor: CustomColor.removeColor,
        );
      } else {
        setState(() {
          _profilePhoto = file;
        });
      }
      setState(() => _processing = false);
    } else {
      setState(() => _processing = false);
    }
  }
}
