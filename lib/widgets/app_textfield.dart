import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.isPassword = false,
    this.readOnly = false,
    this.height,
    this.width,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.style,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.onPasswordToggle,
    this.validator,
    required this.textInputAction,
    required this.keyboardType,
    this.controller,
    this.maxLines,
    this.inputDecoration,
    this.textAlign,
    this.inputFormatters,
  });

  final String? label;
  final bool obscureText;
  final bool isPassword;
  final bool readOnly;

  final Widget? prefix;
  final int? maxLines;
  final TextStyle? style;

  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final VoidCallback? onPasswordToggle;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        style: style ?? AppTextStyle.regular16,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        onSaved: onSaved,
        onChanged: onChanged,
        textInputAction: textInputAction,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: isPassword ? 1 : maxLines,
        onTap: onTap,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        readOnly: readOnly,
        obscureText: isPassword ? obscureText : false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          errorStyle: AppTextStyle.regular16.copyWith(color: Colors.red),
          labelText: label,
          labelStyle: AppTextStyle.regular16,
          prefixIcon: prefix,
          suffixIcon: suffix ??
              (isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: onPasswordToggle,
                    )
                  : null),
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
