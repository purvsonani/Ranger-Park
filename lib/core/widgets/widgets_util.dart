import 'package:extended_image/extended_image.dart';
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
                StringConstants.buttonText,
                style: TextStyle(color: ColorConstants.black, fontSize: 60.sp),
              )
            ],
          )),
    );
  }

  static Widget startAdventureButtonWidget(
      {required VoidCallback onPressed,
      required String btnTitle,
      required TextStyle btnTextStyle,
      required String image}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          //fixedSize: Size.fromHeight(130.h),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          onPrimary: ColorConstants.green,
          primary: ColorConstants.startAdventureButtonColor),
      child: Container(
        height: 150.w,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.network(image, height: 100.h),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(btnTitle, style: btnTextStyle),
            ),
          ],
        ),
      ),
    );
  }

  static Widget noAnswerFoundButton(
      {required VoidCallback onPressed, required String image}) {
    return Container(
      height: 0.073.sh,
      width: double.infinity,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.darkGreen,
            onPrimary: ColorConstants.darkGreen,
            shape: StadiumBorder(),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          ),
          onPressed: onPressed,
          icon: ExtendedImage.network(
            image,
            cache: true,
            height: 0.06.sh,
          ),
          label: Text(
            StringConstants.no_answer_found,
            style: TextStyle(
              color: ColorConstants.mainColor,
              fontSize: 70.sp,
            ),
          )),
    );
  }

  static parkDetailsButton(
      {required VoidCallback onTap,
      required String name,
      required String image}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 120.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorConstants.green),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Constants.spaceHorizontal(23),
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 20,
              ),
              Constants.spaceHorizontal(20),
              Text(
                name,
                style: TextStyle(color: ColorConstants.white, fontSize: 70.sp),
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
