import 'package:blink_app/ui/sign_up/otp_view.dart';
import 'package:blink_app/utils/form_validator.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_dropdown.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:blink_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class VerifyNumberView extends StatefulWidget {
  const VerifyNumberView({super.key});

  @override
  State<VerifyNumberView> createState() => _VerifyNumberViewState();
}

class _VerifyNumberViewState extends State<VerifyNumberView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  String selectedCountryCode = '+234';

  // sample codes
  var countryCodes = [
    '+234',
    '+1',
    '+44',
    '+91',
    '+77',
  ];

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
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                'Verify Phone\nNumber',
                style: AppTextStyle.bold24
                    .copyWith(fontSize: isSmall ? 36 : 42, height: 1.2),
              ),
              Text(
                'Let\'s verify your number.',
                style: AppTextStyle.regular14
                    .copyWith(fontSize: isSmall ? 12 : 14),
              ),
              AppSpacing.v70(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: AppTextField(
                  label: 'Phone Number',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    FormValidator.validatePhoneNumber(
                      value,
                      selectedCountryCode,
                    );
                  },
                  controller: _phoneNumberController,
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: AppDropdown(
                      value: selectedCountryCode,
                      items: countryCodes
                          .map((codes) => DropdownMenuItem(
                                value: codes,
                                child: Text(codes),
                              ))
                          .toList(),
                      onChanged: (selectedCountry) {
                        if (selectedCountry != null) {
                          setState(() {
                            selectedCountryCode = selectedCountry;
                          });
                        }
                      },
                      underline: const SizedBox(),
                    ),
                  ),
                ),
              ),
              AppSpacing.v24(),
              AppButton(
                text: 'REQUEST OTP',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const OtpView(),
                  ),
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }
}
