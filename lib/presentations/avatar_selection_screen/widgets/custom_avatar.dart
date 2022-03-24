import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';


class CustomAvatar extends StatelessWidget{
  final bool isSelected;
  final VoidCallback onPressed;

  CustomAvatar({required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.black.withOpacity(0.5),
            blurRadius: 3.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: isSelected ? ColorConstants.yellow : ColorConstants.avatarBackground,
          elevation: 8,
          child: InkWell(
            onTap: onPressed,
            child: Image.asset(ImageConstants.ic_def_ranger,
                width: 0.08.w,height: 0.08.h),
          ),
        ),
      ),
    );
  }
}
