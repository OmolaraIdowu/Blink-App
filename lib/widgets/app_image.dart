import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.sematicsLabel,
    this.height,
    this.radius = 5,
    this.fit,
    this.excludeSematics = false,
  });

  final String imageUrl;
  final String? sematicsLabel;
  final bool excludeSematics;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;
  bool get isAsset => imageUrl.startsWith('assets');
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: sematicsLabel,
      excludeSemantics: excludeSematics,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Builder(builder: (context) {
          if (isAsset) {
            if (imageUrl.endsWith('.svg')) {
              return Container(
                width: width,
                height: height,
                color: AppColors.grey200,
                child: Center(
                  child: AppIcon(
                    icon: imageUrl,
                  ),
                ),
              );
            }
            return Image.asset(
              imageUrl,
              width: width,
              height: height,
              fit: fit,
            );
          }
          return Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  width: width,
                  height: height,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: width,
                height: height,
                color: AppColors.grey200,
                child: const Center(
                  child: AppIcon(
                    icon: 'assets/images/profile_placeholder.png',
                    size: 32,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
