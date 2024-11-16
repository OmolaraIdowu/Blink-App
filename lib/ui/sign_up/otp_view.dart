import 'package:blink_app/ui/sign_up/setup_account_view.dart';
import 'package:blink_app/utils/form_validator.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_pin_view.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_colors.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController1 = TextEditingController();
  final TextEditingController _pinController2 = TextEditingController();
  final TextEditingController _pinController3 = TextEditingController();
  final TextEditingController _pinController4 = TextEditingController();

  @override
  void dispose() {
    _pinController1.dispose();
    _pinController2.dispose();
    _pinController3.dispose();
    _pinController4.dispose();
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
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
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
                  'Input the\nOTP',
                  style: AppTextStyle.bold24
                      .copyWith(fontSize: isSmall ? 36 : 42, height: 1.2),
                ),
                Text(
                  'Kindly input 4-digit code that was sent to \n+234 904 50 ******',
                  style: AppTextStyle.regular14
                      .copyWith(fontSize: isSmall ? 12 : 14, height: 1.2),
                ),
                AppSpacing.v70(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppPinView(
                      controller: _pinController1,
                      textInputAction: TextInputAction.next,
                      validator: FormValidator.validatePin,
                    ),
                    AppSpacing.h12(),
                    AppPinView(
                      controller: _pinController2,
                      textInputAction: TextInputAction.next,
                      validator: FormValidator.validatePin,
                    ),
                    AppSpacing.h12(),
                    AppPinView(
                      controller: _pinController2,
                      textInputAction: TextInputAction.next,
                      validator: FormValidator.validatePin,
                    ),
                    AppSpacing.h12(),
                    AppPinView(
                      controller: _pinController4,
                      textInputAction: TextInputAction.done,
                      validator: FormValidator.validatePin,
                    ),
                  ],
                ),
                AppSpacing.v36(),
                AppButton(
                  text: 'SUBMIT',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SetupAccountView(),
                    ),
                  ),
                ),
                AppSpacing.v30(),
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Didn\'t get OTP? ',
                        style: AppTextStyle.regular14,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Resend',
                            style: AppTextStyle.regular14
                                .copyWith(color: AppColors.secondaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                AppSpacing.v8(),
                GestureDetector(
                  onTap: () {},
                  child: Center(
                      child: Text(
                    'Change Number',
                    style: AppTextStyle.regular14
                        .copyWith(color: AppColors.secondaryColor),
                  )),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
