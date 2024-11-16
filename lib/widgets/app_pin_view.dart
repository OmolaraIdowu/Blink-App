import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppPinView extends StatelessWidget {
  const AppPinView({
    super.key,
    this.isPin = false,
    this.height,
    this.width,
    this.obscureText = false,
    this.style,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.validator,
    required this.textInputAction,
    this.controller,
    this.inputDecoration,
  });

  final bool obscureText;
  final bool isPin;
  final TextStyle? style;

  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: width ?? 60,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyle.bold24,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onSaved: onSaved,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textInputAction: textInputAction,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLines: 1,
        onTap: onTap,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        obscureText: isPin ? obscureText : false,
        obscuringCharacter: '●',
        decoration: InputDecoration(
          errorStyle: AppTextStyle.regular16.copyWith(color: Colors.red),
          enabledBorder: _border(AppColors.primaryColor),
          focusedBorder: _border(AppColors.secondaryColor),
          errorBorder: _border(Colors.red),
          focusedErrorBorder: _border(Colors.redAccent),
        ),
        validator: validator,
      ),
    );
  }
}
