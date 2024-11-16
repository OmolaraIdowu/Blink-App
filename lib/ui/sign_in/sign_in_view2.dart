import 'package:blink_app/ui/sign_in/pin_view.dart';
import 'package:blink_app/ui/sign_up/sign_up_view.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_image.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:blink_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class SignInView2 extends StatefulWidget {
  const SignInView2({super.key});

  @override
  State<SignInView2> createState() => _SignInView2State();
}

class _SignInView2State extends State<SignInView2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? imageUrl;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Center(
                  child: AppImage(
                    sematicsLabel: 'Profile Picture',
                    imageUrl:
                        imageUrl ?? 'assets/images/profile_placeholder.png',
                    radius: 15,
                    width: 110,
                    height: 110,
                  ),
                ),
                AppSpacing.v12(),
                Text(
                  'Emmanuel Samuel',
                  style: AppTextStyle.bold24.copyWith(fontSize: 20),
                ),
                AppSpacing.v8(),
                Text(
                  'engr.emmysammy1234@gmail,com',
                  style: AppTextStyle.regular14,
                ),
                AppSpacing.v40(),
                AppTextField(
                  label: 'Enter Password',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                ),
                AppSpacing.v24(),
                AppButton(
                  text: 'SIGN IN',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PinView(),
                    ),
                  ),
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
