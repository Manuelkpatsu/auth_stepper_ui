import 'dart:io';

import 'package:auth_ui/screen/widget/dropdown_text_field.dart';
import 'package:auth_ui/screen/widget/file_picker_modal.dart';
import 'package:auth_ui/screen/widget/label_text.dart';
import 'package:auth_ui/screen/widget/text_input_field.dart';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:auth_ui/utils/modal_bottom_sheet.dart';
import 'package:country_picker/country_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'card_type.dart';
import 'widget/document_upload.dart';
import 'widget/verify_document_info_text.dart';
import 'widget/verify_document_text.dart';

class VerifyDocumentScreen extends StatefulWidget {
  final TextEditingController idCardNumberController;
  final TextEditingController issuedByController;
  final TextEditingController issuedDateController;
  final TextEditingController expiryDateController;
  final TextEditingController selectedCardTypeController;
  final Country country;

  const VerifyDocumentScreen({
    Key? key,
    required this.idCardNumberController,
    required this.expiryDateController,
    required this.issuedDateController,
    required this.issuedByController,
    required this.country,
    required this.selectedCardTypeController,
  }) : super(key: key);

  @override
  State<VerifyDocumentScreen> createState() => _VerifyDocumentScreenState();
}

class _VerifyDocumentScreenState extends State<VerifyDocumentScreen> {
  final ImagePicker _picker = ImagePicker();
  bool _processingDocument = false;
  DateTime? _initialIssuedDate;
  DateTime? _initialExpiryDate;
  final TextEditingController _idCardCountryController = TextEditingController();
  final TextEditingController _displayIssuedDateController = TextEditingController();
  final TextEditingController _displayExpiryDateController = TextEditingController();
  CardType _selectedCardType = CardType.driver;
  bool _showBackPhotoUpload = true;
  File? _documentFrontPhoto;
  File? _documentBackPhoto;

  @override
  void initState() {
    super.initState();
    _initialIssuedDate ??= DateTime.now();
    _initialExpiryDate ??= DateTime.now();
    _idCardCountryController.text = widget.country.name;
    widget.selectedCardTypeController.text = _selectedCardType.id;
  }

  @override
  void dispose() {
    super.dispose();
    _idCardCountryController.dispose();
    _displayExpiryDateController.dispose();
    _displayIssuedDateController.dispose();
  }

  void _selectDate() async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime? picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: _initialIssuedDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 20),
      selectableDayPredicate: (DateTime value) {
        return DateTime.now().isAfter(value);
      },
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: CustomColor.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: CustomColor.primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _initialIssuedDate = picked;
        widget.issuedDateController.value = TextEditingValue(
          text: picked.toIso8601String(),
        );
        _displayIssuedDateController.value = TextEditingValue(
          text: DateFormat.yMMMMd().format(picked),
        );
      });
    }
  }

  void _selectExpiryDate() async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime? picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: _initialExpiryDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 20),
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: CustomColor.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: CustomColor.primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _initialExpiryDate = picked;
        widget.issuedDateController.value = TextEditingValue(
          text: picked.toIso8601String(),
        );
        _displayExpiryDateController.value = TextEditingValue(
          text: DateFormat.yMMMMd().format(picked),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: CustomColor.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const VerifyDocumentText(),
          const SizedBox(height: 7),
          const VerifyDocumentInfoText(),
          const SizedBox(height: 20),
          DocumentUpload(
            onPressed: () {
              _showUploadOptionModal((file) => _documentFrontPhoto = file);
            },
            title: 'Upload Front of Document',
            currentFile: _documentFrontPhoto,
            removeFile: () {
              if (_documentFrontPhoto != null) {
                setState(() {
                  _documentFrontPhoto = null;
                });
              }
            },
          ),
          Visibility(visible: _showBackPhotoUpload, child: const SizedBox(height: 20)),
          Visibility(
            visible: _showBackPhotoUpload,
            child: DocumentUpload(
              onPressed: () {
                _showUploadOptionModal((file) => _documentBackPhoto = file);
              },
              title: 'Upload Back of Document',
              currentFile: _documentBackPhoto,
              removeFile: () {
                if (_documentBackPhoto != null) {
                  setState(() {
                    _documentBackPhoto = null;
                  });
                }
              },
            ),
          ),
          _documentFrontPhoto != null || _documentBackPhoto != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const LabelText(label: 'ID Card Type'),
                    const SizedBox(height: 6),
                    DropdownTextField<CardType>(
                      items: CardType.values.map((type) {
                        return DropdownMenuItem<CardType>(
                          value: type,
                          child: Text(type.displayTitle),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCardType = value!;
                          widget.selectedCardTypeController.text = value.id;
                          if (_selectedCardType == CardType.passport) {
                              _documentBackPhoto = null;
                              _showBackPhotoUpload = false;
                          } else {
                              _showBackPhotoUpload = true;
                          }
                        });
                      },
                      value: _selectedCardType,
                      hintText: 'Your text',
                    ),
                    const SizedBox(height: 14),
                    const LabelText(label: 'ID Card Number'),
                    const SizedBox(height: 6),
                    TextInputField(
                      controller: widget.idCardNumberController,
                      hintText: 'Your Text',
                      inputAction: TextInputAction.next,
                      onChanged: (value) {},
                      validator: (value) => value == null || value.isEmpty
                          ? "ID Card Number is required"
                          : null,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 14),
                    const LabelText(label: 'ID Card Country'),
                    const SizedBox(height: 6),
                    TextInputField(
                      controller: _idCardCountryController,
                      hintText: 'Your Text',
                      enabled: false,
                      inputAction: TextInputAction.next,
                      onChanged: (value) {},
                      readOnly: true,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 14),
                    const LabelText(label: 'ID Card Issued By'),
                    const SizedBox(height: 6),
                    TextInputField(
                      controller: widget.issuedByController,
                      hintText: 'Your Text',
                      inputAction: TextInputAction.next,
                      onChanged: (value) {},
                      validator: (value) => value == null || value.isEmpty
                          ? "Issuer of card is required"
                          : null,
                    ),
                    const SizedBox(height: 14),
                    const LabelText(label: 'ID Card Issued Date'),
                    const SizedBox(height: 6),
                    TextInputField(
                      controller: _displayIssuedDateController,
                      hintText: 'Your Text',
                      inputAction: TextInputAction.next,
                      readOnly: true,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Issued date is required'
                          : null,
                      onChanged: (value) {},
                      suffixIcon: const Icon(
                        Icons.date_range_rounded,
                        color: Colors.white,
                      ),
                      onTap: () => _selectDate(),
                    ),
                    const SizedBox(height: 14),
                    const LabelText(label: 'ID Card Expiration Date'),
                    const SizedBox(height: 6),
                    TextInputField(
                      controller: _displayExpiryDateController,
                      hintText: 'Your Text',
                      inputAction: TextInputAction.done,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Expiration date is required';
                        }

                        return null;
                      },
                      onChanged: (value) {},
                      suffixIcon: const Icon(
                        Icons.date_range_rounded,
                        color: Colors.white,
                      ),
                      onTap: () => _selectExpiryDate(),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 26),
        ],
      ),
    );
  }

  void _showUploadOptionModal(void Function(File) setFile) {
    ModalBottomSheet.openModalBottomSheet(
      context: context,
      widget: IntrinsicHeight(
        child: FilePickerModal(
          onCameraTap: () {
            _getImage(ImageSource.camera, setFile);
          },
          onGalleryTap: () {
            _getImage(ImageSource.gallery, setFile);
          },
          onBrowserTap: () {
            _getFile(setFile);
          },
        ),
      ),
    );
  }

  Future<void> _getImage(ImageSource source, void Function(File) setFile) async {
    // Close the dialog
    Navigator.of(context).pop();

    /// We delay for a little bit to prevent
    /// the loader from kicking off before the
    /// image picker or the camera loads up.
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => _processingDocument = true);
    });
    XFile? pickedFile = await _picker.pickImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      int sizeInBytes = file.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > 10) {
        debugPrint("Image size shouldn't exceed 10MB.");
      } else {
        setFile(file);
      }
      setState(() => _processingDocument = false);
    } else {
      setState(() => _processingDocument = false);
    }
  }

  void _getFile(void Function(File) setFile) async {
    // Close the dialog
    Navigator.of(context).pop();

    /// We delay for a little bit to prevent
    /// the loader from kicking off before the
    /// image picker or the camera loads up.
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => _processingDocument = true);
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf'],
      type: FileType.custom,
    );

    if (result != null) {
      final file = File(result.files.single.path!);
      int sizeInBytes = file.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > 10) {
        debugPrint("Image size shouldn't exceed 10MB.");
      } else {
        setFile(file);
      }
      setState(() => _processingDocument = false);
    } else {
      setState(() => _processingDocument = false);
    }
  }
}
