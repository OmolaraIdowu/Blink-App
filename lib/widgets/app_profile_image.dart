import 'package:blink_app/widgets/app_colors.dart';
import 'package:blink_app/widgets/app_icons.dart';
import 'package:blink_app/widgets/app_image.dart';
import 'package:flutter/material.dart';

class AppProfileImage extends StatelessWidget {
  const AppProfileImage({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AppImage(
          sematicsLabel: 'Profile Picture',
          imageUrl: imageUrl ?? 'assets/images/profile_placeholder.png',
          radius: 15,
          width: 110,
          height: 110,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            splashColor: AppColors.primaryColor,
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: Colors.white),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.grey,
                    child: AppIcon(
                      icon: AppIconData.edit,
                      size: 20,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
