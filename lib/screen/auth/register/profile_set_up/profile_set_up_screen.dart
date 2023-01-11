import 'package:auth_ui/screen/widget/custom_button.dart';
import 'package:auth_ui/screen/widget/custom_stepper.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'basic_details/basic_details_screen.dart';
import 'profile_set_up_argument.dart';
import 'verify_document/verify_document_screen.dart';
import 'verify_id/verify_id_screen.dart';
import 'widget/cancel_step_button.dart';
import 'widget/profile_set_up_text.dart';

class ProfileSetUpScreen extends StatefulWidget {
  static const routeName = '/profile_set_up';

  final ProfileSetupArgument argument;

  const ProfileSetUpScreen({Key? key, required this.argument}) : super(key: key);

  @override
  State<ProfileSetUpScreen> createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  int _currentStep = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _idCardNumberController = TextEditingController();
  final TextEditingController _issuedByController = TextEditingController();
  final TextEditingController _issuedDateController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _selectedCardTypeController = TextEditingController();
  final Country _country = Country.parse('GH');

  @override
  Widget build(BuildContext context) {
    final List<CustomStep> steps = [
      CustomStep(
        isActive: _currentStep > 0,
        isCurrentIndex: _currentStep == 0,
        content: Form(
          key: _formKeys[0],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: BasicDetailsScreen(
            phoneNumberController: _phoneNumberController,
            addressController: _addressController,
            stateController: _stateController,
            birthDateController: _birthDateController,
            fullNameController: _fullNameController,
          ),
        ),
        label: const Text('Basics'),
        state: _currentStep > 0
            ? CustomStepState.complete
            : _currentStep == 0
                ? CustomStepState.editing
                : CustomStepState.indexed,
      ),
      CustomStep(
        isActive: _currentStep > 1,
        isCurrentIndex: _currentStep == 1,
        content: Form(
          key: _formKeys[1],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: const VerifyIDScreen(),
        ),
        label: const Text('Level 2'),
        state: _currentStep > 1
            ? CustomStepState.complete
            : _currentStep == 1
                ? CustomStepState.editing
                : CustomStepState.indexed,
      ),
      CustomStep(
        isActive: _currentStep >= 2,
        content: Form(
          key: _formKeys[2],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: VerifyDocumentScreen(
            idCardNumberController: _idCardNumberController,
            issuedByController: _issuedByController,
            expiryDateController: _expiryDateController,
            issuedDateController: _issuedDateController,
            selectedCardTypeController: _selectedCardTypeController,
            country: _country,
          ),
        ),
        label: const Text('Level 3'),
        state: _currentStep == 2 ? CustomStepState.complete : CustomStepState.indexed,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const ProfileSetUpText(),
        centerTitle: true,
        actions: [
          Visibility(
            visible: _currentStep != 0,
            child: CancelStepButton(
              onPressed: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep = _currentStep - 1;
                  } else {
                    _currentStep = 0;
                  }
                });
              },
            ),
          ),
        ],
      ),
      body: CustomStepper(
        elevation: 0,
        type: CustomStepperType.horizontal,
        currentStep: _currentStep,
        onStepCancel: null,
        onStepContinue: () async {
          if (_formKeys[_currentStep].currentState!.validate()) {
            setState(() {
              if (_currentStep < steps.length - 1) {
                _currentStep = _currentStep + 1;
              } else {
                _currentStep = 0;
              }
            });
          }
        },
        onStepTapped: (step) {
          setState(() {
            if (_formKeys[_currentStep].currentState!.validate()) {
              _currentStep = step;
            }
          });
        },
        steps: steps,
        controlsBuilder: (BuildContext context, CustomControlsDetails controls) {
          final isLastStep = _currentStep == steps.length - 1;

          return isLastStep
              ? CustomButton(
                  onPressed: () {},
                  widget: Text('Sign up'.toUpperCase()),
                  isLoading: false,
                )
              : CustomButton(
                  onPressed: controls.onStepContinue,
                  widget: Text('Proceed'.toUpperCase()),
                  isLoading: false,
                );
        },
      ),
    );
  }
}
