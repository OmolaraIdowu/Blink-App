import 'package:blink_app/ui/confirmation_view.dart';
import 'package:blink_app/utils/form_validator.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_pin_view.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';

class CreatePinView extends StatefulWidget {
  const CreatePinView({super.key});

  @override
  State<CreatePinView> createState() => _CreatePinViewState();
}

class _CreatePinViewState extends State<CreatePinView> {
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
                    'Create your\nPIN',
                    style: AppTextStyle.bold24
                        .copyWith(fontSize: isSmall ? 36 : 42, height: 1.2),
                  ),
                  Text(
                    'Add a PIN to make your account more \nsecured and easy to sign in.',
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
                        validator: FormValidator.validatePin,
                        controller: _pinController1,
                      ),
                      AppSpacing.h12(),
                      AppPinView(
                        isPin: true,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        validator: FormValidator.validatePin,
                        controller: _pinController2,
                      ),
                      AppSpacing.h12(),
                      AppPinView(
                        isPin: true,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        validator: FormValidator.validatePin,
                        controller: _pinController3,
                      ),
                      AppSpacing.h12(),
                      AppPinView(
                        isPin: true,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        validator: FormValidator.validatePin,
                        controller: _pinController4,
                      ),
                    ],
                  ),
                  AppSpacing.v36(),
                  AppButton(
                    text: 'SUBMIT',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ConfirmationView(),
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
