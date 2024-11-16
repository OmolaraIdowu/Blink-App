import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
    this.isLoading = false,
  });

  final String text;
  final Color backgroundColor;
  final Widget icon;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
          child: isLoading
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Row(
                  children: [
                    icon,
                    AppSpacing.h32(),
                    Text(
                      text,
                      style: AppTextStyle.regular16,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
