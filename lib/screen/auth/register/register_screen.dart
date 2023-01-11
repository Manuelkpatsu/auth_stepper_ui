import 'package:auth_ui/screen/auth/login/login_screen.dart';
import 'package:auth_ui/screen/widget/label_text.dart';
import 'package:auth_ui/screen/widget/password_input_field.dart';
import 'package:auth_ui/screen/widget/text_input_field.dart';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

import 'widget/already_have_account.dart';
import 'widget/create_account_text.dart';
import 'widget/register_button.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _registerFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const CreateAccountText(),
                const SizedBox(height: 80),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: LabelText(label: 'Email Address'),
                ),
                const SizedBox(height: 6),
                TextInputField(
                  controller: _emailController,
                  hintText: 'Enter Your Email Address',
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: LabelText(label: 'Password'),
                ),
                const SizedBox(height: 6),
                PasswordInputField(
                  controller: _passwordController,
                  inputAction: TextInputAction.next,
                  obscureText: _obscurePasswordText,
                  hintText: 'Enter Your Password',
                  toggle: () =>
                      setState(() => _obscurePasswordText = !_obscurePasswordText),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: LabelText(label: 'Confirm Password'),
                ),
                const SizedBox(height: 6),
                PasswordInputField(
                  controller: _confirmPasswordController,
                  inputAction: TextInputAction.done,
                  obscureText: _obscureConfirmPasswordText,
                  hintText: 'Confirm Your Password',
                  toggle: () => setState(
                      () => _obscureConfirmPasswordText = !_obscureConfirmPasswordText),
                ),
                const SizedBox(height: 50),
                RegisterButton(
                  isLoading: false,
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                AlreadyHaveAccount(
                  onTap: () => Navigator.of(context).pushNamed(LoginScreen.routeName),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
