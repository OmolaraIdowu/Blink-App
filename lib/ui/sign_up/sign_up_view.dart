import 'package:blink_app/ui/sign_in/sign_in_view.dart';
import 'package:blink_app/ui/sign_up/verify_number_view.dart';
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

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                AppTextField(
                  label: 'Password',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  obscureText: !_isPasswordVisible,
                  onPasswordToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  validator: FormValidator.validateSignupPassword,
                  controller: _passwordController,
                ),
                AppSpacing.v24(),
                AppTextField(
                  label: 'Confirm Password',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  obscureText: !_isConfirmPasswordVisible,
                  onPasswordToggle: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                  controller: _confirmPasswordController,
                ),
                AppSpacing.v24(),
                AppButton(
                  text: 'CONTINUE',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const VerifyNumberView(),
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
                AppSpacing.v22(),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SignInView(),
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
          ),
        ),
      )),
    );
  }
}
