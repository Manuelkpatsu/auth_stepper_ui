import 'dart:async';

import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'verify_otp_argument.dart';
import 'widget/receive_code_text.dart';
import 'widget/verify_otp_button.dart';
import 'widget/verify_otp_info_text.dart';
import 'widget/verify_otp_text.dart';

class VerifyOTPScreen extends StatefulWidget {
  static const routeName = '/verify_otp';

  final VerifyOTPArgument argument;

  const VerifyOTPScreen({Key? key, required this.argument}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _code = 0;
  late Timer _timer;
  int _start = 15;

  @override
  void initState() {
    super.initState();
    setState(() => _code = widget.argument.code);
    _startTimer();
  }

  // For setting the timer
  void _startTimer() {
    _start = 15;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void _verifyOTP(String inputCode, int sentCode) async {
    // final result = await context.read<AuthVM>().verifyOTP(
    //   inputCode: int.parse(inputCode.trim()),
    //   sentCode: sentCode,
    // );
    // if (result) {
    //   Navigator.of(context).pushNamed(
    //     ResetPasswordScreen.routeName,
    //     args: widget.argument.email,
    //   );
    //   _formKey.currentState!.reset();
    // } else {
    //   router.Router.scaffoldMessengerKey.currentState!.showSnackBar(
    //     AppSnackBar(
    //       'Sorry, the code is incorrect. Kindly check the code.',
    //       type: SnackType.error,
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const VerifyOTPText(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 60),
              const VerifyOTPInfoText(),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: PinCodeTextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  appContext: context,
                  length: 4,
                  cursorColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    borderWidth: 1,
                    fieldHeight: 65,
                    fieldWidth: 65,
                    activeColor: CustomColor.btnColor,
                    selectedColor: CustomColor.btnColor,
                    inactiveColor: CustomColor.borderColor,
                    inactiveFillColor: CustomColor.fillColor,
                  ),
                  animationType: AnimationType.fade,
                  errorTextSpace: 20,
                  onChanged: (code) {},
                ),
              ),
              const SizedBox(height: 25),
              VerifyOTPButton(
                isLoading: false,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _verifyOTP(_otpController.text, _code);
                  }
                },
              ),
              const SizedBox(height: 25),
              const ReceiveCodeText(),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: _start < 1
                      ? 'Resend code'
                      : 'Resend code in 0:${_start.toString().padLeft(2, '0')}',
                  style: TextStyle(
                      color:
                      _start < 1 ? CustomColor.btnColor : CustomColor.redColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (_start > 0) {
                        return;
                      }
                      _startTimer();
                      setState(() => _code = 2222);
                    },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
