import 'package:blink_app/ui/sign_in/signin_splash_view.dart';
import 'package:blink_app/ui/sign_up/sign_up_view.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_container.dart';
import 'package:blink_app/widgets/app_divider.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

class SignupSplashView extends StatelessWidget {
  const SignupSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final isSmall = height < 700 && width < 400;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppIcon(
                  icon: AppIconData.back,
                  // onTap: Navigator.of(context).pop,
                ),
              ],
            ),
            AppSpacing.v46(),
            Text(
              'Get\nStarted',
              style: AppTextStyle.bold24
                  .copyWith(fontSize: isSmall ? 36 : 42, height: 1.2),
            ),
            AppSpacing.v36(),
            AppContainer(
              text: 'Continue with Google',
              backgroundColor: AppColors.green,
              icon: const AppIcon(
                icon: AppIconData.google,
                size: 32,
              ),
              onTap: () {},
            ),
            AppSpacing.v16(),
            AppContainer(
              text: 'Continue with Apple',
              backgroundColor: AppColors.grey200,
              icon: const AppIcon(
                icon: AppIconData.apple,
                size: 32,
              ),
              onTap: () {},
            ),
            AppSpacing.v70(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'or',
                    style: AppTextStyle.regular14,
                  ),
                ),
                const AppDivider()
              ],
            ),
            AppSpacing.v36(),
            AppButton(
              text: 'SIGN UP WITH EMAIL',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SignUpView(),
                ),
              ),
            ),
            AppSpacing.v22(),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SigninSplashView(),
                ),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: AppTextStyle.regular14,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sign in',
                          style: AppTextStyle.regular14
                              .copyWith(color: AppColors.secondaryColor))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
