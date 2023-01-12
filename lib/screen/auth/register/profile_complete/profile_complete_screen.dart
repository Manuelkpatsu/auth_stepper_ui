import 'package:auth_ui/screen/auth/register/profile_set_up/widget/profile_set_up_text.dart';
import 'package:auth_ui/screen/widget/custom_button.dart';
import 'package:flutter/material.dart';

import 'widget/done_thumbnail.dart';
import 'widget/profile_complete_info_text.dart';
import 'widget/profile_complete_text.dart';

class ProfileCompleteScreen extends StatefulWidget {
  static const routeName = '/profile_complete';

  const ProfileCompleteScreen({Key? key}) : super(key: key);

  @override
  State<ProfileCompleteScreen> createState() => _ProfileCompleteScreenState();
}

class _ProfileCompleteScreenState extends State<ProfileCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ProfileSetUpText(),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const ProfileCompleteText(),
            const SizedBox(height: 7),
            const ProfileCompleteInfoText(),
            const SizedBox(height: 20),
            const DoneThumbnail(),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {},
              widget: Text('Done'.toUpperCase()),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
