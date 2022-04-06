import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/constants/constants.dart';
import 'package:ranger_park/core/utils/color_constants.dart';
import 'package:ranger_park/core/utils/fonts_constants.dart';
import 'package:ranger_park/core/utils/image_constants.dart';
import 'package:ranger_park/core/utils/string_constants.dart';
import 'package:ranger_park/models/ranger_details.dart';
import 'package:ranger_park/models/rewards_details.dart';
import 'package:ranger_park/presentations/home_screen/tabs/rewards_tab/widgets/reward_stepper_widget.dart';

class RewardListItem extends StatelessWidget {
  final RewardsDetails? rewardsDetails;

  RewardListItem({required this.rewardsDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorConstants.rewardItemBackground,
                borderRadius: BorderRadius.circular(90.w)),
            height: 0.45.sh,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 120.w,
                  backgroundImage: NetworkImage("${rewardsDetails?.imageUrl}"),
                ),
                Constants.spaceVertical(30),
                Text(
                  "${StringConstants.rangers_reward.replaceAll("@", "${rewardsDetails?.name}")}",
                  style:
                      TextStyle(color: ColorConstants.white, fontSize: 100.sp),
                ),
                Constants.spaceVertical(30),
                _buildProgress(),
                Constants.spaceVertical(30),
                Text(
                  StringConstants.complete_5_parks
                      .replaceAll("@", "${rewardsDetails?.name}"),
                  style: TextStyle(fontSize: 45.sp, fontFamily: FONT_FRAUNCES),
                ),
                Constants.spaceVertical(100),
                _buildClaimButton()
              ],
            ),
          ),
          Positioned(
              top: 30.h,
              left: 30.w,
              child: Image.asset(
                ImageConstants.ic_gallery,
                height: 0.06.sh,
              ))
        ],
      ),
    );
  }

  Widget _buildProgress() {
    return RewardStepperWidget(
      totalSteps: 5,
      currentStep: 3,
      dotHeight: 70.w,
      dotWidth: 70.w,
      lineHeight: 13.w,
      lineWidth: 58.w,
      textColor: ColorConstants.rewardItemBackground,
      selectedDotColor: ColorConstants.yellow,
      unselectedDotColor: ColorConstants.green,
      selectedLineColor: ColorConstants.white,
      unselectedLineColor: ColorConstants.green,
    );
  }

  Widget _buildClaimButton() {
    return Container(
      height: 0.07.sh,
      width: 0.65.sw,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ColorConstants.rewardItemBackground,
          onPrimary: ColorConstants.rewardItemBackground,
          shape: StadiumBorder(),
          side: BorderSide(width: 1.5, color: ColorConstants.mainColor),
        ),
        onPressed: () {},
        child: Text(
          "10 more parks to claim*",
          style: TextStyle(color: ColorConstants.mainColor, fontSize: 60.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
