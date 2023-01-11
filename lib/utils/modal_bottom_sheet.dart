import 'package:flutter/material.dart';

class ModalBottomSheet {
  static void openModalBottomSheet({
    required BuildContext context,
    required Widget widget,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }
}
