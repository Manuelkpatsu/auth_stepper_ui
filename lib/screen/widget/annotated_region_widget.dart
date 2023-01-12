import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  final Widget child;

  const AnnotatedRegionWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: child,
    );
  }
}
