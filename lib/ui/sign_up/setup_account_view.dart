import 'package:blink_app/ui/sign_up/create_pin_view.dart';
import 'package:blink_app/utils/form_validator.dart';
import 'package:blink_app/widgets/app_button.dart';
import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_profile_image.dart';
import 'package:blink_app/widgets/app_spacing.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:blink_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class SetupAccountView extends StatefulWidget {
  const SetupAccountView({super.key});

  @override
  State<SetupAccountView> createState() => _SetupAccountViewState();
}

class _SetupAccountViewState extends State<SetupAccountView> {
  bool isLoading = false;
  bool isUsernameValid = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _nicknameController.dispose();
    _usernameController.dispose();
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
                  'Setup your\nAccount',
                  style: AppTextStyle.bold24
                      .copyWith(fontSize: isSmall ? 36 : 42, height: 1.2),
                ),
                Text(
                  'Let\'s get to know you better',
                  style: AppTextStyle.regular14
                      .copyWith(fontSize: isSmall ? 12 : 14, height: 1.2),
                ),
                AppSpacing.v32(),
                const Center(child: AppProfileImage()),
                AppSpacing.v40(),
                AppTextField(
                  label: 'Full Name',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: FormValidator.validateName,
                  controller: _fullnameController,
                ),
                AppSpacing.v24(),
                AppTextField(
                  label: 'Nick Name',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: FormValidator.validateName,
                  controller: _nicknameController,
                ),
                AppSpacing.v24(),
                AppTextField(
                  label: '@Username',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  suffix: isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: AppIcon(
                            icon: AppIconData.checkCircle,
                            color: isUsernameValid
                                ? AppColors.secondaryColor
                                : null,
                          ),
                        ),
                  validator: FormValidator.validateName,
                  controller: _usernameController,
                ),
                AppSpacing.v24(),
                AppButton(
                  text: 'CONTINUE',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CreatePinView(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
