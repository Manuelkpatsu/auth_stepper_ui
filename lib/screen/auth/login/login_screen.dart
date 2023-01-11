import 'package:auth_ui/screen/auth/forgot_password/forgot_password_screen.dart';
import 'package:auth_ui/screen/auth/register/register_screen.dart';
import 'package:auth_ui/screen/widget/label_text.dart';
import 'package:auth_ui/screen/widget/password_input_field.dart';
import 'package:auth_ui/screen/widget/text_input_field.dart';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

import 'widget/create_new_account.dart';
import 'widget/forgot_password_button.dart';
import 'widget/login_button.dart';
import 'widget/login_text.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePasswordText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const LoginText(),
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
                  inputAction: TextInputAction.done,
                  obscureText: _obscurePasswordText,
                  hintText: 'Enter Your Password',
                  toggle: () =>
                      setState(() => _obscurePasswordText = !_obscurePasswordText),
                ),
                const SizedBox(height: 10),
                ForgotPasswordButton(
                  onTap: () => Navigator.of(context).pushNamed(
                    ForgotPasswordScreen.routeName,
                  ),
                ),
                const SizedBox(height: 50),
                LoginButton(
                  isLoading: false,
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                CreateNewAccount(
                  onTap: () => Navigator.of(context).pushNamed(
                    RegisterScreen.routeName,
                  ),
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
