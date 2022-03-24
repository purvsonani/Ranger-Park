import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';

class BottomAppbarItems extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  int selectedIndex;
  int index;

  BottomAppbarItems({
    required this.onPressed,
    required this.title,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Constants.spaceVertical(50.h),
          Image.asset(
            ImageConstants.ic_activities,
            height: 0.035.sh,
          ),
          Constants.spaceVertical(30.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 60.sp,
                color: selectedIndex == index
                    ? ColorConstants.selectedTabText
                    : ColorConstants.notSelectedTabText),
          ),
          Constants.spaceVertical(50.h),
        ],
      ),
    );
  }
}
