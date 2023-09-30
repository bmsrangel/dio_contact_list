import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    this.imagePath,
    this.radius = 25.0,
    this.onPressed,
  });

  final String? imagePath;
  final double radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: CircleAvatar(
            radius: radius,
            backgroundImage:
                imagePath != null ? FileImage(File(imagePath!)) : null,
            child: imagePath == null
                ? Icon(
                    Icons.person,
                    size: radius,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
