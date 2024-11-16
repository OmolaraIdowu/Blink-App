import 'package:blink_app/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double thickness;
  final Color? color;
  final EdgeInsetsGeometry padding;

  const AppDivider({
    super.key,
    this.thickness = 1.0,
    this.color,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: padding,
        child: Divider(
          thickness: thickness,
          color: color ?? AppColors.grey400,
          height: 0,
        ),
      ),
    );
  }
}
