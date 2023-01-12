import 'package:auth_ui/screen/auth/verify_otp/verify_otp_argument.dart';
import 'package:auth_ui/screen/auth/verify_otp/verify_otp_screen.dart';
import 'package:auth_ui/screen/widget/label_text.dart';
import 'package:auth_ui/screen/widget/text_input_field.dart';
import 'package:auth_ui/utils/validator.dart';
import 'package:flutter/material.dart';

import 'widget/forgot_password_info_text.dart';
import 'widget/forgot_password_text.dart';
import 'widget/send_otp_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot_password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ForgotPasswordText(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _forgotPasswordFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const ForgotPasswordInfoText(),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: LabelText(label: 'Email Address'),
              ),
              const SizedBox(height: 6),
              TextInputField(
                controller: _emailController,
                hintText: 'Enter Your Email Address',
                inputAction: TextInputAction.done,
                inputType: TextInputType.emailAddress,
                validator: Validator.email,
              ),
              const SizedBox(height: 25),
              SendOTPButton(
                isLoading: false,
                onPressed: () {
                  if (_forgotPasswordFormKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed(
                      VerifyOTPScreen.routeName,
                      arguments: VerifyOTPArgument(
                        code: 1234,
                        email: _emailController.text.trim(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
