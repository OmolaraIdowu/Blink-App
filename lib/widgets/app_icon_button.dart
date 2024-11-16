import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      this.onPressed,
      this.isLoading = false,
      required this.icon,
      this.height,
      this.width});

  final VoidCallback? onPressed;
  final bool isLoading;
  final String icon;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 58,
      width: width ?? 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: AppColors.grey200, width: 0),
          backgroundColor: Colors.white,
          shadowColor: AppColors.grey400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : AppIcon(icon: icon),
      ),
    );
  }
}
