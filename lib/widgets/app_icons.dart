import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.icon,
    this.sematicLabel,
    this.size = 24,
    this.color,
    this.onTap,
    this.excludeSemantics = false,
  });

  final String icon;
  final String? sematicLabel;
  final bool excludeSemantics;
  final double size;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Semantics(
        label: sematicLabel,
        excludeSemantics: excludeSemantics,
        button: onTap != null,
        child: SvgPicture.asset(
          icon,
          width: size,
          height: size,
          color: color,
          // colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}

abstract class AppIconData {
  static const _svgBase = 'assets/svgs';
  static const String back = '$_svgBase/back.svg';
  static const String google = '$_svgBase/google.svg';
  static const String facebook = '$_svgBase/facebook.svg';
  static const String apple = '$_svgBase/apple.svg';
  static const String visibilityOff = '$_svgBase/visibility_off.svg';
  static const String visibilityOn = '$_svgBase/visibility_on.svg';
  static const String edit = '$_svgBase/edit.svg';
  static const String check = '$_svgBase/check.svg';
  static const String checkCircle = '$_svgBase/check_circle.svg';
}
