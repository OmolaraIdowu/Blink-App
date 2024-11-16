import 'package:flutter/material.dart';

class AppSpacing extends StatelessWidget {
  const AppSpacing({
    ///vertical space
    this.v = 0,

    ///horizontal space
    this.h = 0,
    super.key,
  });

  // horizontal
  factory AppSpacing.h12() => const AppSpacing(h: 12);
  factory AppSpacing.h32() => const AppSpacing(h: 32);

  // vertical
  factory AppSpacing.v8() => const AppSpacing(v: 8);
  factory AppSpacing.v12() => const AppSpacing(v: 12);
  factory AppSpacing.v16() => const AppSpacing(v: 16);
  factory AppSpacing.v22() => const AppSpacing(v: 22);
  factory AppSpacing.v24() => const AppSpacing(v: 24);
  factory AppSpacing.v30() => const AppSpacing(v: 30);
  factory AppSpacing.v32() => const AppSpacing(v: 32);
  factory AppSpacing.v36() => const AppSpacing(v: 36);
  factory AppSpacing.v40() => const AppSpacing(v: 40);
  factory AppSpacing.v46() => const AppSpacing(v: 46);
  factory AppSpacing.v70() => const AppSpacing(v: 70);

  final int v;
  final int h;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: v.toDouble(),
      width: h.toDouble(),
    );
  }
}
