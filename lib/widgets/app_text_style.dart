import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const String fontFamily = 'Darker Grotesque';

  /// Base text style
  static const TextStyle _baseTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: AppFontWeight.regular,
    // letterSpacing: -0.3,
    color: Colors.black,
  );

  ///Darker Grotesque 14
  static TextStyle get regular14 => _baseTextStyle.copyWith(
        fontSize: 14,
      );

  ///Darker Grotesque medium 14
  static TextStyle get medium14 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.medium,
        fontSize: 14,
      );

  ///Darker Grotesque semibold 14
  static TextStyle get semibold14 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.semiBold,
        fontSize: 14,
      );

  ///Darker Grotesque bold 14
  static TextStyle get bold14 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.bold,
        fontSize: 14,
      );

  ///Darker Grotesque 16
  static TextStyle get regular16 => _baseTextStyle.copyWith(
        fontSize: 16,
      );

  ///Darker Grotesque medium 16
  static TextStyle get medium16 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.medium,
        fontSize: 16,
      );

  ///Darker Grotesque semibold 14
  static TextStyle get semibold16 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.semiBold,
        fontSize: 16,
      );

  ///Darker Grotesque bold 14
  static TextStyle get bold16 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.bold,
        fontSize: 16,
      );

  ///Darker Grotesque 24
  static TextStyle get regular24 => _baseTextStyle.copyWith(
        fontSize: 24,
      );

  ///Darker Grotesque medium 24
  static TextStyle get medium24 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.medium,
        fontSize: 24,
      );

  ///Darker Grotesque semibold 14
  static TextStyle get semibold24 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.semiBold,
        fontSize: 24,
      );

  ///Darker Grotesque bold 14
  static TextStyle get bold24 => _baseTextStyle.copyWith(
        fontWeight: AppFontWeight.bold,
        fontSize: 24,
      );
}

abstract class AppFontWeight {
  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semiBold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;
}
