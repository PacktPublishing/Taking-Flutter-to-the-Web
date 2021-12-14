import 'package:flutter/material.dart';
import 'package:flutter_academy/app/res/responsive.dart';

class ResponsiveGap extends StatelessWidget {
  const ResponsiveGap({
    Key? key,
    required this.gap,
  }) : super(key: key);

  final double gap;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > ScreenSizes.md
        ? SizedBox(width: gap)
        : SizedBox(height: gap);
  }
}
