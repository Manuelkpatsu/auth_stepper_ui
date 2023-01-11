import 'package:auth_ui/screen/auth/login/login_screen.dart';
import 'package:auth_ui/screen/widget/label_text.dart';
import 'package:auth_ui/screen/widget/password_input_field.dart';
import 'package:auth_ui/utils/validator.dart';
import 'package:flutter/material.dart';

import 'widget/reset_password_button.dart';
import 'widget/reset_password_info_text.dart';
import 'widget/reset_password_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/reset_password';

  final String email;

  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _resetPasswordFormKey = GlobalKey<FormState>();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ResetPasswordText(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _resetPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const ResetPasswordInfoText(),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: LabelText(label: 'New Password'),
              ),
              const SizedBox(height: 6),
              PasswordInputField(
                controller: _passwordController,
                inputAction: TextInputAction.next,
                obscureText: _obscurePasswordText,
                validator: Validator.password,
                hintText: 'Your Text',
                toggle: () =>
                    setState(() => _obscurePasswordText = !_obscurePasswordText),
              ),
              const SizedBox(height: 18),
              const Align(
                alignment: Alignment.centerLeft,
                child: LabelText(label: 'Confirm Password'),
              ),
              const SizedBox(height: 6),
              PasswordInputField(
                controller: _confirmPasswordController,
                inputAction: TextInputAction.done,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please confirm password';
                  }

                  if (_passwordController.text != _confirmPasswordController.text) {
                    return "Passwords do not match";
                  }

                  return null;
                },
                obscureText: _obscureConfirmPasswordText,
                hintText: 'Your Text',
                toggle: () => setState(
                    () => _obscureConfirmPasswordText = !_obscureConfirmPasswordText),
              ),
              const SizedBox(height: 25),
              ResetPasswordButton(
                onPressed: () async {
                  if (_resetPasswordFormKey.currentState!.validate()) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName,
                      (route) => false,
                    );
                  }
                },
                isLoading: false,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
