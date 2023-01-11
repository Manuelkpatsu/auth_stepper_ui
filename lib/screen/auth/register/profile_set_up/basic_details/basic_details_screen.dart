import 'package:auth_ui/screen/widget/label_text.dart';
import 'package:auth_ui/screen/widget/text_input_field.dart';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:auth_ui/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'widget/basic_details_info_text.dart';
import 'widget/basic_details_text.dart';

class BasicDetailsScreen extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final TextEditingController stateController;
  final TextEditingController addressController;
  final TextEditingController birthDateController;
  final TextEditingController fullNameController;

  const BasicDetailsScreen({
    Key? key,
    required this.phoneNumberController,
    required this.stateController,
    required this.addressController,
    required this.birthDateController,
    required this.fullNameController,
  }) : super(key: key);

  @override
  State<BasicDetailsScreen> createState() => _BasicDetailsScreenState();
}

class _BasicDetailsScreenState extends State<BasicDetailsScreen> {
  final TextEditingController _displayBirthDateController = TextEditingController();
  DateTime? _initialDate;

  @override
  void initState() {
    _initialDate ??= DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _displayBirthDateController.dispose();
  }

  void _selectDate() async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime? picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: _initialDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: CustomColor.primaryColor,
            colorScheme: const ColorScheme.light(primary: CustomColor.primaryColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _initialDate = picked;
        widget.birthDateController.value = TextEditingValue(
          text: picked.toIso8601String(),
        );
        _displayBirthDateController.value = TextEditingValue(
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
          const BasicDetailsText(),
          const SizedBox(height: 7),
          const BasicDetailsInfoText(),
          const SizedBox(height: 26),
          const Align(
            alignment: Alignment.centerLeft,
            child: LabelText(label: 'Full Name'),
          ),
          const SizedBox(height: 6),
          TextInputField(
            controller: widget.fullNameController,
            hintText: 'Enter Your Full Name',
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Full name is required';
              }

              return null;
            },
            inputAction: TextInputAction.next,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 14),
          const Align(
            alignment: Alignment.centerLeft,
            child: LabelText(label: 'Phone Number'),
          ),
          const SizedBox(height: 6),
          TextInputField(
            controller: widget.phoneNumberController,
            hintText: 'Enter Your Phone Number',
            inputAction: TextInputAction.next,
            suffixIcon: const Icon(
              CupertinoIcons.device_phone_portrait,
              color: Colors.white,
            ),
            validator: Validator.phoneNumber,
            inputType: TextInputType.phone,
          ),
          const SizedBox(height: 14),
          const Align(
            alignment: Alignment.centerLeft,
            child: LabelText(label: 'State/Region'),
          ),
          const SizedBox(height: 6),
          TextInputField(
            controller: widget.stateController,
            hintText: 'Enter Your State/Region',
            inputAction: TextInputAction.next,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 14),
          const Align(
            alignment: Alignment.centerLeft,
            child: LabelText(label: 'Address'),
          ),
          const SizedBox(height: 6),
          TextInputField(
            controller: widget.addressController,
            hintText: 'Enter Your Address',
            inputAction: TextInputAction.next,
            inputType: TextInputType.streetAddress,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Address is required';
              }

              return null;
            },
          ),
          const SizedBox(height: 14),
          const Align(
            alignment: Alignment.centerLeft,
            child: LabelText(label: 'Date of Birth'),
          ),
          const SizedBox(height: 6),
          TextInputField(
            controller: _displayBirthDateController,
            hintText: 'Enter Your Date of Birth',
            inputAction: TextInputAction.done,
            readOnly: true,
            onChanged: (value) {},
            validator: Validator.dateOfBirth,
            suffixIcon: const Icon(
              Icons.date_range_rounded,
              color: Colors.white,
            ),
            onTap: _selectDate,
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }
}
