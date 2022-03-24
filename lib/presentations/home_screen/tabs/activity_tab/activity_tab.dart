import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'dart:math' as math;
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/fonts_constants.dart';

class ActivityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Constants.disableKeyboard(context),
      child: Scaffold(
        body: SafeArea(child: buildBody()),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.spaceVertical(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ConstantsStrings.hello_ranger,
                  style:
                      TextStyle(color: ColorConstants.white, fontSize: 110.sp),
                ),
                Image.asset(
                  ImageConstants.ic_bear,
                  height: 0.045.sh,
                ),
              ],
            ),
            Text(
              ConstantsStrings.pick_a_park,
              style: TextStyle(color: ColorConstants.white, fontSize: 110.sp),
            ),
            Constants.spaceVertical(200),
            buildSearch(),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
                decoration: TextDecoration.none,
                color: ColorConstants.white,
                fontSize: 63.sp,
                letterSpacing: 1),
            cursorColor: ColorConstants.white,
            decoration: InputDecoration(
                prefixIcon: Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(
                      Icons.search,
                      color: ColorConstants.green,
                    )),
                suffixIcon: Container(
                    margin: EdgeInsets.only(right: 20.w, top: 5.h, bottom: 5.h),
                    child: MaterialButton(
                        minWidth: 0,
                        onPressed: () {},
                        elevation: 10,
                        shape: StadiumBorder(),
                        color: ColorConstants.suffixIconBackground,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50.w, vertical: 0),
                        child:
                            Image.asset(ImageConstants.ic_map, height: 70.w))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide: BorderSide(
                        color: ColorConstants.textFieldBorder, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                        BorderSide(color: ColorConstants.white, width: 2)),
                border: InputBorder.none,
                hintText: ConstantsStrings.search_park,
                hintStyle: TextStyle(
                    color: ColorConstants.textFieldBorder, fontSize: 60.sp),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 100.w, vertical: 35.h)),
          ),
          Constants.spaceVertical(25),
          Text(
            ConstantsStrings.complete_park_for_prize,
            style: TextStyle(
              fontFamily: FONT_FRAUNCES,
            ),
          )
        ],
      ),
    );
  }
}
