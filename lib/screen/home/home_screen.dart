import 'package:auth_ui/screen/auth/login/login_screen.dart';
import 'package:auth_ui/theme/custom_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.scaffoldColor,
      appBar: AppBar(
        toolbarHeight: 100,
        title: const SizedBox(
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile-image.png"),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginScreen.routeName,
                (route) => false,
              );
            },
            splashRadius: 20,
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome',
          style: TextStyle(
            fontSize: 20,
            color: CustomColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
