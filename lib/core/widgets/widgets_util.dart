import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';

class WidgetUtil {
  static startAdventureButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 140.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: ColorConstants.startAdventureButtonColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Constants.spaceHorizontal(23),
              CircleAvatar(
                backgroundImage: AssetImage(ImageConstants.ic_badge),
                radius: 20,
              ),
              Constants.spaceHorizontal(100),
              Text(
                ConstantsStrings.buttonText,
                style: TextStyle(color: ColorConstants.black, fontSize: 60.sp),
              )
            ],
          )),
    );
  }

  static Widget buildHelpFabButton(
      {bool isKeyboardOpened = false, required VoidCallback onPressed}) {
    return Visibility(
      visible: !isKeyboardOpened,
      child: Container(
        width: 200.w,
        height: 200.w,
        margin: EdgeInsets.only(bottom: 80.h, right: 0),
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(15.w),
            alignment: Alignment.center,
            child: Image.asset(ImageConstants.ic_que),
          ),
        ),
      ),
    );
  }

  static Widget oregonLogo() {
    return Image.asset(ImageConstants.ic_label_oregon_park,
        width: 0.1.sw, height: 0.05.sw);
  }
}
