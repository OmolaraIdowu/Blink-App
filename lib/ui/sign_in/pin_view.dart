import 'package:blink_app/utils/form_validator.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_pin_view.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_colors.dart';

class PinView extends StatefulWidget {
  const PinView({super.key});

  @override
  State<PinView> createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    'Enter PIN',
                    style: AppTextStyle.bold24
                        .copyWith(fontSize: isSmall ? 36 : 42),
                  ),
                  Text(
                    'Enter your PIN to log into your account.',
                    style: AppTextStyle.regular14
                        .copyWith(fontSize: isSmall ? 12 : 14, height: 1.2),
                  ),
                  AppSpacing.v70(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppPinView(
                        isPin: true,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        controller: _pinController1,
                        validator: FormValidator.validatePin,
                      ),
                      AppSpacing.h12(),
                      AppPinView(
                        isPin: true,
                        obscureText: true,
                        controller: _pinController2,
                        textInputAction: TextInputAction.next,
                        validator: FormValidator.validatePin,
                      ),
                      AppSpacing.h12(),
                      AppPinView(
                        isPin: true,
                        obscureText: true,
                        controller: _pinController3,
                        textInputAction: TextInputAction.next,
                        validator: FormValidator.validatePin,
                      ),
                      AppSpacing.h12(),
                      AppPinView(
                        textInputAction: TextInputAction.done,
                        isPin: true,
                        obscureText: true,
                        controller: _pinController4,
                        validator: FormValidator.validatePin,
                      ),
                    ],
                  ),
                  AppSpacing.v36(),
                  AppButton(text: 'LOGIN', onPressed: () {}),
                  AppSpacing.v30(),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Forget PIN? ',
                          style: AppTextStyle.regular14,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Reset',
                              style: AppTextStyle.regular14
                                  .copyWith(color: AppColors.secondaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      )),
    );
  }
}
