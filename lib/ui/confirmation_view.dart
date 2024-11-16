import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      alignment: Alignment.center,
                      height: 140,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const AppIcon(
                        icon: AppIconData.check,
                        size: 80,
                      ),
                    ),
                  ],
                ),
                Text('Congratulations!',
                    style: AppTextStyle.bold24.copyWith(fontSize: 22)),
                AppSpacing.v8(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Your account is ready to use. You will be redirected to the home page in a few seconds.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
