import 'package:flutter/material.dart';

class DoneThumbnail extends StatelessWidget {
  const DoneThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/profile-done.png',
      width: MediaQuery.of(context).size.width,
      height: 326,
      fit: BoxFit.contain,
    );
  }
}
