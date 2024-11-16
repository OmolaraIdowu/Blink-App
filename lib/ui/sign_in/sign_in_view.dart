import 'package:blink_app/ui/sign_in/sign_in_view2.dart';
import 'package:blink_app/ui/sign_up/sign_up_view.dart';
import 'package:blink_app/utils/form_validator.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_divider.dart';
import 'package:blink_app/widgets/app_icon_button.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:blink_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final isSmall = height < 700 && width < 400;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppIcon(
                      icon: AppIconData.back,
                      onTap: Navigator.of(context).pop,
                    ),
                  ],
                ),
                AppSpacing.v46(),
                Text(
                  'Enter your email',
                  style: AppTextStyle.bold24.copyWith(
                    fontSize: isSmall ? 36 : 42,
                  ),
                ),
                AppSpacing.v70(),
                AppTextField(
                  label: 'Email',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidator.validateEmail,
                  controller: _emailController,
                ),
                AppSpacing.v24(),
                AppButton(
                  text: 'CONTINUE',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SignInView2(),
                    ),
                  ),
                ),
                AppSpacing.v40(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or continue with',
                        style: AppTextStyle.regular14,
                      ),
                    ),
                    const AppDivider()
                  ],
                ),
                AppSpacing.v40(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIconButton(
                      icon: AppIconData.facebook,
                      onPressed: () {},
                    ),
                    AppIconButton(
                      icon: AppIconData.google,
                      onPressed: () {},
                    ),
                    AppIconButton(
                      icon: AppIconData.apple,
                      onPressed: () {},
                    ),
                  ],
                ),
                AppSpacing.v70(),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SignUpView(),
                    ),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: AppTextStyle.regular14,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign up',
                              style: AppTextStyle.regular14
                                  .copyWith(color: AppColors.secondaryColor))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
